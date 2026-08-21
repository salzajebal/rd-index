--
-- PostgreSQL database dump
--

\restrict uKC6YSJmTcNnecAmJC2bKNkP4uLAWYKDwiTghTKCp48gD953qTyY3uOIldZRcoE

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
22802	DXY	300	1787217900	98.633769	98.634868	98.596695	98.609722
22977	SP500	300	1787218200	7707.995946	7709.340988	7706.416529	7708.132841
21939	SP500	300	1786761600	7785.851432	7787.644497	7784.648649	7785.036831
21940	DOW	300	1786761600	53729.882808	53743.633264	53723.952507	53735.830467
21941	DXY	300	1786761600	99.635692	99.651186	99.626393	99.638988
20667	SP500	300	1786691700	7800.081127	7800.453522	7797.387059	7799.089961
20668	DOW	300	1786691700	53845.141990	53848.630830	53828.749376	53848.630830
20669	DXY	300	1786691700	99.788231	99.823795	99.785916	99.801034
22978	DOW	300	1787218200	53467.339111	53475.848548	53455.247286	53464.060501
20304	SP500	300	1786691100	7799.219629	7800.638942	7797.416865	7797.416865
20305	DOW	300	1786691100	53828.785767	53849.820640	53828.785767	53840.930911
20306	DXY	300	1786691100	99.838804	99.841327	99.806261	99.814373
22979	DXY	300	1787218200	98.608816	98.615098	98.564303	98.594143
21762	SP500	300	1786761300	7786.362236	7787.003409	7784.459183	7786.029745
21763	DOW	300	1786761300	53731.088816	53740.057762	53726.012494	53730.999655
21764	DXY	300	1786761300	99.633061	99.645984	99.623322	99.636608
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
23301	SP500	120	1787218680	7707.980000	7708.909879	7707.778807	7708.079135
23302	CRUDE	120	1787218680	86.530000	86.573259	86.521556	86.554510
23303	GOLD	120	1787218680	4545.600000	4547.442367	4545.498528	4547.395068
22122	SP500	300	1786761900	7785.174650	7787.109680	7784.562144	7785.720147
22123	DOW	300	1786761900	53736.116747	53747.950449	53726.784171	53731.788498
22124	DXY	300	1786761900	99.640356	99.652146	99.626962	99.628036
23304	DOW	120	1787218680	53463.050000	53471.669955	53456.896680	53457.227491
23305	VIX	120	1787218680	15.140000	15.143272	15.137593	15.139535
20850	SP500	300	1786692000	7799.387532	7800.004543	7797.243698	7799.789447
20851	DOW	300	1786692000	53848.218969	53850.524678	53828.261217	53850.524678
20852	DXY	300	1786692000	99.800882	99.806523	99.786266	99.800929
20121	SP500	300	1786690800	7799.518125	7800.192542	7797.721791	7799.198143
20122	DOW	300	1786690800	53845.921931	53852.296977	53827.895104	53830.201777
20123	DXY	300	1786690800	99.826063	99.841159	99.811263	99.841159
22737	SP500	300	1787217600	7707.980000	7708.782249	7706.704643	7707.431965
21708	SP500	300	1786761000	7785.760000	7787.601721	7784.959931	7786.417493
21709	DOW	300	1786761000	53732.410000	53740.350952	53725.112505	53733.238046
21573	SP500	300	1786693200	7799.209406	7800.311467	7797.883924	7799.834561
21574	DOW	300	1786693200	53838.664212	53849.729743	53831.159676	53849.729743
21575	DXY	300	1786693200	99.805274	99.820265	99.787888	99.803119
21710	DXY	300	1786761000	99.636000	99.641179	99.625418	99.635170
22738	DOW	300	1787217600	53463.050000	53468.600011	53453.155388	53467.634867
22739	DXY	300	1787217600	98.632000	98.639695	98.617882	98.633561
22671	SP500	300	1786762800	7785.363015	7786.835307	7784.128700	7785.723928
22672	DOW	300	1786762800	53732.003964	53742.589728	53717.197289	53738.290927
22673	DXY	300	1786762800	99.634536	99.646451	99.623800	99.635527
22488	SP500	300	1786762500	7785.937923	7787.301963	7784.744090	7785.280727
22489	DOW	300	1786762500	53734.331007	53745.617653	53721.147674	53732.666392
22490	DXY	300	1786762500	99.639514	99.649979	99.625081	99.634818
22305	SP500	300	1786762200	7785.785696	7787.447135	7784.947017	7785.829028
22306	DOW	300	1786762200	53731.603290	53741.866660	53721.405132	53734.349927
22307	DXY	300	1786762200	99.626969	99.645572	99.621648	99.640725
23465	VIX	120	1787218920	15.128431	15.133572	15.113339	15.125363
23585	VIX	120	1787219040	15.125117	15.162017	15.124061	15.159673
23461	SP500	120	1787218920	7708.125333	7709.041764	7706.485619	7707.750202
23462	CRUDE	120	1787218920	86.561363	86.592762	86.459393	86.459393
23157	SP500	300	1787218500	7708.429514	7708.904521	7706.716328	7708.267563
23158	DOW	300	1787218500	53462.098681	53473.437526	53452.641565	53467.323876
22800	SP500	300	1787217900	7707.532373	7708.741258	7706.122146	7708.007416
22801	DOW	300	1787217900	53466.741546	53470.633820	53455.438007	53467.490764
23159	DXY	300	1787218500	98.592024	98.619574	98.581826	98.600949
23463	GOLD	120	1787218920	4546.026059	4546.999132	4544.539730	4545.200377
23464	DOW	120	1787218920	53461.204682	53472.712592	53449.214683	53459.767026
23361	SP500	120	1787218800	7708.033008	7708.905043	7706.094546	7708.097052
23362	CRUDE	120	1787218800	86.553558	86.600717	86.553558	86.563824
23363	GOLD	120	1787218800	4547.242010	4547.242010	4544.093523	4546.146987
23364	DOW	120	1787218800	53456.495172	53471.881184	53454.047101	53461.444098
23365	VIX	120	1787218800	15.140560	15.147691	15.127022	15.128661
23704	DOW	120	1787219160	53459.444038	53468.653498	53454.458523	53462.482662
23581	SP500	120	1787219040	7707.471016	7709.180186	7706.685275	7707.737927
23582	CRUDE	120	1787219040	86.456528	86.545483	86.439682	86.540715
23583	GOLD	120	1787219040	4545.037761	4545.483161	4542.981969	4544.185449
23584	DOW	120	1787219040	53459.903881	53470.493826	53457.157008	53461.105954
23705	VIX	120	1787219160	15.159417	15.175466	15.154309	15.172224
23818	GOLD	120	1787219280	4542.048420	4543.268897	4540.909009	4542.716858
23701	SP500	120	1787219160	7707.646040	7709.155828	7707.337424	7708.045037
23702	CRUDE	120	1787219160	86.543120	86.546201	86.444653	86.448342
23703	GOLD	120	1787219160	4544.086541	4545.260113	4542.040521	4542.228777
23816	SP500	120	1787219280	7708.040602	7709.071014	7706.925096	7707.747415
23817	CRUDE	120	1787219280	86.448096	86.453076	86.320000	86.320675
23937	CRUDE	120	1787219400	86.323586	86.480588	86.322119	86.450852
23938	GOLD	120	1787219400	4542.800751	4544.340670	4542.663588	4543.067192
23939	DOW	120	1787219400	53459.859519	53470.853999	53456.914817	53462.019358
23940	VIX	120	1787219400	15.210123	15.224482	15.204653	15.209566
24296	SP500	120	1787219760	7707.961775	7708.583593	7706.807209	7707.829574
24297	CRUDE	120	1787219760	86.276326	86.425437	86.276326	86.416948
24298	GOLD	120	1787219760	4544.646637	4545.627368	4542.675293	4542.675293
24299	DOW	120	1787219760	53460.813271	53470.848369	53455.947541	53463.490575
24300	VIX	120	1787219760	15.201265	15.221516	15.187437	15.210202
25138	GOLD	120	1787220600	4540.142246	4540.276342	4536.283595	4538.147110
25139	DOW	120	1787220600	53458.682405	53469.066104	53458.352834	53461.525473
25140	VIX	120	1787220600	15.207806	15.214424	15.197666	15.208838
24171	SP500	120	1787219640	7707.780515	7709.512639	7706.597505	7707.872394
24172	CRUDE	120	1787219640	86.323744	86.353205	86.267347	86.273363
24173	GOLD	120	1787219640	4546.895602	4547.086695	4544.760186	4544.782577
24174	DOW	120	1787219640	53467.627905	53469.054507	53456.602984	53462.098546
24175	VIX	120	1787219640	15.206819	15.212979	15.193876	15.200024
25630	VIX	120	1787221080	15.210113	15.222970	15.193503	15.193503
24526	SP500	120	1787220000	7707.856627	7709.010349	7706.282417	7707.877749
24527	CRUDE	120	1787220000	86.506491	86.630000	86.499557	86.626476
24528	GOLD	120	1787220000	4541.764316	4542.900000	4540.783148	4541.513532
24529	DOW	120	1787220000	53459.872301	53467.321645	53451.929724	53465.363485
24530	VIX	120	1787220000	15.195705	15.201920	15.187579	15.190911
23819	DOW	120	1787219280	53464.242288	53470.307145	53455.990207	53460.943398
23820	VIX	120	1787219280	15.170864	15.214742	15.170530	15.211503
24056	SP500	120	1787219520	7708.591503	7708.956035	7706.535356	7708.048839
24057	CRUDE	120	1787219520	86.448573	86.463719	86.292638	86.321336
24058	GOLD	120	1787219520	4543.045898	4546.995138	4542.432683	4546.861360
24059	DOW	120	1787219520	53460.421848	53470.092335	53454.310320	53468.348181
24060	VIX	120	1787219520	15.210533	15.217122	15.205371	15.206531
25750	VIX	120	1787221200	15.192267	15.213933	15.191797	15.200866
25626	SP500	120	1787221080	7707.936815	7709.070116	7707.111057	7708.798873
25386	SP500	120	1787220840	7708.589638	7709.149649	7707.415515	7707.632437
25387	CRUDE	120	1787220840	86.562480	86.584561	86.525050	86.576945
25011	SP500	120	1787220480	7708.684211	7708.882158	7706.115744	7707.855120
25012	CRUDE	120	1787220480	86.761464	86.809262	86.738731	86.787561
25013	GOLD	120	1787220480	4538.966030	4541.164887	4538.896584	4540.150754
25014	DOW	120	1787220480	53463.901693	53473.332464	53455.453001	53457.011421
24771	SP500	120	1787220240	7708.609516	7709.109383	7706.868780	7708.085766
24772	CRUDE	120	1787220240	86.731030	86.773511	86.610000	86.730667
24773	GOLD	120	1787220240	4539.363273	4540.300000	4538.893973	4539.025048
24774	DOW	120	1787220240	53460.819052	53468.016674	53457.550395	53465.770805
24775	VIX	120	1787220240	15.202930	15.204657	15.195588	15.199397
25015	VIX	120	1787220480	15.233577	15.233577	15.208102	15.208102
24651	SP500	120	1787220120	7708.026292	7709.099580	7706.546678	7708.329797
24652	CRUDE	120	1787220120	86.623701	86.755932	86.619901	86.730201
24653	GOLD	120	1787220120	4541.419919	4542.550584	4539.396590	4539.537560
24654	DOW	120	1787220120	53464.101267	53471.193199	53454.122110	53461.644908
24655	VIX	120	1787220120	15.192379	15.203973	15.183281	15.203973
23936	SP500	120	1787219400	7707.606337	7708.707095	7706.412775	7708.707095
24891	SP500	120	1787220360	7707.937225	7710.428689	7707.325892	7708.422540
24892	CRUDE	120	1787220360	86.731387	86.785290	86.707900	86.760812
24893	GOLD	120	1787220360	4538.986956	4540.150207	4538.478872	4539.029667
24894	DOW	120	1787220360	53467.400508	53469.166857	53454.021091	53464.432480
24895	VIX	120	1787220360	15.199909	15.233573	15.196927	15.233573
24411	SP500	120	1787219880	7707.654184	7709.391548	7706.583485	7707.919577
24412	CRUDE	120	1787219880	86.414426	86.540000	86.412067	86.509013
24413	GOLD	120	1787219880	4542.496259	4543.435623	4541.731420	4541.921817
24414	DOW	120	1787219880	53463.754973	53473.750640	53456.275642	53459.433304
24415	VIX	120	1787219880	15.208988	15.216581	15.195927	15.196661
25388	GOLD	120	1787220840	4542.105750	4543.158558	4541.306975	4542.860921
25389	DOW	120	1787220840	53463.620259	53467.505503	53456.710787	53463.599065
25390	VIX	120	1787220840	15.218087	15.234309	15.199657	15.231666
25511	SP500	120	1787220960	7707.540203	7708.959696	7707.184384	7707.678243
25261	SP500	120	1787220720	7708.720417	7709.187462	7707.311071	7708.430985
25262	CRUDE	120	1787220720	86.719309	86.720554	86.547176	86.560479
25263	GOLD	120	1787220720	4538.299161	4542.100000	4538.116316	4541.982332
25264	DOW	120	1787220720	53459.863907	53471.625756	53454.599204	53463.374573
25265	VIX	120	1787220720	15.209656	15.221382	15.206078	15.219347
25136	SP500	120	1787220600	7707.651487	7709.919838	7707.278013	7708.511067
25137	CRUDE	120	1787220600	86.785164	86.812270	86.715976	86.717039
25512	CRUDE	120	1787220960	86.579636	86.603193	86.488079	86.556411
25513	GOLD	120	1787220960	4542.818605	4543.853649	4542.214636	4543.370641
25627	CRUDE	120	1787221080	86.556840	86.640194	86.556300	86.638379
25628	GOLD	120	1787221080	4543.512751	4546.442318	4542.461007	4546.429784
25514	DOW	120	1787220960	53461.786395	53468.990832	53458.838401	53461.897811
25515	VIX	120	1787220960	15.231484	15.232892	15.207420	15.208610
25629	DOW	120	1787221080	53460.113393	53469.014894	53456.442676	53461.728329
25746	SP500	120	1787221200	7708.842606	7709.319249	7706.358494	7707.995531
25747	CRUDE	120	1787221200	86.640093	86.702924	86.629358	86.701577
25748	GOLD	120	1787221200	4546.488362	4546.788430	4544.793121	4544.986678
25749	DOW	120	1787221200	53460.691838	53470.874980	53459.067302	53465.651923
25866	SP500	120	1787221320	7707.735558	7709.075047	7707.130976	7708.245678
25867	CRUDE	120	1787221320	86.703508	86.705176	86.641279	86.667950
25868	GOLD	120	1787221320	4545.163636	4546.750638	4544.725958	4546.700170
25869	DOW	120	1787221320	53464.077975	53468.769544	53456.939660	53465.003752
25870	VIX	120	1787221320	15.201071	15.204094	15.183862	15.191043
25991	SP500	120	1787221440	7708.415468	7709.411343	7706.598248	7707.846937
25992	CRUDE	120	1787221440	86.669587	86.699381	86.651814	86.673757
25993	GOLD	120	1787221440	4546.671286	4548.289093	4546.249085	4546.777809
27607	CRUDE	120	1787223000	86.648969	86.743096	86.648870	86.676107
27608	GOLD	120	1787223000	4546.814371	4547.594048	4546.302729	4547.049728
27609	DOW	120	1787223000	53460.531756	53473.407590	53455.615230	53461.368811
27236	SP500	120	1787222640	7708.594929	7709.315187	7707.534312	7708.339353
27237	CRUDE	120	1787222640	86.627235	86.649831	86.607155	86.615928
27238	GOLD	120	1787222640	4550.161685	4550.279864	4548.376463	4549.428794
26116	SP500	120	1787221560	7707.804980	7709.306418	7706.949116	7708.163336
26117	CRUDE	120	1787221560	86.675891	86.699273	86.590000	86.592742
26118	GOLD	120	1787221560	4546.639047	4548.289475	4546.056837	4547.336561
26119	DOW	120	1787221560	53464.034003	53468.411552	53456.320815	53458.318531
26120	VIX	120	1787221560	15.178652	15.182047	15.145345	15.158928
27239	DOW	120	1787222640	53466.010469	53471.465716	53458.083925	53462.095111
26991	SP500	120	1787222400	7708.109078	7709.476237	7706.626088	7708.167594
26992	CRUDE	120	1787222400	86.586251	86.683331	86.576235	86.681547
26993	GOLD	120	1787222400	4550.183851	4551.247881	4549.491252	4550.510249
26994	DOW	120	1787222400	53464.429024	53467.841657	53455.741041	53465.024234
26995	VIX	120	1787222400	15.160791	15.170624	15.144453	15.162828
27240	VIX	120	1787222640	15.139278	15.144949	15.125101	15.133095
26866	SP500	120	1787222280	7708.382201	7708.988398	7707.391187	7707.947703
26867	CRUDE	120	1787222280	86.636167	86.650000	86.588438	86.588438
26868	GOLD	120	1787222280	4547.297465	4550.243030	4546.583161	4550.243030
26869	DOW	120	1787222280	53459.667419	53470.220928	53449.746130	53466.037018
26870	VIX	120	1787222280	15.160179	15.162329	15.143752	15.159595
26491	SP500	120	1787221920	7707.581335	7709.272472	7706.654103	7707.678642
26492	CRUDE	120	1787221920	86.601946	86.620000	86.550000	86.617963
26493	GOLD	120	1787221920	4543.531151	4544.136832	4542.390369	4543.003625
26494	DOW	120	1787221920	53463.162082	53476.668842	53457.461737	53460.539801
26495	VIX	120	1787221920	15.143218	15.160000	15.138100	15.149463
26366	SP500	120	1787221800	7707.379986	7708.989516	7706.707952	7707.846826
25994	DOW	120	1787221440	53465.548422	53477.700480	53460.669904	53465.923145
25995	VIX	120	1787221440	15.190803	15.192780	15.176101	15.178794
26367	CRUDE	120	1787221800	86.646637	86.653830	86.581442	86.600264
26368	GOLD	120	1787221800	4547.002358	4547.300338	4543.442352	4543.528838
26369	DOW	120	1787221800	53460.096402	53477.067035	53455.114355	53464.927068
26370	VIX	120	1787221800	15.151378	15.152448	15.135091	15.141711
26616	SP500	120	1787222040	7707.402588	7709.020362	7706.551248	7707.373090
26617	CRUDE	120	1787222040	86.618171	86.631358	86.578979	86.614532
26241	SP500	120	1787221680	7708.325129	7709.107496	7707.066129	7707.678927
26242	CRUDE	120	1787221680	86.593181	86.667276	86.582449	86.649628
26243	GOLD	120	1787221680	4547.439690	4548.153701	4546.747032	4546.885567
26244	DOW	120	1787221680	53458.667428	53470.630407	53454.707990	53461.282618
26245	VIX	120	1787221680	15.159445	15.164930	15.145288	15.152000
26618	GOLD	120	1787222040	4542.930530	4547.346465	4542.253992	4546.269331
26619	DOW	120	1787222040	53462.116714	53470.785555	53453.909452	53462.622843
26620	VIX	120	1787222040	15.149528	15.164741	15.149528	15.161365
27610	VIX	120	1787223000	15.110068	15.173734	15.109521	15.173734
27111	SP500	120	1787222520	7708.119722	7709.096550	7706.713277	7708.455308
27112	CRUDE	120	1787222520	86.684195	86.685367	86.626572	86.626572
27113	GOLD	120	1787222520	4550.513979	4551.590557	4549.900000	4550.062232
27114	DOW	120	1787222520	53463.055907	53469.437980	53452.689390	53466.353846
27115	VIX	120	1787222520	15.163466	15.167067	15.129164	15.140195
26741	SP500	120	1787222160	7707.562309	7708.281590	7706.311686	7708.136237
26742	CRUDE	120	1787222160	86.613417	86.679787	86.582476	86.633368
26743	GOLD	120	1787222160	4546.337689	4547.631619	4545.816014	4547.136404
26744	DOW	120	1787222160	53462.131652	53473.758839	53452.674373	53459.919359
26745	VIX	120	1787222160	15.160641	15.165645	15.148814	15.161138
27481	SP500	120	1787222880	7708.102122	7709.122520	7707.008395	7708.133934
27482	CRUDE	120	1787222880	86.591581	86.660451	86.586090	86.648141
27483	GOLD	120	1787222880	4550.171904	4550.397949	4546.634194	4546.743094
27484	DOW	120	1787222880	53463.263581	53470.026346	53454.314421	53462.597752
27485	VIX	120	1787222880	15.121698	15.122968	15.105766	15.109500
27356	SP500	120	1787222760	7708.575201	7709.061551	7706.789317	7708.373745
27357	CRUDE	120	1787222760	86.619001	86.670000	86.523183	86.594465
27358	GOLD	120	1787222760	4549.324641	4550.688515	4548.609581	4550.194605
27359	DOW	120	1787222760	53462.404501	53469.781156	53457.579468	53463.699820
27360	VIX	120	1787222760	15.132514	15.135796	15.119430	15.122118
27733	GOLD	120	1787223120	4547.166196	4548.185974	4546.773500	4547.467775
27734	DOW	120	1787223120	53459.469833	53468.776042	53457.139763	53461.341337
27735	VIX	120	1787223120	15.172821	15.174916	15.149495	15.160029
27857	CRUDE	120	1787223240	86.654650	86.743772	86.614765	86.737951
27858	GOLD	120	1787223240	4547.578889	4548.099486	4546.164225	4547.086359
27859	DOW	120	1787223240	53460.984991	53474.247988	53455.767688	53458.637346
27731	SP500	120	1787223120	7708.027988	7709.167070	7706.928593	7708.937070
27606	SP500	120	1787223000	7708.156213	7708.939099	7707.152567	7708.211784
27732	CRUDE	120	1787223120	86.676265	86.700355	86.637375	86.653600
28104	DOW	120	1787223480	53462.443426	53467.251426	53456.093687	53463.701340
27976	SP500	120	1787223360	7707.826117	7709.756752	7706.732149	7707.270039
27977	CRUDE	120	1787223360	86.741360	86.783434	86.666588	86.673078
27860	VIX	120	1787223240	15.161472	15.165917	15.146745	15.158959
27978	GOLD	120	1787223360	4547.254367	4547.562883	4544.531324	4546.981548
27856	SP500	120	1787223240	7708.644523	7709.558711	7706.161754	7707.938839
27979	DOW	120	1787223360	53459.699806	53472.289658	53459.352092	53463.834912
27980	VIX	120	1787223360	15.159633	15.165210	15.148651	15.149706
28105	VIX	120	1787223480	15.148771	15.155904	15.145510	15.151170
28101	SP500	120	1787223480	7707.428292	7708.880730	7706.793096	7708.500031
28102	CRUDE	120	1787223480	86.675879	86.707911	86.667344	86.683064
28103	GOLD	120	1787223480	4546.937375	4547.600094	4545.918325	4545.996144
28216	SP500	120	1787223600	7708.528556	7709.061713	7706.788972	7708.389150
28217	CRUDE	120	1787223600	86.682486	86.759433	86.680154	86.711877
28218	GOLD	120	1787223600	4545.854032	4547.762974	4545.322345	4546.318561
29592	CRUDE	120	1787224920	86.885884	86.909454	86.857802	86.884543
29593	GOLD	120	1787224920	4542.478642	4543.600000	4541.293817	4541.463547
29594	DOW	120	1787224920	53462.156795	53471.373932	53457.189310	53458.152787
29595	VIX	120	1787224920	15.168171	15.174672	15.162799	15.169393
28341	SP500	120	1787223720	7708.308272	7709.343475	7706.530727	7706.903253
28342	CRUDE	120	1787223720	86.712848	86.723945	86.663727	86.706066
28343	GOLD	120	1787223720	4546.476746	4546.520759	4544.502801	4544.849655
28344	DOW	120	1787223720	53459.438078	53469.630467	53455.541352	53457.790664
28345	VIX	120	1787223720	15.150611	15.156853	15.117489	15.119005
30216	SP500	120	1787225520	7708.628431	7708.921162	7706.908089	7708.140192
29966	SP500	120	1787225280	7708.078976	7709.265162	7706.784186	7706.784186
29841	SP500	120	1787225160	7707.571432	7709.501349	7706.866734	7708.276956
29216	SP500	120	1787224560	7708.164449	7709.022223	7707.024142	7708.007348
29217	CRUDE	120	1787224560	86.841329	86.914247	86.840333	86.883912
29218	GOLD	120	1787224560	4542.778997	4544.481465	4542.671129	4544.221353
29219	DOW	120	1787224560	53460.475272	53471.301255	53454.050965	53460.986280
29220	VIX	120	1787224560	15.129289	15.140481	15.123259	15.140481
29091	SP500	120	1787224440	7708.840418	7709.149827	7707.177753	7707.974201
29092	CRUDE	120	1787224440	86.798492	86.873897	86.793475	86.839571
29093	GOLD	120	1787224440	4546.209971	4546.239288	4542.536800	4542.671735
29094	DOW	120	1787224440	53456.728033	53474.591456	53456.728033	53461.784139
29095	VIX	120	1787224440	15.123181	15.132150	15.093495	15.128086
28716	SP500	120	1787224080	7708.473622	7709.281435	7707.313458	7708.941181
28717	CRUDE	120	1787224080	86.680157	86.734256	86.668920	86.734256
28718	GOLD	120	1787224080	4545.542672	4546.978064	4544.876212	4546.027561
28719	DOW	120	1787224080	53462.988448	53469.038266	53454.368125	53462.497223
28720	VIX	120	1787224080	15.112984	15.125588	15.104081	15.125588
28591	SP500	120	1787223960	7708.561529	7709.533721	7706.383828	7708.711625
28219	DOW	120	1787223600	53463.323762	53468.177511	53457.756081	53459.182277
28220	VIX	120	1787223600	15.152060	15.157516	15.146769	15.150773
28592	CRUDE	120	1787223960	86.714024	86.730000	86.626890	86.681541
28593	GOLD	120	1787223960	4544.916504	4546.258231	4543.893958	4545.455365
28594	DOW	120	1787223960	53468.194975	53469.894627	53457.184664	53460.921282
28595	VIX	120	1787223960	15.106305	15.125002	15.104663	15.111933
28466	SP500	120	1787223840	7706.773193	7709.274943	7706.702853	7708.299116
28467	CRUDE	120	1787223840	86.706321	86.731254	86.698534	86.717039
28468	GOLD	120	1787223840	4545.021969	4545.456717	4542.796566	4545.024541
28469	DOW	120	1787223840	53459.704403	53472.221948	53453.628037	53469.107031
28470	VIX	120	1787223840	15.119033	15.121256	15.104202	15.106740
28841	SP500	120	1787224200	7709.051402	7709.583756	7707.215648	7707.636554
28842	CRUDE	120	1787224200	86.735050	86.756694	86.696568	86.756694
28843	GOLD	120	1787224200	4545.851118	4547.295685	4544.068955	4547.075169
28844	DOW	120	1787224200	53460.912764	53465.668971	53452.040207	53461.758479
28845	VIX	120	1787224200	15.124570	15.125503	15.115873	15.118350
29842	CRUDE	120	1787225160	86.911869	86.934561	86.885876	86.892265
29466	SP500	120	1787224800	7707.684202	7708.841351	7706.983989	7707.263890
29467	CRUDE	120	1787224800	86.859519	86.903838	86.815321	86.887942
29468	GOLD	120	1787224800	4543.823837	4544.205304	4541.574504	4542.586034
29469	DOW	120	1787224800	53457.333472	53470.052549	53457.184034	53460.554860
29470	VIX	120	1787224800	15.126365	15.182217	15.122236	15.167467
29341	SP500	120	1787224680	7708.206882	7709.805460	7706.915492	7707.425437
29342	CRUDE	120	1787224680	86.881816	86.909998	86.820000	86.861718
29343	GOLD	120	1787224680	4544.178640	4544.719558	4541.812734	4543.725291
29344	DOW	120	1787224680	53458.857351	53476.553990	53454.228019	53459.152163
28966	SP500	120	1787224320	7707.932328	7709.184713	7706.841722	7708.921169
28967	CRUDE	120	1787224320	86.757835	86.814052	86.740000	86.801393
28968	GOLD	120	1787224320	4547.125410	4547.400000	4546.025311	4546.135805
28969	DOW	120	1787224320	53463.333414	53471.837600	53456.393990	53457.087843
28970	VIX	120	1787224320	15.117357	15.124401	15.115726	15.121968
29345	VIX	120	1787224680	15.139059	15.142142	15.125088	15.127738
29843	GOLD	120	1787225160	4540.892353	4542.406657	4540.523145	4540.991679
29844	DOW	120	1787225160	53462.086688	53473.467146	53459.063434	53461.549884
29845	VIX	120	1787225160	15.183554	15.212350	15.181849	15.208516
29967	CRUDE	120	1787225280	86.890976	86.977522	86.863760	86.972738
29968	GOLD	120	1787225280	4541.047808	4541.306703	4537.203009	4538.956104
29716	SP500	120	1787225040	7708.669167	7709.508738	7706.906820	7707.367230
29717	CRUDE	120	1787225040	86.887112	86.921681	86.862528	86.912650
29718	GOLD	120	1787225040	4541.560911	4542.639615	4539.269348	4540.942441
29719	DOW	120	1787225040	53457.816825	53468.945648	53457.077823	53460.434718
29591	SP500	120	1787224920	7707.003644	7709.127053	7707.003644	7708.875307
29969	DOW	120	1787225280	53460.677334	53469.466951	53456.175602	53456.175602
29970	VIX	120	1787225280	15.209095	15.221913	15.203402	15.208048
29720	VIX	120	1787225040	15.169438	15.187387	15.168758	15.182406
30217	CRUDE	120	1787225520	87.029660	87.055078	86.995774	87.040746
30218	GOLD	120	1787225520	4540.574410	4542.524399	4538.757516	4541.967092
30219	DOW	120	1787225520	53461.578303	53469.433165	53456.707417	53458.786704
30220	VIX	120	1787225520	15.178381	15.192017	15.173306	15.191209
30091	SP500	120	1787225400	7706.662177	7708.846508	7706.541119	7708.728587
30092	CRUDE	120	1787225400	86.974252	87.050064	86.966019	87.032494
30093	GOLD	120	1787225400	4539.108028	4541.134832	4537.820929	4540.606773
30094	DOW	120	1787225400	53454.801815	53468.650195	53454.030042	53462.610116
30095	VIX	120	1787225400	15.208197	15.209561	15.179264	15.179479
30341	SP500	120	1787225640	7708.215378	7708.934068	7706.661319	7708.535850
30342	CRUDE	120	1787225640	87.038298	87.040163	86.954051	86.955736
30343	GOLD	120	1787225640	4541.873108	4545.787913	4541.213904	4545.533476
30344	DOW	120	1787225640	53459.082638	53473.266731	53455.793974	53464.160278
30345	VIX	120	1787225640	15.191408	15.220000	15.176010	15.214315
30466	SP500	120	1787225760	7708.234997	7709.246669	7706.788853	7707.603244
30467	CRUDE	120	1787225760	86.953427	87.013995	86.953427	86.980023
30468	GOLD	120	1787225760	4545.631074	4546.403010	4543.700000	4543.915177
32192	CRUDE	120	1787227440	87.145998	87.155263	87.103060	87.137508
32193	GOLD	120	1787227440	4526.276553	4526.433345	4522.242320	4525.648001
31951	SP500	120	1787227200	7708.455309	7709.113356	7706.152910	7707.542623
31952	CRUDE	120	1787227200	87.138183	87.255960	87.128884	87.194517
31953	GOLD	120	1787227200	4528.372570	4528.481061	4525.276317	4526.565160
31954	DOW	120	1787227200	53463.591177	53467.735018	53450.009900	53462.998289
30591	SP500	120	1787225880	7707.475518	7708.445280	7706.724340	7708.262747
30592	CRUDE	120	1787225880	86.979960	87.075589	86.976605	87.042320
30593	GOLD	120	1787225880	4543.813080	4543.987280	4540.802446	4540.802446
30594	DOW	120	1787225880	53463.868574	53472.238518	53450.554209	53467.912688
30595	VIX	120	1787225880	15.240280	15.272092	15.236189	15.268629
31461	SP500	120	1787226720	7708.244927	7708.882685	7706.720504	7708.539191
31462	CRUDE	120	1787226720	87.120804	87.180000	87.115660	87.130352
31463	GOLD	120	1787226720	4533.776432	4535.053316	4533.064265	4533.881746
31464	DOW	120	1787226720	53461.558995	53470.882933	53457.184835	53466.551542
31465	VIX	120	1787226720	15.321502	15.341105	15.309760	15.309760
31955	VIX	120	1787227200	15.348257	15.382975	15.346917	15.382050
31336	SP500	120	1787226600	7708.444411	7709.152255	7706.347019	7708.001746
31337	CRUDE	120	1787226600	87.130162	87.178997	87.106096	87.122731
31338	GOLD	120	1787226600	4537.971644	4538.732272	4533.637971	4533.637971
31339	DOW	120	1787226600	53460.438052	53469.062020	53454.505053	53461.680563
31340	VIX	120	1787226600	15.327755	15.331621	15.317836	15.321714
30961	SP500	120	1787226240	7707.702698	7709.214975	7706.500896	7707.924027
30962	CRUDE	120	1787226240	87.124737	87.157450	87.096133	87.146211
30963	GOLD	120	1787226240	4539.131472	4543.093419	4538.782421	4542.813406
30964	DOW	120	1787226240	53470.897589	53474.636922	53455.204912	53463.414377
30965	VIX	120	1787226240	15.341512	15.344752	15.313092	15.313092
30841	SP500	120	1787226120	7708.706803	7709.625135	7706.890069	7707.861197
30842	CRUDE	120	1787226120	87.114568	87.133052	87.083382	87.123113
30843	GOLD	120	1787226120	4540.824949	4543.032916	4539.116387	4539.288662
30844	DOW	120	1787226120	53465.727230	53469.003805	53455.613697	53468.840563
30845	VIX	120	1787226120	15.286136	15.343455	15.284414	15.341574
30469	DOW	120	1787225760	53462.570933	53469.126728	53453.703481	53463.298066
30470	VIX	120	1787225760	15.215818	15.242204	15.211769	15.241699
31086	SP500	120	1787226360	7708.047481	7708.942499	7706.867050	7706.915423
31087	CRUDE	120	1787226360	87.145863	87.224073	87.136930	87.189719
31088	GOLD	120	1787226360	4542.924236	4543.115433	4536.971298	4537.280657
31089	DOW	120	1787226360	53461.341434	53470.034985	53450.339854	53461.201459
31090	VIX	120	1787226360	15.312209	15.332690	15.309263	15.331391
30716	SP500	120	1787226000	7708.495905	7709.234545	7706.775438	7708.702692
30717	CRUDE	120	1787226000	87.040261	87.115779	87.036512	87.112551
30718	GOLD	120	1787226000	4540.681237	4541.200000	4539.413076	4540.758761
30719	DOW	120	1787226000	53469.569719	53471.643369	53458.558037	53465.279003
30720	VIX	120	1787226000	15.269858	15.292215	15.253971	15.285275
31706	SP500	120	1787226960	7708.789810	7709.164977	7707.332083	7707.332083
31707	CRUDE	120	1787226960	87.068411	87.104364	86.983461	87.089416
31708	GOLD	120	1787226960	4526.458376	4528.138474	4524.582464	4526.426672
31709	DOW	120	1787226960	53459.025573	53470.715888	53453.261751	53456.254925
31710	VIX	120	1787226960	15.300332	15.362557	15.298107	15.332744
31581	SP500	120	1787226840	7708.424343	7709.513617	7707.021320	7708.706374
31582	CRUDE	120	1787226840	87.127078	87.176284	87.063813	87.065247
31583	GOLD	120	1787226840	4534.045467	4534.045467	4526.429462	4526.429462
31584	DOW	120	1787226840	53465.180905	53469.331562	53456.453226	53458.554181
31585	VIX	120	1787226840	15.308525	15.316957	15.286953	15.299002
31211	SP500	120	1787226480	7706.951426	7708.481767	7706.951426	7708.251231
31212	CRUDE	120	1787226480	87.191109	87.194617	87.120787	87.127613
31213	GOLD	120	1787226480	4537.420200	4539.181737	4536.276069	4537.843173
31214	DOW	120	1787226480	53462.578612	53467.838515	53452.291035	53458.827548
31215	VIX	120	1787226480	15.329884	15.340976	15.320000	15.329044
32194	DOW	120	1787227440	53465.319761	53469.234303	53455.671471	53455.708188
32195	VIX	120	1787227440	15.391753	15.454755	15.391753	15.454755
31831	SP500	120	1787227080	7707.394343	7708.678759	7705.831204	7708.190280
31832	CRUDE	120	1787227080	87.091376	87.190784	87.091226	87.135356
31833	GOLD	120	1787227080	4526.324158	4528.541496	4522.900000	4528.206739
31834	DOW	120	1787227080	53456.102369	53469.011347	53452.082979	53461.485391
31835	VIX	120	1787227080	15.332729	15.351167	15.318677	15.349103
32071	SP500	120	1787227320	7707.447585	7708.959131	7707.337009	7708.278355
32072	CRUDE	120	1787227320	87.191854	87.232035	87.135771	87.146203
32073	GOLD	120	1787227320	4526.409169	4526.484946	4523.713161	4526.240729
32074	DOW	120	1787227320	53463.402650	53472.317375	53453.051540	53464.046089
32075	VIX	120	1787227320	15.383531	15.400000	15.375644	15.392048
32311	SP500	120	1787227560	7708.332798	7708.742928	7706.599562	7708.236973
32435	VIX	120	1787227680	15.442059	15.447892	15.428336	15.441559
32555	VIX	120	1787227800	15.441850	15.490965	15.440017	15.489504
32312	CRUDE	120	1787227560	87.135747	87.206232	87.125724	87.205385
32313	GOLD	120	1787227560	4525.709099	4527.664895	4521.742186	4521.923874
32314	DOW	120	1787227560	53454.911873	53471.130475	53454.334207	53461.253779
32191	SP500	120	1787227440	7708.486264	7709.001554	7707.341571	7708.258307
32315	VIX	120	1787227560	15.454883	15.454973	15.435945	15.442262
32431	SP500	120	1787227680	7708.091602	7709.868564	7706.527146	7708.176323
32432	CRUDE	120	1787227680	87.206787	87.248768	87.175744	87.216568
32433	GOLD	120	1787227680	4521.861968	4524.388491	4521.772101	4522.537763
32434	DOW	120	1787227680	53460.411705	53470.219315	53456.793677	53457.377576
32551	SP500	120	1787227800	7708.004486	7709.421343	7706.690364	7707.428113
32552	CRUDE	120	1787227800	87.216770	87.287711	87.202653	87.277060
32553	GOLD	120	1787227800	4522.567245	4522.567245	4516.456509	4516.591757
32554	DOW	120	1787227800	53458.711786	53466.832533	53450.280730	53464.932406
32671	SP500	120	1787227920	7707.256946	7709.790499	7706.847141	7708.289810
32672	CRUDE	120	1787227920	87.280369	87.291016	87.193406	87.213416
32673	GOLD	120	1787227920	4516.755626	4516.973889	4513.912694	4514.365983
33764	DOW	120	1787229000	53466.169495	53474.237301	53456.225723	53463.504004
33765	VIX	120	1787229000	15.955300	15.973656	15.935590	15.935590
32796	SP500	120	1787228040	7708.376063	7709.282315	7707.665588	7708.608476
32797	CRUDE	120	1787228040	87.215343	87.278609	87.215065	87.246442
32798	GOLD	120	1787228040	4514.186582	4515.260895	4509.653963	4509.731510
32799	DOW	120	1787228040	53467.017868	53472.686057	53455.046356	53456.513786
32800	VIX	120	1787228040	15.561613	15.586473	15.558434	15.580118
34888	GOLD	120	1787230080	4512.867601	4517.412531	4512.620795	4517.371146
34136	SP500	120	1787229360	7707.779766	7709.014693	7706.378316	7706.378316
34137	CRUDE	120	1787229360	87.514589	87.529192	87.428183	87.451436
34138	GOLD	120	1787229360	4516.197164	4516.197164	4512.764230	4513.805195
33281	SP500	120	1787228520	7707.582698	7709.273892	7706.948117	7707.785573
33161	SP500	120	1787228400	7708.745985	7708.889433	7707.073804	7707.345538
33162	CRUDE	120	1787228400	87.288896	87.360622	87.250000	87.332773
33163	GOLD	120	1787228400	4511.567887	4516.200603	4511.481363	4515.570695
33164	DOW	120	1787228400	53463.392707	53471.285316	53457.874404	53463.794161
33165	VIX	120	1787228400	15.720760	15.840000	15.719153	15.839123
33282	CRUDE	120	1787228520	87.332986	87.448279	87.328435	87.429024
33283	GOLD	120	1787228520	4515.719930	4521.677918	4515.582668	4521.677918
33041	SP500	120	1787228280	7708.050782	7708.853620	7706.977119	7708.498122
33042	CRUDE	120	1787228280	87.202171	87.290286	87.192460	87.287181
33043	GOLD	120	1787228280	4510.781742	4512.700000	4509.759001	4511.706135
33044	DOW	120	1787228280	53461.802924	53470.444715	53459.003597	53462.698756
33045	VIX	120	1787228280	15.634743	15.742876	15.634284	15.721064
33284	DOW	120	1787228520	53464.329624	53467.170379	53453.989896	53466.271013
33285	VIX	120	1787228520	15.839025	15.892055	15.836004	15.891187
32674	DOW	120	1787227920	53466.989359	53466.989359	53456.593649	53465.261316
32675	VIX	120	1787227920	15.489223	15.563850	15.488696	15.562403
34139	DOW	120	1787229360	53457.446121	53472.199711	53456.892469	53460.063837
34140	VIX	120	1787229360	15.968370	15.974024	15.949379	15.956366
34011	SP500	120	1787229240	7707.705195	7709.310312	7707.518943	7707.992602
34012	CRUDE	120	1787229240	87.455383	87.514997	87.447934	87.511369
34013	GOLD	120	1787229240	4520.268190	4522.416845	4515.506691	4516.123866
32921	SP500	120	1787228160	7708.523756	7709.141577	7707.180942	7708.021720
32922	CRUDE	120	1787228160	87.243137	87.302636	87.198805	87.202205
32923	GOLD	120	1787228160	4509.795897	4511.716543	4506.224003	4510.605114
32924	DOW	120	1787228160	53454.983858	53469.649952	53452.701187	53460.095847
32925	VIX	120	1787228160	15.579274	15.638143	15.577851	15.633892
34014	DOW	120	1787229240	53460.421343	53471.464868	53448.948443	53459.420642
34015	VIX	120	1787229240	15.975422	16.020107	15.966491	15.967855
33401	SP500	120	1787228640	7708.037765	7709.328206	7706.667628	7707.776388
33402	CRUDE	120	1787228640	87.427748	87.508391	87.423986	87.497809
33403	GOLD	120	1787228640	4521.853325	4521.924785	4517.921842	4519.452203
33404	DOW	120	1787228640	53464.253212	53466.313509	53457.835073	53464.267328
33405	VIX	120	1787228640	15.891857	15.895293	15.846701	15.877049
33641	SP500	120	1787228880	7709.072679	7709.262910	7707.167911	7708.690996
33642	CRUDE	120	1787228880	87.514429	87.620773	87.506620	87.616682
33643	GOLD	120	1787228880	4521.446089	4522.610963	4520.300611	4521.612154
33644	DOW	120	1787228880	53463.451781	53467.712041	53456.053644	53464.588301
33645	VIX	120	1787228880	15.969295	16.010762	15.956014	15.956336
33886	SP500	120	1787229120	7708.183018	7708.961279	7707.366288	7707.942307
33887	CRUDE	120	1787229120	87.620252	87.622525	87.448563	87.456497
33521	SP500	120	1787228760	7707.825609	7708.982938	7707.387401	7708.830479
33522	CRUDE	120	1787228760	87.497966	87.513289	87.438531	87.513070
33523	GOLD	120	1787228760	4519.410029	4521.565884	4518.000000	4521.286615
33524	DOW	120	1787228760	53462.171822	53470.374308	53451.172677	53463.056330
33525	VIX	120	1787228760	15.877750	15.970000	15.877750	15.967937
33888	GOLD	120	1787229120	4518.895585	4520.794915	4518.237892	4520.129636
33889	DOW	120	1787229120	53462.759535	53475.080884	53455.453929	53459.848574
33890	VIX	120	1787229120	15.934247	15.974865	15.933315	15.974727
34636	SP500	120	1787229840	7707.733145	7709.479184	7706.967209	7707.987346
34637	CRUDE	120	1787229840	87.577090	87.579622	87.460062	87.489612
34638	GOLD	120	1787229840	4508.453186	4512.648920	4507.478682	4508.640009
34639	DOW	120	1787229840	53460.324433	53468.190767	53456.648920	53461.841295
34386	SP500	120	1787229600	7707.926702	7708.787612	7706.704672	7708.710031
34387	CRUDE	120	1787229600	87.577772	87.593819	87.489788	87.503747
33761	SP500	120	1787229000	7708.867453	7709.119907	7706.944957	7708.398095
33762	CRUDE	120	1787229000	87.614847	87.672171	87.614174	87.620106
33763	GOLD	120	1787229000	4521.652990	4522.470833	4517.854941	4518.893136
34388	GOLD	120	1787229600	4513.900527	4515.642471	4510.272359	4510.498618
34389	DOW	120	1787229600	53461.151265	53469.040381	53452.948062	53462.358493
34261	SP500	120	1787229480	7706.460409	7709.025318	7706.379815	7707.836626
34262	CRUDE	120	1787229480	87.453849	87.610000	87.450404	87.574709
34390	VIX	120	1787229600	15.923691	15.986933	15.920548	15.971181
34640	VIX	120	1787229840	16.011091	16.022772	15.975974	15.977628
34511	SP500	120	1787229720	7708.764526	7708.764526	7706.389967	7707.914651
34512	CRUDE	120	1787229720	87.505320	87.582986	87.462730	87.577905
34263	GOLD	120	1787229480	4513.820645	4515.446694	4512.563357	4513.837692
34264	DOW	120	1787229480	53461.906627	53473.145106	53450.073310	53462.781682
34265	VIX	120	1787229480	15.955257	15.995323	15.919799	15.922886
34513	GOLD	120	1787229720	4510.561879	4511.296882	4508.440936	4508.465725
34514	DOW	120	1787229720	53462.026247	53467.637674	53457.189012	53462.226552
34515	VIX	120	1787229720	15.970849	16.011714	15.943063	16.010687
34761	SP500	120	1787229960	7707.964755	7709.627859	7706.873240	7707.613975
34762	CRUDE	120	1787229960	87.486673	87.512198	87.428641	87.432437
34763	GOLD	120	1787229960	4508.563913	4515.832798	4507.500000	4512.835236
34764	DOW	120	1787229960	53462.709895	53470.097897	53459.545190	53466.351162
34765	VIX	120	1787229960	15.978555	16.052463	15.978249	16.006076
34886	SP500	120	1787230080	7707.824642	7709.157601	7706.735605	7708.017821
34887	CRUDE	120	1787230080	87.433843	87.452415	87.385885	87.388176
35007	CRUDE	120	1787230200	87.391062	87.392686	87.215746	87.229128
35008	GOLD	120	1787230200	4517.478811	4520.556688	4517.159618	4518.391446
35009	DOW	120	1787230200	53466.498836	53469.871567	53452.654974	53466.643343
35010	VIX	120	1787230200	16.012849	16.083227	15.995210	16.073281
36450	VIX	120	1787231640	15.841205	15.841205	15.790000	15.791551
36326	SP500	120	1787231520	7707.125578	7709.047238	7706.932052	7708.677843
35486	SP500	120	1787230680	7708.427005	7708.827011	7706.666461	7707.336649
35366	SP500	120	1787230560	7707.374188	7709.242705	7707.314547	7708.405824
35367	CRUDE	120	1787230560	87.005359	87.010000	86.895806	86.900741
35368	GOLD	120	1787230560	4520.907089	4524.300438	4520.660183	4523.393404
35369	DOW	120	1787230560	53464.766695	53472.701377	53456.269806	53457.849112
35370	VIX	120	1787230560	16.015390	16.050000	15.996309	16.043605
35487	CRUDE	120	1787230680	86.902412	86.917902	86.800194	86.800194
35246	SP500	120	1787230440	7707.832070	7708.965955	7706.909293	7707.423848
35247	CRUDE	120	1787230440	87.006345	87.145872	86.987057	87.005157
35248	GOLD	120	1787230440	4520.122177	4522.038266	4519.365519	4520.726980
35249	DOW	120	1787230440	53465.657399	53469.111501	53456.065762	53463.486351
35250	VIX	120	1787230440	16.048575	16.051750	16.016773	16.016773
35488	GOLD	120	1787230680	4523.572505	4526.237830	4523.287538	4526.132550
35489	DOW	120	1787230680	53459.001435	53468.138118	53456.842883	53467.104217
35490	VIX	120	1787230680	16.044959	16.045801	16.006357	16.012063
34889	DOW	120	1787230080	53467.180581	53474.339276	53451.094978	53468.612525
34890	VIX	120	1787230080	16.005972	16.012570	15.985233	16.012145
36327	CRUDE	120	1787231520	86.797692	86.868740	86.742313	86.822058
36328	GOLD	120	1787231520	4539.249449	4539.433500	4534.980864	4535.634111
36329	DOW	120	1787231520	53463.478256	53475.025642	53457.548803	53459.118929
36330	VIX	120	1787231520	15.837589	15.844991	15.829317	15.839997
35126	SP500	120	1787230320	7707.297598	7709.787654	7707.189488	7707.953371
35127	CRUDE	120	1787230320	87.226942	87.226942	87.006410	87.007714
35128	GOLD	120	1787230320	4518.456493	4520.306170	4515.406398	4520.158490
35129	DOW	120	1787230320	53465.913442	53475.365755	53460.748787	53464.746419
35130	VIX	120	1787230320	16.072428	16.072904	16.041451	16.050038
36086	SP500	120	1787231280	7707.371649	7708.798897	7706.682237	7707.783611
36087	CRUDE	120	1787231280	86.879253	86.887556	86.700000	86.706592
36088	GOLD	120	1787231280	4528.529753	4532.024547	4528.433700	4529.973253
36089	DOW	120	1787231280	53466.068560	53469.832752	53456.862312	53461.760577
35606	SP500	120	1787230800	7707.638521	7709.386223	7707.228082	7708.144006
35607	CRUDE	120	1787230800	86.799424	86.899991	86.782172	86.785006
35608	GOLD	120	1787230800	4526.189282	4529.334811	4525.043707	4529.334811
35609	DOW	120	1787230800	53468.394150	53470.182218	53455.483222	53457.981149
35610	VIX	120	1787230800	16.011105	16.012138	15.968526	15.969415
36090	VIX	120	1787231280	15.869680	15.871191	15.827878	15.832065
35846	SP500	120	1787231040	7708.069785	7708.875698	7707.248384	7707.786394
35847	CRUDE	120	1787231040	86.791895	86.886031	86.789957	86.813857
35848	GOLD	120	1787231040	4526.754053	4528.726207	4526.322412	4528.060717
35849	DOW	120	1787231040	53459.165208	53470.890071	53456.560865	53464.273137
35006	SP500	120	1787230200	7708.217810	7708.721856	7707.067805	7707.523682
35850	VIX	120	1787231040	15.916708	15.923288	15.879915	15.881719
35726	SP500	120	1787230920	7708.376350	7709.058772	7707.215353	7708.172898
35727	CRUDE	120	1787230920	86.787207	86.798099	86.729035	86.789662
35728	GOLD	120	1787230920	4529.281034	4530.428978	4526.652160	4526.748268
35729	DOW	120	1787230920	53459.668040	53467.843542	53456.977699	53461.020880
35730	VIX	120	1787230920	15.968559	15.972928	15.916607	15.918031
35966	SP500	120	1787231160	7707.776226	7709.325151	7706.957020	7707.192687
35967	CRUDE	120	1787231160	86.816463	86.890000	86.816463	86.876168
35968	GOLD	120	1787231160	4528.186704	4530.549671	4527.496522	4528.480245
35969	DOW	120	1787231160	53464.843514	53469.554525	53456.046543	53467.763423
35970	VIX	120	1787231160	15.881907	15.886762	15.858325	15.868736
36824	DOW	120	1787232000	53464.653984	53470.687904	53458.007503	53464.606909
36206	SP500	120	1787231400	7708.072087	7709.159161	7706.801797	7706.986500
36207	CRUDE	120	1787231400	86.703634	86.855514	86.697019	86.798362
36208	GOLD	120	1787231400	4529.999874	4539.197960	4529.999874	4539.197960
36209	DOW	120	1787231400	53460.112918	53472.921929	53452.884697	53463.543235
36210	VIX	120	1787231400	15.831935	15.852405	15.817738	15.836008
36825	VIX	120	1787232000	15.739645	15.742294	15.730000	15.730326
36821	SP500	120	1787232000	7707.497461	7708.954478	7706.709750	7708.241109
36822	CRUDE	120	1787232000	86.534627	86.541360	86.509071	86.512011
36823	GOLD	120	1787232000	4530.620858	4531.129089	4528.562420	4529.387298
36571	SP500	120	1787231760	7709.020992	7709.078401	7707.382569	7707.616492
36572	CRUDE	120	1787231760	86.665390	86.732840	86.637154	86.640254
36573	GOLD	120	1787231760	4533.679991	4534.410965	4532.085539	4532.429088
36574	DOW	120	1787231760	53466.456783	53471.974328	53458.572805	53467.476093
36575	VIX	120	1787231760	15.791396	15.804293	15.783349	15.788147
36446	SP500	120	1787231640	7708.486853	7709.623193	7706.407815	7708.800246
36447	CRUDE	120	1787231640	86.821628	86.821628	86.657983	86.665215
36448	GOLD	120	1787231640	4535.751384	4536.243580	4532.194459	4533.740613
36449	DOW	120	1787231640	53458.672871	53472.825306	53454.745519	53467.252580
36696	SP500	120	1787231880	7707.612635	7708.965479	7706.808909	7707.739511
36697	CRUDE	120	1787231880	86.638519	86.727749	86.530423	86.534690
36698	GOLD	120	1787231880	4532.287099	4533.255850	4527.777155	4530.598906
36699	DOW	120	1787231880	53467.822050	53468.272578	53449.692184	53465.331126
36700	VIX	120	1787231880	15.788228	15.789277	15.737009	15.738338
36880	VIX	120	1787275440	16.010000	16.012677	16.007745	16.010158
36876	SP500	120	1787275440	7641.160000	7641.727803	7639.741770	7641.215648
36877	CRUDE	120	1787275440	86.590000	86.598042	86.516633	86.529360
36878	GOLD	120	1787275440	4577.500000	4580.492350	4577.449592	4580.492350
36879	DOW	120	1787275440	52759.210000	52765.024761	52753.975479	52755.334149
36906	SP500	120	1787275560	7641.477014	7642.689041	7639.967272	7641.906506
36907	CRUDE	120	1787275560	86.530000	86.569447	86.509087	86.520233
36908	GOLD	120	1787275560	4580.553099	4583.315874	4580.254923	4582.220605
37035	VIX	120	1787275680	16.007375	16.014365	16.007375	16.010220
38381	SP500	120	1787277000	7640.782559	7642.202037	7640.173426	7641.724386
37891	SP500	120	1787276520	7640.759302	7642.059420	7640.458128	7641.005714
37892	CRUDE	120	1787276520	86.539693	86.623077	86.539693	86.619709
37893	GOLD	120	1787276520	4589.530674	4592.578866	4589.054408	4591.922368
37894	DOW	120	1787276520	52754.659599	52768.374227	52752.221076	52757.011734
37895	VIX	120	1787276520	16.011808	16.014598	16.006804	16.008744
37766	SP500	120	1787276400	7640.714716	7642.175425	7639.548066	7640.829962
37767	CRUDE	120	1787276400	86.601539	86.605154	86.540000	86.542650
37768	GOLD	120	1787276400	4587.149500	4590.441589	4585.365444	4589.480829
37769	DOW	120	1787276400	52754.577598	52768.222827	52750.553875	52753.974834
37770	VIX	120	1787276400	16.007504	16.016847	16.001643	16.012035
37391	SP500	120	1787276040	7641.434809	7642.217836	7640.226556	7641.453349
37392	CRUDE	120	1787276040	86.602147	86.650064	86.594889	86.635195
37393	GOLD	120	1787276040	4583.868663	4586.483314	4582.835986	4584.263106
37394	DOW	120	1787276040	52759.855918	52763.876891	52751.544146	52761.521736
37395	VIX	120	1787276040	16.006756	16.017197	16.004695	16.010039
37266	SP500	120	1787275920	7640.136818	7642.363552	7639.956886	7641.669807
37267	CRUDE	120	1787275920	86.566323	86.616063	86.560000	86.603977
37268	GOLD	120	1787275920	4583.724875	4584.289387	4580.526377	4583.931950
37269	DOW	120	1787275920	52755.907618	52766.703078	52753.069457	52758.494586
37270	VIX	120	1787275920	16.006848	16.014914	16.002891	16.007099
37146	SP500	120	1787275800	7640.118810	7642.224189	7639.650052	7640.439457
37147	CRUDE	120	1787275800	86.644799	86.644799	86.540000	86.565007
37148	GOLD	120	1787275800	4579.945583	4583.876984	4579.945583	4583.842744
36909	DOW	120	1787275560	52755.636327	52762.851082	52750.530148	52762.851082
36910	VIX	120	1787275560	16.010852	16.017454	16.006227	16.008352
37149	DOW	120	1787275800	52758.593664	52768.709125	52752.999555	52755.995447
37150	VIX	120	1787275800	16.010185	16.013847	16.004582	16.006390
37516	SP500	120	1787276160	7641.594607	7642.549672	7640.230020	7641.366931
37517	CRUDE	120	1787276160	86.633409	86.669214	86.626774	86.662970
37518	GOLD	120	1787276160	4584.119867	4586.234861	4581.693651	4586.040967
37519	DOW	120	1787276160	52762.954241	52765.610713	52753.474553	52763.198819
37520	VIX	120	1787276160	16.011255	16.013992	16.005604	16.011843
38382	CRUDE	120	1787277000	86.708527	86.810232	86.666114	86.778646
38383	GOLD	120	1787277000	4584.524763	4585.100000	4578.901797	4581.817407
38384	DOW	120	1787277000	52761.224759	52767.849160	52750.609588	52758.924474
38385	VIX	120	1787277000	16.008298	16.016131	16.004773	16.009139
38016	SP500	120	1787276640	7640.702466	7642.767824	7640.290706	7640.290706
38017	CRUDE	120	1787276640	86.622461	86.626706	86.562160	86.617412
38018	GOLD	120	1787276640	4591.795660	4594.913615	4591.618394	4594.545416
38019	DOW	120	1787276640	52756.076618	52763.422758	52754.258157	52757.965754
38020	VIX	120	1787276640	16.008767	16.018244	16.004603	16.006896
37641	SP500	120	1787276280	7641.476313	7642.048172	7640.178979	7640.746840
37642	CRUDE	120	1787276280	86.661340	86.689517	86.595026	86.601091
37643	GOLD	120	1787276280	4586.043492	4587.404446	4585.390767	4587.212862
37031	SP500	120	1787275680	7642.051286	7642.138580	7639.049619	7640.375318
37032	CRUDE	120	1787275680	86.523282	86.651505	86.522523	86.645381
37033	GOLD	120	1787275680	4582.042642	4582.317858	4579.606696	4579.870160
37034	DOW	120	1787275680	52763.494209	52765.600758	52752.378060	52756.834833
37644	DOW	120	1787276280	52765.174713	52767.370068	52753.475837	52753.475837
37645	VIX	120	1787276280	16.012667	16.013660	16.006986	16.007566
38256	SP500	120	1787276880	7641.884741	7642.168933	7640.195801	7640.528825
38257	CRUDE	120	1787276880	86.654631	86.711834	86.645238	86.707202
38258	GOLD	120	1787276880	4591.804064	4591.903563	4584.047977	4584.435111
38259	DOW	120	1787276880	52757.902673	52765.546469	52756.591473	52760.400460
38260	VIX	120	1787276880	16.013926	16.017593	16.003826	16.008292
38881	SP500	120	1787277480	7640.710731	7642.344438	7640.710731	7641.010474
38882	CRUDE	120	1787277480	86.851004	86.855462	86.817759	86.820529
38883	GOLD	120	1787277480	4587.082606	4589.102150	4586.093050	4586.675820
38884	DOW	120	1787277480	52765.305490	52769.398718	52750.801054	52763.195743
38136	SP500	120	1787276760	7640.338472	7642.019063	7639.767928	7642.000215
38137	CRUDE	120	1787276760	86.617861	86.709255	86.617035	86.653643
38631	SP500	120	1787277240	7641.198936	7642.241556	7639.584538	7640.580425
38632	CRUDE	120	1787277240	86.755917	86.937766	86.749839	86.913067
38506	SP500	120	1787277120	7641.954074	7642.972777	7640.276517	7641.109392
38507	CRUDE	120	1787277120	86.780735	86.783693	86.717180	86.757982
38508	GOLD	120	1787277120	4581.774940	4583.431686	4580.902976	4581.885794
38138	GOLD	120	1787276760	4594.667864	4596.803457	4591.320909	4591.861748
38139	DOW	120	1787276760	52758.790609	52765.932650	52752.301502	52759.948934
38140	VIX	120	1787276760	16.007924	16.017628	16.002855	16.014886
38509	DOW	120	1787277120	52757.378600	52774.282961	52752.189591	52753.920126
38633	GOLD	120	1787277240	4581.860159	4584.056321	4581.555842	4582.961657
38634	DOW	120	1787277240	52753.872243	52767.781125	52750.854985	52754.963368
38635	VIX	120	1787277240	16.008649	16.015871	16.004032	16.008772
38885	VIX	120	1787277480	16.012080	16.014190	16.006215	16.013277
38510	VIX	120	1787277120	16.010269	16.013538	16.003297	16.007062
38756	SP500	120	1787277360	7640.647024	7642.051515	7639.957066	7640.824037
38757	CRUDE	120	1787277360	86.915264	86.916050	86.831568	86.847633
38758	GOLD	120	1787277360	4582.885705	4587.400000	4582.885705	4587.144905
38759	DOW	120	1787277360	52755.549100	52768.510289	52753.225802	52765.648830
38760	VIX	120	1787277360	16.007742	16.016266	16.003671	16.013633
39006	SP500	120	1787277600	7641.218718	7642.349897	7640.253105	7640.942725
39007	CRUDE	120	1787277600	86.817169	86.892810	86.783700	86.789281
39008	GOLD	120	1787277600	4586.574429	4588.176807	4583.673749	4583.713760
39009	DOW	120	1787277600	52761.841199	52764.788615	52748.644718	52759.010343
39010	VIX	120	1787277600	16.014105	16.016519	16.003363	16.012577
39131	SP500	120	1787277720	7640.995358	7642.232738	7640.204045	7641.262418
39132	CRUDE	120	1787277720	86.787028	86.788790	86.675938	86.698734
39133	GOLD	120	1787277720	4583.690180	4584.165740	4581.480449	4583.426005
40876	SP500	120	1787279400	7641.237060	7642.491773	7639.724333	7641.006300
40751	SP500	120	1787279280	7640.662970	7642.322472	7639.956957	7641.367603
40752	CRUDE	120	1787279280	86.754859	86.764293	86.725663	86.736461
40753	GOLD	120	1787279280	4577.680045	4578.407301	4575.767896	4577.751430
40754	DOW	120	1787279280	52760.373085	52766.644042	52753.444774	52764.731173
40755	VIX	120	1787279280	16.007221	16.015398	16.004563	16.009332
39256	SP500	120	1787277840	7641.295687	7642.563322	7640.129904	7641.786793
39257	CRUDE	120	1787277840	86.700776	86.706043	86.622556	86.642095
39258	GOLD	120	1787277840	4583.458391	4583.833995	4582.098898	4583.019933
39259	DOW	120	1787277840	52761.407211	52764.827567	52749.533163	52764.668110
39260	VIX	120	1787277840	16.008625	16.017341	16.002033	16.016062
40131	SP500	120	1787278680	7640.239709	7641.841160	7639.908781	7640.777702
40132	CRUDE	120	1787278680	86.755008	86.774367	86.736220	86.736220
40133	GOLD	120	1787278680	4577.765312	4580.200178	4577.765312	4579.928951
40134	DOW	120	1787278680	52764.712871	52765.579109	52752.032255	52762.138343
40135	VIX	120	1787278680	16.009591	16.016376	16.006397	16.016376
40376	SP500	120	1787278920	7639.917103	7641.793447	7639.641621	7640.873381
40006	SP500	120	1787278560	7641.662125	7641.898151	7639.439348	7640.184090
40007	CRUDE	120	1787278560	86.753999	86.786008	86.744076	86.756300
40008	GOLD	120	1787278560	4578.493432	4581.043490	4576.974056	4577.807562
40009	DOW	120	1787278560	52754.125057	52766.780651	52752.049967	52765.575300
40010	VIX	120	1787278560	16.013866	16.017280	16.008031	16.008290
39631	SP500	120	1787278200	7640.835215	7641.954632	7640.343840	7641.592850
39632	CRUDE	120	1787278200	86.672413	86.809007	86.668073	86.761137
39633	GOLD	120	1787278200	4587.152855	4587.583861	4585.628988	4587.067606
39634	DOW	120	1787278200	52762.877611	52765.214163	52747.797879	52762.054420
39635	VIX	120	1787278200	16.010850	16.012450	16.006046	16.006105
39506	SP500	120	1787278080	7641.520936	7641.702719	7640.216033	7640.635215
39134	DOW	120	1787277720	52761.045267	52765.725495	52751.387841	52762.649028
39135	VIX	120	1787277720	16.012396	16.014495	16.006251	16.010017
39507	CRUDE	120	1787278080	86.691619	86.691619	86.652952	86.669338
39508	GOLD	120	1787278080	4585.636056	4587.231044	4585.277873	4587.231044
39509	DOW	120	1787278080	52758.275662	52767.903454	52747.781712	52761.904449
39510	VIX	120	1787278080	16.014185	16.015077	16.005453	16.011406
40377	CRUDE	120	1787278920	86.726761	86.726865	86.676771	86.682872
40378	GOLD	120	1787278920	4576.998579	4577.443807	4573.985074	4576.680605
39381	SP500	120	1787277960	7641.560962	7642.141792	7640.156689	7641.656111
39382	CRUDE	120	1787277960	86.639762	86.692814	86.637177	86.690630
39383	GOLD	120	1787277960	4582.903380	4586.180054	4582.360439	4585.603678
39384	DOW	120	1787277960	52764.338867	52766.348506	52754.069975	52758.309789
39385	VIX	120	1787277960	16.014542	16.015968	16.008570	16.014405
39756	SP500	120	1787278320	7641.732959	7642.667974	7639.981429	7640.937861
39757	CRUDE	120	1787278320	86.759181	86.791823	86.715180	86.729823
39758	GOLD	120	1787278320	4587.113305	4587.219434	4580.834134	4580.996132
39759	DOW	120	1787278320	52762.902686	52765.929728	52752.063777	52758.809451
39760	VIX	120	1787278320	16.006288	16.015927	16.006288	16.010591
40379	DOW	120	1787278920	52758.897425	52772.337838	52752.010608	52766.485987
40380	VIX	120	1787278920	16.007079	16.013593	16.002555	16.009990
40251	SP500	120	1787278800	7640.941109	7642.261871	7640.120286	7640.120286
40252	CRUDE	120	1787278800	86.737428	86.781459	86.718610	86.729940
40253	GOLD	120	1787278800	4579.997655	4579.997655	4575.720652	4577.150801
40254	DOW	120	1787278800	52761.712879	52767.583709	52753.365144	52760.175318
40255	VIX	120	1787278800	16.017615	16.018840	16.004994	16.006118
39881	SP500	120	1787278440	7640.736624	7642.111705	7639.609689	7641.580044
39882	CRUDE	120	1787278440	86.727314	86.772605	86.723980	86.753121
39883	GOLD	120	1787278440	4581.042280	4582.184628	4577.788027	4578.389240
39884	DOW	120	1787278440	52760.464090	52761.839434	52752.384346	52754.991080
39885	VIX	120	1787278440	16.009510	16.016051	16.004749	16.012701
40626	SP500	120	1787279160	7641.559399	7642.632070	7640.047282	7640.835540
40627	CRUDE	120	1787279160	86.773100	86.774776	86.737473	86.752956
40628	GOLD	120	1787279160	4576.558676	4578.506237	4576.499975	4577.704583
40629	DOW	120	1787279160	52751.061835	52765.341872	52748.751650	52759.951964
40630	VIX	120	1787279160	16.004665	16.016438	16.002676	16.005778
40877	CRUDE	120	1787279400	86.736321	86.743824	86.698647	86.742835
40878	GOLD	120	1787279400	4577.927746	4579.756914	4577.786006	4578.532808
40879	DOW	120	1787279400	52764.852962	52768.765976	52750.379819	52752.176636
40880	VIX	120	1787279400	16.010326	16.015158	16.004639	16.008942
40501	SP500	120	1787279040	7640.886217	7642.786100	7640.762734	7641.609772
40502	CRUDE	120	1787279040	86.680055	86.788701	86.675046	86.772373
40503	GOLD	120	1787279040	4576.839668	4578.672331	4575.965475	4576.706865
40504	DOW	120	1787279040	52767.662917	52770.538501	52750.931762	52753.111805
40505	VIX	120	1787279040	16.009282	16.014437	16.005548	16.005763
41001	SP500	120	1787279520	7640.843983	7642.366812	7639.733400	7641.064841
41129	DOW	120	1787279640	52758.683846	52764.047392	52751.834400	52758.263083
41130	VIX	120	1787279640	16.004721	16.015999	16.002740	16.008802
41126	SP500	120	1787279640	7640.867771	7641.705834	7639.695672	7641.020880
41002	CRUDE	120	1787279520	86.742121	86.742454	86.644217	86.644217
41127	CRUDE	120	1787279640	86.646889	86.670000	86.642677	86.666353
41003	GOLD	120	1787279520	4578.516741	4583.350730	4578.418408	4583.350730
41004	DOW	120	1787279520	52752.591672	52766.136824	52751.651470	52758.355062
41005	VIX	120	1787279520	16.009168	16.014955	16.005988	16.006147
41128	GOLD	120	1787279640	4583.257309	4585.319325	4581.858022	4584.864297
41241	SP500	120	1787279760	7640.925050	7642.366799	7639.757736	7641.024913
41242	CRUDE	120	1787279760	86.665453	86.730000	86.663627	86.725471
41243	GOLD	120	1787279760	4584.696300	4585.376498	4584.011305	4584.114539
41244	DOW	120	1787279760	52756.964857	52765.709049	52753.478533	52759.901487
41245	VIX	120	1787279760	16.008607	16.020283	16.005314	16.010940
41366	SP500	120	1787279880	7640.955968	7642.490146	7640.052998	7641.038130
41367	CRUDE	120	1787279880	86.726658	86.753359	86.707662	86.748754
41368	GOLD	120	1787279880	4584.231789	4584.662394	4581.971040	4583.061861
41491	SP500	120	1787280000	7641.005875	7641.986290	7639.663595	7641.720909
41492	CRUDE	120	1787280000	86.748570	86.758843	86.598149	86.601205
41493	GOLD	120	1787280000	4583.014131	4585.908104	4582.195971	4584.728536
41494	DOW	120	1787280000	52755.584255	52769.572254	52753.232646	52755.955924
41495	VIX	120	1787280000	16.011456	16.014979	16.005977	16.006916
42616	SP500	120	1787281080	7641.580336	7642.175051	7639.946323	7641.267661
42617	CRUDE	120	1787281080	86.668868	86.669435	86.609429	86.609429
42618	GOLD	120	1787281080	4592.342000	4595.599474	4592.195443	4595.267653
42619	DOW	120	1787281080	52762.821919	52766.436450	52748.603638	52759.864943
42366	SP500	120	1787280840	7641.763514	7642.521260	7640.358555	7641.345028
42367	CRUDE	120	1787280840	86.658256	86.691248	86.602492	86.615044
42368	GOLD	120	1787280840	4591.805891	4594.398045	4591.026875	4592.318906
42369	DOW	120	1787280840	52759.023057	52762.746406	52746.279487	52758.440939
42370	VIX	120	1787280840	16.007830	16.015246	16.004985	16.010044
42241	SP500	120	1787280720	7640.959057	7642.547662	7640.340768	7641.511389
42242	CRUDE	120	1787280720	86.716377	86.727345	86.658971	86.659949
42243	GOLD	120	1787280720	4589.578829	4591.737167	4588.857412	4591.737167
42244	DOW	120	1787280720	52760.080474	52766.612236	52751.758562	52757.083773
42245	VIX	120	1787280720	16.010876	16.016686	16.005818	16.008526
41866	SP500	120	1787280360	7641.165308	7642.239699	7639.991372	7641.434991
41867	CRUDE	120	1787280360	86.708184	86.708227	86.613615	86.660916
41868	GOLD	120	1787280360	4583.808768	4584.781128	4582.480042	4583.330883
41869	DOW	120	1787280360	52754.609725	52767.035461	52751.215971	52759.414406
41870	VIX	120	1787280360	16.008377	16.013317	16.004406	16.011797
41741	SP500	120	1787280240	7641.471483	7641.991985	7639.440175	7640.872760
41369	DOW	120	1787279880	52761.548441	52768.068478	52752.744898	52754.871343
41370	VIX	120	1787279880	16.011968	16.018803	16.001791	16.012317
41742	CRUDE	120	1787280240	86.605954	86.729156	86.575147	86.706582
41743	GOLD	120	1787280240	4581.959110	4584.200000	4581.671971	4583.970948
41744	DOW	120	1787280240	52757.649697	52765.160216	52749.604278	52756.277504
41745	VIX	120	1787280240	16.010932	16.017518	16.004885	16.009160
41616	SP500	120	1787280120	7641.620674	7642.159865	7639.602737	7641.688445
41617	CRUDE	120	1787280120	86.600365	86.621372	86.597304	86.609213
41618	GOLD	120	1787280120	4584.604487	4586.232643	4581.892839	4582.029310
41619	DOW	120	1787280120	52753.888986	52770.733620	52753.888986	52758.543015
41620	VIX	120	1787280120	16.006359	16.015620	15.997724	16.010323
41991	SP500	120	1787280480	7641.259688	7641.912593	7639.350335	7640.842502
41992	CRUDE	120	1787280480	86.664178	86.740000	86.664178	86.702099
41993	GOLD	120	1787280480	4583.428470	4588.228314	4583.109894	4587.848902
41994	DOW	120	1787280480	52760.490322	52769.888193	52751.541007	52759.557212
41995	VIX	120	1787280480	16.010526	16.020243	16.001858	16.006203
42620	VIX	120	1787281080	16.010925	16.015183	16.000004	16.012157
42491	SP500	120	1787280960	7641.379192	7642.696201	7640.352011	7641.385700
42492	CRUDE	120	1787280960	86.611951	86.666692	86.607878	86.666692
42493	GOLD	120	1787280960	4592.495771	4594.051826	4591.718587	4592.448834
42494	DOW	120	1787280960	52760.258003	52765.791561	52748.462522	52761.739631
42116	SP500	120	1787280600	7640.606279	7642.170313	7640.120400	7641.125493
42117	CRUDE	120	1787280600	86.699769	86.731520	86.691064	86.716174
42118	GOLD	120	1787280600	4587.750945	4589.500000	4587.119628	4589.421813
42119	DOW	120	1787280600	52760.792808	52766.236013	52749.520879	52761.560497
42120	VIX	120	1787280600	16.005263	16.016456	16.003350	16.010224
42495	VIX	120	1787280960	16.010278	16.017115	16.005891	16.010771
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
6-omQvXXYh8XwvmklcDb3qTm4a2XJaxs	{"cookie":{"originalMaxAge":604800000,"expires":"2026-08-27T10:59:24.987Z","secure":false,"httpOnly":true,"path":"/","sameSite":"lax"},"adminUserId":"f4a21243-eb2a-498e-bd25-46b1f19640cf"}	2026-08-27 10:59:25
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.users (id, username, password, name, phone, bank_name, account_holder, account_number, balance, total_deposit, total_withdrawal, total_bet, total_win, role, grade, is_active, last_login_at, created_at, approval_status, birth_date, resident_number, region, branch_code, affiliate_id, last_login_ip, auto_bet_enabled, auto_bet_multiplier, is_betting_blocked, forced_bet_direction, max_execution_enabled, pending_balance_adjustment, always_pending_enabled, telegram_notify_enabled) FROM stdin;
f4a21243-eb2a-498e-bd25-46b1f19640cf	qwer1`234	1234	관리자	\N	\N	\N	\N	100000000	0	0	0	0	admin	브론즈	t	\N	2026-08-09 11:19:58.005784	approved	\N	\N	\N	\N	\N	\N	f	10	f	\N	t	0	f	f
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

SELECT pg_catalog.setval('public.forex_candles_id_seq', 42735, true);


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

\unrestrict uKC6YSJmTcNnecAmJC2bKNkP4uLAWYKDwiTghTKCp48gD953qTyY3uOIldZRcoE

