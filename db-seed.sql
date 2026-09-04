--
-- PostgreSQL database dump
--

\restrict g6fKiAfGRfIzb3NG8KMWwBBzyjvUtpkY9aJoWGAdsHSG2uIqjs0vc9e4c9TvkCs

-- Dumped from database version 16.10
-- Dumped by pg_dump version 16.10

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

ALTER TABLE IF EXISTS ONLY public.transaction_requests DROP CONSTRAINT IF EXISTS transaction_requests_user_id_fkey;
ALTER TABLE IF EXISTS ONLY public.messages DROP CONSTRAINT IF EXISTS messages_sender_id_fkey;
ALTER TABLE IF EXISTS ONLY public.messages DROP CONSTRAINT IF EXISTS messages_receiver_id_fkey;
ALTER TABLE IF EXISTS ONLY public.login_history DROP CONSTRAINT IF EXISTS login_history_user_id_fkey;
ALTER TABLE IF EXISTS ONLY public.inquiries DROP CONSTRAINT IF EXISTS inquiries_user_id_fkey;
ALTER TABLE IF EXISTS ONLY public.bets DROP CONSTRAINT IF EXISTS bets_user_id_fkey;
DROP INDEX IF EXISTS public."IDX_user_sessions_expire";
ALTER TABLE IF EXISTS ONLY public.users DROP CONSTRAINT IF EXISTS users_username_key;
ALTER TABLE IF EXISTS ONLY public.users DROP CONSTRAINT IF EXISTS users_pkey;
ALTER TABLE IF EXISTS ONLY public.user_sessions DROP CONSTRAINT IF EXISTS user_sessions_pkey;
ALTER TABLE IF EXISTS ONLY public.transaction_requests DROP CONSTRAINT IF EXISTS transaction_requests_pkey;
ALTER TABLE IF EXISTS ONLY public.settings DROP CONSTRAINT IF EXISTS settings_pkey;
ALTER TABLE IF EXISTS ONLY public.round_results DROP CONSTRAINT IF EXISTS round_results_pkey;
ALTER TABLE IF EXISTS ONLY public.round_forced_directions DROP CONSTRAINT IF EXISTS round_forced_directions_pkey;
ALTER TABLE IF EXISTS ONLY public.messages DROP CONSTRAINT IF EXISTS messages_pkey;
ALTER TABLE IF EXISTS ONLY public.maintenance_symbols DROP CONSTRAINT IF EXISTS maintenance_symbols_symbol_key;
ALTER TABLE IF EXISTS ONLY public.maintenance_symbols DROP CONSTRAINT IF EXISTS maintenance_symbols_pkey;
ALTER TABLE IF EXISTS ONLY public.login_history DROP CONSTRAINT IF EXISTS login_history_pkey;
ALTER TABLE IF EXISTS ONLY public.inquiry_templates DROP CONSTRAINT IF EXISTS inquiry_templates_pkey;
ALTER TABLE IF EXISTS ONLY public.inquiries DROP CONSTRAINT IF EXISTS inquiries_pkey;
ALTER TABLE IF EXISTS ONLY public.forex_candles DROP CONSTRAINT IF EXISTS forex_candles_symbol_duration_time_key;
ALTER TABLE IF EXISTS ONLY public.forex_candles DROP CONSTRAINT IF EXISTS forex_candles_pkey;
ALTER TABLE IF EXISTS ONLY public.branches DROP CONSTRAINT IF EXISTS branches_pkey;
ALTER TABLE IF EXISTS ONLY public.branches DROP CONSTRAINT IF EXISTS branches_code_key;
ALTER TABLE IF EXISTS ONLY public.blocked_ips DROP CONSTRAINT IF EXISTS blocked_ips_pkey;
ALTER TABLE IF EXISTS ONLY public.blocked_ips DROP CONSTRAINT IF EXISTS blocked_ips_ip_address_key;
ALTER TABLE IF EXISTS ONLY public.bets DROP CONSTRAINT IF EXISTS bets_pkey;
ALTER TABLE IF EXISTS ONLY public.announcements DROP CONSTRAINT IF EXISTS announcements_pkey;
ALTER TABLE IF EXISTS ONLY public.affiliates DROP CONSTRAINT IF EXISTS affiliates_username_key;
ALTER TABLE IF EXISTS ONLY public.affiliates DROP CONSTRAINT IF EXISTS affiliates_referral_code_key;
ALTER TABLE IF EXISTS ONLY public.affiliates DROP CONSTRAINT IF EXISTS affiliates_pkey;
ALTER TABLE IF EXISTS ONLY public.affiliate_settlements DROP CONSTRAINT IF EXISTS affiliate_settlements_pkey;
ALTER TABLE IF EXISTS ONLY public.affiliate_commissions DROP CONSTRAINT IF EXISTS affiliate_commissions_pkey;
ALTER TABLE IF EXISTS public.transaction_requests ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.round_results ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.round_forced_directions ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.messages ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.maintenance_symbols ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.login_history ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.inquiry_templates ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.inquiries ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.forex_candles ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.branches ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.blocked_ips ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.bets ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.announcements ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.affiliate_settlements ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.affiliate_commissions ALTER COLUMN id DROP DEFAULT;
DROP TABLE IF EXISTS public.users;
DROP TABLE IF EXISTS public.user_sessions;
DROP SEQUENCE IF EXISTS public.transaction_requests_id_seq;
DROP TABLE IF EXISTS public.transaction_requests;
DROP TABLE IF EXISTS public.settings;
DROP SEQUENCE IF EXISTS public.round_results_id_seq;
DROP TABLE IF EXISTS public.round_results;
DROP SEQUENCE IF EXISTS public.round_forced_directions_id_seq;
DROP TABLE IF EXISTS public.round_forced_directions;
DROP SEQUENCE IF EXISTS public.messages_id_seq;
DROP TABLE IF EXISTS public.messages;
DROP SEQUENCE IF EXISTS public.maintenance_symbols_id_seq;
DROP TABLE IF EXISTS public.maintenance_symbols;
DROP SEQUENCE IF EXISTS public.login_history_id_seq;
DROP TABLE IF EXISTS public.login_history;
DROP SEQUENCE IF EXISTS public.inquiry_templates_id_seq;
DROP TABLE IF EXISTS public.inquiry_templates;
DROP SEQUENCE IF EXISTS public.inquiries_id_seq;
DROP TABLE IF EXISTS public.inquiries;
DROP SEQUENCE IF EXISTS public.forex_candles_id_seq;
DROP TABLE IF EXISTS public.forex_candles;
DROP SEQUENCE IF EXISTS public.branches_id_seq;
DROP TABLE IF EXISTS public.branches;
DROP SEQUENCE IF EXISTS public.blocked_ips_id_seq;
DROP TABLE IF EXISTS public.blocked_ips;
DROP SEQUENCE IF EXISTS public.bets_id_seq;
DROP TABLE IF EXISTS public.bets;
DROP SEQUENCE IF EXISTS public.announcements_id_seq;
DROP TABLE IF EXISTS public.announcements;
DROP TABLE IF EXISTS public.affiliates;
DROP SEQUENCE IF EXISTS public.affiliate_settlements_id_seq;
DROP TABLE IF EXISTS public.affiliate_settlements;
DROP SEQUENCE IF EXISTS public.affiliate_commissions_id_seq;
DROP TABLE IF EXISTS public.affiliate_commissions;
SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: affiliate_commissions; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.affiliate_commissions (
    id integer NOT NULL,
    affiliate_id character varying NOT NULL,
    user_id character varying NOT NULL,
    bet_id integer NOT NULL,
    bet_amount numeric(20,0) NOT NULL,
    commission_amount numeric(20,0) NOT NULL,
    status text DEFAULT 'pending'::text NOT NULL,
    created_at timestamp without time zone DEFAULT now() NOT NULL,
    settled_at timestamp without time zone
);


--
-- Name: affiliate_commissions_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.affiliate_commissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: affiliate_commissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.affiliate_commissions_id_seq OWNED BY public.affiliate_commissions.id;


--
-- Name: affiliate_settlements; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.affiliate_settlements (
    id integer NOT NULL,
    affiliate_id character varying NOT NULL,
    amount numeric(20,0) NOT NULL,
    memo text,
    settled_by character varying NOT NULL,
    created_at timestamp without time zone DEFAULT now() NOT NULL
);


--
-- Name: affiliate_settlements_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.affiliate_settlements_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: affiliate_settlements_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.affiliate_settlements_id_seq OWNED BY public.affiliate_settlements.id;


--
-- Name: affiliates; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.affiliates (
    id character varying DEFAULT gen_random_uuid() NOT NULL,
    username text NOT NULL,
    password text NOT NULL,
    display_name text NOT NULL,
    phone text,
    referral_code text NOT NULL,
    commission_rate numeric(5,2) DEFAULT 5.00 NOT NULL,
    total_commission numeric(20,0) DEFAULT '0'::numeric NOT NULL,
    pending_commission numeric(20,0) DEFAULT '0'::numeric NOT NULL,
    is_active boolean DEFAULT true NOT NULL,
    created_at timestamp without time zone DEFAULT now() NOT NULL
);


--
-- Name: announcements; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.announcements (
    id integer NOT NULL,
    title text NOT NULL,
    content text NOT NULL,
    is_active boolean DEFAULT true NOT NULL,
    is_pinned boolean DEFAULT false NOT NULL,
    display_date timestamp without time zone DEFAULT now() NOT NULL,
    created_at timestamp without time zone DEFAULT now() NOT NULL,
    updated_at timestamp without time zone DEFAULT now() NOT NULL
);


--
-- Name: announcements_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.announcements_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: announcements_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.announcements_id_seq OWNED BY public.announcements.id;


--
-- Name: bets; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.bets (
    id integer NOT NULL,
    user_id character varying NOT NULL,
    symbol text NOT NULL,
    direction text NOT NULL,
    amount numeric(20,8) NOT NULL,
    duration integer NOT NULL,
    strike_price numeric(20,8) NOT NULL,
    close_price numeric(20,8),
    payout numeric(20,8),
    multiplier numeric(5,2) DEFAULT 2.00 NOT NULL,
    outcome text DEFAULT 'pending'::text NOT NULL,
    expires_at timestamp without time zone NOT NULL,
    created_at timestamp without time zone DEFAULT now() NOT NULL,
    settled_at timestamp without time zone,
    round_number integer DEFAULT 1 NOT NULL,
    forced_outcome text,
    max_execution_applied boolean DEFAULT false NOT NULL,
    original_amount numeric(20,8),
    balance_before numeric(20,8),
    balance_after numeric(20,8)
);


--
-- Name: bets_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.bets_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: bets_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.bets_id_seq OWNED BY public.bets.id;


--
-- Name: blocked_ips; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.blocked_ips (
    id integer NOT NULL,
    ip_address text NOT NULL,
    reason text,
    blocked_by character varying NOT NULL,
    created_at timestamp without time zone DEFAULT now() NOT NULL
);


--
-- Name: blocked_ips_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.blocked_ips_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: blocked_ips_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.blocked_ips_id_seq OWNED BY public.blocked_ips.id;


--
-- Name: branches; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.branches (
    id integer NOT NULL,
    code text NOT NULL,
    name text NOT NULL,
    is_active boolean DEFAULT true NOT NULL,
    created_at timestamp without time zone DEFAULT now() NOT NULL
);


--
-- Name: branches_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.branches_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: branches_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.branches_id_seq OWNED BY public.branches.id;


--
-- Name: forex_candles; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.forex_candles (
    id integer NOT NULL,
    symbol text NOT NULL,
    duration integer NOT NULL,
    "time" integer NOT NULL,
    open numeric(15,6) NOT NULL,
    high numeric(15,6) NOT NULL,
    low numeric(15,6) NOT NULL,
    close numeric(15,6) NOT NULL
);


--
-- Name: forex_candles_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.forex_candles_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: forex_candles_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.forex_candles_id_seq OWNED BY public.forex_candles.id;


--
-- Name: inquiries; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.inquiries (
    id integer NOT NULL,
    user_id character varying NOT NULL,
    title text NOT NULL,
    content text NOT NULL,
    reply text,
    status text DEFAULT 'pending'::text NOT NULL,
    replied_by character varying,
    replied_at timestamp without time zone,
    is_reply_read boolean DEFAULT false NOT NULL,
    created_at timestamp without time zone DEFAULT now() NOT NULL
);


--
-- Name: inquiries_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.inquiries_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: inquiries_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.inquiries_id_seq OWNED BY public.inquiries.id;


--
-- Name: inquiry_templates; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.inquiry_templates (
    id integer NOT NULL,
    title text NOT NULL,
    content text NOT NULL,
    created_at timestamp without time zone DEFAULT now() NOT NULL
);


--
-- Name: inquiry_templates_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.inquiry_templates_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: inquiry_templates_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.inquiry_templates_id_seq OWNED BY public.inquiry_templates.id;


--
-- Name: login_history; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.login_history (
    id integer NOT NULL,
    user_id character varying NOT NULL,
    username text NOT NULL,
    ip text NOT NULL,
    user_agent text,
    login_at timestamp without time zone DEFAULT now() NOT NULL
);


--
-- Name: login_history_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.login_history_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: login_history_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.login_history_id_seq OWNED BY public.login_history.id;


--
-- Name: maintenance_symbols; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.maintenance_symbols (
    id integer NOT NULL,
    symbol text NOT NULL,
    reason text,
    started_at timestamp without time zone DEFAULT now() NOT NULL,
    created_by character varying NOT NULL
);


--
-- Name: maintenance_symbols_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.maintenance_symbols_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: maintenance_symbols_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.maintenance_symbols_id_seq OWNED BY public.maintenance_symbols.id;


--
-- Name: messages; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.messages (
    id integer NOT NULL,
    sender_id character varying NOT NULL,
    receiver_id character varying NOT NULL,
    title text NOT NULL,
    content text NOT NULL,
    is_read boolean DEFAULT false NOT NULL,
    created_at timestamp without time zone DEFAULT now() NOT NULL,
    deleted_for_user boolean DEFAULT false NOT NULL
);


--
-- Name: messages_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.messages_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: messages_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.messages_id_seq OWNED BY public.messages.id;


--
-- Name: round_forced_directions; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.round_forced_directions (
    id integer NOT NULL,
    symbol text NOT NULL,
    duration integer NOT NULL,
    round_number integer NOT NULL,
    forced_direction text NOT NULL,
    date_key text NOT NULL,
    created_at timestamp without time zone DEFAULT now() NOT NULL
);


--
-- Name: round_forced_directions_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.round_forced_directions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: round_forced_directions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.round_forced_directions_id_seq OWNED BY public.round_forced_directions.id;


--
-- Name: round_results; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.round_results (
    id integer NOT NULL,
    symbol text NOT NULL,
    duration integer NOT NULL,
    round_number integer NOT NULL,
    round_date text NOT NULL,
    open_price numeric(20,8) NOT NULL,
    close_price numeric(20,8) NOT NULL,
    high_price numeric(20,8) NOT NULL,
    low_price numeric(20,8) NOT NULL,
    direction text NOT NULL,
    created_at timestamp without time zone DEFAULT now() NOT NULL
);


--
-- Name: round_results_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.round_results_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: round_results_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.round_results_id_seq OWNED BY public.round_results.id;


--
-- Name: settings; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.settings (
    key text NOT NULL,
    value text NOT NULL,
    updated_at timestamp without time zone DEFAULT now() NOT NULL
);


--
-- Name: transaction_requests; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.transaction_requests (
    id integer NOT NULL,
    user_id character varying NOT NULL,
    type text NOT NULL,
    amount numeric(20,0) NOT NULL,
    status text DEFAULT 'pending'::text NOT NULL,
    bank_name text,
    account_holder text,
    account_number text,
    sender_name text,
    admin_note text,
    processed_by character varying,
    processed_at timestamp without time zone,
    created_at timestamp without time zone DEFAULT now() NOT NULL
);


--
-- Name: transaction_requests_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.transaction_requests_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: transaction_requests_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.transaction_requests_id_seq OWNED BY public.transaction_requests.id;


--
-- Name: user_sessions; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.user_sessions (
    sid character varying NOT NULL,
    sess json NOT NULL,
    expire timestamp(6) without time zone NOT NULL
);


--
-- Name: users; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.users (
    id character varying DEFAULT gen_random_uuid() NOT NULL,
    username text NOT NULL,
    password text NOT NULL,
    name text,
    phone text,
    bank_name text,
    account_holder text,
    account_number text,
    balance numeric(20,0) DEFAULT '0'::numeric NOT NULL,
    total_deposit numeric(20,0) DEFAULT '0'::numeric NOT NULL,
    total_withdrawal numeric(20,0) DEFAULT '0'::numeric NOT NULL,
    total_bet numeric(20,0) DEFAULT '0'::numeric NOT NULL,
    total_win numeric(20,0) DEFAULT '0'::numeric NOT NULL,
    role text DEFAULT 'user'::text NOT NULL,
    grade text DEFAULT '브론즈'::text NOT NULL,
    is_active boolean DEFAULT true NOT NULL,
    last_login_at timestamp without time zone,
    created_at timestamp without time zone DEFAULT now() NOT NULL,
    approval_status text DEFAULT 'pending'::text NOT NULL,
    birth_date text,
    resident_number text,
    region text,
    branch_code text,
    affiliate_id character varying,
    last_login_ip text,
    auto_bet_enabled boolean DEFAULT false NOT NULL,
    auto_bet_multiplier real DEFAULT 10 NOT NULL,
    is_betting_blocked boolean DEFAULT false NOT NULL,
    forced_bet_direction text,
    max_execution_enabled boolean DEFAULT true NOT NULL,
    pending_balance_adjustment numeric(20,0) DEFAULT '0'::numeric NOT NULL,
    always_pending_enabled boolean DEFAULT false NOT NULL,
    telegram_notify_enabled boolean DEFAULT false NOT NULL
);


--
-- Name: affiliate_commissions id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.affiliate_commissions ALTER COLUMN id SET DEFAULT nextval('public.affiliate_commissions_id_seq'::regclass);


--
-- Name: affiliate_settlements id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.affiliate_settlements ALTER COLUMN id SET DEFAULT nextval('public.affiliate_settlements_id_seq'::regclass);


--
-- Name: announcements id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.announcements ALTER COLUMN id SET DEFAULT nextval('public.announcements_id_seq'::regclass);


--
-- Name: bets id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.bets ALTER COLUMN id SET DEFAULT nextval('public.bets_id_seq'::regclass);


--
-- Name: blocked_ips id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.blocked_ips ALTER COLUMN id SET DEFAULT nextval('public.blocked_ips_id_seq'::regclass);


--
-- Name: branches id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.branches ALTER COLUMN id SET DEFAULT nextval('public.branches_id_seq'::regclass);


--
-- Name: forex_candles id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.forex_candles ALTER COLUMN id SET DEFAULT nextval('public.forex_candles_id_seq'::regclass);


--
-- Name: inquiries id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.inquiries ALTER COLUMN id SET DEFAULT nextval('public.inquiries_id_seq'::regclass);


--
-- Name: inquiry_templates id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.inquiry_templates ALTER COLUMN id SET DEFAULT nextval('public.inquiry_templates_id_seq'::regclass);


--
-- Name: login_history id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.login_history ALTER COLUMN id SET DEFAULT nextval('public.login_history_id_seq'::regclass);


--
-- Name: maintenance_symbols id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.maintenance_symbols ALTER COLUMN id SET DEFAULT nextval('public.maintenance_symbols_id_seq'::regclass);


--
-- Name: messages id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.messages ALTER COLUMN id SET DEFAULT nextval('public.messages_id_seq'::regclass);


--
-- Name: round_forced_directions id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.round_forced_directions ALTER COLUMN id SET DEFAULT nextval('public.round_forced_directions_id_seq'::regclass);


--
-- Name: round_results id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.round_results ALTER COLUMN id SET DEFAULT nextval('public.round_results_id_seq'::regclass);


--
-- Name: transaction_requests id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.transaction_requests ALTER COLUMN id SET DEFAULT nextval('public.transaction_requests_id_seq'::regclass);


--
-- Data for Name: affiliate_commissions; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.affiliate_commissions (id, affiliate_id, user_id, bet_id, bet_amount, commission_amount, status, created_at, settled_at) FROM stdin;
\.


--
-- Data for Name: affiliate_settlements; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.affiliate_settlements (id, affiliate_id, amount, memo, settled_by, created_at) FROM stdin;
\.


--
-- Data for Name: affiliates; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.affiliates (id, username, password, display_name, phone, referral_code, commission_rate, total_commission, pending_commission, is_active, created_at) FROM stdin;
a66b1799-fc71-460a-9e8a-c3ab4d7bd31d	testaffiliate	test1234	테스트총판	\N	TEST01	5.00	0	0	t	2026-07-01 06:28:49.310898
877fbaaa-35aa-4dc8-a141-2b7d2acc2cbf	aaaaa	aaaaa	aaaaa	\N	26LV3FRZ	5.00	0	0	t	2026-07-15 07:23:09.298535
\.


--
-- Data for Name: announcements; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.announcements (id, title, content, is_active, is_pinned, display_date, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: bets; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.bets (id, user_id, symbol, direction, amount, duration, strike_price, close_price, payout, multiplier, outcome, expires_at, created_at, settled_at, round_number, forced_outcome, max_execution_applied, original_amount, balance_before, balance_after) FROM stdin;
24	74852c63-bd9c-4a75-b98a-14f2ad7393c7	SP500	short	50000.00000000	300	7543.64000000	7536.09636000	97500.00000000	1.95	win	2026-07-10 04:35:00.961	2026-07-10 04:31:25.974097	2026-07-10 04:35:06.931	163	\N	f	\N	5000000.00000000	5047500.00000000
30	74852c63-bd9c-4a75-b98a-14f2ad7393c7	SP500	short	150000.00000000	300	7575.17108791	7582.74625900	0.00000000	1.95	lose	2026-07-13 01:35:00.748	2026-07-13 01:30:34.758444	2026-07-13 01:35:07.327	127	\N	f	\N	5285000.00000000	5135000.00000000
28	74852c63-bd9c-4a75-b98a-14f2ad7393c7	SP500	long	250000.00000000	300	7543.87467078	7551.41854545	487500.00000000	1.95	win	2026-07-10 07:05:00.656	2026-07-10 07:03:43.666977	2026-07-10 07:05:06.674	193	\N	f	\N	5047500.00000000	5285000.00000000
29	b5c20bc7-20be-4e6c-8d1c-0cff218f1df8	SP500	long	200000.00000000	300	7543.44208445	7550.98552653	390000.00000000	1.95	win	2026-07-10 09:00:00.449	2026-07-10 08:58:59.458534	2026-07-10 09:00:05.901	216	\N	f	\N	5000000.00000000	5190000.00000000
33	74852c63-bd9c-4a75-b98a-14f2ad7393c7	SP500	long	5000000.00000000	300	7575.39000000	7567.81461000	0.00000000	1.95	lose	2026-07-13 01:40:00.064	2026-07-13 01:38:04.074563	2026-07-13 01:40:05.359	128	\N	f	\N	5135000.00000000	135000.00000000
34	74852c63-bd9c-4a75-b98a-14f2ad7393c7	SP500	long	130000.00000000	300	7574.94106306	7582.51600412	253500.00000000	1.95	win	2026-07-13 01:45:00.597	2026-07-13 01:43:09.607866	2026-07-13 01:45:07.418	129	\N	f	\N	135000.00000000	258500.00000000
38	74852c63-bd9c-4a75-b98a-14f2ad7393c7	SP500	short	900000.00000000	300	7576.12709471	7568.55096762	1755000.00000000	1.95	win	2026-07-13 05:05:00.097	2026-07-13 05:01:10.109522	2026-07-13 05:05:06.252	169	\N	f	\N	10258500.00000000	11113500.00000000
39	74852c63-bd9c-4a75-b98a-14f2ad7393c7	SP500	short	900000.00000000	300	7575.63011878	7568.05448866	1755000.00000000	1.95	win	2026-07-13 05:10:00.49	2026-07-13 05:07:04.50004	2026-07-13 05:10:06.277	170	\N	f	\N	11113500.00000000	11968500.00000000
40	74852c63-bd9c-4a75-b98a-14f2ad7393c7	SP500	short	250000.00000000	300	7575.54098139	7567.96544041	487500.00000000	1.95	win	2026-07-13 07:05:00.357	2026-07-13 07:00:49.371118	2026-07-13 07:05:06.158	193	\N	f	\N	11968500.00000000	12206000.00000000
41	b5c20bc7-20be-4e6c-8d1c-0cff218f1df8	SP500	long	5000000.00000000	300	7575.07709031	7567.50201322	0.00000000	1.95	lose	2026-07-13 07:05:00.487	2026-07-13 07:01:09.498034	2026-07-13 07:05:06.19	193	\N	f	\N	5000000.00000000	0.00000000
43	74852c63-bd9c-4a75-b98a-14f2ad7393c7	SP500	short	250000.00000000	300	7515.60692091	7508.09131399	487500.00000000	1.95	win	2026-07-14 01:35:00.217	2026-07-14 01:30:49.227424	2026-07-14 01:35:06.804	127	\N	f	\N	12206000.00000000	12443500.00000000
44	74852c63-bd9c-4a75-b98a-14f2ad7393c7	SP500	short	800000.00000000	300	7515.25306780	7507.73781473	1560000.00000000	1.95	win	2026-07-14 04:35:00.129	2026-07-14 04:31:37.138614	2026-07-14 04:35:07.111	163	\N	f	\N	12443500.00000000	13203500.00000000
58	a37c84ff-be4e-48d9-ae99-1f6823d793ea	SP500	long	100000.00000000	300	7543.17806092	7543.91741107	195000.00000000	1.95	win	2026-07-15 08:00:00.711	2026-07-15 07:58:09.721454	2026-07-15 08:00:06.006	204	\N	f	\N	3070000.00000000	3165000.00000000
47	74852c63-bd9c-4a75-b98a-14f2ad7393c7	SP500	short	1000000.00000000	300	7516.16190620	7508.64574429	1950000.00000000	1.95	win	2026-07-14 04:40:00.113	2026-07-14 04:38:45.12553	2026-07-14 04:40:05.139	164	\N	f	\N	13203500.00000000	14153500.00000000
59	a37c84ff-be4e-48d9-ae99-1f6823d793ea	SP500	long	10000.00000000	300	7543.24455629	7543.30987182	19500.00000000	1.95	win	2026-07-15 09:15:00.226	2026-07-15 09:13:37.234755	2026-07-15 09:15:05.414	219	\N	f	\N	3000000.00000000	3009500.00000000
49	74852c63-bd9c-4a75-b98a-14f2ad7393c7	SP500	short	250000.00000000	300	7516.24934673	7508.73309738	487500.00000000	1.95	win	2026-07-14 07:05:00.65	2026-07-14 07:02:50.661324	2026-07-14 07:05:07.29	193	\N	f	\N	14153500.00000000	14391000.00000000
51	74852c63-bd9c-4a75-b98a-14f2ad7393c7	SP500	short	1200000.00000000	300	7543.17197300	7535.62880103	2340000.00000000	1.95	win	2026-07-15 04:05:00.951	2026-07-15 04:01:57.962814	2026-07-15 04:05:06.69	157	\N	f	\N	14391000.00000000	15531000.00000000
60	a37c84ff-be4e-48d9-ae99-1f6823d793ea	SP500	long	10000.00000000	300	7543.42011055	7545.07885434	19500.00000000	1.95	win	2026-07-15 11:40:00.31	2026-07-15 11:38:54.319224	2026-07-15 11:40:05.845	248	\N	f	\N	3009500.00000000	3019000.00000000
52	74852c63-bd9c-4a75-b98a-14f2ad7393c7	SP500	short	1300000.00000000	300	7543.59000000	7536.04641000	2535000.00000000	1.95	win	2026-07-15 04:10:00.243	2026-07-15 04:06:02.253022	2026-07-15 04:10:05.844	158	\N	f	\N	15531000.00000000	16766000.00000000
61	a37c84ff-be4e-48d9-ae99-1f6823d793ea	SP500	short	10000.00000000	300	7544.05613745	7543.13314641	19500.00000000	1.95	win	2026-07-15 13:30:00.373	2026-07-15 13:28:59.383473	2026-07-15 13:30:05.706	270	\N	f	\N	3019000.00000000	3028500.00000000
55	74852c63-bd9c-4a75-b98a-14f2ad7393c7	SP500	short	300000.00000000	300	7544.51522335	7536.97070813	585000.00000000	1.95	win	2026-07-15 07:05:00.948	2026-07-15 07:00:32.962177	2026-07-15 07:05:07.436	193	\N	f	\N	16766000.00000000	17051000.00000000
56	a37c84ff-be4e-48d9-ae99-1f6823d793ea	SP500	short	500000.00000000	300	7542.60515954	7550.14776470	0.00000000	1.95	lose	2026-07-15 07:30:00.796	2026-07-15 07:27:01.807457	2026-07-15 07:30:06.328	198	\N	f	\N	3000000.00000000	2500000.00000000
57	a37c84ff-be4e-48d9-ae99-1f6823d793ea	SP500	short	600000.00000000	300	7542.87217383	7535.32930166	1170000.00000000	1.95	win	2026-07-15 07:35:00.169	2026-07-15 07:31:55.17847	2026-07-15 07:35:06.366	199	\N	f	\N	2500000.00000000	3070000.00000000
62	a37c84ff-be4e-48d9-ae99-1f6823d793ea	SP500	long	50000.00000000	300	7573.20757802	7572.80807069	0.00000000	1.95	lose	2026-07-15 13:35:00.345	2026-07-15 13:33:51.355347	2026-07-15 13:35:05.768	271	\N	f	\N	3028500.00000000	2978500.00000000
68	a37c84ff-be4e-48d9-ae99-1f6823d793ea	SP500	short	100000.00000000	300	7572.00009975	7564.42809965	195000.00000000	1.95	win	2026-07-16 01:40:00.406	2026-07-16 01:39:02.414578	2026-07-16 01:40:05.99	128	\N	f	\N	2948500.00000000	3043500.00000000
63	a37c84ff-be4e-48d9-ae99-1f6823d793ea	SP500	short	20000.00000000	300	7570.86704296	7571.04044404	0.00000000	1.95	lose	2026-07-15 13:45:00.571	2026-07-15 13:43:23.70758	2026-07-15 13:45:05.862	273	\N	f	\N	2978500.00000000	2958500.00000000
64	a37c84ff-be4e-48d9-ae99-1f6823d793ea	SP500	long	10000.00000000	300	7573.49314692	7572.84202151	0.00000000	1.95	lose	2026-07-15 14:05:00.33	2026-07-15 14:03:07.341626	2026-07-15 14:05:06.138	277	\N	f	\N	2958500.00000000	2948500.00000000
69	74852c63-bd9c-4a75-b98a-14f2ad7393c7	DXY	short	1500000.00000000	300	100.51000000	100.50036174	2925000.00000000	1.95	win	2026-07-16 04:10:00.357	2026-07-16 04:06:17.368113	2026-07-16 04:10:06.566	158	\N	f	\N	16801000.00000000	18226000.00000000
65	74852c63-bd9c-4a75-b98a-14f2ad7393c7	SP500	long	250000.00000000	300	7571.21124502	7563.64003377	0.00000000	1.95	lose	2026-07-16 01:35:00.951	2026-07-16 01:30:38.96152	2026-07-16 01:35:07.918	127	\N	f	\N	17051000.00000000	16801000.00000000
70	74852c63-bd9c-4a75-b98a-14f2ad7393c7	DXY	short	2500000.00000000	300	100.50364868	100.51222941	0.00000000	1.95	lose	2026-07-16 04:15:00.529	2026-07-16 04:11:21.540592	2026-07-16 04:15:10.167	159	\N	f	\N	18226000.00000000	15726000.00000000
71	74852c63-bd9c-4a75-b98a-14f2ad7393c7	DXY	short	4000000.00000000	300	100.52141486	100.51914014	7800000.00000000	1.95	win	2026-07-16 04:35:00.111	2026-07-16 04:31:51.120414	2026-07-16 04:35:06.596	163	\N	f	\N	15726000.00000000	19526000.00000000
74	a37c84ff-be4e-48d9-ae99-1f6823d793ea	SP500	long	10000.00000000	300	7573.26192468	7572.25847752	0.00000000	1.95	lose	2026-07-16 06:50:00.684	2026-07-16 06:48:57.69612	2026-07-16 06:50:05.737	190	\N	f	\N	3043500.00000000	3033500.00000000
79	a37c84ff-be4e-48d9-ae99-1f6823d793ea	SP500	long	10000.00000000	300	7572.28778520	7572.22064977	0.00000000	1.95	lose	2026-07-16 12:20:00.933	2026-07-16 12:18:54.941723	2026-07-16 12:20:07.331	256	\N	f	\N	3108500.00000000	3098500.00000000
75	a37c84ff-be4e-48d9-ae99-1f6823d793ea	SP500	long	20000.00000000	300	7572.63881585	7572.35767681	0.00000000	1.95	lose	2026-07-16 06:55:00.389	2026-07-16 06:53:19.399535	2026-07-16 06:55:05.779	191	\N	f	\N	3033500.00000000	3013500.00000000
78	74852c63-bd9c-4a75-b98a-14f2ad7393c7	SP500	long	250000.00000000	300	7571.69319572	7579.26488892	487500.00000000	1.95	win	2026-07-16 07:05:00.358	2026-07-16 07:01:30.371696	2026-07-16 07:05:05.968	193	\N	f	\N	19526000.00000000	19763500.00000000
77	a37c84ff-be4e-48d9-ae99-1f6823d793ea	SP500	long	100000.00000000	300	7572.23753401	7579.80977154	195000.00000000	1.95	win	2026-07-16 07:05:00.783	2026-07-16 07:01:06.791849	2026-07-16 07:05:05.931	193	\N	f	\N	3013500.00000000	3108500.00000000
80	a37c84ff-be4e-48d9-ae99-1f6823d793ea	SP500	short	20000.00000000	300	7572.49139199	7572.57977596	0.00000000	1.95	lose	2026-07-16 12:25:00.911	2026-07-16 12:21:26.918706	2026-07-16 12:25:07.43	257	\N	f	\N	3098500.00000000	3078500.00000000
81	a37c84ff-be4e-48d9-ae99-1f6823d793ea	SP500	long	30000.00000000	300	7572.43757050	7572.35506378	0.00000000	1.95	lose	2026-07-16 12:35:00.374	2026-07-16 12:33:59.384801	2026-07-16 12:35:05.625	259	\N	f	\N	3078500.00000000	3048500.00000000
82	a37c84ff-be4e-48d9-ae99-1f6823d793ea	SP500	long	40000.00000000	300	7573.10980707	7572.23051503	0.00000000	1.95	lose	2026-07-16 12:40:00.143	2026-07-16 12:38:30.152048	2026-07-16 12:40:05.727	260	\N	f	\N	3048500.00000000	3008500.00000000
83	a37c84ff-be4e-48d9-ae99-1f6823d793ea	SP500	long	10000.00000000	300	7572.17339830	7572.28758771	19500.00000000	1.95	win	2026-07-16 12:45:00.604	2026-07-16 12:42:17.614238	2026-07-16 12:45:05.827	261	\N	f	\N	3008500.00000000	3018000.00000000
84	a37c84ff-be4e-48d9-ae99-1f6823d793ea	SP500	long	10000.00000000	300	7533.74867549	7534.08190893	19500.00000000	1.95	win	2026-07-17 01:35:00.743	2026-07-17 01:33:52.753393	2026-07-17 01:35:06.054	127	\N	f	\N	3018000.00000000	3027500.00000000
85	a37c84ff-be4e-48d9-ae99-1f6823d793ea	SP500	long	10000.00000000	300	7533.88015608	7533.85662258	0.00000000	1.95	lose	2026-07-17 02:15:00.318	2026-07-17 02:13:22.33038	2026-07-17 02:15:06.379	135	\N	f	\N	3027500.00000000	3017500.00000000
86	74852c63-bd9c-4a75-b98a-14f2ad7393c7	SP500	short	250000.00000000	300	7458.87936935	7451.42048998	487500.00000000	1.95	win	2026-07-20 01:35:00.342	2026-07-20 01:30:35.355051	2026-07-20 01:35:06.564	127	\N	f	\N	19763500.00000000	20001000.00000000
101	9ee373bc-d591-4bc7-82e0-18c953b27d5c	SP500	long	150000.00000000	300	7442.72318242	7435.28045924	0.00000000	1.95	lose	2026-07-21 01:35:00.282	2026-07-21 01:30:59.290695	2026-07-21 01:35:07.055	127	\N	f	\N	2000000.00000000	1850000.00000000
107	74852c63-bd9c-4a75-b98a-14f2ad7393c7	SP500	long	2500000.00000000	300	7444.41620257	7451.86061877	4875000.00000000	1.95	win	2026-07-21 04:05:00.79	2026-07-21 04:01:16.801303	2026-07-21 04:05:07.42	157	\N	f	\N	24261000.00000000	26636000.00000000
88	a37c84ff-be4e-48d9-ae99-1f6823d793ea	SP500	short	100000.00000000	300	7458.11144293	7450.65333149	195000.00000000	1.95	win	2026-07-20 01:35:00.716	2026-07-20 01:33:24.726204	2026-07-20 01:35:06.642	127	\N	f	\N	3017500.00000000	3112500.00000000
98	c84ca9f9-1efe-4ff4-a37d-ff9c3237b279	SP500	long	300000.00000000	300	7443.19748688	7435.75428939	0.00000000	1.95	lose	2026-07-21 01:35:00.21	2026-07-21 01:30:29.221284	2026-07-21 01:35:07.105	127	\N	f	\N	20285000.00000000	19985000.00000000
89	74852c63-bd9c-4a75-b98a-14f2ad7393c7	SP500	long	2000000.00000000	300	7457.05859222	7464.51565081	3900000.00000000	1.95	win	2026-07-20 04:05:00.488	2026-07-20 04:02:03.496188	2026-07-20 04:05:07.041	157	\N	f	\N	20001000.00000000	21901000.00000000
90	74852c63-bd9c-4a75-b98a-14f2ad7393c7	SP500	long	2000000.00000000	300	7457.52230830	7464.97983061	3900000.00000000	1.95	win	2026-07-20 04:10:00.63	2026-07-20 04:06:55.640541	2026-07-20 04:10:07.063	158	\N	f	\N	21901000.00000000	23801000.00000000
100	74852c63-bd9c-4a75-b98a-14f2ad7393c7	SP500	long	300000.00000000	300	7443.28000000	7435.83672000	0.00000000	1.95	lose	2026-07-21 01:35:00.498	2026-07-21 01:30:54.507561	2026-07-21 01:35:07.174	127	\N	f	\N	24086000.00000000	23786000.00000000
93	74852c63-bd9c-4a75-b98a-14f2ad7393c7	SP500	long	150000.00000000	300	7458.07211909	7465.53019121	292500.00000000	1.95	win	2026-07-20 07:05:00.205	2026-07-20 07:00:31.214947	2026-07-20 07:05:06.699	193	\N	f	\N	23801000.00000000	23943500.00000000
95	c84ca9f9-1efe-4ff4-a37d-ff9c3237b279	SP500	long	150000.00000000	300	7458.07324180	7465.53131504	292500.00000000	1.95	win	2026-07-20 07:05:00.164	2026-07-20 07:01:41.172927	2026-07-20 07:05:06.767	193	\N	f	\N	20000000.00000000	20142500.00000000
96	c84ca9f9-1efe-4ff4-a37d-ff9c3237b279	SP500	long	150000.00000000	300	7457.42700965	7464.88443666	292500.00000000	1.95	win	2026-07-20 07:10:00.311	2026-07-20 07:05:38.31944	2026-07-20 07:10:06.747	194	\N	f	\N	20142500.00000000	20285000.00000000
97	74852c63-bd9c-4a75-b98a-14f2ad7393c7	SP500	long	150000.00000000	300	7458.15927241	7465.61743168	292500.00000000	1.95	win	2026-07-20 07:10:00.625	2026-07-20 07:08:57.635061	2026-07-20 07:10:06.788	194	\N	f	\N	23943500.00000000	24086000.00000000
108	74852c63-bd9c-4a75-b98a-14f2ad7393c7	SP500	short	2500000.00000000	300	7443.32880793	7435.88547912	4875000.00000000	1.95	win	2026-07-21 04:10:00.758	2026-07-21 04:06:10.767251	2026-07-21 04:10:07.46	158	\N	f	\N	26636000.00000000	29011000.00000000
102	74852c63-bd9c-4a75-b98a-14f2ad7393c7	SP500	short	500000.00000000	300	7443.45957045	7436.01611088	975000.00000000	1.95	win	2026-07-21 01:40:00.157	2026-07-21 01:36:23.168455	2026-07-21 01:40:07.075	128	\N	f	\N	23786000.00000000	24261000.00000000
103	c84ca9f9-1efe-4ff4-a37d-ff9c3237b279	SP500	short	500000.00000000	300	7444.15977610	7436.71561632	975000.00000000	1.95	win	2026-07-21 01:40:00.557	2026-07-21 01:36:34.569919	2026-07-21 01:40:07.114	128	\N	f	\N	19985000.00000000	20460000.00000000
104	b74441c4-1858-43f0-afdc-fbfec02ce9d5	SP500	short	500000.00000000	300	7443.86773263	7436.42386490	975000.00000000	1.95	win	2026-07-21 01:40:00.338	2026-07-21 01:36:38.347604	2026-07-21 01:40:07.159	128	\N	f	\N	1000000.00000000	1475000.00000000
106	9ee373bc-d591-4bc7-82e0-18c953b27d5c	SP500	short	250000.00000000	300	7443.02411180	7435.58108769	487500.00000000	1.95	win	2026-07-21 01:40:00.524	2026-07-21 01:37:09.53235	2026-07-21 01:40:07.243	128	\N	f	\N	1850000.00000000	2087500.00000000
118	74852c63-bd9c-4a75-b98a-14f2ad7393c7	SP500	long	1500000.00000000	300	7509.42118887	7501.91176768	0.00000000	1.95	lose	2026-07-22 04:25:00.466	2026-07-22 04:21:34.47399	2026-07-22 04:25:06.216	161	\N	f	\N	29296000.00000000	27796000.00000000
113	b74441c4-1858-43f0-afdc-fbfec02ce9d5	SP500	long	150000.00000000	300	7509.38632492	7516.89571124	292500.00000000	1.95	win	2026-07-22 01:35:00.421	2026-07-22 01:30:31.431336	2026-07-22 01:35:06.504	127	\N	f	\N	1665000.00000000	1807500.00000000
111	b74441c4-1858-43f0-afdc-fbfec02ce9d5	SP500	short	200000.00000000	300	7443.00472022	7435.56171550	390000.00000000	1.95	win	2026-07-21 07:05:00.446	2026-07-21 07:01:04.457253	2026-07-21 07:05:05.715	193	\N	f	\N	1475000.00000000	1665000.00000000
116	74852c63-bd9c-4a75-b98a-14f2ad7393c7	SP500	short	150000.00000000	300	7508.20740648	7500.69919907	292500.00000000	1.95	win	2026-07-22 01:40:00.357	2026-07-22 01:36:08.367802	2026-07-22 01:40:06.551	128	\N	f	\N	29153500.00000000	29296000.00000000
115	74852c63-bd9c-4a75-b98a-14f2ad7393c7	SP500	long	150000.00000000	300	7509.08321703	7516.59230025	292500.00000000	1.95	win	2026-07-22 01:35:00.069	2026-07-22 01:30:52.079272	2026-07-22 01:35:06.568	127	\N	f	\N	29011000.00000000	29153500.00000000
117	b74441c4-1858-43f0-afdc-fbfec02ce9d5	SP500	short	150000.00000000	300	7509.92351790	7502.41359438	292500.00000000	1.95	win	2026-07-22 01:40:00.053	2026-07-22 01:36:15.064263	2026-07-22 01:40:06.591	128	\N	f	\N	1807500.00000000	1950000.00000000
119	74852c63-bd9c-4a75-b98a-14f2ad7393c7	SP500	long	3500000.00000000	300	7508.57804908	7516.08662713	6825000.00000000	1.95	win	2026-07-22 04:35:00.37	2026-07-22 04:31:37.383098	2026-07-22 04:35:06.301	163	\N	f	\N	27796000.00000000	31121000.00000000
124	b74441c4-1858-43f0-afdc-fbfec02ce9d5	SP500	short	250000.00000000	300	7508.78072499	7501.27194427	487500.00000000	1.95	win	2026-07-22 07:05:00.833	2026-07-22 07:01:49.843059	2026-07-22 07:05:06.649	193	\N	f	\N	1950000.00000000	2187500.00000000
126	b74441c4-1858-43f0-afdc-fbfec02ce9d5	SP500	short	200000.00000000	300	7498.51543920	7491.01692376	390000.00000000	1.95	win	2026-07-23 01:35:00.308	2026-07-23 01:31:21.318509	2026-07-23 01:35:06.591	127	\N	f	\N	2187500.00000000	2377500.00000000
128	3007b845-7394-4cb1-81d7-7a5289591da2	SP500	short	500000.00000000	300	7498.99454679	7506.49354134	0.00000000	1.95	lose	2026-07-23 04:10:00.116	2026-07-23 04:06:07.130138	2026-07-23 04:10:06.817	158	\N	f	\N	5000000.00000000	4500000.00000000
142	b74441c4-1858-43f0-afdc-fbfec02ce9d5	SP500	short	950000.00000000	300	7498.77592124	7491.27714532	1852500.00000000	1.95	win	2026-07-23 07:15:00.354	2026-07-23 07:11:10.379567	2026-07-23 07:15:05.448	195	\N	f	\N	1677500.00000000	2580000.00000000
150	74852c63-bd9c-4a75-b98a-14f2ad7393c7	SP500	short	1200000.00000000	300	7408.16304657	7400.75488352	2340000.00000000	1.95	win	2026-07-24 04:35:00.118	2026-07-24 04:31:16.12712	2026-07-24 04:35:05.222	163	\N	f	\N	33733500.00000000	34873500.00000000
132	74852c63-bd9c-4a75-b98a-14f2ad7393c7	SP500	short	1500000.00000000	300	7498.59062985	7491.09203922	2925000.00000000	1.95	win	2026-07-23 04:55:00.312	2026-07-23 04:50:48.321763	2026-07-23 04:55:07.216	167	\N	f	\N	31121000.00000000	32546000.00000000
133	74852c63-bd9c-4a75-b98a-14f2ad7393c7	SP500	short	1000000.00000000	300	7499.26195308	7491.76269113	1950000.00000000	1.95	win	2026-07-23 05:00:00.637	2026-07-23 04:56:55.647545	2026-07-23 05:00:07.258	168	\N	f	\N	32546000.00000000	33496000.00000000
134	3007b845-7394-4cb1-81d7-7a5289591da2	SP500	long	50000.00000000	300	7499.27719023	7499.16060517	0.00000000	1.95	lose	2026-07-23 06:20:00.821	2026-07-23 06:17:32.830744	2026-07-23 06:20:06.599	184	\N	f	\N	5000000.00000000	4950000.00000000
143	55cd7cf5-4d59-4914-affa-f306a49ff5c2	SP500	short	30000.00000000	300	7408.22386876	7400.81564489	58500.00000000	1.95	win	2026-07-24 00:25:00.375	2026-07-24 00:23:24.386567	2026-07-24 00:25:06.114	113	\N	f	\N	3000000.00000000	3028500.00000000
136	b74441c4-1858-43f0-afdc-fbfec02ce9d5	SP500	short	200000.00000000	300	7498.88239471	7506.38127710	0.00000000	1.95	lose	2026-07-23 07:05:00.546	2026-07-23 07:00:17.567303	2026-07-23 07:05:07.37	193	\N	f	\N	2377500.00000000	2177500.00000000
140	b74441c4-1858-43f0-afdc-fbfec02ce9d5	SP500	long	500000.00000000	300	7498.42517469	7490.92674952	0.00000000	1.95	lose	2026-07-23 07:10:00.768	2026-07-23 07:07:02.77582	2026-07-23 07:10:07.391	194	\N	f	\N	2177500.00000000	1677500.00000000
147	55cd7cf5-4d59-4914-affa-f306a49ff5c2	SP500	long	250000.00000000	300	7408.46640357	7415.87486997	487500.00000000	1.95	win	2026-07-24 01:35:00.049	2026-07-24 01:31:14.058577	2026-07-24 01:35:05.235	127	\N	f	\N	3000000.00000000	3237500.00000000
148	b74441c4-1858-43f0-afdc-fbfec02ce9d5	SP500	long	250000.00000000	300	7408.58651158	7415.99509809	487500.00000000	1.95	win	2026-07-24 01:35:00.218	2026-07-24 01:32:00.22662	2026-07-24 01:35:05.269	127	\N	f	\N	2580000.00000000	2817500.00000000
144	c84ca9f9-1efe-4ff4-a37d-ff9c3237b279	SP500	long	250000.00000000	300	7408.27065222	7415.67892287	487500.00000000	1.95	win	2026-07-24 01:35:00.675	2026-07-24 01:30:44.683584	2026-07-24 01:35:05.834	127	\N	f	\N	20460000.00000000	20697500.00000000
145	74852c63-bd9c-4a75-b98a-14f2ad7393c7	SP500	long	250000.00000000	300	7408.40464436	7415.81304900	487500.00000000	1.95	win	2026-07-24 01:35:00.724	2026-07-24 01:30:50.733711	2026-07-24 01:35:05.881	127	\N	f	\N	33496000.00000000	33733500.00000000
152	74852c63-bd9c-4a75-b98a-14f2ad7393c7	SP500	long	1200000.00000000	300	7407.15588202	7414.56303790	2340000.00000000	1.95	win	2026-07-24 04:40:00.633	2026-07-24 04:36:43.642257	2026-07-24 04:40:06.621	164	\N	f	\N	34873500.00000000	36013500.00000000
158	b74441c4-1858-43f0-afdc-fbfec02ce9d5	SP500	long	250000.00000000	300	7408.22801385	7400.81978584	0.00000000	1.95	lose	2026-07-24 07:05:00.422	2026-07-24 07:00:56.435986	2026-07-24 07:05:06.835	193	\N	f	\N	2817500.00000000	2567500.00000000
155	3007b845-7394-4cb1-81d7-7a5289591da2	SP500	short	50000.00000000	300	7408.53037726	7401.12184688	97500.00000000	1.95	win	2026-07-24 07:05:00.569	2026-07-24 07:00:12.580378	2026-07-24 07:05:06.739	193	\N	f	\N	4950000.00000000	4997500.00000000
156	74852c63-bd9c-4a75-b98a-14f2ad7393c7	SP500	long	250000.00000000	300	7408.57316307	7401.16458991	0.00000000	1.95	lose	2026-07-24 07:05:00.927	2026-07-24 07:00:32.936821	2026-07-24 07:05:06.771	193	\N	f	\N	36013500.00000000	35763500.00000000
161	74852c63-bd9c-4a75-b98a-14f2ad7393c7	SP500	short	450000.00000000	300	7407.42990689	7400.02247698	877500.00000000	1.95	win	2026-07-24 07:10:00.072	2026-07-24 07:06:12.081606	2026-07-24 07:10:05.089	194	\N	f	\N	35763500.00000000	36191000.00000000
163	b74441c4-1858-43f0-afdc-fbfec02ce9d5	SP500	short	450000.00000000	300	7407.91158572	7400.50367413	877500.00000000	1.95	win	2026-07-24 07:10:00.163	2026-07-24 07:06:38.172024	2026-07-24 07:10:06.781	194	\N	f	\N	2567500.00000000	2995000.00000000
160	3007b845-7394-4cb1-81d7-7a5289591da2	SP500	long	250000.00000000	300	7408.10602318	7400.69791716	0.00000000	1.95	lose	2026-07-24 07:10:00.12	2026-07-24 07:05:39.131254	2026-07-24 07:10:06.812	194	\N	f	\N	4997500.00000000	4747500.00000000
165	3007b845-7394-4cb1-81d7-7a5289591da2	SP500	short	450000.00000000	300	7407.89059858	7400.48270798	877500.00000000	1.95	win	2026-07-24 07:15:00.49	2026-07-24 07:11:12.500468	2026-07-24 07:15:06.84	195	\N	f	\N	4747500.00000000	5175000.00000000
167	b74441c4-1858-43f0-afdc-fbfec02ce9d5	SP500	short	200000.00000000	300	7411.24404014	7418.65528418	0.00000000	1.95	lose	2026-07-27 01:35:00.008	2026-07-27 01:30:45.017395	2026-07-27 01:35:05.171	127	\N	f	\N	2995000.00000000	2795000.00000000
169	3007b845-7394-4cb1-81d7-7a5289591da2	SP500	short	200000.00000000	300	7411.88280882	7419.29469163	0.00000000	1.95	lose	2026-07-27 01:35:00.134	2026-07-27 01:31:38.145311	2026-07-27 01:35:05.208	127	\N	f	\N	5175000.00000000	4975000.00000000
168	74852c63-bd9c-4a75-b98a-14f2ad7393c7	SP500	short	200000.00000000	300	7411.64075434	7419.05239509	0.00000000	1.95	lose	2026-07-27 01:35:00.979	2026-07-27 01:30:46.989861	2026-07-27 01:35:06.717	127	\N	f	\N	36191000.00000000	35991000.00000000
181	680bfe1a-2a6d-4661-8111-c86c439f1598	SP500	long	200000.00000000	300	7411.60107038	7404.18946931	0.00000000	1.95	lose	2026-07-27 07:05:00.037	2026-07-27 07:00:05.047044	2026-07-27 07:05:05.573	193	\N	f	\N	3047500.00000000	2847500.00000000
170	b74441c4-1858-43f0-afdc-fbfec02ce9d5	SP500	long	300000.00000000	300	7411.59282394	7404.18123112	0.00000000	1.95	lose	2026-07-27 01:40:00.013	2026-07-27 01:35:47.023693	2026-07-27 01:40:05.198	128	\N	f	\N	2795000.00000000	2495000.00000000
172	74852c63-bd9c-4a75-b98a-14f2ad7393c7	SP500	long	35991000.00000000	300	7410.78777516	7403.37698738	0.00000000	1.95	lose	2026-07-27 01:40:00.032	2026-07-27 01:36:04.041235	2026-07-27 01:40:05.233	128	\N	f	\N	35991000.00000000	0.00000000
192	55cd7cf5-4d59-4914-affa-f306a49ff5c2	SP500	long	500000.00000000	300	7412.74661083	7405.33386422	0.00000000	1.95	lose	2026-07-27 07:10:00.191	2026-07-27 07:06:16.201764	2026-07-27 07:10:05.667	194	\N	f	\N	1237500.00000000	737500.00000000
173	3007b845-7394-4cb1-81d7-7a5289591da2	SP500	long	300000.00000000	300	7412.79389593	7405.38110203	0.00000000	1.95	lose	2026-07-27 01:40:00.417	2026-07-27 01:37:19.426508	2026-07-27 01:40:06.753	128	\N	f	\N	4975000.00000000	4675000.00000000
183	55cd7cf5-4d59-4914-affa-f306a49ff5c2	SP500	long	2000000.00000000	300	7411.43687615	7404.02543927	0.00000000	1.95	lose	2026-07-27 07:05:00.057	2026-07-27 07:00:20.068367	2026-07-27 07:05:05.631	193	\N	f	\N	3237500.00000000	1237500.00000000
199	55cd7cf5-4d59-4914-affa-f306a49ff5c2	SP500	short	700000.00000000	300	7411.98000000	7419.39198000	0.00000000	1.95	lose	2026-07-27 07:15:00.977	2026-07-27 07:11:55.986597	2026-07-27 07:15:07.038	195	\N	f	\N	737500.00000000	37500.00000000
175	b74441c4-1858-43f0-afdc-fbfec02ce9d5	SP500	long	800000.00000000	300	7412.56066345	7419.97322411	1560000.00000000	1.95	win	2026-07-27 01:45:00.545	2026-07-27 01:40:55.555858	2026-07-27 01:45:06.808	129	\N	f	\N	2495000.00000000	3255000.00000000
176	3007b845-7394-4cb1-81d7-7a5289591da2	SP500	long	800000.00000000	300	7411.44395240	7418.85539635	1560000.00000000	1.95	win	2026-07-27 01:45:00.53	2026-07-27 01:41:04.540714	2026-07-27 01:45:06.843	129	\N	f	\N	4675000.00000000	5435000.00000000
188	680bfe1a-2a6d-4661-8111-c86c439f1598	SP500	long	500000.00000000	300	7412.00726725	7404.59525998	0.00000000	1.95	lose	2026-07-27 07:10:00.939	2026-07-27 07:05:45.948593	2026-07-27 07:10:06.999	194	\N	f	\N	2847500.00000000	2347500.00000000
177	680bfe1a-2a6d-4661-8111-c86c439f1598	SP500	long	50000.00000000	300	7410.92629027	7418.33721656	97500.00000000	1.95	win	2026-07-27 04:20:00.609	2026-07-27 04:15:47.619653	2026-07-27 04:20:05.777	160	\N	f	\N	3000000.00000000	3047500.00000000
186	3007b845-7394-4cb1-81d7-7a5289591da2	SP500	long	200000.00000000	300	7412.13491956	7404.72278464	0.00000000	1.95	lose	2026-07-27 07:05:00.54	2026-07-27 07:00:48.550796	2026-07-27 07:05:05.691	193	\N	f	\N	5435000.00000000	5235000.00000000
194	680bfe1a-2a6d-4661-8111-c86c439f1598	SP500	short	700000.00000000	300	7411.95073219	7419.36268292	0.00000000	1.95	lose	2026-07-27 07:15:00.2	2026-07-27 07:10:41.210726	2026-07-27 07:15:05.682	195	\N	f	\N	2347500.00000000	1647500.00000000
184	b74441c4-1858-43f0-afdc-fbfec02ce9d5	SP500	long	200000.00000000	300	7411.87780972	7404.46593191	0.00000000	1.95	lose	2026-07-27 07:05:00.824	2026-07-27 07:00:21.833313	2026-07-27 07:05:06.957	193	\N	f	\N	3255000.00000000	3055000.00000000
180	c84ca9f9-1efe-4ff4-a37d-ff9c3237b279	SP500	long	200000.00000000	300	7412.11344854	7404.70133509	0.00000000	1.95	lose	2026-07-27 07:05:00.099	2026-07-27 07:00:00.11178	2026-07-27 07:05:05.542	193	\N	f	\N	20697500.00000000	20497500.00000000
187	c84ca9f9-1efe-4ff4-a37d-ff9c3237b279	SP500	long	500000.00000000	300	7411.73924359	7404.32750435	0.00000000	1.95	lose	2026-07-27 07:10:00.399	2026-07-27 07:05:40.413407	2026-07-27 07:10:05.595	194	\N	f	\N	20497500.00000000	19997500.00000000
191	3007b845-7394-4cb1-81d7-7a5289591da2	SP500	long	5000000.00000000	300	7412.02340591	7404.61138250	0.00000000	1.95	lose	2026-07-27 07:10:00.664	2026-07-27 07:06:05.674982	2026-07-27 07:10:07.071	194	\N	f	\N	5235000.00000000	235000.00000000
193	b74441c4-1858-43f0-afdc-fbfec02ce9d5	SP500	long	500000.00000000	300	7410.79018976	7403.37939957	0.00000000	1.95	lose	2026-07-27 07:10:00.795	2026-07-27 07:07:04.803953	2026-07-27 07:10:07.107	194	\N	f	\N	3055000.00000000	2555000.00000000
196	c84ca9f9-1efe-4ff4-a37d-ff9c3237b279	SP500	short	700000.00000000	300	7411.94440439	7419.35634879	0.00000000	1.95	lose	2026-07-27 07:15:00.634	2026-07-27 07:11:11.646169	2026-07-27 07:15:05.737	195	\N	f	\N	19997500.00000000	19297500.00000000
198	b74441c4-1858-43f0-afdc-fbfec02ce9d5	SP500	short	700000.00000000	300	7412.22905327	7419.64128232	0.00000000	1.95	lose	2026-07-27 07:15:00.442	2026-07-27 07:11:26.44923	2026-07-27 07:15:05.761	195	\N	f	\N	2555000.00000000	1855000.00000000
200	680bfe1a-2a6d-4661-8111-c86c439f1598	SP500	short	1600000.00000000	300	7412.00156756	7404.58956599	3120000.00000000	1.95	win	2026-07-27 07:20:00.292	2026-07-27 07:15:54.302477	2026-07-27 07:20:05.729	196	\N	f	\N	1647500.00000000	3167500.00000000
202	b74441c4-1858-43f0-afdc-fbfec02ce9d5	SP500	short	1600000.00000000	300	7411.84333871	7404.43149537	3120000.00000000	1.95	win	2026-07-27 07:20:00.387	2026-07-27 07:16:09.397458	2026-07-27 07:20:05.809	196	\N	f	\N	1855000.00000000	3375000.00000000
203	c84ca9f9-1efe-4ff4-a37d-ff9c3237b279	SP500	short	1600000.00000000	300	7411.61637960	7404.20476322	3120000.00000000	1.95	win	2026-07-27 07:20:00.295	2026-07-27 07:16:19.312812	2026-07-27 07:20:05.84	196	\N	f	\N	19297500.00000000	20817500.00000000
205	55cd7cf5-4d59-4914-affa-f306a49ff5c2	SP500	short	200000.00000000	300	7411.25142827	7403.84017684	390000.00000000	1.95	win	2026-07-27 08:00:00.097	2026-07-27 07:56:04.104191	2026-07-27 08:00:05.418	204	\N	f	\N	3037500.00000000	3227500.00000000
206	55cd7cf5-4d59-4914-affa-f306a49ff5c2	SP500	long	200000.00000000	300	7411.77702522	7419.18880225	390000.00000000	1.95	win	2026-07-27 08:05:00.851	2026-07-27 08:01:03.861826	2026-07-27 08:05:06.534	205	\N	f	\N	3227500.00000000	3417500.00000000
207	680bfe1a-2a6d-4661-8111-c86c439f1598	SP500	short	10000.00000000	300	7431.04553783	7419.87565923	19500.00000000	1.95	win	2026-07-27 14:25:00.459	2026-07-27 14:21:43.468268	2026-07-27 14:25:06.571	281	\N	f	\N	3167500.00000000	3177000.00000000
208	680bfe1a-2a6d-4661-8111-c86c439f1598	SP500	short	77000.00000000	300	7413.35014196	7408.00811770	150150.00000000	1.95	win	2026-07-27 14:30:00.969	2026-07-27 14:28:34.978883	2026-07-27 14:30:06.816	282	\N	f	\N	3177000.00000000	3250150.00000000
209	680bfe1a-2a6d-4661-8111-c86c439f1598	SP500	long	250000.00000000	300	7399.22942992	7404.41000000	487500.00000000	1.95	win	2026-07-27 14:50:00.072	2026-07-27 14:49:01.082682	2026-07-27 14:50:06.616	286	\N	f	\N	3250150.00000000	3487650.00000000
210	680bfe1a-2a6d-4661-8111-c86c439f1598	SP500	long	487650.00000000	300	7417.53772334	7418.19981725	950917.50000000	1.95	win	2026-07-27 15:00:00.184	2026-07-27 14:59:01.194727	2026-07-27 15:00:06.317	288	\N	f	\N	3487650.00000000	3950917.50000000
226	c84ca9f9-1efe-4ff4-a37d-ff9c3237b279	SP500	long	150000.00000000	300	7413.07853626	7420.49161480	292500.00000000	1.95	win	2026-07-28 01:35:00.56	2026-07-28 01:31:52.569131	2026-07-28 01:35:05.868	127	\N	f	\N	20817500.00000000	20960000.00000000
211	680bfe1a-2a6d-4661-8111-c86c439f1598	SP500	short	200000.00000000	300	7406.92146803	7411.95000000	0.00000000	1.95	lose	2026-07-27 15:20:00.947	2026-07-27 15:18:58.957042	2026-07-27 15:20:06.616	4	\N	f	\N	3950918.00000000	3750918.00000000
212	680bfe1a-2a6d-4661-8111-c86c439f1598	SP500	short	50000.00000000	300	7406.20407604	7406.21000000	0.00000000	1.95	lose	2026-07-27 15:25:00.403	2026-07-27 15:23:58.41119	2026-07-27 15:25:06.416	5	\N	f	\N	3750918.00000000	3700918.00000000
213	680bfe1a-2a6d-4661-8111-c86c439f1598	SP500	long	10000.00000000	300	7403.89772055	7405.27378899	19500.00000000	1.95	win	2026-07-27 15:30:00.844	2026-07-27 15:29:00.851561	2026-07-27 15:30:07.108	6	\N	f	\N	3700918.00000000	3710418.00000000
214	680bfe1a-2a6d-4661-8111-c86c439f1598	SP500	short	10000.00000000	300	7398.49769612	7397.59000000	19500.00000000	1.95	win	2026-07-27 15:35:00.588	2026-07-27 15:33:58.598177	2026-07-27 15:35:06.816	7	\N	f	\N	3710418.00000000	3719918.00000000
222	55cd7cf5-4d59-4914-affa-f306a49ff5c2	SP500	long	150000.00000000	300	7413.78913285	7421.20292198	292500.00000000	1.95	win	2026-07-28 01:35:00.638	2026-07-28 01:30:27.646946	2026-07-28 01:35:06.379	127	\N	f	\N	3987500.00000000	4130000.00000000
215	680bfe1a-2a6d-4661-8111-c86c439f1598	SP500	short	19000.00000000	300	7393.39430527	7396.41304332	0.00000000	1.95	lose	2026-07-27 15:45:00.911	2026-07-27 15:44:00.921914	2026-07-27 15:45:07.2	9	\N	f	\N	3719918.00000000	3700918.00000000
237	c84ca9f9-1efe-4ff4-a37d-ff9c3237b279	SP500	short	850000.00000000	300	7412.50602435	7405.09351833	1657500.00000000	1.95	win	2026-07-28 01:50:00.453	2026-07-28 01:46:10.463289	2026-07-28 01:50:06.446	130	\N	f	\N	20260000.00000000	21067500.00000000
216	680bfe1a-2a6d-4661-8111-c86c439f1598	SP500	short	50000.00000000	300	7393.51798601	7391.14776961	97500.00000000	1.95	win	2026-07-27 15:50:00.846	2026-07-27 15:49:00.855766	2026-07-27 15:50:07.239	10	\N	f	\N	3700918.00000000	3748418.00000000
223	680bfe1a-2a6d-4661-8111-c86c439f1598	SP500	long	150000.00000000	300	7413.03577600	7420.44881178	292500.00000000	1.95	win	2026-07-28 01:35:00.93	2026-07-28 01:31:05.93984	2026-07-28 01:35:06.414	127	\N	f	\N	3748418.00000000	3890918.00000000
217	55cd7cf5-4d59-4914-affa-f306a49ff5c2	SP500	short	300000.00000000	300	7413.83576102	7406.42192526	585000.00000000	1.95	win	2026-07-28 01:05:00.155	2026-07-28 01:01:29.165232	2026-07-28 01:05:05.838	121	\N	f	\N	3417500.00000000	3702500.00000000
218	3007b845-7394-4cb1-81d7-7a5289591da2	SP500	short	1000000.00000000	300	7412.58916835	7405.17657918	1950000.00000000	1.95	win	2026-07-28 01:05:00.68	2026-07-28 01:04:10.690302	2026-07-28 01:05:05.881	121	\N	f	\N	10085000.00000000	11035000.00000000
219	55cd7cf5-4d59-4914-affa-f306a49ff5c2	SP500	long	300000.00000000	300	7413.59254949	7421.00614204	585000.00000000	1.95	win	2026-07-28 01:10:00.876	2026-07-28 01:06:37.886253	2026-07-28 01:10:05.945	122	\N	f	\N	3702500.00000000	3987500.00000000
220	3007b845-7394-4cb1-81d7-7a5289591da2	SP500	long	1000000.00000000	300	7414.01483823	7421.42885307	1950000.00000000	1.95	win	2026-07-28 01:10:00.521	2026-07-28 01:07:40.530981	2026-07-28 01:10:05.98	122	\N	f	\N	11035000.00000000	11985000.00000000
224	b74441c4-1858-43f0-afdc-fbfec02ce9d5	SP500	long	150000.00000000	300	7412.85449671	7420.26735121	292500.00000000	1.95	win	2026-07-28 01:35:00.18	2026-07-28 01:31:44.190237	2026-07-28 01:35:05.812	127	\N	f	\N	3375000.00000000	3517500.00000000
225	3007b845-7394-4cb1-81d7-7a5289591da2	SP500	long	150000.00000000	300	7412.72105995	7420.13378101	292500.00000000	1.95	win	2026-07-28 01:35:00.316	2026-07-28 01:31:46.326658	2026-07-28 01:35:05.841	127	\N	f	\N	11985000.00000000	12127500.00000000
233	b74441c4-1858-43f0-afdc-fbfec02ce9d5	SP500	long	350000.00000000	300	7413.45395708	7406.04050312	0.00000000	1.95	lose	2026-07-28 01:45:00.241	2026-07-28 01:41:01.252427	2026-07-28 01:45:06.324	129	\N	f	\N	3167500.00000000	2817500.00000000
227	b74441c4-1858-43f0-afdc-fbfec02ce9d5	SP500	short	350000.00000000	300	7413.17443214	7420.58760657	0.00000000	1.95	lose	2026-07-28 01:40:00.585	2026-07-28 01:36:00.595827	2026-07-28 01:40:06.116	128	\N	f	\N	3517500.00000000	3167500.00000000
228	55cd7cf5-4d59-4914-affa-f306a49ff5c2	SP500	short	350000.00000000	300	7412.58147343	7419.99405490	0.00000000	1.95	lose	2026-07-28 01:40:00.643	2026-07-28 01:36:08.651964	2026-07-28 01:40:06.342	128	\N	f	\N	4130000.00000000	3780000.00000000
234	55cd7cf5-4d59-4914-affa-f306a49ff5c2	SP500	long	350000.00000000	300	7413.18000000	7405.76682000	0.00000000	1.95	lose	2026-07-28 01:45:00.017	2026-07-28 01:41:02.028503	2026-07-28 01:45:06.361	129	\N	f	\N	3780000.00000000	3430000.00000000
229	c84ca9f9-1efe-4ff4-a37d-ff9c3237b279	SP500	short	350000.00000000	300	7413.52169843	7420.93522013	0.00000000	1.95	lose	2026-07-28 01:40:00.219	2026-07-28 01:36:35.228723	2026-07-28 01:40:06.379	128	\N	f	\N	20960000.00000000	20610000.00000000
238	b74441c4-1858-43f0-afdc-fbfec02ce9d5	SP500	short	850000.00000000	300	7412.32440350	7404.91207910	1657500.00000000	1.95	win	2026-07-28 01:50:00.567	2026-07-28 01:46:11.579203	2026-07-28 01:50:06.478	130	\N	f	\N	2817500.00000000	3625000.00000000
230	3007b845-7394-4cb1-81d7-7a5289591da2	SP500	short	350000.00000000	300	7412.93663879	7420.34957543	0.00000000	1.95	lose	2026-07-28 01:40:00.38	2026-07-28 01:36:48.390388	2026-07-28 01:40:06.418	128	\N	f	\N	12127500.00000000	11777500.00000000
235	680bfe1a-2a6d-4661-8111-c86c439f1598	SP500	long	150000.00000000	300	7413.60000399	7406.18640399	0.00000000	1.95	lose	2026-07-28 01:45:00.849	2026-07-28 01:43:58.858726	2026-07-28 01:45:06.399	129	\N	f	\N	390918.00000000	240918.00000000
231	680bfe1a-2a6d-4661-8111-c86c439f1598	SP500	short	3500000.00000000	300	7412.32238946	7419.73471185	0.00000000	1.95	lose	2026-07-28 01:40:00.225	2026-07-28 01:38:37.23732	2026-07-28 01:40:06.459	128	\N	f	\N	3890918.00000000	390918.00000000
241	55cd7cf5-4d59-4914-affa-f306a49ff5c2	SP500	short	150000.00000000	300	7412.86233602	7412.83686177	292500.00000000	1.95	win	2026-07-28 04:40:00.892	2026-07-28 04:36:45.90161	2026-07-28 04:40:06.897	164	\N	f	\N	4475000.00000000	4617500.00000000
232	c84ca9f9-1efe-4ff4-a37d-ff9c3237b279	SP500	long	350000.00000000	300	7413.59411893	7406.18052481	0.00000000	1.95	lose	2026-07-28 01:45:00.208	2026-07-28 01:40:53.218971	2026-07-28 01:45:06.437	129	\N	f	\N	20610000.00000000	20260000.00000000
239	55cd7cf5-4d59-4914-affa-f306a49ff5c2	SP500	short	850000.00000000	300	7413.05992868	7405.64686875	1657500.00000000	1.95	win	2026-07-28 01:50:00.005	2026-07-28 01:46:23.01466	2026-07-28 01:50:06.511	130	\N	f	\N	3430000.00000000	4237500.00000000
236	3007b845-7394-4cb1-81d7-7a5289591da2	SP500	long	350000.00000000	300	7412.67166810	7405.25899643	0.00000000	1.95	lose	2026-07-28 01:50:00.117	2026-07-28 01:45:22.126795	2026-07-28 01:50:06.412	130	\N	f	\N	11777500.00000000	11427500.00000000
240	55cd7cf5-4d59-4914-affa-f306a49ff5c2	SP500	short	250000.00000000	300	7413.98376737	7413.30290516	487500.00000000	1.95	win	2026-07-28 04:35:00.136	2026-07-28 04:31:01.150907	2026-07-28 04:35:05.16	163	\N	f	\N	4237500.00000000	4475000.00000000
244	b74441c4-1858-43f0-afdc-fbfec02ce9d5	SP500	short	200000.00000000	300	7412.56009162	7405.14753153	390000.00000000	1.95	win	2026-07-28 07:05:00.312	2026-07-28 07:00:38.323462	2026-07-28 07:05:05.439	193	\N	f	\N	3625000.00000000	3815000.00000000
245	3007b845-7394-4cb1-81d7-7a5289591da2	SP500	short	200000.00000000	300	7413.36655895	7405.95319239	390000.00000000	1.95	win	2026-07-28 07:05:00.198	2026-07-28 07:00:59.208602	2026-07-28 07:05:05.473	193	\N	f	\N	11427500.00000000	11617500.00000000
247	3007b845-7394-4cb1-81d7-7a5289591da2	SP500	short	900000.00000000	300	7428.25908350	7420.83082442	1755000.00000000	1.95	win	2026-07-29 01:05:00.674	2026-07-29 01:01:03.688953	2026-07-29 01:05:05.909	121	\N	f	\N	16617500.00000000	17472500.00000000
246	55cd7cf5-4d59-4914-affa-f306a49ff5c2	SP500	short	900000.00000000	300	7429.13670016	7421.70756346	1755000.00000000	1.95	win	2026-07-29 01:05:00.739	2026-07-29 01:00:40.749314	2026-07-29 01:05:05.946	121	\N	f	\N	29600000.00000000	30455000.00000000
248	55cd7cf5-4d59-4914-affa-f306a49ff5c2	SP500	short	950000.00000000	300	7428.48579616	7421.05731036	1852500.00000000	1.95	win	2026-07-29 01:10:00.627	2026-07-29 01:06:17.638298	2026-07-29 01:10:05.962	122	\N	f	\N	30455000.00000000	31357500.00000000
249	3007b845-7394-4cb1-81d7-7a5289591da2	SP500	short	950000.00000000	300	7428.51666702	7421.08815035	1852500.00000000	1.95	win	2026-07-29 01:10:00.807	2026-07-29 01:06:44.816853	2026-07-29 01:10:05.998	122	\N	f	\N	17472500.00000000	18375000.00000000
250	55cd7cf5-4d59-4914-affa-f306a49ff5c2	SP500	short	250000.00000000	300	7428.66160625	7421.23294464	487500.00000000	1.95	win	2026-07-29 01:35:00.101	2026-07-29 01:30:28.110529	2026-07-29 01:35:06.337	127	\N	f	\N	31000000.00000000	31237500.00000000
251	b74441c4-1858-43f0-afdc-fbfec02ce9d5	SP500	short	250000.00000000	300	7428.79361179	7421.36481818	487500.00000000	1.95	win	2026-07-29 01:35:00.33	2026-07-29 01:30:35.340044	2026-07-29 01:35:06.369	127	\N	f	\N	3815000.00000000	4052500.00000000
252	3007b845-7394-4cb1-81d7-7a5289591da2	SP500	short	250000.00000000	300	7428.78983048	7421.36104065	487500.00000000	1.95	win	2026-07-29 01:35:00.957	2026-07-29 01:31:44.965828	2026-07-29 01:35:06.398	127	\N	f	\N	18375000.00000000	18612500.00000000
265	680bfe1a-2a6d-4661-8111-c86c439f1598	SP500	short	50000.00000000	300	7401.63910044	7402.25602638	0.00000000	1.95	lose	2026-07-29 13:55:00.404	2026-07-29 13:53:51.414257	2026-07-29 13:55:06.938	275	\N	f	\N	140918.00000000	90918.00000000
253	55cd7cf5-4d59-4914-affa-f306a49ff5c2	SP500	long	1100000.00000000	300	7428.59244893	7436.02104138	2145000.00000000	1.95	win	2026-07-29 06:05:00.807	2026-07-29 06:03:14.81812	2026-07-29 06:05:06.284	181	\N	f	\N	56000000.00000000	57045000.00000000
254	55cd7cf5-4d59-4914-affa-f306a49ff5c2	SP500	short	1400000.00000000	300	7428.59906112	7421.17046206	2730000.00000000	1.95	win	2026-07-29 06:15:00.222	2026-07-29 06:10:59.236981	2026-07-29 06:15:06.377	183	\N	f	\N	57045000.00000000	58375000.00000000
255	55cd7cf5-4d59-4914-affa-f306a49ff5c2	SP500	short	250000.00000000	300	7428.71222491	7436.14093713	0.00000000	1.95	lose	2026-07-29 07:05:00.03	2026-07-29 07:00:23.039518	2026-07-29 07:05:05.126	193	\N	f	\N	58375000.00000000	58125000.00000000
266	680bfe1a-2a6d-4661-8111-c86c439f1598	SP500	short	50000.00000000	300	7394.80591768	7399.09593794	0.00000000	1.95	lose	2026-07-29 14:00:00.733	2026-07-29 13:58:47.741578	2026-07-29 14:00:06.976	276	\N	f	\N	90918.00000000	40918.00000000
257	3007b845-7394-4cb1-81d7-7a5289591da2	SP500	short	250000.00000000	300	7429.85433179	7437.28418612	0.00000000	1.95	lose	2026-07-29 07:05:00.984	2026-07-29 07:00:40.994461	2026-07-29 07:05:07.159	193	\N	f	\N	18612500.00000000	18362500.00000000
281	3007b845-7394-4cb1-81d7-7a5289591da2	SP500	short	200000.00000000	300	7315.41426334	7308.09884908	390000.00000000	1.95	win	2026-07-30 07:05:00.595	2026-07-30 07:00:41.603831	2026-07-30 07:05:06.329	193	\N	f	\N	21390000.00000000	21580000.00000000
258	b74441c4-1858-43f0-afdc-fbfec02ce9d5	SP500	short	250000.00000000	300	7428.41296095	7435.84137391	0.00000000	1.95	lose	2026-07-29 07:05:00.937	2026-07-29 07:00:50.946623	2026-07-29 07:05:07.204	193	\N	f	\N	4052500.00000000	3802500.00000000
267	680bfe1a-2a6d-4661-8111-c86c439f1598	SP500	long	40918.00000000	300	7399.84841018	7399.82472295	0.00000000	1.95	lose	2026-07-29 14:05:00.972	2026-07-29 14:03:58.978388	2026-07-29 14:05:07.03	277	\N	f	\N	40918.00000000	0.00000000
259	b74441c4-1858-43f0-afdc-fbfec02ce9d5	SP500	short	500000.00000000	300	7428.73372539	7421.30499166	975000.00000000	1.95	win	2026-07-29 07:10:00.358	2026-07-29 07:05:41.368853	2026-07-29 07:10:07.148	194	\N	f	\N	3802500.00000000	4277500.00000000
274	3007b845-7394-4cb1-81d7-7a5289591da2	SP500	long	250000.00000000	300	7316.41285908	7309.09644622	0.00000000	1.95	lose	2026-07-30 01:35:00.767	2026-07-30 01:30:59.774232	2026-07-30 01:35:07.036	127	\N	f	\N	21212500.00000000	20962500.00000000
260	55cd7cf5-4d59-4914-affa-f306a49ff5c2	SP500	short	500000.00000000	300	7428.78000000	7421.35122000	975000.00000000	1.95	win	2026-07-29 07:10:00.589	2026-07-29 07:05:43.599087	2026-07-29 07:10:07.177	194	\N	f	\N	58125000.00000000	58600000.00000000
268	3007b845-7394-4cb1-81d7-7a5289591da2	SP500	short	1200000.00000000	300	7316.24689579	7308.93064889	2340000.00000000	1.95	win	2026-07-30 01:05:00.722	2026-07-30 01:01:30.731084	2026-07-30 01:05:06.721	121	\N	f	\N	18837500.00000000	19977500.00000000
261	3007b845-7394-4cb1-81d7-7a5289591da2	SP500	short	500000.00000000	300	7428.78000000	7421.35122000	975000.00000000	1.95	win	2026-07-29 07:10:00.764	2026-07-29 07:05:57.773541	2026-07-29 07:10:07.205	194	\N	f	\N	18362500.00000000	18837500.00000000
263	680bfe1a-2a6d-4661-8111-c86c439f1598	SP500	short	50000.00000000	300	7418.91689830	7420.66742633	0.00000000	1.95	lose	2026-07-29 13:45:00.6	2026-07-29 13:44:02.609133	2026-07-29 13:45:06.852	273	\N	f	\N	240918.00000000	190918.00000000
279	3007b845-7394-4cb1-81d7-7a5289591da2	SP500	short	450000.00000000	300	7316.99311459	7309.67612148	877500.00000000	1.95	win	2026-07-30 01:40:00.205	2026-07-30 01:36:23.2147	2026-07-30 01:40:07.083	128	\N	f	\N	20962500.00000000	21390000.00000000
264	680bfe1a-2a6d-4661-8111-c86c439f1598	SP500	short	50000.00000000	300	7415.51542499	7416.38118740	0.00000000	1.95	lose	2026-07-29 13:50:00.587	2026-07-29 13:49:01.598149	2026-07-29 13:50:06.886	274	\N	f	\N	190918.00000000	140918.00000000
269	3007b845-7394-4cb1-81d7-7a5289591da2	SP500	short	1300000.00000000	300	7315.71232470	7308.39661238	2535000.00000000	1.95	win	2026-07-30 01:10:00.937	2026-07-30 01:06:14.945351	2026-07-30 01:10:06.75	122	\N	f	\N	19977500.00000000	21212500.00000000
275	b74441c4-1858-43f0-afdc-fbfec02ce9d5	SP500	long	250000.00000000	300	7316.24238336	7308.92614098	0.00000000	1.95	lose	2026-07-30 01:35:00.796	2026-07-30 01:32:36.804636	2026-07-30 01:35:07.064	127	\N	f	\N	4277500.00000000	4027500.00000000
270	55cd7cf5-4d59-4914-affa-f306a49ff5c2	SP500	long	1700000.00000000	300	7316.08689229	7323.40297918	3315000.00000000	1.95	win	2026-07-30 01:15:00.482	2026-07-30 01:10:59.492177	2026-07-30 01:15:06.778	123	\N	f	\N	83375000.00000000	84990000.00000000
271	55cd7cf5-4d59-4914-affa-f306a49ff5c2	SP500	short	2300000.00000000	300	7316.89931040	7309.58241109	4485000.00000000	1.95	win	2026-07-30 01:20:00.325	2026-07-30 01:16:26.336786	2026-07-30 01:20:06.827	124	\N	f	\N	84990000.00000000	87175000.00000000
272	55cd7cf5-4d59-4914-affa-f306a49ff5c2	SP500	long	250000.00000000	300	7316.17553335	7308.85935782	0.00000000	1.95	lose	2026-07-30 01:35:00.619	2026-07-30 01:30:30.62821	2026-07-30 01:35:06.955	127	\N	f	\N	87175000.00000000	86925000.00000000
276	55cd7cf5-4d59-4914-affa-f306a49ff5c2	SP500	short	450000.00000000	300	7316.35223544	7309.03588320	877500.00000000	1.95	win	2026-07-30 01:40:00.056	2026-07-30 01:35:54.067211	2026-07-30 01:40:06.987	128	\N	f	\N	86925000.00000000	87352500.00000000
277	b74441c4-1858-43f0-afdc-fbfec02ce9d5	SP500	short	450000.00000000	300	7316.35223544	7309.03588320	877500.00000000	1.95	win	2026-07-30 01:40:00.177	2026-07-30 01:35:54.188211	2026-07-30 01:40:07.019	128	\N	f	\N	4027500.00000000	4455000.00000000
282	c84ca9f9-1efe-4ff4-a37d-ff9c3237b279	SP500	short	200000.00000000	300	7316.02311096	7308.70708785	390000.00000000	1.95	win	2026-07-30 07:05:00.705	2026-07-30 07:00:43.713348	2026-07-30 07:05:06.377	193	\N	f	\N	21067500.00000000	21257500.00000000
280	b74441c4-1858-43f0-afdc-fbfec02ce9d5	SP500	short	200000.00000000	300	7315.60392495	7308.28832103	390000.00000000	1.95	win	2026-07-30 07:05:00.83	2026-07-30 07:00:36.840673	2026-07-30 07:05:06.286	193	\N	f	\N	4455000.00000000	4645000.00000000
284	3007b845-7394-4cb1-81d7-7a5289591da2	SP500	long	1000000.00000000	300	7437.60770830	7430.17010059	0.00000000	1.95	lose	2026-07-31 01:05:00.493	2026-07-31 01:03:31.502216	2026-07-31 01:05:05.6	121	\N	f	\N	20580000.00000000	19580000.00000000
285	3007b845-7394-4cb1-81d7-7a5289591da2	SP500	short	2000000.00000000	300	7438.17519066	7430.73701547	3900000.00000000	1.95	win	2026-07-31 01:10:00.715	2026-07-31 01:06:43.725815	2026-07-31 01:10:07.641	122	\N	f	\N	19580000.00000000	21480000.00000000
286	55cd7cf5-4d59-4914-affa-f306a49ff5c2	SP500	long	200000.00000000	300	7437.49241111	7444.92990352	390000.00000000	1.95	win	2026-07-31 01:35:00.825	2026-07-31 01:30:57.835151	2026-07-31 01:35:06.022	127	\N	f	\N	82127500.00000000	82317500.00000000
288	3007b845-7394-4cb1-81d7-7a5289591da2	SP500	long	200000.00000000	300	7437.26056700	7444.69782757	390000.00000000	1.95	win	2026-07-31 01:35:00.031	2026-07-31 01:31:20.040849	2026-07-31 01:35:06.099	127	\N	f	\N	21480000.00000000	21670000.00000000
289	c84ca9f9-1efe-4ff4-a37d-ff9c3237b279	SP500	long	200000.00000000	300	7437.69177924	7445.12947102	390000.00000000	1.95	win	2026-07-31 01:35:00.667	2026-07-31 01:32:59.677721	2026-07-31 01:35:06.137	127	\N	f	\N	21257500.00000000	21447500.00000000
290	55cd7cf5-4d59-4914-affa-f306a49ff5c2	SP500	long	1500000.00000000	300	7437.30706940	7429.86976233	0.00000000	1.95	lose	2026-07-31 04:35:00.058	2026-07-31 04:31:19.06742	2026-07-31 04:35:07.022	163	\N	f	\N	82317500.00000000	80817500.00000000
291	55cd7cf5-4d59-4914-affa-f306a49ff5c2	SP500	long	3000000.00000000	300	7438.15160686	7445.58975847	5850000.00000000	1.95	win	2026-07-31 04:40:00.717	2026-07-31 04:36:27.727013	2026-07-31 04:40:07.058	164	\N	f	\N	80817500.00000000	83667500.00000000
292	55cd7cf5-4d59-4914-affa-f306a49ff5c2	SP500	short	2000000.00000000	300	7438.17467591	7430.73650123	3900000.00000000	1.95	win	2026-07-31 04:45:00.619	2026-07-31 04:41:20.631036	2026-07-31 04:45:07.125	165	\N	f	\N	83667500.00000000	85567500.00000000
293	55cd7cf5-4d59-4914-affa-f306a49ff5c2	SP500	short	200000.00000000	300	7437.60741632	7430.16980890	390000.00000000	1.95	win	2026-07-31 07:05:00.326	2026-07-31 07:00:39.337917	2026-07-31 07:05:05.572	193	\N	f	\N	85567500.00000000	85757500.00000000
306	3007b845-7394-4cb1-81d7-7a5289591da2	SP500	long	500000.00000000	300	7490.08241276	7497.57249517	975000.00000000	1.95	win	2026-08-03 04:10:00.525	2026-08-03 04:06:39.533449	2026-08-03 04:10:05.858	158	\N	f	\N	5000000.00000000	5475000.00000000
294	b74441c4-1858-43f0-afdc-fbfec02ce9d5	SP500	short	200000.00000000	300	7437.84949457	7430.41164508	390000.00000000	1.95	win	2026-07-31 07:05:00.166	2026-07-31 07:01:01.179602	2026-07-31 07:05:05.605	193	\N	f	\N	4645000.00000000	4835000.00000000
295	c84ca9f9-1efe-4ff4-a37d-ff9c3237b279	SP500	short	200000.00000000	300	7437.51557808	7430.07806250	390000.00000000	1.95	win	2026-07-31 07:05:00.179	2026-07-31 07:01:14.200772	2026-07-31 07:05:05.638	193	\N	f	\N	21447500.00000000	21637500.00000000
320	c84ca9f9-1efe-4ff4-a37d-ff9c3237b279	SP500	short	200000.00000000	300	7599.89925049	7592.29935124	390000.00000000	1.95	win	2026-08-04 01:35:00.23	2026-08-04 01:32:24.240061	2026-08-04 01:35:06.836	127	\N	f	\N	21627500.00000000	21817500.00000000
296	3007b845-7394-4cb1-81d7-7a5289591da2	SP500	short	200000.00000000	300	7437.38135421	7429.94397286	390000.00000000	1.95	win	2026-07-31 07:05:00.266	2026-07-31 07:01:17.276441	2026-07-31 07:05:05.67	193	\N	f	\N	21670000.00000000	21860000.00000000
307	3007b845-7394-4cb1-81d7-7a5289591da2	SP500	long	500000.00000000	300	7489.12895419	7496.61808314	975000.00000000	1.95	win	2026-08-03 04:15:00.406	2026-08-03 04:11:30.413493	2026-08-03 04:15:05.913	159	\N	f	\N	5475000.00000000	5950000.00000000
298	3007b845-7394-4cb1-81d7-7a5289591da2	SP500	long	21860000.00000000	300	7491.06239680	7483.57133440	0.00000000	1.95	lose	2026-08-03 01:05:00.02	2026-08-03 01:01:35.029995	2026-08-03 01:05:05.496	121	\N	f	\N	21860000.00000000	0.00000000
297	55cd7cf5-4d59-4914-affa-f306a49ff5c2	SP500	long	2000000.00000000	300	7489.56278381	7482.07322103	0.00000000	1.95	lose	2026-08-03 01:05:00.72	2026-08-03 01:00:06.731214	2026-08-03 01:05:05.976	121	\N	f	\N	85377500.00000000	83377500.00000000
299	55cd7cf5-4d59-4914-affa-f306a49ff5c2	SP500	long	4000000.00000000	300	7489.50320499	7496.99270819	7800000.00000000	1.95	win	2026-08-03 01:10:00.919	2026-08-03 01:05:40.927918	2026-08-03 01:10:06.021	122	\N	f	\N	83377500.00000000	87177500.00000000
300	55cd7cf5-4d59-4914-affa-f306a49ff5c2	SP500	short	2500000.00000000	300	7488.79982456	7481.31102474	4875000.00000000	1.95	win	2026-08-03 01:15:00.429	2026-08-03 01:11:04.438822	2026-08-03 01:15:05.691	123	\N	f	\N	87177500.00000000	89552500.00000000
301	b74441c4-1858-43f0-afdc-fbfec02ce9d5	SP500	short	200000.00000000	300	7489.14214497	7496.63128711	0.00000000	1.95	lose	2026-08-03 01:35:00.442	2026-08-03 01:30:19.453283	2026-08-03 01:35:06.041	127	\N	f	\N	4835000.00000000	4635000.00000000
315	55cd7cf5-4d59-4914-affa-f306a49ff5c2	SP500	short	2500000.00000000	300	7599.58656018	7591.98697362	4875000.00000000	1.95	win	2026-08-04 01:20:00.042	2026-08-04 01:16:21.051692	2026-08-04 01:20:05.228	124	\N	f	\N	93407500.00000000	95782500.00000000
308	c84ca9f9-1efe-4ff4-a37d-ff9c3237b279	SP500	long	200000.00000000	300	7489.62313151	7497.11275464	390000.00000000	1.95	win	2026-08-03 07:05:00.41	2026-08-03 07:00:34.556796	2026-08-03 07:05:05.492	193	\N	f	\N	21437500.00000000	21627500.00000000
303	c84ca9f9-1efe-4ff4-a37d-ff9c3237b279	SP500	short	200000.00000000	300	7490.73008337	7498.22081345	0.00000000	1.95	lose	2026-08-03 01:35:00.007	2026-08-03 01:30:32.019649	2026-08-03 01:35:06.124	127	\N	f	\N	21637500.00000000	21437500.00000000
304	b74441c4-1858-43f0-afdc-fbfec02ce9d5	SP500	short	400000.00000000	300	7490.13064137	7482.64051073	780000.00000000	1.95	win	2026-08-03 01:40:00.68	2026-08-03 01:36:15.693365	2026-08-03 01:40:06.067	128	\N	f	\N	4635000.00000000	5015000.00000000
310	3007b845-7394-4cb1-81d7-7a5289591da2	SP500	long	200000.00000000	300	7489.10131515	7496.59041647	390000.00000000	1.95	win	2026-08-03 07:05:00.288	2026-08-03 07:01:03.29688	2026-08-03 07:05:05.525	193	\N	f	\N	5950000.00000000	6140000.00000000
311	b74441c4-1858-43f0-afdc-fbfec02ce9d5	SP500	long	200000.00000000	300	7489.04515154	7496.53419669	390000.00000000	1.95	win	2026-08-03 07:05:00.705	2026-08-03 07:01:03.717763	2026-08-03 07:05:05.895	193	\N	f	\N	5015000.00000000	5205000.00000000
312	55cd7cf5-4d59-4914-affa-f306a49ff5c2	SP500	long	900000.00000000	300	7601.05546272	7608.65651818	1755000.00000000	1.95	win	2026-08-04 01:05:00.412	2026-08-04 01:01:19.432993	2026-08-04 01:05:05.867	121	\N	f	\N	92552500.00000000	93407500.00000000
313	3007b845-7394-4cb1-81d7-7a5289591da2	SP500	long	900000.00000000	300	7599.87953531	7607.47941485	1755000.00000000	1.95	win	2026-08-04 01:05:00.175	2026-08-04 01:01:46.183679	2026-08-04 01:05:05.895	121	\N	f	\N	11140000.00000000	11995000.00000000
314	3007b845-7394-4cb1-81d7-7a5289591da2	SP500	short	1200000.00000000	300	7600.31153420	7592.71122267	2340000.00000000	1.95	win	2026-08-04 01:10:00.025	2026-08-04 01:06:32.033618	2026-08-04 01:10:05.491	122	\N	f	\N	11995000.00000000	13135000.00000000
317	55cd7cf5-4d59-4914-affa-f306a49ff5c2	SP500	short	200000.00000000	300	7600.35777130	7592.75741353	390000.00000000	1.95	win	2026-08-04 01:35:00.791	2026-08-04 01:30:54.800539	2026-08-04 01:35:06.722	127	\N	f	\N	95782500.00000000	95972500.00000000
321	c84ca9f9-1efe-4ff4-a37d-ff9c3237b279	SP500	short	200000.00000000	300	7601.48252215	7593.88103963	390000.00000000	1.95	win	2026-08-04 06:05:00.236	2026-08-04 06:02:02.244637	2026-08-04 06:05:05.867	181	\N	f	\N	21817500.00000000	22007500.00000000
318	b74441c4-1858-43f0-afdc-fbfec02ce9d5	SP500	short	200000.00000000	300	7600.13878868	7592.53864989	390000.00000000	1.95	win	2026-08-04 01:35:00.384	2026-08-04 01:30:59.394212	2026-08-04 01:35:06.759	127	\N	f	\N	5205000.00000000	5395000.00000000
319	3007b845-7394-4cb1-81d7-7a5289591da2	SP500	short	200000.00000000	300	7601.07546269	7593.47438723	390000.00000000	1.95	win	2026-08-04 01:35:00.078	2026-08-04 01:31:06.087422	2026-08-04 01:35:06.797	127	\N	f	\N	13135000.00000000	13325000.00000000
325	c84ca9f9-1efe-4ff4-a37d-ff9c3237b279	SP500	short	200000.00000000	300	7600.40539595	7608.00580135	0.00000000	1.95	lose	2026-08-04 07:05:00.723	2026-08-04 07:00:41.735374	2026-08-04 07:05:05.857	193	\N	f	\N	22007500.00000000	21807500.00000000
323	b74441c4-1858-43f0-afdc-fbfec02ce9d5	SP500	short	200000.00000000	300	7600.35596074	7607.95631670	0.00000000	1.95	lose	2026-08-04 07:05:00.969	2026-08-04 07:00:26.987781	2026-08-04 07:05:07.001	193	\N	f	\N	5395000.00000000	5195000.00000000
324	3007b845-7394-4cb1-81d7-7a5289591da2	SP500	short	200000.00000000	300	7601.06768038	7608.66874806	0.00000000	1.95	lose	2026-08-04 07:05:00.991	2026-08-04 07:00:29.998518	2026-08-04 07:05:07.03	193	\N	f	\N	13325000.00000000	13125000.00000000
326	b74441c4-1858-43f0-afdc-fbfec02ce9d5	SP500	short	350000.00000000	300	7600.20606182	7592.60585576	682500.00000000	1.95	win	2026-08-04 07:10:00.488	2026-08-04 07:05:39.501509	2026-08-04 07:10:05.841	194	\N	f	\N	5195000.00000000	5527500.00000000
328	3007b845-7394-4cb1-81d7-7a5289591da2	SP500	short	350000.00000000	300	7599.55489926	7591.95534436	682500.00000000	1.95	win	2026-08-04 07:10:00.285	2026-08-04 07:06:34.296148	2026-08-04 07:10:05.911	194	\N	f	\N	13125000.00000000	13457500.00000000
329	c84ca9f9-1efe-4ff4-a37d-ff9c3237b279	SP500	short	350000.00000000	300	7600.25243307	7592.65218064	682500.00000000	1.95	win	2026-08-04 07:10:00.7	2026-08-04 07:07:22.712226	2026-08-04 07:10:05.939	194	\N	f	\N	21807500.00000000	22140000.00000000
330	55cd7cf5-4d59-4914-affa-f306a49ff5c2	SP500	short	2000000.00000000	300	7735.92664883	7728.19072218	3900000.00000000	1.95	win	2026-08-05 01:05:00.285	2026-08-05 01:01:32.294279	2026-08-05 01:05:06.552	121	\N	f	\N	95972500.00000000	97872500.00000000
331	3007b845-7394-4cb1-81d7-7a5289591da2	SP500	short	800000.00000000	300	7736.45642685	7728.71997042	1560000.00000000	1.95	win	2026-08-05 01:05:00.609	2026-08-05 01:01:49.618257	2026-08-05 01:05:06.579	121	\N	f	\N	13457500.00000000	14217500.00000000
333	3007b845-7394-4cb1-81d7-7a5289591da2	SP500	short	800000.00000000	300	7736.52000000	7728.78348000	1560000.00000000	1.95	win	2026-08-05 01:10:00.178	2026-08-05 01:06:27.184209	2026-08-05 01:10:05.39	122	\N	f	\N	14217500.00000000	14977500.00000000
332	55cd7cf5-4d59-4914-affa-f306a49ff5c2	SP500	short	3000000.00000000	300	7736.34914644	7728.61279729	5850000.00000000	1.95	win	2026-08-05 01:10:00.289	2026-08-05 01:06:15.295882	2026-08-05 01:10:05.348	122	\N	f	\N	97872500.00000000	100722500.00000000
336	3007b845-7394-4cb1-81d7-7a5289591da2	SP500	short	250000.00000000	300	7736.81254092	7729.07572838	487500.00000000	1.95	win	2026-08-05 01:35:00.112	2026-08-05 01:31:05.119984	2026-08-05 01:35:05.6	127	\N	f	\N	14977500.00000000	15215000.00000000
337	c84ca9f9-1efe-4ff4-a37d-ff9c3237b279	SP500	short	250000.00000000	300	7737.72416250	7729.98643834	487500.00000000	1.95	win	2026-08-05 01:35:00.507	2026-08-05 01:32:22.51891	2026-08-05 01:35:05.643	127	\N	f	\N	22140000.00000000	22377500.00000000
356	b74441c4-1858-43f0-afdc-fbfec02ce9d5	SP500	short	200000.00000000	300	7723.03109314	7724.11949445	0.00000000	1.95	lose	2026-08-06 07:05:00.969	2026-08-06 07:00:36.980081	2026-08-06 07:05:06.657	193	\N	f	\N	5735000.00000000	5535000.00000000
348	55cd7cf5-4d59-4914-affa-f306a49ff5c2	SP500	short	4000000.00000000	300	7723.45591946	7731.17937538	0.00000000	1.95	lose	2026-08-06 01:10:00.198	2026-08-06 01:06:32.206297	2026-08-06 01:10:06.532	122	\N	f	\N	102622500.00000000	98622500.00000000
335	b74441c4-1858-43f0-afdc-fbfec02ce9d5	SP500	short	250000.00000000	300	7736.15507723	7728.41892215	487500.00000000	1.95	win	2026-08-05 01:35:00.883	2026-08-05 01:30:55.896214	2026-08-05 01:35:06.955	127	\N	f	\N	5527500.00000000	5765000.00000000
338	b74441c4-1858-43f0-afdc-fbfec02ce9d5	SP500	short	300000.00000000	300	7736.57555037	7744.31212592	0.00000000	1.95	lose	2026-08-05 07:05:00.593	2026-08-05 07:00:17.604455	2026-08-05 07:05:06.572	193	\N	f	\N	5765000.00000000	5465000.00000000
349	3007b845-7394-4cb1-81d7-7a5289591da2	SP500	long	600000.00000000	300	7723.36391589	7731.08727981	1170000.00000000	1.95	win	2026-08-06 01:10:00.666	2026-08-06 01:07:46.673855	2026-08-06 01:10:06.606	122	\N	f	\N	15865000.00000000	16435000.00000000
340	3007b845-7394-4cb1-81d7-7a5289591da2	SP500	short	300000.00000000	300	7736.16852849	7743.90469702	0.00000000	1.95	lose	2026-08-05 07:05:00.797	2026-08-05 07:00:53.807613	2026-08-05 07:05:06.652	193	\N	f	\N	15215000.00000000	14915000.00000000
341	c84ca9f9-1efe-4ff4-a37d-ff9c3237b279	SP500	short	300000.00000000	300	7737.12578606	7744.86291185	0.00000000	1.95	lose	2026-08-05 07:05:00.721	2026-08-05 07:01:24.734918	2026-08-05 07:05:06.691	193	\N	f	\N	22377500.00000000	22077500.00000000
350	55cd7cf5-4d59-4914-affa-f306a49ff5c2	SP500	short	7000000.00000000	300	7723.62922233	7715.90559311	13650000.00000000	1.95	win	2026-08-06 01:20:00.211	2026-08-06 01:17:08.219925	2026-08-06 01:20:05.312	124	\N	f	\N	98622500.00000000	105272500.00000000
343	3007b845-7394-4cb1-81d7-7a5289591da2	SP500	long	600000.00000000	300	7736.26510791	7744.00137302	1170000.00000000	1.95	win	2026-08-05 07:10:00.809	2026-08-05 07:06:22.821359	2026-08-05 07:10:06.665	194	\N	f	\N	14915000.00000000	15485000.00000000
344	c84ca9f9-1efe-4ff4-a37d-ff9c3237b279	SP500	long	600000.00000000	300	7736.02501611	7743.76104113	1170000.00000000	1.95	win	2026-08-05 07:10:00.441	2026-08-05 07:06:26.455065	2026-08-05 07:10:06.703	194	\N	f	\N	22077500.00000000	22647500.00000000
345	b74441c4-1858-43f0-afdc-fbfec02ce9d5	SP500	long	600000.00000000	300	7736.42056927	7744.15698984	1170000.00000000	1.95	win	2026-08-05 07:10:00.282	2026-08-05 07:06:54.293573	2026-08-05 07:10:06.74	194	\N	f	\N	5465000.00000000	6035000.00000000
346	55cd7cf5-4d59-4914-affa-f306a49ff5c2	SP500	long	2000000.00000000	300	7722.75862214	7730.48138076	3900000.00000000	1.95	win	2026-08-06 01:05:00.536	2026-08-06 01:01:11.544611	2026-08-06 01:05:06.443	121	\N	f	\N	100722500.00000000	102622500.00000000
347	3007b845-7394-4cb1-81d7-7a5289591da2	SP500	long	400000.00000000	300	7723.49877503	7731.22227381	780000.00000000	1.95	win	2026-08-06 01:05:00.981	2026-08-06 01:02:28.995039	2026-08-06 01:05:06.475	121	\N	f	\N	15485000.00000000	15865000.00000000
358	55cd7cf5-4d59-4914-affa-f306a49ff5c2	SP500	short	4000000.00000000	300	7708.94524995	7701.23630470	7800000.00000000	1.95	win	2026-08-07 01:05:00.085	2026-08-07 01:00:43.094706	2026-08-07 01:05:05.414	121	\N	f	\N	105272500.00000000	109072500.00000000
353	b74441c4-1858-43f0-afdc-fbfec02ce9d5	SP500	short	300000.00000000	300	7724.14916757	7731.87331674	0.00000000	1.95	lose	2026-08-06 01:40:00.359	2026-08-06 01:37:21.369212	2026-08-06 01:40:05.699	128	\N	f	\N	6035000.00000000	5735000.00000000
359	55cd7cf5-4d59-4914-affa-f306a49ff5c2	SP500	short	3000000.00000000	300	7709.09040141	7701.38131101	5850000.00000000	1.95	win	2026-08-07 01:10:00.673	2026-08-07 01:06:02.684169	2026-08-07 01:10:06.16	122	\N	f	\N	109072500.00000000	111922500.00000000
355	3007b845-7394-4cb1-81d7-7a5289591da2	SP500	short	16435000.00000000	300	7723.49811334	7731.22161145	0.00000000	1.95	lose	2026-08-06 01:45:00.612	2026-08-06 01:41:33.622253	2026-08-06 01:45:05.787	129	\N	f	\N	16435000.00000000	0.00000000
360	b74441c4-1858-43f0-afdc-fbfec02ce9d5	SP500	long	200000.00000000	300	7710.17354469	7717.88371823	390000.00000000	1.95	win	2026-08-07 01:35:00.809	2026-08-07 01:31:39.818047	2026-08-07 01:35:06.447	127	\N	f	\N	5535000.00000000	5725000.00000000
367	c84ca9f9-1efe-4ff4-a37d-ff9c3237b279	SP500	long	200000.00000000	300	7709.83082693	7717.54065776	390000.00000000	1.95	win	2026-08-07 07:05:00.017	2026-08-07 07:01:18.029973	2026-08-07 07:05:05.533	193	\N	f	\N	22647500.00000000	22837500.00000000
368	b74441c4-1858-43f0-afdc-fbfec02ce9d5	SP500	long	200000.00000000	300	7709.78264243	7717.49242507	390000.00000000	1.95	win	2026-08-07 07:05:00.574	2026-08-07 07:01:36.584091	2026-08-07 07:05:06.288	193	\N	f	\N	5725000.00000000	5915000.00000000
\.


--
-- Data for Name: blocked_ips; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.blocked_ips (id, ip_address, reason, blocked_by, created_at) FROM stdin;
\.


--
-- Data for Name: branches; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.branches (id, code, name, is_active, created_at) FROM stdin;
\.


--
-- Data for Name: forex_candles; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.forex_candles (id, symbol, duration, "time", open, high, low, close) FROM stdin;
1729	DXY	300	1786320300	99.632000	99.644309	99.625115	99.632997
3462	SP500	300	1786323300	7757.039323	7758.862683	7756.163258	7757.631455
3463	DOW	300	1786323300	54036.885463	54046.817980	54031.111793	54039.893617
3464	DXY	300	1786323300	99.659091	99.665693	99.626641	99.636632
1288	SP500	300	1786278300	7757.345875	7758.781838	7756.558505	7758.025433
559	SP500	300	1786277100	7757.439901	7758.661066	7756.628841	7757.298955
560	DOW	300	1786277100	54037.403442	54050.536713	54025.393208	54033.305145
561	DXY	300	1786277100	99.603124	99.617159	99.592364	99.600589
502	SP500	300	1786276800	7757.508004	7758.297242	7756.886350	7757.202345
503	DOW	300	1786276800	54034.927554	54043.945594	54028.650668	54038.933121
504	DXY	300	1786276800	99.603786	99.613301	99.595474	99.602822
94	SP500	300	1786275900	7757.640000	7758.897384	7756.633022	7757.467283
95	DOW	300	1786275900	54036.930000	54045.268356	54032.233342	54035.927542
96	DXY	300	1786275900	99.604000	99.611579	99.600592	99.605639
49	SP500	300	1786274400	7757.577525	7758.203128	7756.370523	7757.797290
50	DOW	300	1786274400	54038.025136	54045.281493	54028.279510	54038.183001
51	DXY	300	1786274400	99.602311	99.612473	99.594248	99.605293
742	SP500	300	1786277400	7757.537495	7759.175192	7756.042945	7758.389200
743	DOW	300	1786277400	54035.402992	54042.787062	54021.841517	54040.693856
744	DXY	300	1786277400	99.602059	99.615116	99.597350	99.604991
319	SP500	300	1786276500	7757.641082	7758.598882	7756.427811	7757.558183
320	DOW	300	1786276500	54034.183208	54046.679763	54029.889027	54036.631162
321	DXY	300	1786276500	99.603189	99.613324	99.590249	99.602177
1	SP500	300	1786274100	7757.640000	7759.082068	7756.606203	7757.640000
2	DOW	300	1786274100	54036.930000	54041.474266	54028.329251	54036.930000
3	DXY	300	1786274100	99.604000	99.611398	99.595563	99.604000
1289	DOW	300	1786278300	54040.733064	54050.007590	54028.675577	54032.363572
1290	DXY	300	1786278300	99.595874	99.616972	99.593302	99.602256
925	SP500	300	1786277700	7758.506202	7759.006679	7756.410474	7757.108358
926	DOW	300	1786277700	54039.828074	54046.651423	54026.222988	54039.438079
927	DXY	300	1786277700	99.606304	99.613389	99.590745	99.603142
3281	SP500	300	1786323000	7758.428614	7758.935039	7756.339955	7757.281066
3282	DOW	300	1786323000	54037.813031	54044.308692	54024.409712	54036.608217
3283	DXY	300	1786323000	99.649177	99.661131	99.635251	99.658065
2738	SP500	300	1786322100	7757.804816	7759.184508	7755.721120	7758.162925
2739	DOW	300	1786322100	54031.578434	54047.946092	54023.677810	54043.238767
2740	DXY	300	1786322100	99.638723	99.653492	99.627917	99.642090
2558	SP500	300	1786321800	7758.872138	7759.210747	7756.300907	7758.026319
2559	DOW	300	1786321800	54035.152214	54044.137934	54027.226534	54033.361929
2195	SP500	300	1786321200	7757.358057	7758.772862	7756.267983	7757.284434
2196	DOW	300	1786321200	54034.966926	54046.917751	54024.476916	54037.321353
2197	DXY	300	1786321200	99.619135	99.635604	99.605089	99.608333
139	SP500	300	1786276200	7757.458284	7758.861316	7756.321354	7757.471963
140	DOW	300	1786276200	54036.729971	54042.960984	54026.039132	54034.980784
141	DXY	300	1786276200	99.605218	99.612921	99.593313	99.602912
1655	DOW	300	1786278900	54039.237449	54051.396340	54032.495547	54036.999445
1656	DXY	300	1786278900	99.601250	99.613803	99.596516	99.602025
1654	SP500	300	1786278900	7757.827516	7758.426800	7756.850686	7757.724355
1105	SP500	300	1786278000	7757.057495	7758.877780	7756.202025	7757.208199
1106	DOW	300	1786278000	54037.847279	54044.440253	54025.202444	54039.267456
1107	DXY	300	1786278000	99.605227	99.617534	99.597015	99.597015
2560	DXY	300	1786321800	99.635566	99.656673	99.620385	99.639273
1832	SP500	300	1786320600	7757.637101	7758.878048	7756.212504	7757.315163
1833	DOW	300	1786320600	54043.864687	54049.615183	54026.567732	54037.974581
1834	DXY	300	1786320600	99.635158	99.639000	99.605597	99.621463
2378	SP500	300	1786321500	7757.022469	7759.088349	7756.130267	7758.632838
2379	DOW	300	1786321500	54039.404756	54046.471381	54025.383836	54034.094803
2380	DXY	300	1786321500	99.610757	99.641503	99.607505	99.635175
2012	SP500	300	1786320900	7757.391231	7759.431425	7755.774700	7757.315051
2013	DOW	300	1786320900	54038.819369	54050.637186	54026.748049	54034.059287
1471	SP500	300	1786278600	7758.170845	7759.086563	7755.924402	7757.621363
2014	DXY	300	1786320900	99.622595	99.632179	99.609108	99.620362
1727	SP500	300	1786320300	7757.640000	7758.661995	7755.949879	7757.571738
1472	DOW	300	1786278600	54030.700483	54045.146131	54025.930251	54038.452687
1473	DXY	300	1786278600	99.603895	99.612060	99.596623	99.601883
1728	DOW	300	1786320300	54036.930000	54045.802595	54031.159478	54045.802595
2921	SP500	300	1786322400	7758.370273	7758.976246	7756.354733	7758.051077
2922	DOW	300	1786322400	54041.340467	54049.374446	54028.716835	54039.935076
2923	DXY	300	1786322400	99.641736	99.657564	99.629534	99.638008
3101	SP500	300	1786322700	7758.201337	7758.807601	7755.940871	7758.208814
3102	DOW	300	1786322700	54041.712778	54044.083120	54026.020657	54036.860149
3103	DXY	300	1786322700	99.639717	99.656681	99.634359	99.650134
3822	SP500	300	1786323900	7756.987285	7759.183772	7756.050904	7758.027118
3823	DOW	300	1786323900	54029.132723	54043.778866	54026.184931	54039.721067
3642	SP500	300	1786323600	7757.345437	7759.128742	7756.007917	7757.283007
3824	DXY	300	1786323900	99.634474	99.640117	99.613137	99.625608
4005	SP500	300	1786324200	7757.864778	7759.091094	7756.305051	7757.043355
4006	DOW	300	1786324200	54038.227966	54047.830046	54026.401666	54036.700549
3643	DOW	300	1786323600	54040.993253	54045.375554	54028.122896	54030.552835
3644	DXY	300	1786323600	99.638248	99.642002	99.614376	99.633255
4007	DXY	300	1786324200	99.623975	99.672598	99.612451	99.652142
4188	SP500	300	1786324500	7757.061215	7759.185914	7756.124378	7757.601008
4189	DOW	300	1786324500	54034.800779	54042.435649	54027.136344	54034.716564
4190	DXY	300	1786324500	99.654059	99.685332	99.650005	99.668222
4359	SP500	300	1786422900	7753.110000	7754.321178	7752.514405	7753.186837
4360	DOW	300	1786422900	53975.980000	53980.503236	53966.627391	53973.779575
4361	DXY	300	1786422900	99.778000	99.783068	99.766021	99.776368
4413	SP500	300	1786423200	7753.172427	7754.164224	7751.880751	7753.391327
4414	DOW	300	1786423200	53973.718665	53987.202384	53964.765975	53976.941079
7260	SP500	300	1786669200	7798.277107	7800.827430	7797.048953	7798.837133
7261	DOW	300	1786669200	53842.642642	53847.606901	53830.767299	53843.625015
5868	SP500	300	1786610100	7748.843694	7750.273143	7747.179458	7748.796575
5869	DOW	300	1786610100	53770.469928	53779.811902	53761.296910	53773.598093
5870	DXY	300	1786610100	99.989731	99.996369	99.979142	99.981828
7262	DXY	300	1786669200	99.898109	99.915313	99.878727	99.885055
6231	SP500	300	1786610700	7748.796770	7750.104228	7746.449955	7748.894488
6232	DOW	300	1786610700	53766.869052	53786.884240	53758.817724	53778.211983
6233	DXY	300	1786610700	99.977223	99.989712	99.962541	99.962541
5130	SP500	300	1786424400	7752.442202	7754.433951	7751.862072	7752.947182
5131	DOW	300	1786424400	53971.321707	53989.164506	53964.523404	53980.348280
5132	DXY	300	1786424400	99.817222	99.829633	99.802825	99.802825
6597	SP500	300	1786611300	7748.910915	7749.410129	7747.058729	7749.154239
6598	DOW	300	1786611300	53763.228118	53775.663429	53757.308108	53770.123412
6599	DXY	300	1786611300	99.978607	99.982752	99.952090	99.956940
4770	SP500	300	1786423800	7752.873926	7754.460916	7751.364013	7751.988743
4771	DOW	300	1786423800	53975.475461	53988.990088	53968.632343	53971.066838
4772	DXY	300	1786423800	99.794427	99.816864	99.786157	99.811787
8709	SP500	300	1786671600	7799.170767	7800.496191	7797.428855	7799.428376
8710	DOW	300	1786671600	53841.936919	53853.610971	53831.020025	53838.306105
7443	SP500	300	1786669500	7798.968100	7800.753098	7797.956112	7799.261632
7444	DOW	300	1786669500	53843.134736	53847.503275	53830.602911	53841.064183
7445	DXY	300	1786669500	99.883456	99.892343	99.868190	99.873300
6048	SP500	300	1786610400	7748.673053	7749.431266	7746.718840	7748.657464
6049	DOW	300	1786610400	53775.356629	53777.984842	53764.780426	53768.928833
6050	DXY	300	1786610400	99.982090	99.996516	99.972004	99.977364
8163	SP500	300	1786670700	7797.940501	7800.282803	7797.650799	7799.120137
7623	SP500	300	1786669800	7799.142286	7800.494118	7797.392092	7798.781600
7077	SP500	300	1786668900	7799.299816	7800.376202	7797.436861	7798.389804
7078	DOW	300	1786668900	53834.146211	53850.017023	53829.872780	53841.048251
5676	SP500	300	1786425300	7752.746715	7754.253790	7752.144130	7752.761205
5677	DOW	300	1786425300	53974.539932	53981.699621	53964.118846	53978.331080
4415	DXY	300	1786423200	99.774448	99.791610	99.768031	99.790657
5493	SP500	300	1786425000	7753.188093	7754.109680	7751.863591	7752.628051
5494	DOW	300	1786425000	53979.405878	53984.533636	53967.361778	53973.033412
5495	DXY	300	1786425000	99.793009	99.809983	99.779968	99.800648
4950	SP500	300	1786424100	7751.737576	7754.350539	7751.534917	7752.149676
4951	DOW	300	1786424100	53972.789875	53982.318965	53963.915678	53973.393628
4952	DXY	300	1786424100	99.810092	99.821952	99.782491	99.817436
4590	SP500	300	1786423500	7753.432143	7754.669180	7751.711096	7752.835148
4591	DOW	300	1786423500	53975.642372	53986.860289	53967.565494	53974.491072
4592	DXY	300	1786423500	99.788180	99.804858	99.780578	99.793892
5678	DXY	300	1786425300	99.799678	99.806211	99.790773	99.797964
7079	DXY	300	1786668900	99.897385	99.908854	99.885436	99.899636
6963	SP500	300	1786611900	7748.210534	7749.751438	7746.734704	7748.500000
5310	SP500	300	1786424700	7753.072955	7754.713558	7751.750678	7753.491860
5311	DOW	300	1786424700	53979.085442	53985.445987	53966.940670	53978.878828
5312	DXY	300	1786424700	99.801796	99.810905	99.782684	99.794443
6964	DOW	300	1786611900	53774.433552	53777.704909	53762.246984	53770.270000
6965	DXY	300	1786611900	99.980587	99.990973	99.965008	99.984000
5739	SP500	300	1786609800	7748.500000	7750.363874	7747.562016	7748.634454
5740	DOW	300	1786609800	53770.270000	53778.645548	53764.977905	53769.554131
5741	DXY	300	1786609800	99.988000	100.006665	99.979092	99.989818
6780	SP500	300	1786611600	7749.162616	7749.802091	7747.114095	7748.384052
6781	DOW	300	1786611600	53768.096665	53779.571837	53762.475604	53775.798210
6782	DXY	300	1786611600	99.954617	99.979367	99.954013	99.979367
7074	SP500	300	1786668600	7798.990000	7799.507608	7798.990000	7799.507608
7075	DOW	300	1786668600	53839.990000	53839.990000	53835.891298	53835.891298
7076	DXY	300	1786668600	99.896000	99.898046	99.894073	99.898046
7624	DOW	300	1786669800	53841.557548	53846.005002	53829.014163	53836.680199
7625	DXY	300	1786669800	99.871234	99.901472	99.868361	99.891276
6414	SP500	300	1786611000	7748.715842	7749.756815	7747.426686	7748.636816
6415	DOW	300	1786611000	53777.954673	53779.457774	53760.245548	53763.372130
6416	DXY	300	1786611000	99.964283	99.983605	99.955657	99.977135
8164	DOW	300	1786670700	53837.470434	53847.838923	53829.700211	53837.391535
8165	DXY	300	1786670700	99.922483	99.931957	99.895597	99.923661
7983	SP500	300	1786670400	7798.451707	7800.692928	7797.829921	7798.213551
7984	DOW	300	1786670400	53838.758341	53847.775962	53829.671607	53837.679803
7985	DXY	300	1786670400	99.907929	99.928231	99.897830	99.921892
7803	SP500	300	1786670100	7798.874017	7800.353580	7797.404058	7798.741206
7804	DOW	300	1786670100	53834.586207	53847.905216	53832.795677	53838.694082
7805	DXY	300	1786670100	99.893229	99.917925	99.893229	99.906240
8343	SP500	300	1786671000	7799.359513	7800.309945	7797.509960	7799.410161
8344	DOW	300	1786671000	53837.357844	53847.846249	53826.700905	53839.843393
8345	DXY	300	1786671000	99.925349	99.946110	99.915471	99.929974
8526	SP500	300	1786671300	7799.427155	7800.286758	7797.929882	7799.057205
8527	DOW	300	1786671300	53838.516641	53845.735234	53828.432695	53840.266339
8711	DXY	300	1786671600	99.913877	99.937647	99.895601	99.905994
8890	DOW	300	1786671900	53839.451961	53847.752435	53830.889314	53834.336051
8891	DXY	300	1786671900	99.905405	99.907950	99.880180	99.900025
8528	DXY	300	1786671300	99.929291	99.939090	99.910971	99.915685
8889	SP500	300	1786671900	7799.613242	7799.931052	7798.081825	7799.133208
9066	SP500	300	1786672200	7798.964847	7799.839389	7797.794959	7798.364391
9067	DOW	300	1786672200	53834.966313	53846.632553	53830.625108	53841.803772
9068	DXY	300	1786672200	99.901970	99.920842	99.890584	99.903307
9249	SP500	300	1786672500	7798.599445	7800.521511	7797.685471	7799.053808
9250	DOW	300	1786672500	53841.697652	53851.014778	53831.566103	53839.804383
9251	DXY	300	1786672500	99.903843	99.917550	99.889079	99.909511
9432	SP500	300	1786672800	7799.140290	7800.467084	7797.171080	7799.054013
11990	DXY	300	1786677000	99.916221	99.929006	99.899615	99.904860
9798	SP500	300	1786673400	7798.314120	7799.768295	7797.627378	7798.952226
9799	DOW	300	1786673400	53838.938904	53847.172712	53827.217475	53836.383845
9800	DXY	300	1786673400	99.927318	99.929121	99.903959	99.915599
10161	SP500	300	1786674000	7798.589422	7800.191169	7797.583160	7798.243759
10162	DOW	300	1786674000	53841.060900	53846.265458	53831.509367	53842.816311
10163	DXY	300	1786674000	99.909447	99.916000	99.898529	99.911368
11622	SP500	300	1786676400	7799.057414	7800.800667	7797.858837	7798.964356
11439	SP500	300	1786676100	7799.759725	7800.361701	7797.410573	7798.937224
11440	DOW	300	1786676100	53837.780881	53851.191859	53831.309489	53831.309489
11441	DXY	300	1786676100	99.890948	99.919768	99.885840	99.894978
11623	DOW	300	1786676400	53831.891012	53851.689310	53829.794517	53840.803578
11624	DXY	300	1786676400	99.896861	99.918801	99.893862	99.913447
12170	DXY	300	1786677300	99.905489	99.913609	99.892336	99.909413
13262	DXY	300	1786679100	99.879547	99.897820	99.862060	99.879596
11256	SP500	300	1786675800	7797.348937	7800.848610	7797.149538	7799.449678
11257	DOW	300	1786675800	53836.914483	53851.102042	53830.452694	53837.672535
11258	DXY	300	1786675800	99.888725	99.901447	99.874992	99.889638
9433	DOW	300	1786672800	53841.630919	53847.442879	53827.512507	53839.166651
9434	DXY	300	1786672800	99.907582	99.910824	99.890350	99.895852
9978	SP500	300	1786673700	7799.102527	7800.024677	7797.587771	7798.547033
9979	DOW	300	1786673700	53834.948193	53845.375574	53830.625901	53840.443769
9980	DXY	300	1786673700	99.915933	99.927945	99.904188	99.910747
12714	SP500	300	1786678200	7799.972820	7800.205403	7797.905587	7799.240997
10710	SP500	300	1786674900	7799.588975	7800.502875	7797.822475	7799.516898
10711	DOW	300	1786674900	53842.565389	53848.497807	53826.780832	53839.580900
10712	DXY	300	1786674900	99.907596	99.909686	99.885945	99.905017
10527	SP500	300	1786674600	7798.293549	7800.260619	7797.716978	7799.451808
10528	DOW	300	1786674600	53839.524072	53848.500339	53831.710657	53842.031220
10529	DXY	300	1786674600	99.912052	99.920221	99.895996	99.907464
9615	SP500	300	1786673100	7799.161385	7800.270381	7797.772466	7798.084977
9616	DOW	300	1786673100	53839.747011	53849.265608	53832.100925	53837.826778
9617	DXY	300	1786673100	99.894146	99.928399	99.893046	99.928399
12715	DOW	300	1786678200	53841.579710	53847.627256	53832.210166	53837.371086
12716	DXY	300	1786678200	99.904741	99.904760	99.871448	99.884241
10344	SP500	300	1786674300	7798.508485	7800.737757	7797.390625	7798.462904
10345	DOW	300	1786674300	53844.028361	53847.645327	53827.734142	53837.849186
10346	DXY	300	1786674300	99.912212	99.917235	99.894094	99.910241
10890	SP500	300	1786675200	7799.471074	7800.194669	7797.650975	7798.059113
10891	DOW	300	1786675200	53841.552269	53848.007646	53831.687602	53840.326401
10892	DXY	300	1786675200	99.904610	99.909539	99.890150	99.890835
11805	SP500	300	1786676700	7798.668526	7800.373195	7797.570040	7798.581218
11806	DOW	300	1786676700	53840.999297	53848.433924	53829.447675	53838.809381
11807	DXY	300	1786676700	99.911047	99.936623	99.907008	99.917503
12351	SP500	300	1786677600	7798.516810	7800.042881	7797.489886	7799.044866
12352	DOW	300	1786677600	53830.304916	53849.810018	53829.683009	53840.431691
12353	DXY	300	1786677600	99.907113	99.923293	99.894012	99.907775
12531	SP500	300	1786677900	7798.765763	7800.224014	7797.820028	7800.178130
11073	SP500	300	1786675500	7798.112641	7799.909739	7797.513681	7797.513681
11074	DOW	300	1786675500	53842.331256	53850.535339	53828.412526	53837.018358
11075	DXY	300	1786675500	99.889875	99.910897	99.885624	99.890700
12532	DOW	300	1786677900	53842.119787	53851.247556	53830.550446	53843.008871
12533	DXY	300	1786677900	99.905528	99.912308	99.892103	99.907057
14174	DXY	300	1786680600	99.877560	99.897310	99.868623	99.879191
13623	SP500	300	1786679700	7799.662447	7800.299328	7797.377239	7798.888500
13624	DOW	300	1786679700	53842.370353	53848.405090	53829.984723	53838.805428
13625	DXY	300	1786679700	99.892098	99.897868	99.872821	99.887285
13080	SP500	300	1786678800	7799.624217	7800.121340	7796.894081	7799.672648
13081	DOW	300	1786678800	53842.950169	53848.385085	53827.039917	53844.093430
13082	DXY	300	1786678800	99.872556	99.889101	99.866782	99.881697
11988	SP500	300	1786677000	7798.429952	7800.132909	7797.817426	7798.316348
11989	DOW	300	1786677000	53839.031132	53846.577625	53827.863772	53839.662737
12168	SP500	300	1786677300	7798.018142	7800.896522	7797.562337	7798.385562
12169	DOW	300	1786677300	53837.904960	53850.346894	53829.943948	53831.901716
12897	SP500	300	1786678500	7799.468731	7800.546156	7797.346298	7799.721786
12898	DOW	300	1786678500	53839.192778	53847.638381	53832.871489	53841.221821
12899	DXY	300	1786678500	99.886147	99.897808	99.867203	99.872965
14173	DOW	300	1786680600	53836.454415	53849.162873	53832.396145	53840.258292
14172	SP500	300	1786680600	7798.895909	7800.457067	7797.228822	7800.457067
13440	SP500	300	1786679400	7798.498765	7799.901808	7797.546955	7799.474552
13260	SP500	300	1786679100	7799.430531	7800.531336	7797.226669	7798.735221
13261	DOW	300	1786679100	53842.625223	53852.226434	53832.091651	53848.822092
13441	DOW	300	1786679400	53850.381140	53854.068359	53828.587650	53842.743955
13442	DXY	300	1786679400	99.879715	99.896580	99.873569	99.893744
13806	SP500	300	1786680000	7798.875143	7800.474867	7797.841641	7799.592321
13807	DOW	300	1786680000	53839.469089	53847.714236	53830.551960	53834.687582
13808	DXY	300	1786680000	99.889714	99.903123	99.875372	99.893954
13989	SP500	300	1786680300	7799.458245	7800.444163	7797.672604	7798.839245
13990	DOW	300	1786680300	53834.098055	53847.959455	53829.332997	53835.306544
13991	DXY	300	1786680300	99.895239	99.904669	99.875985	99.875985
14355	SP500	300	1786680900	7800.706505	7800.706505	7797.606741	7798.930726
14356	DOW	300	1786680900	53841.324801	53849.773646	53829.113637	53839.539694
14357	DXY	300	1786680900	99.879799	99.890856	99.860776	99.869143
14538	SP500	300	1786681200	7798.939688	7800.162992	7797.341349	7798.852062
14539	DOW	300	1786681200	53839.209504	53850.038772	53829.252107	53842.554546
14540	DXY	300	1786681200	99.870268	99.879018	99.854675	99.862684
14721	SP500	300	1786681500	7798.746876	7800.478255	7797.634895	7798.223638
14722	DOW	300	1786681500	53842.729319	53851.086306	53830.382078	53840.479017
14723	DXY	300	1786681500	99.864852	99.880819	99.859662	99.880471
19211	DXY	300	1786689300	99.855190	99.873389	99.845135	99.849327
19942	DOW	300	1786690500	53834.956085	53849.952926	53830.547604	53847.306872
17025	SP500	300	1786685700	7798.316006	7799.750158	7797.669643	7799.588993
17026	DOW	300	1786685700	53838.273844	53851.269326	53833.497651	53845.622896
16545	SP500	300	1786684800	7798.768302	7800.647386	7798.274889	7798.598342
16546	DOW	300	1786684800	53840.490366	53847.644818	53831.883444	53840.566025
16547	DXY	300	1786684800	99.864312	99.867695	99.845271	99.863777
16002	SP500	300	1786683900	7798.720057	7800.442375	7797.535849	7800.442375
15279	SP500	300	1786682700	7798.833525	7800.720340	7797.820873	7799.140099
15280	DOW	300	1786682700	53839.894288	53851.258312	53829.902927	53843.715341
15281	DXY	300	1786682700	99.870887	99.879908	99.858269	99.866801
16003	DOW	300	1786683900	53839.764628	53849.063775	53832.573543	53835.800246
16004	DXY	300	1786683900	99.861013	99.884174	99.851772	99.879010
15822	SP500	300	1786683600	7798.191146	7800.344221	7796.996947	7798.970809
15823	DOW	300	1786683600	53839.972357	53849.219697	53830.387073	53837.678681
15824	DXY	300	1786683600	99.886646	99.887286	99.858811	99.862995
14988	SP500	300	1786682100	7798.990000	7800.559967	7797.856837	7798.714798
14989	DOW	300	1786682100	53839.990000	53846.344750	53829.245464	53836.393782
14990	DXY	300	1786682100	99.881000	99.894520	99.869687	99.884042
17027	DXY	300	1786685700	99.855359	99.870657	99.840861	99.855586
15639	SP500	300	1786683300	7798.979567	7800.892823	7797.289389	7798.349341
15640	DOW	300	1786683300	53841.216546	53848.064433	53830.721946	53840.968356
15641	DXY	300	1786683300	99.881020	99.884662	99.865733	99.884163
18297	SP500	300	1786687800	7798.237571	7800.093312	7797.937885	7798.651223
18298	DOW	300	1786687800	53847.077855	53851.924326	53828.680604	53829.556481
16179	SP500	300	1786684200	7800.566189	7800.723358	7797.073466	7798.703120
16180	DOW	300	1786684200	53837.697111	53852.834362	53828.488930	53837.896366
16181	DXY	300	1786684200	99.878276	99.884878	99.853504	99.868978
18299	DXY	300	1786687800	99.840575	99.843520	99.814900	99.825066
15099	SP500	300	1786682400	7798.410787	7800.659044	7797.339858	7798.745425
15100	DOW	300	1786682400	53835.053917	53849.346058	53832.027632	53838.510830
15101	DXY	300	1786682400	99.882579	99.897637	99.863840	99.871265
19026	SP500	300	1786689000	7798.187799	7800.681233	7797.852006	7799.393062
15459	SP500	300	1786683000	7798.879405	7799.958046	7797.558566	7799.077075
15460	DOW	300	1786683000	53845.513893	53851.803722	53831.933597	53840.288033
15461	DXY	300	1786683000	99.865668	99.883798	99.854272	99.881148
19027	DOW	300	1786689000	53836.695421	53848.036511	53829.477518	53838.524108
18660	SP500	300	1786688400	7799.123659	7800.385671	7797.516651	7799.483256
18661	DOW	300	1786688400	53835.051750	53847.815416	53834.838022	53840.294348
18477	SP500	300	1786688100	7798.412293	7800.229360	7797.932669	7799.019250
18478	DOW	300	1786688100	53830.518202	53848.425851	53827.658717	53836.434659
18479	DXY	300	1786688100	99.824535	99.837075	99.810225	99.833544
18117	SP500	300	1786687500	7799.091723	7800.443559	7797.510981	7798.302318
17568	SP500	300	1786686600	7799.798379	7800.709128	7797.215826	7799.900587
14904	SP500	300	1786681800	7798.135544	7799.815449	7798.010546	7798.582864
14905	DOW	300	1786681800	53840.986624	53847.956167	53827.762791	53839.368430
14906	DXY	300	1786681800	99.879449	99.882678	99.863018	99.871584
17569	DOW	300	1786686600	53839.457975	53852.512234	53829.196182	53845.077859
17570	DXY	300	1786686600	99.842287	99.858534	99.831911	99.852139
16362	SP500	300	1786684500	7798.757246	7800.125156	7797.114998	7798.996586
16363	DOW	300	1786684500	53836.787695	53847.178231	53832.059939	53840.958836
16364	DXY	300	1786684500	99.866877	99.881445	99.852285	99.866723
16671	SP500	300	1786685100	7798.990000	7800.208510	7797.594829	7800.068502
16672	DOW	300	1786685100	53839.990000	53847.392106	53830.633276	53837.069364
16673	DXY	300	1786685100	99.861000	99.872207	99.848829	99.851534
18118	DOW	300	1786687500	53837.280747	53854.323808	53824.890871	53845.672467
16842	SP500	300	1786685400	7799.861932	7800.625123	7797.592972	7798.050939
16843	DOW	300	1786685400	53836.503114	53854.463939	53830.590030	53838.894768
16844	DXY	300	1786685400	99.853566	99.868021	99.849615	99.854331
18119	DXY	300	1786687500	99.840970	99.858698	99.834906	99.841442
17205	SP500	300	1786686000	7799.543134	7800.287575	7797.754198	7797.999103
17206	DOW	300	1786686000	53844.563000	53848.816752	53828.492276	53845.832518
17207	DXY	300	1786686000	99.857515	99.863822	99.842970	99.858960
17934	SP500	300	1786687200	7798.513978	7800.269193	7797.872111	7799.213607
17935	DOW	300	1786687200	53831.258786	53848.619267	53830.191654	53836.962320
17751	SP500	300	1786686900	7799.915313	7800.011531	7797.750562	7798.638319
17752	DOW	300	1786686900	53844.827407	53851.725396	53831.886962	53831.886962
17385	SP500	300	1786686300	7797.880041	7800.766363	7796.961997	7799.651001
17753	DXY	300	1786686900	99.853335	99.859394	99.830216	99.845953
17386	DOW	300	1786686300	53846.172110	53847.895895	53832.996947	53840.634020
17387	DXY	300	1786686300	99.856930	99.868802	99.840144	99.841095
17936	DXY	300	1786687200	99.844971	99.852870	99.834147	99.839487
18662	DXY	300	1786688400	99.833375	99.843064	99.814561	99.827562
18843	SP500	300	1786688700	7799.675554	7800.224476	7797.692477	7798.294119
18844	DOW	300	1786688700	53839.744816	53849.658590	53832.587344	53837.469365
18845	DXY	300	1786688700	99.828982	99.849388	99.828136	99.837579
19209	SP500	300	1786689300	7799.191599	7800.415523	7797.714510	7800.415523
19210	DOW	300	1786689300	53838.018334	53852.962955	53834.064764	53843.646835
19028	DXY	300	1786689000	99.838475	99.860052	99.830704	99.856239
19392	SP500	300	1786689600	7800.486599	7800.874139	7797.856523	7798.776891
19393	DOW	300	1786689600	53841.801865	53852.142667	53831.376855	53836.529706
19394	DXY	300	1786689600	99.851210	99.855648	99.831952	99.839249
19575	SP500	300	1786689900	7798.962401	7800.201831	7797.028922	7797.520622
19576	DOW	300	1786689900	53834.679893	53850.874777	53832.065662	53843.983993
19577	DXY	300	1786689900	99.841218	99.847496	99.819968	99.830278
19758	SP500	300	1786690200	7797.454078	7800.570532	7797.454078	7798.621484
19759	DOW	300	1786690200	53842.248466	53850.531138	53827.636200	53835.539641
19760	DXY	300	1786690200	99.832660	99.856219	99.822493	99.824546
19941	SP500	300	1786690500	7798.889434	7800.197199	7797.500524	7799.403929
23708	DXY	300	1788323700	99.796842	99.805266	99.785768	99.797360
23526	SP500	300	1788323400	7631.321535	7632.927734	7630.250523	7631.615410
21939	SP500	300	1786761600	7785.851432	7787.644497	7784.648649	7785.036831
21940	DOW	300	1786761600	53729.882808	53743.633264	53723.952507	53735.830467
21941	DXY	300	1786761600	99.635692	99.651186	99.626393	99.638988
20667	SP500	300	1786691700	7800.081127	7800.453522	7797.387059	7799.089961
20668	DOW	300	1786691700	53845.141990	53848.630830	53828.749376	53848.630830
20669	DXY	300	1786691700	99.788231	99.823795	99.785916	99.801034
23527	DOW	300	1788323400	52765.877608	52780.130206	52754.303544	52766.495768
20304	SP500	300	1786691100	7799.219629	7800.638942	7797.416865	7797.416865
20305	DOW	300	1786691100	53828.785767	53849.820640	53828.785767	53840.930911
20306	DXY	300	1786691100	99.838804	99.841327	99.806261	99.814373
22737	SP500	300	1788307500	7631.470000	7632.645982	7630.734246	7631.935888
21762	SP500	300	1786761300	7786.362236	7787.003409	7784.459183	7786.029745
21763	DOW	300	1786761300	53731.088816	53740.057762	53726.012494	53730.999655
21764	DXY	300	1786761300	99.633061	99.645984	99.623322	99.636608
22738	DOW	300	1788307500	52766.880000	52775.247030	52761.329005	52767.285502
22739	DXY	300	1788307500	99.668000	99.685673	99.657021	99.677751
21393	SP500	300	1786692900	7799.290425	7800.538488	7797.687665	7799.112763
21213	SP500	300	1786692600	7798.277649	7800.395660	7797.763048	7799.417831
21214	DOW	300	1786692600	53833.674903	53851.419418	53831.100771	53836.886860
21215	DXY	300	1786692600	99.797180	99.824741	99.782517	99.812059
21394	DOW	300	1786692900	53838.472267	53850.641058	53826.437736	53840.093210
21395	DXY	300	1786692900	99.814534	99.822136	99.794817	99.803126
21033	SP500	300	1786692300	7799.825053	7801.235025	7797.608560	7798.526624
21034	DOW	300	1786692300	53850.688703	53852.495564	53830.678500	53834.144996
21035	DXY	300	1786692300	99.799328	99.823217	99.786322	99.798888
20487	SP500	300	1786691400	7797.242782	7800.098439	7797.242782	7799.822873
20488	DOW	300	1786691400	53840.601268	53848.259331	53830.166546	53843.466081
20489	DXY	300	1786691400	99.815173	99.816490	99.784511	99.787607
19943	DXY	300	1786690500	99.823198	99.844299	99.815157	99.823986
23528	DXY	300	1788323400	99.799771	99.813402	99.787252	99.796098
22122	SP500	300	1786761900	7785.174650	7787.109680	7784.562144	7785.720147
22123	DOW	300	1786761900	53736.116747	53747.950449	53726.784171	53731.788498
22124	DXY	300	1786761900	99.640356	99.652146	99.626962	99.628036
23346	SP500	300	1788323100	7631.868774	7632.886775	7630.126484	7631.188792
23347	DOW	300	1788323100	52766.594739	52777.372486	52758.869812	52767.658462
20850	SP500	300	1786692000	7799.387532	7800.004543	7797.243698	7799.789447
20851	DOW	300	1786692000	53848.218969	53850.524678	53828.261217	53850.524678
20852	DXY	300	1786692000	99.800882	99.806523	99.786266	99.800929
20121	SP500	300	1786690800	7799.518125	7800.192542	7797.721791	7799.198143
20122	DOW	300	1786690800	53845.921931	53852.296977	53827.895104	53830.201777
20123	DXY	300	1786690800	99.826063	99.841159	99.811263	99.841159
23348	DXY	300	1788323100	99.787984	99.801017	99.777788	99.799876
23274	SP500	300	1788322800	7631.470000	7632.683193	7630.765509	7631.586397
23275	DOW	300	1788322800	52766.880000	52769.927807	52761.156331	52765.672775
23276	DXY	300	1788322800	99.788000	99.796363	99.774578	99.785628
21708	SP500	300	1786761000	7785.760000	7787.601721	7784.959931	7786.417493
21709	DOW	300	1786761000	53732.410000	53740.350952	53725.112505	53733.238046
21573	SP500	300	1786693200	7799.209406	7800.311467	7797.883924	7799.834561
21574	DOW	300	1786693200	53838.664212	53849.729743	53831.159676	53849.729743
21575	DXY	300	1786693200	99.805274	99.820265	99.787888	99.803119
21710	DXY	300	1786761000	99.636000	99.641179	99.625418	99.635170
22785	SP500	300	1788307800	7631.974490	7632.927707	7630.373282	7631.096522
22786	DOW	300	1788307800	52766.359012	52774.541234	52754.566648	52767.986017
22671	SP500	300	1786762800	7785.363015	7786.835307	7784.128700	7785.723928
22672	DOW	300	1786762800	53732.003964	53742.589728	53717.197289	53738.290927
22673	DXY	300	1786762800	99.634536	99.646451	99.623800	99.635527
22488	SP500	300	1786762500	7785.937923	7787.301963	7784.744090	7785.280727
22489	DOW	300	1786762500	53734.331007	53745.617653	53721.147674	53732.666392
22490	DXY	300	1786762500	99.639514	99.649979	99.625081	99.634818
22305	SP500	300	1786762200	7785.785696	7787.447135	7784.947017	7785.829028
22306	DOW	300	1786762200	53731.603290	53741.866660	53721.405132	53734.349927
22307	DXY	300	1786762200	99.626969	99.645572	99.621648	99.640725
22787	DXY	300	1788307800	99.679028	99.698495	99.651479	99.663652
23145	SP500	300	1788308400	7630.970134	7633.629833	7630.429563	7631.690518
23146	DOW	300	1788308400	52765.716686	52778.823249	52758.811206	52765.082864
22965	SP500	300	1788308100	7630.849682	7632.584038	7630.476913	7630.984613
22966	DOW	300	1788308100	52766.419554	52778.665928	52758.637260	52763.958111
22967	DXY	300	1788308100	99.666137	99.714111	99.663627	99.693578
23147	DXY	300	1788308400	99.693124	99.716674	99.684384	99.699517
23813	DXY	300	1788336600	99.718000	99.724638	99.708026	99.717303
23888	DXY	300	1788336900	99.715228	99.734679	99.704006	99.723815
23706	SP500	300	1788323700	7631.400864	7632.564874	7630.171049	7631.840511
23707	DOW	300	1788323700	52767.080295	52773.380297	52757.651243	52763.500015
24252	SP500	300	1788337500	7631.012022	7632.753100	7630.585279	7632.173241
23811	SP500	300	1788336600	7631.470000	7632.315285	7630.453186	7631.067243
23812	DOW	300	1788336600	52766.880000	52773.601854	52758.961211	52765.561684
23886	SP500	300	1788336900	7631.311695	7632.798112	7630.460618	7631.199868
23887	DOW	300	1788336900	52763.873018	52778.260450	52756.377679	52768.161243
24069	SP500	300	1788337200	7631.399196	7632.427790	7630.271579	7630.911285
24070	DOW	300	1788337200	52769.421425	52775.896496	52757.070072	52764.632160
24071	DXY	300	1788337200	99.721649	99.741818	99.703187	99.735052
24253	DOW	300	1788337500	52763.082322	52775.857501	52753.062035	52770.049043
24254	DXY	300	1788337500	99.733689	99.744604	99.725234	99.733044
24355	DOW	300	1788407400	53061.900000	53070.012164	53052.841229	53062.340538
24356	DXY	300	1788407400	99.424000	99.434498	99.405599	99.411220
24354	SP500	300	1788407400	7666.600000	7667.937030	7665.365638	7667.004698
24531	SP500	300	1788407700	7666.739568	7667.606101	7664.781118	7666.396866
26169	SP500	300	1788410400	7666.230079	7666.777483	7665.797627	7666.250945
25263	SP500	300	1788408900	7666.935019	7668.248765	7665.776009	7666.060729
25264	DOW	300	1788408900	53058.755269	53068.730087	53051.286848	53059.914862
25265	DXY	300	1788408900	99.422038	99.437676	99.406473	99.414006
24897	SP500	300	1788408300	7666.359480	7668.080317	7665.332482	7666.035540
24898	DOW	300	1788408300	53062.632598	53073.133526	53053.670492	53062.998640
24899	DXY	300	1788408300	99.399210	99.426437	99.397620	99.406094
26170	DOW	300	1788410400	53057.779830	53072.302851	53056.233544	53060.700243
26171	DXY	300	1788410400	99.400785	99.402882	99.387400	99.400145
27533	DXY	300	1788424500	99.290004	99.293301	99.263044	99.268209
28256	DXY	300	1788426600	99.215000	99.231002	99.182740	99.217759
26196	SP500	300	1788422100	7666.600000	7667.431096	7665.588602	7667.243655
26197	DOW	300	1788422100	53061.950000	53065.338391	53053.195677	53064.309904
26198	DXY	300	1788422100	99.300000	99.316036	99.295129	99.297585
27897	SP500	300	1788425100	7667.090036	7667.748642	7665.346787	7666.695290
26622	SP500	300	1788423000	7665.806771	7667.435953	7665.346255	7666.244272
26623	DOW	300	1788423000	53055.925402	53070.394865	53046.005859	53061.292916
26624	DXY	300	1788423000	99.286133	99.312319	99.252200	99.261430
24532	DOW	300	1788407700	53062.630062	53070.237260	53054.315447	53057.958515
24533	DXY	300	1788407700	99.408892	99.429583	99.398758	99.408045
25806	SP500	300	1788409800	7666.659467	7668.344013	7665.090536	7666.217635
25807	DOW	300	1788409800	53059.225550	53070.363399	53054.338767	53056.532016
25808	DXY	300	1788409800	99.413668	99.417926	99.394206	99.404503
25080	SP500	300	1788408600	7666.211057	7667.713946	7665.196874	7666.961338
25081	DOW	300	1788408600	53064.279729	53072.779210	53052.350180	53057.452626
25082	DXY	300	1788408600	99.407523	99.432869	99.396456	99.420415
25626	SP500	300	1788409500	7667.167730	7668.249056	7664.960556	7666.425565
25627	DOW	300	1788409500	53059.811094	53073.807172	53051.278015	53060.383605
25628	DXY	300	1788409500	99.404411	99.431145	99.403374	99.413508
24714	SP500	300	1788408000	7666.447834	7668.603452	7665.561746	7666.405203
24715	DOW	300	1788408000	53058.677287	53067.927406	53052.834367	53062.208141
24716	DXY	300	1788408000	99.408774	99.418715	99.391229	99.400531
27351	SP500	300	1788424200	7665.947182	7668.030892	7664.821644	7666.294723
27352	DOW	300	1788424200	53058.157672	53072.620462	53053.040103	53059.263075
27353	DXY	300	1788424200	99.291127	99.298498	99.265635	99.292187
27168	SP500	300	1788423900	7666.396403	7667.645145	7665.201837	7666.159363
27169	DOW	300	1788423900	53060.552595	53071.098526	53049.219578	53056.966386
27170	DXY	300	1788423900	99.295545	99.307799	99.277792	99.289841
25986	SP500	300	1788410100	7666.212638	7667.954032	7665.633326	7666.397248
25987	DOW	300	1788410100	53056.551093	53069.051600	53053.767811	53055.912265
25988	DXY	300	1788410100	99.402863	99.416157	99.392118	99.403165
25443	SP500	300	1788409200	7665.992808	7668.160025	7665.114942	7667.359498
25444	DOW	300	1788409200	53058.455623	53070.178752	53051.609321	53060.376820
25445	DXY	300	1788409200	99.411822	99.426103	99.401225	99.404244
27898	DOW	300	1788425100	53061.757790	53073.428139	53050.985104	53061.663952
27899	DXY	300	1788425100	99.269564	99.287428	99.263609	99.277607
27714	SP500	300	1788424800	7666.922686	7667.965140	7665.280131	7666.784508
27715	DOW	300	1788424800	53063.039769	53068.985433	53050.499994	53062.440176
26805	SP500	300	1788423300	7666.360869	7667.940519	7665.180911	7665.564071
26806	DOW	300	1788423300	53063.127010	53075.340547	53052.053067	53064.221308
26807	DXY	300	1788423300	99.259322	99.271265	99.218693	99.231262
26439	SP500	300	1788422700	7667.638778	7668.071019	7665.067553	7665.903309
26256	SP500	300	1788422400	7667.097788	7667.787432	7664.878990	7667.787432
26257	DOW	300	1788422400	53065.436242	53074.373792	53052.946388	53059.045579
26258	DXY	300	1788422400	99.295707	99.311976	99.274793	99.276468
26440	DOW	300	1788422700	53060.799705	53073.538915	53052.935865	53056.890110
26441	DXY	300	1788422700	99.277511	99.295882	99.261157	99.284154
26985	SP500	300	1788423600	7665.344148	7667.821725	7665.044957	7666.357221
26986	DOW	300	1788423600	53065.348036	53071.948345	53053.765738	53062.236079
26987	DXY	300	1788423600	99.233246	99.304419	99.229364	99.295745
27716	DXY	300	1788424800	99.268318	99.283693	99.259000	99.268792
28973	DXY	300	1788490500	98.993713	99.002678	98.978487	98.990236
28074	SP500	300	1788426300	7666.783108	7667.183652	7664.361411	7666.378478
28075	DOW	300	1788426300	53064.060209	53072.882131	53055.029403	53057.234731
28076	DXY	300	1788426300	99.184701	99.217378	99.175460	99.202161
27531	SP500	300	1788424500	7666.549367	7668.143836	7664.969075	7666.791696
27532	DOW	300	1788424500	53058.558918	53074.718026	53052.553309	53063.580792
27993	SP500	300	1788426000	7666.600000	7667.648661	7665.490172	7666.540689
27994	DOW	300	1788426000	53061.950000	53070.941594	53054.208597	53063.712833
27995	DXY	300	1788426000	99.216000	99.225074	99.178314	99.185818
28533	SP500	300	1788489600	7747.710000	7749.063104	7746.883975	7747.710000
28606	DOW	300	1788489900	53687.613807	53697.637430	53677.521911	53686.110000
28437	SP500	300	1788426900	7666.600000	7667.690272	7665.230175	7666.162773
28438	DOW	300	1788426900	53061.950000	53073.154841	53057.692095	53061.211680
28254	SP500	300	1788426600	7666.600000	7667.606025	7665.366956	7667.265229
28255	DOW	300	1788426600	53061.950000	53071.574363	53051.669589	53052.049697
28788	SP500	300	1788490200	7747.413222	7749.649970	7746.357606	7747.710000
28605	SP500	300	1788489900	7747.480668	7749.510704	7746.519980	7747.710000
28534	DOW	300	1788489600	53686.110000	53693.390808	53679.096539	53686.110000
28439	DXY	300	1788426900	99.223000	99.246291	99.219066	99.231498
28535	DXY	300	1788489600	98.996000	99.003591	98.989101	98.998000
28607	DXY	300	1788489900	98.997003	99.005378	98.975944	98.986000
28789	DOW	300	1788490200	53685.774579	53693.518121	53672.780709	53686.110000
28790	DXY	300	1788490200	98.987238	98.999341	98.966679	98.994000
28971	SP500	300	1788490500	7747.509647	7749.064318	7746.820175	7747.027351
28972	DOW	300	1788490500	53684.526120	53697.489663	53677.195997	53681.631756
\.


--
-- Data for Name: inquiries; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.inquiries (id, user_id, title, content, reply, status, replied_by, replied_at, is_reply_read, created_at) FROM stdin;
\.


--
-- Data for Name: inquiry_templates; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.inquiry_templates (id, title, content, created_at) FROM stdin;
\.


--
-- Data for Name: login_history; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.login_history (id, user_id, username, ip, user_agent, login_at) FROM stdin;
9	c84ca9f9-1efe-4ff4-a37d-ff9c3237b279	111	45.67.97.10	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36	2026-07-07 00:57:50.210477
10	b74441c4-1858-43f0-afdc-fbfec02ce9d5	qwer123	45.67.97.205	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36	2026-07-07 01:29:14.690012
25	76a18cd5-62f2-4abd-9ce7-5397c05da8bd	lauom88	119.198.125.82	Mozilla/5.0 (Linux; Android 16; SM-S931N Build/BP4A.251205.006; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/149.0.7827.164 Mobile Safari/537.36 KAKAOTALK/26.5.3 (INAPP)	2026-07-08 01:31:52.003244
27	13553385-c4b7-46c6-a476-b3c2da2dbeed	qwer1234	45.67.97.18	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36	2026-07-08 04:26:37.887878
28	b74441c4-1858-43f0-afdc-fbfec02ce9d5	qwer123	45.67.97.18	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36	2026-07-08 04:26:56.112327
32	39be743b-bc70-4297-abb0-cb0e56c41d2f	조경해자양구	211.234.227.71	Mozilla/5.0 (Linux; Android 16; SM-S948N Build/BP4A.251205.006; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/149.0.7827.164 Mobile Safari/537.36 KAKAOTALK/26.5.3 (INAPP)	2026-07-08 23:49:33.643554
33	39be743b-bc70-4297-abb0-cb0e56c41d2f	조경해자양구	211.234.227.71	Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Mobile Safari/537.36	2026-07-08 23:51:59.533453
38	74852c63-bd9c-4a75-b98a-14f2ad7393c7	phcj	112.165.168.77	Mozilla/5.0 (Linux; Android 16; SM-S948N Build/BP4A.251205.006; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/149.0.7827.159 Mobile Safari/537.36 KAKAOTALK/26.5.3 (INAPP)	2026-07-10 04:09:36.345064
39	74852c63-bd9c-4a75-b98a-14f2ad7393c7	phcj	118.46.78.86	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36 Edg/150.0.0.0	2026-07-10 04:12:10.924882
40	b5c20bc7-20be-4e6c-8d1c-0cff218f1df8	3672	118.46.214.132	Mozilla/5.0 (Linux; Android 16; SM-S926N Build/BP2A.250605.031.A3; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/149.0.7827.160 Mobile Safari/537.36 KAKAOTALK/26.5.3 (INAPP)	2026-07-10 08:39:48.20709
41	b74441c4-1858-43f0-afdc-fbfec02ce9d5	qwer123	45.67.97.35	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36	2026-07-10 08:40:43.058956
42	c84ca9f9-1efe-4ff4-a37d-ff9c3237b279	111	45.67.97.153	Mozilla/5.0 (Linux; Android 13; SM-G981B) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Mobile Safari/537.36	2026-07-10 08:42:01.170187
43	74852c63-bd9c-4a75-b98a-14f2ad7393c7	phcj	61.253.85.79	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36 Edg/150.0.0.0	2026-07-10 20:31:58.669115
44	74852c63-bd9c-4a75-b98a-14f2ad7393c7	phcj	61.253.85.79	Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Mobile Safari/537.36	2026-07-12 06:02:26.405014
48	a37c84ff-be4e-48d9-ae99-1f6823d793ea	myg5454 	211.234.227.252	Mozilla/5.0 (Linux; Android 15; SM-G991N Build/AP3A.240905.015.A2; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/149.0.7827.159 Mobile Safari/537.36 KAKAOTALK/26.5.3 (INAPP)	2026-07-13 06:41:12.510448
49	74852c63-bd9c-4a75-b98a-14f2ad7393c7	phcj	118.46.78.86	Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Mobile Safari/537.36	2026-07-13 12:00:28.706256
50	1df9f2e7-8029-4302-9cf4-3625d0378d7a	sj0924	116.122.44.160	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36	2026-07-14 01:15:36.513614
51	80271ffa-4f8d-430e-b95e-fd9a456063ae	sn0618	220.65.239.134	Mozilla/5.0 (Linux; Android 16; SM-A346N Build/BP4A.251205.006; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/149.0.7827.159 Mobile Safari/537.36 KAKAOTALK/26.5.3 (INAPP)	2026-07-14 01:26:34.780811
53	1df9f2e7-8029-4302-9cf4-3625d0378d7a	sj0924	116.122.44.160	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36	2026-07-15 00:20:42.794235
54	cab56d54-635a-48c1-bfa5-e8da83724ea7	hwan2720	106.101.69.245	Mozilla/5.0 (Linux; Android 16; SM-S928N Build/BP2A.250605.031.A3; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/150.0.7871.46 Mobile Safari/537.36 KAKAOTALK/26.5.3 (INAPP)	2026-07-15 05:05:28.335862
56	f8d50cb0-b9c3-4343-bd68-825d0ac2546b	msp1010	122.45.126.71	Mozilla/5.0 (iPhone; CPU iPhone OS 18_7 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Mobile/15E148 Safari/604.1 KAKAOTALK/26.5.5 (INAPP)	2026-07-15 05:26:02.155661
57	738d9e1b-d3ba-4a3e-ae04-909b2f855b21	lauom	211.197.136.90	Mozilla/5.0 (Linux; Android 16; SM-S931N Build/BP4A.251205.006; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/149.0.7827.164 Mobile Safari/537.36 KAKAOTALK/26.5.3 (INAPP)	2026-07-15 07:34:20.823335
58	bee3ac98-a63b-4c68-a854-b69a6e74f3fc	kk123555	118.235.89.15	Mozilla/5.0 (Linux; Android 16; SM-S928N Build/BP4A.251205.006; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/150.0.7871.124 Mobile Safari/537.36 KAKAOTALK/26.5.3 (INAPP)	2026-07-20 02:14:28.51725
60	c84ca9f9-1efe-4ff4-a37d-ff9c3237b279	111	45.67.97.169	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36	2026-07-20 06:57:38.527243
61	9ee373bc-d591-4bc7-82e0-18c953b27d5c	luciferkr	121.149.78.209	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36	2026-07-21 00:32:00.402289
62	b74441c4-1858-43f0-afdc-fbfec02ce9d5	qwer123	45.67.97.215	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36	2026-07-22 01:47:01.968167
66	3007b845-7394-4cb1-81d7-7a5289591da2	ojm1199	121.140.82.26	Mozilla/5.0 (Linux; Android 16; SM-S918N Build/BP4A.251205.006; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/150.0.7871.124 Mobile Safari/537.36 KAKAOTALK/26.6.1 (INAPP)	2026-07-22 06:53:27.463544
67	3007b845-7394-4cb1-81d7-7a5289591da2	ojm1199	121.140.82.26	Mozilla/5.0 (Linux; Android 16; SM-S918N Build/BP4A.251205.006; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/150.0.7871.124 Mobile Safari/537.36 KAKAOTALK/26.6.1 (INAPP)	2026-07-22 07:20:52.648068
68	3172253b-a312-48ad-a3fd-3f7e036be9b1	Syj2394 	118.235.5.116	Mozilla/5.0 (Linux; Android 16; SM-F721N Build/BP2A.250605.031.A3; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/150.0.7871.46 Mobile Safari/537.36 KAKAOTALK/26.5.3 (INAPP)	2026-07-22 09:04:29.620724
69	b74441c4-1858-43f0-afdc-fbfec02ce9d5	qwer123	45.67.97.251	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36	2026-07-23 06:01:40.916913
70	55cd7cf5-4d59-4914-affa-f306a49ff5c2	크리스탈	211.234.200.72	Mozilla/5.0 (Linux; Android 15; SM-G996N Build/AP3A.240905.015.A2; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/150.0.7871.124 Mobile Safari/537.36 KAKAOTALK/26.6.1 (INAPP)	2026-07-23 08:25:45.57747
71	55cd7cf5-4d59-4914-affa-f306a49ff5c2	크리스탈	211.225.254.2	Mozilla/5.0 (Linux; Android 15; SM-G996N Build/AP3A.240905.015.A2; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/128.0.0.0 Whale/1.0.0.0 Crosswalk/29.128.0.29 Mobile Safari/537.36 NAVER(inapp; search; 2100; 12.22.1)	2026-07-24 00:17:27.423607
72	74852c63-bd9c-4a75-b98a-14f2ad7393c7	phcj	112.186.153.52	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36 Edg/150.0.0.0	2026-07-24 05:56:32.38488
73	74852c63-bd9c-4a75-b98a-14f2ad7393c7	phcj	112.186.153.52	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36 Edg/150.0.0.0	2026-07-24 06:03:33.127417
74	74852c63-bd9c-4a75-b98a-14f2ad7393c7	phcj	203.25.124.168	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36	2026-07-24 06:30:09.59645
75	680bfe1a-2a6d-4661-8111-c86c439f1598	fffsur	211.36.146.246	Mozilla/5.0 (Linux; Android 16; SM-F936N Build/BP2A.250605.031.A3; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/150.0.7871.124 Safari/537.36 KAKAOTALK/26.6.1 (INAPP)	2026-07-24 06:39:24.162489
76	680bfe1a-2a6d-4661-8111-c86c439f1598	fffsur	211.36.146.246	Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36	2026-07-24 06:43:02.235401
77	74852c63-bd9c-4a75-b98a-14f2ad7393c7	phcj	103.125.146.76	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36	2026-07-24 07:31:47.962203
78	13e0933f-cea5-4749-8f0b-181658ee5e2b	hyeri0806	211.35.199.30	Mozilla/5.0 (Linux; Android 16; SM-S911N Build/BP4A.251205.006; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/150.0.7871.124 Mobile Safari/537.36 KAKAOTALK/26.6.1 (INAPP)	2026-07-27 01:09:53.571264
79	74852c63-bd9c-4a75-b98a-14f2ad7393c7	phcj	211.235.64.54	Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Mobile Safari/537.36	2026-07-27 01:36:48.877623
80	b74441c4-1858-43f0-afdc-fbfec02ce9d5	qwer123	45.67.97.193	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36	2026-07-27 23:52:39.816827
81	f501ab5b-27c7-4682-8924-692946bf5e28	겨울비	118.235.91.144	Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Mobile Safari/537.36	2026-07-29 05:08:00.646879
82	f501ab5b-27c7-4682-8924-692946bf5e28	겨울비	118.235.91.144	Mozilla/5.0 (Linux; Android 16; SM-S931N Build/BP4A.251205.006; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/150.0.7871.181 Mobile Safari/537.36 KAKAOTALK/26.6.1 (INAPP)	2026-07-30 02:57:45.75726
83	3007b845-7394-4cb1-81d7-7a5289591da2	ojm1199	211.104.178.184	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36 Edg/150.0.0.0	2026-08-01 10:40:32.034635
84	13e0933f-cea5-4749-8f0b-181658ee5e2b	hyeri0806	194.114.136.62	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36	2026-08-03 02:24:21.961621
85	b74441c4-1858-43f0-afdc-fbfec02ce9d5	qwer123	45.67.97.175	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36	2026-08-05 01:37:26.975045
86	4439d992-3b0d-43a1-becd-8ef186b3d934	jongbae109	223.39.83.57	Mozilla/5.0 (Linux; Android 16; SM-S926N Build/BP4A.251205.006; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/150.0.7871.181 Mobile Safari/537.36 KAKAOTALK/26.6.3 (INAPP)	2026-08-05 03:32:22.975973
87	12b73c7f-9f06-4e98-9617-07cb693c2f4f	senskim81	118.235.11.169	Mozilla/5.0 (iPhone; CPU iPhone OS 26_5_2 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/26.5 Mobile/15E148 Safari/605.1 NAVER(inapp; search; 2100; 12.22.10; 15PROMAX)	2026-08-05 04:38:26.677667
88	12b73c7f-9f06-4e98-9617-07cb693c2f4f	senskim81	118.235.11.169	Mozilla/5.0 (iPhone; CPU iPhone OS 18_7 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Mobile/15E148 Safari/604.1 KAKAOTALK/26.6.4 (INAPP)	2026-08-05 04:54:46.436601
89	b74441c4-1858-43f0-afdc-fbfec02ce9d5	qwer123	45.67.97.37	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36	2026-08-05 06:34:57.132646
90	b74441c4-1858-43f0-afdc-fbfec02ce9d5	qwer123	45.67.97.204	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36	2026-08-05 06:49:41.931662
91	3007b845-7394-4cb1-81d7-7a5289591da2	ojm1199	45.67.97.143	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36	2026-08-06 01:41:24.352209
92	3007b845-7394-4cb1-81d7-7a5289591da2	ojm1199	211.104.178.184	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/151.0.0.0 Safari/537.36 Edg/151.0.0.0	2026-08-06 01:56:36.904905
\.


--
-- Data for Name: maintenance_symbols; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.maintenance_symbols (id, symbol, reason, started_at, created_by) FROM stdin;
\.


--
-- Data for Name: messages; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.messages (id, sender_id, receiver_id, title, content, is_read, created_at, deleted_for_user) FROM stdin;
\.


--
-- Data for Name: round_forced_directions; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.round_forced_directions (id, symbol, duration, round_number, forced_direction, date_key, created_at) FROM stdin;
1	SP500	300	217	display_up	2026-07-06	2026-07-06 09:04:34.024474
2	DOW	300	217	display_up	2026-07-06	2026-07-06 09:04:43.852492
3	DXY	300	217	display_up	2026-07-06	2026-07-06 09:04:45.35551
4	SP500	300	131	display_up	2026-07-07	2026-07-07 01:51:31.772092
6	SP500	300	193	display_down	2026-07-07	2026-07-07 07:02:24.993082
7	SP500	300	194	display_down	2026-07-07	2026-07-07 07:02:27.484597
8	SP500	300	195	display_down	2026-07-07	2026-07-07 07:02:34.221096
9	SP500	300	128	display_up	2026-07-08	2026-07-08 01:35:31.951218
10	SP500	300	129	display_up	2026-07-08	2026-07-08 01:35:33.955917
11	SP500	300	193	display_down	2026-07-08	2026-07-08 06:46:17.707923
12	SP500	300	194	display_down	2026-07-08	2026-07-08 06:46:20.226631
15	SP500	300	196	display_up	2026-07-08	2026-07-08 07:11:03.393189
16	SP500	300	195	display_down	2026-07-08	2026-07-08 07:14:10.435342
17	SP500	300	201	display_down	2026-07-08	2026-07-08 07:44:43.898019
19	SP500	300	128	display_up	2026-07-09	2026-07-09 01:27:25.744336
20	SP500	300	129	display_up	2026-07-09	2026-07-09 01:27:28.165503
21	SP500	300	127	display_up	2026-07-09	2026-07-09 01:34:06.094452
22	SP500	300	159	display_up	2026-07-09	2026-07-09 04:13:20.137401
23	SP500	300	193	display_down	2026-07-09	2026-07-09 06:26:18.090183
24	SP500	300	194	display_down	2026-07-09	2026-07-09 06:26:20.270454
25	SP500	300	195	display_up	2026-07-09	2026-07-09 06:26:23.009595
26	SP500	300	196	display_down	2026-07-09	2026-07-09 06:48:07.394161
27	SP500	300	127	display_down	2026-07-10	2026-07-10 01:08:16.23829
28	SP500	300	128	display_up	2026-07-10	2026-07-10 01:08:19.55761
29	SP500	300	129	display_down	2026-07-10	2026-07-10 01:08:23.512092
30	SP500	300	163	display_down	2026-07-10	2026-07-10 04:29:53.912696
31	SP500	300	185	display_up	2026-07-10	2026-07-10 06:18:42.56462
32	SP500	300	186	display_up	2026-07-10	2026-07-10 06:18:44.679216
33	SP500	300	187	display_down	2026-07-10	2026-07-10 06:18:46.740255
34	SP500	300	193	display_up	2026-07-10	2026-07-10 06:27:11.317941
35	SP500	300	194	display_down	2026-07-10	2026-07-10 06:27:13.659097
37	SP500	300	195	display_up	2026-07-10	2026-07-10 06:27:22.865642
38	SP500	300	216	display_up	2026-07-10	2026-07-10 08:58:46.076424
40	SP500	300	128	display_down	2026-07-13	2026-07-13 00:50:06.842997
41	SP500	300	129	display_up	2026-07-13	2026-07-13 00:50:08.912075
42	SP500	300	127	display_up	2026-07-13	2026-07-13 01:32:55.321123
43	SP500	300	163	display_up	2026-07-13	2026-07-13 04:31:32.424518
44	SP500	300	164	display_down	2026-07-13	2026-07-13 04:31:34.584777
45	SP500	300	165	display_down	2026-07-13	2026-07-13 04:31:36.591691
46	SP500	300	169	display_down	2026-07-13	2026-07-13 04:55:58.779442
47	SP500	300	170	display_down	2026-07-13	2026-07-13 04:56:02.07719
48	SP500	300	171	display_down	2026-07-13	2026-07-13 04:56:04.638282
50	SP500	300	194	display_up	2026-07-13	2026-07-13 06:25:52.444789
51	SP500	300	195	display_down	2026-07-13	2026-07-13 06:25:57.248181
54	SP500	300	193	display_down	2026-07-13	2026-07-13 07:03:57.252802
55	SP500	300	127	display_down	2026-07-14	2026-07-14 00:59:26.977691
56	SP500	300	128	display_up	2026-07-14	2026-07-14 00:59:30.395601
57	SP500	300	129	display_up	2026-07-14	2026-07-14 00:59:32.46261
58	SP500	300	163	display_down	2026-07-14	2026-07-14 04:29:26.234318
59	SP500	300	164	display_down	2026-07-14	2026-07-14 04:29:28.432615
60	SP500	300	165	display_up	2026-07-14	2026-07-14 04:29:31.114533
61	SP500	300	166	display_up	2026-07-14	2026-07-14 04:29:33.198236
62	SP500	300	193	display_down	2026-07-14	2026-07-14 06:32:05.936983
63	SP500	300	194	display_down	2026-07-14	2026-07-14 06:32:10.420923
64	SP500	300	195	display_up	2026-07-14	2026-07-14 06:32:13.405193
65	SP500	300	127	display_up	2026-07-15	2026-07-15 01:04:58.215885
66	SP500	300	128	display_up	2026-07-15	2026-07-15 01:05:00.359113
67	SP500	300	129	display_down	2026-07-15	2026-07-15 01:05:03.362985
68	SP500	300	157	display_down	2026-07-15	2026-07-15 03:41:53.055108
69	SP500	300	158	display_down	2026-07-15	2026-07-15 03:41:55.396445
70	SP500	300	159	display_up	2026-07-15	2026-07-15 03:41:57.725687
71	SP500	300	163	display_down	2026-07-15	2026-07-15 04:29:29.553055
72	SP500	300	164	display_down	2026-07-15	2026-07-15 04:29:31.839048
73	SP500	300	165	display_up	2026-07-15	2026-07-15 04:29:46.895134
74	SP500	300	193	display_down	2026-07-15	2026-07-15 06:49:32.154322
75	SP500	300	194	display_up	2026-07-15	2026-07-15 06:49:34.192599
76	SP500	300	195	display_down	2026-07-15	2026-07-15 06:49:37.471724
77	SP500	300	198	display_up	2026-07-15	2026-07-15 07:29:05.622645
78	SP500	300	199	display_down	2026-07-15	2026-07-15 07:29:08.131053
79	SP500	300	127	display_down	2026-07-16	2026-07-16 00:54:23.122594
80	SP500	300	128	display_down	2026-07-16	2026-07-16 00:54:25.205988
81	SP500	300	129	display_down	2026-07-16	2026-07-16 00:54:27.224254
82	SP500	300	159	display_down	2026-07-16	2026-07-16 04:10:42.61088
83	SP500	300	162	display_down	2026-07-16	2026-07-16 04:26:42.187702
84	SP500	300	163	display_down	2026-07-16	2026-07-16 04:26:44.477273
85	SP500	300	169	display_down	2026-07-16	2026-07-16 04:42:32.652903
86	SP500	300	170	display_down	2026-07-16	2026-07-16 04:42:34.520051
87	SP500	300	171	display_down	2026-07-16	2026-07-16 04:42:36.678813
88	SP500	300	193	display_up	2026-07-16	2026-07-16 06:48:55.892307
89	SP500	300	194	display_down	2026-07-16	2026-07-16 06:48:59.451144
90	SP500	300	195	display_up	2026-07-16	2026-07-16 06:49:01.997152
91	SP500	300	127	display_down	2026-07-20	2026-07-20 01:03:45.15986
92	SP500	300	128	display_up	2026-07-20	2026-07-20 01:03:47.198063
93	SP500	300	129	display_down	2026-07-20	2026-07-20 01:03:49.694402
94	SP500	300	157	display_up	2026-07-20	2026-07-20 03:55:47.950161
95	SP500	300	158	display_up	2026-07-20	2026-07-20 03:55:50.197998
96	SP500	300	159	display_down	2026-07-20	2026-07-20 03:55:53.448568
97	SP500	300	163	display_down	2026-07-20	2026-07-20 04:26:27.222797
98	SP500	300	164	display_down	2026-07-20	2026-07-20 04:26:29.310987
99	SP500	300	165	display_down	2026-07-20	2026-07-20 04:26:31.72275
100	SP500	300	193	display_up	2026-07-20	2026-07-20 06:39:50.405624
101	SP500	300	194	display_up	2026-07-20	2026-07-20 06:39:52.719748
102	SP500	300	195	display_down	2026-07-20	2026-07-20 06:39:55.121839
103	SP500	300	127	display_down	2026-07-21	2026-07-21 00:55:52.342363
104	SP500	300	128	display_down	2026-07-21	2026-07-21 00:55:54.43247
105	SP500	300	129	display_up	2026-07-21	2026-07-21 00:55:56.567337
106	SP500	300	157	display_up	2026-07-21	2026-07-21 03:59:57.796663
107	SP500	300	158	display_down	2026-07-21	2026-07-21 03:59:59.988698
108	SP500	300	159	display_down	2026-07-21	2026-07-21 04:00:02.262367
109	SP500	300	163	display_down	2026-07-21	2026-07-21 04:28:12.471836
110	SP500	300	164	display_down	2026-07-21	2026-07-21 04:28:14.976236
111	SP500	300	165	display_up	2026-07-21	2026-07-21 04:28:17.620266
112	SP500	300	193	display_down	2026-07-21	2026-07-21 06:16:08.098896
113	SP500	300	194	display_up	2026-07-21	2026-07-21 06:16:15.313035
114	SP500	300	195	display_up	2026-07-21	2026-07-21 06:16:19.128623
115	SP500	300	127	display_up	2026-07-22	2026-07-22 00:52:40.541288
116	SP500	300	128	display_down	2026-07-22	2026-07-22 00:52:42.769617
117	SP500	300	129	display_up	2026-07-22	2026-07-22 00:52:44.931203
118	SP500	300	161	display_down	2026-07-22	2026-07-22 04:13:08.249924
119	SP500	300	162	display_down	2026-07-22	2026-07-22 04:13:18.066435
120	SP500	300	163	display_up	2026-07-22	2026-07-22 04:13:20.170581
121	SP500	300	164	display_down	2026-07-22	2026-07-22 04:31:04.743544
122	SP500	300	193	display_down	2026-07-22	2026-07-22 06:19:17.112074
123	SP500	300	194	display_down	2026-07-22	2026-07-22 06:19:22.746238
124	SP500	300	195	display_up	2026-07-22	2026-07-22 06:19:27.479454
125	SP500	300	192	display_up	2026-07-22	2026-07-22 06:54:19.998753
126	SP500	300	127	display_down	2026-07-23	2026-07-23 00:59:36.844851
127	SP500	300	128	display_up	2026-07-23	2026-07-23 00:59:39.214633
128	SP500	300	129	display_down	2026-07-23	2026-07-23 00:59:41.374623
129	SP500	300	158	display_up	2026-07-23	2026-07-23 04:07:35.592005
130	SP500	300	159	display_down	2026-07-23	2026-07-23 04:07:37.514149
131	SP500	300	163	display_down	2026-07-23	2026-07-23 04:26:57.038588
132	SP500	300	164	display_down	2026-07-23	2026-07-23 04:26:59.361892
133	SP500	300	165	display_up	2026-07-23	2026-07-23 04:27:01.438322
134	SP500	300	167	display_down	2026-07-23	2026-07-23 04:48:18.481473
135	SP500	300	168	display_down	2026-07-23	2026-07-23 04:48:20.57313
136	SP500	300	169	display_up	2026-07-23	2026-07-23 04:48:23.276376
137	SP500	300	193	display_up	2026-07-23	2026-07-23 06:22:08.427285
138	SP500	300	194	display_down	2026-07-23	2026-07-23 06:22:11.775315
139	SP500	300	195	display_down	2026-07-23	2026-07-23 06:22:14.019185
140	SP500	300	113	display_down	2026-07-24	2026-07-24 00:21:58.298535
141	SP500	300	127	display_up	2026-07-24	2026-07-24 00:49:52.35375
142	SP500	300	128	display_up	2026-07-24	2026-07-24 00:49:56.632167
143	SP500	300	129	display_down	2026-07-24	2026-07-24 00:50:00.605625
144	SP500	300	163	display_down	2026-07-24	2026-07-24 04:23:12.62129
145	SP500	300	164	display_up	2026-07-24	2026-07-24 04:23:14.687987
146	SP500	300	165	display_down	2026-07-24	2026-07-24 04:23:16.801666
147	SP500	300	181	display_up	2026-07-24	2026-07-24 05:58:49.097657
148	SP500	300	182	display_up	2026-07-24	2026-07-24 05:58:51.408305
149	SP500	300	193	display_down	2026-07-24	2026-07-24 06:20:18.119066
150	SP500	300	194	display_down	2026-07-24	2026-07-24 06:20:20.387393
151	SP500	300	195	display_down	2026-07-24	2026-07-24 06:20:22.633626
154	SP500	300	127	display_up	2026-07-27	2026-07-27 00:37:37.430478
155	SP500	300	128	display_down	2026-07-27	2026-07-27 00:37:39.650439
156	SP500	300	129	display_up	2026-07-27	2026-07-27 00:37:42.742326
157	SP500	300	160	display_up	2026-07-27	2026-07-27 04:15:25.689812
158	SP500	300	163	display_up	2026-07-27	2026-07-27 04:26:07.523174
159	SP500	300	164	display_down	2026-07-27	2026-07-27 04:26:09.428751
160	SP500	300	165	display_down	2026-07-27	2026-07-27 04:26:11.048167
161	SP500	300	193	display_down	2026-07-27	2026-07-27 06:28:55.801318
162	SP500	300	194	display_down	2026-07-27	2026-07-27 06:28:58.385067
163	SP500	300	195	display_up	2026-07-27	2026-07-27 06:29:07.700512
164	SP500	300	196	display_down	2026-07-27	2026-07-27 07:09:34.451774
165	SP500	300	204	display_down	2026-07-27	2026-07-27 07:54:46.813017
166	SP500	300	205	display_up	2026-07-27	2026-07-27 07:54:48.677674
167	SP500	300	119	display_down	2026-07-28	2026-07-28 00:47:53.216999
168	SP500	300	120	display_down	2026-07-28	2026-07-28 00:47:55.370367
169	SP500	300	121	display_down	2026-07-28	2026-07-28 00:47:57.351943
170	SP500	300	127	display_up	2026-07-28	2026-07-28 01:01:56.934385
171	SP500	300	128	display_up	2026-07-28	2026-07-28 01:01:59.946523
172	SP500	300	129	display_down	2026-07-28	2026-07-28 01:02:02.334305
173	SP500	300	122	display_up	2026-07-28	2026-07-28 01:04:26.537853
176	SP500	300	130	display_down	2026-07-28	2026-07-28 01:46:06.626514
177	SP500	300	172	display_down	2026-07-28	2026-07-28 05:03:05.337343
178	SP500	300	173	display_down	2026-07-28	2026-07-28 05:03:07.657497
179	SP500	300	174	display_up	2026-07-28	2026-07-28 05:03:09.959625
180	SP500	300	193	display_down	2026-07-28	2026-07-28 06:38:30.087471
181	SP500	300	194	display_up	2026-07-28	2026-07-28 06:38:31.955227
182	SP500	300	195	display_up	2026-07-28	2026-07-28 06:38:33.810454
183	SP500	300	121	display_down	2026-07-29	2026-07-29 00:54:04.354386
184	SP500	300	122	display_down	2026-07-29	2026-07-29 00:54:07.03432
185	SP500	300	123	display_up	2026-07-29	2026-07-29 00:54:09.56254
186	SP500	300	127	display_down	2026-07-29	2026-07-29 00:55:10.057775
187	SP500	300	128	display_up	2026-07-29	2026-07-29 00:55:11.920162
188	SP500	300	129	display_down	2026-07-29	2026-07-29 00:55:14.597065
189	SP500	300	181	display_up	2026-07-29	2026-07-29 06:02:19.923115
190	SP500	300	182	display_up	2026-07-29	2026-07-29 06:02:21.875134
191	SP500	300	183	display_down	2026-07-29	2026-07-29 06:02:23.847644
192	SP500	300	193	display_up	2026-07-29	2026-07-29 06:13:56.07887
193	SP500	300	194	display_down	2026-07-29	2026-07-29 06:13:57.911363
194	SP500	300	195	display_down	2026-07-29	2026-07-29 06:14:00.024505
195	SP500	300	121	display_down	2026-07-30	2026-07-30 00:53:08.551812
196	SP500	300	122	display_down	2026-07-30	2026-07-30 00:53:10.729565
197	SP500	300	123	display_up	2026-07-30	2026-07-30 00:53:12.906145
198	SP500	300	127	display_down	2026-07-30	2026-07-30 01:00:09.508794
199	SP500	300	128	display_down	2026-07-30	2026-07-30 01:00:14.506105
200	SP500	300	129	display_down	2026-07-30	2026-07-30 01:00:17.466288
201	SP500	300	124	display_down	2026-07-30	2026-07-30 01:07:37.303734
202	SP500	300	193	display_down	2026-07-30	2026-07-30 06:27:52.940858
203	SP500	300	194	display_up	2026-07-30	2026-07-30 06:27:55.206714
204	SP500	300	195	display_up	2026-07-30	2026-07-30 06:27:57.226167
205	SP500	300	127	display_up	2026-07-31	2026-07-31 00:51:21.798746
206	SP500	300	128	display_up	2026-07-31	2026-07-31 00:51:23.623374
207	SP500	300	129	display_down	2026-07-31	2026-07-31 00:51:25.464009
208	SP500	300	121	display_down	2026-07-31	2026-07-31 01:02:23.216549
209	SP500	300	122	display_down	2026-07-31	2026-07-31 01:02:25.475737
210	SP500	300	123	display_up	2026-07-31	2026-07-31 01:02:28.584282
211	SP500	300	163	display_down	2026-07-31	2026-07-31 04:27:24.351074
212	SP500	300	164	display_up	2026-07-31	2026-07-31 04:27:26.176433
213	SP500	300	165	display_down	2026-07-31	2026-07-31 04:27:27.801144
214	SP500	300	193	display_down	2026-07-31	2026-07-31 06:24:11.730599
215	SP500	300	194	display_down	2026-07-31	2026-07-31 06:24:14.570591
216	SP500	300	195	display_up	2026-07-31	2026-07-31 06:24:17.308076
217	SP500	300	121	display_down	2026-08-03	2026-08-03 00:49:20.712949
218	SP500	300	122	display_up	2026-08-03	2026-08-03 00:49:22.837204
219	SP500	300	123	display_down	2026-08-03	2026-08-03 00:49:25.119053
220	SP500	300	127	display_up	2026-08-03	2026-08-03 00:53:37.103312
221	SP500	300	128	display_down	2026-08-03	2026-08-03 00:53:39.797384
222	SP500	300	129	display_down	2026-08-03	2026-08-03 00:53:42.404074
223	SP500	300	157	display_down	2026-08-03	2026-08-03 03:55:09.762782
224	SP500	300	158	display_up	2026-08-03	2026-08-03 03:55:11.666623
225	SP500	300	159	display_up	2026-08-03	2026-08-03 03:55:13.777971
226	SP500	300	193	display_up	2026-08-03	2026-08-03 06:12:43.938441
227	SP500	300	194	display_up	2026-08-03	2026-08-03 06:12:45.748332
228	SP500	300	195	display_down	2026-08-03	2026-08-03 06:12:49.315121
229	SP500	300	127	display_down	2026-08-04	2026-08-04 00:47:53.314513
230	SP500	300	128	display_up	2026-08-04	2026-08-04 00:47:58.595303
231	SP500	300	129	display_down	2026-08-04	2026-08-04 00:48:05.197147
232	SP500	300	121	display_up	2026-08-04	2026-08-04 00:53:43.592809
233	SP500	300	122	display_down	2026-08-04	2026-08-04 00:53:45.52076
234	SP500	300	123	display_down	2026-08-04	2026-08-04 00:53:48.272887
235	SP500	300	124	display_down	2026-08-04	2026-08-04 01:15:48.286361
236	SP500	300	181	display_down	2026-08-04	2026-08-04 06:00:50.061712
237	SP500	300	182	display_down	2026-08-04	2026-08-04 06:00:51.952675
238	SP500	300	193	display_up	2026-08-04	2026-08-04 06:26:44.6157
239	SP500	300	194	display_down	2026-08-04	2026-08-04 06:26:46.510457
240	SP500	300	195	display_down	2026-08-04	2026-08-04 06:26:48.281624
241	SP500	300	127	display_down	2026-08-05	2026-08-05 00:48:19.92793
242	SP500	300	128	display_down	2026-08-05	2026-08-05 00:48:23.238282
243	SP500	300	129	display_up	2026-08-05	2026-08-05 00:48:28.19323
244	SP500	300	121	display_down	2026-08-05	2026-08-05 00:54:38.764946
245	SP500	300	122	display_down	2026-08-05	2026-08-05 00:54:40.864556
246	SP500	300	123	display_up	2026-08-05	2026-08-05 00:54:42.95824
247	SP500	300	193	display_up	2026-08-05	2026-08-05 06:14:28.246516
248	SP500	300	194	display_up	2026-08-05	2026-08-05 06:14:30.942955
249	SP500	300	195	display_down	2026-08-05	2026-08-05 06:14:33.136515
250	SP500	300	121	display_up	2026-08-06	2026-08-06 00:49:47.549896
252	SP500	300	126	display_up	2026-08-06	2026-08-06 00:54:55.267892
253	SP500	300	127	display_up	2026-08-06	2026-08-06 00:54:56.994722
255	SP500	300	122	display_up	2026-08-06	2026-08-06 01:07:33.915693
256	SP500	300	123	display_down	2026-08-06	2026-08-06 01:12:33.676401
257	SP500	300	124	display_down	2026-08-06	2026-08-06 01:16:15.455025
258	SP500	300	128	display_up	2026-08-06	2026-08-06 01:35:11.813556
260	SP500	300	129	display_up	2026-08-06	2026-08-06 01:41:54.62047
261	SP500	300	127	display_up	2026-08-07	2026-08-07 00:37:07.930443
262	SP500	300	128	display_down	2026-08-07	2026-08-07 00:37:12.275278
263	SP500	300	129	display_down	2026-08-07	2026-08-07 00:37:16.302095
264	SP500	300	121	display_down	2026-08-07	2026-08-07 00:49:30.338387
265	SP500	300	122	display_down	2026-08-07	2026-08-07 00:49:32.766931
266	SP500	300	123	display_up	2026-08-07	2026-08-07 00:49:35.006307
269	SP500	300	193	display_up	2026-08-07	2026-08-07 06:59:25.231419
\.


--
-- Data for Name: round_results; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.round_results (id, symbol, duration, round_number, round_date, open_price, close_price, high_price, low_price, direction, created_at) FROM stdin;
\.


--
-- Data for Name: settings; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.settings (key, value, updated_at) FROM stdin;
telegram_bot_token	8742173231:AAGOgijbX-zLU_gXzrteKEMBV6tZU-2wJk8	2026-07-07 02:41:51.217
telegram_notification_chat_id	-5543508614	2026-07-07 02:41:51.225
\.


--
-- Data for Name: transaction_requests; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.transaction_requests (id, user_id, type, amount, status, bank_name, account_holder, account_number, sender_name, admin_note, processed_by, processed_at, created_at) FROM stdin;
48	680bfe1a-2a6d-4661-8111-c86c439f1598	deposit	3000000	approved	\N	\N	\N	박덕준	\N	4207899b-f5e9-4393-9c14-0ad0db005748	2026-07-27 02:12:18.258	2026-07-27 02:10:11.461202
50	55cd7cf5-4d59-4914-affa-f306a49ff5c2	deposit	3000000	approved	\N	\N	\N	정선우	\N	4207899b-f5e9-4393-9c14-0ad0db005748	2026-07-27 07:53:47.016	2026-07-27 07:53:32.540541
51	3007b845-7394-4cb1-81d7-7a5289591da2	deposit	4850000	approved	\N	\N	\N	오재명	\N	4207899b-f5e9-4393-9c14-0ad0db005748	2026-07-27 08:28:18.522	2026-07-27 08:28:11.238334
26	a37c84ff-be4e-48d9-ae99-1f6823d793ea	withdrawal	165000	approved	\N	\N	\N	\N	\N	4207899b-f5e9-4393-9c14-0ad0db005748	2026-07-16 10:32:52.677	2026-07-15 08:19:42.220624
14	74852c63-bd9c-4a75-b98a-14f2ad7393c7	deposit	5000000	rejected	\N	\N	\N	김윤구	\N	4207899b-f5e9-4393-9c14-0ad0db005748	2026-07-10 04:14:08.37	2026-07-10 04:13:37.916697
15	74852c63-bd9c-4a75-b98a-14f2ad7393c7	deposit	5000000	approved	\N	\N	\N	김윤구	\N	4207899b-f5e9-4393-9c14-0ad0db005748	2026-07-10 04:28:15.106	2026-07-10 04:27:01.752116
16	b5c20bc7-20be-4e6c-8d1c-0cff218f1df8	deposit	5000000	approved	\N	\N	\N	김송희	\N	4207899b-f5e9-4393-9c14-0ad0db005748	2026-07-10 08:57:18.388	2026-07-10 08:57:11.382489
17	b5c20bc7-20be-4e6c-8d1c-0cff218f1df8	withdrawal	190000	approved	\N	\N	\N	\N	\N	4207899b-f5e9-4393-9c14-0ad0db005748	2026-07-10 09:34:31.606	2026-07-10 09:07:30.774857
18	74852c63-bd9c-4a75-b98a-14f2ad7393c7	deposit	3000000	approved	\N	\N	\N	김윤구	\N	4207899b-f5e9-4393-9c14-0ad0db005748	2026-07-13 03:56:51.195	2026-07-13 03:52:18.81224
19	74852c63-bd9c-4a75-b98a-14f2ad7393c7	deposit	4250000	approved	\N	\N	\N	김윤구	\N	4207899b-f5e9-4393-9c14-0ad0db005748	2026-07-13 04:25:00.489	2026-07-13 04:21:06.040989
20	74852c63-bd9c-4a75-b98a-14f2ad7393c7	deposit	2750000	approved	\N	\N	\N	김윤구	\N	4207899b-f5e9-4393-9c14-0ad0db005748	2026-07-13 04:33:10.173	2026-07-13 04:29:44.051843
21	1df9f2e7-8029-4302-9cf4-3625d0378d7a	deposit	50000	rejected	\N	\N	\N	안미란	\N	4207899b-f5e9-4393-9c14-0ad0db005748	2026-07-14 01:17:46.786	2026-07-14 01:17:11.50857
22	1df9f2e7-8029-4302-9cf4-3625d0378d7a	deposit	10000	rejected	\N	\N	\N	안미란	\N	4207899b-f5e9-4393-9c14-0ad0db005748	2026-07-14 01:23:59.541	2026-07-14 01:23:50.196741
23	80271ffa-4f8d-430e-b95e-fd9a456063ae	deposit	3000000	rejected	\N	\N	\N	오승열	\N	4207899b-f5e9-4393-9c14-0ad0db005748	2026-07-14 06:34:16.36	2026-07-14 01:42:48.223511
24	a37c84ff-be4e-48d9-ae99-1f6823d793ea	deposit	3000000	rejected	\N	\N	\N	문영길	\N	4207899b-f5e9-4393-9c14-0ad0db005748	2026-07-15 04:04:48.213	2026-07-15 03:20:31.821295
27	a37c84ff-be4e-48d9-ae99-1f6823d793ea	withdrawal	3112500	rejected	\N	\N	\N	\N	\N	4207899b-f5e9-4393-9c14-0ad0db005748	2026-07-20 05:07:15.819	2026-07-20 05:06:34.576229
25	a37c84ff-be4e-48d9-ae99-1f6823d793ea	deposit	3000000	approved	\N	\N	\N	문영길	\N	4207899b-f5e9-4393-9c14-0ad0db005748	2026-07-15 07:20:45.384	2026-07-15 07:19:33.513401
28	a37c84ff-be4e-48d9-ae99-1f6823d793ea	withdrawal	3112500	rejected	\N	\N	\N	\N	\N	4207899b-f5e9-4393-9c14-0ad0db005748	2026-07-20 05:13:38.214	2026-07-20 05:13:15.236508
30	a37c84ff-be4e-48d9-ae99-1f6823d793ea	withdrawal	3000000	rejected	\N	\N	\N	\N	\N	4207899b-f5e9-4393-9c14-0ad0db005748	2026-07-20 06:42:26.597	2026-07-20 05:38:09.382992
29	a37c84ff-be4e-48d9-ae99-1f6823d793ea	withdrawal	112500	rejected	\N	\N	\N	\N	\N	4207899b-f5e9-4393-9c14-0ad0db005748	2026-07-20 06:42:26.857	2026-07-20 05:15:07.754315
31	9ee373bc-d591-4bc7-82e0-18c953b27d5c	deposit	2000000	approved	\N	\N	\N	서정철	\N	4207899b-f5e9-4393-9c14-0ad0db005748	2026-07-21 00:44:08.19	2026-07-21 00:42:26.562241
32	a37c84ff-be4e-48d9-ae99-1f6823d793ea	withdrawal	3112500	rejected	\N	\N	\N	\N	\N	4207899b-f5e9-4393-9c14-0ad0db005748	2026-07-21 04:27:45.777	2026-07-21 03:27:18.579786
34	9ee373bc-d591-4bc7-82e0-18c953b27d5c	withdrawal	2087500	approved	\N	\N	\N	\N	\N	4207899b-f5e9-4393-9c14-0ad0db005748	2026-07-21 07:07:57.011	2026-07-21 06:18:49.038003
33	a37c84ff-be4e-48d9-ae99-1f6823d793ea	withdrawal	3112500	rejected	\N	\N	\N	\N	\N	4207899b-f5e9-4393-9c14-0ad0db005748	2026-07-21 07:07:58.034	2026-07-21 04:58:36.694659
39	3007b845-7394-4cb1-81d7-7a5289591da2	deposit	1000000	rejected	\N	\N	\N	오재명	\N	4207899b-f5e9-4393-9c14-0ad0db005748	2026-07-22 09:04:04.041	2026-07-22 07:26:48.514006
38	3007b845-7394-4cb1-81d7-7a5289591da2	deposit	1000000	rejected	\N	\N	\N	오재명	\N	4207899b-f5e9-4393-9c14-0ad0db005748	2026-07-22 09:04:04.602	2026-07-22 07:25:50.381386
37	3007b845-7394-4cb1-81d7-7a5289591da2	deposit	1000000	rejected	\N	\N	\N	오재명	\N	4207899b-f5e9-4393-9c14-0ad0db005748	2026-07-22 09:04:05.127	2026-07-22 07:25:09.621938
40	3007b845-7394-4cb1-81d7-7a5289591da2	deposit	2300000	approved	\N	\N	\N	오재명	\N	4207899b-f5e9-4393-9c14-0ad0db005748	2026-07-23 02:04:27.468	2026-07-23 01:49:07.470453
42	3007b845-7394-4cb1-81d7-7a5289591da2	deposit	2700000	approved	\N	\N	\N	오재명	\N	4207899b-f5e9-4393-9c14-0ad0db005748	2026-07-23 02:13:18.487	2026-07-23 02:12:46.834952
41	3007b845-7394-4cb1-81d7-7a5289591da2	deposit	2300000	rejected	\N	\N	\N	오재명	\N	4207899b-f5e9-4393-9c14-0ad0db005748	2026-07-23 02:13:19.768	2026-07-23 02:11:40.203469
44	55cd7cf5-4d59-4914-affa-f306a49ff5c2	deposit	3000000	approved	\N	\N	\N	정선우	\N	4207899b-f5e9-4393-9c14-0ad0db005748	2026-07-23 09:05:06.984	2026-07-23 09:04:20.846266
45	55cd7cf5-4d59-4914-affa-f306a49ff5c2	withdrawal	28500	approved	\N	\N	\N	\N	\N	4207899b-f5e9-4393-9c14-0ad0db005748	2026-07-24 01:21:16.838	2026-07-24 00:41:13.57113
47	74852c63-bd9c-4a75-b98a-14f2ad7393c7	deposit	4510000	approved	\N	\N	\N	김윤구	\N	4207899b-f5e9-4393-9c14-0ad0db005748	2026-07-24 05:16:10.782	2026-07-24 05:16:07.821417
46	74852c63-bd9c-4a75-b98a-14f2ad7393c7	withdrawal	4510000	approved	\N	\N	\N	\N	\N	4207899b-f5e9-4393-9c14-0ad0db005748	2026-07-24 05:22:33.441	2026-07-24 05:15:18.638484
53	3007b845-7394-4cb1-81d7-7a5289591da2	deposit	5000000	approved	\N	\N	\N	오재명	\N	4207899b-f5e9-4393-9c14-0ad0db005748	2026-07-28 00:30:36.978	2026-07-28 00:30:23.258859
56	55cd7cf5-4d59-4914-affa-f306a49ff5c2	withdrawal	17500	approved	\N	\N	\N	\N	\N	4207899b-f5e9-4393-9c14-0ad0db005748	2026-07-28 09:54:09.718	2026-07-28 09:33:48.476232
57	3007b845-7394-4cb1-81d7-7a5289591da2	deposit	5000000	approved	\N	\N	\N	오재명	\N	4207899b-f5e9-4393-9c14-0ad0db005748	2026-07-29 00:13:09.512	2026-07-29 00:12:58.972257
59	55cd7cf5-4d59-4914-affa-f306a49ff5c2	deposit	25000000	approved	\N	\N	\N	정선우	\N	4207899b-f5e9-4393-9c14-0ad0db005748	2026-07-29 00:57:46.717	2026-07-29 00:57:19.152782
60	55cd7cf5-4d59-4914-affa-f306a49ff5c2	withdrawal	357500	approved	\N	\N	\N	\N	\N	4207899b-f5e9-4393-9c14-0ad0db005748	2026-07-29 01:34:32.067	2026-07-29 01:12:42.622458
61	55cd7cf5-4d59-4914-affa-f306a49ff5c2	withdrawal	237500	approved	\N	\N	\N	\N	\N	4207899b-f5e9-4393-9c14-0ad0db005748	2026-07-29 01:40:31.231	2026-07-29 01:36:09.908208
62	55cd7cf5-4d59-4914-affa-f306a49ff5c2	deposit	4810000	approved	\N	\N	\N	정선우	\N	4207899b-f5e9-4393-9c14-0ad0db005748	2026-07-29 05:19:50.887	2026-07-29 05:11:36.609522
63	55cd7cf5-4d59-4914-affa-f306a49ff5c2	deposit	20190000	approved	\N	\N	\N	정선우	\N	4207899b-f5e9-4393-9c14-0ad0db005748	2026-07-29 05:56:39.733	2026-07-29 05:56:02.902211
64	55cd7cf5-4d59-4914-affa-f306a49ff5c2	withdrawal	225000	approved	\N	\N	\N	\N	\N	4207899b-f5e9-4393-9c14-0ad0db005748	2026-07-29 09:49:57.777	2026-07-29 07:15:10.90809
65	55cd7cf5-4d59-4914-affa-f306a49ff5c2	deposit	25000000	approved	\N	\N	\N	정선우	\N	4207899b-f5e9-4393-9c14-0ad0db005748	2026-07-30 01:08:32.913	2026-07-30 01:08:17.249711
66	3007b845-7394-4cb1-81d7-7a5289591da2	withdrawal	1000000	approved	\N	\N	\N	\N	\N	4207899b-f5e9-4393-9c14-0ad0db005748	2026-07-30 07:47:55.564	2026-07-30 07:44:11.265012
67	55cd7cf5-4d59-4914-affa-f306a49ff5c2	withdrawal	5225000	approved	\N	\N	\N	\N	\N	4207899b-f5e9-4393-9c14-0ad0db005748	2026-07-30 08:25:56.235	2026-07-30 07:52:12.829076
68	55cd7cf5-4d59-4914-affa-f306a49ff5c2	withdrawal	380000	approved	\N	\N	\N	\N	\N	4207899b-f5e9-4393-9c14-0ad0db005748	2026-07-31 09:24:37.163	2026-07-31 07:20:44.883374
69	3007b845-7394-4cb1-81d7-7a5289591da2	deposit	5000000	approved	\N	\N	\N	오재명	\N	4207899b-f5e9-4393-9c14-0ad0db005748	2026-08-03 01:59:13.036	2026-08-03 01:58:52.3125
71	55cd7cf5-4d59-4914-affa-f306a49ff5c2	deposit	3000000	approved	\N	\N	\N	정선우	\N	4207899b-f5e9-4393-9c14-0ad0db005748	2026-08-04 00:16:40.339	2026-08-04 00:16:04.800212
72	3007b845-7394-4cb1-81d7-7a5289591da2	deposit	5000000	approved	\N	\N	\N	오재명	\N	4207899b-f5e9-4393-9c14-0ad0db005748	2026-08-04 00:35:34.471	2026-08-04 00:35:25.674544
\.


--
-- Data for Name: user_sessions; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.user_sessions (sid, sess, expire) FROM stdin;
tMoEvbd8uakf4kol-t_xNHwXkuxSAw83	{"cookie":{"originalMaxAge":604800000,"expires":"2026-08-21T05:07:08.612Z","secure":false,"httpOnly":true,"path":"/","sameSite":"lax"},"adminUserId":"f4a21243-eb2a-498e-bd25-46b1f19640cf"}	2026-08-21 05:07:09
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.users (id, username, password, name, phone, bank_name, account_holder, account_number, balance, total_deposit, total_withdrawal, total_bet, total_win, role, grade, is_active, last_login_at, created_at, approval_status, birth_date, resident_number, region, branch_code, affiliate_id, last_login_ip, auto_bet_enabled, auto_bet_multiplier, is_betting_blocked, forced_bet_direction, max_execution_enabled, pending_balance_adjustment, always_pending_enabled, telegram_notify_enabled) FROM stdin;
f4a21243-eb2a-498e-bd25-46b1f19640cf	admin	admin123	관리자	\N	\N	\N	\N	100000000	0	0	0	0	admin	브론즈	t	\N	2026-08-09 11:19:58.005784	approved	\N	\N	\N	\N	\N	\N	f	10	f	\N	t	0	f	f
691e57e6-502e-447d-ae4e-aa275486ee4c	demo	demo123	데모 사용자	\N	\N	\N	\N	10039000	0	0	0	0	user	브론즈	t	\N	2026-08-09 11:19:58.013411	approved	\N	\N	\N	\N	\N	\N	f	10	f	\N	t	0	f	f
76a18cd5-62f2-4abd-9ce7-5397c05da8bd	lauom88	lr1762rd//	이원재	1098070079	KB국민은행	이원재	117210953111	0	0	0	0	0	user	브론즈	t	2026-07-08 01:31:51.995	2026-07-08 01:28:11.740038	approved	630307	\N	\N	\N	\N	119.198.125.82	f	10	f	\N	t	0	f	f
680bfe1a-2a6d-4661-8111-c86c439f1598	fffsur	d2706j-2706	박덕준	1032252706	우리은행	박덕준	1002541937465 	0	3000000	0	0	0	user	브론즈	t	2026-07-24 06:43:02.228	2026-07-24 01:44:31.845979	approved	690326	\N	\N	\N	877fbaaa-35aa-4dc8-a141-2b7d2acc2cbf	211.36.146.246	f	10	f	\N	t	0	f	f
74852c63-bd9c-4a75-b98a-14f2ad7393c7	phcj	iapplecj9*	김윤구	1099921232	새마을금고	김윤구	4543100010311	0	19510000	4510000	0	0	user	브론즈	f	2026-07-27 01:36:48.872	2026-07-10 04:08:02.844156	approved	680510	\N	\N	\N	\N	211.235.64.54	f	10	f	\N	t	0	f	f
c84ca9f9-1efe-4ff4-a37d-ff9c3237b279	111	1234	111	1011111111	신한은행	4534	4354534345	22837500	0	0	0	0	user	브론즈	t	2026-07-20 06:57:38.521	2026-07-07 00:57:38.762691	approved	111111	\N	\N	\N	\N	45.67.97.169	f	10	f	\N	t	0	f	f
b5c20bc7-20be-4e6c-8d1c-0cff218f1df8	3672	3744	김송희	1029945228	신한은행	김송희	110610575738	0	5000000	190000	0	0	user	브론즈	t	2026-07-10 08:39:48.2	2026-07-10 08:39:04.798874	approved	600721	\N	\N	\N	877fbaaa-35aa-4dc8-a141-2b7d2acc2cbf	118.46.214.132	f	10	f	\N	t	0	f	f
ebe1121e-9a3b-4db5-a055-a04cd49349dd	testnotify99	test1234	알림테스트	1012345678	국민은행	알림테스트	123456789012	0	0	0	0	0	user	브론즈	t	\N	2026-04-23 01:54:17.978872	approved	\N	\N	\N	\N	\N	\N	f	10	f	\N	f	0	f	f
88aea1be-9af7-4380-abb7-abe8770f6567	pox79	791806dhr$	김재옥	1038515896	KB국민은행	김재옥	4210240925	0	0	0	0	0	user	브론즈	t	\N	2026-07-15 05:48:48.859768	approved	630510	\N	\N	\N	\N	\N	f	10	f	\N	t	0	f	f
80271ffa-4f8d-430e-b95e-fd9a456063ae	sn0618	i1041635**	오승열	1097359665	우리은행	오승열	43907082778	0	0	0	0	0	user	브론즈	t	2026-07-14 01:26:34.774	2026-07-14 01:26:12.710432	approved	540618	\N	\N	\N	877fbaaa-35aa-4dc8-a141-2b7d2acc2cbf	220.65.239.134	f	10	f	\N	t	0	f	f
39be743b-bc70-4297-abb0-cb0e56c41d2f	조경해자양구	sungsu12	김성수	1037578603	하나은행	김성수	66291092813007	0	0	0	0	0	user	브론즈	t	2026-07-08 23:51:59.528	2026-07-08 17:39:52.127364	approved	850322	\N	\N	\N	877fbaaa-35aa-4dc8-a141-2b7d2acc2cbf	211.234.227.71	f	10	f	\N	t	0	f	f
13553385-c4b7-46c6-a476-b3c2da2dbeed	qwer1234	qwer1234	김복남	1077777777	KB국민은행	김복남	77777777777777777777	0	0	0	0	0	user	브론즈	t	2026-07-08 04:26:37.882	2026-07-07 05:56:20.742671	approved	500101	\N	\N	\N	\N	45.67.97.18	f	10	f	\N	t	0	f	f
bee3ac98-a63b-4c68-a854-b69a6e74f3fc	kk123555	wndud12@@!	김주영	1041085144	신한은행	김주영	110487203222	0	0	0	0	0	user	브론즈	t	2026-07-20 02:14:28.511	2026-07-20 02:09:19.89139	approved	870602	\N	\N	\N	877fbaaa-35aa-4dc8-a141-2b7d2acc2cbf	118.235.89.15	f	10	f	\N	t	0	f	f
1df9f2e7-8029-4302-9cf4-3625d0378d7a	sj0924	sktjdwns1@	안미란	1054329592	NH농협은행	안미란	59912040174	0	0	0	0	0	user	브론즈	t	2026-07-15 00:20:42.788	2026-07-14 01:15:10.914589	approved	770404	\N	\N	\N	\N	116.122.44.160	f	10	f	\N	t	0	f	f
cab56d54-635a-48c1-bfa5-e8da83724ea7	hwan2720	hydro7763@	장기환	1089952720	토스뱅크	장기환	100140452716	0	0	0	0	0	user	브론즈	t	2026-07-15 05:05:28.33	2026-07-15 05:03:19.540477	approved	770630	\N	\N	\N	\N	106.101.69.245	f	10	f	\N	t	0	f	f
9ee373bc-d591-4bc7-82e0-18c953b27d5c	luciferkr	fpwjdcjf2@	서정철	1081813828	NH농협은행	서정철	3520934997143	0	2000000	2087500	0	0	user	브론즈	t	2026-07-21 00:32:00.395	2026-07-21 00:31:48.364286	approved	861225	\N	\N	\N	\N	121.149.78.209	f	10	f	\N	t	0	f	f
a37c84ff-be4e-48d9-ae99-1f6823d793ea	myg5454 	moon5454	문영길	1087639756	카카오뱅크	문영길	3333 13 4859047 	3112500	3000000	165000	0	0	user	브론즈	f	2026-07-13 06:41:12.503	2026-07-13 06:40:40.995705	approved	551228	\N	\N	\N	877fbaaa-35aa-4dc8-a141-2b7d2acc2cbf	211.234.227.252	f	10	f	\N	t	0	f	f
f8d50cb0-b9c3-4343-bd68-825d0ac2546b	msp1010	msp393800!	박미석	1052151010	신한은행	박미석	98206038605	0	0	0	0	0	user	브론즈	t	2026-07-15 05:26:02.149	2026-07-15 05:24:53.35054	approved	581010	\N	\N	\N	\N	122.45.126.71	f	10	f	\N	t	0	f	f
738d9e1b-d3ba-4a3e-ae04-909b2f855b21	lauom	lr1762rd	이원재	1098070079	KB국민은행	이원재	117210953111	0	0	0	0	0	user	브론즈	t	2026-07-15 07:34:20.816	2026-07-15 07:33:59.433849	approved	630307	\N	\N	\N	\N	211.197.136.90	f	10	f	\N	t	0	f	f
3172253b-a312-48ad-a3fd-3f7e036be9b1	Syj2394 	syj631108*	서영종	1086512394	케이뱅크	서영종	1002941225525	0	0	0	0	0	user	브론즈	t	2026-07-22 09:04:29.614	2026-07-22 09:03:56.229955	approved	610720	\N	\N	\N	\N	118.235.5.116	f	10	f	\N	t	0	f	f
b74441c4-1858-43f0-afdc-fbfec02ce9d5	qwer123	qwer123	김만복	1088888888	신한은행	김만복	999999999999999	5915000	0	0	0	0	user	브론즈	t	2026-08-05 06:49:41.923	2026-07-07 00:57:16.946059	approved	900101	\N	\N	\N	\N	45.67.97.204	f	10	f	\N	t	0	f	f
f501ab5b-27c7-4682-8924-692946bf5e28	겨울비	480155	모경화	1044655505	신한은행	모경화	110391479600	0	0	0	0	0	user	브론즈	t	2026-07-30 02:57:45.749	2026-07-29 05:07:29.343464	approved	710501	\N	\N	\N	\N	118.235.91.144	f	10	f	\N	t	0	f	f
13e0933f-cea5-4749-8f0b-181658ee5e2b	hyeri0806	yun99240806@	윤혜리	1099428433	NH농협은행	윤혜리	3521201250393	0	0	0	0	0	user	브론즈	t	2026-08-03 02:24:21.955	2026-07-27 01:09:34.889107	approved	790926	\N	\N	\N	877fbaaa-35aa-4dc8-a141-2b7d2acc2cbf	194.114.136.62	f	10	f	\N	t	0	f	f
3007b845-7394-4cb1-81d7-7a5289591da2	ojm1199	119900	오재명 	1052346078	KB국민은행	오재명 	57860101012342	0	29850000	1000000	0	0	user	브론즈	t	2026-08-06 01:56:36.896	2026-07-22 06:53:05.991256	approved	490610	\N	\N	\N	877fbaaa-35aa-4dc8-a141-2b7d2acc2cbf	211.104.178.184	f	0	f	\N	t	0	f	f
55cd7cf5-4d59-4914-affa-f306a49ff5c2	크리스탈	jsw448100!!	정선우 	1088297176	NH농협은행	정선우 	32102339971	111922500	84000000	6471000	0	0	user	브론즈	t	2026-07-24 00:17:27.416	2026-07-23 07:48:41.770712	approved	750828	\N	\N	\N	\N	211.225.254.2	f	10	f	\N	t	0	f	f
4439d992-3b0d-43a1-becd-8ef186b3d934	jongbae109	qkrwhdqo0.	박종배	1076746560	토스뱅크	박종배	100195670933	0	0	0	0	0	user	브론즈	t	2026-08-05 03:32:22.967	2026-08-05 03:31:51.595828	approved	910228	\N	\N	\N	877fbaaa-35aa-4dc8-a141-2b7d2acc2cbf	223.39.83.57	f	10	f	\N	t	0	f	f
12b73c7f-9f06-4e98-9617-07cb693c2f4f	senskim81	Paul292513-	김성용	1027936800	IBK기업은행	김성용	1027936800	0	0	0	0	0	user	브론즈	t	2026-08-05 04:54:46.429	2026-08-05 04:38:09.364242	approved	811021	\N	\N	\N	877fbaaa-35aa-4dc8-a141-2b7d2acc2cbf	118.235.11.169	f	10	f	\N	t	0	f	f
330907d4-43f2-4aac-9c9c-6388705995fa	Kmg	m22313607	기미경 	1062690064	NH농협은행	기미경 	3120095269431	0	0	0	0	0	user	브론즈	t	\N	2026-08-05 05:06:57.824591	approved	720250	\N	\N	\N	\N	\N	f	10	f	\N	t	0	f	f
f86800a3-aa14-4f70-877a-0749225b5f5f	ojm5959	119900	오재명 	1052346078	KB국민은행	오재명 	57860101012342	0	0	0	0	0	user	브론즈	t	\N	2026-08-06 01:42:31.384787	approved	490610	\N	\N	\N	\N	\N	f	10	f	\N	t	0	f	f
2bbf726e-9087-4160-87df-2f5910473c7d	Ojm5959 	119900	오재명 	1052346078	KB국민은행	오재명 	57860101012342	0	0	0	0	0	user	브론즈	t	\N	2026-08-06 01:45:53.178859	approved	490610	\N	\N	\N	\N	\N	f	10	f	\N	t	0	f	f
\.


--
-- Name: affiliate_commissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.affiliate_commissions_id_seq', 1, false);


--
-- Name: affiliate_settlements_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.affiliate_settlements_id_seq', 1, false);


--
-- Name: announcements_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.announcements_id_seq', 1, false);


--
-- Name: bets_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.bets_id_seq', 369, false);


--
-- Name: blocked_ips_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.blocked_ips_id_seq', 1, false);


--
-- Name: branches_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.branches_id_seq', 1, false);


--
-- Name: forex_candles_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.forex_candles_id_seq', 29150, true);


--
-- Name: inquiries_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.inquiries_id_seq', 1, false);


--
-- Name: inquiry_templates_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.inquiry_templates_id_seq', 1, false);


--
-- Name: login_history_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.login_history_id_seq', 93, false);


--
-- Name: maintenance_symbols_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.maintenance_symbols_id_seq', 1, false);


--
-- Name: messages_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.messages_id_seq', 1, false);


--
-- Name: round_forced_directions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.round_forced_directions_id_seq', 270, false);


--
-- Name: round_results_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.round_results_id_seq', 1, false);


--
-- Name: transaction_requests_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.transaction_requests_id_seq', 73, false);


--
-- Name: affiliate_commissions affiliate_commissions_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.affiliate_commissions
    ADD CONSTRAINT affiliate_commissions_pkey PRIMARY KEY (id);


--
-- Name: affiliate_settlements affiliate_settlements_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.affiliate_settlements
    ADD CONSTRAINT affiliate_settlements_pkey PRIMARY KEY (id);


--
-- Name: affiliates affiliates_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.affiliates
    ADD CONSTRAINT affiliates_pkey PRIMARY KEY (id);


--
-- Name: affiliates affiliates_referral_code_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.affiliates
    ADD CONSTRAINT affiliates_referral_code_key UNIQUE (referral_code);


--
-- Name: affiliates affiliates_username_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.affiliates
    ADD CONSTRAINT affiliates_username_key UNIQUE (username);


--
-- Name: announcements announcements_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.announcements
    ADD CONSTRAINT announcements_pkey PRIMARY KEY (id);


--
-- Name: bets bets_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.bets
    ADD CONSTRAINT bets_pkey PRIMARY KEY (id);


--
-- Name: blocked_ips blocked_ips_ip_address_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.blocked_ips
    ADD CONSTRAINT blocked_ips_ip_address_key UNIQUE (ip_address);


--
-- Name: blocked_ips blocked_ips_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.blocked_ips
    ADD CONSTRAINT blocked_ips_pkey PRIMARY KEY (id);


--
-- Name: branches branches_code_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.branches
    ADD CONSTRAINT branches_code_key UNIQUE (code);


--
-- Name: branches branches_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.branches
    ADD CONSTRAINT branches_pkey PRIMARY KEY (id);


--
-- Name: forex_candles forex_candles_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.forex_candles
    ADD CONSTRAINT forex_candles_pkey PRIMARY KEY (id);


--
-- Name: forex_candles forex_candles_symbol_duration_time_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.forex_candles
    ADD CONSTRAINT forex_candles_symbol_duration_time_key UNIQUE (symbol, duration, "time");


--
-- Name: inquiries inquiries_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.inquiries
    ADD CONSTRAINT inquiries_pkey PRIMARY KEY (id);


--
-- Name: inquiry_templates inquiry_templates_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.inquiry_templates
    ADD CONSTRAINT inquiry_templates_pkey PRIMARY KEY (id);


--
-- Name: login_history login_history_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.login_history
    ADD CONSTRAINT login_history_pkey PRIMARY KEY (id);


--
-- Name: maintenance_symbols maintenance_symbols_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.maintenance_symbols
    ADD CONSTRAINT maintenance_symbols_pkey PRIMARY KEY (id);


--
-- Name: maintenance_symbols maintenance_symbols_symbol_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.maintenance_symbols
    ADD CONSTRAINT maintenance_symbols_symbol_key UNIQUE (symbol);


--
-- Name: messages messages_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.messages
    ADD CONSTRAINT messages_pkey PRIMARY KEY (id);


--
-- Name: round_forced_directions round_forced_directions_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.round_forced_directions
    ADD CONSTRAINT round_forced_directions_pkey PRIMARY KEY (id);


--
-- Name: round_results round_results_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.round_results
    ADD CONSTRAINT round_results_pkey PRIMARY KEY (id);


--
-- Name: settings settings_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.settings
    ADD CONSTRAINT settings_pkey PRIMARY KEY (key);


--
-- Name: transaction_requests transaction_requests_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.transaction_requests
    ADD CONSTRAINT transaction_requests_pkey PRIMARY KEY (id);


--
-- Name: user_sessions user_sessions_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.user_sessions
    ADD CONSTRAINT user_sessions_pkey PRIMARY KEY (sid);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: users users_username_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key UNIQUE (username);


--
-- Name: IDX_user_sessions_expire; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IDX_user_sessions_expire" ON public.user_sessions USING btree (expire);


--
-- Name: bets bets_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.bets
    ADD CONSTRAINT bets_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- Name: inquiries inquiries_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.inquiries
    ADD CONSTRAINT inquiries_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- Name: login_history login_history_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.login_history
    ADD CONSTRAINT login_history_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- Name: messages messages_receiver_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.messages
    ADD CONSTRAINT messages_receiver_id_fkey FOREIGN KEY (receiver_id) REFERENCES public.users(id);


--
-- Name: messages messages_sender_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.messages
    ADD CONSTRAINT messages_sender_id_fkey FOREIGN KEY (sender_id) REFERENCES public.users(id);


--
-- Name: transaction_requests transaction_requests_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.transaction_requests
    ADD CONSTRAINT transaction_requests_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- PostgreSQL database dump complete
--

\unrestrict g6fKiAfGRfIzb3NG8KMWwBBzyjvUtpkY9aJoWGAdsHSG2uIqjs0vc9e4c9TvkCs

