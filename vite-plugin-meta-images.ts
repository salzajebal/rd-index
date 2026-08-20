import type { Plugin } from 'vite';
import fs from 'fs';
import path from 'path';

/**
 * Vite plugin that updates og:image and twitter:image meta tags
 * to point to the app's opengraph image with the correct domain.
 */
export function metaImagesPlugin(): Plugin {
  return {
    name: 'vite-plugin-meta-images',
    transformIndexHtml(html) {
      const publicDir = path.resolve(process.cwd(), 'client', 'public');

      // Preferred image filenames in order
      const candidates = ['vora-social.png'];
      let imageFile: string | null = null;
      for (const candidate of candidates) {
        if (fs.existsSync(path.join(publicDir, candidate))) {
          imageFile = candidate;
          break;
        }
      }

      if (!imageFile) {
        log('[meta-images] No OG image found, skipping meta tag updates');
        return html;
      }

      const baseUrl = getDeploymentUrl();

      if (!baseUrl) {
        log('[meta-images] No domain found, skipping meta tag updates');
        return html;
      }

      const imageUrl = `${baseUrl}/${imageFile}`;
      log('[meta-images] updating meta image tags to:', imageUrl);

      html = html.replace(
        /<meta\s+property="og:image"\s+content="[^"]*"\s*\/>/g,
        `<meta property="og:image" content="${imageUrl}" />`
      );

      html = html.replace(
        /<meta\s+name="twitter:image"\s+content="[^"]*"\s*\/>/g,
        `<meta name="twitter:image" content="${imageUrl}" />`
      );

      return html;
    },
  };
}

function getDeploymentUrl(): string | null {
  if (process.env.REPLIT_INTERNAL_APP_DOMAIN) {
    const url = `https://${process.env.REPLIT_INTERNAL_APP_DOMAIN}`;
    log('[meta-images] using internal app domain:', url);
    return url;
  }

  if (process.env.REPLIT_DEV_DOMAIN) {
    const url = `https://${process.env.REPLIT_DEV_DOMAIN}`;
    log('[meta-images] using dev domain:', url);
    return url;
  }

  return null;
}

function log(...args: any[]): void {
  console.log(...args);
}
