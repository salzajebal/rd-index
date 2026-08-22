--
-- PostgreSQL database dump
--

\restrict 820XI6gcawMskfdjAWdzLXla4uTKznrroHJd7lcHBjvrIEhzjmz3iHhh0HsqASA

-- Dumped from database version 16.15 (651533a)
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
28cefda0-7452-4631-8205-944745d905c3	test1234	test1234	test1234	01012341234	BXH66HRV	5.00	0	0	t	2026-08-20 10:39:37.302882
abc2f693-817d-471a-b7a4-7e83f98ee97a	박지수	qweasas12345!@#	박지수	\N	ZCH4ZMTF	5.00	0	0	t	2026-08-21 04:01:20.823625
1e6530dd-65d5-4cbf-85ed-2486b6d6efc4	gof	1234	지오에프	\N	MDAYBAJH	5.00	0	0	t	2026-08-21 04:02:47.187823
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
369	26b03465-d7a9-49f5-97ce-6ad3714637d3	VIX	long	10000.00000000	120	15.11100998	15.11171461	20000.00000000	2.00	win	2026-08-20 10:50:00.008	2026-08-20 10:49:34.023188	2026-08-20 10:50:05.166	595	\N	f	\N	1800000.00000000	1810000.00000000
370	cd3fff13-0da2-4623-a768-4540617e6494	SP500	long	200000.00000000	120	7641.37564831	7649.01702396	400000.00000000	2.00	win	2026-08-21 04:26:00.727	2026-08-21 04:24:21.739431	2026-08-21 04:26:07.66	403	\N	f	\N	1000000.00000000	1200000.00000000
384	f5ec3e2c-87d9-40e3-829e-8e1448495880	SP500	short	10000.00000000	120	7639.81371289	7647.45352660	0.00000000	2.00	lose	2026-08-21 09:34:00.827	2026-08-21 09:32:30.845139	2026-08-21 09:34:07.227	557	\N	f	\N	90000.00000000	80000.00000000
371	2330abc5-6fda-4147-8e70-354243d137f8	SP500	long	50000.00000000	120	7641.26191081	7641.30721278	100000.00000000	2.00	win	2026-08-21 06:58:00.05	2026-08-21 06:56:31.063644	2026-08-21 06:58:06.067	479	\N	f	\N	50000.00000000	100000.00000000
372	cd3fff13-0da2-4623-a768-4540617e6494	SP500	long	10000.00000000	120	7641.72777552	7649.36950330	20000.00000000	2.00	win	2026-08-21 07:02:00.107	2026-08-21 07:01:20.120514	2026-08-21 07:02:06.093	481	\N	f	\N	1200000.00000000	1210000.00000000
373	2330abc5-6fda-4147-8e70-354243d137f8	SP500	long	10000.00000000	120	7640.92422100	7648.56514522	20000.00000000	2.00	win	2026-08-21 07:02:00.523	2026-08-21 07:01:36.53569	2026-08-21 07:02:06.142	481	\N	f	\N	100000.00000000	110000.00000000
385	f5ec3e2c-87d9-40e3-829e-8e1448495880	SP500	short	20000.00000000	120	7641.85028136	7634.20843108	40000.00000000	2.00	win	2026-08-21 09:36:00.002	2026-08-21 09:34:40.014544	2026-08-21 09:36:05.238	558	\N	f	\N	80000.00000000	100000.00000000
374	2330abc5-6fda-4147-8e70-354243d137f8	SP500	short	10000.00000000	120	7640.44349363	7632.80305014	20000.00000000	2.00	win	2026-08-21 07:08:00.822	2026-08-21 07:06:27.838202	2026-08-21 07:08:06.199	484	\N	f	\N	110000.00000000	120000.00000000
375	81a69081-3d28-4cbd-9b72-1f7164ee70b2	SP500	long	10000.00000000	120	7641.93283914	7649.57477198	20000.00000000	2.00	win	2026-08-21 08:52:00.448	2026-08-21 08:50:25.461396	2026-08-21 08:52:06.901	536	\N	f	\N	50000.00000000	60000.00000000
376	81a69081-3d28-4cbd-9b72-1f7164ee70b2	SP500	long	10000.00000000	120	7641.23814469	7648.87938283	20000.00000000	2.00	win	2026-08-21 08:54:00.872	2026-08-21 08:52:20.882917	2026-08-21 08:54:06.913	537	\N	f	\N	60000.00000000	70000.00000000
377	81a69081-3d28-4cbd-9b72-1f7164ee70b2	SP500	long	10000.00000000	120	7641.10651520	7648.74762172	20000.00000000	2.00	win	2026-08-21 08:56:00.541	2026-08-21 08:54:25.55385	2026-08-21 08:56:06.929	538	\N	f	\N	70000.00000000	80000.00000000
378	81a69081-3d28-4cbd-9b72-1f7164ee70b2	SP500	short	10000.00000000	120	7641.45917997	7633.81772079	20000.00000000	2.00	win	2026-08-21 08:58:00.406	2026-08-21 08:56:39.419983	2026-08-21 08:58:06.951	539	\N	f	\N	80000.00000000	90000.00000000
379	81a69081-3d28-4cbd-9b72-1f7164ee70b2	SP500	long	10000.00000000	120	7641.43606540	7649.07750147	20000.00000000	2.00	win	2026-08-21 09:00:00.722	2026-08-21 08:58:24.735031	2026-08-21 09:00:06.957	540	\N	f	\N	90000.00000000	100000.00000000
380	f5ec3e2c-87d9-40e3-829e-8e1448495880	SP500	long	10000.00000000	120	7640.15437527	7647.79452965	20000.00000000	2.00	win	2026-08-21 09:24:00.913	2026-08-21 09:22:34.923498	2026-08-21 09:24:07.151	552	\N	f	\N	50000.00000000	60000.00000000
381	f5ec3e2c-87d9-40e3-829e-8e1448495880	SP500	long	10000.00000000	120	7641.26236389	7648.90362625	20000.00000000	2.00	win	2026-08-21 09:26:00.694	2026-08-21 09:24:38.704953	2026-08-21 09:26:07.16	553	\N	f	\N	60000.00000000	70000.00000000
382	f5ec3e2c-87d9-40e3-829e-8e1448495880	SP500	long	10000.00000000	120	7640.32847646	7647.96880494	20000.00000000	2.00	win	2026-08-21 09:28:00.363	2026-08-21 09:26:48.373931	2026-08-21 09:28:07.18	554	\N	f	\N	70000.00000000	80000.00000000
383	f5ec3e2c-87d9-40e3-829e-8e1448495880	SP500	short	10000.00000000	120	7640.42780204	7632.78737424	20000.00000000	2.00	win	2026-08-21 09:32:00.731	2026-08-21 09:30:18.742709	2026-08-21 09:32:07.216	556	\N	f	\N	80000.00000000	90000.00000000
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
24771	SP500	120	1787220240	7708.609516	7709.109383	7706.868780	7707.897476
24772	CRUDE	120	1787220240	86.731030	86.769646	86.610000	86.768046
24773	GOLD	120	1787220240	4539.363273	4540.300000	4539.157647	4539.217280
24774	DOW	120	1787220240	53460.819052	53468.016674	53459.146670	53464.599743
24775	VIX	120	1787220240	15.202930	15.204657	15.197151	15.197314
24171	SP500	120	1787219640	7707.780515	7709.512639	7706.597505	7707.872394
24172	CRUDE	120	1787219640	86.323744	86.353205	86.267347	86.273363
24173	GOLD	120	1787219640	4546.895602	4547.086695	4544.760186	4544.782577
24174	DOW	120	1787219640	53467.627905	53469.054507	53456.602984	53462.098546
24175	VIX	120	1787219640	15.206819	15.212979	15.193876	15.200024
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
24651	SP500	120	1787220120	7708.026292	7709.099580	7706.546678	7708.329797
24652	CRUDE	120	1787220120	86.623701	86.755932	86.619901	86.730201
24653	GOLD	120	1787220120	4541.419919	4542.550584	4539.396590	4539.537560
24654	DOW	120	1787220120	53464.101267	53471.193199	53454.122110	53461.644908
24655	VIX	120	1787220120	15.192379	15.203973	15.183281	15.203973
23936	SP500	120	1787219400	7707.606337	7708.707095	7706.412775	7708.707095
24411	SP500	120	1787219880	7707.654184	7709.391548	7706.583485	7707.919577
24412	CRUDE	120	1787219880	86.414426	86.540000	86.412067	86.509013
24413	GOLD	120	1787219880	4542.496259	4543.435623	4541.731420	4541.921817
24414	DOW	120	1787219880	53463.754973	53473.750640	53456.275642	53459.433304
24415	VIX	120	1787219880	15.208988	15.216581	15.195927	15.196661
25148	CRUDE	120	1787220840	86.559296	86.588663	86.524357	86.578104
25149	GOLD	120	1787220840	4542.265988	4543.619215	4540.970787	4542.808380
25150	DOW	120	1787220840	53465.595845	53471.446218	53453.047635	53463.327195
25151	VIX	120	1787220840	15.220319	15.235469	15.197650	15.230926
25401	VIX	120	1787221080	15.210252	15.226344	15.197088	15.197088
24877	SP500	120	1787220480	7707.980000	7708.839244	7707.763599	7707.763599
24878	CRUDE	120	1787220480	86.800000	86.805983	86.786916	86.790975
24879	GOLD	120	1787220480	4539.900000	4540.568364	4539.420441	4540.568364
24880	DOW	120	1787220480	53463.050000	53463.815692	53456.878632	53461.417448
24881	VIX	120	1787220480	15.220000	15.222142	15.209523	15.210057
24897	SP500	120	1787220600	7707.794335	7709.694849	7707.316216	7707.316216
24898	CRUDE	120	1787220600	86.790777	86.817463	86.718521	86.724395
24899	GOLD	120	1787220600	4540.744966	4541.140776	4536.669783	4538.178483
24900	DOW	120	1787220600	53463.357570	53471.862789	53454.904364	53460.624763
24901	VIX	120	1787220600	15.209338	15.214181	15.197602	15.206403
26276	VIX	120	1787221920	15.138256	15.162963	15.134737	15.149213
26152	SP500	120	1787221800	7707.980000	7709.138047	7706.581362	7708.184017
26153	CRUDE	120	1787221800	86.640000	86.646042	86.577475	86.614248
26154	GOLD	120	1787221800	4547.300000	4547.300000	4543.569925	4543.656248
25887	SP500	120	1787221560	7708.128125	7708.889527	7706.919778	7707.346030
25762	SP500	120	1787221440	7707.377542	7709.307091	7706.946183	7707.951394
25763	CRUDE	120	1787221440	86.669637	86.693423	86.651663	86.669189
25764	GOLD	120	1787221440	4546.564427	4548.042228	4546.306838	4546.963726
25765	DOW	120	1787221440	53463.194306	53471.622359	53455.540922	53460.592550
25022	SP500	120	1787220720	7707.569237	7708.681785	7706.658630	7708.222056
25023	CRUDE	120	1787220720	86.721125	86.723743	86.538809	86.559919
25024	GOLD	120	1787220720	4538.151675	4542.231758	4538.053015	4542.099715
25025	DOW	120	1787220720	53461.883458	53474.707154	53459.354762	53467.637653
25026	VIX	120	1787220720	15.205385	15.222790	15.204377	15.219728
25766	VIX	120	1787221440	15.188251	15.195323	15.173928	15.182929
25517	SP500	120	1787221200	7708.277228	7709.242174	7707.151611	7707.317217
25518	CRUDE	120	1787221200	86.629008	86.710273	86.622361	86.700664
25519	GOLD	120	1787221200	4546.422090	4546.461626	4544.486643	4545.308909
25520	DOW	120	1787221200	53466.303086	53473.468929	53454.875436	53462.581977
25521	VIX	120	1787221200	15.197053	15.214834	15.197053	15.199261
25888	CRUDE	120	1787221560	86.667637	86.695185	86.600000	86.602102
25889	GOLD	120	1787221560	4547.131963	4548.110469	4546.284345	4547.944597
25272	SP500	120	1787220960	7707.850141	7709.578808	7706.981468	7707.681142
25273	CRUDE	120	1787220960	86.576269	86.623218	86.498209	86.602201
25274	GOLD	120	1787220960	4542.685639	4543.854996	4542.354457	4543.084696
25275	DOW	120	1787220960	53462.184451	53472.038500	53456.831558	53463.342979
25276	VIX	120	1787220960	15.232089	15.232448	15.208778	15.209277
25147	SP500	120	1787220840	7708.290847	7708.536937	7707.393002	7707.723189
25890	DOW	120	1787221560	53460.525200	53475.512713	53457.095657	53457.457375
25397	SP500	120	1787221080	7707.726635	7709.144069	7706.679408	7708.097720
25398	CRUDE	120	1787221080	86.605565	86.630000	86.570867	86.629702
25399	GOLD	120	1787221080	4542.953478	4546.466324	4542.878589	4546.462538
25400	DOW	120	1787221080	53462.420889	53471.686292	53458.371749	53465.205284
25891	VIX	120	1787221560	15.182286	15.188093	15.147874	15.149261
25637	SP500	120	1787221320	7707.527089	7708.844836	7706.808256	7707.333991
25638	CRUDE	120	1787221320	86.698429	86.713902	86.633388	86.668563
25639	GOLD	120	1787221320	4545.472478	4547.157776	4544.684585	4546.741974
25640	DOW	120	1787221320	53460.926436	53468.830989	53454.321317	53463.629924
25641	VIX	120	1787221320	15.199917	15.206105	15.185966	15.189622
26027	SP500	120	1787221680	7707.313435	7709.199054	7706.689248	7706.920119
26028	CRUDE	120	1787221680	86.599398	86.670000	86.577949	86.660642
26029	GOLD	120	1787221680	4547.944929	4548.310529	4547.040572	4547.619004
26030	DOW	120	1787221680	53457.487531	53470.837852	53450.533105	53460.225439
26031	VIX	120	1787221680	15.149009	15.164465	15.148452	15.149053
26155	DOW	120	1787221800	53463.050000	53468.947143	53455.416513	53466.742697
26156	VIX	120	1787221800	15.150000	15.156714	15.133970	15.138640
26272	SP500	120	1787221920	7708.056728	7709.550878	7706.194347	7707.282780
26273	CRUDE	120	1787221920	86.615927	86.616720	86.567348	86.572470
26274	GOLD	120	1787221920	4543.708939	4544.147642	4542.350794	4543.057997
26275	DOW	120	1787221920	53465.552390	53470.116317	53452.809406	53459.215343
26392	SP500	120	1787222040	7707.041471	7708.659442	7706.319204	7708.410521
26393	CRUDE	120	1787222040	86.575736	86.630000	86.575498	86.612787
26394	GOLD	120	1787222040	4543.109399	4546.800000	4542.830792	4546.133411
26395	DOW	120	1787222040	53459.882626	53470.149163	53456.326121	53457.442489
26396	VIX	120	1787222040	15.149446	15.163740	15.146968	15.158295
26517	SP500	120	1787222160	7708.708306	7709.218924	7707.055193	7707.310616
26519	GOLD	120	1787222160	4546.305630	4547.700000	4545.697171	4547.358887
26520	DOW	120	1787222160	53458.219367	53469.449645	53456.307805	53457.436402
28142	SP500	120	1787223720	7707.802310	7709.220886	7705.621683	7705.693902
26642	SP500	120	1787222280	7707.317787	7708.601733	7706.809118	7708.129861
26643	CRUDE	120	1787222280	86.662207	86.662207	86.576506	86.598451
26644	GOLD	120	1787222280	4547.301867	4550.028604	4546.900000	4549.584732
26645	DOW	120	1787222280	53457.769446	53474.769941	53453.202226	53453.202226
26646	VIX	120	1787222280	15.150507	15.164803	15.144847	15.159713
28143	CRUDE	120	1787223720	86.714638	86.714638	86.675396	86.708732
28144	GOLD	120	1787223720	4546.086136	4546.790953	4544.939587	4545.132147
28145	DOW	120	1787223720	53459.150738	53475.699462	53457.729426	53462.363352
28146	VIX	120	1787223720	15.146250	15.155865	15.129534	15.131736
27767	SP500	120	1787223360	7707.980000	7709.336559	7706.793436	7706.874794
27517	SP500	120	1787223120	7708.866891	7708.866891	7706.876985	7708.523028
27518	CRUDE	120	1787223120	86.703014	86.703014	86.628904	86.638450
27519	GOLD	120	1787223120	4546.830103	4547.580223	4546.830103	4547.413592
27520	DOW	120	1787223120	53464.499132	53470.449173	53459.516290	53467.645232
27521	VIX	120	1787223120	15.141711	15.171804	15.141711	15.156359
27392	SP500	120	1787223000	7709.613782	7709.613782	7706.337911	7708.744907
27393	CRUDE	120	1787223000	86.634292	86.755739	86.634292	86.702057
27394	GOLD	120	1787223000	4547.260149	4547.604198	4546.489247	4546.969720
27395	DOW	120	1787223000	53463.013929	53472.462536	53459.605386	53464.315638
27396	VIX	120	1787223000	15.112416	15.162091	15.110000	15.143051
27017	SP500	120	1787222640	7708.493721	7709.359361	7706.464761	7708.379491
27018	CRUDE	120	1787222640	86.643893	86.647601	86.618137	86.637044
27019	GOLD	120	1787222640	4550.816083	4550.816083	4548.538517	4548.575935
27020	DOW	120	1787222640	53460.501203	53471.069267	53455.757589	53461.082520
27021	VIX	120	1787222640	15.141146	15.143236	15.126366	15.131854
26892	SP500	120	1787222520	7707.794559	7709.277575	7706.885227	7708.331662
26893	CRUDE	120	1787222520	86.667090	86.697902	86.637554	86.646587
26894	GOLD	120	1787222520	4549.809762	4551.426009	4549.809762	4550.763651
26895	DOW	120	1787222520	53457.534760	53473.902736	53448.974087	53458.998432
26896	VIX	120	1787222520	15.159616	15.161358	15.130000	15.142456
26518	CRUDE	120	1787222160	86.611466	86.663198	86.582220	86.662320
26521	VIX	120	1787222160	15.159803	15.163436	15.147927	15.150952
27142	SP500	120	1787222760	7708.408145	7708.868875	7706.734829	7708.489320
27143	CRUDE	120	1787222760	86.637688	86.661960	86.519255	86.583371
26767	SP500	120	1787222400	7708.358627	7708.876658	7706.148207	7708.033790
26768	CRUDE	120	1787222400	86.596883	86.683726	86.575838	86.668086
26769	GOLD	120	1787222400	4549.444473	4551.469751	4549.444473	4549.962031
26770	DOW	120	1787222400	53453.131519	53469.798903	53453.131519	53459.100656
26771	VIX	120	1787222400	15.160232	15.171300	15.145360	15.158352
27144	GOLD	120	1787222760	4548.401899	4551.614495	4548.401899	4550.065192
27145	DOW	120	1787222760	53462.706043	53472.668986	53457.638198	53460.606561
27146	VIX	120	1787222760	15.132861	15.134971	15.115829	15.117340
27768	CRUDE	120	1787223360	86.740000	86.797728	86.673594	86.675949
27769	GOLD	120	1787223360	4546.800000	4547.172402	4545.589225	4546.530433
27770	DOW	120	1787223360	53463.050000	53472.415995	53455.501582	53470.155876
27771	VIX	120	1787223360	15.160000	15.165183	15.156983	15.162095
27642	SP500	120	1787223240	7707.980000	7709.280016	7706.092689	7708.136408
27643	CRUDE	120	1787223240	86.610000	86.717025	86.602020	86.704061
27644	GOLD	120	1787223240	4546.700000	4547.891658	4546.243502	4546.884820
27267	SP500	120	1787222880	7708.470194	7709.897352	7706.610236	7709.897352
27268	CRUDE	120	1787222880	86.582806	86.661402	86.577744	86.632840
27269	GOLD	120	1787222880	4549.902339	4549.902339	4546.726688	4547.184175
27270	DOW	120	1787222880	53459.910423	53474.497842	53458.485266	53460.916016
27271	VIX	120	1787222880	15.116991	15.120000	15.105044	15.112515
27645	DOW	120	1787223240	53463.050000	53469.575763	53456.743512	53458.554677
27646	VIX	120	1787223240	15.160000	15.166108	15.147907	15.157498
28017	SP500	120	1787223600	7707.980000	7708.665794	7707.081333	7707.611336
28018	CRUDE	120	1787223600	86.680000	86.756611	86.675657	86.713085
28019	GOLD	120	1787223600	4546.700000	4547.649617	4545.581956	4546.044298
28020	DOW	120	1787223600	53463.050000	53471.869863	53454.829702	53458.718502
28021	VIX	120	1787223600	15.150000	15.155260	15.143191	15.146866
27892	SP500	120	1787223480	7707.980000	7708.465063	7706.888863	7707.577942
27893	CRUDE	120	1787223480	86.690000	86.704458	86.665208	86.687401
27894	GOLD	120	1787223480	4547.100000	4547.653327	4546.087411	4546.227939
27895	DOW	120	1787223480	53463.050000	53471.118932	53451.696401	53457.793247
27896	VIX	120	1787223480	15.150000	15.153748	15.143167	15.147798
28268	CRUDE	120	1787223840	86.707095	86.729737	86.704746	86.723652
28269	GOLD	120	1787223840	4545.058724	4545.890444	4543.599812	4544.757160
28270	DOW	120	1787223840	53464.080411	53474.008630	53456.923593	53474.008630
28271	VIX	120	1787223840	15.131974	15.131974	15.103407	15.117122
28393	CRUDE	120	1787223960	86.722133	86.743782	86.623612	86.688642
28521	VIX	120	1787224080	15.109219	15.120000	15.105900	15.116774
28641	VIX	120	1787224200	15.116017	15.124987	15.112325	15.123589
28517	SP500	120	1787224080	7708.252675	7708.983233	7706.756009	7708.168837
28267	SP500	120	1787223840	7705.819771	7709.194262	7705.819771	7707.687859
28394	GOLD	120	1787223960	4544.822420	4546.378014	4543.541464	4545.578340
28395	DOW	120	1787223960	53472.148269	53472.148269	53451.496459	53452.532788
28518	CRUDE	120	1787224080	86.690972	86.722788	86.655710	86.721231
28392	SP500	120	1787223960	7707.993003	7709.131063	7707.091760	7708.291785
28396	VIX	120	1787223960	15.116327	15.122211	15.104335	15.107997
28519	GOLD	120	1787224080	4545.466294	4547.212515	4544.490257	4546.422943
28520	DOW	120	1787224080	53453.844780	53468.181280	53453.844780	53465.733778
28759	GOLD	120	1787224320	4547.317550	4547.900000	4546.206916	4546.960687
28637	SP500	120	1787224200	7708.384815	7709.113068	7706.641740	7707.658898
28638	CRUDE	120	1787224200	86.720105	86.750828	86.698890	86.746651
28639	GOLD	120	1787224200	4546.505044	4547.369525	4544.462991	4547.161367
28640	DOW	120	1787224200	53467.334386	53469.697181	53452.905117	53458.329921
28757	SP500	120	1787224320	7707.792268	7709.190819	7706.618324	7706.778243
28758	CRUDE	120	1787224320	86.743931	86.820531	86.731021	86.807348
28878	CRUDE	120	1787224440	86.809903	86.872449	86.809903	86.864895
28879	GOLD	120	1787224440	4547.142190	4547.142190	4542.515927	4542.925357
28880	DOW	120	1787224440	53468.062325	53468.062325	53459.045168	53463.057825
28881	VIX	120	1787224440	15.121202	15.132737	15.098497	15.129202
30731	VIX	120	1787226240	15.302277	15.346244	15.302277	15.326624
29852	SP500	120	1787225400	7707.767943	7708.976394	7706.869116	7708.302001
29853	CRUDE	120	1787225400	86.971972	87.055076	86.958274	87.052313
29854	GOLD	120	1787225400	4538.414698	4541.306639	4538.152272	4541.156938
29855	DOW	120	1787225400	53453.543689	53471.248446	53453.543689	53466.148937
29357	SP500	120	1787224920	7708.405278	7709.577665	7706.743625	7706.743625
29237	SP500	120	1787224800	7708.059115	7709.246611	7706.679471	7708.345956
29238	CRUDE	120	1787224800	86.866803	86.900416	86.806722	86.898155
29239	GOLD	120	1787224800	4543.021514	4544.535212	4541.918710	4543.003270
29240	DOW	120	1787224800	53465.417928	53472.105371	53450.663484	53458.247004
29241	VIX	120	1787224800	15.134908	15.184461	15.123547	15.182859
29358	CRUDE	120	1787224920	86.897583	86.904788	86.867698	86.889220
29117	SP500	120	1787224680	7706.751452	7708.847256	7706.751452	7708.121881
29118	CRUDE	120	1787224680	86.860343	86.895239	86.818067	86.863545
29119	GOLD	120	1787224680	4544.538089	4544.917755	4541.858604	4543.147858
29120	DOW	120	1787224680	53464.042749	53466.788125	53459.710065	53463.963229
29121	VIX	120	1787224680	15.122569	15.143651	15.120069	15.135347
29359	GOLD	120	1787224920	4542.859525	4544.081573	4541.422549	4541.495273
29360	DOW	120	1787224920	53457.640723	53466.184896	53456.520873	53463.570102
29361	VIX	120	1787224920	15.181768	15.181768	15.164819	15.170553
28760	DOW	120	1787224320	53457.151829	53473.555880	53452.345239	53469.235040
28761	VIX	120	1787224320	15.123524	15.125435	15.115318	15.121620
29856	VIX	120	1787225400	15.209495	15.214148	15.184526	15.185421
28997	SP500	120	1787224560	7708.166614	7709.012868	7706.985665	7706.985665
28998	CRUDE	120	1787224560	86.866606	86.910000	86.839594	86.862288
28999	GOLD	120	1787224560	4543.002361	4544.733536	4542.560116	4544.386448
29000	DOW	120	1787224560	53464.914270	53476.868939	53455.340180	53465.619289
29001	VIX	120	1787224560	15.129774	15.134325	15.122068	15.122068
30227	SP500	120	1787225760	7708.499310	7709.003305	7706.996790	7708.497152
30228	CRUDE	120	1787225760	86.981168	86.996153	86.955287	86.985664
30229	GOLD	120	1787225760	4544.781508	4546.562645	4543.742540	4544.338282
30230	DOW	120	1787225760	53460.246993	53470.786627	53452.272279	53460.698150
30231	VIX	120	1787225760	15.221740	15.242482	15.214966	15.238636
30102	SP500	120	1787225640	7708.429424	7709.205863	7706.800830	7708.255484
30103	CRUDE	120	1787225640	87.049920	87.049920	86.960000	86.978628
29477	SP500	120	1787225040	7706.968202	7708.845433	7706.968202	7708.340784
29478	CRUDE	120	1787225040	86.891316	86.912190	86.862472	86.910106
29479	GOLD	120	1787225040	4541.457076	4542.297058	4539.317687	4540.581943
29480	DOW	120	1787225040	53465.453581	53475.040426	53453.973594	53463.658858
29481	VIX	120	1787225040	15.171021	15.183744	15.166524	15.176987
30104	GOLD	120	1787225640	4540.739090	4546.992820	4540.739090	4544.728086
30105	DOW	120	1787225640	53464.049140	53471.361367	53456.731135	53458.826861
30106	VIX	120	1787225640	15.195183	15.223891	15.177883	15.222318
28877	SP500	120	1787224440	7707.027647	7709.439231	7706.481381	7708.030022
29727	SP500	120	1787225280	7707.972271	7709.397545	7707.478762	7707.622380
29728	CRUDE	120	1787225280	86.884088	86.974707	86.864966	86.973615
29729	GOLD	120	1787225280	4541.024457	4541.024457	4537.459374	4538.381065
29730	DOW	120	1787225280	53471.306060	53471.306060	53451.504866	53451.504866
29731	VIX	120	1787225280	15.208427	15.220470	15.203503	15.209302
30851	VIX	120	1787226360	15.325569	15.335826	15.306825	15.334668
30727	SP500	120	1787226240	7706.760444	7708.825757	7706.760444	7707.291091
29602	SP500	120	1787225160	7708.283626	7709.293643	7707.308259	7707.979405
29603	CRUDE	120	1787225160	86.907354	86.933120	86.884137	86.884137
29604	GOLD	120	1787225160	4540.641600	4542.359302	4540.641600	4540.991466
29605	DOW	120	1787225160	53463.657927	53470.733095	53459.020827	53469.471776
29606	VIX	120	1787225160	15.176882	15.212328	15.176882	15.208840
30728	CRUDE	120	1787226240	87.124452	87.150532	87.109218	87.148104
30729	GOLD	120	1787226240	4541.031590	4543.136254	4539.162865	4542.911057
29977	SP500	120	1787225520	7708.070876	7709.214310	7706.495038	7708.331460
29978	CRUDE	120	1787225520	87.054703	87.055235	86.995790	87.049502
30477	SP500	120	1787226000	7707.742717	7709.220515	7706.552965	7706.552965
30478	CRUDE	120	1787226000	87.044968	87.102672	87.041433	87.090847
30479	GOLD	120	1787226000	4542.045199	4542.045199	4539.172291	4540.896721
30480	DOW	120	1787226000	53465.625778	53471.191656	53448.186728	53462.904043
30352	SP500	120	1787225880	7708.522612	7709.507549	7706.177520	7707.558948
29979	GOLD	120	1787225520	4541.244792	4542.018912	4539.366388	4540.882549
29980	DOW	120	1787225520	53465.983109	53470.968936	53457.170725	53462.972126
29981	VIX	120	1787225520	15.186878	15.195042	15.174314	15.194264
30353	CRUDE	120	1787225880	86.983740	87.065212	86.983740	87.041955
30481	VIX	120	1787226000	15.273317	15.281881	15.256730	15.281683
30730	DOW	120	1787226240	53451.457982	53467.892567	53451.457982	53458.085011
30602	SP500	120	1787226120	7706.422415	7709.081279	7706.422415	7706.656629
30603	CRUDE	120	1787226120	87.090754	87.140708	87.090754	87.122471
30354	GOLD	120	1787225880	4544.202307	4544.202307	4540.440776	4541.928948
30355	DOW	120	1787225880	53458.751744	53470.220685	53458.751744	53467.383588
30356	VIX	120	1787225880	15.238289	15.274117	15.236314	15.274035
30604	GOLD	120	1787226120	4541.004986	4542.223351	4539.871635	4540.983413
30605	DOW	120	1787226120	53461.698366	53467.895515	53451.128297	53451.128297
30606	VIX	120	1787226120	15.282889	15.310000	15.282561	15.302533
30969	GOLD	120	1787226480	4539.315866	4539.315866	4536.333630	4538.702938
30847	SP500	120	1787226360	7707.597755	7709.088219	7706.982770	7708.246467
30848	CRUDE	120	1787226360	87.150755	87.219697	87.121391	87.178149
30849	GOLD	120	1787226360	4543.081669	4543.213671	4537.363837	4539.447511
30850	DOW	120	1787226360	53456.278178	53466.013386	53453.912276	53466.013386
30967	SP500	120	1787226480	7707.984474	7709.023500	7706.752952	7707.723141
30968	CRUDE	120	1787226480	87.175923	87.175923	87.112304	87.117604
31088	CRUDE	120	1787226600	87.119190	87.169337	87.117663	87.139091
31089	GOLD	120	1787226600	4538.814533	4538.814533	4532.964304	4534.198443
31090	DOW	120	1787226600	53463.897376	53476.207225	53452.565892	53473.254090
31091	VIX	120	1787226600	15.325712	15.334316	15.325582	15.330066
31825	DOW	120	1787227320	53462.339639	53473.355695	53456.955019	53464.818062
31826	VIX	120	1787227320	15.370335	15.391966	15.370335	15.390097
31447	SP500	120	1787226960	7707.980000	7709.995010	7706.369692	7708.257916
31448	CRUDE	120	1787226960	87.000000	87.114360	86.996567	87.103475
31449	GOLD	120	1787226960	4527.400000	4527.651542	4524.358183	4526.036187
31450	DOW	120	1787226960	53463.050000	53466.334738	53453.451031	53461.322178
31451	VIX	120	1787226960	15.300000	15.361932	15.297795	15.341105
31327	SP500	120	1787226840	7708.703854	7709.105348	7706.972297	7707.543660
31328	CRUDE	120	1787226840	87.142845	87.161589	87.061328	87.067211
31329	GOLD	120	1787226840	4533.141070	4533.591180	4526.208190	4526.323511
31330	DOW	120	1787226840	53460.316218	53469.669244	53455.764426	53462.890517
31331	VIX	120	1787226840	15.326041	15.326041	15.289503	15.309625
32201	VIX	120	1787227680	15.435684	15.447170	15.432220	15.442316
31572	SP500	120	1787227080	7707.980000	7709.019602	7706.264175	7706.264175
31573	CRUDE	120	1787227080	87.110000	87.195811	87.103284	87.132125
31574	GOLD	120	1787227080	4526.300000	4528.008381	4522.101725	4527.405718
31575	DOW	120	1787227080	53463.050000	53472.902638	53458.413966	53459.661062
31576	VIX	120	1787227080	15.330000	15.352081	15.317406	15.351837
30970	DOW	120	1787226480	53464.746405	53468.536200	53455.670045	53464.345119
30971	VIX	120	1787226480	15.335286	15.345376	15.319638	15.324441
31207	SP500	120	1787226720	7707.359182	7709.306231	7707.268902	7708.971712
31208	CRUDE	120	1787226720	87.139359	87.174785	87.110000	87.143598
31209	GOLD	120	1787226720	4534.097149	4535.480944	4532.999370	4533.047983
31210	DOW	120	1787226720	53473.822611	53478.183783	53449.644991	53459.735974
31211	VIX	120	1787226720	15.329490	15.345223	15.316660	15.327183
32072	SP500	120	1787227560	7708.219060	7708.789669	7706.708521	7707.730358
32073	CRUDE	120	1787227560	87.135225	87.192926	87.130000	87.187691
32074	GOLD	120	1787227560	4524.094424	4526.593531	4522.500000	4522.680718
32075	DOW	120	1787227560	53458.701541	53470.715826	53458.542047	53459.380051
32076	VIX	120	1787227560	15.439288	15.454255	15.435290	15.435290
31697	SP500	120	1787227200	7707.980000	7709.653852	7706.849240	7707.232997
31698	CRUDE	120	1787227200	87.140000	87.247017	87.138335	87.199339
31699	GOLD	120	1787227200	4527.400000	4528.218091	4525.694676	4525.890467
31700	DOW	120	1787227200	53463.050000	53471.464813	53451.125320	53464.254496
31701	VIX	120	1787227200	15.350000	15.371688	15.341910	15.371688
32450	DOW	120	1787227920	53472.269903	53472.269903	53454.539484	53458.846259
31087	SP500	120	1787226600	7707.681012	7708.819276	7706.908028	7707.376623
32451	VIX	120	1787227920	15.482225	15.550000	15.482225	15.544690
32567	SP500	120	1787228040	7706.099147	7709.548908	7706.099147	7708.386040
32568	CRUDE	120	1787228040	87.255220	87.284124	87.244332	87.245751
32322	SP500	120	1787227800	7708.329719	7709.255726	7707.299054	7709.255726
32323	CRUDE	120	1787227800	87.244377	87.302106	87.195339	87.268940
32324	GOLD	120	1787227800	4523.007615	4523.100000	4515.178067	4515.463598
32325	DOW	120	1787227800	53465.977419	53472.118346	53456.588039	53471.144014
32326	VIX	120	1787227800	15.441705	15.483439	15.439032	15.483439
31947	SP500	120	1787227440	7707.168376	7709.186518	7707.168376	7708.509859
31948	CRUDE	120	1787227440	87.177083	87.177083	87.111789	87.138296
31949	GOLD	120	1787227440	4525.943541	4525.943541	4522.565619	4524.211283
31950	DOW	120	1787227440	53466.400388	53474.909648	53457.184125	53459.832271
31951	VIX	120	1787227440	15.389684	15.441181	15.389684	15.438997
31822	SP500	120	1787227320	7707.418384	7708.884167	7706.696092	7707.162346
31823	CRUDE	120	1787227320	87.201824	87.215890	87.175835	87.178909
31824	GOLD	120	1787227320	4525.713041	4526.420152	4523.692909	4525.842287
32569	GOLD	120	1787228040	4515.041923	4515.224669	4510.709955	4510.798146
32570	DOW	120	1787228040	53457.699274	53471.597635	53456.568209	53470.760181
32571	VIX	120	1787228040	15.543722	15.580000	15.543722	15.576137
32197	SP500	120	1787227680	7707.713423	7710.288080	7706.880730	7708.174365
32198	CRUDE	120	1787227680	87.190822	87.248904	87.190000	87.241471
32199	GOLD	120	1787227680	4522.734390	4523.655528	4522.086614	4523.156455
32200	DOW	120	1787227680	53460.688259	53470.356191	53455.543329	53464.285077
32932	SP500	120	1787228400	7708.888814	7708.907027	7707.454240	7708.907027
32933	CRUDE	120	1787228400	87.282172	87.364700	87.247868	87.325510
32934	GOLD	120	1787228400	4511.352479	4516.150594	4511.352479	4515.498010
32935	DOW	120	1787228400	53462.478512	53472.825997	53457.107902	53464.210414
32687	SP500	120	1787228160	7708.220481	7708.871405	7706.997369	7707.862430
32447	SP500	120	1787227920	7709.278627	7709.278627	7706.153335	7706.153335
32448	CRUDE	120	1787227920	87.268320	87.286158	87.184427	87.257766
32449	GOLD	120	1787227920	4515.560799	4516.230461	4513.310790	4514.914173
32688	CRUDE	120	1787228160	87.244935	87.320811	87.199838	87.201505
32689	GOLD	120	1787228160	4510.878339	4512.346204	4506.613561	4510.420221
32690	DOW	120	1787228160	53471.153744	53471.153744	53456.239291	53456.239291
32691	VIX	120	1787228160	15.574773	15.636259	15.574773	15.629336
32936	VIX	120	1787228400	15.730579	15.821433	15.714875	15.821433
32807	SP500	120	1787228280	7708.117123	7708.949064	7706.652195	7708.949064
32808	CRUDE	120	1787228280	87.200029	87.290000	87.200029	87.285056
32809	GOLD	120	1787228280	4510.377290	4513.377220	4508.646558	4511.221098
32810	DOW	120	1787228280	53457.947154	53471.343905	53457.265588	53462.697728
32811	VIX	120	1787228280	15.629146	15.743043	15.629146	15.729752
33057	SP500	120	1787228520	7709.210866	7709.210866	7707.029280	7708.701521
33058	CRUDE	120	1787228520	87.324139	87.440000	87.324139	87.412819
33059	GOLD	120	1787228520	4515.628637	4521.794121	4515.259592	4521.794121
33060	DOW	120	1787228520	53465.511044	53472.102478	53456.640512	53461.332150
33061	VIX	120	1787228520	15.822494	15.890680	15.822494	15.887247
33182	SP500	120	1787228640	7708.721809	7708.721809	7706.693523	7708.496885
33183	CRUDE	120	1787228640	87.416058	87.480000	87.416058	87.462706
33184	GOLD	120	1787228640	4521.886976	4521.886976	4517.079001	4521.205654
34561	VIX	120	1787229960	15.985131	16.053020	15.976642	16.040555
33307	SP500	120	1787228760	7708.752438	7708.752438	7706.891414	7708.014123
33308	CRUDE	120	1787228760	87.459678	87.510000	87.447196	87.501930
33309	GOLD	120	1787228760	4521.130761	4521.130761	4518.204725	4520.350033
33310	DOW	120	1787228760	53470.080892	53476.477969	53451.082086	53461.507134
33311	VIX	120	1787228760	15.888782	15.951701	15.879765	15.950773
35061	VIX	120	1787230440	16.048239	16.051678	16.025058	16.026223
34932	SP500	120	1787230320	7707.085021	7709.493559	7707.085021	7708.232103
34807	SP500	120	1787230200	7709.683803	7709.683803	7707.013348	7707.281515
34808	CRUDE	120	1787230200	87.369921	87.380661	87.216268	87.233228
34809	GOLD	120	1787230200	4516.309100	4520.021965	4516.309100	4519.092520
34182	SP500	120	1787229600	7707.500609	7709.415107	7707.029559	7707.190715
34183	CRUDE	120	1787229600	87.575231	87.587251	87.512934	87.524539
34184	GOLD	120	1787229600	4514.255602	4514.378440	4509.583565	4510.983223
34185	DOW	120	1787229600	53463.554782	53467.739994	53456.453194	53467.739994
34186	VIX	120	1787229600	15.953039	15.984196	15.918873	15.977332
34057	SP500	120	1787229480	7708.281141	7708.815998	7707.291236	7707.291236
34058	CRUDE	120	1787229480	87.449850	87.610000	87.449850	87.575488
34059	GOLD	120	1787229480	4514.427217	4515.488160	4513.152926	4514.103638
34060	DOW	120	1787229480	53461.816847	53469.658341	53459.905559	53464.878092
34061	VIX	120	1787229480	15.959728	15.991386	15.920000	15.951822
33682	SP500	120	1787229120	7708.720135	7708.720135	7707.046355	7707.867951
33683	CRUDE	120	1787229120	87.649555	87.649555	87.463746	87.473959
33684	GOLD	120	1787229120	4519.392736	4520.616246	4518.036153	4520.124167
33685	DOW	120	1787229120	53466.302013	53471.789248	53449.953500	53454.620519
33686	VIX	120	1787229120	15.952275	15.964447	15.936218	15.955284
33557	SP500	120	1787229000	7707.697801	7708.915454	7706.685744	7708.789828
33558	CRUDE	120	1787229000	87.626636	87.665806	87.626636	87.649543
33559	GOLD	120	1787229000	4521.200986	4522.500000	4517.073282	4519.557354
33185	DOW	120	1787228640	53462.312217	53469.786447	53459.821935	53469.030149
33186	VIX	120	1787228640	15.888317	15.897320	15.846364	15.888873
33560	DOW	120	1787229000	53468.984725	53472.983530	53450.497771	53465.890413
33561	VIX	120	1787229000	15.997865	15.997865	15.940000	15.953315
33807	SP500	120	1787229240	7707.957891	7708.901205	7707.175867	7707.666207
33808	CRUDE	120	1787229240	87.475638	87.514489	87.457274	87.508995
33809	GOLD	120	1787229240	4520.231287	4521.500000	4516.400000	4517.163588
33432	SP500	120	1787228880	7707.799937	7709.544802	7707.106453	7707.674123
33433	CRUDE	120	1787228880	87.504070	87.624632	87.504070	87.624632
33434	GOLD	120	1787228880	4520.311065	4522.713593	4520.090900	4521.189119
33435	DOW	120	1787228880	53461.608659	53470.836475	53455.582751	53470.836475
33436	VIX	120	1787228880	15.949607	16.014057	15.949607	15.996920
33810	DOW	120	1787229240	53452.514804	53471.372004	53452.514804	53459.666412
33811	VIX	120	1787229240	15.954545	16.020057	15.954545	15.972456
34432	SP500	120	1787229840	7707.371690	7709.620982	7707.116178	7707.489842
34433	CRUDE	120	1787229840	87.579664	87.579664	87.474490	87.493680
34434	GOLD	120	1787229840	4508.047994	4511.400000	4506.737222	4508.925411
34435	DOW	120	1787229840	53456.079147	53469.680414	53456.079147	53460.920164
34436	VIX	120	1787229840	16.013882	16.023145	15.978526	15.984806
34307	SP500	120	1787229720	7707.109744	7708.860743	7706.592117	7707.558067
34308	CRUDE	120	1787229720	87.525476	87.580000	87.473737	87.576647
34309	GOLD	120	1787229720	4510.851467	4511.101665	4507.914767	4508.154530
33932	SP500	120	1787229360	7707.697577	7708.867955	7707.041151	7708.472563
33933	CRUDE	120	1787229360	87.511848	87.511848	87.421378	87.451584
33934	GOLD	120	1787229360	4517.287738	4517.287738	4512.435908	4514.602679
33935	DOW	120	1787229360	53458.280162	53472.860247	53454.242061	53463.633123
33936	VIX	120	1787229360	15.971731	15.975703	15.944830	15.959595
34310	DOW	120	1787229720	53468.702842	53468.702842	53453.817864	53456.558511
34311	VIX	120	1787229720	15.977989	16.015011	15.947043	16.014172
34810	DOW	120	1787230200	53460.176734	53472.945083	53456.099375	53471.011660
34811	VIX	120	1787230200	15.993613	16.082948	15.993613	16.079022
34682	SP500	120	1787230080	7707.738141	7709.404340	7706.554592	7709.404340
34683	CRUDE	120	1787230080	87.438199	87.447634	87.364150	87.368269
34684	GOLD	120	1787230080	4513.333508	4516.938773	4512.516630	4516.195297
34685	DOW	120	1787230080	53466.192167	53472.644757	53458.136567	53461.170323
34686	VIX	120	1787230080	16.040640	16.040640	15.986191	15.993233
34557	SP500	120	1787229960	7707.617785	7709.259953	7707.351841	7707.725439
34558	CRUDE	120	1787229960	87.495725	87.511978	87.422205	87.435393
34559	GOLD	120	1787229960	4508.884787	4514.597407	4507.068525	4513.449747
34560	DOW	120	1787229960	53459.213646	53469.484172	53454.517846	53465.098499
34933	CRUDE	120	1787230320	87.233833	87.233833	87.067817	87.068759
34934	GOLD	120	1787230320	4518.972761	4520.270929	4514.953883	4519.802301
34935	DOW	120	1787230320	53469.988438	53477.262033	53455.297722	53465.278937
34936	VIX	120	1787230320	16.078502	16.078502	16.043660	16.048307
35057	SP500	120	1787230440	7708.522028	7709.316062	7706.879223	7707.356530
35058	CRUDE	120	1787230440	87.070849	87.121269	86.993239	87.015747
35059	GOLD	120	1787230440	4519.775211	4521.943927	4519.462250	4520.849486
35060	DOW	120	1787230440	53463.561028	53468.721769	53457.398667	53467.379821
35177	SP500	120	1787230560	7707.558358	7708.999667	7707.004675	7707.004675
35178	CRUDE	120	1787230560	87.015766	87.031602	86.920000	86.931944
35179	GOLD	120	1787230560	4520.819938	4524.526293	4520.817083	4523.606398
35180	DOW	120	1787230560	53465.326553	53471.834405	53450.340208	53468.591478
35181	VIX	120	1787230560	16.026208	16.051692	15.998649	16.051419
35302	SP500	120	1787230680	7706.755613	7709.268581	7706.755613	7707.865301
35303	CRUDE	120	1787230680	86.929624	86.934576	86.787808	86.787808
35304	GOLD	120	1787230680	4523.723327	4526.287349	4523.400000	4525.276760
35305	DOW	120	1787230680	53467.888586	53470.992978	53457.485877	53470.228065
35306	VIX	120	1787230680	16.050203	16.050203	16.003345	16.008318
35427	SP500	120	1787230800	7707.875258	7709.487342	7706.681738	7707.578793
35428	CRUDE	120	1787230800	86.784445	86.867656	86.779903	86.781075
35429	GOLD	120	1787230800	4525.217606	4528.882416	4524.900000	4528.868204
36803	CRUDE	120	1787232120	86.528582	86.620000	86.528582	86.590613
36804	GOLD	120	1787232120	4528.456463	4530.125490	4527.665324	4529.683125
36805	DOW	120	1787232120	53471.689333	53471.689333	53452.861146	53465.543920
36806	VIX	120	1787232120	15.737822	15.761349	15.737822	15.754584
35552	SP500	120	1787230920	7707.289545	7708.607408	7706.445929	7707.549517
35553	CRUDE	120	1787230920	86.778722	86.787177	86.703905	86.773286
35554	GOLD	120	1787230920	4529.044115	4530.258830	4526.448006	4526.653001
35555	DOW	120	1787230920	53464.007344	53475.467410	53454.125750	53457.903773
35556	VIX	120	1787230920	15.988147	15.988147	15.917006	15.917716
37431	VIX	120	1787232720	15.900326	15.931812	15.900326	15.924780
37551	VIX	120	1787232840	15.924298	15.924298	15.894784	15.919449
37177	SP500	120	1787232480	7708.655619	7709.487707	7707.300207	7707.827653
37052	SP500	120	1787232360	7707.469913	7709.095633	7706.535558	7708.423317
36427	SP500	120	1787231760	7708.302658	7709.236459	7706.806686	7708.335894
36428	CRUDE	120	1787231760	86.657781	86.740000	86.657781	86.660563
36429	GOLD	120	1787231760	4534.256575	4534.256575	4531.689208	4532.023400
36430	DOW	120	1787231760	53465.471917	53471.380819	53456.724883	53467.560226
36431	VIX	120	1787231760	15.813246	15.813246	15.786720	15.795810
36302	SP500	120	1787231640	7707.798372	7709.192918	7707.596389	7708.318400
36303	CRUDE	120	1787231640	86.818047	86.845110	86.636111	86.658513
36304	GOLD	120	1787231640	4536.437132	4537.359594	4532.740259	4534.212795
36305	DOW	120	1787231640	53462.873375	53470.059535	53453.668845	53465.743350
36306	VIX	120	1787231640	15.831664	15.845701	15.806235	15.813048
35927	SP500	120	1787231280	7707.229493	7709.916557	7707.229493	7708.374578
35928	CRUDE	120	1787231280	86.858488	86.861410	86.713021	86.715140
35929	GOLD	120	1787231280	4528.955806	4531.963433	4528.305695	4529.671076
35930	DOW	120	1787231280	53462.081654	53475.936835	53456.102077	53459.999755
35931	VIX	120	1787231280	15.887641	15.887641	15.826116	15.827361
35802	SP500	120	1787231160	7708.324395	7709.406156	7707.365041	7707.377211
35803	CRUDE	120	1787231160	86.845313	86.876210	86.800328	86.860188
35430	DOW	120	1787230800	53472.320944	53472.320944	53451.688215	53465.737521
35431	VIX	120	1787230800	16.009108	16.014280	15.982864	15.986564
35804	GOLD	120	1787231160	4527.416476	4529.823184	4526.900791	4528.803389
35805	DOW	120	1787231160	53461.735941	53468.757320	53457.593400	53462.506401
35806	VIX	120	1787231160	15.897495	15.897495	15.860000	15.886873
35677	SP500	120	1787231040	7707.335500	7709.437751	7707.335500	7708.372711
35678	CRUDE	120	1787231040	86.769887	86.892443	86.769887	86.844827
35679	GOLD	120	1787231040	4526.792127	4528.324187	4526.350574	4527.492770
35680	DOW	120	1787231040	53457.728506	53470.187972	53451.082198	53463.297469
35681	VIX	120	1787231040	15.916727	15.925413	15.888517	15.897923
36052	SP500	120	1787231400	7708.400097	7709.914810	7707.012807	7707.688774
36053	CRUDE	120	1787231400	86.714115	86.870488	86.660180	86.794693
36054	GOLD	120	1787231400	4529.548044	4538.858118	4529.548044	4538.727785
36055	DOW	120	1787231400	53459.348581	53472.048395	53449.637614	53469.039013
36056	VIX	120	1787231400	15.827722	15.856957	15.820000	15.839340
37053	CRUDE	120	1787232360	86.600120	86.600120	86.533143	86.565740
36677	SP500	120	1787232000	7708.139709	7708.859939	7707.100665	7708.418285
36678	CRUDE	120	1787232000	86.543138	86.564293	86.488404	86.527966
36679	GOLD	120	1787232000	4531.290072	4531.290072	4528.174229	4528.597256
36680	DOW	120	1787232000	53472.413975	53473.511913	53456.604942	53470.132152
36681	VIX	120	1787232000	15.752289	15.752289	15.723720	15.736962
36552	SP500	120	1787231880	7708.623005	7709.538376	7706.637286	7708.234172
36553	CRUDE	120	1787231880	86.660036	86.720175	86.530000	86.540441
36554	GOLD	120	1787231880	4531.876471	4533.493148	4528.984353	4531.282742
36555	DOW	120	1787231880	53466.616338	53472.178305	53456.550138	53471.323819
36177	SP500	120	1787231520	7707.457504	7708.615231	7706.429871	7707.872994
36178	CRUDE	120	1787231520	86.797471	86.866631	86.756443	86.817508
36179	GOLD	120	1787231520	4538.907367	4539.144955	4535.127608	4536.300936
36180	DOW	120	1787231520	53469.914413	53471.564032	53455.146476	53464.422893
36181	VIX	120	1787231520	15.840090	15.847308	15.827629	15.833098
36556	VIX	120	1787231880	15.795528	15.795528	15.747669	15.752196
37054	GOLD	120	1787232360	4527.405158	4529.600000	4525.747931	4529.197502
37055	DOW	120	1787232360	53471.978024	53473.106642	53453.606353	53468.787504
37056	VIX	120	1787232360	15.785586	15.824602	15.785586	15.817930
37178	CRUDE	120	1787232480	86.567847	86.605593	86.440000	86.466125
37179	GOLD	120	1787232480	4529.081730	4531.720903	4528.601489	4529.761127
36927	SP500	120	1787232240	7708.675473	7709.285151	7707.120688	7707.762713
36928	CRUDE	120	1787232240	86.587834	86.715210	86.569385	86.602194
36929	GOLD	120	1787232240	4529.839746	4529.900000	4526.577773	4527.260636
36930	DOW	120	1787232240	53467.427345	53475.221718	53459.792589	53473.942824
36802	SP500	120	1787232120	7708.665747	7710.072106	7707.507916	7708.840584
37180	DOW	120	1787232480	53470.743097	53470.743097	53458.386275	53469.756675
37181	VIX	120	1787232480	15.818935	15.864662	15.812671	15.864662
36931	VIX	120	1787232240	15.755514	15.785754	15.754523	15.785754
37427	SP500	120	1787232720	7687.530276	7687.724192	7682.887502	7684.774365
37428	CRUDE	120	1787232720	86.420734	86.601791	86.420734	86.601791
37429	GOLD	120	1787232720	4529.190031	4530.148430	4526.665133	4527.604187
37430	DOW	120	1787232720	53054.234627	53103.781972	53045.892196	53100.252639
37302	SP500	120	1787232600	7707.884768	7708.022503	7678.208279	7687.382876
37303	CRUDE	120	1787232600	86.464813	86.536574	86.388940	86.421018
37304	GOLD	120	1787232600	4529.783390	4531.561364	4528.688095	4529.026514
37305	DOW	120	1787232600	53470.613211	53470.613211	52992.659992	53053.983637
37306	VIX	120	1787232600	15.864149	15.913145	15.864149	15.901631
37547	SP500	120	1787232840	7684.849822	7697.311437	7684.603174	7697.311437
37548	CRUDE	120	1787232840	86.602536	86.605465	86.522570	86.563903
37549	GOLD	120	1787232840	4527.530863	4529.757399	4526.843358	4527.438286
37550	DOW	120	1787232840	53100.470892	53163.730000	53100.243318	53159.412931
37667	SP500	120	1787232960	7697.028942	7697.555110	7693.152850	7693.674519
37668	CRUDE	120	1787232960	86.561626	86.650000	86.561626	86.625743
37669	GOLD	120	1787232960	4527.576987	4528.825644	4525.814977	4527.916587
38520	DOW	120	1787233800	53173.359537	53199.746401	53170.690325	53178.062998
37792	SP500	120	1787233080	7693.657826	7693.657826	7688.574081	7693.139596
37793	CRUDE	120	1787233080	86.627961	86.741184	86.605008	86.670199
37794	GOLD	120	1787233080	4527.847921	4529.400000	4525.507914	4525.945620
37795	DOW	120	1787233080	53099.621458	53133.030952	53086.307490	53103.775131
37796	VIX	120	1787233080	15.926945	15.927111	15.897168	15.901025
38521	VIX	120	1787233800	15.579477	15.613176	15.507098	15.510051
39008	CRUDE	120	1787234280	86.421248	86.421248	86.331480	86.353642
39009	GOLD	120	1787234280	4536.626199	4538.638515	4534.506147	4538.520455
39010	DOW	120	1787234280	53129.425473	53130.279771	53107.331229	53120.565628
39011	VIX	120	1787234280	15.550218	15.550218	15.498193	15.502250
38277	SP500	120	1787233560	7691.264665	7693.260000	7689.400000	7690.088947
38157	SP500	120	1787233440	7695.399697	7697.642390	7690.913079	7691.161040
38158	CRUDE	120	1787233440	86.837935	86.877638	86.661195	86.700279
38159	GOLD	120	1787233440	4529.785899	4539.844232	4528.153724	4539.405675
38160	DOW	120	1787233440	53129.411351	53144.390000	53093.920548	53127.256969
38161	VIX	120	1787233440	15.872591	15.874210	15.865328	15.867359
38278	CRUDE	120	1787233560	86.698097	86.811770	86.697789	86.747972
38279	GOLD	120	1787233560	4539.236825	4539.236825	4534.064951	4539.026073
38032	SP500	120	1787233320	7693.564567	7695.817588	7691.240133	7695.435744
38033	CRUDE	120	1787233320	86.809952	86.981964	86.809952	86.840171
38034	GOLD	120	1787233320	4526.805661	4529.996910	4525.120782	4529.719505
38035	DOW	120	1787233320	53095.429493	53133.550267	53084.357107	53128.605926
38036	VIX	120	1787233320	15.871257	15.874007	15.866976	15.873450
38280	DOW	120	1787233560	53127.207370	53172.448309	53124.217421	53156.822523
37670	DOW	120	1787232960	53159.981351	53165.543215	53097.959744	53098.107026
37671	VIX	120	1787232960	15.920447	15.933059	15.904925	15.928133
38281	VIX	120	1787233560	15.865844	15.875545	15.618460	15.622155
37912	SP500	120	1787233200	7692.927215	7693.822695	7687.170465	7693.530351
37913	CRUDE	120	1787233200	86.671127	86.836383	86.667169	86.807493
37914	GOLD	120	1787233200	4525.868176	4531.124140	4525.812113	4526.836480
37915	DOW	120	1787233200	53104.499117	53127.403127	53094.234105	53095.269794
37916	VIX	120	1787233200	15.900194	15.900516	15.863777	15.871318
39248	CRUDE	120	1787234520	86.396185	86.431253	86.336994	86.427208
39249	GOLD	120	1787234520	4537.664433	4542.241234	4536.828851	4539.052384
39250	DOW	120	1787234520	53124.908039	53125.816873	53101.855492	53117.729256
39251	VIX	120	1787234520	15.552964	15.560000	15.532576	15.556155
38397	SP500	120	1787233680	7690.313719	7690.768197	7685.780000	7690.425071
38398	CRUDE	120	1787233680	86.750089	86.753322	86.590000	86.624836
38399	GOLD	120	1787233680	4539.125750	4540.183653	4536.417801	4538.155410
38400	DOW	120	1787233680	53155.533968	53174.898137	53131.515385	53174.898137
38401	VIX	120	1787233680	15.622769	15.630344	15.575986	15.579825
39127	SP500	120	1787234400	7683.773548	7688.823512	7683.716353	7686.643658
39128	CRUDE	120	1787234400	86.354155	86.416251	86.354155	86.393397
38882	SP500	120	1787234160	7691.382386	7693.378471	7681.752915	7683.846048
38883	CRUDE	120	1787234160	86.536234	86.537332	86.422147	86.422147
38884	GOLD	120	1787234160	4541.068924	4541.569047	4536.461640	4536.461640
38885	DOW	120	1787234160	53184.383634	53184.383634	53129.629929	53129.629929
38886	VIX	120	1787234160	15.597777	15.611296	15.541767	15.548954
39129	GOLD	120	1787234400	4538.607624	4538.607624	4536.472557	4537.842006
38642	SP500	120	1787233920	7688.245361	7688.249808	7684.072700	7686.429710
38643	CRUDE	120	1787233920	86.760929	86.791448	86.708483	86.734106
38644	GOLD	120	1787233920	4540.509128	4542.808027	4538.173559	4542.637122
38645	DOW	120	1787233920	53176.589786	53188.174243	53150.665617	53184.536484
38646	VIX	120	1787233920	15.511575	15.560112	15.484570	15.555945
38517	SP500	120	1787233800	7690.603912	7691.972556	7686.023079	7688.094171
38518	CRUDE	120	1787233800	86.625483	86.761555	86.625483	86.761555
38519	GOLD	120	1787233800	4538.243959	4540.619128	4533.139765	4540.619128
39130	DOW	120	1787234400	53119.465285	53132.690993	53100.677071	53126.280782
39131	VIX	120	1787234400	15.502228	15.557396	15.501117	15.551901
38762	SP500	120	1787234040	7686.361734	7691.462429	7683.993420	7691.462429
38763	CRUDE	120	1787234040	86.731007	86.770673	86.528536	86.538381
38764	GOLD	120	1787234040	4542.524420	4543.667395	4540.810294	4541.083949
38765	DOW	120	1787234040	53186.572741	53189.811998	53158.141279	53182.316108
38766	VIX	120	1787234040	15.556536	15.600315	15.537447	15.598691
39496	VIX	120	1787234760	15.598366	15.684064	15.598366	15.680975
39741	VIX	120	1787235000	15.727790	15.732086	15.660977	15.698783
39492	SP500	120	1787234760	7678.780480	7684.298937	7678.780480	7679.657434
39493	CRUDE	120	1787234760	86.431186	86.461355	86.396367	86.435781
39007	SP500	120	1787234280	7683.572309	7685.508524	7681.752033	7683.844421
39372	SP500	120	1787234640	7680.546882	7682.611670	7677.263119	7679.037383
39373	CRUDE	120	1787234640	86.428275	86.446264	86.317161	86.431399
39374	GOLD	120	1787234640	4539.013608	4541.417147	4537.476021	4539.103281
39375	DOW	120	1787234640	53117.659954	53118.718214	53069.286510	53087.297038
39376	VIX	120	1787234640	15.557253	15.600960	15.556817	15.597852
39247	SP500	120	1787234520	7686.887359	7686.887359	7679.108680	7680.317414
39494	GOLD	120	1787234760	4539.176753	4539.671712	4536.367365	4536.620950
39495	DOW	120	1787234760	53087.669623	53099.395727	53072.274160	53072.274160
39612	SP500	120	1787234880	7679.867294	7684.002937	7678.495679	7683.263920
39613	CRUDE	120	1787234880	86.433121	86.491900	86.408625	86.452513
39614	GOLD	120	1787234880	4536.765033	4537.069209	4535.107535	4536.560676
39615	DOW	120	1787234880	53074.097463	53100.150000	53064.422564	53098.698622
39616	VIX	120	1787234880	15.679731	15.732146	15.671527	15.726406
39737	SP500	120	1787235000	7683.000251	7686.604129	7681.879004	7682.293809
39738	CRUDE	120	1787235000	86.449277	86.526928	86.448634	86.518492
39739	GOLD	120	1787235000	4536.460144	4544.577444	4536.437108	4542.224825
39740	DOW	120	1787235000	53098.877765	53098.877765	53060.456339	53061.379400
39857	SP500	120	1787235120	7682.574245	7684.736978	7680.717093	7682.931624
39858	CRUDE	120	1787235120	86.519923	86.541451	86.416638	86.533528
39859	GOLD	120	1787235120	4542.221484	4546.492762	4539.277825	4540.382350
39982	SP500	120	1787235240	7682.726603	7682.726603	7677.214713	7678.440686
39983	CRUDE	120	1787235240	86.535312	86.681750	86.531962	86.596131
39984	GOLD	120	1787235240	4540.477269	4540.981425	4537.181386	4537.822735
39985	DOW	120	1787235240	53062.034534	53062.034534	53027.630572	53049.095843
39986	VIX	120	1787235240	15.814060	15.860226	15.796760	15.824993
41542	SP500	120	1787236800	7689.323130	7689.323130	7686.252564	7686.820075
41543	CRUDE	120	1787236800	85.889724	86.048680	85.885772	86.011858
41297	SP500	120	1787236560	7680.398936	7686.787966	7680.276964	7686.703218
41298	CRUDE	120	1787236560	85.835714	85.897974	85.784270	85.889979
41299	GOLD	120	1787236560	4547.297688	4547.362619	4543.384945	4543.864713
41300	DOW	120	1787236560	53110.422791	53130.883253	53095.168655	53118.408716
41301	VIX	120	1787236560	15.869464	15.913816	15.868157	15.879127
40342	SP500	120	1787235600	7673.911001	7682.572018	7672.874638	7682.048973
40343	CRUDE	120	1787235600	86.620380	86.643291	86.547466	86.631693
40344	GOLD	120	1787235600	4540.167015	4543.473522	4538.997072	4542.907769
40345	DOW	120	1787235600	53022.675794	53067.774300	53015.009223	53030.254032
40346	VIX	120	1787235600	15.939760	15.983424	15.935512	15.971284
40222	SP500	120	1787235480	7674.483220	7677.372868	7673.749286	7673.882090
40223	CRUDE	120	1787235480	86.716723	86.745097	86.615436	86.618310
40224	GOLD	120	1787235480	4537.613808	4542.058386	4537.587039	4540.314840
40225	DOW	120	1787235480	53034.304593	53050.452419	53020.022884	53021.917669
40226	VIX	120	1787235480	15.864037	15.941008	15.863318	15.940487
40462	SP500	120	1787235720	7681.980789	7686.254616	7677.657127	7686.163373
40463	CRUDE	120	1787235720	86.630601	86.631141	86.379112	86.380817
40464	GOLD	120	1787235720	4542.826022	4545.292130	4542.159460	4545.292130
40465	DOW	120	1787235720	53030.448477	53094.140000	53027.504205	53089.711492
40466	VIX	120	1787235720	15.971755	16.033052	15.965814	16.025548
39860	DOW	120	1787235120	53062.036916	53075.458252	53045.464288	53062.951006
39861	VIX	120	1787235120	15.697715	15.813994	15.695940	15.813994
40102	SP500	120	1787235360	7678.318090	7678.452717	7673.549979	7674.357857
40103	CRUDE	120	1787235360	86.598864	86.748203	86.596648	86.716616
40104	GOLD	120	1787235360	4537.687919	4540.759300	4536.868604	4537.594661
40105	DOW	120	1787235360	53047.730377	53047.730377	53015.942369	53032.186656
40106	VIX	120	1787235360	15.826046	15.891517	15.824702	15.863911
41062	SP500	120	1787236320	7682.387863	7686.029923	7681.051902	7685.789702
41063	CRUDE	120	1787236320	86.117554	86.118778	85.767436	85.775948
41064	GOLD	120	1787236320	4544.702947	4546.788092	4542.588312	4546.463673
41065	DOW	120	1787236320	53117.725261	53127.910000	53100.360910	53127.688564
41066	VIX	120	1787236320	16.041762	16.063059	15.940000	15.940465
40587	SP500	120	1787235840	7686.320539	7687.176433	7683.839026	7684.211732
40588	CRUDE	120	1787235840	86.383495	86.480211	86.383442	86.408308
40589	GOLD	120	1787235840	4545.300807	4545.523173	4539.747045	4540.563837
40590	DOW	120	1787235840	53089.219180	53120.881084	53086.225194	53106.674774
40591	VIX	120	1787235840	16.025636	16.026532	15.930000	15.939969
41544	GOLD	120	1787236800	4547.695345	4550.915522	4547.537908	4548.349531
41545	DOW	120	1787236800	53115.517267	53131.831306	53094.640000	53098.118625
40947	SP500	120	1787236200	7682.349981	7683.167543	7679.329466	7682.618636
40827	SP500	120	1787236080	7678.979504	7683.110000	7678.965036	7682.071833
40828	CRUDE	120	1787236080	86.384740	86.389914	86.072683	86.109896
40829	GOLD	120	1787236080	4543.454556	4544.498219	4538.549741	4538.649317
40830	DOW	120	1787236080	53094.072120	53105.322909	53084.411920	53091.714244
40831	VIX	120	1787236080	15.968775	15.990000	15.958121	15.986888
40948	CRUDE	120	1787236200	86.113293	86.155025	86.077171	86.114954
40949	GOLD	120	1787236200	4538.490229	4546.603657	4537.431343	4544.595383
40950	DOW	120	1787236200	53091.542850	53118.110511	53088.203209	53117.729131
40951	VIX	120	1787236200	15.987964	16.044604	15.987262	16.041330
40707	SP500	120	1787235960	7684.516997	7686.381272	7678.867566	7678.960893
40708	CRUDE	120	1787235960	86.405465	86.405465	86.290206	86.387271
40709	GOLD	120	1787235960	4540.399348	4545.242413	4540.353599	4543.578327
40710	DOW	120	1787235960	53105.034391	53131.052831	53094.692041	53094.692041
40711	VIX	120	1787235960	15.940957	15.972739	15.929037	15.968226
41182	SP500	120	1787236440	7685.570393	7686.347745	7678.162929	7680.264522
41183	CRUDE	120	1787236440	85.779032	85.870694	85.729102	85.833051
41184	GOLD	120	1787236440	4546.402573	4549.506978	4546.301171	4547.267814
41185	DOW	120	1787236440	53128.765812	53134.003680	53087.097401	53108.407290
41186	VIX	120	1787236440	15.939990	15.993386	15.869119	15.869222
41546	VIX	120	1787236800	15.768963	15.820000	15.766663	15.817145
41417	SP500	120	1787236680	7686.962666	7690.031831	7684.083109	7689.091907
41662	SP500	120	1787236920	7686.645835	7691.486620	7683.786432	7690.947627
41663	CRUDE	120	1787236920	86.012575	86.085683	86.006530	86.082760
42039	GOLD	120	1787237280	4554.465629	4554.484789	4551.122044	4551.151359
41787	SP500	120	1787237040	7691.204091	7692.833475	7690.070809	7692.216050
41788	CRUDE	120	1787237040	86.085334	86.088154	85.930000	85.935037
41418	CRUDE	120	1787236680	85.889365	85.920641	85.851520	85.891978
41419	GOLD	120	1787236680	4543.942055	4549.000000	4543.100000	4547.680456
41420	DOW	120	1787236680	53116.880029	53132.902914	53105.206409	53116.475733
41421	VIX	120	1787236680	15.880030	15.881584	15.766609	15.767589
41789	GOLD	120	1787237040	4550.931567	4553.600000	4548.255798	4553.299096
41790	DOW	120	1787237040	53130.550218	53131.599596	53103.974524	53130.720808
41664	GOLD	120	1787236920	4548.502564	4551.334547	4548.397833	4550.854814
41665	DOW	120	1787236920	53099.417555	53129.339352	53087.210835	53129.071824
41666	VIX	120	1787236920	15.816033	15.861251	15.816033	15.837187
41791	VIX	120	1787237040	15.837510	15.860000	15.824273	15.827284
41912	SP500	120	1787237160	7692.024586	7694.668845	7689.396522	7689.508071
41913	CRUDE	120	1787237160	85.935017	86.044764	85.927016	86.027351
41914	GOLD	120	1787237160	4553.377018	4555.941771	4552.314907	4554.475223
41915	DOW	120	1787237160	53128.646330	53137.256235	53112.169408	53115.246757
41916	VIX	120	1787237160	15.826681	15.841698	15.794239	15.811282
42037	SP500	120	1787237280	7689.759637	7689.759637	7685.735392	7686.647049
42038	CRUDE	120	1787237280	86.029261	86.052108	85.939288	85.942146
43374	GOLD	120	1787238600	4571.854224	4578.800000	4571.500000	4577.959585
43375	DOW	120	1787238600	53131.830820	53132.081757	53101.134189	53104.368089
43376	VIX	120	1787238600	15.753917	15.753917	15.725043	15.743170
42157	SP500	120	1787237400	7686.692876	7687.662699	7684.658542	7687.662699
42158	CRUDE	120	1787237400	85.943924	86.110030	85.926875	86.092734
42159	GOLD	120	1787237400	4551.316259	4552.493548	4550.179471	4550.298831
42160	DOW	120	1787237400	53096.938733	53125.510459	53093.103494	53123.413452
42161	VIX	120	1787237400	15.801175	15.840000	15.798536	15.814760
44105	DOW	120	1787239320	53098.939681	53107.392253	53078.150272	53086.140215
43857	SP500	120	1787239080	7684.547550	7689.682571	7684.276957	7687.739346
43858	CRUDE	120	1787239080	86.288554	86.396668	86.225891	86.244296
43732	SP500	120	1787238960	7685.326174	7686.281652	7683.574369	7684.614166
43612	SP500	120	1787238840	7683.598670	7688.466536	7683.250726	7685.103191
43613	CRUDE	120	1787238840	86.144981	86.359581	86.144981	86.359581
43614	GOLD	120	1787238840	4588.362227	4590.863366	4587.508836	4589.111717
43615	DOW	120	1787238840	53125.478209	53144.845511	53117.588489	53118.616102
43616	VIX	120	1787238840	15.732738	15.734087	15.673936	15.680215
42777	SP500	120	1787238000	7691.699435	7699.035776	7689.658829	7696.872787
42778	CRUDE	120	1787238000	86.195550	86.232504	86.114361	86.151807
42527	SP500	120	1787237760	7688.764198	7689.089642	7684.463764	7684.507799
42528	CRUDE	120	1787237760	86.077668	86.140000	86.050000	86.102674
42529	GOLD	120	1787237760	4557.616874	4560.359807	4557.073734	4559.888484
42530	DOW	120	1787237760	53125.476181	53140.930000	53119.250658	53128.625694
42531	VIX	120	1787237760	15.733084	15.787400	15.728695	15.750768
42402	SP500	120	1787237640	7690.094244	7690.841462	7684.508948	7688.710935
42403	CRUDE	120	1787237640	86.065439	86.147894	86.039854	86.074976
42404	GOLD	120	1787237640	4555.645130	4557.877651	4554.488809	4557.484105
42405	DOW	120	1787237640	53149.628722	53159.720000	53125.810412	53125.810412
42406	VIX	120	1787237640	15.765128	15.765907	15.695978	15.731601
42040	DOW	120	1787237280	53116.835779	53118.754531	53094.639256	53096.985357
42041	VIX	120	1787237280	15.811635	15.814492	15.750000	15.801141
42779	GOLD	120	1787238000	4563.033010	4564.040415	4561.517965	4561.517965
42780	DOW	120	1787238000	53150.195047	53179.481126	53141.474742	53168.300019
42781	VIX	120	1787238000	15.714670	15.720000	15.689770	15.698703
42652	SP500	120	1787237880	7684.620900	7691.407982	7684.602046	7691.407982
42653	CRUDE	120	1787237880	86.101862	86.220098	86.066685	86.198334
42282	SP500	120	1787237520	7687.856657	7690.719354	7687.023667	7689.969001
42283	CRUDE	120	1787237520	86.094839	86.216277	86.057525	86.062567
42284	GOLD	120	1787237520	4550.213117	4555.739369	4549.400000	4555.499545
42285	DOW	120	1787237520	53124.160547	53159.447304	53122.149775	53148.330798
42286	VIX	120	1787237520	15.814553	15.819053	15.756935	15.765145
42654	GOLD	120	1787237880	4559.817043	4563.131996	4559.500000	4563.131996
42655	DOW	120	1787237880	53126.938046	53157.655100	53121.397141	53150.053540
42656	VIX	120	1787237880	15.752298	15.753661	15.710000	15.713862
43247	SP500	120	1787238480	7689.631855	7691.186148	7682.918036	7682.918036
43248	CRUDE	120	1787238480	86.118246	86.118474	85.952897	86.000682
43249	GOLD	120	1787238480	4569.636390	4571.792065	4569.600000	4571.792065
43250	DOW	120	1787238480	53187.359002	53187.423357	53116.588723	53129.803112
43251	VIX	120	1787238480	15.729268	15.760000	15.700000	15.753944
43002	SP500	120	1787238240	7695.342086	7701.013033	7693.160000	7693.399254
43003	CRUDE	120	1787238240	86.128952	86.130000	86.060000	86.078332
43004	GOLD	120	1787238240	4565.232645	4566.394841	4563.905329	4565.532620
43005	DOW	120	1787238240	53184.097208	53217.255627	53177.501651	53188.769461
43006	VIX	120	1787238240	15.730525	15.755779	15.723643	15.747445
42882	SP500	120	1787238120	7697.120542	7699.466086	7694.788787	7695.478468
42883	CRUDE	120	1787238120	86.150574	86.222359	86.118320	86.130035
42884	GOLD	120	1787238120	4561.556724	4565.464270	4560.645525	4565.136458
42885	DOW	120	1787238120	53167.256253	53185.225306	53165.865919	53183.508421
42886	VIX	120	1787238120	15.698148	15.730426	15.672437	15.730426
43492	SP500	120	1787238720	7680.958749	7685.289765	7680.439978	7683.653384
43493	CRUDE	120	1787238720	86.055898	86.250000	86.053027	86.142840
43494	GOLD	120	1787238720	4578.085279	4589.234791	4578.078368	4588.341897
43733	CRUDE	120	1787238960	86.359061	86.368971	86.285511	86.290536
43127	SP500	120	1787238360	7693.515670	7693.726621	7689.360182	7689.752354
43128	CRUDE	120	1787238360	86.081262	86.121812	86.004819	86.119233
43129	GOLD	120	1787238360	4565.453818	4571.088835	4565.382000	4569.817284
43130	DOW	120	1787238360	53189.251420	53190.824887	53166.931892	53187.796646
43131	VIX	120	1787238360	15.748517	15.749059	15.718588	15.730775
43734	GOLD	120	1787238960	4589.101031	4589.116495	4580.895989	4587.913121
43372	SP500	120	1787238600	7682.860675	7685.701354	7679.224138	7680.857207
43859	GOLD	120	1787239080	4587.794220	4588.079136	4578.933872	4579.048571
43860	DOW	120	1787239080	53129.347156	53164.840000	53127.092345	53143.401860
43495	DOW	120	1787238720	53103.675572	53128.931327	53101.090000	53126.723650
43373	CRUDE	120	1787238600	86.000382	86.156487	85.997015	86.053162
43496	VIX	120	1787238720	15.742514	15.755750	15.715370	15.734123
43735	DOW	120	1787238960	53120.672763	53138.634073	53116.427457	53127.654157
43736	VIX	120	1787238960	15.679027	15.684973	15.578201	15.580003
43861	VIX	120	1787239080	15.580357	15.622565	15.577494	15.592625
43977	SP500	120	1787239200	7687.816607	7688.015438	7682.020000	7682.854545
43978	CRUDE	120	1787239200	86.241518	86.307264	85.890000	86.262922
43979	GOLD	120	1787239200	4578.980643	4584.749053	4578.614695	4579.328389
43980	DOW	120	1787239200	53143.128800	53145.872666	53099.078309	53099.078309
43981	VIX	120	1787239200	15.593906	15.702969	15.593906	15.694506
44106	VIX	120	1787239320	15.693215	15.710000	15.676053	15.709859
44219	GOLD	120	1787239440	4588.813792	4593.158192	4587.976426	4589.972063
44102	SP500	120	1787239320	7683.003751	7683.645622	7679.581998	7680.371334
44103	CRUDE	120	1787239320	86.263926	86.350321	86.263353	86.348316
44104	GOLD	120	1787239320	4579.478077	4592.086883	4579.478077	4588.801619
44217	SP500	120	1787239440	7680.445219	7682.718351	7679.268974	7679.966375
44218	CRUDE	120	1787239440	86.347895	86.385797	86.261967	86.385797
45067	SP500	120	1787240280	7678.404440	7679.016651	7673.420831	7673.421793
45068	CRUDE	120	1787240280	86.530204	86.530797	86.381671	86.529129
45069	GOLD	120	1787240280	4589.555427	4589.671704	4587.224564	4587.509382
45070	DOW	120	1787240280	53062.471344	53062.471344	53033.343484	53035.555229
44337	SP500	120	1787239560	7679.763573	7683.963705	7679.763573	7683.724859
44338	CRUDE	120	1787239560	86.384712	86.406450	86.347224	86.350859
44339	GOLD	120	1787239560	4589.844258	4593.697296	4589.121476	4593.230625
44340	DOW	120	1787239560	53106.113387	53113.707145	53093.345788	53113.707145
44341	VIX	120	1787239560	15.764762	15.806147	15.762488	15.790494
45071	VIX	120	1787240280	15.787969	15.810000	15.773198	15.773198
45446	VIX	120	1787240640	15.740819	15.760430	15.726509	15.746345
44827	SP500	120	1787240040	7678.684843	7680.096585	7677.137764	7677.920457
44702	SP500	120	1787239920	7685.182131	7685.897766	7678.827577	7678.827577
44703	CRUDE	120	1787239920	86.324416	86.390482	86.321161	86.390328
44704	GOLD	120	1787239920	4586.567663	4586.567663	4580.342260	4580.342260
44705	DOW	120	1787239920	53108.333652	53108.333652	53077.082149	53085.827132
44706	VIX	120	1787239920	15.748376	15.748376	15.710000	15.713474
44582	SP500	120	1787239800	7684.842081	7687.735500	7684.212375	7685.131933
44583	CRUDE	120	1787239800	86.331308	86.375460	86.297167	86.324360
44584	GOLD	120	1787239800	4595.572254	4596.400000	4586.394339	4586.688815
44585	DOW	120	1787239800	53121.206174	53139.162888	53104.904278	53106.836590
44586	VIX	120	1787239800	15.729554	15.751766	15.726208	15.748282
44220	DOW	120	1787239440	53085.290817	53114.520550	53084.069371	53107.771649
44221	VIX	120	1787239440	15.709917	15.765668	15.709608	15.765668
44828	CRUDE	120	1787240040	86.387449	86.554627	86.385512	86.554627
44829	GOLD	120	1787240040	4580.427270	4584.331842	4580.127463	4584.331842
44830	DOW	120	1787240040	53085.165624	53085.791431	53056.557819	53064.803898
44831	VIX	120	1787240040	15.713022	15.743143	15.682999	15.743143
44462	SP500	120	1787239680	7683.903737	7686.138923	7683.114191	7684.958425
44463	CRUDE	120	1787239680	86.354244	86.413218	86.315715	86.333365
44464	GOLD	120	1787239680	4593.271089	4595.752359	4592.734674	4595.462482
44465	DOW	120	1787239680	53114.714452	53125.480079	53110.310000	53119.963324
44466	VIX	120	1787239680	15.791776	15.792337	15.708933	15.730486
45317	SP500	120	1787240520	7672.791306	7676.706950	7672.791306	7673.110143
45318	CRUDE	120	1787240520	86.416250	86.645730	86.415106	86.645730
45319	GOLD	120	1787240520	4585.290306	4585.325931	4580.935541	4581.417148
45320	DOW	120	1787240520	53027.417792	53039.552909	53007.452505	53007.570287
45321	VIX	120	1787240520	15.793540	15.795206	15.739941	15.740955
44947	SP500	120	1787240160	7678.105897	7679.420000	7675.774120	7678.616915
44948	CRUDE	120	1787240160	86.556650	86.570000	86.514107	86.528520
44949	GOLD	120	1787240160	4584.342708	4589.700000	4582.600000	4589.564363
44950	DOW	120	1787240160	53063.528373	53066.121363	53043.346613	53063.685496
44951	VIX	120	1787240160	15.743487	15.790000	15.743487	15.786605
45810	DOW	120	1787241000	53023.207157	53024.534348	53002.937944	53021.680170
45811	VIX	120	1787241000	15.811322	15.853197	15.797609	15.852371
45567	SP500	120	1787240760	7672.765849	7673.971215	7671.095173	7672.834098
45568	CRUDE	120	1787240760	86.612767	86.694954	86.606837	86.670868
45569	GOLD	120	1787240760	4580.744829	4580.809044	4576.700000	4579.414825
45570	DOW	120	1787240760	53004.679497	53018.085665	52997.706522	53014.129592
45571	VIX	120	1787240760	15.746625	15.765552	15.729579	15.765552
46176	VIX	120	1787241360	15.900136	15.903192	15.879136	15.891573
45192	SP500	120	1787240400	7673.231164	7675.586763	7672.804275	7673.095956
45193	CRUDE	120	1787240400	86.525922	86.573062	86.406769	86.413887
45927	SP500	120	1787241120	7675.262953	7679.030000	7674.896696	7676.010649
45194	GOLD	120	1787240400	4587.613182	4589.451475	4583.000000	4585.433943
45195	DOW	120	1787240400	53034.514968	53039.380257	53016.954718	53029.302730
45196	VIX	120	1787240400	15.773286	15.807812	15.772887	15.792505
45928	CRUDE	120	1787241120	86.782345	86.849704	86.782345	86.801468
45929	GOLD	120	1787241120	4571.835272	4576.031165	4567.345665	4567.394035
45930	DOW	120	1787241120	53022.045840	53030.080000	53015.982271	53020.873375
45687	SP500	120	1787240880	7672.676040	7675.903850	7672.676040	7675.051672
45688	CRUDE	120	1787240880	86.668771	86.730027	86.666097	86.671240
45689	GOLD	120	1787240880	4579.577920	4580.557648	4574.700000	4576.632472
45931	VIX	120	1787241120	15.851329	15.860354	15.830000	15.855571
45442	SP500	120	1787240640	7672.864514	7674.409873	7671.312098	7672.646788
45443	CRUDE	120	1787240640	86.645766	86.650783	86.567123	86.610829
45444	GOLD	120	1787240640	4581.436293	4581.900000	4579.279231	4580.796129
45445	DOW	120	1787240640	53006.031110	53007.182222	52984.865864	53002.560104
45807	SP500	120	1787241000	7675.312158	7676.600000	7672.406162	7675.481706
45808	CRUDE	120	1787241000	86.672341	86.781993	86.667882	86.780080
45809	GOLD	120	1787241000	4576.797039	4576.851646	4571.753644	4571.992881
45690	DOW	120	1787240880	53012.847215	53024.705782	52998.147281	53023.428106
45691	VIX	120	1787240880	15.765015	15.811965	15.738462	15.811965
46172	SP500	120	1787241360	7678.635047	7679.316142	7676.767726	7677.732286
46173	CRUDE	120	1787241360	86.807100	86.810555	86.704463	86.710317
46174	GOLD	120	1787241360	4573.033613	4575.085130	4569.506346	4575.085130
46175	DOW	120	1787241360	53030.680554	53039.502021	53006.857115	53018.424428
46047	SP500	120	1787241240	7675.969057	7678.592683	7674.964870	7678.398400
46048	CRUDE	120	1787241240	86.801946	86.841774	86.750000	86.805967
46049	GOLD	120	1787241240	4567.537762	4573.219335	4566.586237	4572.902887
46050	DOW	120	1787241240	53019.732510	53034.427795	53005.896242	53032.556680
46051	VIX	120	1787241240	15.855641	15.900950	15.855641	15.898571
46292	SP500	120	1787241480	7677.937837	7678.496149	7674.844480	7677.138589
46293	CRUDE	120	1787241480	86.711832	86.755523	86.624512	86.628938
46294	GOLD	120	1787241480	4575.049341	4577.065166	4574.637563	4575.186267
46295	DOW	120	1787241480	53019.824722	53021.364940	53000.821096	53003.637921
46296	VIX	120	1787241480	15.890158	15.920717	15.878640	15.920336
46417	SP500	120	1787241600	7677.195311	7678.119245	7673.795718	7674.544076
46418	CRUDE	120	1787241600	86.629963	86.674689	86.627294	86.636995
46419	GOLD	120	1787241600	4575.214974	4576.129747	4574.175787	4574.778531
47886	VIX	120	1787243040	15.921258	15.923221	15.881940	15.902966
46542	SP500	120	1787241720	7674.819583	7680.148175	7674.034932	7679.202740
46543	CRUDE	120	1787241720	86.639932	86.686027	86.630541	86.658647
46544	GOLD	120	1787241720	4574.678926	4575.325504	4571.411165	4572.584466
46545	DOW	120	1787241720	52997.536094	53027.579564	52984.937611	53017.883286
46546	VIX	120	1787241720	15.939549	15.955266	15.916707	15.919115
47762	SP500	120	1787242920	7675.317334	7678.039063	7673.749524	7677.721177
47272	SP500	120	1787242440	7674.557871	7674.655686	7672.967143	7674.108497
47273	CRUDE	120	1787242440	86.451944	86.500000	86.427759	86.493490
47274	GOLD	120	1787242440	4579.217767	4579.736600	4575.170630	4575.958763
47275	DOW	120	1787242440	52997.963945	53007.378868	52986.832401	52996.188732
47276	VIX	120	1787242440	15.896039	15.911210	15.873498	15.905456
47763	CRUDE	120	1787242920	86.646851	86.661046	86.611702	86.632692
47517	SP500	120	1787242680	7673.903759	7675.441851	7672.052313	7674.999777
47518	CRUDE	120	1787242680	86.690602	86.732082	86.627840	86.701950
47519	GOLD	120	1787242680	4575.680880	4576.346595	4574.847478	4575.566782
47032	SP500	120	1787242200	7678.306218	7679.223287	7676.102206	7678.397047
46907	SP500	120	1787242080	7674.260343	7679.056711	7673.965288	7678.056055
46908	CRUDE	120	1787242080	86.582848	86.585014	86.492183	86.542948
46909	GOLD	120	1787242080	4577.388019	4579.948976	4577.053785	4577.521013
46910	DOW	120	1787242080	53006.073537	53035.973723	53006.073537	53028.246138
46911	VIX	120	1787242080	15.872008	15.912109	15.872008	15.904314
46782	SP500	120	1787241960	7674.258193	7676.241163	7673.957744	7674.230971
46783	CRUDE	120	1787241960	86.634577	86.636281	86.551204	86.583678
46784	GOLD	120	1787241960	4575.466019	4579.049126	4575.096696	4577.286368
46785	DOW	120	1787241960	53000.725781	53021.427840	52998.393932	53006.288747
46786	VIX	120	1787241960	15.919344	15.930830	15.867032	15.870603
46420	DOW	120	1787241600	53001.703621	53014.370000	52989.199585	52996.232011
46421	VIX	120	1787241600	15.918876	15.941499	15.918142	15.938618
47033	CRUDE	120	1787242200	86.545649	86.547990	86.344342	86.419277
47034	GOLD	120	1787242200	4577.417504	4580.174988	4576.516070	4579.427783
47035	DOW	120	1787242200	53029.291281	53034.890149	53017.833091	53027.551783
47036	VIX	120	1787242200	15.903186	15.912794	15.887863	15.902855
46662	SP500	120	1787241840	7679.382834	7679.382834	7674.311034	7674.311034
46663	CRUDE	120	1787241840	86.655512	86.657731	86.610507	86.634524
46664	GOLD	120	1787241840	4572.716927	4575.766933	4572.716927	4575.285760
46665	DOW	120	1787241840	53017.908819	53024.228655	52999.245592	53000.854773
46666	VIX	120	1787241840	15.918636	15.940127	15.903797	15.918137
47520	DOW	120	1787242680	53004.437475	53012.776109	52996.689019	53002.603049
47521	VIX	120	1787242680	15.890634	15.891864	15.857669	15.881887
47764	GOLD	120	1787242920	4573.349588	4573.349588	4568.600000	4568.671218
47765	DOW	120	1787242920	52999.090345	53017.048601	52982.559229	53010.766634
47152	SP500	120	1787242320	7678.542978	7679.208361	7674.260000	7674.633649
47153	CRUDE	120	1787242320	86.422714	86.536183	86.421540	86.454882
47154	GOLD	120	1787242320	4579.501556	4580.498257	4578.406910	4579.087894
47155	DOW	120	1787242320	53025.691025	53029.350178	52990.034201	52998.572945
47156	VIX	120	1787242320	15.902314	15.904588	15.884677	15.895700
47766	VIX	120	1787242920	15.919599	15.921749	15.906950	15.919869
48008	CRUDE	120	1787243160	86.563155	86.634075	86.516603	86.608356
48009	GOLD	120	1787243160	4564.643247	4566.972014	4564.430112	4566.420776
48010	DOW	120	1787243160	53011.592686	53016.120168	53001.009530	53002.999355
48011	VIX	120	1787243160	15.902816	15.904564	15.864524	15.882941
47642	SP500	120	1787242800	7675.102137	7675.419667	7672.409267	7675.174128
47397	SP500	120	1787242560	7674.235236	7675.123464	7672.915550	7674.161491
47398	CRUDE	120	1787242560	86.494799	86.722468	86.494799	86.690430
47399	GOLD	120	1787242560	4576.071320	4576.836972	4575.011804	4575.699615
47400	DOW	120	1787242560	52996.186420	53009.195339	52990.612096	53003.455036
47401	VIX	120	1787242560	15.906956	15.920777	15.889028	15.890165
47643	CRUDE	120	1787242800	86.704095	86.711873	86.633628	86.647251
47644	GOLD	120	1787242800	4575.416244	4576.041165	4573.075440	4573.312243
47645	DOW	120	1787242800	53000.550333	53006.556981	52988.174642	52997.072250
48129	GOLD	120	1787243280	4566.521508	4569.380119	4565.844321	4568.834378
48130	DOW	120	1787243280	53003.833374	53015.880927	52989.146704	53004.229687
48131	VIX	120	1787243280	15.883028	15.924720	15.869636	15.920913
47646	VIX	120	1787242800	15.883365	15.922325	15.883365	15.920569
48007	SP500	120	1787243160	7678.950324	7679.164234	7676.534342	7677.387176
47882	SP500	120	1787243040	7677.572800	7679.092354	7676.305334	7679.092354
47883	CRUDE	120	1787243040	86.635261	86.638206	86.556695	86.564072
47884	GOLD	120	1787243040	4568.622159	4568.812130	4564.800000	4564.801879
47885	DOW	120	1787243040	53012.555951	53024.535366	52998.984052	53012.806654
48253	CRUDE	120	1787243400	86.557692	86.596116	86.536689	86.565589
48254	GOLD	120	1787243400	4568.945146	4568.945146	4566.107715	4567.276093
48255	DOW	120	1787243400	53006.076631	53007.377758	52984.854304	52999.936894
48127	SP500	120	1787243280	7677.205824	7678.052644	7674.989640	7676.494847
48128	CRUDE	120	1787243280	86.606379	86.625387	86.557816	86.558548
48501	VIX	120	1787243640	15.911796	15.922165	15.905774	15.917419
48372	SP500	120	1787243520	7672.802818	7676.399623	7672.157154	7676.399623
48373	CRUDE	120	1787243520	86.562980	86.686330	86.560659	86.686330
48256	VIX	120	1787243400	15.920973	15.933824	15.914887	15.933824
48374	GOLD	120	1787243520	4567.100772	4568.940434	4565.548993	4565.948843
48252	SP500	120	1787243400	7676.214708	7677.224334	7671.724354	7673.042603
48375	DOW	120	1787243520	53001.848763	53022.282733	52996.537391	53022.282733
48376	VIX	120	1787243520	15.932880	15.934689	15.908672	15.911834
48619	GOLD	120	1787243760	4566.627055	4567.210690	4561.846843	4562.133725
48497	SP500	120	1787243640	7676.169705	7680.932943	7675.355549	7678.581192
48498	CRUDE	120	1787243640	86.689752	86.698822	86.608946	86.615877
48499	GOLD	120	1787243640	4565.790646	4569.651028	4565.473195	4566.498258
48500	DOW	120	1787243640	53022.335727	53037.438770	53019.858726	53022.145555
48617	SP500	120	1787243760	7678.795229	7682.165661	7678.795229	7681.425852
48618	CRUDE	120	1787243760	86.613766	86.620434	86.508037	86.513140
49471	VIX	120	1787244600	15.788941	15.790621	15.738707	15.740449
48737	SP500	120	1787243880	7681.689711	7682.815996	7679.979278	7681.962895
48738	CRUDE	120	1787243880	86.514703	86.529587	86.447634	86.447828
48739	GOLD	120	1787243880	4562.056726	4566.161525	4561.738261	4565.838083
48740	DOW	120	1787243880	53047.738937	53057.119886	53039.407570	53047.259047
48741	VIX	120	1787243880	15.914334	15.917388	15.809407	15.812373
50330	DOW	120	1787245440	53036.383684	53047.051761	53030.601191	53047.051761
50331	VIX	120	1787245440	15.641309	15.655514	15.629922	15.629922
49712	SP500	120	1787244840	7681.128639	7681.903919	7679.392283	7680.928592
49713	CRUDE	120	1787244840	86.374521	86.383203	86.336521	86.382780
49714	GOLD	120	1787244840	4564.144642	4566.926675	4564.100000	4566.005543
49715	DOW	120	1787244840	53051.098801	53054.660784	53036.105517	53041.998371
49716	VIX	120	1787244840	15.716850	15.725307	15.669096	15.671684
50202	SP500	120	1787245320	7678.521689	7680.714043	7678.183202	7678.460516
49232	SP500	120	1787244360	7682.541990	7685.104748	7681.647106	7684.251707
49112	SP500	120	1787244240	7681.380536	7685.134236	7681.097944	7682.639020
49113	CRUDE	120	1787244240	86.470346	86.478152	86.394046	86.405670
49114	GOLD	120	1787244240	4563.600456	4567.300729	4563.323681	4567.063223
49115	DOW	120	1787244240	53057.479509	53079.723743	53050.997757	53060.973063
49116	VIX	120	1787244240	15.834179	15.860000	15.816991	15.858060
49233	CRUDE	120	1787244360	86.406493	86.450000	86.399230	86.407120
48987	SP500	120	1787244120	7683.234069	7684.186454	7681.161357	7681.612860
48988	CRUDE	120	1787244120	86.598593	86.603223	86.467827	86.469633
48620	DOW	120	1787243760	53022.875094	53052.033475	53015.896965	53046.491187
48621	VIX	120	1787243760	15.917324	15.923568	15.899595	15.914170
48989	GOLD	120	1787244120	4562.214384	4563.858702	4559.328828	4563.764392
48990	DOW	120	1787244120	53070.063174	53070.900405	53052.980258	53058.047791
48991	VIX	120	1787244120	15.816177	15.834638	15.808050	15.834638
49234	GOLD	120	1787244360	4567.200109	4569.251999	4566.271024	4566.271024
49235	DOW	120	1787244360	53063.043989	53078.671551	53060.189220	53067.973430
49236	VIX	120	1787244360	15.859212	15.864492	15.845811	15.850985
48862	SP500	120	1787244000	7681.735092	7684.871893	7681.309602	7683.150953
48863	CRUDE	120	1787244000	86.447972	86.653153	86.439421	86.599218
48864	GOLD	120	1787244000	4565.820072	4565.820072	4562.172791	4562.321822
48865	DOW	120	1787244000	53048.801440	53079.549473	53038.337828	53069.237137
48866	VIX	120	1787244000	15.811231	15.824200	15.805380	15.817068
50203	CRUDE	120	1787245320	86.182624	86.270000	86.177003	86.247718
50204	GOLD	120	1787245320	4568.004956	4568.965255	4565.592347	4567.067453
50205	DOW	120	1787245320	53038.058681	53050.879019	53034.779949	53036.059457
49957	SP500	120	1787245080	7680.023996	7683.852079	7678.948192	7683.546241
49352	SP500	120	1787244480	7684.116626	7686.041216	7681.738400	7682.964382
49353	CRUDE	120	1787244480	86.407260	86.467067	86.403840	86.409940
49354	GOLD	120	1787244480	4566.386285	4566.393415	4563.900000	4564.563074
49355	DOW	120	1787244480	53068.749851	53075.807546	53059.758360	53073.329673
49356	VIX	120	1787244480	15.851181	15.853981	15.787218	15.787813
49958	CRUDE	120	1787245080	86.359489	86.378993	86.224473	86.227303
49959	GOLD	120	1787245080	4567.697790	4568.700000	4567.125599	4568.531201
49960	DOW	120	1787245080	53039.611617	53061.298141	53033.528644	53059.680438
49961	VIX	120	1787245080	15.671414	15.683854	15.661468	15.668446
50206	VIX	120	1787245320	15.648649	15.652332	15.625651	15.639983
49587	SP500	120	1787244720	7682.352692	7682.647225	7679.360346	7680.927087
49588	CRUDE	120	1787244720	86.369067	86.396293	86.323408	86.376436
49589	GOLD	120	1787244720	4565.900833	4566.452583	4563.548453	4564.318831
49590	DOW	120	1787244720	53076.143227	53078.115122	53050.569400	53050.569400
49591	VIX	120	1787244720	15.741166	15.741166	15.709483	15.718252
49467	SP500	120	1787244600	7683.266123	7684.668275	7681.740000	7682.322121
49468	CRUDE	120	1787244600	86.408214	86.459283	86.363719	86.368158
49469	GOLD	120	1787244600	4564.571091	4566.992640	4563.553645	4565.770689
49470	DOW	120	1787244600	53073.976825	53083.710125	53062.388608	53076.070534
49837	SP500	120	1787244960	7681.173488	7681.268080	7678.839928	7679.798945
49838	CRUDE	120	1787244960	86.381727	86.406343	86.359960	86.360195
49839	GOLD	120	1787244960	4565.828273	4569.110089	4565.414283	4567.670024
49840	DOW	120	1787244960	53041.255781	53055.460096	53036.838037	53039.267476
49841	VIX	120	1787244960	15.671565	15.673895	15.660903	15.672031
50449	GOLD	120	1787245560	4566.554798	4567.700000	4565.542741	4566.643004
50696	VIX	120	1787245800	15.639511	15.646225	15.628314	15.640137
50450	DOW	120	1787245560	53045.447553	53049.731194	53008.299781	53022.412806
50327	SP500	120	1787245440	7678.322958	7679.641953	7676.630827	7679.010288
50082	SP500	120	1787245200	7683.808253	7684.272217	7678.188357	7678.379346
50083	CRUDE	120	1787245200	86.226964	86.231842	86.170771	86.180060
50084	GOLD	120	1787245200	4568.678603	4570.057772	4567.673766	4567.899286
50085	DOW	120	1787245200	53059.436921	53059.436921	53035.272177	53037.218762
50086	VIX	120	1787245200	15.666925	15.670000	15.645418	15.649766
50567	SP500	120	1787245680	7677.353679	7677.586640	7673.694803	7675.323981
50568	CRUDE	120	1787245680	86.098448	86.159712	86.090000	86.099129
50447	SP500	120	1787245560	7678.947120	7679.231044	7674.782002	7677.618721
50328	CRUDE	120	1787245440	86.248814	86.255963	86.148534	86.158220
50329	GOLD	120	1787245440	4567.226807	4567.372733	4565.166176	4566.547623
50451	VIX	120	1787245560	15.630783	15.670840	15.630783	15.668861
50448	CRUDE	120	1787245560	86.157239	86.190741	86.044697	86.095788
50569	GOLD	120	1787245680	4566.629293	4567.274793	4564.589607	4566.122519
50570	DOW	120	1787245680	53022.946603	53029.971854	53009.898371	53017.723222
50571	VIX	120	1787245680	15.670112	15.671189	15.636734	15.640770
50692	SP500	120	1787245800	7675.467359	7676.757412	7674.117254	7676.449697
50693	CRUDE	120	1787245800	86.101918	86.105357	86.007916	86.010625
50694	GOLD	120	1787245800	4566.221554	4568.800000	4565.858396	4568.508127
50695	DOW	120	1787245800	53018.977442	53030.364992	53010.376906	53022.527494
50812	SP500	120	1787245920	7676.392748	7676.974303	7674.908722	7676.231266
50813	CRUDE	120	1787245920	86.008500	86.019734	85.891066	86.013180
50814	GOLD	120	1787245920	4568.561461	4569.843298	4566.897759	4567.252717
51800	DOW	120	1787246880	52956.166476	52957.746754	52944.423270	52949.475355
50937	SP500	120	1787246040	7676.322220	7676.774668	7671.753205	7672.933277
50938	CRUDE	120	1787246040	86.011819	86.095846	86.005963	86.053929
50939	GOLD	120	1787246040	4567.392996	4568.964864	4567.099453	4567.858720
50940	DOW	120	1787246040	53018.596155	53018.596155	52992.890890	52992.890890
50941	VIX	120	1787246040	15.598275	15.605945	15.564849	15.581546
51801	VIX	120	1787246880	15.696682	15.724311	15.695359	15.716283
52157	SP500	120	1787247240	7665.534048	7666.109367	7663.545884	7665.683818
51672	SP500	120	1787246760	7668.177937	7669.477095	7665.659031	7665.880842
51673	CRUDE	120	1787246760	86.347657	86.347657	86.253154	86.296926
51674	GOLD	120	1787246760	4564.427848	4567.758503	4564.325351	4567.704713
51675	DOW	120	1787246760	52957.319050	52969.182670	52948.790628	52955.149896
51676	VIX	120	1787246760	15.703090	15.705314	15.695834	15.697664
51427	SP500	120	1787246520	7668.188002	7671.325458	7668.188002	7670.500987
51307	SP500	120	1787246400	7667.588937	7669.918485	7666.660000	7668.093777
51308	CRUDE	120	1787246400	86.235987	86.367881	86.211292	86.315943
51309	GOLD	120	1787246400	4566.488411	4567.124102	4563.675566	4565.270844
51310	DOW	120	1787246400	52966.373024	52979.188288	52961.572062	52971.384776
51311	VIX	120	1787246400	15.619306	15.662939	15.618060	15.662939
51428	CRUDE	120	1787246520	86.315625	86.330000	86.260965	86.320592
51182	SP500	120	1787246280	7668.705984	7670.446037	7667.402642	7667.402642
51183	CRUDE	120	1787246280	86.228357	86.275757	86.221440	86.238676
51184	GOLD	120	1787246280	4567.289246	4567.549507	4563.986185	4566.472147
51185	DOW	120	1787246280	52971.011591	52982.234993	52965.927226	52965.927226
51186	VIX	120	1787246280	15.613145	15.631771	15.613145	15.620508
50815	DOW	120	1787245920	53020.602830	53027.642784	53013.765008	53016.889900
50816	VIX	120	1787245920	15.640760	15.642161	15.587361	15.598738
51429	GOLD	120	1787246520	4565.230666	4565.971079	4564.588137	4565.939122
51430	DOW	120	1787246520	52970.205268	52984.140074	52965.830389	52967.369496
51431	VIX	120	1787246520	15.664423	15.680769	15.658562	15.677662
51057	SP500	120	1787246160	7672.915256	7673.644096	7668.379178	7668.663261
51058	CRUDE	120	1787246160	86.054702	86.230907	86.048509	86.230907
51059	GOLD	120	1787246160	4567.972136	4568.280608	4565.870446	4567.190299
51060	DOW	120	1787246160	52994.995362	53000.694948	52970.891886	52970.891886
51061	VIX	120	1787246160	15.582015	15.612331	15.579058	15.612331
51917	SP500	120	1787247000	7666.208600	7668.654126	7665.117372	7666.619880
51918	CRUDE	120	1787247000	86.461478	86.477337	86.424215	86.451917
51919	GOLD	120	1787247000	4565.484402	4568.737004	4564.925751	4567.934191
51920	DOW	120	1787247000	52950.919141	52963.394505	52944.124068	52956.464190
51921	VIX	120	1787247000	15.716741	15.790845	15.716070	15.790464
52158	CRUDE	120	1787247240	86.387467	86.432702	86.369376	86.432702
52159	GOLD	120	1787247240	4569.002243	4569.403385	4566.605674	4567.736215
52160	DOW	120	1787247240	52943.879040	52951.417787	52927.984298	52938.203324
51547	SP500	120	1787246640	7670.273624	7671.106291	7668.015939	7668.153209
51548	CRUDE	120	1787246640	86.318357	86.380000	86.307489	86.349330
51549	GOLD	120	1787246640	4566.013588	4566.900000	4564.394597	4564.551496
51550	DOW	120	1787246640	52968.610785	52976.735470	52956.344683	52956.877746
51551	VIX	120	1787246640	15.678374	15.702139	15.665408	15.702139
52161	VIX	120	1787247240	15.791599	15.843370	15.784755	15.830324
52530	DOW	120	1787247600	52919.920203	52924.773211	52903.316903	52907.020925
52531	VIX	120	1787247600	15.801934	15.826320	15.793607	15.819723
52402	SP500	120	1787247480	7663.220493	7664.460710	7662.118989	7663.806742
52403	CRUDE	120	1787247480	86.478707	86.516779	86.467257	86.468970
52404	GOLD	120	1787247480	4566.348556	4572.606620	4565.995846	4569.917955
52405	DOW	120	1787247480	52908.426216	52923.672439	52904.974278	52919.872243
52406	VIX	120	1787247480	15.792314	15.802617	15.784532	15.802315
52037	SP500	120	1787247120	7666.752145	7668.965997	7665.030317	7665.390720
52038	CRUDE	120	1787247120	86.455371	86.455371	86.356707	86.388366
51797	SP500	120	1787246880	7665.650037	7667.567223	7665.463129	7666.378221
51798	CRUDE	120	1787246880	86.295356	86.463566	86.293955	86.463566
51799	GOLD	120	1787246880	4567.793358	4568.238347	4564.808620	4565.321981
52039	GOLD	120	1787247120	4567.826155	4570.134317	4567.238520	4568.846881
52040	DOW	120	1787247120	52954.729142	52954.729142	52933.862504	52943.413995
52041	VIX	120	1787247120	15.788904	15.813411	15.784748	15.791949
52277	SP500	120	1787247360	7665.564491	7665.589980	7662.691069	7663.102282
52278	CRUDE	120	1787247360	86.432891	86.480000	86.426328	86.476227
52649	GOLD	120	1787247720	4572.619076	4574.358801	4572.381270	4572.850306
52771	VIX	120	1787247840	15.852432	15.853620	15.839046	15.849748
52279	GOLD	120	1787247360	4567.627918	4569.854389	4566.200000	4566.406847
52280	DOW	120	1787247360	52937.926587	52944.610858	52906.410316	52910.507473
52281	VIX	120	1787247360	15.831561	15.838730	15.786833	15.791178
52650	DOW	120	1787247720	52905.447202	52918.331475	52897.591699	52912.000688
52527	SP500	120	1787247600	7663.816266	7664.704459	7661.198838	7661.395801
52891	VIX	120	1787247960	15.850492	15.852636	15.834515	15.838847
52767	SP500	120	1787247840	7661.862255	7664.772741	7661.338333	7664.772741
52647	SP500	120	1787247720	7661.383185	7662.949050	7660.277507	7661.931045
52528	CRUDE	120	1787247600	86.469671	86.580345	86.464791	86.523903
52529	GOLD	120	1787247600	4570.072768	4572.820564	4567.386705	4572.695301
52651	VIX	120	1787247720	15.819351	15.852455	15.813895	15.850907
52648	CRUDE	120	1787247720	86.520627	86.557056	86.506697	86.549963
52768	CRUDE	120	1787247840	86.552755	86.700469	86.537062	86.699516
52769	GOLD	120	1787247840	4572.763467	4575.449729	4572.753406	4573.655963
52770	DOW	120	1787247840	52912.079262	52916.704487	52897.855223	52916.704487
52887	SP500	120	1787247960	7664.903506	7665.553363	7663.761519	7665.525518
52888	CRUDE	120	1787247960	86.700788	86.702844	86.616072	86.616072
52889	GOLD	120	1787247960	4573.611175	4574.205292	4572.651065	4573.224792
52890	DOW	120	1787247960	52917.952848	52926.731394	52911.856542	52916.983641
53007	SP500	120	1787248080	7665.428619	7666.997015	7665.141839	7665.700028
53008	CRUDE	120	1787248080	86.613239	86.660000	86.578177	86.656261
53009	GOLD	120	1787248080	4573.275710	4574.899496	4572.686208	4573.681180
54490	DOW	120	1787249520	52858.277426	52868.636261	52853.360000	52855.631494
53997	SP500	120	1787249040	7658.836283	7660.120776	7656.940000	7657.170064
53998	CRUDE	120	1787249040	86.577115	86.591841	86.526257	86.557276
53999	GOLD	120	1787249040	4574.074578	4575.400000	4574.031800	4574.657458
54000	DOW	120	1787249040	52882.968283	52894.721847	52868.503610	52871.444053
54001	VIX	120	1787249040	15.820822	15.827439	15.787339	15.789438
53132	SP500	120	1787248200	7665.844364	7668.657795	7665.031832	7667.998677
53133	CRUDE	120	1787248200	86.657194	86.680794	86.595500	86.680353
53134	GOLD	120	1787248200	4573.720994	4574.955091	4573.073790	4573.592952
53135	DOW	120	1787248200	52918.419046	52927.777869	52907.566086	52923.853842
53136	VIX	120	1787248200	15.849176	15.872564	15.836957	15.872147
54491	VIX	120	1787249520	15.800185	15.804888	15.787402	15.787402
53872	SP500	120	1787248920	7660.529165	7661.368754	7658.353573	7658.787610
53873	CRUDE	120	1787248920	86.657813	86.664054	86.576090	86.577927
53874	GOLD	120	1787248920	4575.176727	4575.847983	4573.915567	4574.135847
53875	DOW	120	1787248920	52897.131827	52899.714704	52878.946034	52884.122296
53876	VIX	120	1787248920	15.859163	15.865727	15.814895	15.821915
53627	SP500	120	1787248680	7665.999951	7667.243586	7663.184264	7663.987060
53502	SP500	120	1787248560	7666.165733	7667.117899	7664.353472	7666.198807
53503	CRUDE	120	1787248560	86.656236	86.685383	86.621032	86.659666
53504	GOLD	120	1787248560	4575.240488	4576.782510	4574.282126	4575.706846
53505	DOW	120	1787248560	52906.058394	52917.111185	52902.977912	52912.066684
53506	VIX	120	1787248560	15.895621	15.920000	15.883980	15.912925
53377	SP500	120	1787248440	7667.214690	7667.640395	7664.593362	7665.918371
53378	CRUDE	120	1787248440	86.614466	86.659586	86.593183	86.659586
53379	GOLD	120	1787248440	4574.356987	4575.210513	4573.538669	4575.171565
53380	DOW	120	1787248440	52924.744874	52926.902428	52904.047078	52905.414953
53381	VIX	120	1787248440	15.888009	15.894224	15.868844	15.894224
53010	DOW	120	1787248080	52917.541736	52931.720206	52911.768410	52918.702560
53011	VIX	120	1787248080	15.839383	15.855269	15.838600	15.850159
53628	CRUDE	120	1787248680	86.658205	86.715644	86.653599	86.705869
53629	GOLD	120	1787248680	4575.770840	4576.681078	4575.293698	4575.739108
53630	DOW	120	1787248680	52913.196572	52926.099971	52907.570000	52910.008466
53631	VIX	120	1787248680	15.912925	15.915192	15.897464	15.897464
53257	SP500	120	1787248320	7668.209280	7668.578444	7665.420620	7667.029722
53258	CRUDE	120	1787248320	86.681484	86.709236	86.614697	86.614697
53259	GOLD	120	1787248320	4573.585471	4574.620573	4573.032372	4574.424049
53260	DOW	120	1787248320	52923.632154	52928.087709	52911.089209	52923.089108
53261	VIX	120	1787248320	15.870741	15.900000	15.863566	15.889464
54242	SP500	120	1787249280	7656.145520	7656.781199	7653.678613	7656.117558
54243	CRUDE	120	1787249280	86.603238	86.609706	86.498666	86.554559
54244	GOLD	120	1787249280	4576.097134	4577.139419	4575.341166	4575.720386
54245	DOW	120	1787249280	52864.465970	52882.110586	52855.100132	52868.482385
54246	VIX	120	1787249280	15.788060	15.807424	15.787446	15.798377
54117	SP500	120	1787249160	7657.209085	7657.791542	7655.295788	7655.943397
54118	CRUDE	120	1787249160	86.553910	86.600192	86.545868	86.600192
54119	GOLD	120	1787249160	4574.587061	4576.619372	4574.309263	4576.191974
54120	DOW	120	1787249160	52871.150864	52875.233686	52858.821677	52866.028162
54121	VIX	120	1787249160	15.787973	15.800055	15.776895	15.789469
53747	SP500	120	1787248800	7664.019205	7664.254663	7660.761147	7660.778411
53748	CRUDE	120	1787248800	86.702788	86.726115	86.610726	86.658600
53749	GOLD	120	1787248800	4575.847252	4576.876123	4575.027809	4575.027809
53750	DOW	120	1787248800	52910.996689	52912.902424	52889.135884	52895.564479
53751	VIX	120	1787248800	15.896655	15.903892	15.857612	15.857612
54986	VIX	120	1787250000	15.899414	15.946616	15.893989	15.929376
55229	GOLD	120	1787250240	4567.072622	4568.434169	4566.771540	4567.906987
54367	SP500	120	1787249400	7656.223357	7656.939016	7651.404800	7653.416997
54368	CRUDE	120	1787249400	86.556352	86.556352	86.450000	86.504700
54369	GOLD	120	1787249400	4575.712980	4577.300000	4574.639076	4576.262408
54370	DOW	120	1787249400	52870.330527	52871.936975	52839.839495	52857.079181
54371	VIX	120	1787249400	15.798374	15.814949	15.791122	15.799507
54982	SP500	120	1787250000	7655.457297	7657.816955	7654.740074	7655.275405
54983	CRUDE	120	1787250000	86.448780	86.472683	86.410186	86.432089
54732	SP500	120	1787249760	7652.005689	7653.237521	7648.605680	7651.080134
54607	SP500	120	1787249640	7653.743423	7655.088797	7651.580616	7651.912121
54608	CRUDE	120	1787249640	86.466610	86.561465	86.466610	86.538564
54609	GOLD	120	1787249640	4578.898156	4579.380455	4576.926263	4577.011568
54610	DOW	120	1787249640	52857.277667	52863.431494	52841.423020	52846.648611
54611	VIX	120	1787249640	15.785948	15.860000	15.779018	15.858687
54733	CRUDE	120	1787249760	86.541895	86.551185	86.390000	86.393159
54734	GOLD	120	1787249760	4577.046863	4577.881317	4573.348826	4573.596382
54735	DOW	120	1787249760	52848.638219	52849.751166	52828.833466	52837.008462
54736	VIX	120	1787249760	15.857224	15.872689	15.846090	15.872689
54487	SP500	120	1787249520	7653.647345	7655.757285	7652.031801	7653.818090
54488	CRUDE	120	1787249520	86.505386	86.560000	86.459236	86.465478
54489	GOLD	120	1787249520	4576.298039	4578.858918	4575.866734	4578.858918
54984	GOLD	120	1787250000	4572.922379	4572.922379	4569.650272	4569.896510
54985	DOW	120	1787250000	52846.813450	52863.103477	52840.827433	52855.168442
54857	SP500	120	1787249880	7650.968697	7655.357156	7650.968697	7655.357156
54858	CRUDE	120	1787249880	86.395657	86.447564	86.371396	86.447564
54859	GOLD	120	1787249880	4573.677204	4573.943664	4572.488562	4572.844760
54860	DOW	120	1787249880	52838.820113	52850.820000	52838.224576	52846.848939
54861	VIX	120	1787249880	15.871836	15.914311	15.870133	15.900786
55102	SP500	120	1787250120	7655.062245	7657.335911	7654.211026	7655.716733
55103	CRUDE	120	1787250120	86.428706	86.532745	86.424943	86.532745
55104	GOLD	120	1787250120	4569.814889	4570.824609	4566.283275	4566.904746
55105	DOW	120	1787250120	52855.055325	52873.778807	52851.643304	52862.329137
55106	VIX	120	1787250120	15.930512	15.981396	15.930512	15.979241
55227	SP500	120	1787250240	7655.853756	7656.710892	7653.065170	7653.482390
55228	CRUDE	120	1787250240	86.535750	86.540892	86.416404	86.481192
55348	CRUDE	120	1787250360	86.481263	86.482813	86.374314	86.392945
55349	GOLD	120	1787250360	4567.744751	4568.416417	4565.024142	4566.864168
55350	DOW	120	1787250360	52847.808249	52856.599818	52838.612178	52842.645905
55351	VIX	120	1787250360	16.011090	16.023455	15.969775	15.969775
56706	VIX	120	1787251680	16.010434	16.041662	16.004099	16.037362
56217	SP500	120	1787251200	7652.643961	7653.201103	7650.291378	7651.885665
56218	CRUDE	120	1787251200	86.944938	86.952276	86.870000	86.919781
56219	GOLD	120	1787251200	4576.096127	4577.801050	4574.764756	4576.644654
56220	DOW	120	1787251200	52837.508914	52838.784769	52819.726235	52826.372418
56221	VIX	120	1787251200	15.952656	16.003677	15.951583	16.001163
56092	SP500	120	1787251080	7653.149682	7654.350631	7652.185416	7652.502942
56093	CRUDE	120	1787251080	86.704268	86.950076	86.698410	86.947142
56094	GOLD	120	1787251080	4575.655603	4577.271063	4574.294986	4575.967006
56095	DOW	120	1787251080	52836.382885	52848.025522	52831.625646	52836.385823
56096	VIX	120	1787251080	15.952983	15.957811	15.944916	15.951606
55717	SP500	120	1787250720	7653.871689	7653.934037	7651.118477	7651.118477
55718	CRUDE	120	1787250720	86.478358	86.524682	86.414898	86.466204
55719	GOLD	120	1787250720	4572.853930	4574.561104	4572.064616	4572.069820
55720	DOW	120	1787250720	52827.522872	52839.304269	52820.956335	52825.631085
55721	VIX	120	1787250720	16.033254	16.054464	16.020000	16.020881
55592	SP500	120	1787250600	7653.853741	7655.276371	7652.083975	7653.734476
55593	CRUDE	120	1787250600	86.481820	86.551247	86.471252	86.477077
55594	GOLD	120	1787250600	4572.246339	4572.926250	4570.934315	4572.807478
55595	DOW	120	1787250600	52842.753511	52845.600835	52829.537055	52829.537055
55596	VIX	120	1787250600	16.000336	16.034199	15.988989	16.031708
55230	DOW	120	1787250240	52861.473693	52871.597980	52835.145224	52849.036963
55231	VIX	120	1787250240	15.979318	16.010687	15.965716	16.010077
55842	SP500	120	1787250840	7651.015618	7652.821158	7649.805662	7652.085823
55467	SP500	120	1787250480	7652.793492	7655.450016	7652.394994	7653.578675
55468	CRUDE	120	1787250480	86.395604	86.501925	86.381449	86.482714
55469	GOLD	120	1787250480	4566.768595	4572.320784	4565.600000	4572.153745
55470	DOW	120	1787250480	52842.627142	52851.062546	52836.026927	52841.132708
55471	VIX	120	1787250480	15.969002	16.007362	15.969002	15.999781
55843	CRUDE	120	1787250840	86.467891	86.562039	86.418593	86.562039
55844	GOLD	120	1787250840	4571.896849	4574.464274	4571.365079	4574.307405
55845	DOW	120	1787250840	52825.563435	52838.530692	52815.019889	52836.838959
55846	VIX	120	1787250840	16.019450	16.024417	15.969965	15.969965
56823	CRUDE	120	1787251800	86.907183	86.909798	86.861696	86.896990
56337	SP500	120	1787251320	7652.072350	7654.131684	7650.121187	7653.295386
56338	CRUDE	120	1787251320	86.919719	86.948942	86.776828	86.799862
56339	GOLD	120	1787251320	4576.809004	4577.922649	4576.200000	4576.229322
56340	DOW	120	1787251320	52824.697753	52846.994228	52824.697753	52843.261344
56341	VIX	120	1787251320	16.001074	16.015094	15.990000	15.992292
55347	SP500	120	1787250360	7653.521317	7655.195315	7652.508233	7653.043743
56577	SP500	120	1787251560	7652.962789	7654.699257	7651.627120	7653.785505
55967	SP500	120	1787250960	7652.039906	7655.019064	7650.230551	7653.414942
55968	CRUDE	120	1787250960	86.561828	86.710000	86.542267	86.704941
55969	GOLD	120	1787250960	4574.352328	4575.971846	4574.216913	4575.654335
55970	DOW	120	1787250960	52838.749361	52850.009101	52830.800000	52838.066866
55971	VIX	120	1787250960	15.970031	15.973237	15.940000	15.951998
56578	CRUDE	120	1787251560	86.839413	86.961156	86.839413	86.909112
56579	GOLD	120	1787251560	4575.585463	4579.544849	4575.585463	4578.886079
56580	DOW	120	1787251560	52831.858073	52842.294948	52825.503142	52828.936101
56581	VIX	120	1787251560	15.998933	16.010000	15.988538	16.009439
56824	GOLD	120	1787251800	4577.153627	4577.889770	4576.227030	4577.304279
56825	DOW	120	1787251800	52847.405670	52855.736064	52832.442759	52841.212955
56826	VIX	120	1787251800	16.038339	16.050300	16.028710	16.028710
57191	VIX	120	1787252160	16.060354	16.077685	16.058124	16.061402
56457	SP500	120	1787251440	7653.085050	7654.655385	7652.786784	7653.016480
57187	SP500	120	1787252160	7654.362017	7655.877291	7652.196553	7654.102518
57188	CRUDE	120	1787252160	86.921209	86.961663	86.918444	86.936519
56942	SP500	120	1787251920	7655.180680	7655.709367	7653.278532	7654.082966
56943	CRUDE	120	1787251920	86.898130	86.938381	86.886776	86.921486
56458	CRUDE	120	1787251440	86.797841	86.836520	86.748241	86.836520
56459	GOLD	120	1787251440	4576.387485	4576.901410	4574.932120	4575.692059
56460	DOW	120	1787251440	52843.548817	52843.548817	52828.692417	52832.407777
56461	VIX	120	1787251440	15.993437	16.005548	15.983848	16.000085
56822	SP500	120	1787251800	7656.086137	7656.388645	7653.740755	7655.306838
56702	SP500	120	1787251680	7653.980060	7656.757732	7653.690176	7655.851439
56703	CRUDE	120	1787251680	86.909034	86.915415	86.817964	86.906737
56704	GOLD	120	1787251680	4578.709571	4579.321656	4576.755945	4577.332454
56705	DOW	120	1787251680	52827.280281	52852.607509	52824.406697	52845.827755
56944	GOLD	120	1787251920	4577.298024	4578.018324	4576.500000	4576.732004
56945	DOW	120	1787251920	52842.474166	52846.408919	52824.734301	52827.536727
56946	VIX	120	1787251920	16.028230	16.034460	16.016462	16.021404
57189	GOLD	120	1787252160	4575.782606	4576.149051	4573.594684	4575.205771
57190	DOW	120	1787252160	52828.709936	52839.496552	52813.369280	52823.912799
57062	SP500	120	1787252040	7653.798911	7655.440786	7652.882583	7654.198347
57063	CRUDE	120	1787252040	86.922289	86.930000	86.866198	86.924477
57064	GOLD	120	1787252040	4576.571890	4578.438484	4575.322243	4575.939741
57065	DOW	120	1787252040	52826.939642	52837.461125	52820.906569	52829.431701
57066	VIX	120	1787252040	16.022938	16.065281	16.012807	16.061059
57307	SP500	120	1787252280	7654.222982	7654.222982	7651.293402	7651.433715
57308	CRUDE	120	1787252280	86.936793	86.952175	86.869696	86.922965
57309	GOLD	120	1787252280	4575.032797	4577.553751	4574.678851	4577.553751
57310	DOW	120	1787252280	52825.210377	52829.944383	52800.308870	52806.263187
57311	VIX	120	1787252280	16.060691	16.062837	16.045283	16.049883
57432	SP500	120	1787252400	7651.535130	7652.520482	7649.310461	7650.803056
57433	CRUDE	120	1787252400	86.925139	86.949251	86.891857	86.922484
57434	GOLD	120	1787252400	4577.643255	4580.859757	4577.479410	4580.851401
58665	DOW	120	1787253600	52830.617777	52841.869277	52825.383064	52832.252498
58417	SP500	120	1787253360	7655.629478	7656.608460	7652.224521	7653.076468
58418	CRUDE	120	1787253360	86.770109	86.817108	86.766200	86.797714
58419	GOLD	120	1787253360	4578.513065	4580.671723	4578.298448	4580.623675
58420	DOW	120	1787253360	52846.916883	52850.980935	52824.848263	52837.526718
58421	VIX	120	1787253360	16.129689	16.142418	16.106608	16.130545
57557	SP500	120	1787252520	7650.766296	7652.608089	7649.783123	7651.490654
57558	CRUDE	120	1787252520	86.922787	86.925956	86.847110	86.881881
57559	GOLD	120	1787252520	4580.874617	4581.706543	4579.515098	4580.525391
57560	DOW	120	1787252520	52790.314809	52805.386044	52784.087759	52794.480377
57561	VIX	120	1787252520	16.060294	16.062121	16.008077	16.008077
58292	SP500	120	1787253240	7653.479888	7656.167853	7652.618656	7655.778507
58293	CRUDE	120	1787253240	86.825036	86.825686	86.752133	86.767667
58294	GOLD	120	1787253240	4577.937844	4578.762746	4576.766665	4578.386329
58295	DOW	120	1787253240	52822.925146	52852.780498	52819.171308	52846.858245
58296	VIX	120	1787253240	16.079360	16.135206	16.077595	16.130538
57922	SP500	120	1787252880	7654.195359	7656.623468	7653.616774	7654.697065
57923	CRUDE	120	1787252880	86.885396	86.890104	86.812971	86.855084
57924	GOLD	120	1787252880	4580.159318	4580.425996	4577.350312	4579.091095
57925	DOW	120	1787252880	52819.989247	52829.595697	52814.301466	52825.258712
57926	VIX	120	1787252880	16.023375	16.023375	16.006532	16.019046
57802	SP500	120	1787252760	7653.282661	7655.399938	7653.258700	7654.472127
57803	CRUDE	120	1787252760	86.895441	86.903368	86.845343	86.886677
57804	GOLD	120	1787252760	4579.717587	4581.280124	4579.717587	4580.023823
57805	DOW	120	1787252760	52814.843610	52829.269611	52809.426081	52819.235793
57806	VIX	120	1787252760	16.013123	16.021938	16.006006	16.021938
57435	DOW	120	1787252400	52804.372373	52808.849850	52787.439611	52788.348296
57436	VIX	120	1787252400	16.050656	16.060941	16.046479	16.060537
58042	SP500	120	1787253000	7654.740889	7655.436491	7651.440641	7652.997654
58043	CRUDE	120	1787253000	86.852122	86.857115	86.808571	86.817716
58044	GOLD	120	1787253000	4578.968798	4578.968798	4575.433838	4577.731066
58045	DOW	120	1787253000	52824.573794	52826.075587	52811.161956	52825.751486
58046	VIX	120	1787253000	16.017925	16.025315	16.002087	16.019137
57682	SP500	120	1787252640	7651.420396	7653.529881	7650.100497	7653.371181
57683	CRUDE	120	1787252640	86.882239	86.913292	86.851816	86.894167
57684	GOLD	120	1787252640	4580.538094	4581.731262	4579.896742	4579.896742
57685	DOW	120	1787252640	52793.745846	52830.252796	52787.933558	52815.607254
57686	VIX	120	1787252640	16.006893	16.016538	16.004257	16.011698
58666	VIX	120	1787253600	16.121217	16.132322	16.094286	16.101443
58542	SP500	120	1787253480	7653.097118	7654.262802	7651.472339	7651.494570
58543	CRUDE	120	1787253480	86.797231	86.804023	86.760000	86.760034
58544	GOLD	120	1787253480	4580.648217	4582.881242	4580.358393	4582.881242
58545	DOW	120	1787253480	52837.662109	52851.243398	52826.879589	52828.691288
58546	VIX	120	1787253480	16.130127	16.131196	16.102982	16.119841
58167	SP500	120	1787253120	7653.197487	7654.503299	7651.491178	7653.443881
58168	CRUDE	120	1787253120	86.817195	86.869881	86.792043	86.827178
58169	GOLD	120	1787253120	4577.693670	4579.125982	4576.904823	4578.061895
58170	DOW	120	1787253120	52825.688555	52832.937929	52814.118906	52824.800479
58171	VIX	120	1787253120	16.019470	16.080000	16.012732	16.079707
58910	DOW	120	1787253840	52838.364091	52853.271001	52832.792441	52838.037079
58911	VIX	120	1787253840	16.089353	16.113317	16.085510	16.111240
58787	SP500	120	1787253720	7651.886701	7654.974585	7651.675891	7653.980000
58788	CRUDE	120	1787253720	86.680992	86.780755	86.668843	86.760000
58789	GOLD	120	1787253720	4581.462964	4584.390423	4581.209895	4584.200000
58790	DOW	120	1787253720	52834.317596	52851.532784	52831.268369	52840.030000
58791	VIX	120	1787253720	16.101790	16.105514	16.088154	16.090000
59286	VIX	120	1787254200	16.099147	16.104330	16.049687	16.049880
59406	VIX	120	1787254320	16.050905	16.095923	16.050133	16.090347
59282	SP500	120	1787254200	7653.181281	7654.437907	7650.514381	7651.132485
59283	CRUDE	120	1787254200	86.760582	86.760582	86.706006	86.738959
59157	SP500	120	1787254080	7654.684551	7655.693294	7652.071681	7652.891178
59032	SP500	120	1787253960	7655.367564	7656.001644	7653.657583	7654.953418
59033	CRUDE	120	1787253960	86.759565	86.775785	86.720193	86.734543
59034	GOLD	120	1787253960	4584.996444	4586.664552	4584.199371	4584.731850
59035	DOW	120	1787253960	52838.801984	52839.238354	52823.116844	52830.697975
59036	VIX	120	1787253960	16.110146	16.125213	16.105297	16.119840
58662	SP500	120	1787253600	7651.633500	7652.108418	7649.849640	7651.636286
58663	CRUDE	120	1787253600	86.761730	86.771355	86.675156	86.679596
58664	GOLD	120	1787253600	4582.834571	4583.047470	4580.966929	4581.435145
59158	CRUDE	120	1787254080	86.733071	86.760000	86.692467	86.757391
59159	GOLD	120	1787254080	4584.729843	4584.860059	4582.200000	4582.408956
59160	DOW	120	1787254080	52829.883702	52833.405300	52817.081838	52818.747946
59161	VIX	120	1787254080	16.119404	16.125556	16.087843	16.099818
58907	SP500	120	1787253840	7653.922524	7655.775080	7653.405360	7655.169922
58908	CRUDE	120	1787253840	86.760183	86.762273	86.684719	86.758576
58909	GOLD	120	1787253840	4584.293167	4585.307308	4583.330051	4584.904791
59284	GOLD	120	1787254200	4582.258084	4583.154096	4580.329410	4581.986029
59285	DOW	120	1787254200	52817.233943	52834.463697	52808.683755	52816.334093
59526	VIX	120	1787254440	16.091868	16.124434	16.083067	16.120753
59402	SP500	120	1787254320	7650.828404	7653.319036	7650.376815	7650.853144
59403	CRUDE	120	1787254320	86.736557	86.755668	86.678413	86.721141
59404	GOLD	120	1787254320	4581.884323	4584.491865	4580.488226	4583.889667
59405	DOW	120	1787254320	52817.985831	52818.995317	52801.589793	52802.918148
59522	SP500	120	1787254440	7650.709270	7651.175768	7649.019065	7649.848018
59523	CRUDE	120	1787254440	86.722707	86.726987	86.686695	86.686695
59524	GOLD	120	1787254440	4583.732907	4584.446747	4583.199048	4583.607798
59525	DOW	120	1787254440	52804.629232	52809.229567	52778.982135	52790.907110
59642	SP500	120	1787254560	7649.915571	7653.486438	7649.117894	7652.230743
59643	CRUDE	120	1787254560	86.687292	86.722633	86.671454	86.691587
59644	GOLD	120	1787254560	4583.679213	4583.988247	4581.200000	4582.179459
60749	GOLD	120	1787255640	4582.978620	4583.956117	4581.794675	4583.062144
60502	SP500	120	1787255400	7652.103687	7652.282898	7649.066760	7651.940167
60503	CRUDE	120	1787255400	86.572690	86.611468	86.555826	86.611468
60504	GOLD	120	1787255400	4584.631076	4584.998057	4583.212221	4583.780657
60505	DOW	120	1787255400	52821.046076	52840.042963	52805.799683	52837.522883
60506	VIX	120	1787255400	16.078586	16.082931	16.028443	16.028443
59767	SP500	120	1787254680	7652.050789	7654.743924	7650.860526	7653.735613
59768	CRUDE	120	1787254680	86.693817	86.708959	86.640203	86.695368
59769	GOLD	120	1787254680	4582.148534	4582.355413	4579.101890	4579.391361
59770	DOW	120	1787254680	52799.686611	52818.817829	52795.812309	52811.294146
59771	VIX	120	1787254680	16.111755	16.115366	16.058371	16.058371
60750	DOW	120	1787255640	52829.873702	52831.103159	52789.090000	52791.029926
60751	VIX	120	1787255640	16.017409	16.023295	15.983346	16.010293
60257	SP500	120	1787255160	7647.567957	7650.100761	7646.322820	7648.596788
60137	SP500	120	1787255040	7649.718424	7650.507149	7647.007975	7647.842978
60138	CRUDE	120	1787255040	86.653288	86.662718	86.602407	86.628725
60139	GOLD	120	1787255040	4579.910914	4580.707551	4579.000773	4580.038982
60140	DOW	120	1787255040	52806.677067	52817.516674	52784.908115	52790.531227
60141	VIX	120	1787255040	16.071120	16.074737	16.054251	16.069250
60258	CRUDE	120	1787255160	86.629626	86.649225	86.608844	86.625854
60017	SP500	120	1787254920	7652.530701	7652.697527	7649.697135	7649.697135
60018	CRUDE	120	1787254920	86.641711	86.673766	86.634303	86.651577
60019	GOLD	120	1787254920	4579.791118	4581.015111	4579.393122	4579.939436
60020	DOW	120	1787254920	52815.265731	52819.205432	52805.867817	52805.867817
60021	VIX	120	1787254920	16.057546	16.073150	16.056304	16.072059
59645	DOW	120	1787254560	52790.068445	52814.339253	52787.289202	52799.399293
59646	VIX	120	1787254560	16.121000	16.136607	16.110000	16.111571
60259	GOLD	120	1787255160	4580.064422	4582.800000	4579.752783	4582.691671
60260	DOW	120	1787255160	52792.065684	52810.274012	52778.908700	52801.668391
60261	VIX	120	1787255160	16.067812	16.081065	16.065382	16.070193
61241	VIX	120	1787256120	16.081467	16.083309	16.038409	16.051511
60987	SP500	120	1787255880	7640.415804	7644.253456	7640.130165	7641.114362
59892	SP500	120	1787254800	7653.629075	7654.585482	7651.710649	7652.325467
59893	CRUDE	120	1787254800	86.698568	86.702670	86.643588	86.643588
59894	GOLD	120	1787254800	4579.312571	4580.200000	4578.835014	4579.621782
59895	DOW	120	1787254800	52810.489055	52822.694214	52810.489055	52814.415932
59896	VIX	120	1787254800	16.057505	16.071395	16.046858	16.058857
60988	CRUDE	120	1787255880	86.641860	86.676591	86.613677	86.663421
60989	GOLD	120	1787255880	4582.141229	4585.887922	4581.909084	4584.784689
60990	DOW	120	1787255880	52762.280175	52797.487063	52754.573851	52770.393209
60991	VIX	120	1787255880	16.041211	16.063125	16.026889	16.059324
60377	SP500	120	1787255280	7648.660234	7652.370000	7647.717600	7652.370000
60378	CRUDE	120	1787255280	86.623487	86.633800	86.570000	86.570000
60379	GOLD	120	1787255280	4582.806625	4586.194809	4582.421861	4584.700000
60380	DOW	120	1787255280	52801.753841	52822.370000	52797.182986	52822.370000
60381	VIX	120	1787255280	16.069796	16.087007	16.066216	16.080000
61357	SP500	120	1787256240	7641.630984	7642.021832	7640.356563	7641.160000
60867	SP500	120	1787255760	7643.001823	7643.076603	7639.327718	7640.690000
60868	CRUDE	120	1787255760	86.626781	86.640000	86.613108	86.640000
60869	GOLD	120	1787255760	4582.926608	4584.250365	4581.300000	4582.100000
60870	DOW	120	1787255760	52792.160317	52793.265710	52761.619149	52762.420000
60871	VIX	120	1787255760	16.011101	16.040000	15.997741	16.040000
61358	CRUDE	120	1787256240	86.603691	86.639796	86.577023	86.600000
60622	SP500	120	1787255520	7652.122924	7653.335161	7650.126112	7651.418491
60747	SP500	120	1787255640	7651.513590	7651.972530	7642.580121	7642.884818
60623	CRUDE	120	1787255520	86.608569	86.652656	86.599614	86.632299
60624	GOLD	120	1787255520	4583.857086	4585.047221	4582.779567	4583.135904
60625	DOW	120	1787255520	52836.919022	52839.734273	52823.048293	52830.390163
60626	VIX	120	1787255520	16.029096	16.031386	16.013374	16.018987
60748	CRUDE	120	1787255640	86.635245	86.644093	86.604382	86.626817
61359	GOLD	120	1787256240	4587.428102	4588.080235	4586.255252	4586.900000
61360	DOW	120	1787256240	52761.372527	52769.650609	52751.808600	52759.210000
61361	VIX	120	1787256240	16.050073	16.050562	16.000000	16.010000
61112	SP500	120	1787256000	7641.311222	7642.479780	7640.830049	7641.502208
61113	CRUDE	120	1787256000	86.663266	86.676176	86.635146	86.647057
61114	GOLD	120	1787256000	4584.860625	4587.358348	4584.651645	4584.894753
61115	DOW	120	1787256000	52770.592022	52770.951764	52757.094786	52763.177028
61116	VIX	120	1787256000	16.059066	16.080901	16.050000	16.080901
61237	SP500	120	1787256120	7641.667443	7642.555582	7640.820427	7641.447549
61238	CRUDE	120	1787256120	86.644247	86.660000	86.588894	86.606824
61239	GOLD	120	1787256120	4584.919088	4587.600000	4583.525241	4587.442540
61240	DOW	120	1787256120	52763.801580	52765.938236	52756.461064	52761.326412
61726	VIX	120	1787256600	15.949625	16.022980	15.949625	16.020000
61597	SP500	120	1787256480	7641.179239	7642.452569	7639.779835	7641.459897
61477	SP500	120	1787256360	7641.341703	7642.138094	7639.773892	7641.160000
61478	CRUDE	120	1787256360	86.599394	86.619053	86.584556	86.610000
61479	GOLD	120	1787256360	4586.872866	4587.250364	4584.130567	4584.300000
61480	DOW	120	1787256360	52759.691247	52763.856543	52748.884638	52759.210000
61481	VIX	120	1787256360	16.008617	16.009179	15.959841	15.960000
61598	CRUDE	120	1787256480	86.606963	86.633768	86.587216	86.601584
61599	GOLD	120	1787256480	4584.157011	4585.056341	4582.745108	4584.416974
61600	DOW	120	1787256480	52760.878245	52766.605298	52749.780120	52760.244157
61601	VIX	120	1787256480	15.958951	15.984047	15.933254	15.950874
61722	SP500	120	1787256600	7641.545042	7643.072676	7640.424338	7641.160000
61723	CRUDE	120	1787256600	86.599599	86.610167	86.526810	86.580000
61724	GOLD	120	1787256600	4584.462077	4585.554901	4582.600000	4582.600000
61725	DOW	120	1787256600	52759.142961	52771.671353	52753.465520	52759.210000
61842	SP500	120	1787256720	7641.250519	7643.166338	7639.888446	7641.333481
61843	CRUDE	120	1787256720	86.577543	86.657885	86.575416	86.653077
61844	GOLD	120	1787256720	4582.578501	4584.006802	4582.157019	4583.981401
62697	SP500	120	1787257560	7641.405349	7642.612038	7639.827735	7641.160000
61967	SP500	120	1787256840	7641.529706	7642.299634	7639.613222	7641.160000
61968	CRUDE	120	1787256840	86.652686	86.653908	86.610000	86.610000
61969	GOLD	120	1787256840	4584.098474	4584.703577	4582.824134	4583.500000
61970	DOW	120	1787256840	52761.827383	52765.169198	52752.227151	52759.210000
61971	VIX	120	1787256840	16.049036	16.051598	15.962584	15.970000
62698	CRUDE	120	1787257560	86.552267	86.553893	86.497127	86.540000
62699	GOLD	120	1787257560	4577.737004	4579.318917	4577.123643	4577.900000
62700	DOW	120	1787257560	52759.283968	52771.936058	52753.226634	52759.210000
62701	VIX	120	1787257560	16.009468	16.015283	15.988703	15.990000
62943	CRUDE	120	1787257800	86.520000	86.531036	86.466710	86.510000
62944	GOLD	120	1787257800	4578.100000	4578.919878	4577.611884	4578.000000
62945	DOW	120	1787257800	52759.210000	52771.383182	52748.678275	52759.210000
62327	SP500	120	1787257200	7641.134392	7642.490476	7640.333995	7641.160000
62328	CRUDE	120	1787257200	86.561293	86.596570	86.516879	86.520000
62329	GOLD	120	1787257200	4579.158794	4580.880782	4578.338805	4580.400000
62330	DOW	120	1787257200	52759.910666	52770.496668	52747.305400	52759.210000
62331	VIX	120	1787257200	15.959732	16.003596	15.958602	16.000000
62207	SP500	120	1787257080	7641.460726	7642.100063	7640.305230	7641.160000
62208	CRUDE	120	1787257080	86.610554	86.650307	86.560000	86.560000
62209	GOLD	120	1787257080	4581.507570	4582.108827	4578.806620	4579.000000
62210	DOW	120	1787257080	52759.321680	52766.505823	52748.175177	52759.210000
62211	VIX	120	1787257080	15.970506	15.977155	15.952377	15.960000
62946	VIX	120	1787257800	16.010000	16.016891	16.001587	16.010000
61845	DOW	120	1787256720	52758.916993	52763.159369	52752.914313	52760.909533
61846	VIX	120	1787256720	16.021590	16.055994	16.005439	16.050144
62452	SP500	120	1787257320	7641.127965	7642.335588	7640.178511	7640.558981
62453	CRUDE	120	1787257320	86.518854	86.550000	86.513369	86.532999
62454	GOLD	120	1787257320	4580.560093	4580.871167	4578.807510	4579.238117
62455	DOW	120	1787257320	52759.159718	52762.653543	52744.836942	52759.586585
62456	VIX	120	1787257320	16.000461	16.023089	15.997824	16.023089
62087	SP500	120	1787256960	7641.177457	7641.863003	7639.615081	7641.262056
62088	CRUDE	120	1787256960	86.610760	86.628542	86.601056	86.610342
62089	GOLD	120	1787256960	4583.489181	4584.327685	4580.965632	4581.622806
62090	DOW	120	1787256960	52757.701715	52767.725518	52750.262142	52760.767459
62091	VIX	120	1787256960	15.971187	15.983416	15.957272	15.969559
63441	VIX	120	1787258280	16.010000	16.014169	16.000437	16.011540
63187	SP500	120	1787258040	7641.239134	7642.147137	7640.117925	7641.160000
63188	CRUDE	120	1787258040	86.600923	86.615480	86.565171	86.580000
63189	GOLD	120	1787258040	4577.620640	4578.538255	4577.051881	4577.300000
62577	SP500	120	1787257440	7641.160000	7642.434794	7639.726535	7641.160000
62578	CRUDE	120	1787257440	86.550000	86.567233	86.533501	86.550000
62579	GOLD	120	1787257440	4578.800000	4579.731637	4577.787559	4577.900000
62580	DOW	120	1787257440	52759.210000	52768.726053	52754.424460	52759.210000
62581	VIX	120	1787257440	16.050000	16.050085	16.005344	16.010000
63190	DOW	120	1787258040	52757.680850	52764.110826	52750.385498	52759.210000
63191	VIX	120	1787258040	16.011205	16.015366	16.003634	16.010000
63564	GOLD	120	1787258400	4577.200000	4577.436015	4575.361490	4575.846690
63067	SP500	120	1787257920	7641.249433	7641.927342	7640.478791	7641.160000
63068	CRUDE	120	1787257920	86.512664	86.602994	86.502163	86.600000
63069	GOLD	120	1787257920	4578.182541	4578.215112	4576.994580	4577.700000
62822	SP500	120	1787257680	7641.419837	7642.255869	7639.851418	7639.910284
62823	CRUDE	120	1787257680	86.537070	86.548859	86.519145	86.519145
62824	GOLD	120	1787257680	4577.767758	4578.602620	4577.157553	4577.157553
62825	DOW	120	1787257680	52761.164864	52767.834197	52754.391708	52764.640348
62826	VIX	120	1787257680	15.988577	16.005031	15.981499	15.999794
63070	DOW	120	1787257920	52759.605663	52766.542547	52755.166373	52759.210000
63071	VIX	120	1787257920	16.009169	16.015365	16.003311	16.010000
63565	DOW	120	1787258400	52759.210000	52766.975663	52748.074391	52759.931090
63566	VIX	120	1787258400	16.010000	16.016385	16.004967	16.012368
62942	SP500	120	1787257800	7641.160000	7642.646160	7640.067214	7641.160000
63312	SP500	120	1787258160	7641.290308	7642.273448	7640.415306	7641.653530
63313	CRUDE	120	1787258160	86.576952	86.654283	86.572935	86.642922
63314	GOLD	120	1787258160	4577.386949	4578.040302	4576.395408	4578.040302
63315	DOW	120	1787258160	52760.669382	52764.159228	52751.841809	52757.114733
63316	VIX	120	1787258160	16.011150	16.013555	16.003889	16.008949
63682	SP500	120	1787258520	7641.160000	7642.611288	7640.612032	7641.056268
63437	SP500	120	1787258280	7641.160000	7642.233008	7640.031306	7640.031306
63438	CRUDE	120	1787258280	86.620000	86.637363	86.598229	86.615581
63439	GOLD	120	1787258280	4577.800000	4578.279676	4576.520099	4577.293629
63440	DOW	120	1787258280	52759.210000	52768.066105	52750.595154	52756.278239
63683	CRUDE	120	1787258520	86.540000	86.553422	86.471929	86.498264
63684	GOLD	120	1787258520	4576.300000	4576.740502	4574.700000	4574.831616
63807	SP500	120	1787258640	7640.952346	7641.897991	7640.013601	7640.929138
63685	DOW	120	1787258520	52759.210000	52769.847025	52753.439334	52760.292857
63562	SP500	120	1787258400	7641.160000	7642.824721	7639.935983	7641.992851
63563	CRUDE	120	1787258400	86.570000	86.574184	86.520000	86.531817
63808	CRUDE	120	1787258640	86.496982	86.525011	86.488640	86.518137
63686	VIX	120	1787258520	16.010000	16.017348	16.003916	16.008717
63809	GOLD	120	1787258640	4575.001773	4575.338426	4572.762545	4573.820241
63810	DOW	120	1787258640	52758.889347	52767.026309	52752.428986	52756.344596
63811	VIX	120	1787258640	16.008254	16.014478	16.005449	16.006011
63932	SP500	120	1787258760	7640.906950	7641.289849	7640.906950	7641.289849
63933	CRUDE	120	1787258760	86.515917	86.515917	86.490000	86.493400
63934	GOLD	120	1787258760	4573.853464	4574.201012	4573.853464	4574.201012
63935	DOW	120	1787258760	52758.193388	52759.210000	52758.193388	52758.427697
63936	VIX	120	1787258760	16.005941	16.011575	16.005941	16.011575
63938	CRUDE	120	1787259480	86.470000	86.481746	86.461723	86.478597
63939	GOLD	120	1787259480	4574.100000	4574.600000	4573.201994	4574.363350
63941	VIX	120	1787259480	16.010000	16.012825	16.004603	16.008879
64227	SP500	120	1787259840	7640.763576	7642.355368	7640.161319	7641.292803
64228	CRUDE	120	1787259840	86.334444	86.337008	86.213123	86.223348
64229	GOLD	120	1787259840	4576.915633	4577.040897	4574.887526	4575.442509
64230	DOW	120	1787259840	52756.622175	52768.276600	52754.821611	52758.135962
64231	VIX	120	1787259840	16.010203	16.016335	16.006923	16.010303
64598	CRUDE	120	1787260200	86.202710	86.220750	86.195003	86.203957
64599	GOLD	120	1787260200	4575.418983	4575.914381	4574.430349	4574.994808
63937	SP500	120	1787259480	7641.160000	7642.265892	7640.109710	7641.161854
63940	DOW	120	1787259480	52759.210000	52763.775715	52757.022507	52759.554562
64600	DOW	120	1787260200	52759.361855	52763.903053	52750.324447	52758.876867
64601	VIX	120	1787260200	16.011937	16.015802	16.000602	16.010348
64102	SP500	120	1787259720	7641.664011	7642.234150	7639.960815	7640.883596
64103	CRUDE	120	1787259720	86.395886	86.401976	86.330000	86.331712
64104	GOLD	120	1787259720	4576.411933	4577.539464	4576.301704	4577.012324
64105	DOW	120	1787259720	52761.855404	52773.202024	52754.281289	52758.487232
64106	VIX	120	1787259720	16.011903	16.014624	16.003338	16.009501
65074	GOLD	120	1787260680	4575.000042	4575.864865	4574.368133	4575.154374
65075	DOW	120	1787260680	52763.199271	52766.134468	52749.536161	52757.470397
65076	VIX	120	1787260680	16.008152	16.016008	16.004580	16.008623
64832	SP500	120	1787260440	7641.220334	7642.661847	7639.779853	7640.865888
64833	CRUDE	120	1787260440	86.213610	86.219377	86.203488	86.212003
64834	GOLD	120	1787260440	4575.326489	4575.883221	4574.513169	4575.304030
64835	DOW	120	1787260440	52759.612257	52763.815046	52748.667544	52757.034951
64836	VIX	120	1787260440	16.010819	16.015523	16.002772	16.009251
63982	SP500	120	1787259600	7641.428294	7641.690748	7640.051715	7641.513370
63983	CRUDE	120	1787259600	86.478673	86.480985	86.390000	86.392748
63984	GOLD	120	1787259600	4574.293503	4576.600000	4573.694532	4576.478451
63985	DOW	120	1787259600	52761.073364	52766.450668	52753.344045	52760.228583
63986	VIX	120	1787259600	16.008756	16.018831	16.005965	16.010459
64712	SP500	120	1787260320	7641.097234	7641.844611	7639.862286	7641.215013
64713	CRUDE	120	1787260320	86.205322	86.221176	86.201583	86.211054
64714	GOLD	120	1787260320	4574.970092	4575.758504	4574.183363	4575.211164
64715	DOW	120	1787260320	52760.038551	52764.484099	52748.924727	52759.903480
64716	VIX	120	1787260320	16.010543	16.013183	16.004170	16.009351
65821	VIX	120	1787261400	16.008526	16.015962	16.004076	16.009689
65941	VIX	120	1787261520	16.009957	16.015863	16.004295	16.008219
65817	SP500	120	1787261400	7641.375117	7642.388906	7640.183533	7640.864355
64952	SP500	120	1787260560	7640.841865	7642.642725	7640.160340	7641.160055
64953	CRUDE	120	1787260560	86.211217	86.225272	86.200753	86.206624
64954	GOLD	120	1787260560	4575.153832	4575.643370	4574.683050	4574.951198
64955	DOW	120	1787260560	52756.660911	52767.514481	52752.821988	52762.627676
64956	VIX	120	1787260560	16.008150	16.012987	16.004418	16.009306
65317	SP500	120	1787260920	7640.475553	7641.954684	7639.992936	7641.330066
65318	CRUDE	120	1787260920	86.204684	86.219463	86.194743	86.210929
64477	SP500	120	1787260080	7641.152980	7642.159879	7639.689004	7641.203740
65319	GOLD	120	1787260920	4575.072283	4575.703884	4574.567291	4575.122724
65320	DOW	120	1787260920	52754.510043	52763.439896	52752.319206	52760.824709
65321	VIX	120	1787260920	16.007489	16.019448	16.005273	16.008811
64478	CRUDE	120	1787260080	86.274975	86.274975	86.200000	86.204703
64479	GOLD	120	1787260080	4574.918552	4575.495943	4574.223906	4575.357031
64352	SP500	120	1787259960	7641.316529	7641.820592	7640.087796	7641.003522
64353	CRUDE	120	1787259960	86.220751	86.273016	86.197766	86.273016
64354	GOLD	120	1787259960	4575.623373	4576.437803	4574.370795	4575.066139
64480	DOW	120	1787260080	52762.896727	52763.128459	52747.881355	52758.691431
64355	DOW	120	1787259960	52756.459469	52767.916209	52752.123764	52762.511028
64356	VIX	120	1787259960	16.009660	16.017029	16.004065	16.007703
64481	VIX	120	1787260080	16.009087	16.013337	16.005420	16.010451
64597	SP500	120	1787260200	7640.958195	7641.843352	7639.807648	7641.050963
65192	SP500	120	1787260800	7640.952462	7642.877632	7639.458993	7640.755747
65193	CRUDE	120	1787260800	86.209841	86.221353	86.200225	86.205950
65194	GOLD	120	1787260800	4575.008731	4575.947947	4574.427711	4575.115531
65195	DOW	120	1787260800	52756.347348	52761.933674	52746.633150	52756.301414
65196	VIX	120	1787260800	16.008736	16.016077	16.006467	16.007432
65818	CRUDE	120	1787261400	86.206765	86.219734	86.191695	86.213359
65819	GOLD	120	1787261400	4575.078953	4575.768244	4574.535097	4574.960206
65567	SP500	120	1787261160	7641.562637	7643.380086	7640.503819	7640.656308
65568	CRUDE	120	1787261160	86.202759	86.220448	86.195365	86.213168
65072	SP500	120	1787260680	7640.907391	7641.929705	7640.231137	7640.911436
65073	CRUDE	120	1787260680	86.209788	86.218368	86.197573	86.209381
65569	GOLD	120	1787261160	4574.868422	4575.858232	4574.430195	4575.246555
65570	DOW	120	1787261160	52758.976928	52767.576511	52747.331824	52757.645006
65571	VIX	120	1787261160	16.011221	16.018276	16.005349	16.012610
65820	DOW	120	1787261400	52763.988360	52767.569479	52751.843624	52760.004613
65692	SP500	120	1787261280	7640.902812	7642.191827	7640.408207	7641.451145
65693	CRUDE	120	1787261280	86.215528	86.222536	86.201553	86.209024
65694	GOLD	120	1787261280	4575.226738	4575.712926	4574.378788	4574.961285
65695	DOW	120	1787261280	52755.640090	52763.701990	52748.791655	52761.984094
65442	SP500	120	1787261040	7641.388855	7642.037627	7640.065773	7641.353817
65443	CRUDE	120	1787261040	86.210921	86.226273	86.196591	86.204691
65444	GOLD	120	1787261040	4575.066600	4575.361950	4574.526710	4574.904126
65445	DOW	120	1787261040	52760.728734	52767.897133	52754.228384	52759.994079
65446	VIX	120	1787261040	16.007224	16.015232	16.000489	16.010249
65696	VIX	120	1787261280	16.011900	16.012660	16.004464	16.009578
65937	SP500	120	1787261520	7641.068528	7641.942203	7640.214809	7640.744477
65938	CRUDE	120	1787261520	86.213528	86.223191	86.197758	86.208670
65939	GOLD	120	1787261520	4574.880255	4576.125943	4574.369627	4574.883034
65940	DOW	120	1787261520	52758.739917	52766.415109	52752.653219	52759.269240
66057	SP500	120	1787261640	7641.000749	7642.877301	7639.123968	7641.560384
66058	CRUDE	120	1787261640	86.210865	86.224152	86.200980	86.211003
66059	GOLD	120	1787261640	4574.895446	4575.435638	4574.322698	4575.029428
67158	CRUDE	120	1787262720	86.207137	86.220550	86.196726	86.210964
67159	GOLD	120	1787262720	4574.976935	4575.468150	4574.488285	4575.215926
67160	DOW	120	1787262720	52759.861551	52767.635304	52752.736198	52759.408765
66912	SP500	120	1787262480	7640.800331	7642.807309	7640.460923	7640.577272
66913	CRUDE	120	1787262480	86.206843	86.220372	86.198340	86.210119
66914	GOLD	120	1787262480	4575.150440	4575.721150	4574.573657	4575.008918
66182	SP500	120	1787261760	7641.410682	7642.806509	7640.206125	7641.336563
66183	CRUDE	120	1787261760	86.208309	86.217391	86.198671	86.207923
66184	GOLD	120	1787261760	4574.900534	4575.659067	4574.133782	4575.135205
66185	DOW	120	1787261760	52758.559403	52765.298516	52754.170048	52759.214160
66186	VIX	120	1787261760	16.011157	16.016829	16.000369	16.008597
66915	DOW	120	1787262480	52761.863604	52764.556606	52751.242565	52759.115379
66916	VIX	120	1787262480	16.010657	16.017570	16.004102	16.007019
67161	VIX	120	1787262720	16.011076	16.013158	16.003316	16.010586
66672	SP500	120	1787262240	7641.273201	7642.091691	7640.304524	7641.014242
66547	SP500	120	1787262120	7640.738310	7642.264054	7639.849179	7641.255392
66548	CRUDE	120	1787262120	86.211312	86.224258	86.198130	86.211694
66549	GOLD	120	1787262120	4575.059228	4575.728118	4574.725097	4575.105593
66550	DOW	120	1787262120	52761.464260	52767.205108	52753.055038	52757.593378
66551	VIX	120	1787262120	16.007873	16.017770	16.003960	16.009416
66427	SP500	120	1787262000	7641.217904	7642.471773	7640.537058	7640.941245
66428	CRUDE	120	1787262000	86.211121	86.227309	86.198834	86.209254
66429	GOLD	120	1787262000	4575.232360	4575.494142	4574.523765	4575.206232
66430	DOW	120	1787262000	52759.333546	52768.960945	52753.724701	52759.412908
66431	VIX	120	1787262000	16.009651	16.015482	16.001551	16.008779
66060	DOW	120	1787261640	52761.084479	52762.714870	52749.952736	52759.529285
66061	VIX	120	1787261640	16.008944	16.014333	16.005821	16.011664
66673	CRUDE	120	1787262240	86.212160	86.220125	86.197905	86.207423
66674	GOLD	120	1787262240	4575.220292	4575.645572	4574.579874	4575.263792
66675	DOW	120	1787262240	52759.180989	52767.163715	52751.783059	52760.445134
66676	VIX	120	1787262240	16.008150	16.013173	16.003239	16.009128
66307	SP500	120	1787261880	7641.423221	7641.868002	7639.704125	7641.278225
66308	CRUDE	120	1787261880	86.210317	86.231136	86.197818	86.212515
66309	GOLD	120	1787261880	4575.132757	4576.197096	4574.398413	4575.109022
66310	DOW	120	1787261880	52758.919326	52763.181534	52753.509865	52757.453046
66311	VIX	120	1787261880	16.007618	16.012149	16.004010	16.009808
67772	SP500	120	1787263320	7641.160000	7641.818298	7640.005278	7641.782110
67647	SP500	120	1787263200	7641.160000	7642.158542	7640.199144	7641.431925
67402	SP500	120	1787262960	7640.993472	7642.688156	7640.048968	7640.833575
67403	CRUDE	120	1787262960	86.208355	86.222550	86.191358	86.218396
67404	GOLD	120	1787262960	4574.819767	4575.537585	4573.898320	4574.911226
67405	DOW	120	1787262960	52759.137792	52773.112695	52754.515434	52757.962440
67406	VIX	120	1787262960	16.010326	16.016375	16.004754	16.011613
66792	SP500	120	1787262360	7641.095829	7642.486499	7640.223389	7640.873585
66793	CRUDE	120	1787262360	86.209378	86.221004	86.198442	86.209499
66794	GOLD	120	1787262360	4575.228021	4575.615631	4574.360906	4575.215601
66795	DOW	120	1787262360	52758.563419	52768.846065	52755.553744	52760.053451
66796	VIX	120	1787262360	16.009060	16.015806	16.007002	16.011105
67648	CRUDE	120	1787263200	86.210000	86.227053	86.193287	86.197201
67649	GOLD	120	1787263200	4575.100000	4575.619895	4574.369435	4574.689190
67650	DOW	120	1787263200	52759.210000	52766.470774	52752.384574	52758.070079
67651	VIX	120	1787263200	16.010000	16.015085	16.005782	16.013851
67773	CRUDE	120	1787263320	86.210000	86.226855	86.196526	86.225689
67522	SP500	120	1787263080	7641.160000	7641.946533	7639.929497	7640.601990
67277	SP500	120	1787262840	7641.035856	7642.098800	7639.821123	7640.871378
67278	CRUDE	120	1787262840	86.209701	86.219975	86.197850	86.208072
67037	SP500	120	1787262600	7640.351323	7642.007133	7640.024504	7641.160000
67038	CRUDE	120	1787262600	86.210528	86.218161	86.204835	86.210000
67039	GOLD	120	1787262600	4575.138117	4576.106990	4574.594409	4575.100000
67040	DOW	120	1787262600	52759.430662	52767.001139	52752.349807	52759.210000
67041	VIX	120	1787262600	16.007919	16.013405	16.002863	16.010000
67279	GOLD	120	1787262840	4575.048864	4575.707178	4574.353654	4574.930323
67280	DOW	120	1787262840	52759.543500	52766.651952	52754.160083	52761.030809
67157	SP500	120	1787262720	7641.394605	7642.461128	7640.571760	7641.295180
67523	CRUDE	120	1787263080	86.210000	86.220324	86.198513	86.201086
67524	GOLD	120	1787263080	4575.100000	4575.695790	4574.165368	4575.088458
67525	DOW	120	1787263080	52759.210000	52767.520549	52749.338361	52758.221881
67526	VIX	120	1787263080	16.010000	16.016882	16.003786	16.016882
67774	GOLD	120	1787263320	4575.100000	4575.634480	4574.879466	4575.351876
67281	VIX	120	1787262840	16.011144	16.013125	16.002489	16.010798
67775	DOW	120	1787263320	52759.210000	52766.900596	52749.678789	52762.739835
67776	VIX	120	1787263320	16.010000	16.014339	16.004306	16.012272
68269	GOLD	120	1787263800	4574.805792	4577.226661	4573.656965	4575.980755
67897	SP500	120	1787263440	7641.160000	7642.415809	7639.717222	7641.706995
67898	CRUDE	120	1787263440	86.210000	86.221483	86.195799	86.216429
67899	GOLD	120	1787263440	4575.100000	4575.655087	4574.490192	4575.552244
67900	DOW	120	1787263440	52759.210000	52766.332903	52752.120655	52758.034038
68017	SP500	120	1787263560	7641.160000	7642.429301	7640.587279	7640.908736
67901	VIX	120	1787263440	16.010000	16.014909	16.003792	16.013970
68018	CRUDE	120	1787263560	86.210000	86.220745	86.198591	86.199492
68019	GOLD	120	1787263560	4575.100000	4575.461943	4574.400757	4574.765671
68020	DOW	120	1787263560	52759.210000	52768.610864	52755.575860	52761.645822
68021	VIX	120	1787263560	16.010000	16.014341	16.003500	16.008261
68142	SP500	120	1787263680	7641.160000	7642.558264	7639.938801	7640.797103
68143	CRUDE	120	1787263680	86.210000	86.222461	86.198772	86.203406
68144	GOLD	120	1787263680	4575.100000	4575.558947	4574.351455	4574.795877
68145	DOW	120	1787263680	52759.210000	52762.332780	52748.715750	52758.303665
68146	VIX	120	1787263680	16.010000	16.015575	16.006692	16.008528
68267	SP500	120	1787263800	7640.899162	7642.130346	7639.887180	7641.400715
68268	CRUDE	120	1787263800	86.201898	86.335270	86.197850	86.304920
69496	VIX	120	1787265000	16.010000	16.013851	16.007907	16.011727
69127	SP500	120	1787264640	7641.724220	7641.724220	7639.872800	7641.613849
68387	SP500	120	1787263920	7641.251567	7642.384302	7639.936907	7640.656113
68388	CRUDE	120	1787263920	86.306991	86.357464	86.290325	86.357296
68389	GOLD	120	1787263920	4575.842980	4576.409453	4575.251668	4576.128866
68390	DOW	120	1787263920	52752.914698	52765.335015	52752.914698	52758.626164
68391	VIX	120	1787263920	16.011375	16.018543	16.006865	16.008461
69128	CRUDE	120	1787264640	86.325052	86.350802	86.310053	86.345761
69129	GOLD	120	1787264640	4574.460064	4575.902519	4574.298561	4574.991698
69130	DOW	120	1787264640	52759.782178	52767.852392	52754.901001	52758.014911
69131	VIX	120	1787264640	16.001770	16.015030	16.001770	16.008942
69367	SP500	120	1787264880	7641.504410	7641.764593	7640.318953	7640.544790
69368	CRUDE	120	1787264880	86.322440	86.322440	86.277679	86.293006
69369	GOLD	120	1787264880	4575.162399	4576.381855	4574.401390	4575.823694
69370	DOW	120	1787264880	52762.796681	52767.803253	52749.879724	52753.413566
68882	SP500	120	1787264400	7641.450666	7642.375000	7639.894779	7642.088647
68762	SP500	120	1787264280	7641.160000	7642.034052	7639.599655	7641.375220
68763	CRUDE	120	1787264280	86.370000	86.455838	86.369596	86.417746
68764	GOLD	120	1787264280	4576.000000	4576.540717	4574.099128	4574.282921
68765	DOW	120	1787264280	52759.210000	52765.393876	52748.344137	52757.040987
68766	VIX	120	1787264280	16.010000	16.016730	16.004759	16.014305
68883	CRUDE	120	1787264400	86.416476	86.448270	86.380000	86.387744
68884	GOLD	120	1787264400	4574.261437	4575.158523	4572.776114	4574.007262
68885	DOW	120	1787264400	52757.916653	52767.748151	52748.078690	52753.878293
68637	SP500	120	1787264160	7641.160000	7641.994372	7640.228130	7640.408069
68638	CRUDE	120	1787264160	86.370000	86.415397	86.345999	86.376066
68270	DOW	120	1787263800	52757.271840	52764.236290	52753.087901	52754.356934
68271	VIX	120	1787263800	16.009263	16.015746	16.003227	16.012136
68639	GOLD	120	1787264160	4576.800000	4577.345581	4575.577713	4575.711602
68640	DOW	120	1787264160	52759.210000	52765.410590	52754.281680	52759.722527
68641	VIX	120	1787264160	16.010000	16.014456	16.005993	16.014456
68886	VIX	120	1787264400	16.014091	16.021962	16.001596	16.011049
69371	VIX	120	1787264880	16.012365	16.016799	16.003221	16.009297
68512	SP500	120	1787264040	7640.669128	7642.324879	7640.468385	7641.417164
68513	CRUDE	120	1787264040	86.358144	86.406740	86.340000	86.343272
68514	GOLD	120	1787264040	4576.064855	4577.274740	4575.427427	4577.104307
68515	DOW	120	1787264040	52758.423778	52767.993937	52755.779784	52755.779784
68516	VIX	120	1787264040	16.009732	16.015344	16.002885	16.005086
69740	DOW	120	1787265240	52755.430465	52767.179050	52755.430465	52761.556026
69741	VIX	120	1787265240	16.002493	16.016182	16.002493	16.016182
69617	SP500	120	1787265120	7641.923116	7642.580098	7640.217016	7642.560905
69618	CRUDE	120	1787265120	86.266515	86.303798	86.246914	86.251909
69002	SP500	120	1787264520	7642.225778	7642.225778	7639.951422	7641.694561
69003	CRUDE	120	1787264520	86.384379	86.398393	86.324296	86.324296
69004	GOLD	120	1787264520	4574.077526	4576.283740	4574.077526	4574.484002
69005	DOW	120	1787264520	52752.462515	52766.775290	52752.462515	52759.802190
69006	VIX	120	1787264520	16.010766	16.013542	16.000673	16.002564
69619	GOLD	120	1787265120	4575.040798	4575.394925	4573.372798	4574.770840
69620	DOW	120	1787265120	52761.468856	52764.694935	52747.504342	52754.141006
69621	VIX	120	1787265120	16.012046	16.018106	16.002393	16.002393
69988	CRUDE	120	1787265480	86.298180	86.311977	86.273342	86.287800
69247	SP500	120	1787264760	7641.635615	7642.523300	7639.930943	7641.552104
69248	CRUDE	120	1787264760	86.347072	86.353066	86.290816	86.320852
69249	GOLD	120	1787264760	4575.012430	4576.816850	4574.349681	4575.327829
69250	DOW	120	1787264760	52757.487967	52768.375847	52751.180569	52762.156173
69251	VIX	120	1787264760	16.008687	16.014604	16.005585	16.011488
69989	GOLD	120	1787265480	4574.886490	4576.921350	4574.717300	4575.458403
69990	DOW	120	1787265480	52753.231016	52767.013980	52753.231016	52753.993916
69991	VIX	120	1787265480	16.011438	16.013430	16.003514	16.005966
69862	SP500	120	1787265360	7641.916087	7641.916087	7639.973765	7641.293847
69863	CRUDE	120	1787265360	86.282650	86.306689	86.253631	86.297318
69864	GOLD	120	1787265360	4575.195050	4576.329486	4574.655145	4574.823310
69865	DOW	120	1787265360	52762.933653	52767.360147	52753.168769	52753.168769
69866	VIX	120	1787265360	16.015628	16.018770	16.001843	16.011248
69492	SP500	120	1787265000	7641.160000	7643.140602	7640.442472	7642.074353
69493	CRUDE	120	1787265000	86.290000	86.306560	86.265431	86.265431
69494	GOLD	120	1787265000	4575.900000	4576.599773	4574.436116	4574.938708
69495	DOW	120	1787265000	52759.210000	52765.997870	52746.466972	52762.280136
70107	SP500	120	1787265600	7641.092801	7642.406428	7640.325305	7640.746137
69737	SP500	120	1787265240	7642.496985	7642.496985	7640.463270	7641.640447
69738	CRUDE	120	1787265240	86.250487	86.283521	86.235327	86.280145
69739	GOLD	120	1787265240	4574.792699	4575.372265	4573.382922	4575.135849
70356	VIX	120	1787265840	16.013077	16.013517	16.005263	16.012164
70227	SP500	120	1787265720	7640.942664	7641.748510	7639.336734	7640.305894
70108	CRUDE	120	1787265600	86.287706	86.298609	86.261446	86.297373
70109	GOLD	120	1787265600	4575.525679	4575.975472	4574.472464	4575.365360
70110	DOW	120	1787265600	52754.455691	52765.769993	52748.588235	52754.016355
69987	SP500	120	1787265480	7641.199993	7642.887455	7640.224020	7641.373304
70111	VIX	120	1787265600	16.004752	16.017178	16.004752	16.016924
70228	CRUDE	120	1787265720	86.295483	86.312925	86.272677	86.272677
70229	GOLD	120	1787265720	4575.511119	4575.967704	4574.314406	4575.914266
70230	DOW	120	1787265720	52755.952874	52771.389636	52753.873852	52762.983781
70231	VIX	120	1787265720	16.017527	16.017527	16.007098	16.012251
70474	GOLD	120	1787265960	4575.779710	4577.440277	4575.487322	4576.445863
70352	SP500	120	1787265840	7640.090315	7642.499507	7640.090315	7640.479129
70353	CRUDE	120	1787265840	86.271868	86.292847	86.247436	86.278697
70354	GOLD	120	1787265840	4575.847396	4576.498818	4575.419495	4575.950872
70355	DOW	120	1787265840	52763.206077	52766.259605	52754.618430	52758.154912
70472	SP500	120	1787265960	7640.255193	7642.852241	7640.132957	7640.800562
70473	CRUDE	120	1787265960	86.278106	86.288541	86.260000	86.284986
71453	CRUDE	120	1787266920	86.274718	86.303711	86.273096	86.303619
71454	GOLD	120	1787266920	4577.973296	4580.372382	4577.973296	4579.612566
71455	DOW	120	1787266920	52756.023050	52763.667858	52754.713475	52758.007336
71456	VIX	120	1787266920	16.007109	16.016050	16.006844	16.009303
70592	SP500	120	1787266080	7640.834416	7642.304290	7640.074013	7640.520277
70593	CRUDE	120	1787266080	86.286932	86.340000	86.262178	86.333700
70594	GOLD	120	1787266080	4576.432375	4578.699569	4575.846906	4577.765780
70595	DOW	120	1787266080	52754.313773	52765.094581	52752.034093	52760.123186
70596	VIX	120	1787266080	16.007284	16.015747	16.004380	16.009402
71327	SP500	120	1787266800	7640.551313	7642.449453	7640.279636	7640.751297
71328	CRUDE	120	1787266800	86.326258	86.326604	86.273866	86.274295
71329	GOLD	120	1787266800	4577.369758	4579.058813	4577.224090	4578.028073
71330	DOW	120	1787266800	52758.332709	52763.639707	52748.674936	52753.991888
71331	VIX	120	1787266800	16.009793	16.015433	16.003325	16.007702
71082	SP500	120	1787266560	7640.685511	7642.356969	7639.479654	7640.826177
70962	SP500	120	1787266440	7641.500238	7642.196280	7639.948889	7640.385937
70963	CRUDE	120	1787266440	86.299832	86.300300	86.269867	86.274129
70964	GOLD	120	1787266440	4579.306333	4580.200016	4578.224195	4579.517387
70965	DOW	120	1787266440	52759.861432	52764.113575	52754.696041	52754.843357
70966	VIX	120	1787266440	16.010837	16.016604	16.006100	16.012085
71083	CRUDE	120	1787266560	86.270973	86.315450	86.270973	86.299368
70842	SP500	120	1787266320	7641.168086	7642.071466	7640.293354	7641.428533
70843	CRUDE	120	1787266320	86.306572	86.315827	86.294098	86.297833
70844	GOLD	120	1787266320	4578.481821	4579.559847	4577.218027	4579.427718
70845	DOW	120	1787266320	52755.252257	52768.703657	52754.551192	52760.097476
70846	VIX	120	1787266320	16.008737	16.020503	16.005351	16.011791
70475	DOW	120	1787265960	52757.749690	52763.663696	52746.107733	52755.504470
70476	VIX	120	1787265960	16.013710	16.016699	16.006275	16.007617
71084	GOLD	120	1787266560	4579.468861	4580.188135	4575.699239	4575.958435
71085	DOW	120	1787266560	52752.767087	52769.728794	52752.463667	52765.218501
71086	VIX	120	1787266560	16.012768	16.019021	16.006493	16.009828
72172	SP500	120	1787267640	7641.025597	7642.817487	7640.132750	7641.445443
70717	SP500	120	1787266200	7640.714223	7642.210323	7639.825373	7640.921958
70718	CRUDE	120	1787266200	86.332206	86.343108	86.287140	86.309645
70719	GOLD	120	1787266200	4577.904783	4578.500000	4576.900476	4578.319675
70720	DOW	120	1787266200	52759.724706	52768.549673	52753.183439	52753.183439
70721	VIX	120	1787266200	16.008041	16.014065	16.004956	16.008505
72173	CRUDE	120	1787267640	86.303062	86.338479	86.250433	86.256967
71817	SP500	120	1787267280	7641.252612	7642.046882	7640.065121	7642.046882
71577	SP500	120	1787267040	7642.332829	7642.332829	7640.025783	7642.302628
71578	CRUDE	120	1787267040	86.301896	86.319837	86.291179	86.313360
71579	GOLD	120	1787267040	4579.761823	4580.302891	4579.200000	4579.738049
71580	DOW	120	1787267040	52758.927543	52765.839064	52751.958189	52765.315288
71581	VIX	120	1787267040	16.008753	16.017151	16.004529	16.012372
71202	SP500	120	1787266680	7640.790464	7642.065841	7640.576619	7640.677327
71203	CRUDE	120	1787266680	86.300297	86.323142	86.284015	86.322916
71204	GOLD	120	1787266680	4575.923215	4578.581457	4575.550042	4577.369309
71205	DOW	120	1787266680	52764.508054	52766.955371	52748.675320	52759.571263
71206	VIX	120	1787266680	16.009829	16.014274	16.005256	16.010586
71818	CRUDE	120	1787267280	86.317932	86.319422	86.283038	86.318169
71819	GOLD	120	1787267280	4580.256435	4580.805782	4578.744779	4579.540071
71820	DOW	120	1787267280	52762.830246	52765.948679	52751.457864	52764.272343
71821	VIX	120	1787267280	16.006363	16.015022	16.003296	16.005869
72174	GOLD	120	1787267640	4585.695201	4586.185343	4584.478823	4586.024977
72175	DOW	120	1787267640	52761.587429	52768.775297	52753.177829	52760.980547
72176	VIX	120	1787267640	16.009757	16.017369	16.004933	16.012984
72057	SP500	120	1787267520	7641.563621	7642.327072	7640.382345	7641.140513
72058	CRUDE	120	1787267520	86.253227	86.304200	86.250893	86.304200
71937	SP500	120	1787267400	7641.904759	7642.126164	7640.414876	7641.582091
71697	SP500	120	1787267160	7642.574852	7642.574852	7640.349825	7641.184433
71452	SP500	120	1787266920	7640.597024	7642.827662	7640.597024	7642.169502
71698	CRUDE	120	1787267160	86.313731	86.331648	86.284334	86.318049
71699	GOLD	120	1787267160	4579.559565	4580.282205	4579.099972	4580.282205
71700	DOW	120	1787267160	52763.293466	52766.114020	52747.850017	52764.908201
71701	VIX	120	1787267160	16.013468	16.015139	16.003802	16.007016
71938	CRUDE	120	1787267400	86.316099	86.318044	86.254501	86.256497
71939	GOLD	120	1787267400	4579.568700	4580.572435	4579.136386	4580.419504
71940	DOW	120	1787267400	52763.285953	52769.443055	52747.565395	52753.969081
71941	VIX	120	1787267400	16.004641	16.016958	16.004308	16.011347
72059	GOLD	120	1787267520	4580.515582	4585.788910	4579.991759	4585.603359
72060	DOW	120	1787267520	52752.056299	52767.148670	52750.044601	52762.970863
72061	VIX	120	1787267520	16.012786	16.018914	16.007305	16.011089
72296	VIX	120	1787267760	16.012483	16.014273	16.004039	16.010814
72541	VIX	120	1787268000	16.007210	16.016098	16.002830	16.010282
72292	SP500	120	1787267760	7641.606499	7642.714494	7639.952475	7640.936559
72293	CRUDE	120	1787267760	86.259209	86.337927	86.256113	86.318786
72294	GOLD	120	1787267760	4586.182293	4586.332780	4584.117243	4584.117243
72295	DOW	120	1787267760	52761.905220	52769.217437	52753.292916	52758.141669
72412	SP500	120	1787267880	7641.062278	7641.981309	7640.226965	7640.715701
72413	CRUDE	120	1787267880	86.316819	86.328613	86.294012	86.299291
72414	GOLD	120	1787267880	4584.052418	4585.074945	4581.096169	4582.713121
72415	DOW	120	1787267880	52757.441842	52767.601146	52754.223358	52761.814083
72416	VIX	120	1787267880	16.011237	16.015826	16.004862	16.007626
72659	GOLD	120	1787268120	4583.708964	4588.635597	4583.630597	4586.846736
72537	SP500	120	1787268000	7640.637024	7642.124298	7640.637024	7640.763468
72538	CRUDE	120	1787268000	86.296550	86.306620	86.281036	86.295006
72539	GOLD	120	1787268000	4582.813592	4584.742419	4582.192936	4583.843532
72540	DOW	120	1787268000	52762.706608	52764.563597	52748.218109	52764.563597
72657	SP500	120	1787268120	7640.804829	7642.166059	7639.550243	7640.965884
72658	CRUDE	120	1787268120	86.291966	86.344518	86.279496	86.340747
73639	GOLD	120	1787269080	4585.176239	4585.257708	4579.103347	4581.724301
73640	DOW	120	1787269080	52753.330966	52774.757454	52749.283814	52763.386485
73641	VIX	120	1787269080	16.008342	16.012360	16.003244	16.007610
72777	SP500	120	1787268240	7640.865371	7642.178484	7639.761777	7641.021328
72778	CRUDE	120	1787268240	86.340156	86.357563	86.275358	86.290324
72779	GOLD	120	1787268240	4586.773031	4588.284898	4586.227451	4586.313029
72780	DOW	120	1787268240	52759.171319	52770.737195	52753.532335	52767.783191
72781	VIX	120	1787268240	16.012566	16.017015	16.003497	16.009116
73517	SP500	120	1787268960	7641.460990	7641.868531	7640.364564	7641.283469
73518	CRUDE	120	1787268960	86.313336	86.336955	86.313336	86.324103
73519	GOLD	120	1787268960	4584.531748	4585.831771	4583.900000	4585.145984
73520	DOW	120	1787268960	52750.453340	52767.100556	52748.437397	52754.413978
73521	VIX	120	1787268960	16.012631	16.015282	16.002255	16.006815
73147	SP500	120	1787268600	7641.137780	7642.197907	7640.484175	7641.707021
73148	CRUDE	120	1787268600	86.286211	86.317628	86.269762	86.308457
73149	GOLD	120	1787268600	4587.946928	4587.971934	4585.412661	4585.688645
73150	DOW	120	1787268600	52754.283430	52774.567661	52752.371300	52760.535381
73151	VIX	120	1787268600	16.015122	16.017734	16.006843	16.012919
73022	SP500	120	1787268480	7641.208945	7641.893050	7639.876439	7641.123391
73023	CRUDE	120	1787268480	86.310763	86.311193	86.278320	86.283076
73024	GOLD	120	1787268480	4585.718845	4588.355798	4585.250199	4587.980050
73025	DOW	120	1787268480	52747.184856	52769.432098	52744.700371	52755.679062
73026	VIX	120	1787268480	16.010476	16.016704	16.004706	16.015546
72660	DOW	120	1787268120	52762.607680	52767.340077	52747.784651	52759.790129
72661	VIX	120	1787268120	16.011473	16.018817	16.005751	16.011593
74131	VIX	120	1787269560	16.008369	16.017047	16.003210	16.005636
73267	SP500	120	1787268720	7641.439793	7642.880932	7639.734265	7639.745608
73268	CRUDE	120	1787268720	86.308416	86.321528	86.300001	86.301630
73269	GOLD	120	1787268720	4585.599766	4586.369706	4583.878032	4584.995930
73270	DOW	120	1787268720	52760.821508	52767.162767	52751.227305	52758.329324
73271	VIX	120	1787268720	16.011372	16.017914	16.004251	16.011915
72902	SP500	120	1787268360	7641.317375	7641.739720	7640.056791	7641.489266
72903	CRUDE	120	1787268360	86.293468	86.311611	86.292293	86.308485
72904	GOLD	120	1787268360	4586.184528	4587.690733	4585.296236	4585.782931
72905	DOW	120	1787268360	52769.625063	52769.625063	52747.738740	52748.253907
72906	VIX	120	1787268360	16.010113	16.016377	16.004534	16.009561
74007	SP500	120	1787269440	7640.235862	7641.914611	7640.103394	7640.926082
74008	CRUDE	120	1787269440	86.295007	86.331187	86.290000	86.299220
74009	GOLD	120	1787269440	4580.226275	4581.099857	4578.171566	4578.232240
74010	DOW	120	1787269440	52763.628132	52766.032457	52753.347406	52761.859345
74011	VIX	120	1787269440	16.014320	16.014682	16.003632	16.007402
73762	SP500	120	1787269200	7641.564238	7642.258497	7639.631169	7640.403063
73763	CRUDE	120	1787269200	86.314549	86.318910	86.290939	86.305212
73764	GOLD	120	1787269200	4581.696674	4584.381912	4581.511379	4581.511379
73765	DOW	120	1787269200	52762.275810	52766.967939	52748.719714	52754.199470
73766	VIX	120	1787269200	16.007727	16.014753	16.001676	16.008930
73392	SP500	120	1787268840	7639.487924	7642.103017	7639.487924	7641.466798
73393	CRUDE	120	1787268840	86.304332	86.334619	86.300280	86.313141
73394	GOLD	120	1787268840	4585.075537	4585.517191	4583.927250	4584.375719
73395	DOW	120	1787268840	52760.045811	52768.458830	52751.313672	52752.471383
73396	VIX	120	1787268840	16.011819	16.014417	16.005515	16.011601
74253	CRUDE	120	1787269680	86.287761	86.309502	86.278971	86.306951
74254	GOLD	120	1787269680	4579.148963	4580.207039	4579.146803	4579.361242
74255	DOW	120	1787269680	52758.243962	52767.312759	52745.637881	52763.116187
74256	VIX	120	1787269680	16.004937	16.015906	16.002763	16.009483
73637	SP500	120	1787269080	7641.333965	7641.919211	7639.982212	7641.767573
73638	CRUDE	120	1787269080	86.325921	86.354001	86.299850	86.314158
74496	VIX	120	1787269920	16.010139	16.012863	16.004792	16.009660
73887	SP500	120	1787269320	7640.694361	7642.442653	7639.936814	7640.367879
74616	VIX	120	1787270040	16.011092	16.015192	16.002610	16.012810
74492	SP500	120	1787269920	7641.214877	7642.088795	7640.089518	7641.524986
74493	CRUDE	120	1787269920	86.297784	86.312355	86.293177	86.304210
74372	SP500	120	1787269800	7641.435752	7641.921079	7639.955412	7641.015663
74373	CRUDE	120	1787269800	86.305061	86.308582	86.283251	86.299888
73888	CRUDE	120	1787269320	86.304509	86.304509	86.271045	86.294377
73889	GOLD	120	1787269320	4581.388650	4581.963308	4579.639696	4580.211641
73890	DOW	120	1787269320	52753.030621	52768.183527	52753.030621	52763.741689
73891	VIX	120	1787269320	16.008669	16.016931	16.000785	16.013685
74252	SP500	120	1787269680	7641.395593	7641.915750	7640.238496	7641.526396
74127	SP500	120	1787269560	7641.003507	7641.882019	7639.725859	7641.269614
74128	CRUDE	120	1787269560	86.301614	86.314674	86.281732	86.289238
74129	GOLD	120	1787269560	4578.362213	4579.319157	4577.138164	4579.010264
74130	DOW	120	1787269560	52762.786469	52767.132234	52753.999323	52757.435839
74374	GOLD	120	1787269800	4579.449526	4581.370727	4579.210482	4580.797786
74375	DOW	120	1787269800	52762.755591	52768.920699	52753.160059	52758.309690
74376	VIX	120	1787269800	16.010376	16.015949	16.004223	16.008574
74494	GOLD	120	1787269920	4580.723561	4581.263966	4579.384959	4580.529771
74495	DOW	120	1787269920	52757.150210	52764.283951	52751.148889	52758.095275
74859	GOLD	120	1787270280	4581.714973	4583.758582	4581.045864	4582.797294
74612	SP500	120	1787270040	7641.261109	7642.136957	7639.613117	7641.460745
74613	CRUDE	120	1787270040	86.302381	86.331331	86.282238	86.288619
74614	GOLD	120	1787270040	4580.456180	4581.172692	4579.716467	4581.016643
74615	DOW	120	1787270040	52756.111416	52762.820904	52751.293534	52757.971202
74732	SP500	120	1787270160	7641.360856	7641.865550	7639.857043	7640.969244
74733	CRUDE	120	1787270160	86.288296	86.300573	86.263039	86.269102
74734	GOLD	120	1787270160	4581.056418	4582.089934	4578.957107	4581.726402
74735	DOW	120	1787270160	52759.974362	52766.002048	52751.160755	52759.041478
74736	VIX	120	1787270160	16.011824	16.014426	16.005621	16.007670
74857	SP500	120	1787270280	7640.781377	7642.354310	7640.532405	7641.815546
74858	CRUDE	120	1787270280	86.265947	86.300391	86.265947	86.269863
75958	CRUDE	120	1787271360	86.258916	86.279395	86.206755	86.279395
75959	GOLD	120	1787271360	4577.653622	4579.400547	4576.115652	4577.254213
75960	DOW	120	1787271360	52756.277853	52764.298785	52752.971272	52758.277444
75961	VIX	120	1787271360	16.006336	16.013764	16.004910	16.010864
74977	SP500	120	1787270400	7641.986218	7642.442123	7640.308862	7642.232563
74978	CRUDE	120	1787270400	86.270469	86.279080	86.252882	86.279080
74979	GOLD	120	1787270400	4582.905808	4583.796560	4582.548664	4582.823346
74980	DOW	120	1787270400	52757.281603	52762.964182	52747.209134	52753.566990
74981	VIX	120	1787270400	16.006654	16.018606	16.005029	16.010528
75717	SP500	120	1787271120	7641.016618	7641.825305	7639.742022	7640.205720
75718	CRUDE	120	1787271120	86.197286	86.197286	86.140000	86.152091
75719	GOLD	120	1787271120	4581.618778	4582.532537	4580.282376	4580.282376
75720	DOW	120	1787271120	52761.471660	52766.949842	52755.499935	52760.683002
75721	VIX	120	1787271120	16.011656	16.017905	16.006684	16.010641
76326	VIX	120	1787271720	16.009998	16.015769	16.006632	16.011827
75352	SP500	120	1787270760	7641.463621	7642.153005	7640.271779	7641.800330
75353	CRUDE	120	1787270760	86.256009	86.261761	86.202311	86.217324
75354	GOLD	120	1787270760	4582.786482	4583.766890	4582.123257	4583.591804
75355	DOW	120	1787270760	52754.663718	52768.953018	52753.221729	52759.789523
75356	VIX	120	1787270760	16.006886	16.017634	16.005627	16.010265
76202	SP500	120	1787271600	7641.699623	7642.340102	7640.070580	7641.387480
75227	SP500	120	1787270640	7640.329499	7641.932666	7639.642569	7641.524347
75228	CRUDE	120	1787270640	86.272635	86.286198	86.240666	86.256292
74860	DOW	120	1787270280	52757.523006	52764.754577	52753.602422	52756.328229
74861	VIX	120	1787270280	16.007901	16.014074	16.005949	16.006126
75229	GOLD	120	1787270640	4583.179369	4584.795719	4582.352100	4582.619750
75230	DOW	120	1787270640	52756.696240	52765.521016	52752.975603	52755.822785
75231	VIX	120	1787270640	16.008854	16.012762	16.005720	16.005720
76203	CRUDE	120	1787271600	86.224597	86.263186	86.196730	86.233360
76204	GOLD	120	1787271600	4576.355186	4579.200000	4576.225633	4577.340389
76205	DOW	120	1787271600	52764.255564	52767.654302	52755.879834	52759.807706
75472	SP500	120	1787270880	7641.589433	7641.769817	7640.272223	7641.575381
75473	CRUDE	120	1787270880	86.218699	86.240130	86.198663	86.222115
75474	GOLD	120	1787270880	4583.737303	4584.049173	4582.072784	4582.277432
75475	DOW	120	1787270880	52758.688596	52767.180666	52752.088929	52756.076104
75476	VIX	120	1787270880	16.010212	16.015329	16.004579	16.012465
75102	SP500	120	1787270520	7642.173307	7642.272616	7639.853849	7640.382158
75103	CRUDE	120	1787270520	86.275861	86.304099	86.245275	86.271234
75104	GOLD	120	1787270520	4582.642585	4583.193720	4582.016308	4583.094272
75105	DOW	120	1787270520	52753.812918	52766.289063	52753.044663	52754.940642
75106	VIX	120	1787270520	16.010045	16.017617	16.001594	16.007317
76206	VIX	120	1787271600	16.011192	16.018407	16.005918	16.011049
75597	SP500	120	1787271000	7641.386970	7642.374339	7640.073779	7640.833416
75598	CRUDE	120	1787271000	86.219073	86.219073	86.134301	86.198530
75599	GOLD	120	1787271000	4582.310483	4583.584727	4581.574992	4581.788577
75600	DOW	120	1787271000	52754.221095	52768.819923	52751.160094	52761.558512
75601	VIX	120	1787271000	16.010873	16.017409	16.006783	16.010873
76448	CRUDE	120	1787271840	86.256869	86.270000	86.178287	86.206146
76449	GOLD	120	1787271840	4576.758698	4576.918990	4573.204861	4573.514399
76450	DOW	120	1787271840	52758.401987	52766.926103	52748.450771	52759.855877
76451	VIX	120	1787271840	16.011434	16.015209	16.004194	16.007722
76077	SP500	120	1787271480	7641.250541	7641.742736	7640.078779	7641.495755
76078	CRUDE	120	1787271480	86.276704	86.276704	86.220000	86.225714
76079	GOLD	120	1787271480	4577.156203	4578.976814	4575.713709	4576.196446
76080	DOW	120	1787271480	52757.201514	52764.785806	52754.590500	52762.311383
75837	SP500	120	1787271240	7640.063591	7642.724043	7639.848898	7641.114463
75957	SP500	120	1787271360	7640.865909	7641.962519	7639.958069	7641.071563
75838	CRUDE	120	1787271240	86.150051	86.260650	86.134979	86.260368
75839	GOLD	120	1787271240	4580.347813	4580.569738	4577.430665	4577.605430
75840	DOW	120	1787271240	52761.816002	52768.726372	52752.506223	52756.482636
75841	VIX	120	1787271240	16.010106	16.015985	16.002340	16.006220
76569	GOLD	120	1787271960	4573.562752	4574.501236	4571.780990	4574.429799
76570	DOW	120	1787271960	52757.891322	52768.139949	52750.135203	52760.264299
76571	VIX	120	1787271960	16.006647	16.016824	16.002428	16.006416
76081	VIX	120	1787271480	16.012194	16.014751	16.005136	16.010203
76447	SP500	120	1787271840	7641.051499	7641.728473	7640.134898	7640.809477
76322	SP500	120	1787271720	7641.550384	7642.139193	7640.114672	7641.310692
76323	CRUDE	120	1787271720	86.231773	86.259434	86.218359	86.258197
76324	GOLD	120	1787271720	4577.375033	4578.172879	4574.893414	4576.828255
76325	DOW	120	1787271720	52760.749844	52764.635596	52752.725569	52758.394595
76693	CRUDE	120	1787272080	86.162733	86.199205	86.151294	86.171483
76694	GOLD	120	1787272080	4574.501458	4575.900000	4574.054729	4574.614731
76695	DOW	120	1787272080	52758.939160	52767.831670	52752.122475	52761.542931
76567	SP500	120	1787271960	7640.570457	7642.061920	7639.727020	7641.466380
76568	CRUDE	120	1787271960	86.206966	86.208238	86.156947	86.161628
76816	VIX	120	1787272200	16.007776	16.017770	16.002013	16.007709
76936	VIX	120	1787272320	16.007977	16.015644	16.003307	16.008354
76812	SP500	120	1787272200	7642.043309	7642.519388	7639.852464	7640.588667
76696	VIX	120	1787272080	16.007577	16.014380	16.005802	16.007927
76813	CRUDE	120	1787272200	86.169960	86.177484	86.078415	86.137636
76692	SP500	120	1787272080	7641.637238	7642.329896	7640.493791	7642.329896
76814	GOLD	120	1787272200	4574.493100	4575.646466	4572.839678	4573.898123
76815	DOW	120	1787272200	52760.935899	52766.779020	52749.833652	52757.511591
77054	GOLD	120	1787272440	4575.488869	4575.990343	4573.998571	4574.862404
76932	SP500	120	1787272320	7640.891422	7642.055677	7640.053075	7640.303735
76933	CRUDE	120	1787272320	86.140541	86.146243	86.100000	86.107328
76934	GOLD	120	1787272320	4574.024057	4575.773226	4573.122778	4575.495600
76935	DOW	120	1787272320	52758.497473	52771.440025	52750.008813	52758.306271
77052	SP500	120	1787272440	7640.349871	7642.136027	7639.522496	7641.174884
77053	CRUDE	120	1787272440	86.105030	86.148385	86.072596	86.122334
77173	CRUDE	120	1787272560	86.119451	86.130964	86.107517	86.125950
77174	GOLD	120	1787272560	4574.749907	4577.574436	4574.532402	4575.939465
77175	DOW	120	1787272560	52755.711044	52767.928383	52748.932555	52757.510398
77176	VIX	120	1787272560	16.011459	16.013618	16.005823	16.012516
78033	CRUDE	120	1787273400	86.264675	86.311945	86.254247	86.305613
78034	GOLD	120	1787273400	4570.135162	4570.489932	4568.254164	4568.254164
78035	DOW	120	1787273400	52757.967460	52768.829176	52750.816029	52760.599420
78036	VIX	120	1787273400	16.011225	16.019657	16.006370	16.012003
77912	SP500	120	1787273280	7641.563754	7641.834374	7639.830601	7641.552111
77913	CRUDE	120	1787273280	86.259109	86.288985	86.257175	86.263697
77914	GOLD	120	1787273280	4570.236037	4570.725887	4568.600000	4570.054885
77915	DOW	120	1787273280	52762.097601	52768.606717	52749.169507	52756.037661
77916	VIX	120	1787273280	16.012271	16.014767	16.005819	16.009649
78531	VIX	120	1787273880	16.009702	16.018392	16.006965	16.012681
77667	SP500	120	1787273040	7641.708036	7643.486255	7640.706480	7641.046010
77542	SP500	120	1787272920	7641.422965	7642.060893	7640.096727	7641.552019
77543	CRUDE	120	1787272920	86.263072	86.280000	86.244575	86.249699
77544	GOLD	120	1787272920	4570.338064	4574.281049	4569.808557	4572.015009
77545	DOW	120	1787272920	52761.065493	52764.307053	52752.003773	52757.929391
77546	VIX	120	1787272920	16.009920	16.011314	16.002953	16.009108
77417	SP500	120	1787272800	7641.377417	7642.327475	7640.005533	7641.378027
77418	CRUDE	120	1787272800	86.186931	86.266144	86.161058	86.260485
77419	GOLD	120	1787272800	4570.264790	4572.240213	4568.957727	4570.409772
77420	DOW	120	1787272800	52757.714642	52769.990723	52752.376422	52759.596947
77421	VIX	120	1787272800	16.012534	16.014897	16.005894	16.011471
77055	DOW	120	1787272440	52757.472093	52773.617811	52753.690673	52756.809754
77056	VIX	120	1787272440	16.006910	16.019312	16.003525	16.009924
77668	CRUDE	120	1787273040	86.252855	86.289237	86.201117	86.233944
77669	GOLD	120	1787273040	4572.081537	4572.215055	4570.808201	4572.104339
77670	DOW	120	1787273040	52755.832089	52766.154411	52751.836363	52758.095970
77671	VIX	120	1787273040	16.009783	16.018210	16.004512	16.007771
77292	SP500	120	1787272680	7641.211772	7642.121089	7640.305414	7641.348148
77293	CRUDE	120	1787272680	86.128297	86.186677	86.073427	86.186677
77294	GOLD	120	1787272680	4576.024563	4576.132323	4570.319020	4570.319020
77295	DOW	120	1787272680	52757.110822	52764.279701	52752.861018	52756.663226
77296	VIX	120	1787272680	16.011608	16.014032	16.002875	16.011162
78157	SP500	120	1787273520	7640.771082	7642.094051	7639.946558	7640.944155
78158	CRUDE	120	1787273520	86.308938	86.324849	86.269436	86.293828
78159	GOLD	120	1787273520	4568.338472	4568.858332	4566.851228	4568.858332
78160	DOW	120	1787273520	52759.202156	52768.435562	52748.848785	52760.809425
78161	VIX	120	1787273520	16.010841	16.014847	16.006453	16.008724
77172	SP500	120	1787272560	7641.120193	7642.517942	7640.076281	7641.367962
77787	SP500	120	1787273160	7641.016206	7641.729344	7640.257550	7641.578499
77788	CRUDE	120	1787273160	86.234065	86.312573	86.232956	86.261728
77789	GOLD	120	1787273160	4572.275866	4572.275866	4568.865390	4570.336358
77790	DOW	120	1787273160	52756.533145	52766.936951	52752.278301	52760.850028
77791	VIX	120	1787273160	16.009024	16.013272	16.005303	16.012307
78774	GOLD	120	1787274120	4567.059929	4568.882425	4566.669956	4567.636878
78402	SP500	120	1787273760	7641.679386	7642.108678	7639.601699	7640.732366
78403	CRUDE	120	1787273760	86.309820	86.340473	86.293331	86.304311
78404	GOLD	120	1787273760	4569.319124	4570.162508	4566.523553	4567.312115
78405	DOW	120	1787273760	52762.996312	52769.254895	52751.072867	52751.856595
78406	VIX	120	1787273760	16.006647	16.013038	16.004452	16.009532
78775	DOW	120	1787274120	52766.481843	52767.481234	52751.048511	52762.995078
78776	VIX	120	1787274120	16.011868	16.018001	15.998883	16.007426
78647	SP500	120	1787274000	7641.287909	7642.751237	7640.430060	7641.176372
78648	CRUDE	120	1787274000	86.312802	86.426473	86.312802	86.382049
78649	GOLD	120	1787274000	4568.980996	4569.381059	4566.754331	4567.186072
78032	SP500	120	1787273400	7641.738463	7642.683298	7640.036896	7640.863531
78650	DOW	120	1787274000	52755.366413	52764.678142	52752.464516	52764.678142
78651	VIX	120	1787274000	16.012406	16.017445	16.002263	16.010518
78894	GOLD	120	1787274240	4567.800483	4568.485133	4566.742520	4567.621316
78277	SP500	120	1787273640	7640.647422	7643.049882	7640.175863	7641.504965
78278	CRUDE	120	1787273640	86.296659	86.320000	86.274559	86.311131
78279	GOLD	120	1787273640	4569.035868	4571.166856	4568.529650	4569.225819
78280	DOW	120	1787273640	52761.712114	52771.161450	52749.860913	52761.332771
78281	VIX	120	1787273640	16.009819	16.012605	16.004652	16.005361
78527	SP500	120	1787273880	7640.468695	7642.731805	7639.546094	7641.115214
78528	CRUDE	120	1787273880	86.304028	86.339178	86.286643	86.314740
78529	GOLD	120	1787273880	4567.261879	4569.206060	4567.037906	4568.937134
78530	DOW	120	1787273880	52751.335063	52765.258479	52748.078063	52753.297206
78895	DOW	120	1787274240	52763.808286	52769.833848	52754.108497	52754.891795
79269	GOLD	120	1787274600	4567.853284	4570.193637	4565.925980	4568.636892
78896	VIX	120	1787274240	16.007016	16.014762	16.005470	16.012146
79017	SP500	120	1787274360	7640.870357	7642.102751	7640.535856	7641.032843
78772	SP500	120	1787274120	7641.293082	7642.673228	7640.094600	7641.270059
78773	CRUDE	120	1787274120	86.385046	86.397178	86.363414	86.386795
79018	CRUDE	120	1787274360	86.415898	86.451723	86.407540	86.407540
78892	SP500	120	1787274240	7641.565655	7642.459633	7640.226782	7641.035018
78893	CRUDE	120	1787274240	86.389357	86.441315	86.380000	86.417966
79019	GOLD	120	1787274360	4567.543762	4567.711747	4566.700000	4566.873546
79020	DOW	120	1787274360	52754.193098	52763.369689	52753.243608	52761.129165
79021	VIX	120	1787274360	16.012233	16.015493	16.003745	16.006482
79142	SP500	120	1787274480	7641.018512	7642.245390	7640.267231	7640.565071
79143	CRUDE	120	1787274480	86.409567	86.417314	86.368948	86.382300
79144	GOLD	120	1787274480	4566.942295	4568.295924	4566.706424	4567.981272
79145	DOW	120	1787274480	52761.709685	52763.535222	52753.937406	52753.937406
79146	VIX	120	1787274480	16.007972	16.016412	16.004929	16.009118
79267	SP500	120	1787274600	7640.610579	7642.166401	7639.696103	7641.497075
79268	CRUDE	120	1787274600	86.382779	86.413644	86.310000	86.383052
80253	CRUDE	120	1787275560	86.549773	86.572384	86.514641	86.519938
80254	GOLD	120	1787275560	4580.161592	4583.284993	4579.634339	4581.860752
80255	DOW	120	1787275560	52760.876064	52767.473873	52754.349604	52757.592911
80256	VIX	120	1787275560	16.010193	16.014832	16.006698	16.011635
79387	SP500	120	1787274720	7641.288640	7642.356468	7639.972796	7641.969383
79388	CRUDE	120	1787274720	86.381165	86.434552	86.300000	86.305224
79389	GOLD	120	1787274720	4568.647420	4574.100000	4568.115988	4574.026537
79390	DOW	120	1787274720	52753.487492	52767.603894	52750.692835	52764.631216
79391	VIX	120	1787274720	16.006043	16.014043	16.003325	16.013472
80497	SP500	120	1787275800	7640.851544	7642.201173	7640.249471	7641.453649
80498	CRUDE	120	1787275800	86.618054	86.624195	86.505251	86.560377
80132	SP500	120	1787275440	7641.320552	7641.959665	7640.398335	7640.948376
80133	CRUDE	120	1787275440	86.569084	86.650000	86.550000	86.552785
80134	GOLD	120	1787275440	4575.736968	4580.600000	4575.579780	4580.278759
80135	DOW	120	1787275440	52764.521124	52768.607309	52754.769101	52761.866227
80136	VIX	120	1787275440	16.010746	16.016513	16.004060	16.011201
79757	SP500	120	1787275080	7640.789475	7642.393055	7640.328463	7641.327871
79758	CRUDE	120	1787275080	86.421390	86.470000	86.419981	86.460881
79759	GOLD	120	1787275080	4571.360668	4572.275748	4569.719240	4572.227769
79760	DOW	120	1787275080	52759.319225	52767.280365	52754.018627	52757.873912
79761	VIX	120	1787275080	16.009019	16.014728	16.005401	16.006494
79637	SP500	120	1787274960	7641.089151	7642.156995	7639.789201	7641.034775
79638	CRUDE	120	1787274960	86.335086	86.460000	86.331639	86.424489
79639	GOLD	120	1787274960	4571.295069	4572.534655	4569.911113	4571.441166
79640	DOW	120	1787274960	52750.774295	52764.628275	52749.002372	52759.647204
79641	VIX	120	1787274960	16.010886	16.016295	16.005959	16.010563
79270	DOW	120	1787274600	52754.724238	52770.570746	52750.185307	52754.118987
79271	VIX	120	1787274600	16.010184	16.014103	16.003940	16.007003
80499	GOLD	120	1787275800	4580.834246	4584.060845	4579.551014	4583.053992
80500	DOW	120	1787275800	52753.663713	52763.352340	52751.457473	52754.181292
80501	VIX	120	1787275800	16.007185	16.014350	16.005318	16.010473
79882	SP500	120	1787275200	7641.057452	7642.048026	7639.668727	7641.850120
79883	CRUDE	120	1787275200	86.457449	86.536606	86.450060	86.521167
79884	GOLD	120	1787275200	4572.210733	4572.431199	4568.881711	4569.909252
79885	DOW	120	1787275200	52757.440942	52765.090060	52747.196570	52758.185257
79886	VIX	120	1787275200	16.006638	16.020647	16.005350	16.012634
79512	SP500	120	1787274840	7642.091002	7642.443038	7639.845294	7640.787225
79513	CRUDE	120	1787274840	86.306390	86.335710	86.270000	86.331970
79514	GOLD	120	1787274840	4573.987701	4574.078444	4569.404768	4571.291810
79515	DOW	120	1787274840	52765.327842	52769.176542	52748.549785	52751.158077
79516	VIX	120	1787274840	16.013221	16.016258	16.003738	16.010191
80372	SP500	120	1787275680	7641.531555	7642.529627	7640.117684	7640.799078
80373	CRUDE	120	1787275680	86.522365	86.666286	86.519415	86.619259
80374	GOLD	120	1787275680	4581.836874	4581.851804	4579.838179	4580.986201
80375	DOW	120	1787275680	52759.656869	52768.729085	52748.944943	52755.448876
80376	VIX	120	1787275680	16.010407	16.017569	15.999788	16.008001
80007	SP500	120	1787275320	7641.988432	7642.098433	7639.784441	7641.137820
80008	CRUDE	120	1787275320	86.521159	86.571455	86.468192	86.567535
80009	GOLD	120	1787275320	4569.985793	4577.454804	4569.985793	4575.709131
80010	DOW	120	1787275320	52759.528743	52769.199029	52754.002334	52763.346335
80011	VIX	120	1787275320	16.013773	16.016809	16.007530	16.009899
80874	GOLD	120	1787276160	4583.384865	4587.432065	4581.866915	4587.329365
80875	DOW	120	1787276160	52758.057233	52767.303493	52755.533407	52755.533407
80876	VIX	120	1787276160	16.012517	16.013848	16.004425	16.011088
80747	SP500	120	1787276040	7641.638176	7642.559144	7639.994447	7641.017568
80748	CRUDE	120	1787276040	86.605423	86.644522	86.599608	86.635660
80749	GOLD	120	1787276040	4584.283914	4586.568430	4582.729011	4583.494377
80750	DOW	120	1787276040	52761.247219	52768.175479	52751.648868	52757.785942
80751	VIX	120	1787276040	16.007782	16.015361	16.004755	16.011250
80622	SP500	120	1787275920	7641.708956	7642.413469	7639.587328	7641.563336
80252	SP500	120	1787275560	7640.798420	7642.650433	7640.537923	7641.605797
80623	CRUDE	120	1787275920	86.557784	86.622429	86.557784	86.602021
80624	GOLD	120	1787275920	4583.011750	4584.143107	4581.259699	4584.115637
80625	DOW	120	1787275920	52752.869609	52770.040506	52750.046709	52760.341165
80626	VIX	120	1787275920	16.011782	16.017457	16.003613	16.009379
81242	SP500	120	1787276520	7641.291280	7642.853325	7639.942210	7641.756754
81243	CRUDE	120	1787276520	86.557871	86.621914	86.557871	86.604343
80997	SP500	120	1787276280	7642.408193	7642.658244	7639.798190	7640.906005
80998	CRUDE	120	1787276280	86.639294	86.683333	86.588881	86.588881
80999	GOLD	120	1787276280	4587.189332	4587.507140	4585.029415	4586.983482
81000	DOW	120	1787276280	52756.193285	52765.542753	52753.569641	52758.963679
81001	VIX	120	1787276280	16.011280	16.018357	16.008032	16.010876
80872	SP500	120	1787276160	7640.946595	7642.159269	7639.190877	7642.159269
80873	CRUDE	120	1787276160	86.635384	86.682613	86.635384	86.640394
81244	GOLD	120	1787276520	4589.869217	4593.421345	4589.092936	4592.211378
81245	DOW	120	1787276520	52762.550043	52764.713693	52750.142349	52757.083640
81246	VIX	120	1787276520	16.012689	16.016945	16.006838	16.007904
81117	SP500	120	1787276400	7641.018329	7642.423907	7640.053498	7641.356251
81118	CRUDE	120	1787276400	86.592025	86.592025	86.548340	86.557282
81119	GOLD	120	1787276400	4586.990222	4591.296795	4584.903881	4589.806326
81120	DOW	120	1787276400	52759.804927	52763.315214	52748.705072	52761.432559
81121	VIX	120	1787276400	16.010536	16.014636	16.004937	16.013147
81367	SP500	120	1787276640	7641.726696	7642.321524	7640.292910	7640.868687
81368	CRUDE	120	1787276640	86.604054	86.634953	86.574160	86.629727
81369	GOLD	120	1787276640	4592.183686	4594.843350	4592.072652	4594.406356
81370	DOW	120	1787276640	52756.955086	52765.000222	52755.533627	52761.272502
81371	VIX	120	1787276640	16.007390	16.014939	16.006185	16.011417
81492	SP500	120	1787276760	7640.993523	7642.188464	7639.866818	7641.015662
81493	CRUDE	120	1787276760	86.632213	86.702920	86.632213	86.668348
81494	GOLD	120	1787276760	4594.350093	4595.600000	4591.172057	4592.363211
82114	GOLD	120	1787277360	4583.305221	4587.770585	4582.878658	4587.770585
81617	SP500	120	1787276880	7640.886860	7642.370404	7640.351883	7640.624195
81618	CRUDE	120	1787276880	86.667199	86.715013	86.647581	86.715013
81619	GOLD	120	1787276880	4592.372828	4592.372828	4583.021726	4584.541515
81620	DOW	120	1787276880	52754.963248	52765.299681	52752.314967	52762.849546
81621	VIX	120	1787276880	16.006824	16.015201	16.003679	16.012180
82115	DOW	120	1787277360	52757.609791	52765.402697	52751.143253	52759.828900
82116	VIX	120	1787277360	16.011623	16.015642	16.001764	16.009970
82612	SP500	120	1787277840	7640.760692	7641.759796	7639.683077	7640.921526
82613	CRUDE	120	1787277840	86.693620	86.701723	86.624727	86.654656
82614	GOLD	120	1787277840	4583.731940	4583.985794	4581.855323	4583.541747
82615	DOW	120	1787277840	52759.310483	52770.643438	52746.906820	52754.457590
82616	VIX	120	1787277840	16.009343	16.013082	16.002145	16.009114
81742	SP500	120	1787277000	7640.395807	7642.279423	7639.785675	7641.021190
81743	CRUDE	120	1787277000	86.711813	86.794618	86.664946	86.749897
81744	GOLD	120	1787277000	4584.677519	4585.128404	4580.015575	4581.856657
81745	DOW	120	1787277000	52761.603687	52767.400846	52750.178287	52761.426343
81746	VIX	120	1787277000	16.012070	16.013635	16.002832	16.011381
82987	SP500	120	1787278200	7641.562616	7642.514217	7640.612487	7641.178986
82237	SP500	120	1787277480	7641.073275	7642.485757	7640.367749	7641.739232
82238	CRUDE	120	1787277480	86.849502	86.868025	86.818619	86.868025
82239	GOLD	120	1787277480	4587.936689	4588.842362	4586.542297	4587.360048
82240	DOW	120	1787277480	52760.306360	52764.611258	52750.126601	52758.539130
82241	VIX	120	1787277480	16.008790	16.013065	16.000595	16.010913
81495	DOW	120	1787276760	52759.921253	52767.868666	52752.394162	52756.662427
81496	VIX	120	1787276760	16.010478	16.014219	16.003589	16.007154
82988	CRUDE	120	1787278200	86.719030	86.790000	86.717367	86.761762
82989	GOLD	120	1787278200	4587.271225	4587.658485	4585.255627	4585.799998
82990	DOW	120	1787278200	52753.190699	52769.718232	52748.595840	52759.251342
82991	VIX	120	1787278200	16.008904	16.016036	16.001571	16.012081
82862	SP500	120	1787278080	7640.658407	7641.531650	7640.110702	7641.281286
82863	CRUDE	120	1787278080	86.675897	86.723053	86.645864	86.717191
82864	GOLD	120	1787278080	4586.526708	4587.139830	4585.029359	4587.139830
82865	DOW	120	1787278080	52760.039661	52769.451324	52748.370454	52754.056393
82866	VIX	120	1787278080	16.012099	16.015620	16.004526	16.009336
82487	SP500	120	1787277720	7641.181228	7642.216577	7639.701832	7640.890464
82488	CRUDE	120	1787277720	86.758233	86.758233	86.674306	86.694042
82489	GOLD	120	1787277720	4583.389291	4584.137476	4581.785378	4583.594168
82490	DOW	120	1787277720	52760.471857	52768.497872	52752.457737	52759.283854
82491	VIX	120	1787277720	16.014939	16.016805	16.004898	16.010363
81987	SP500	120	1787277240	7641.214581	7642.246540	7640.029830	7641.239191
81988	CRUDE	120	1787277240	86.741364	86.925544	86.738154	86.916590
81989	GOLD	120	1787277240	4582.400899	4584.799663	4582.247789	4583.222086
81990	DOW	120	1787277240	52758.117671	52768.311804	52753.988405	52758.230584
81991	VIX	120	1787277240	16.012698	16.014278	16.005818	16.011821
82362	SP500	120	1787277600	7641.507737	7642.042350	7639.887983	7640.989184
82363	CRUDE	120	1787277600	86.868171	86.890000	86.753263	86.756625
82364	GOLD	120	1787277600	4587.215561	4588.359600	4583.300000	4583.548031
81867	SP500	120	1787277120	7640.744813	7642.305681	7640.007253	7641.381688
82365	DOW	120	1787277600	52760.284746	52767.926029	52750.992056	52759.807784
81868	CRUDE	120	1787277120	86.747650	86.788578	86.713266	86.742261
81869	GOLD	120	1787277120	4581.810274	4582.914560	4580.957799	4582.368963
81870	DOW	120	1787277120	52763.529501	52765.732249	52753.472937	52758.585147
81871	VIX	120	1787277120	16.010881	16.020121	16.008219	16.012529
82366	VIX	120	1787277600	16.009576	16.016874	16.003562	16.015410
82112	SP500	120	1787277360	7641.422614	7641.958225	7639.596094	7641.194231
82113	CRUDE	120	1787277360	86.917065	86.925094	86.836236	86.849876
83487	SP500	120	1787278680	7641.752861	7642.576560	7640.033187	7640.597347
83488	CRUDE	120	1787278680	86.755146	86.766941	86.737418	86.740902
83489	GOLD	120	1787278680	4577.896543	4580.400000	4577.708966	4579.838133
83490	DOW	120	1787278680	52758.202500	52769.157743	52749.311707	52759.429399
82737	SP500	120	1787277960	7640.736955	7642.637757	7640.454561	7640.851955
82738	CRUDE	120	1787277960	86.655137	86.690000	86.643322	86.674126
83237	SP500	120	1787278440	7640.967556	7641.784679	7640.449332	7641.302522
83238	CRUDE	120	1787278440	86.734622	86.780382	86.717759	86.758282
83239	GOLD	120	1787278440	4582.085921	4582.451376	4577.846239	4578.660367
83240	DOW	120	1787278440	52757.679579	52766.472165	52750.967919	52758.412152
83112	SP500	120	1787278320	7641.437865	7642.599726	7640.404747	7640.967065
82739	GOLD	120	1787277960	4583.610343	4586.402208	4583.289710	4586.402208
82740	DOW	120	1787277960	52755.664100	52768.262335	52752.952682	52758.049145
82741	VIX	120	1787277960	16.010583	16.016079	16.004538	16.012194
83113	CRUDE	120	1787278320	86.763504	86.792897	86.720000	86.732819
83241	VIX	120	1787278440	16.015654	16.017975	16.003979	16.010726
83491	VIX	120	1787278680	16.006118	16.014489	16.004762	16.007559
83362	SP500	120	1787278560	7641.249451	7642.413947	7640.211331	7641.514034
83363	CRUDE	120	1787278560	86.754856	86.792449	86.744266	86.758485
83114	GOLD	120	1787278320	4585.700326	4586.578420	4581.900000	4582.244059
83115	DOW	120	1787278320	52759.969329	52764.169259	52752.130771	52758.200059
83116	VIX	120	1787278320	16.010705	16.014588	16.005492	16.014588
83364	GOLD	120	1787278560	4578.763126	4580.462654	4577.254601	4577.770875
83365	DOW	120	1787278560	52758.014424	52766.357884	52748.408714	52760.078255
83366	VIX	120	1787278560	16.010155	16.015048	16.005136	16.005879
83612	SP500	120	1787278800	7640.300478	7643.020933	7639.469027	7640.347914
83613	CRUDE	120	1787278800	86.740857	86.782226	86.717108	86.718331
83614	GOLD	120	1787278800	4579.890245	4580.312552	4574.976235	4576.809425
83615	DOW	120	1787278800	52761.493509	52765.388376	52750.875190	52757.069021
83616	VIX	120	1787278800	16.008931	16.017039	16.001173	16.008663
83737	SP500	120	1787278920	7640.303919	7642.033245	7639.821577	7641.285527
83738	CRUDE	120	1787278920	86.717545	86.723465	86.677207	86.687076
83739	GOLD	120	1787278920	4576.644751	4577.614217	4574.189773	4577.614217
85737	SP500	120	1787280840	7641.022520	7643.171235	7640.660833	7641.463973
85112	SP500	120	1787280240	7641.535018	7641.933977	7639.925331	7641.737579
85113	CRUDE	120	1787280240	86.612562	86.712205	86.575619	86.708711
85114	GOLD	120	1787280240	4582.370738	4584.339779	4581.909058	4584.083523
85115	DOW	120	1787280240	52757.007911	52774.360750	52753.514598	52754.164023
83862	SP500	120	1787279040	7641.556415	7642.429869	7639.841550	7640.434490
83863	CRUDE	120	1787279040	86.684437	86.780657	86.680159	86.750030
83864	GOLD	120	1787279040	4577.554788	4578.367945	4575.414996	4577.043408
83865	DOW	120	1787279040	52760.548282	52766.979676	52754.107714	52758.135506
83866	VIX	120	1787279040	16.010837	16.012697	16.003585	16.006390
85116	VIX	120	1787280240	16.009164	16.015593	16.002263	16.007150
85487	SP500	120	1787280600	7641.553814	7642.145999	7639.941925	7641.943192
85362	SP500	120	1787280480	7642.135086	7642.771536	7640.451771	7641.401337
85363	CRUDE	120	1787280480	86.658778	86.740600	86.655727	86.715887
85364	GOLD	120	1787280480	4583.104987	4588.000250	4582.940049	4587.996266
84742	SP500	120	1787279880	7642.069484	7642.363640	7640.457917	7641.021869
84743	CRUDE	120	1787279880	86.682132	86.755780	86.677511	86.749270
84744	GOLD	120	1787279880	4584.519199	4584.752895	4581.796765	4582.662198
84745	DOW	120	1787279880	52757.755893	52767.858114	52748.164901	52757.250306
84746	VIX	120	1787279880	16.012613	16.015966	16.004044	16.012381
84232	SP500	120	1787279400	7640.659632	7641.899594	7639.715977	7641.682585
84233	CRUDE	120	1787279400	86.735885	86.743432	86.699285	86.722605
84234	GOLD	120	1787279400	4578.466819	4579.783783	4577.808322	4578.751425
84235	DOW	120	1787279400	52763.216329	52772.704973	52751.208717	52760.207698
84236	VIX	120	1787279400	16.009585	16.016319	16.007194	16.007984
84107	SP500	120	1787279280	7640.625158	7642.377969	7640.360441	7640.624946
84108	CRUDE	120	1787279280	86.748875	86.757286	86.730000	86.735376
84109	GOLD	120	1787279280	4577.339375	4578.602718	4576.229599	4578.448396
84110	DOW	120	1787279280	52757.911587	52771.938652	52752.860518	52761.240864
84111	VIX	120	1787279280	16.010945	16.016372	16.003909	16.008369
83740	DOW	120	1787278920	52758.530586	52761.467257	52750.563827	52759.870357
83741	VIX	120	1787278920	16.008721	16.016082	16.002436	16.011383
85365	DOW	120	1787280480	52763.909595	52765.953087	52751.283739	52759.615076
83987	SP500	120	1787279160	7640.170845	7642.170329	7640.157674	7640.812468
83988	CRUDE	120	1787279160	86.747079	86.774872	86.737120	86.749506
83989	GOLD	120	1787279160	4577.195304	4578.403611	4576.246508	4577.199179
83990	DOW	120	1787279160	52758.318490	52768.168417	52751.211683	52758.865651
83991	VIX	120	1787279160	16.007259	16.017535	16.005525	16.011538
84357	SP500	120	1787279520	7641.384206	7642.300617	7639.227445	7641.425820
84358	CRUDE	120	1787279520	86.720176	86.744515	86.649209	86.650690
84359	GOLD	120	1787279520	4578.744741	4582.851108	4578.345499	4582.739576
84360	DOW	120	1787279520	52758.804931	52764.796767	52752.893290	52757.511199
84361	VIX	120	1787279520	16.008689	16.017895	16.000438	16.006997
84607	SP500	120	1787279760	7641.272367	7642.052800	7640.035958	7641.917169
84608	CRUDE	120	1787279760	86.667131	86.701596	86.661236	86.681549
84609	GOLD	120	1787279760	4584.209651	4585.516251	4583.938639	4584.385681
84610	DOW	120	1787279760	52755.820148	52766.075265	52750.673269	52756.895044
84611	VIX	120	1787279760	16.010061	16.016853	16.005575	16.012504
84987	SP500	120	1787280120	7641.768285	7641.768285	7639.265306	7641.252882
84988	CRUDE	120	1787280120	86.611342	86.630000	86.590000	86.614901
84989	GOLD	120	1787280120	4585.125064	4586.291174	4581.964159	4582.442823
84990	DOW	120	1787280120	52756.821171	52769.389425	52753.181038	52758.794076
84482	SP500	120	1787279640	7641.511114	7641.868994	7639.476753	7641.224387
84483	CRUDE	120	1787279640	86.649207	86.682781	86.637470	86.668333
84484	GOLD	120	1787279640	4582.587741	4584.735140	4582.155685	4584.378578
84485	DOW	120	1787279640	52757.430588	52766.426077	52749.443661	52754.930563
84486	VIX	120	1787279640	16.007293	16.014399	16.004935	16.010943
84991	VIX	120	1787280120	16.010956	16.017023	16.005440	16.007746
84862	SP500	120	1787280000	7641.257732	7642.176901	7640.198702	7642.021481
84863	CRUDE	120	1787280000	86.749498	86.765531	86.599566	86.609421
84864	GOLD	120	1787280000	4582.598748	4585.942917	4581.755851	4585.243205
84865	DOW	120	1787280000	52757.509864	52767.059461	52755.073229	52758.529689
84866	VIX	120	1787280000	16.013495	16.016262	16.006463	16.011901
85366	VIX	120	1787280480	16.003611	16.017596	16.002778	16.010046
85488	CRUDE	120	1787280600	86.718774	86.722506	86.672705	86.720064
85489	GOLD	120	1787280600	4587.871053	4589.619434	4586.532799	4587.934602
85490	DOW	120	1787280600	52757.516264	52766.985111	52753.965307	52760.844663
85491	VIX	120	1787280600	16.009184	16.018251	16.005944	16.012518
85237	SP500	120	1787280360	7641.929044	7642.709926	7640.152742	7642.088259
85738	CRUDE	120	1787280840	86.664101	86.721086	86.564864	86.613538
85739	GOLD	120	1787280840	4592.135358	4595.778815	4590.686425	4590.766001
85740	DOW	120	1787280840	52760.511351	52768.930382	52756.169658	52763.268877
85238	CRUDE	120	1787280360	86.707842	86.718513	86.604170	86.658008
85239	GOLD	120	1787280360	4584.047059	4584.963822	4582.298732	4582.980326
85240	DOW	120	1787280360	52753.371911	52766.613404	52750.690848	52765.285567
85241	VIX	120	1787280360	16.008465	16.016333	16.002043	16.002043
85741	VIX	120	1787280840	16.007564	16.017107	16.001349	16.010635
85612	SP500	120	1787280720	7642.023752	7642.307473	7639.275381	7641.290863
85613	CRUDE	120	1787280720	86.722950	86.741360	86.662365	86.666726
85614	GOLD	120	1787280720	4588.070769	4592.087697	4588.070769	4591.953573
85615	DOW	120	1787280720	52762.853454	52766.462280	52751.489693	52759.548357
85616	VIX	120	1787280720	16.012710	16.014405	16.004242	16.007790
85862	SP500	120	1787280960	7641.265473	7642.092558	7639.314942	7640.355655
85863	CRUDE	120	1787280960	86.612282	86.657813	86.612282	86.657360
85864	GOLD	120	1787280960	4590.906774	4593.364380	4590.813995	4592.385584
85865	DOW	120	1787280960	52761.269087	52765.684779	52750.319793	52765.684779
85866	VIX	120	1787280960	16.010624	16.014023	16.004544	16.004544
85987	SP500	120	1787281080	7640.126367	7642.322122	7639.627403	7640.611102
85988	CRUDE	120	1787281080	86.658809	86.668226	86.620000	86.624450
85989	GOLD	120	1787281080	4592.240321	4595.156593	4592.037658	4594.745579
86970	DOW	120	1787282040	52754.390694	52767.886575	52752.791646	52757.439579
86112	SP500	120	1787281200	7640.743125	7642.204343	7640.104364	7641.989038
86113	CRUDE	120	1787281200	86.626033	86.686227	86.617371	86.622296
86114	GOLD	120	1787281200	4594.833280	4595.262209	4591.699307	4594.760964
86115	DOW	120	1787281200	52754.363845	52771.207628	52750.514313	52763.193452
86116	VIX	120	1787281200	16.009417	16.012527	16.004238	16.008736
86971	VIX	120	1787282040	16.010415	16.017868	16.003160	16.010769
86847	SP500	120	1787281920	7641.996399	7642.126520	7640.281136	7641.405044
86848	CRUDE	120	1787281920	86.546318	86.547668	86.404811	86.426539
86849	GOLD	120	1787281920	4591.215543	4594.200000	4590.208231	4593.198871
86850	DOW	120	1787281920	52757.624808	52764.693419	52750.832255	52754.038949
86851	VIX	120	1787281920	16.007776	16.012809	16.005126	16.009738
87219	GOLD	120	1787282280	4590.942431	4592.115118	4589.207600	4590.891596
87220	DOW	120	1787282280	52755.527710	52767.070669	52745.536101	52762.776088
87221	VIX	120	1787282280	16.009418	16.017528	16.006426	16.013215
86607	SP500	120	1787281680	7641.799563	7642.299234	7639.447515	7642.299234
86482	SP500	120	1787281560	7641.232376	7641.987879	7640.243373	7641.534259
86483	CRUDE	120	1787281560	86.559641	86.560967	86.507131	86.537389
86484	GOLD	120	1787281560	4595.625172	4595.652202	4593.201042	4594.620178
86485	DOW	120	1787281560	52757.133727	52765.115166	52754.761591	52759.654176
86486	VIX	120	1787281560	16.008925	16.016543	16.003202	16.007223
86357	SP500	120	1787281440	7641.633784	7641.979942	7640.151320	7641.151396
86358	CRUDE	120	1787281440	86.559397	86.589362	86.549098	86.559742
86359	GOLD	120	1787281440	4595.407424	4597.343465	4594.970460	4595.632852
86360	DOW	120	1787281440	52757.247812	52766.950278	52752.719771	52755.535191
86361	VIX	120	1787281440	16.008640	16.016314	16.001662	16.008578
85990	DOW	120	1787281080	52765.277489	52767.628995	52753.075798	52753.075798
85991	VIX	120	1787281080	16.003497	16.019350	16.000961	16.010515
86608	CRUDE	120	1787281680	86.536680	86.536680	86.490951	86.505772
86609	GOLD	120	1787281680	4594.667734	4594.850823	4589.078112	4590.248694
86610	DOW	120	1787281680	52758.526442	52763.647929	52752.490929	52758.911703
86611	VIX	120	1787281680	16.006972	16.014311	16.004455	16.008214
86232	SP500	120	1787281320	7641.843696	7642.382237	7640.094433	7641.596288
86233	CRUDE	120	1787281320	86.624736	86.627996	86.543955	86.561397
86234	GOLD	120	1787281320	4594.638820	4599.319943	4594.600944	4595.362522
86235	DOW	120	1787281320	52764.520506	52768.644443	52749.376171	52757.810004
86236	VIX	120	1787281320	16.010238	16.015940	16.006550	16.009155
87092	SP500	120	1787282160	7640.747335	7641.995588	7639.752015	7641.243288
87093	CRUDE	120	1787282160	86.482509	86.533093	86.472366	86.521612
87094	GOLD	120	1787282160	4590.597233	4591.305956	4588.398206	4590.861309
87095	DOW	120	1787282160	52759.313212	52763.269155	52751.502916	52756.248392
87096	VIX	120	1787282160	16.012189	16.017612	16.004129	16.010843
86727	SP500	120	1787281800	7642.437122	7642.437122	7640.481954	7642.182594
86728	CRUDE	120	1787281800	86.504728	86.545944	86.491766	86.545944
86729	GOLD	120	1787281800	4590.148067	4591.602376	4589.135814	4591.382015
86730	DOW	120	1787281800	52758.695603	52771.669792	52752.424546	52757.326151
86731	VIX	120	1787281800	16.009416	16.015462	16.002960	16.008165
87713	CRUDE	120	1787282760	86.452580	86.484583	86.446402	86.449734
87714	GOLD	120	1787282760	4588.835258	4590.546763	4588.766500	4589.773582
87715	DOW	120	1787282760	52761.213788	52765.708513	52750.553589	52761.880888
87467	SP500	120	1787282520	7641.504079	7642.591978	7640.103878	7641.786555
87468	CRUDE	120	1787282520	86.455937	86.468540	86.427409	86.436276
87469	GOLD	120	1787282520	4592.446934	4592.744804	4590.357423	4590.659503
87470	DOW	120	1787282520	52762.090740	52771.018455	52744.346524	52758.036926
87471	VIX	120	1787282520	16.015951	16.017787	16.001080	16.017787
87342	SP500	120	1787282400	7640.267366	7642.062201	7639.835720	7641.716148
87343	CRUDE	120	1787282400	86.458318	86.521543	86.450000	86.453826
87344	GOLD	120	1787282400	4591.056001	4593.021744	4589.381617	4592.472232
87345	DOW	120	1787282400	52764.025839	52766.147666	52754.038421	52762.125395
86967	SP500	120	1787282040	7641.223647	7642.444700	7640.541943	7640.937216
86968	CRUDE	120	1787282040	86.427433	86.530000	86.423982	86.480203
86969	GOLD	120	1787282040	4593.019290	4593.019290	4589.025530	4590.448358
87346	VIX	120	1787282400	16.011968	16.017039	16.004645	16.015807
87716	VIX	120	1787282760	16.012416	16.014867	16.005555	16.013283
87592	SP500	120	1787282640	7641.618230	7642.161090	7640.274496	7641.863567
87593	CRUDE	120	1787282640	86.435626	86.453539	86.398625	86.453118
87217	SP500	120	1787282280	7640.963985	7642.060060	7640.190560	7640.463310
87218	CRUDE	120	1787282280	86.522969	86.541002	86.450000	86.456421
87594	GOLD	120	1787282640	4590.572914	4591.380650	4588.031322	4588.852256
87595	DOW	120	1787282640	52759.393777	52770.969431	52746.088677	52762.400805
87596	VIX	120	1787282640	16.019250	16.019621	16.004699	16.012902
87832	SP500	120	1787282880	7641.394958	7642.251859	7640.096106	7641.512481
88204	GOLD	120	1787283240	4591.273336	4591.392835	4588.853950	4588.853950
87952	SP500	120	1787283000	7641.342907	7642.809377	7639.927405	7640.441925
87833	CRUDE	120	1787282880	86.449252	86.510000	86.435793	86.507295
87834	GOLD	120	1787282880	4589.800758	4591.077134	4589.300000	4589.491382
87835	DOW	120	1787282880	52762.453965	52765.002447	52751.525780	52760.542581
87712	SP500	120	1787282760	7641.780132	7642.268741	7640.254493	7641.292984
87836	VIX	120	1787282880	16.012384	16.015278	16.004565	16.008314
87953	CRUDE	120	1787283000	86.506155	86.521383	86.480000	86.498516
87954	GOLD	120	1787283000	4589.496183	4590.727100	4588.710088	4589.822982
87955	DOW	120	1787283000	52761.824539	52763.884315	52747.907768	52762.295652
87956	VIX	120	1787283000	16.007293	16.014454	16.006107	16.006293
88077	SP500	120	1787283120	7640.326284	7642.103539	7640.005016	7641.764950
88078	CRUDE	120	1787283120	86.497673	86.506579	86.460689	86.483670
88079	GOLD	120	1787283120	4589.645261	4591.211711	4589.262080	4591.211711
88080	DOW	120	1787283120	52763.337023	52765.799531	52753.043880	52761.120171
88081	VIX	120	1787283120	16.006201	16.017017	16.004218	16.011369
88202	SP500	120	1787283240	7641.868237	7642.286463	7640.493621	7641.140588
88203	CRUDE	120	1787283240	86.486690	86.521775	86.450675	86.450675
88323	CRUDE	120	1787283360	86.448640	86.465446	86.403639	86.410616
88324	GOLD	120	1787283360	4588.940410	4590.250161	4587.841652	4588.436320
88325	DOW	120	1787283360	52755.355673	52773.906429	52752.098202	52757.371664
88326	VIX	120	1787283360	16.010013	16.015527	16.001199	16.006334
89183	CRUDE	120	1787284200	86.462606	86.521393	86.458810	86.515897
89184	GOLD	120	1787284200	4584.939100	4585.548527	4582.502274	4583.837975
89185	DOW	120	1787284200	52758.485564	52763.205449	52753.508346	52754.757109
89186	VIX	120	1787284200	16.013273	16.015874	16.002847	16.010722
89057	SP500	120	1787284080	7640.210699	7642.593515	7640.089924	7641.230282
89058	CRUDE	120	1787284080	86.527834	86.530426	86.462639	86.462639
89059	GOLD	120	1787284080	4587.032392	4588.084787	4584.874834	4584.905019
89060	DOW	120	1787284080	52761.264748	52771.313396	52752.068710	52758.907689
89061	VIX	120	1787284080	16.007047	16.020550	16.001090	16.013023
88687	SP500	120	1787283720	7642.282379	7642.282379	7639.745111	7640.824514
88688	CRUDE	120	1787283720	86.476720	86.489171	86.458688	86.476879
88689	GOLD	120	1787283720	4587.692007	4591.893715	4587.582230	4590.433783
88690	DOW	120	1787283720	52764.487300	52768.990447	52750.099494	52767.132658
88691	VIX	120	1787283720	16.002087	16.017384	16.001132	16.014813
88567	SP500	120	1787283600	7642.298305	7643.051509	7640.015656	7642.146492
88568	CRUDE	120	1787283600	86.376113	86.483128	86.366135	86.475825
88569	GOLD	120	1787283600	4586.201456	4588.629733	4585.687487	4587.558016
88570	DOW	120	1787283600	52758.652698	52765.587453	52754.938430	52763.496990
88571	VIX	120	1787283600	16.013211	16.015590	16.000805	16.000805
88205	DOW	120	1787283240	52759.508073	52766.114880	52751.170684	52753.799647
88206	VIX	120	1787283240	16.011096	16.013023	16.004983	16.008426
88807	SP500	120	1787283840	7640.734878	7642.937189	7639.312311	7640.514976
88808	CRUDE	120	1787283840	86.474610	86.498946	86.460973	86.485734
88809	GOLD	120	1787283840	4590.379120	4591.778794	4589.506556	4590.411282
88810	DOW	120	1787283840	52769.022876	52769.595125	52746.704033	52756.931419
88811	VIX	120	1787283840	16.014616	16.017645	16.002877	16.011172
88442	SP500	120	1787283480	7641.297271	7642.561482	7639.692159	7642.561482
88443	CRUDE	120	1787283480	86.413345	86.414279	86.341325	86.376682
88444	GOLD	120	1787283480	4588.369813	4589.102913	4586.119534	4586.119534
88445	DOW	120	1787283480	52756.853759	52767.901599	52751.986142	52758.980441
88446	VIX	120	1787283480	16.005461	16.014910	16.003666	16.012241
89979	GOLD	120	1787284680	4586.700000	4590.218468	4585.969154	4588.174970
89980	DOW	120	1787284680	52759.210000	52768.253775	52750.157324	52759.916351
89981	VIX	120	1787284680	16.010000	16.017653	16.000371	16.008516
90742	SP500	120	1787285160	7640.384385	7642.127900	7640.342776	7641.990029
90743	CRUDE	120	1787285160	86.538990	86.545842	86.475205	86.483246
88932	SP500	120	1787283960	7640.666557	7642.444122	7640.134877	7640.435350
88933	CRUDE	120	1787283960	86.484126	86.534604	86.480405	86.526323
88934	GOLD	120	1787283960	4590.413650	4590.413650	4586.857359	4586.928049
88935	DOW	120	1787283960	52757.931337	52768.115694	52751.692424	52763.341022
88936	VIX	120	1787283960	16.012766	16.015488	16.004247	16.006215
88322	SP500	120	1787283360	7641.091675	7642.002375	7639.584764	7641.249312
89547	SP500	120	1787284440	7641.160000	7642.451877	7639.353714	7642.043914
89548	CRUDE	120	1787284440	86.550000	86.557059	86.504005	86.528115
89549	GOLD	120	1787284440	4584.800000	4586.115395	4583.795233	4585.280044
89550	DOW	120	1787284440	52759.210000	52774.342733	52749.901549	52758.898394
89551	VIX	120	1787284440	16.010000	16.017892	16.004767	16.008147
89307	SP500	120	1787284320	7640.204471	7641.924608	7639.970522	7641.821759
89308	CRUDE	120	1787284320	86.515973	86.565208	86.506860	86.546055
89309	GOLD	120	1787284320	4583.913938	4585.549859	4582.836815	4584.972054
89310	DOW	120	1787284320	52754.642731	52764.607602	52750.070154	52756.890689
89311	VIX	120	1787284320	16.010765	16.017382	16.003291	16.006119
90212	SP500	120	1787284800	7641.336911	7642.121488	7639.926723	7641.927307
90213	CRUDE	120	1787284800	86.568646	86.607859	86.566197	86.593783
89182	SP500	120	1787284200	7641.479759	7642.204392	7639.744560	7640.355160
90214	GOLD	120	1787284800	4587.174129	4588.856666	4586.584538	4588.169786
89797	SP500	120	1787284560	7641.160000	7642.327856	7639.428215	7641.494902
89798	CRUDE	120	1787284560	86.530000	86.541084	86.515696	86.524045
89799	GOLD	120	1787284560	4584.400000	4587.121767	4583.304491	4587.019582
89800	DOW	120	1787284560	52759.210000	52764.780725	52749.830272	52760.411622
89801	VIX	120	1787284560	16.010000	16.015656	16.002221	16.007871
90744	GOLD	120	1787285160	4589.540725	4590.049849	4588.096220	4589.557484
90745	DOW	120	1787285160	52759.252845	52767.243680	52753.603379	52758.704621
90462	SP500	120	1787284920	7641.309865	7642.423745	7640.387891	7640.387891
90463	CRUDE	120	1787284920	86.566878	86.580098	86.548211	86.574865
89977	SP500	120	1787284680	7641.160000	7641.999701	7639.722917	7641.372207
90464	GOLD	120	1787284920	4588.199722	4589.579245	4587.131330	4588.353230
89978	CRUDE	120	1787284680	86.540000	86.580000	86.529393	86.551271
90215	DOW	120	1787284800	52759.504592	52765.793795	52751.534772	52761.339806
90216	VIX	120	1787284800	16.004639	16.020450	16.000743	16.019551
90746	VIX	120	1787285160	16.011694	16.016688	16.003284	16.014722
90617	SP500	120	1787285040	7640.613769	7641.432055	7639.905387	7640.471060
90618	CRUDE	120	1787285040	86.573739	86.575764	86.535808	86.536202
90465	DOW	120	1787284920	52758.334882	52767.354747	52749.669874	52756.503832
90466	VIX	120	1787284920	16.004271	16.015283	16.004169	16.012880
90619	GOLD	120	1787285040	4588.467222	4589.715921	4588.062987	4589.501012
90620	DOW	120	1787285040	52755.269026	52770.398902	52754.536380	52761.226941
90621	VIX	120	1787285040	16.012454	16.014767	16.000749	16.012160
90867	SP500	120	1787285280	7642.195759	7642.770858	7640.186318	7641.417367
90868	CRUDE	120	1787285280	86.484416	86.494667	86.465436	86.476666
90869	GOLD	120	1787285280	4589.572656	4592.063332	4588.858728	4592.063332
90870	DOW	120	1787285280	52759.113598	52766.687669	52753.819552	52755.542479
90871	VIX	120	1787285280	16.015060	16.016721	16.005589	16.008809
90992	SP500	120	1787285400	7641.640408	7642.302979	7640.656021	7640.916377
90993	CRUDE	120	1787285400	86.476469	86.516230	86.436230	86.444316
90994	GOLD	120	1787285400	4592.077696	4594.034146	4591.063518	4593.320422
91117	SP500	120	1787285520	7640.787440	7642.023412	7639.382887	7640.585328
91118	CRUDE	120	1787285520	86.445904	86.447736	86.383156	86.402836
91119	GOLD	120	1787285520	4593.454380	4595.100538	4592.897392	4593.949684
91120	DOW	120	1787285520	52755.791682	52764.982256	52750.741134	52758.282543
91121	VIX	120	1787285520	16.013350	16.014541	15.999833	16.009735
92658	CRUDE	120	1787286720	86.473348	86.508428	86.462892	86.481477
92659	GOLD	120	1787286720	4600.089652	4600.271735	4597.380109	4599.074573
92660	DOW	120	1787286720	52752.691500	52764.859413	52752.373392	52764.046935
92661	VIX	120	1787286720	16.012076	16.016253	16.004890	16.012903
93035	DOW	120	1787287080	52761.318191	52764.539912	52753.427661	52758.569836
93036	VIX	120	1787287080	16.009334	16.016602	16.002953	16.010451
92907	SP500	120	1787286960	7639.967947	7642.351317	7639.945737	7640.685052
92282	SP500	120	1787286360	7640.827934	7642.334280	7639.684207	7641.135493
92283	CRUDE	120	1787286360	86.453849	86.467816	86.421525	86.449593
92284	GOLD	120	1787286360	4594.799806	4595.668696	4593.825711	4595.113971
92285	DOW	120	1787286360	52764.592606	52767.446579	52752.713360	52753.688170
92286	VIX	120	1787286360	16.007353	16.015693	16.003269	16.007440
92157	SP500	120	1787286240	7641.165338	7642.981258	7640.458030	7641.042959
92158	CRUDE	120	1787286240	86.474361	86.482638	86.448348	86.453751
92159	GOLD	120	1787286240	4595.633711	4597.300000	4593.797075	4594.746989
91307	SP500	120	1787285640	7640.848056	7642.243083	7640.065340	7641.335125
91308	CRUDE	120	1787285640	86.394725	86.443518	86.364247	86.377516
91309	GOLD	120	1787285640	4593.616537	4595.080854	4592.911002	4594.265850
91310	DOW	120	1787285640	52756.137703	52772.404398	52748.642503	52754.475211
91311	VIX	120	1787285640	16.008187	16.018991	16.002055	16.009172
92160	DOW	120	1787286240	52758.572437	52764.767834	52754.463239	52763.174641
92161	VIX	120	1787286240	16.012489	16.015946	16.004891	16.008587
91782	SP500	120	1787285880	7641.699505	7642.141180	7639.675239	7641.318450
91783	CRUDE	120	1787285880	86.416142	86.441490	86.382457	86.438284
91784	GOLD	120	1787285880	4592.396551	4595.003156	4591.859172	4594.163421
91785	DOW	120	1787285880	52764.630760	52765.667995	52749.688913	52762.635820
91786	VIX	120	1787285880	16.005510	16.013518	16.002214	16.012184
90995	DOW	120	1787285400	52755.544488	52771.380676	52752.049275	52757.265745
90996	VIX	120	1787285400	16.008147	16.014503	16.005556	16.011873
91557	SP500	120	1787285760	7641.195919	7642.103931	7640.147578	7641.710897
91558	CRUDE	120	1787285760	86.363944	86.416527	86.358000	86.416002
91559	GOLD	120	1787285760	4594.896877	4595.785673	4592.126492	4592.270939
91560	DOW	120	1787285760	52755.826853	52771.947567	52750.008994	52762.778549
91561	VIX	120	1787285760	16.011662	16.018593	16.004572	16.006903
91907	SP500	120	1787286000	7641.226647	7642.302918	7640.054900	7641.722263
91908	CRUDE	120	1787286000	86.439875	86.484721	86.433038	86.474711
91909	GOLD	120	1787286000	4594.103541	4596.213580	4593.741935	4593.906496
91910	DOW	120	1787286000	52763.772664	52767.811780	52749.813494	52754.136719
91911	VIX	120	1787286000	16.011116	16.015325	16.003156	16.006195
92908	CRUDE	120	1787286960	86.475868	86.519660	86.471096	86.498277
92532	SP500	120	1787286600	7640.668973	7642.262117	7640.091545	7640.819643
92533	CRUDE	120	1787286600	86.442867	86.480000	86.429866	86.473415
92534	GOLD	120	1787286600	4596.781891	4601.705617	4596.701356	4600.022997
92535	DOW	120	1787286600	52757.844016	52769.088733	52750.601104	52752.988542
92536	VIX	120	1787286600	16.013714	16.014405	16.003184	16.011970
92407	SP500	120	1787286480	7641.245411	7642.191264	7639.747920	7640.383090
92408	CRUDE	120	1787286480	86.450673	86.453680	86.424756	86.445161
92032	SP500	120	1787286120	7641.946369	7642.409624	7640.648918	7641.300358
92033	CRUDE	120	1787286120	86.471296	86.496774	86.446141	86.470931
92034	GOLD	120	1787286120	4594.034546	4596.071167	4593.070165	4595.593735
92035	DOW	120	1787286120	52753.803806	52769.241884	52749.153328	52757.885190
92036	VIX	120	1787286120	16.007325	16.013649	16.005838	16.012548
92409	GOLD	120	1787286480	4594.972106	4597.348891	4594.220226	4596.779788
92410	DOW	120	1787286480	52752.454578	52763.196874	52749.924401	52758.519552
92411	VIX	120	1787286480	16.007605	16.015714	16.005218	16.012666
92909	GOLD	120	1787286960	4599.816266	4603.277589	4599.816266	4603.151318
92910	DOW	120	1787286960	52752.817865	52766.505045	52751.416857	52760.642477
92911	VIX	120	1787286960	16.011154	16.015645	16.002130	16.008467
92782	SP500	120	1787286840	7640.283569	7642.629597	7639.702139	7639.933157
92783	CRUDE	120	1787286840	86.480468	86.490045	86.442698	86.478114
92784	GOLD	120	1787286840	4598.991357	4600.289207	4598.659906	4599.998333
92785	DOW	120	1787286840	52765.417552	52766.357405	52749.292299	52752.427680
92657	SP500	120	1787286720	7641.045259	7641.631720	7639.742786	7640.506452
93154	GOLD	120	1787287200	4603.379323	4603.883644	4601.552448	4603.367535
92786	VIX	120	1787286840	16.013302	16.013892	16.007799	16.010671
93276	VIX	120	1787287320	16.012441	16.013375	16.002995	16.005160
93155	DOW	120	1787287200	52757.743372	52769.022440	52749.704700	52758.289622
93032	SP500	120	1787287080	7640.879782	7641.961050	7639.786776	7640.423185
93396	VIX	120	1787287440	16.004138	16.014937	16.001424	16.014206
93272	SP500	120	1787287320	7640.130736	7641.969982	7639.572058	7640.947043
93152	SP500	120	1787287200	7640.175733	7641.813170	7639.801351	7640.428861
93033	CRUDE	120	1787287080	86.497727	86.522205	86.492056	86.517479
93034	GOLD	120	1787287080	4603.317157	4603.876992	4601.874524	4603.243391
93156	VIX	120	1787287200	16.011463	16.017009	16.005478	16.011653
93153	CRUDE	120	1787287200	86.518645	86.521925	86.483835	86.492967
93273	CRUDE	120	1787287320	86.491663	86.526438	86.482694	86.486697
93274	GOLD	120	1787287320	4603.235552	4604.404683	4599.170939	4599.637939
93275	DOW	120	1787287320	52757.990186	52768.297747	52743.484911	52752.086778
93514	GOLD	120	1787287560	4600.374139	4600.935345	4598.477395	4598.684747
93392	SP500	120	1787287440	7640.686208	7642.366655	7640.483133	7641.319884
93393	CRUDE	120	1787287440	86.487150	86.504539	86.472378	86.500003
93394	GOLD	120	1787287440	4599.729759	4601.396953	4599.655664	4600.266904
93395	DOW	120	1787287440	52751.702078	52767.063776	52745.843523	52761.222240
93512	SP500	120	1787287560	7641.184820	7642.306407	7640.171545	7641.717005
93513	CRUDE	120	1787287560	86.500778	86.531188	86.481335	86.529875
93633	CRUDE	120	1787287680	86.528052	86.539526	86.496646	86.498596
93634	GOLD	120	1787287680	4598.849500	4599.365597	4598.200000	4599.258566
93635	DOW	120	1787287680	52766.898105	52766.979568	52750.648244	52755.328976
93636	VIX	120	1787287680	16.010073	16.014087	16.006033	16.009644
95202	SP500	120	1787289240	7640.839234	7641.744055	7640.061900	7641.263756
95077	SP500	120	1787289120	7641.482075	7642.057448	7640.282731	7640.714562
95078	CRUDE	120	1787289120	86.216264	86.227558	86.180901	86.203041
94112	SP500	120	1787288160	7641.339625	7642.418460	7639.930585	7641.608535
93992	SP500	120	1787288040	7640.852905	7641.842341	7640.159161	7641.499134
93993	CRUDE	120	1787288040	86.464024	86.467478	86.424366	86.443668
93994	GOLD	120	1787288040	4597.455118	4598.662779	4597.026722	4597.514229
93995	DOW	120	1787288040	52754.988041	52763.628343	52748.685387	52760.745694
93996	VIX	120	1787288040	16.008470	16.017018	16.005137	16.006677
94113	CRUDE	120	1787288160	86.443131	86.461505	86.433507	86.446759
93872	SP500	120	1787287920	7641.369088	7642.741923	7640.332286	7640.569639
93873	CRUDE	120	1787287920	86.507757	86.522254	86.439918	86.466442
93874	GOLD	120	1787287920	4596.687220	4598.738060	4596.687220	4597.361196
93875	DOW	120	1787287920	52759.657065	52772.325013	52752.732798	52756.064355
93876	VIX	120	1787287920	16.007505	16.015482	16.005798	16.009311
94114	GOLD	120	1787288160	4597.519159	4598.423225	4596.415111	4597.106265
94115	DOW	120	1787288160	52760.705815	52765.758896	52750.343860	52760.482679
94116	VIX	120	1787288160	16.007462	16.015792	16.005645	16.008136
95079	GOLD	120	1787289120	4594.579842	4594.926484	4592.657611	4594.312249
93515	DOW	120	1787287560	52759.229231	52766.264615	52750.621442	52765.185343
93516	VIX	120	1787287560	16.015151	16.015603	16.003166	16.008797
95080	DOW	120	1787289120	52763.662690	52765.109170	52750.954765	52758.075098
95081	VIX	120	1787289120	16.010920	16.015898	16.005280	16.012820
93752	SP500	120	1787287800	7641.697184	7642.198852	7640.238224	7641.380830
93753	CRUDE	120	1787287800	86.495854	86.521482	86.490732	86.510998
93754	GOLD	120	1787287800	4599.290789	4599.980427	4596.850495	4596.870165
93755	DOW	120	1787287800	52756.205104	52765.782952	52753.171400	52759.607798
93756	VIX	120	1787287800	16.010233	16.017511	16.003727	16.006620
94952	SP500	120	1787289000	7640.709695	7642.334861	7640.054710	7641.353164
94953	CRUDE	120	1787289000	86.243174	86.250000	86.194845	86.217315
94712	SP500	120	1787288760	7641.294792	7643.161974	7640.357317	7641.542488
94232	SP500	120	1787288280	7641.701988	7641.906652	7639.736629	7640.903536
94233	CRUDE	120	1787288280	86.443672	86.449694	86.416692	86.439188
94234	GOLD	120	1787288280	4597.186044	4599.004470	4596.564860	4597.380417
94235	DOW	120	1787288280	52759.133254	52764.472810	52752.450034	52755.488824
94236	VIX	120	1787288280	16.008266	16.016669	16.005197	16.008284
94713	CRUDE	120	1787288760	86.314694	86.345708	86.284894	86.340234
94714	GOLD	120	1787288760	4596.807256	4598.889001	4596.691548	4597.847623
94715	DOW	120	1787288760	52757.268857	52763.907932	52753.955643	52756.207432
94716	VIX	120	1787288760	16.015031	16.016621	16.007319	16.008042
94472	SP500	120	1787288520	7640.452682	7642.084807	7640.280157	7640.875485
94473	CRUDE	120	1787288520	86.417675	86.433111	86.356693	86.364774
94474	GOLD	120	1787288520	4597.867813	4598.399625	4597.359715	4597.649948
93632	SP500	120	1787287680	7641.625259	7642.005923	7640.250487	7641.432522
94475	DOW	120	1787288520	52756.034543	52768.516130	52753.676745	52759.324777
94476	VIX	120	1787288520	16.009195	16.019837	16.002349	16.010304
94352	SP500	120	1787288400	7640.787261	7642.844256	7639.882792	7640.579515
94353	CRUDE	120	1787288400	86.437940	86.446412	86.413353	86.418354
94354	GOLD	120	1787288400	4597.466908	4598.201804	4596.999784	4597.692490
94355	DOW	120	1787288400	52757.545850	52768.177546	52752.747836	52756.488498
94356	VIX	120	1787288400	16.009371	16.017678	16.005425	16.009951
94954	GOLD	120	1787289000	4596.047785	4596.880781	4592.994392	4594.638368
94955	DOW	120	1787289000	52759.610014	52766.193419	52750.953722	52763.251792
94956	VIX	120	1787289000	16.008720	16.015874	16.004901	16.010996
94592	SP500	120	1787288640	7641.143418	7642.166726	7639.735955	7641.183855
94593	CRUDE	120	1787288640	86.367150	86.374337	86.315257	86.316572
94594	GOLD	120	1787288640	4597.562739	4598.410296	4596.940373	4596.974187
94595	DOW	120	1787288640	52760.134712	52769.479715	52749.350818	52756.066788
94596	VIX	120	1787288640	16.009646	16.016159	16.007502	16.013878
95203	CRUDE	120	1787289240	86.206334	86.213870	86.152816	86.185154
95204	GOLD	120	1787289240	4594.373146	4595.992860	4593.588955	4595.891356
94832	SP500	120	1787288880	7641.786910	7642.196479	7640.417303	7640.933148
94833	CRUDE	120	1787288880	86.343191	86.343191	86.234564	86.243919
94834	GOLD	120	1787288880	4597.749721	4597.958203	4595.993816	4596.175269
94835	DOW	120	1787288880	52755.719464	52765.684154	52752.340767	52761.348346
94836	VIX	120	1787288880	16.008587	16.014891	16.006532	16.007510
95205	DOW	120	1787289240	52756.575723	52768.981760	52755.712193	52765.507205
95206	VIX	120	1787289240	16.013563	16.016318	16.003893	16.009428
95452	SP500	120	1787289480	7641.304779	7642.194763	7640.192702	7641.751492
95453	CRUDE	120	1787289480	86.183742	86.204588	86.127727	86.203996
95454	GOLD	120	1787289480	4594.477238	4594.477238	4592.049364	4593.181896
95455	DOW	120	1787289480	52761.423540	52766.059370	52753.320944	52759.439965
95456	VIX	120	1787289480	16.010823	16.013975	16.001637	16.006291
95327	SP500	120	1787289360	7641.060940	7642.406986	7640.045785	7641.334138
95328	CRUDE	120	1787289360	86.185406	86.201774	86.160215	86.180519
95329	GOLD	120	1787289360	4595.981311	4596.683514	4594.297937	4594.569647
95330	DOW	120	1787289360	52766.860582	52769.110073	52751.694996	52761.183766
95331	VIX	120	1787289360	16.009059	16.013590	16.000060	16.010640
95577	SP500	120	1787289600	7641.730356	7642.367901	7640.277906	7641.017296
95578	CRUDE	120	1787289600	86.204511	86.204511	86.172183	86.196507
95579	GOLD	120	1787289600	4593.038214	4593.470527	4591.500000	4592.351005
95580	DOW	120	1787289600	52758.057873	52764.276717	52753.281158	52755.969639
95581	VIX	120	1787289600	16.004970	16.012309	16.004543	16.007436
95702	SP500	120	1787289720	7640.960828	7641.814993	7639.871445	7641.131667
95703	CRUDE	120	1787289720	86.196350	86.227322	86.179302	86.227322
95704	GOLD	120	1787289720	4592.352957	4592.758995	4591.435864	4592.643881
97686	VIX	120	1787291640	16.009789	16.015935	16.002801	16.009655
97187	SP500	120	1787291160	7641.151390	7642.121832	7640.607213	7641.929719
97188	CRUDE	120	1787291160	86.397913	86.411802	86.346314	86.366990
97189	GOLD	120	1787291160	4595.357099	4597.033940	4594.235470	4594.718389
97190	DOW	120	1787291160	52753.083310	52765.299689	52751.213064	52757.106611
97191	VIX	120	1787291160	16.013787	16.014790	16.005336	16.010934
95827	SP500	120	1787289840	7640.879235	7641.798650	7639.662228	7640.042714
95828	CRUDE	120	1787289840	86.229080	86.240772	86.199955	86.240772
95829	GOLD	120	1787289840	4592.706283	4594.740064	4591.520243	4591.702403
95830	DOW	120	1787289840	52757.985747	52765.028546	52751.752326	52761.824994
95831	VIX	120	1787289840	16.009012	16.016960	16.006189	16.011211
96692	SP500	120	1787290680	7641.129285	7642.261794	7640.105412	7640.390266
96693	CRUDE	120	1787290680	86.443866	86.462552	86.431701	86.441584
96694	GOLD	120	1787290680	4587.640137	4587.921384	4586.831341	4587.170404
96695	DOW	120	1787290680	52758.935103	52771.129796	52755.362975	52764.508888
96696	VIX	120	1787290680	16.005992	16.013932	16.002604	16.008826
96572	SP500	120	1787290560	7641.405251	7641.890814	7640.514876	7641.124235
96573	CRUDE	120	1787290560	86.367793	86.446390	86.352358	86.446255
96574	GOLD	120	1787290560	4590.042049	4590.989589	4587.690788	4587.711755
96575	DOW	120	1787290560	52757.774210	52767.023269	52752.951768	52758.334502
96576	VIX	120	1787290560	16.013146	16.020799	16.004686	16.006036
96942	SP500	120	1787290920	7640.888593	7642.684710	7640.540279	7640.540279
96202	SP500	120	1787290200	7640.600955	7642.543946	7640.292149	7640.892964
96203	CRUDE	120	1787290200	86.287951	86.306353	86.262953	86.286270
96204	GOLD	120	1787290200	4590.132027	4590.789485	4588.547224	4588.547224
96205	DOW	120	1787290200	52759.657186	52769.320983	52750.373663	52755.222584
96206	VIX	120	1787290200	16.015102	16.015326	16.005526	16.011656
96077	SP500	120	1787290080	7640.737973	7641.809771	7640.205091	7640.332600
95705	DOW	120	1787289720	52754.334306	52766.046240	52754.143392	52758.972208
95706	VIX	120	1787289720	16.007387	16.016721	16.004556	16.009621
96078	CRUDE	120	1787290080	86.252180	86.304795	86.243653	86.290948
96079	GOLD	120	1787290080	4589.652137	4590.886764	4588.157009	4590.212934
96080	DOW	120	1787290080	52760.703310	52768.430194	52752.288154	52760.133890
96081	VIX	120	1787290080	16.009331	16.015981	16.001392	16.015398
96943	CRUDE	120	1787290920	86.388993	86.450229	86.360100	86.434158
96944	GOLD	120	1787290920	4588.331017	4594.446051	4588.331017	4593.827117
96945	DOW	120	1787290920	52756.819687	52766.141983	52751.934310	52761.112074
96946	VIX	120	1787290920	16.005593	16.015305	16.003820	16.008408
95952	SP500	120	1787289960	7640.086611	7642.315586	7639.970077	7640.953681
95953	CRUDE	120	1787289960	86.243064	86.293796	86.239338	86.254400
95954	GOLD	120	1787289960	4591.739761	4592.313920	4587.995565	4589.633365
95955	DOW	120	1787289960	52761.730825	52767.648760	52751.805593	52761.375511
95956	VIX	120	1787289960	16.009792	16.015351	16.003197	16.010552
96327	SP500	120	1787290320	7641.149593	7642.417614	7640.301844	7640.643775
96328	CRUDE	120	1787290320	86.288709	86.301439	86.240791	86.276826
96329	GOLD	120	1787290320	4588.669097	4591.031655	4588.669097	4590.396651
96330	DOW	120	1787290320	52755.263563	52766.342696	52752.426225	52766.342696
96331	VIX	120	1787290320	16.012719	16.014188	16.000460	16.011266
96817	SP500	120	1787290800	7640.612478	7641.986623	7640.059490	7641.023406
96818	CRUDE	120	1787290800	86.439698	86.481192	86.380000	86.387350
96819	GOLD	120	1787290800	4587.284485	4590.500000	4587.284485	4588.188053
96820	DOW	120	1787290800	52764.588834	52767.663391	52751.680596	52758.041260
96821	VIX	120	1787290800	16.008266	16.014984	16.005891	16.005891
96452	SP500	120	1787290440	7640.547465	7641.656537	7640.074035	7641.432499
96453	CRUDE	120	1787290440	86.276161	86.371132	86.273954	86.371132
96454	GOLD	120	1787290440	4590.502488	4590.974364	4589.602816	4590.025530
96455	DOW	120	1787290440	52764.476435	52767.558340	52748.924567	52757.130385
96456	VIX	120	1787290440	16.010258	16.014306	16.005456	16.013343
97682	SP500	120	1787291640	7641.229886	7642.087910	7640.328342	7641.658038
97683	CRUDE	120	1787291640	86.428991	86.452127	86.410000	86.418314
97067	SP500	120	1787291040	7640.619046	7642.122709	7640.525680	7641.193603
97068	CRUDE	120	1787291040	86.435397	86.466011	86.381708	86.395698
97069	GOLD	120	1787291040	4593.976060	4595.672597	4592.716804	4595.289460
97070	DOW	120	1787291040	52762.535185	52765.492373	52754.087617	52754.904346
97071	VIX	120	1787291040	16.007771	16.016226	16.005169	16.013631
97684	GOLD	120	1787291640	4594.714840	4599.833963	4594.529963	4598.873187
97432	SP500	120	1787291400	7641.212697	7642.056266	7639.592298	7639.592298
97433	CRUDE	120	1787291400	86.387235	86.393843	86.309640	86.374537
97434	GOLD	120	1787291400	4592.589417	4594.158436	4592.099073	4593.193296
97435	DOW	120	1787291400	52759.009698	52767.446459	52752.335775	52755.182632
97307	SP500	120	1787291280	7641.835868	7642.487069	7640.052280	7640.990959
97308	CRUDE	120	1787291280	86.366468	86.428510	86.345745	86.385214
97436	VIX	120	1787291400	16.004535	16.016298	16.002268	16.007675
97685	DOW	120	1787291640	52757.251164	52766.925007	52752.410087	52761.390155
97557	SP500	120	1787291520	7639.445368	7642.668561	7639.363219	7641.121046
97558	CRUDE	120	1787291520	86.374446	86.450000	86.365711	86.426564
97309	GOLD	120	1787291280	4594.757998	4595.643607	4592.586746	4592.586746
97310	DOW	120	1787291280	52758.140000	52767.898784	52750.154966	52758.416854
97311	VIX	120	1787291280	16.011541	16.013640	16.004315	16.005716
97559	GOLD	120	1787291520	4593.296699	4595.400000	4592.514764	4594.705432
97560	DOW	120	1787291520	52753.094740	52765.894758	52750.869167	52759.306512
97561	VIX	120	1787291520	16.009270	16.014046	16.004503	16.010806
97802	SP500	120	1787291760	7641.785872	7641.935209	7640.188010	7641.935209
97803	CRUDE	120	1787291760	86.420383	86.428253	86.331057	86.384382
97804	GOLD	120	1787291760	4598.974480	4599.602960	4597.522649	4598.794037
97805	DOW	120	1787291760	52762.926951	52765.260090	52751.612843	52762.379399
97806	VIX	120	1787291760	16.010076	16.011412	16.003453	16.010886
97927	SP500	120	1787291880	7641.635014	7642.040008	7640.002585	7641.040511
97928	CRUDE	120	1787291880	86.382013	86.456635	86.353756	86.450556
97929	GOLD	120	1787291880	4598.865717	4602.515724	4598.484306	4601.865835
100026	VIX	120	1787293920	16.014098	16.019743	16.005792	16.007505
99397	SP500	120	1787293320	7640.685762	7642.021066	7639.753019	7640.941325
99398	CRUDE	120	1787293320	86.306149	86.306149	86.139735	86.156055
99022	SP500	120	1787292960	7640.835304	7641.791971	7640.254477	7641.393721
99023	CRUDE	120	1787292960	86.237334	86.254703	86.206649	86.208462
99024	GOLD	120	1787292960	4607.203716	4607.691604	4604.443523	4604.510858
98052	SP500	120	1787292000	7641.136035	7641.884873	7639.780120	7641.137677
98053	CRUDE	120	1787292000	86.453314	86.462211	86.383472	86.457401
98054	GOLD	120	1787292000	4601.894997	4604.529767	4600.000000	4604.514384
98055	DOW	120	1787292000	52758.069952	52763.367586	52753.375828	52754.684064
98056	VIX	120	1787292000	16.013568	16.016604	16.004463	16.005080
99025	DOW	120	1787292960	52761.110911	52764.569584	52754.094302	52759.736811
99026	VIX	120	1787292960	16.006097	16.015581	16.006097	16.011066
98537	SP500	120	1787292480	7640.479133	7642.299163	7639.692170	7640.384387
98417	SP500	120	1787292360	7641.267576	7642.597201	7640.209632	7640.209632
98418	CRUDE	120	1787292360	86.186947	86.214150	86.170000	86.202033
98419	GOLD	120	1787292360	4607.635751	4609.535724	4606.982782	4608.856080
98420	DOW	120	1787292360	52764.721883	52766.161981	52755.076482	52758.827975
98421	VIX	120	1787292360	16.008711	16.017703	16.007243	16.012060
98538	CRUDE	120	1787292480	86.202446	86.205484	86.139831	86.170435
98539	GOLD	120	1787292480	4608.949458	4612.477757	4608.883945	4610.027531
98297	SP500	120	1787292240	7640.708835	7642.379825	7640.394882	7641.085036
98298	CRUDE	120	1787292240	86.383857	86.392814	86.180000	86.186946
98299	GOLD	120	1787292240	4605.034142	4607.733164	4602.862893	4607.661041
98300	DOW	120	1787292240	52763.833750	52769.400153	52752.161639	52763.530789
98301	VIX	120	1787292240	16.008978	16.015414	16.003816	16.009201
98540	DOW	120	1787292480	52757.598534	52765.841361	52754.079084	52761.592348
97930	DOW	120	1787291880	52762.117853	52769.171010	52754.533844	52757.048098
97931	VIX	120	1787291880	16.011841	16.016660	16.004481	16.013087
98541	VIX	120	1787292480	16.013155	16.015413	16.003193	16.009530
99399	GOLD	120	1787293320	4602.443895	4604.642732	4601.989889	4604.458084
99400	DOW	120	1787293320	52761.400473	52765.045353	52748.541296	52759.856888
99401	VIX	120	1787293320	16.002707	16.017429	15.998693	16.011401
98177	SP500	120	1787292120	7641.376520	7642.199949	7640.615326	7640.782807
98178	CRUDE	120	1787292120	86.458198	86.464566	86.347182	86.383208
98179	GOLD	120	1787292120	4604.478193	4605.887043	4604.070161	4605.213314
98180	DOW	120	1787292120	52755.529401	52769.848482	52749.273818	52762.427268
98181	VIX	120	1787292120	16.005638	16.018610	16.004609	16.009701
99272	SP500	120	1787293200	7641.483374	7642.413373	7639.899762	7640.493341
99273	CRUDE	120	1787293200	86.179950	86.325691	86.179950	86.305087
99274	GOLD	120	1787293200	4604.665892	4605.713517	4602.510082	4602.604949
99275	DOW	120	1787293200	52753.622444	52772.624773	52751.232883	52761.708918
98657	SP500	120	1787292600	7640.435903	7642.375500	7639.978005	7641.478256
98658	CRUDE	120	1787292600	86.173843	86.204562	86.113379	86.192432
98659	GOLD	120	1787292600	4609.936153	4611.357180	4608.236486	4608.389293
98660	DOW	120	1787292600	52761.216750	52771.880187	52753.252406	52754.830299
98661	VIX	120	1787292600	16.011114	16.013578	16.004157	16.007461
99276	VIX	120	1787293200	16.009088	16.017198	16.002232	16.002618
98897	SP500	120	1787292840	7640.773882	7642.290944	7640.312324	7641.104119
98898	CRUDE	120	1787292840	86.177382	86.266672	86.166015	86.235327
98899	GOLD	120	1787292840	4605.903573	4607.400000	4604.900000	4607.343144
98900	DOW	120	1787292840	52760.211563	52766.318361	52747.679927	52761.817246
98901	VIX	120	1787292840	16.011011	16.014898	15.999738	16.004777
98777	SP500	120	1787292720	7641.712558	7642.171601	7639.828637	7640.783403
98778	CRUDE	120	1787292720	86.192766	86.225208	86.161150	86.176704
98779	GOLD	120	1787292720	4608.350254	4609.306869	4603.607542	4605.954562
98780	DOW	120	1787292720	52755.785111	52769.598864	52748.894417	52762.082182
98781	VIX	120	1787292720	16.009029	16.018651	16.006818	16.009916
99897	SP500	120	1787293800	7640.754971	7642.267510	7640.437783	7640.523847
99898	CRUDE	120	1787293800	86.202051	86.232291	86.187820	86.225329
99899	GOLD	120	1787293800	4611.223436	4613.234565	4609.441706	4609.848748
99900	DOW	120	1787293800	52755.920708	52766.950723	52749.727494	52762.002279
99647	SP500	120	1787293560	7641.650604	7641.744300	7639.973051	7641.261524
99648	CRUDE	120	1787293560	86.155155	86.230000	86.153087	86.204452
99649	GOLD	120	1787293560	4608.253648	4612.600000	4608.253648	4611.534374
99650	DOW	120	1787293560	52754.471242	52768.299700	52750.327863	52757.236130
99522	SP500	120	1787293440	7641.059439	7641.998781	7640.335162	7641.915043
99523	CRUDE	120	1787293440	86.154409	86.250000	86.146344	86.155497
99651	VIX	120	1787293560	16.012642	16.016146	15.999412	16.006754
99147	SP500	120	1787293080	7641.397094	7642.448096	7640.615132	7641.339352
99148	CRUDE	120	1787293080	86.209444	86.209444	86.158080	86.177529
99149	GOLD	120	1787293080	4604.657494	4605.403069	4603.756566	4604.529482
99150	DOW	120	1787293080	52761.811873	52766.448676	52751.139799	52753.799256
99151	VIX	120	1787293080	16.011553	16.015772	16.002600	16.008071
99901	VIX	120	1787293800	16.013478	16.016792	16.000341	16.014329
99772	SP500	120	1787293680	7641.468347	7641.960409	7640.326296	7641.058910
99773	CRUDE	120	1787293680	86.206334	86.230000	86.164794	86.203336
99524	GOLD	120	1787293440	4604.527051	4609.792550	4603.846927	4608.236567
99525	DOW	120	1787293440	52759.765380	52765.995907	52751.690229	52755.663881
99526	VIX	120	1787293440	16.010633	16.016638	16.002613	16.013782
99774	GOLD	120	1787293680	4611.474856	4611.835560	4609.725605	4611.310443
99775	DOW	120	1787293680	52756.184420	52766.377598	52752.047171	52754.630902
99776	VIX	120	1787293680	16.006893	16.014404	16.004816	16.013030
100144	GOLD	120	1787294040	4606.656335	4609.082197	4605.880135	4608.485901
100022	SP500	120	1787293920	7640.552205	7641.761539	7640.247478	7641.189471
100023	CRUDE	120	1787293920	86.222317	86.285282	86.219941	86.275412
100024	GOLD	120	1787293920	4609.935843	4610.117484	4606.499436	4606.499436
100025	DOW	120	1787293920	52762.449365	52768.745857	52753.894479	52755.025779
100142	SP500	120	1787294040	7640.929415	7642.607274	7640.082309	7641.657670
100143	CRUDE	120	1787294040	86.276365	86.331479	86.255038	86.323620
100264	GOLD	120	1787294160	4608.577808	4613.000000	4608.265302	4611.898999
100265	DOW	120	1787294160	52760.173110	52764.627473	52746.689138	52761.265229
100266	VIX	120	1787294160	16.011346	16.016483	16.006065	16.008643
100994	GOLD	120	1787294880	4621.925075	4622.832877	4621.133789	4621.842388
100995	DOW	120	1787294880	52762.631592	52765.121714	52753.221806	52753.244092
100996	VIX	120	1787294880	16.010006	16.015714	16.004660	16.010600
100622	SP500	120	1787294520	7639.645637	7641.972151	7639.443265	7641.800581
100623	CRUDE	120	1787294520	86.406399	86.431491	86.304782	86.307176
100624	GOLD	120	1787294520	4614.438606	4619.272355	4613.500000	4619.272355
100625	DOW	120	1787294520	52764.906250	52766.865714	52750.388406	52750.388406
100626	VIX	120	1787294520	16.015101	16.015109	16.004508	16.009473
100502	SP500	120	1787294400	7640.432886	7642.444062	7639.770436	7639.770436
100503	CRUDE	120	1787294400	86.378540	86.440000	86.362951	86.407155
100504	GOLD	120	1787294400	4612.467161	4614.376050	4611.500000	4614.357745
100505	DOW	120	1787294400	52759.726015	52765.326776	52751.595507	52764.996616
100506	VIX	120	1787294400	16.013879	16.016225	16.001971	16.015182
100742	SP500	120	1787294640	7641.994293	7642.871036	7639.919619	7641.014033
100743	CRUDE	120	1787294640	86.304800	86.373243	86.290378	86.314862
100744	GOLD	120	1787294640	4619.253766	4621.500000	4619.000000	4621.338392
100745	DOW	120	1787294640	52749.208642	52765.657354	52749.208642	52760.183837
100746	VIX	120	1787294640	16.010181	16.017231	16.005993	16.008957
100145	DOW	120	1787294040	52754.142768	52765.605766	52748.799231	52758.093064
100146	VIX	120	1787294040	16.008156	16.014472	15.999577	16.012226
101371	VIX	120	1787295240	16.006072	16.015537	16.003181	16.008324
100382	SP500	120	1787294280	7640.860808	7642.059156	7639.869697	7640.649737
100383	CRUDE	120	1787294280	86.407638	86.435135	86.376315	86.376315
100384	GOLD	120	1787294280	4611.825217	4614.727898	4611.702663	4612.542831
100385	DOW	120	1787294280	52762.348980	52763.934221	52750.168109	52759.493231
100386	VIX	120	1787294280	16.009751	16.016770	16.007461	16.013106
101242	SP500	120	1787295120	7640.816496	7642.630696	7640.376499	7641.405961
101243	CRUDE	120	1787295120	86.370531	86.374318	86.318370	86.325378
101244	GOLD	120	1787295120	4618.238321	4621.907197	4617.365783	4620.790180
101245	DOW	120	1787295120	52764.775645	52765.232188	52745.711525	52762.799543
101246	VIX	120	1787295120	16.006667	16.013569	16.004389	16.006132
100867	SP500	120	1787294760	7641.102466	7641.738861	7640.459104	7641.236771
100868	CRUDE	120	1787294760	86.315922	86.360000	86.310000	86.354633
100869	GOLD	120	1787294760	4621.328210	4622.308035	4620.523854	4621.882722
100870	DOW	120	1787294760	52760.445905	52767.084019	52753.511049	52762.345496
100871	VIX	120	1787294760	16.009610	16.015161	16.002512	16.010965
100262	SP500	120	1787294160	7641.683915	7642.923523	7640.149935	7640.682735
100263	CRUDE	120	1787294160	86.320907	86.411377	86.317790	86.409514
101996	VIX	120	1787295840	16.008437	16.014667	16.004298	16.012393
102116	VIX	120	1787295960	16.012137	16.015014	16.003984	16.007603
101617	SP500	120	1787295480	7641.114035	7641.950900	7639.874581	7640.856970
101618	CRUDE	120	1787295480	86.351568	86.357680	86.272974	86.352448
101619	GOLD	120	1787295480	4620.750413	4624.600000	4620.436991	4624.172079
101620	DOW	120	1787295480	52755.408816	52765.352197	52749.728360	52758.623465
101621	VIX	120	1787295480	16.009028	16.017280	16.005832	16.010901
101492	SP500	120	1787295360	7640.256510	7642.016649	7639.719650	7640.904152
101493	CRUDE	120	1787295360	86.412185	86.419489	86.328394	86.353118
101494	GOLD	120	1787295360	4619.829504	4621.379627	4619.587587	4620.916144
101495	DOW	120	1787295360	52764.497029	52770.393346	52753.560165	52757.255195
101496	VIX	120	1787295360	16.009134	16.018468	16.005760	16.008108
101117	SP500	120	1787295000	7641.774355	7641.777208	7639.666870	7640.824594
101118	CRUDE	120	1787295000	86.332615	86.373637	86.324558	86.373637
101119	GOLD	120	1787295000	4622.022809	4622.110762	4617.445105	4618.111944
101120	DOW	120	1787295000	52751.748263	52766.668772	52750.310345	52763.482232
100992	SP500	120	1787294880	7641.037254	7642.287905	7639.857487	7641.474790
100993	CRUDE	120	1787294880	86.356702	86.379874	86.313554	86.333595
101121	VIX	120	1787295000	16.011345	16.014556	16.004040	16.007072
101992	SP500	120	1787295840	7640.518843	7641.792750	7640.039100	7641.300005
101993	CRUDE	120	1787295840	86.420586	86.433235	86.376254	86.380760
101994	GOLD	120	1787295840	4622.658076	4623.195844	4620.909155	4621.898272
101867	SP500	120	1787295720	7641.790806	7642.479985	7639.942822	7640.535074
101868	CRUDE	120	1787295720	86.460602	86.504973	86.407982	86.417145
101367	SP500	120	1787295240	7641.327916	7643.108049	7640.487488	7640.497437
101368	CRUDE	120	1787295240	86.323164	86.442889	86.317011	86.412424
101369	GOLD	120	1787295240	4620.872094	4622.245912	4619.735055	4619.735055
101370	DOW	120	1787295240	52762.392726	52765.898039	52751.745226	52763.443668
101869	GOLD	120	1787295720	4623.134201	4623.723916	4622.132059	4622.822127
101870	DOW	120	1787295720	52748.093382	52766.864339	52748.093382	52762.643766
101871	VIX	120	1787295720	16.009384	16.014257	16.003190	16.009040
101742	SP500	120	1787295600	7640.876647	7642.219630	7639.833770	7641.508933
101995	DOW	120	1787295840	52763.178703	52766.723648	52754.875044	52758.890266
101743	CRUDE	120	1787295600	86.353685	86.465299	86.353540	86.457599
101744	GOLD	120	1787295600	4624.272012	4625.059502	4622.282259	4623.080218
101745	DOW	120	1787295600	52759.725537	52766.881125	52749.597566	52749.597566
101746	VIX	120	1787295600	16.009934	16.014143	16.002489	16.010820
102112	SP500	120	1787295960	7641.338765	7642.496557	7639.773129	7641.473488
102113	CRUDE	120	1787295960	86.379449	86.384695	86.286834	86.288959
102114	GOLD	120	1787295960	4621.761779	4624.357944	4620.862124	4621.412574
102115	DOW	120	1787295960	52758.201057	52765.052253	52753.420660	52762.126238
102232	SP500	120	1787296080	7641.705451	7642.009260	7639.889754	7640.240670
102233	CRUDE	120	1787296080	86.287414	86.327660	86.286609	86.294933
102234	GOLD	120	1787296080	4621.509745	4621.606519	4617.592576	4617.769078
102235	DOW	120	1787296080	52760.912478	52765.626432	52751.572799	52760.033189
102236	VIX	120	1787296080	16.006963	16.018603	16.002273	16.010323
102357	SP500	120	1787296200	7640.076564	7642.336472	7640.076564	7640.484858
102358	CRUDE	120	1787296200	86.291935	86.410000	86.291935	86.398346
102359	GOLD	120	1787296200	4617.915613	4620.200000	4616.737048	4619.452272
103733	CRUDE	120	1787297520	86.258687	86.285891	86.196731	86.215110
103734	GOLD	120	1787297520	4623.000466	4624.963394	4619.930047	4620.913581
103735	DOW	120	1787297520	52762.162227	52766.301406	52753.167929	52756.127491
103736	VIX	120	1787297520	15.834132	15.837851	15.812465	15.817209
102482	SP500	120	1787296320	7640.456424	7641.793031	7640.261857	7640.443330
102483	CRUDE	120	1787296320	86.400079	86.400079	86.123159	86.126645
102484	GOLD	120	1787296320	4619.552851	4620.117070	4617.798876	4620.042044
102485	DOW	120	1787296320	52761.647926	52769.843697	52751.107507	52761.029723
102486	VIX	120	1787296320	16.009708	16.016073	16.006987	16.009340
104236	VIX	120	1787298000	15.809223	15.817336	15.802523	15.812946
104356	VIX	120	1787298120	15.814029	15.825551	15.807235	15.825551
104107	SP500	120	1787297880	7641.565186	7642.352387	7640.041277	7641.732648
103982	SP500	120	1787297760	7642.295670	7642.576786	7640.670766	7641.526062
103357	SP500	120	1787297160	7640.545492	7641.856676	7639.720285	7641.079202
103358	CRUDE	120	1787297160	86.136617	86.232080	86.129097	86.222061
103359	GOLD	120	1787297160	4619.374574	4620.842216	4618.167014	4620.703347
103360	DOW	120	1787297160	52763.722305	52768.715322	52750.666498	52759.677478
103361	VIX	120	1787297160	16.007801	16.013804	16.004103	16.006579
103232	SP500	120	1787297040	7641.254787	7642.166268	7640.429126	7640.761609
103233	CRUDE	120	1787297040	86.239001	86.240356	86.135387	86.139231
103234	GOLD	120	1787297040	4616.797957	4619.448801	4615.992240	4619.198430
103235	DOW	120	1787297040	52766.791854	52772.343946	52749.914337	52762.415416
103236	VIX	120	1787297040	16.011127	16.015996	16.005501	16.007863
102857	SP500	120	1787296680	7641.010903	7641.874543	7640.176797	7641.260545
102858	CRUDE	120	1787296680	86.241499	86.392704	86.238692	86.392704
102859	GOLD	120	1787296680	4620.408442	4621.580604	4616.743597	4616.878649
102860	DOW	120	1787296680	52758.694275	52769.885627	52749.256278	52755.920316
102861	VIX	120	1787296680	16.009415	16.016524	16.003627	16.010448
102732	SP500	120	1787296560	7641.137739	7642.637006	7639.532048	7641.088646
102733	CRUDE	120	1787296560	86.172634	86.243802	86.116214	86.241297
102360	DOW	120	1787296200	52758.718311	52769.059884	52748.927960	52762.878942
102361	VIX	120	1787296200	16.010555	16.015571	16.006105	16.008803
102734	GOLD	120	1787296560	4621.054569	4621.870755	4619.467960	4620.535789
102735	DOW	120	1787296560	52761.395188	52765.249892	52751.226183	52760.535829
102736	VIX	120	1787296560	16.012164	16.014652	16.001785	16.010390
102607	SP500	120	1787296440	7640.397703	7641.987533	7639.550401	7641.341507
102608	CRUDE	120	1787296440	86.124295	86.175926	86.104763	86.174009
102609	GOLD	120	1787296440	4620.169541	4622.594118	4619.415605	4620.995330
102610	DOW	120	1787296440	52760.620252	52765.655548	52750.685708	52762.859221
102611	VIX	120	1787296440	16.008023	16.021307	16.000341	16.010610
102982	SP500	120	1787296800	7641.528828	7642.535597	7640.354931	7641.218050
102983	CRUDE	120	1787296800	86.393131	86.431966	86.377702	86.408020
102984	GOLD	120	1787296800	4616.992909	4617.307128	4615.675536	4615.925147
102985	DOW	120	1787296800	52755.221568	52770.152146	52753.466536	52761.449073
102986	VIX	120	1787296800	16.008928	16.015482	16.005983	16.009892
103983	CRUDE	120	1787297760	86.243027	86.282258	86.228138	86.235727
103607	SP500	120	1787297400	7639.593156	7642.361518	7639.079145	7641.174557
103608	CRUDE	120	1787297400	86.293613	86.322333	86.251872	86.256817
103609	GOLD	120	1787297400	4623.256184	4623.727412	4621.990148	4622.969677
103610	DOW	120	1787297400	52765.386862	52766.043036	52752.859944	52760.703297
103611	VIX	120	1787297400	16.008265	16.008629	15.812557	15.834316
103482	SP500	120	1787297280	7641.019212	7642.202731	7639.880028	7639.895453
103483	CRUDE	120	1787297280	86.220201	86.322269	86.195912	86.294574
103484	GOLD	120	1787297280	4620.774785	4624.337776	4620.729359	4623.329277
103485	DOW	120	1787297280	52761.558940	52765.453822	52753.458880	52763.695860
103107	SP500	120	1787296920	7641.350420	7641.978770	7639.806457	7641.142379
103108	CRUDE	120	1787296920	86.409835	86.412146	86.233895	86.237272
103109	GOLD	120	1787296920	4615.989128	4617.798792	4614.958486	4616.969487
103110	DOW	120	1787296920	52759.810984	52765.156935	52750.300469	52765.156935
103111	VIX	120	1787296920	16.010057	16.013287	16.003239	16.011121
103486	VIX	120	1787297280	16.006235	16.014550	16.003257	16.008405
103984	GOLD	120	1787297760	4621.151983	4621.650684	4617.615333	4617.797010
103985	DOW	120	1787297760	52755.684474	52765.994326	52751.824257	52765.355050
103986	VIX	120	1787297760	15.817274	15.826045	15.812913	15.822644
104108	CRUDE	120	1787297880	86.234688	86.394809	86.229935	86.388993
104109	GOLD	120	1787297880	4617.928193	4619.898868	4617.501651	4618.861347
103857	SP500	120	1787297640	7641.676752	7642.103468	7640.561600	7642.004916
103858	CRUDE	120	1787297640	86.218238	86.257263	86.187762	86.239588
103859	GOLD	120	1787297640	4620.769673	4623.095355	4619.819243	4621.233031
103860	DOW	120	1787297640	52757.659925	52763.967992	52750.871202	52756.212252
103732	SP500	120	1787297520	7641.085173	7641.833771	7640.005095	7641.425389
104110	DOW	120	1787297880	52766.379709	52766.379709	52752.414006	52765.633190
104111	VIX	120	1787297880	15.823645	15.825735	15.807185	15.808161
103861	VIX	120	1787297640	15.818468	15.837319	15.814478	15.816778
104232	SP500	120	1787298000	7641.901486	7642.379326	7640.288957	7641.549418
104233	CRUDE	120	1787298000	86.387441	86.433753	86.330000	86.341137
104234	GOLD	120	1787298000	4618.912423	4622.348326	4617.143112	4619.549526
104235	DOW	120	1787298000	52763.807854	52770.479122	52755.365207	52757.678393
104476	VIX	120	1787298240	15.826322	15.827505	15.814426	15.818651
104352	SP500	120	1787298120	7641.364665	7642.979672	7639.851933	7641.942721
104353	CRUDE	120	1787298120	86.340201	86.340927	86.264418	86.271374
104354	GOLD	120	1787298120	4619.502078	4619.904616	4617.883684	4619.518454
104355	DOW	120	1787298120	52758.810702	52770.999681	52749.227123	52759.135862
104472	SP500	120	1787298240	7642.155813	7642.779275	7639.348196	7640.637118
104473	CRUDE	120	1787298240	86.270995	86.370000	86.269660	86.344683
104474	GOLD	120	1787298240	4619.379580	4619.968708	4617.880542	4618.234787
104475	DOW	120	1787298240	52760.324389	52772.418930	52752.332135	52761.894292
104592	SP500	120	1787298360	7640.514970	7641.931431	7640.176898	7641.494149
104593	CRUDE	120	1787298360	86.342592	86.432813	86.299442	86.429252
104594	GOLD	120	1787298360	4618.236503	4620.647738	4617.434885	4617.920075
106332	SP500	120	1787300040	7641.572527	7642.390500	7640.316211	7642.249464
106207	SP500	120	1787299920	7641.608231	7642.118360	7639.845069	7641.567540
106208	CRUDE	120	1787299920	86.490704	86.701687	86.490475	86.637559
106209	GOLD	120	1787299920	4622.476929	4622.476929	4619.603226	4620.441667
106210	DOW	120	1787299920	52763.282131	52767.542919	52751.849976	52761.507421
104717	SP500	120	1787298480	7641.634065	7641.911345	7639.507832	7640.966572
104718	CRUDE	120	1787298480	86.430722	86.432042	86.338886	86.354239
104719	GOLD	120	1787298480	4618.054164	4622.288491	4617.434838	4621.572629
104720	DOW	120	1787298480	52764.920071	52769.363863	52749.878597	52757.647707
104721	VIX	120	1787298480	15.803261	15.806530	15.775229	15.778504
105582	SP500	120	1787299320	7640.645982	7642.641341	7640.259586	7641.385877
105583	CRUDE	120	1787299320	86.265721	86.300000	86.207707	86.254430
105584	GOLD	120	1787299320	4622.333953	4622.333953	4618.883292	4618.883292
105585	DOW	120	1787299320	52762.249982	52771.990603	52752.617613	52759.438995
105586	VIX	120	1787299320	15.802767	15.840000	15.799602	15.826588
105462	SP500	120	1787299200	7641.033778	7642.167976	7640.367485	7640.921405
105463	CRUDE	120	1787299200	86.220206	86.311455	86.199488	86.266166
105464	GOLD	120	1787299200	4622.061869	4623.975290	4621.940146	4622.224655
105465	DOW	120	1787299200	52757.183078	52768.358572	52750.010026	52762.326744
105466	VIX	120	1787299200	15.801215	15.807002	15.795343	15.801289
106211	VIX	120	1787299920	15.837772	15.855229	15.837772	15.853416
105832	SP500	120	1787299560	7640.642763	7641.978370	7640.432274	7640.909669
105092	SP500	120	1787298840	7641.470027	7642.281928	7640.448669	7640.531519
105093	CRUDE	120	1787298840	86.321367	86.431100	86.312533	86.413950
105094	GOLD	120	1787298840	4622.537585	4622.791680	4620.206871	4621.456985
105095	DOW	120	1787298840	52756.970686	52765.486276	52754.813976	52761.102367
105096	VIX	120	1787298840	15.781980	15.799594	15.774072	15.781826
104967	SP500	120	1787298720	7642.050136	7642.209609	7640.203574	7641.341219
104595	DOW	120	1787298360	52763.688206	52765.507714	52751.232274	52764.041442
104596	VIX	120	1787298360	15.820052	15.823602	15.800000	15.804808
104968	CRUDE	120	1787298720	86.392383	86.415153	86.284932	86.322399
104969	GOLD	120	1787298720	4620.795794	4623.214995	4620.561845	4622.557083
104970	DOW	120	1787298720	52758.914829	52767.967161	52751.593324	52758.549011
104971	VIX	120	1787298720	15.777464	15.790000	15.773536	15.780441
105833	CRUDE	120	1787299560	86.403135	86.413458	86.363797	86.397795
105834	GOLD	120	1787299560	4618.644994	4621.918543	4618.546678	4621.546026
105835	DOW	120	1787299560	52745.089129	52766.535588	52744.992199	52760.047204
105836	VIX	120	1787299560	15.839677	15.852190	15.832625	15.847319
104842	SP500	120	1787298600	7641.168259	7642.582668	7639.423292	7641.896878
104843	CRUDE	120	1787298600	86.355786	86.419833	86.345940	86.392784
104844	GOLD	120	1787298600	4621.527545	4621.930100	4620.035478	4620.658895
104845	DOW	120	1787298600	52756.952859	52767.084912	52754.440587	52758.407562
104846	VIX	120	1787298600	15.779304	15.790601	15.775207	15.776939
105217	SP500	120	1787298960	7640.253222	7642.496008	7640.252399	7640.983909
105218	CRUDE	120	1787298960	86.411715	86.426388	86.233544	86.240814
105219	GOLD	120	1787298960	4621.518262	4623.868710	4620.220843	4623.770878
105220	DOW	120	1787298960	52761.478519	52768.407665	52753.252020	52763.152313
105221	VIX	120	1787298960	15.782753	15.795321	15.768306	15.769469
105707	SP500	120	1787299440	7641.453608	7642.349570	7639.901180	7640.904882
105708	CRUDE	120	1787299440	86.257363	86.406769	86.212139	86.402178
105709	GOLD	120	1787299440	4618.836800	4619.914527	4617.799369	4618.612099
105710	DOW	120	1787299440	52758.753488	52768.233385	52747.142946	52747.142946
105711	VIX	120	1787299440	15.826319	15.844443	15.823310	15.840251
105342	SP500	120	1787299080	7640.923923	7642.292245	7640.370461	7640.969202
105343	CRUDE	120	1787299080	86.241179	86.241621	86.148184	86.219817
105344	GOLD	120	1787299080	4623.616148	4624.300000	4621.135179	4622.050557
105345	DOW	120	1787299080	52765.176396	52768.969273	52748.899532	52755.130945
105346	VIX	120	1787299080	15.768761	15.801569	15.766324	15.800152
106082	SP500	120	1787299800	7640.880709	7641.791160	7640.005765	7641.517768
106083	CRUDE	120	1787299800	86.364589	86.533256	86.361936	86.489973
106084	GOLD	120	1787299800	4621.273456	4622.582757	4618.726940	4622.421893
106085	DOW	120	1787299800	52761.804508	52766.126468	52755.527960	52764.122584
106086	VIX	120	1787299800	15.839416	15.853464	15.835414	15.837855
106333	CRUDE	120	1787300040	86.638898	86.676031	86.555476	86.555476
106334	GOLD	120	1787300040	4620.585278	4620.680149	4617.642358	4617.644677
105957	SP500	120	1787299680	7640.801294	7642.060990	7638.574059	7641.112086
105958	CRUDE	120	1787299680	86.397850	86.474246	86.359570	86.366022
105959	GOLD	120	1787299680	4621.393706	4621.469315	4618.810517	4621.308139
105960	DOW	120	1787299680	52759.746557	52765.600421	52750.003685	52762.352207
105961	VIX	120	1787299680	15.847634	15.849405	15.835642	15.840847
106335	DOW	120	1787300040	52761.677027	52764.346812	52748.744056	52762.392521
106336	VIX	120	1787300040	15.854666	15.857080	15.826261	15.829057
106582	SP500	120	1787300280	7641.057951	7642.090612	7639.855036	7641.620415
106583	CRUDE	120	1787300280	86.714710	86.735340	86.669420	86.671733
106584	GOLD	120	1787300280	4616.101368	4619.320075	4616.092454	4619.078349
106585	DOW	120	1787300280	52765.052381	52768.118915	52752.916507	52752.916507
106586	VIX	120	1787300280	15.830284	15.837216	15.824468	15.830199
106457	SP500	120	1787300160	7642.503151	7642.602941	7639.758194	7641.328697
106458	CRUDE	120	1787300160	86.552402	86.782806	86.550121	86.716268
106459	GOLD	120	1787300160	4617.805679	4618.118784	4615.591751	4616.158671
106460	DOW	120	1787300160	52762.658937	52766.475798	52749.215615	52763.947126
106461	VIX	120	1787300160	15.829395	15.833975	15.816325	15.830668
106707	SP500	120	1787300400	7641.776417	7642.003737	7640.027077	7640.701931
106708	CRUDE	120	1787300400	86.672080	86.672080	86.526775	86.526775
106709	GOLD	120	1787300400	4619.258129	4620.801487	4618.500000	4620.619657
106710	DOW	120	1787300400	52752.389868	52764.544221	52745.185006	52752.764480
106711	VIX	120	1787300400	15.831393	15.870000	15.825076	15.865772
106832	SP500	120	1787300520	7640.481060	7642.096667	7639.954089	7640.562850
106833	CRUDE	120	1787300520	86.529606	86.602045	86.485013	86.582580
106834	GOLD	120	1787300520	4620.549633	4624.735148	4620.549633	4624.280210
108205	DOW	120	1787301840	52755.761190	52773.163943	52754.301469	52761.323082
108206	VIX	120	1787301840	15.789597	15.804048	15.783291	15.789185
106957	SP500	120	1787300640	7640.404547	7642.718624	7640.160916	7641.385622
106958	CRUDE	120	1787300640	86.581646	86.595376	86.484600	86.498282
106959	GOLD	120	1787300640	4624.112394	4625.118738	4621.166605	4623.596850
106960	DOW	120	1787300640	52754.518317	52764.996534	52753.681085	52760.248681
106961	VIX	120	1787300640	15.881100	15.885615	15.867011	15.867563
108817	SP500	120	1787302440	7641.733417	7642.050042	7639.850066	7641.536876
108818	CRUDE	120	1787302440	86.084098	86.185081	86.077707	86.171549
108819	GOLD	120	1787302440	4639.129612	4640.428092	4637.229745	4637.580496
107827	SP500	120	1787301480	7642.010171	7642.354134	7639.464106	7641.170663
107828	CRUDE	120	1787301480	86.181964	86.210339	86.117599	86.158279
107829	GOLD	120	1787301480	4636.655582	4638.785968	4635.798150	4635.894469
107830	DOW	120	1787301480	52756.368995	52767.832618	52754.092590	52754.092590
107831	VIX	120	1787301480	15.830536	15.840000	15.825523	15.829642
107702	SP500	120	1787301360	7640.356552	7642.438563	7640.298114	7642.022194
107703	CRUDE	120	1787301360	86.043572	86.190000	86.038447	86.183844
107704	GOLD	120	1787301360	4638.137215	4638.267067	4636.042570	4636.797025
107705	DOW	120	1787301360	52762.949415	52766.411096	52751.124862	52755.851981
107706	VIX	120	1787301360	15.834544	15.835382	15.821598	15.831605
107327	SP500	120	1787301000	7641.602861	7641.913961	7640.671806	7641.232213
107328	CRUDE	120	1787301000	86.317083	86.362760	86.259894	86.310682
107329	GOLD	120	1787301000	4629.340991	4633.249167	4628.800000	4633.018301
107330	DOW	120	1787301000	52757.247966	52769.750508	52747.317510	52754.525512
107331	VIX	120	1787301000	15.870130	15.875470	15.864421	15.865378
107202	SP500	120	1787300880	7640.525744	7642.802563	7639.981103	7641.310017
107203	CRUDE	120	1787300880	86.464457	86.544679	86.315587	86.319271
107204	GOLD	120	1787300880	4626.825397	4629.400000	4625.746661	4629.314690
107205	DOW	120	1787300880	52758.124850	52765.763116	52754.068084	52758.409408
107206	VIX	120	1787300880	15.867625	15.882758	15.865452	15.871497
106835	DOW	120	1787300520	52753.384918	52772.406471	52750.344011	52754.948843
106836	VIX	120	1787300520	15.864210	15.886524	15.862210	15.879882
107082	SP500	120	1787300760	7641.480291	7642.326778	7639.945967	7640.649449
107083	CRUDE	120	1787300760	86.495367	86.580796	86.457550	86.461492
107084	GOLD	120	1787300760	4623.472508	4626.982608	4621.533316	4626.815687
107085	DOW	120	1787300760	52758.351611	52764.296280	52750.540986	52759.135172
107086	VIX	120	1787300760	15.866136	15.886317	15.862832	15.868164
107452	SP500	120	1787301120	7641.395852	7642.077786	7639.817842	7641.742000
107453	CRUDE	120	1787301120	86.309095	86.398456	86.302591	86.321942
107454	GOLD	120	1787301120	4633.084889	4634.730827	4631.506839	4634.213152
107455	DOW	120	1787301120	52752.949415	52769.996726	52751.797436	52762.637798
107456	VIX	120	1787301120	15.865430	15.881346	15.846159	15.855445
108820	DOW	120	1787302440	52758.054662	52765.791965	52752.286940	52762.943035
108077	SP500	120	1787301720	7641.225317	7642.100244	7640.044596	7641.601329
108078	CRUDE	120	1787301720	86.219438	86.254536	86.173117	86.181403
108079	GOLD	120	1787301720	4634.163011	4638.748314	4634.159309	4637.111579
108080	DOW	120	1787301720	52751.204204	52763.948698	52749.221017	52757.746737
108081	VIX	120	1787301720	15.811091	15.813733	15.787372	15.788496
107952	SP500	120	1787301600	7641.379994	7642.366280	7640.499425	7641.260487
107577	SP500	120	1787301240	7641.569767	7642.250379	7639.751667	7640.386225
107578	CRUDE	120	1787301240	86.324193	86.328853	86.040000	86.045321
107579	GOLD	120	1787301240	4634.096603	4638.050761	4633.917610	4638.004463
107580	DOW	120	1787301240	52761.252671	52764.848414	52751.302715	52761.066600
107581	VIX	120	1787301240	15.856010	15.858908	15.815988	15.833405
107953	CRUDE	120	1787301600	86.155363	86.218136	86.080457	86.218136
107954	GOLD	120	1787301600	4635.981089	4637.801932	4633.971690	4634.124943
107955	DOW	120	1787301600	52755.257436	52765.845934	52751.463427	52751.463427
107956	VIX	120	1787301600	15.829867	15.831365	15.805326	15.809759
108567	SP500	120	1787302200	7640.749178	7642.888083	7640.149920	7641.026542
108327	SP500	120	1787301960	7641.281352	7642.429804	7640.320790	7641.037846
108328	CRUDE	120	1787301960	86.156385	86.172352	86.114905	86.115377
108329	GOLD	120	1787301960	4639.347573	4640.530318	4637.167547	4638.677515
108330	DOW	120	1787301960	52759.675755	52768.157433	52751.921061	52759.913020
108331	VIX	120	1787301960	15.788145	15.795445	15.777634	15.783637
108568	CRUDE	120	1787302200	86.202561	86.230000	86.012870	86.014260
108202	SP500	120	1787301840	7641.586151	7643.056570	7639.895993	7641.171391
108203	CRUDE	120	1787301840	86.180472	86.379341	86.156596	86.157523
108204	GOLD	120	1787301840	4637.036708	4639.305853	4636.673652	4639.288785
108569	GOLD	120	1787302200	4635.808110	4640.656136	4635.296906	4639.637102
108570	DOW	120	1787302200	52756.826638	52766.652863	52755.410249	52762.708519
108447	SP500	120	1787302080	7640.897151	7641.917654	7639.165774	7640.844580
108448	CRUDE	120	1787302080	86.116758	86.210000	86.090238	86.203459
108571	VIX	120	1787302200	15.790204	15.793915	15.784112	15.793915
108821	VIX	120	1787302440	15.783381	15.783381	15.769692	15.776229
108692	SP500	120	1787302320	7641.183924	7642.045058	7640.578074	7641.811614
108693	CRUDE	120	1787302320	86.014186	86.109340	85.969908	86.082833
108449	GOLD	120	1787302080	4638.723468	4639.999914	4633.688320	4635.940482
108450	DOW	120	1787302080	52757.948399	52769.524399	52754.721267	52758.790895
108451	VIX	120	1787302080	15.783458	15.796613	15.783458	15.790802
108694	GOLD	120	1787302320	4639.557194	4641.205081	4638.051562	4639.001894
108695	DOW	120	1787302320	52762.210169	52768.663538	52748.898162	52756.606062
108696	VIX	120	1787302320	15.792918	15.796426	15.779645	15.782754
108942	SP500	120	1787302560	7641.660370	7642.105250	7640.441031	7641.176572
108943	CRUDE	120	1787302560	86.174323	86.183305	86.057663	86.099886
108944	GOLD	120	1787302560	4637.567571	4640.258294	4637.298989	4639.419240
108945	DOW	120	1787302560	52761.423310	52764.332495	52753.268566	52760.807303
108946	VIX	120	1787302560	15.777497	15.787328	15.764453	15.776163
109067	SP500	120	1787302680	7641.055234	7642.081866	7640.553936	7640.843511
109068	CRUDE	120	1787302680	86.099210	86.115593	86.052384	86.068647
109069	GOLD	120	1787302680	4639.310238	4640.472535	4636.948610	4638.571938
110051	VIX	120	1787303640	15.723094	15.725645	15.717114	15.721585
109922	SP500	120	1787303520	7641.156863	7642.006858	7640.091142	7642.006858
109923	CRUDE	120	1787303520	85.890229	85.907994	85.795428	85.831786
109924	GOLD	120	1787303520	4642.708666	4642.708666	4639.261292	4639.364561
109925	DOW	120	1787303520	52763.355101	52767.952933	52753.964972	52762.636216
109192	SP500	120	1787302800	7641.009135	7642.629347	7640.294241	7640.521628
109193	CRUDE	120	1787302800	86.069375	86.075161	85.962272	85.993218
109194	GOLD	120	1787302800	4638.748287	4640.220276	4637.584176	4638.638778
109195	DOW	120	1787302800	52763.151020	52775.610107	52755.570372	52756.811466
109196	VIX	120	1787302800	15.772342	15.774216	15.762973	15.774216
109926	VIX	120	1787303520	15.734382	15.734382	15.718579	15.721571
109677	SP500	120	1787303280	7641.148952	7642.175303	7639.942019	7641.002852
109557	SP500	120	1787303160	7641.716156	7642.151602	7640.454471	7641.129048
109558	CRUDE	120	1787303160	86.094258	86.094258	85.956585	85.977078
109559	GOLD	120	1787303160	4637.527588	4638.600000	4636.796680	4638.357261
109560	DOW	120	1787303160	52755.201875	52768.924850	52751.936031	52751.936031
109561	VIX	120	1787303160	15.770323	15.772888	15.717456	15.719550
109678	CRUDE	120	1787303280	85.973827	85.979509	85.912017	85.913761
109679	GOLD	120	1787303280	4638.199517	4641.600000	4638.148495	4640.844842
109437	SP500	120	1787303040	7640.000793	7642.026426	7639.473966	7641.749794
109438	CRUDE	120	1787303040	86.080954	86.130922	86.052032	86.095732
109439	GOLD	120	1787303040	4638.454914	4638.856941	4636.853864	4637.692730
109440	DOW	120	1787303040	52759.029157	52768.540000	52750.949747	52755.246883
109441	VIX	120	1787303040	15.769913	15.775823	15.761067	15.770855
109680	DOW	120	1787303280	52750.341626	52764.383773	52750.341626	52762.739745
109681	VIX	120	1787303280	15.718514	15.735577	15.716654	15.728875
109070	DOW	120	1787302680	52759.850438	52765.168232	52752.934733	52761.550245
109071	VIX	120	1787302680	15.776917	15.782387	15.764383	15.770793
110301	VIX	120	1787303880	15.743510	15.754215	15.742776	15.753456
109317	SP500	120	1787302920	7640.719810	7641.798455	7639.698938	7640.119422
109318	CRUDE	120	1787302920	85.996616	86.080387	85.970000	86.079803
109319	GOLD	120	1787302920	4638.499088	4639.770548	4637.074963	4638.452627
109320	DOW	120	1787302920	52757.654820	52766.705326	52751.803100	52760.182901
109321	VIX	120	1787302920	15.775097	15.776393	15.763908	15.770473
110172	SP500	120	1787303760	7640.830237	7642.504263	7640.326968	7640.835306
110173	CRUDE	120	1787303760	85.988592	85.990254	85.923298	85.948519
110174	GOLD	120	1787303760	4642.008639	4646.381677	4641.766358	4645.485875
110175	DOW	120	1787303760	52762.984655	52765.318661	52752.445662	52752.445662
110176	VIX	120	1787303760	15.721036	15.750205	15.720000	15.744913
109797	SP500	120	1787303400	7641.240141	7642.069309	7640.297380	7640.888593
109798	CRUDE	120	1787303400	85.911095	85.961413	85.876458	85.886816
109799	GOLD	120	1787303400	4640.943583	4642.703806	4639.809373	4642.567827
109800	DOW	120	1787303400	52763.945264	52767.553902	52758.038877	52761.722034
109801	VIX	120	1787303400	15.728472	15.734165	15.726273	15.734165
110664	GOLD	120	1787304240	4657.304748	4657.304748	4654.972139	4656.659753
110665	DOW	120	1787304240	52755.935309	52770.029970	52754.177259	52758.012664
110666	VIX	120	1787304240	15.766103	15.783433	15.763522	15.766302
110422	SP500	120	1787304000	7642.178087	7642.336004	7640.346556	7641.089539
110423	CRUDE	120	1787304000	85.936414	86.096175	85.934349	86.095307
110424	GOLD	120	1787304000	4651.057346	4654.676212	4650.938025	4653.868300
110425	DOW	120	1787304000	52751.729103	52768.062389	52750.414626	52755.879146
110426	VIX	120	1787304000	15.754367	15.763023	15.743354	15.762986
110047	SP500	120	1787303640	7642.255687	7642.255687	7640.271625	7640.587401
110048	CRUDE	120	1787303640	85.831921	85.993421	85.827645	85.990998
110049	GOLD	120	1787303640	4639.310439	4643.062899	4639.140863	4642.116832
110050	DOW	120	1787303640	52764.132449	52768.478939	52754.337353	52762.380499
111156	VIX	120	1787304720	15.723097	15.734249	15.717872	15.721391
111027	SP500	120	1787304600	7641.011816	7642.356975	7640.057241	7641.318611
111028	CRUDE	120	1787304600	86.173272	86.222505	86.136680	86.138286
110782	SP500	120	1787304360	7641.114150	7641.883396	7639.683329	7641.266977
110783	CRUDE	120	1787304360	86.076882	86.154096	86.072462	86.119895
110542	SP500	120	1787304120	7641.013571	7641.588630	7639.828939	7641.085359
110543	CRUDE	120	1787304120	86.093242	86.125369	86.056103	86.100833
110544	GOLD	120	1787304120	4653.727724	4657.965602	4653.137873	4657.342125
110784	GOLD	120	1787304360	4656.566607	4658.679819	4656.476845	4657.030977
110297	SP500	120	1787303880	7641.097440	7642.404416	7640.284599	7642.404416
110298	CRUDE	120	1787303880	85.950167	85.987334	85.870000	85.934347
110299	GOLD	120	1787303880	4645.397920	4651.961719	4645.397920	4651.170725
110300	DOW	120	1787303880	52751.492674	52764.913757	52750.015627	52753.192174
110662	SP500	120	1787304240	7640.798638	7642.936138	7640.105440	7641.171759
110663	CRUDE	120	1787304240	86.103457	86.132273	86.051683	86.074165
110785	DOW	120	1787304360	52757.772147	52769.453258	52752.386445	52753.618170
110786	VIX	120	1787304360	15.766525	15.776514	15.756303	15.775934
110545	DOW	120	1787304120	52757.870081	52766.617062	52752.302602	52754.036155
110546	VIX	120	1787304120	15.762934	15.765438	15.754897	15.765438
111029	GOLD	120	1787304600	4650.905194	4650.980769	4646.004904	4646.183696
111030	DOW	120	1787304600	52758.857597	52763.842141	52751.865368	52760.226426
111031	VIX	120	1787304600	15.766581	15.766581	15.724356	15.724356
110902	SP500	120	1787304480	7641.412861	7641.997522	7640.468653	7641.238532
110903	CRUDE	120	1787304480	86.118676	86.190000	86.112235	86.174204
110904	GOLD	120	1787304480	4657.090957	4658.400000	4650.800000	4650.936018
110905	DOW	120	1787304480	52754.610966	52767.520907	52752.179558	52758.066347
110906	VIX	120	1787304480	15.775427	15.776004	15.754116	15.765663
111274	GOLD	120	1787304840	4644.274624	4644.491146	4641.672194	4644.147541
111152	SP500	120	1787304720	7641.480338	7641.913037	7639.371881	7641.562747
111153	CRUDE	120	1787304720	86.138061	86.208175	86.120220	86.194160
111154	GOLD	120	1787304720	4646.320781	4647.938744	4643.686341	4644.205617
111155	DOW	120	1787304720	52760.375296	52762.410511	52752.857617	52759.204194
111272	SP500	120	1787304840	7641.710080	7642.333135	7640.177776	7640.614469
111273	CRUDE	120	1787304840	86.192798	86.261397	86.189870	86.260081
112753	CRUDE	120	1787306280	86.385673	86.450000	86.364388	86.436624
112754	GOLD	120	1787306280	4640.197544	4640.505553	4638.426568	4638.897987
112755	DOW	120	1787306280	52756.692818	52763.605593	52752.038005	52755.756510
112756	VIX	120	1787306280	15.700090	15.706020	15.683988	15.688779
111392	SP500	120	1787304960	7640.397131	7642.814170	7639.892466	7641.193530
111393	CRUDE	120	1787304960	86.257127	86.260006	86.201730	86.206073
111394	GOLD	120	1787304960	4644.073151	4644.943868	4641.924853	4642.088286
111395	DOW	120	1787304960	52769.999312	52773.185808	52749.039003	52764.680331
111396	VIX	120	1787304960	15.728787	15.733623	15.716294	15.719117
112512	SP500	120	1787306040	7640.621485	7641.748486	7639.534342	7640.586016
112513	CRUDE	120	1787306040	86.370327	86.432834	86.357663	86.427810
112514	GOLD	120	1787306040	4640.220499	4641.815633	4638.884498	4640.662598
112515	DOW	120	1787306040	52752.933441	52768.491457	52749.295976	52758.920730
112516	VIX	120	1787306040	15.703306	15.706110	15.694339	15.697812
112267	SP500	120	1787305800	7642.144958	7642.390312	7639.878525	7640.227943
112268	CRUDE	120	1787305800	86.291847	86.337873	86.253828	86.280203
112269	GOLD	120	1787305800	4641.320302	4644.083518	4641.110326	4644.075660
112270	DOW	120	1787305800	52758.331832	52770.288848	52752.032499	52765.555323
112271	VIX	120	1787305800	15.727233	15.735896	15.714471	15.718645
112142	SP500	120	1787305680	7640.232242	7642.431427	7640.063340	7642.041010
112143	CRUDE	120	1787305680	86.401789	86.408772	86.260422	86.288918
112144	GOLD	120	1787305680	4641.486098	4643.551997	4640.554500	4641.297774
112145	DOW	120	1787305680	52759.915487	52766.920884	52753.409492	52758.807803
112146	VIX	120	1787305680	15.730187	15.737013	15.725887	15.726844
111767	SP500	120	1787305320	7641.080272	7642.508827	7640.612523	7641.202980
111768	CRUDE	120	1787305320	86.105135	86.260000	86.105135	86.249768
111769	GOLD	120	1787305320	4641.719760	4642.670403	4639.549184	4639.640036
111770	DOW	120	1787305320	52768.268633	52768.880823	52749.872248	52755.206698
111771	VIX	120	1787305320	15.732531	15.738458	15.723186	15.724675
111642	SP500	120	1787305200	7641.304251	7642.051568	7639.873516	7641.231096
111643	CRUDE	120	1787305200	86.216400	86.323438	86.068636	86.106869
111275	DOW	120	1787304840	52758.810751	52771.073811	52751.810648	52770.538321
111276	VIX	120	1787304840	15.721772	15.730000	15.713508	15.727822
111644	GOLD	120	1787305200	4639.084974	4641.881350	4639.075338	4641.881350
111645	DOW	120	1787305200	52754.198521	52768.637041	52748.225695	52767.432215
111646	VIX	120	1787305200	15.730787	15.737961	15.722640	15.732461
111517	SP500	120	1787305080	7641.382424	7642.585252	7640.223920	7641.542152
111518	CRUDE	120	1787305080	86.208644	86.262136	86.179350	86.217756
111519	GOLD	120	1787305080	4642.198266	4642.198266	4638.406620	4639.172467
111520	DOW	120	1787305080	52763.890377	52772.396996	52752.960775	52752.960775
111521	VIX	120	1787305080	15.720536	15.731019	15.713769	15.730520
111892	SP500	120	1787305440	7641.153408	7642.633356	7640.211717	7641.820942
111893	CRUDE	120	1787305440	86.250018	86.342019	86.242836	86.287448
111894	GOLD	120	1787305440	4639.555141	4641.878369	4639.065134	4639.606605
111895	DOW	120	1787305440	52753.307939	52767.896441	52751.622913	52764.897920
111896	VIX	120	1787305440	15.725700	15.733103	15.719008	15.732443
112392	SP500	120	1787305920	7640.016504	7642.111798	7639.908883	7640.903447
112393	CRUDE	120	1787305920	86.281174	86.374516	86.281174	86.372233
112394	GOLD	120	1787305920	4643.890460	4644.010768	4640.217658	4640.321226
112395	DOW	120	1787305920	52765.569362	52766.918439	52752.102653	52753.643012
112396	VIX	120	1787305920	15.719613	15.719613	15.694079	15.703391
112017	SP500	120	1787305560	7641.946710	7642.628702	7640.367554	7640.417209
112018	CRUDE	120	1787305560	86.288476	86.405324	86.283510	86.399675
112019	GOLD	120	1787305560	4639.501240	4641.964484	4639.034245	4641.491524
112020	DOW	120	1787305560	52765.681718	52770.566981	52752.702572	52760.450685
112021	VIX	120	1787305560	15.733617	15.740799	15.724812	15.728718
112992	SP500	120	1787306520	7640.811396	7643.221659	7639.734526	7640.711689
112632	SP500	120	1787306160	7640.573801	7642.038226	7639.594225	7639.691388
112633	CRUDE	120	1787306160	86.424362	86.450463	86.372744	86.384993
112634	GOLD	120	1787306160	4640.758604	4640.789533	4638.216880	4640.142469
112635	DOW	120	1787306160	52760.510197	52769.188103	52754.877699	52758.113234
112636	VIX	120	1787306160	15.698333	15.704181	15.696990	15.698724
112872	SP500	120	1787306400	7641.900111	7641.900111	7639.954283	7641.042855
112873	CRUDE	120	1787306400	86.434737	86.511676	86.400897	86.503413
112874	GOLD	120	1787306400	4638.776733	4639.308371	4637.427654	4638.555746
112875	DOW	120	1787306400	52755.017503	52768.851249	52754.162108	52756.140229
112876	VIX	120	1787306400	15.690315	15.694145	15.679206	15.692720
112993	CRUDE	120	1787306520	86.502980	86.578364	86.496491	86.577184
112994	GOLD	120	1787306520	4638.450274	4639.800206	4638.048667	4639.564831
112995	DOW	120	1787306520	52755.259988	52762.831262	52752.671915	52758.808155
112996	VIX	120	1787306520	15.693002	15.701836	15.684069	15.696738
112752	SP500	120	1787306280	7639.969069	7642.133005	7639.944069	7642.015570
113242	SP500	120	1787306760	7640.284325	7642.009145	7639.700868	7641.848028
113243	CRUDE	120	1787306760	86.490428	86.496792	86.458092	86.467718
113244	GOLD	120	1787306760	4642.801647	4642.907152	4641.065973	4641.605574
113245	DOW	120	1787306760	52754.149111	52765.729141	52752.761583	52759.212523
113246	VIX	120	1787306760	15.697453	15.698627	15.676910	15.681134
113117	SP500	120	1787306640	7640.443673	7642.018463	7639.375394	7640.140455
113118	CRUDE	120	1787306640	86.578380	86.581879	86.467543	86.493461
113119	GOLD	120	1787306640	4639.390598	4642.971234	4639.302212	4642.843680
113120	DOW	120	1787306640	52757.614942	52768.025292	52755.212070	52755.212070
113121	VIX	120	1787306640	15.697076	15.703463	15.688717	15.696681
113367	SP500	120	1787306880	7641.997587	7642.166518	7640.234905	7640.737261
113368	CRUDE	120	1787306880	86.469144	86.542673	86.425559	86.541365
113369	GOLD	120	1787306880	4641.790843	4641.837371	4638.292808	4640.109311
113370	DOW	120	1787306880	52757.222955	52767.413807	52751.698487	52760.707397
113371	VIX	120	1787306880	15.681357	15.694233	15.679440	15.689175
113492	SP500	120	1787307000	7640.936845	7642.208516	7639.718123	7640.506684
113493	CRUDE	120	1787307000	86.538577	86.710607	86.534677	86.670064
113494	GOLD	120	1787307000	4640.096020	4643.200000	4638.533993	4642.941399
114868	CRUDE	120	1787308320	87.221711	87.263634	87.107753	87.126675
114869	GOLD	120	1787308320	4640.577158	4642.478077	4640.460624	4642.341637
114870	DOW	120	1787308320	52758.693892	52769.919387	52748.653704	52755.335430
114871	VIX	120	1787308320	15.728793	15.731880	15.716177	15.719068
113617	SP500	120	1787307120	7640.690223	7642.055931	7640.301672	7641.567787
113618	CRUDE	120	1787307120	86.671299	86.872219	86.645788	86.864488
113619	GOLD	120	1787307120	4643.059738	4645.743252	4642.761111	4644.013407
113620	DOW	120	1787307120	52756.191915	52765.388302	52752.108633	52760.134530
113621	VIX	120	1787307120	15.679937	15.686149	15.672202	15.678827
115492	SP500	120	1787308920	7642.325772	7642.855838	7640.216973	7640.745710
115242	SP500	120	1787308680	7641.000664	7642.631967	7640.537216	7641.397903
115117	SP500	120	1787308560	7640.993636	7642.266776	7640.132102	7640.745418
114492	SP500	120	1787307960	7641.185219	7642.696846	7640.552500	7641.395725
114493	CRUDE	120	1787307960	87.261345	87.290000	87.167402	87.169604
114494	GOLD	120	1787307960	4637.488815	4641.471938	4637.068811	4641.419992
114495	DOW	120	1787307960	52758.632928	52767.027056	52753.245379	52758.684671
114496	VIX	120	1787307960	15.682234	15.733107	15.675267	15.731884
114367	SP500	120	1787307840	7640.685430	7641.887073	7639.983656	7640.916350
114368	CRUDE	120	1787307840	87.435954	87.444957	87.240000	87.258220
114369	GOLD	120	1787307840	4635.547785	4637.945839	4635.209577	4637.355081
114370	DOW	120	1787307840	52760.583609	52766.140765	52750.501362	52757.766986
114371	VIX	120	1787307840	15.665855	15.683024	15.664159	15.683024
113992	SP500	120	1787307480	7641.804640	7642.555502	7640.428357	7640.523971
113993	CRUDE	120	1787307480	87.134400	87.330000	87.132986	87.210167
113994	GOLD	120	1787307480	4640.016684	4641.542940	4638.029248	4639.884467
113995	DOW	120	1787307480	52762.623101	52765.160791	52756.488200	52760.892691
113996	VIX	120	1787307480	15.634218	15.638644	15.626301	15.630630
113867	SP500	120	1787307360	7641.724772	7641.994105	7640.586872	7641.561972
113495	DOW	120	1787307000	52761.636492	52764.925324	52747.901608	52755.861197
113496	VIX	120	1787307000	15.689159	15.696873	15.674823	15.678994
113868	CRUDE	120	1787307360	86.972089	87.137362	86.970799	87.135939
113869	GOLD	120	1787307360	4640.806196	4642.646242	4639.935668	4639.951806
113870	DOW	120	1787307360	52751.458288	52764.360035	52750.780245	52761.643653
113871	VIX	120	1787307360	15.649472	15.654391	15.628659	15.634872
113742	SP500	120	1787307240	7641.271302	7642.080322	7639.958730	7641.773930
113743	CRUDE	120	1787307240	86.865590	86.983231	86.863582	86.973488
113744	GOLD	120	1787307240	4643.899770	4644.200000	4640.701918	4640.846987
113745	DOW	120	1787307240	52759.171486	52768.583377	52746.762346	52749.985598
113746	VIX	120	1787307240	15.679958	15.682565	15.648455	15.650729
114117	SP500	120	1787307600	7640.341190	7641.974989	7640.231253	7641.549486
114118	CRUDE	120	1787307600	87.212126	87.420000	87.207121	87.408695
114119	GOLD	120	1787307600	4639.840959	4640.745096	4637.224880	4637.247687
114120	DOW	120	1787307600	52762.455434	52767.911275	52753.601361	52757.781743
114121	VIX	120	1787307600	15.629896	15.635438	15.622243	15.622243
115118	CRUDE	120	1787308560	86.994229	86.995524	86.693512	86.736456
114742	SP500	120	1787308200	7641.169072	7641.999505	7640.016975	7641.474123
114743	CRUDE	120	1787308200	87.227303	87.323060	87.189028	87.223897
114744	GOLD	120	1787308200	4641.075005	4643.539175	4640.256267	4640.506852
114745	DOW	120	1787308200	52763.428025	52764.721902	52749.918766	52757.216497
114746	VIX	120	1787308200	15.737927	15.743464	15.727693	15.728040
114617	SP500	120	1787308080	7641.603144	7642.189269	7639.786343	7641.455224
114618	CRUDE	120	1787308080	87.170512	87.232664	87.100000	87.229447
114619	GOLD	120	1787308080	4641.551861	4643.926978	4640.593102	4641.251180
114620	DOW	120	1787308080	52756.827555	52765.254387	52745.990493	52761.476588
114242	SP500	120	1787307720	7641.745439	7642.325241	7640.084768	7640.577688
114243	CRUDE	120	1787307720	87.406885	87.484920	87.404385	87.438281
114244	GOLD	120	1787307720	4637.081720	4638.441433	4635.189315	4635.377500
114245	DOW	120	1787307720	52756.364158	52764.698274	52749.465961	52761.445192
114246	VIX	120	1787307720	15.622939	15.672109	15.622380	15.666881
114621	VIX	120	1787308080	15.731513	15.753889	15.730901	15.739083
115119	GOLD	120	1787308560	4642.795450	4646.391842	4642.665748	4644.426043
115120	DOW	120	1787308560	52766.757176	52768.639476	52754.217593	52758.397128
115121	VIX	120	1787308560	15.723549	15.733265	15.717677	15.721222
115243	CRUDE	120	1787308680	86.734056	86.775305	86.629688	86.634980
115244	GOLD	120	1787308680	4644.242518	4646.323975	4642.795549	4645.428177
114992	SP500	120	1787308440	7641.360861	7641.751745	7640.014150	7641.026808
114993	CRUDE	120	1787308440	87.128818	87.135407	86.986197	86.994913
114994	GOLD	120	1787308440	4642.387807	4644.580961	4641.854783	4642.959785
114995	DOW	120	1787308440	52754.161861	52769.405883	52752.249337	52768.258232
114867	SP500	120	1787308320	7641.740846	7642.215468	7639.597067	7641.232901
115245	DOW	120	1787308680	52756.818509	52762.635943	52752.698002	52754.973020
115246	VIX	120	1787308680	15.721691	15.724397	15.713625	15.721013
114996	VIX	120	1787308440	15.720531	15.723327	15.708240	15.722353
115493	CRUDE	120	1787308920	86.798323	86.815364	86.739149	86.814096
115494	GOLD	120	1787308920	4642.840174	4646.213918	4642.775940	4645.757942
115495	DOW	120	1787308920	52761.292732	52765.474070	52751.650284	52761.738581
115496	VIX	120	1787308920	15.712913	15.717087	15.694045	15.699948
115367	SP500	120	1787308800	7641.120466	7642.565507	7640.085755	7642.565507
115368	CRUDE	120	1787308800	86.636597	86.823431	86.635687	86.796334
115369	GOLD	120	1787308800	4645.497738	4646.232612	4642.823409	4642.998525
115370	DOW	120	1787308800	52756.807487	52766.554654	52750.174689	52762.499018
115371	VIX	120	1787308800	15.720030	15.722571	15.707438	15.711470
115617	SP500	120	1787309040	7640.803518	7642.775369	7640.174074	7641.965077
115618	CRUDE	120	1787309040	86.811454	86.862381	86.807472	86.833580
115619	GOLD	120	1787309040	4645.614586	4648.700000	4645.606875	4647.818081
115620	DOW	120	1787309040	52761.341910	52768.488894	52751.132891	52751.650134
115621	VIX	120	1787309040	15.698582	15.703860	15.686067	15.687145
115742	SP500	120	1787309160	7641.787458	7642.063837	7640.735007	7641.300907
115743	CRUDE	120	1787309160	86.832335	86.837311	86.696165	86.698687
115744	GOLD	120	1787309160	4647.732570	4649.507304	4646.543718	4649.507304
116971	VIX	120	1787310360	15.702301	15.704089	15.684005	15.685626
116602	SP500	120	1787310000	7642.034940	7642.335002	7639.835714	7640.611080
116603	CRUDE	120	1787310000	86.946644	87.012454	86.939330	86.991240
116604	GOLD	120	1787310000	4648.274081	4648.624999	4646.140699	4647.111689
115867	SP500	120	1787309280	7641.305179	7642.371154	7639.958134	7641.341303
115868	CRUDE	120	1787309280	86.698244	86.801995	86.698244	86.799067
115869	GOLD	120	1787309280	4649.653629	4650.873289	4648.987125	4650.224638
115870	DOW	120	1787309280	52758.807934	52766.366638	52753.103756	52759.859648
115871	VIX	120	1787309280	15.688452	15.705975	15.686186	15.696410
116605	DOW	120	1787310000	52759.409520	52773.847191	52751.952323	52752.999133
116606	VIX	120	1787310000	15.694475	15.704967	15.694475	15.700295
116842	SP500	120	1787310240	7641.371758	7642.729815	7639.909178	7641.000463
116843	CRUDE	120	1787310240	87.036979	87.045467	86.998379	87.022036
116844	GOLD	120	1787310240	4648.604710	4649.765090	4646.536355	4647.949704
116845	DOW	120	1787310240	52757.673914	52766.724995	52753.815822	52760.362141
116846	VIX	120	1787310240	15.697946	15.705214	15.695281	15.703018
116362	SP500	120	1787309760	7641.794807	7642.101550	7640.236729	7640.487590
116242	SP500	120	1787309640	7642.238592	7642.623752	7640.356887	7641.490109
116243	CRUDE	120	1787309640	86.799232	86.837192	86.766888	86.801893
116244	GOLD	120	1787309640	4651.831881	4652.018061	4648.976395	4650.386761
116245	DOW	120	1787309640	52762.321540	52765.880932	52751.847574	52762.092362
116246	VIX	120	1787309640	15.702047	15.702834	15.686330	15.689652
116363	CRUDE	120	1787309760	86.802447	86.910984	86.766604	86.868969
116364	GOLD	120	1787309760	4650.254495	4650.413025	4647.722388	4648.481976
116117	SP500	120	1787309520	7641.182751	7642.959073	7639.802244	7642.329646
115745	DOW	120	1787309160	52751.571920	52765.221835	52748.359797	52758.128888
115746	VIX	120	1787309160	15.688251	15.693082	15.683620	15.689757
116118	CRUDE	120	1787309520	86.782050	86.803663	86.728043	86.802439
116119	GOLD	120	1787309520	4649.680731	4651.755592	4648.578008	4651.755592
116120	DOW	120	1787309520	52757.622178	52769.354059	52751.640567	52762.040844
116121	VIX	120	1787309520	15.690087	15.705637	15.685779	15.700660
116365	DOW	120	1787309760	52761.418160	52762.643157	52748.799482	52751.858431
116366	VIX	120	1787309760	15.689483	15.698598	15.677684	15.679903
115992	SP500	120	1787309400	7641.407857	7642.705843	7640.185955	7641.423622
115993	CRUDE	120	1787309400	86.801716	86.821604	86.767388	86.781621
115994	GOLD	120	1787309400	4650.170187	4651.337841	4648.986208	4649.545157
115995	DOW	120	1787309400	52761.494710	52764.750374	52753.668152	52759.107378
115996	VIX	120	1787309400	15.697142	15.703407	15.687361	15.689604
117463	CRUDE	120	1787310840	87.131553	87.163362	87.110297	87.153115
117464	GOLD	120	1787310840	4650.989214	4653.008288	4650.532579	4651.613072
117217	SP500	120	1787310600	7641.396424	7642.270167	7639.679757	7639.815867
117218	CRUDE	120	1787310600	87.073330	87.081360	87.014950	87.081360
117219	GOLD	120	1787310600	4645.358094	4646.139374	4644.101054	4645.548195
116482	SP500	120	1787309880	7640.192677	7642.158082	7639.673617	7641.788120
116483	CRUDE	120	1787309880	86.868862	86.950000	86.864336	86.944804
116484	GOLD	120	1787309880	4648.445930	4649.313481	4646.619446	4648.272658
116485	DOW	120	1787309880	52753.340130	52763.509660	52750.289660	52757.827848
116486	VIX	120	1787309880	15.679699	15.693676	15.677229	15.693676
117220	DOW	120	1787310600	52755.011539	52764.559755	52753.077097	52755.995957
117221	VIX	120	1787310600	15.669301	15.673006	15.665210	15.666134
117092	SP500	120	1787310480	7641.798696	7642.346263	7639.820357	7641.212032
117093	CRUDE	120	1787310480	87.111474	87.158488	87.048510	87.070289
117094	GOLD	120	1787310480	4646.125142	4646.198515	4644.977401	4645.209477
117095	DOW	120	1787310480	52766.819434	52769.663124	52747.623355	52755.359139
117096	VIX	120	1787310480	15.684157	15.691816	15.659739	15.668447
116722	SP500	120	1787310120	7640.413573	7641.890821	7639.466587	7641.147364
116723	CRUDE	120	1787310120	86.993752	87.046676	86.978403	87.039803
116724	GOLD	120	1787310120	4647.020259	4648.956835	4645.800000	4648.659414
116725	DOW	120	1787310120	52752.497572	52767.733059	52750.622851	52756.265905
116726	VIX	120	1787310120	15.701753	15.707804	15.691824	15.698708
117465	DOW	120	1787310840	52753.708308	52769.284455	52751.112624	52761.116596
117466	VIX	120	1787310840	15.669611	15.692173	15.663440	15.691887
117342	SP500	120	1787310720	7639.742037	7641.951705	7639.385640	7640.938136
117343	CRUDE	120	1787310720	87.084345	87.134782	87.021227	87.128690
116967	SP500	120	1787310360	7640.910537	7642.356346	7639.904579	7641.935774
116968	CRUDE	120	1787310360	87.021521	87.120000	87.014987	87.108199
116969	GOLD	120	1787310360	4647.831915	4647.831915	4645.365190	4646.110779
116970	DOW	120	1787310360	52758.678630	52765.822111	52755.372725	52765.813007
117344	GOLD	120	1787310720	4645.720155	4651.934773	4645.720155	4651.062484
117345	DOW	120	1787310720	52756.984825	52766.291948	52752.402147	52754.707495
117346	VIX	120	1787310720	15.666630	15.675724	15.666183	15.669656
117583	CRUDE	120	1787310960	87.151545	87.156362	87.114113	87.132744
117584	GOLD	120	1787310960	4651.526608	4652.700000	4649.207959	4650.483734
117585	DOW	120	1787310960	52759.592376	52766.093747	52751.614921	52754.854790
117707	SP500	120	1787311080	7641.336387	7642.233585	7639.697884	7641.749026
117708	CRUDE	120	1787311080	87.130674	87.240242	87.130674	87.207960
117462	SP500	120	1787310840	7641.135141	7641.985258	7640.518102	7641.176420
117709	GOLD	120	1787311080	4650.481386	4652.295006	4647.759491	4648.016298
117582	SP500	120	1787310960	7641.043039	7642.530187	7640.144624	7641.368936
117586	VIX	120	1787310960	15.692332	15.695184	15.686674	15.687471
117710	DOW	120	1787311080	52756.131022	52763.843765	52749.489528	52756.878603
117711	VIX	120	1787311080	15.686483	15.698419	15.678173	15.689613
117832	SP500	120	1787311200	7641.949054	7642.311325	7640.061880	7641.598061
117833	CRUDE	120	1787311200	87.206222	87.234098	87.090000	87.124513
117834	GOLD	120	1787311200	4647.894214	4650.400000	4647.894214	4649.676553
117835	DOW	120	1787311200	52758.096979	52768.684100	52747.841457	52752.211843
117836	VIX	120	1787311200	15.690852	15.699018	15.655142	15.661604
117957	SP500	120	1787311320	7641.347067	7642.396138	7640.768625	7641.262300
117958	CRUDE	120	1787311320	87.121911	87.191408	87.118984	87.185295
117959	GOLD	120	1787311320	4649.617534	4649.617534	4645.383458	4645.975838
119572	SP500	120	1787312880	7640.777381	7641.920107	7640.417960	7640.873968
119573	CRUDE	120	1787312880	86.143738	86.344097	86.143738	86.344097
119574	GOLD	120	1787312880	4661.579156	4661.579156	4654.900000	4655.292180
119575	DOW	120	1787312880	52758.403689	52764.570646	52754.309333	52763.911190
119576	VIX	120	1787312880	15.521418	15.522843	15.505511	15.505511
118082	SP500	120	1787311440	7641.515110	7642.244165	7640.268782	7642.244165
118083	CRUDE	120	1787311440	87.187744	87.250000	87.173470	87.247740
118084	GOLD	120	1787311440	4646.086442	4649.884015	4645.670103	4649.077467
118085	DOW	120	1787311440	52753.987839	52763.084908	52752.810273	52753.989737
118086	VIX	120	1787311440	15.669488	15.674660	15.652854	15.662705
119447	SP500	120	1787312760	7641.239567	7641.680332	7639.532968	7640.734170
119207	SP500	120	1787312520	7641.849992	7642.491392	7640.046665	7640.261103
119208	CRUDE	120	1787312520	86.398280	86.500418	86.396517	86.444487
119209	GOLD	120	1787312520	4653.620271	4653.945712	4649.961629	4652.356974
119210	DOW	120	1787312520	52759.735682	52769.203388	52754.077840	52769.203388
118957	SP500	120	1787312280	7640.797664	7641.874259	7640.413148	7641.684246
118958	CRUDE	120	1787312280	86.441656	86.445983	86.365739	86.418354
118959	GOLD	120	1787312280	4653.039810	4656.542814	4653.039810	4656.114680
118960	DOW	120	1787312280	52763.885481	52765.540354	52753.068009	52755.698113
118961	VIX	120	1787312280	15.601559	15.603110	15.535521	15.544130
118832	SP500	120	1787312160	7641.841535	7642.082290	7640.014529	7641.094016
118833	CRUDE	120	1787312160	86.461080	86.648519	86.395427	86.443293
118834	GOLD	120	1787312160	4656.869284	4657.128938	4652.820545	4652.930961
118835	DOW	120	1787312160	52757.431852	52772.287681	52756.199137	52762.701788
118836	VIX	120	1787312160	15.639798	15.641655	15.584127	15.601664
118457	SP500	120	1787311800	7640.897199	7642.625950	7640.335007	7642.625950
118458	CRUDE	120	1787311800	87.158025	87.160256	87.012829	87.035604
118459	GOLD	120	1787311800	4653.555874	4656.211498	4652.378132	4655.954879
118460	DOW	120	1787311800	52755.524490	52765.565438	52753.875041	52761.444790
118461	VIX	120	1787311800	15.671439	15.674559	15.633219	15.641971
118332	SP500	120	1787311680	7641.374709	7642.087142	7639.717886	7641.168792
117960	DOW	120	1787311320	52752.970065	52769.132743	52751.713428	52756.077385
117961	VIX	120	1787311320	15.660293	15.672193	15.654195	15.671042
118333	CRUDE	120	1787311680	87.166653	87.196751	87.123767	87.155906
118334	GOLD	120	1787311680	4650.792399	4655.089105	4650.792399	4653.566383
118335	DOW	120	1787311680	52753.825614	52764.447884	52747.733531	52754.944189
118336	VIX	120	1787311680	15.670028	15.677532	15.665428	15.672229
118207	SP500	120	1787311560	7642.256310	7642.472094	7640.064114	7641.472001
118208	CRUDE	120	1787311560	87.250589	87.251532	87.166572	87.167792
118209	GOLD	120	1787311560	4649.020004	4651.121881	4648.547513	4650.739671
118210	DOW	120	1787311560	52753.669751	52763.559447	52749.600450	52754.245471
118211	VIX	120	1787311560	15.661621	15.670076	15.655796	15.670076
118582	SP500	120	1787311920	7642.509903	7642.966198	7640.063527	7640.660339
118583	CRUDE	120	1787311920	87.038738	87.067541	86.850099	86.851291
118584	GOLD	120	1787311920	4655.966179	4656.494454	4653.552908	4653.770424
118585	DOW	120	1787311920	52762.783360	52767.143188	52753.324697	52763.245603
118586	VIX	120	1787311920	15.642666	15.651667	15.634098	15.638030
119211	VIX	120	1787312520	15.488513	15.504191	15.485902	15.502374
119448	CRUDE	120	1787312760	86.324715	86.328855	86.141642	86.142355
119449	GOLD	120	1787312760	4654.360390	4661.718184	4654.360390	4661.687620
119450	DOW	120	1787312760	52756.133452	52772.135567	52749.227051	52759.659707
119082	SP500	120	1787312400	7641.821022	7642.280992	7640.255828	7642.082241
119083	CRUDE	120	1787312400	86.416609	86.444147	86.384289	86.401306
119084	GOLD	120	1787312400	4656.099880	4656.387767	4653.650793	4653.650793
119085	DOW	120	1787312400	52756.714334	52767.239917	52752.295336	52759.599034
118707	SP500	120	1787312040	7640.694279	7642.330200	7639.936339	7641.632687
118708	CRUDE	120	1787312040	86.850823	86.853257	86.450000	86.458427
118709	GOLD	120	1787312040	4653.929734	4657.582646	4653.549188	4656.910553
118710	DOW	120	1787312040	52763.066240	52765.093374	52750.127702	52756.242013
118711	VIX	120	1787312040	15.638313	15.646801	15.633589	15.638423
119086	VIX	120	1787312400	15.544922	15.556088	15.486447	15.487700
119451	VIX	120	1787312760	15.492223	15.521797	15.482793	15.521797
119327	SP500	120	1787312640	7640.106259	7641.701404	7639.861889	7641.495992
119328	CRUDE	120	1787312640	86.441787	86.471427	86.322169	86.322514
119329	GOLD	120	1787312640	4652.322754	4655.413389	4652.007969	4654.278060
119330	DOW	120	1787312640	52767.282240	52771.784690	52753.558610	52755.934516
119331	VIX	120	1787312640	15.502055	15.502315	15.483327	15.492140
119698	CRUDE	120	1787313000	86.344383	86.521358	86.333147	86.512665
119699	GOLD	120	1787313000	4655.171971	4655.839217	4651.110729	4651.897130
119700	DOW	120	1787313000	52765.470712	52766.712490	52752.203636	52761.761441
119701	VIX	120	1787313000	15.506041	15.510651	15.457620	15.459482
119823	CRUDE	120	1787313120	86.512790	86.512790	86.406996	86.497790
119947	SP500	120	1787313240	7640.572833	7642.646824	7640.221234	7640.565014
119948	CRUDE	120	1787313240	86.501130	86.560000	86.427940	86.440483
119697	SP500	120	1787313000	7641.172611	7641.966283	7639.566571	7641.003883
119824	GOLD	120	1787313120	4651.942050	4652.224438	4650.873056	4652.022661
119825	DOW	120	1787313120	52763.432704	52768.533885	52753.930883	52754.363484
119949	GOLD	120	1787313240	4652.066374	4655.476540	4651.909652	4654.326058
119822	SP500	120	1787313120	7641.275060	7641.851271	7639.608259	7640.559788
119826	VIX	120	1787313120	15.459929	15.475127	15.447433	15.451081
119950	DOW	120	1787313240	52752.789252	52764.878274	52749.517581	52764.878274
119951	VIX	120	1787313240	15.452584	15.472568	15.451664	15.458958
120072	SP500	120	1787313360	7640.788009	7642.196489	7639.959807	7641.844615
120073	CRUDE	120	1787313360	86.443416	86.565783	86.439228	86.565424
120074	GOLD	120	1787313360	4654.398898	4656.378818	4653.877206	4656.114861
120075	DOW	120	1787313360	52766.084352	52772.564454	52749.494921	52764.397948
120076	VIX	120	1787313360	15.457508	15.464583	15.445367	15.450242
120197	SP500	120	1787313480	7641.663593	7642.178649	7639.409836	7640.520346
120198	CRUDE	120	1787313480	86.565661	86.617029	86.551514	86.613864
120199	GOLD	120	1787313480	4656.005613	4657.244406	4655.231476	4657.244406
121183	CRUDE	120	1787314440	86.948048	87.000000	86.794742	86.795802
121184	GOLD	120	1787314440	4650.637579	4656.263988	4650.301665	4654.041203
121185	DOW	120	1787314440	52755.328665	52765.171248	52748.048287	52761.883475
121186	VIX	120	1787314440	15.452925	15.461599	15.439055	15.458922
120322	SP500	120	1787313600	7640.578927	7642.077970	7640.458657	7641.519086
120323	CRUDE	120	1787313600	86.615701	86.774204	86.615093	86.773133
120324	GOLD	120	1787313600	4657.145792	4657.692893	4654.776672	4655.351876
120325	DOW	120	1787313600	52762.829714	52768.138105	52755.044809	52759.704060
120326	VIX	120	1787313600	15.448301	15.461800	15.436125	15.461800
121057	SP500	120	1787314320	7641.191246	7642.736649	7640.197669	7640.285183
121058	CRUDE	120	1787314320	86.927942	86.992740	86.920597	86.947837
121059	GOLD	120	1787314320	4658.621980	4658.637852	4650.691237	4650.790746
121060	DOW	120	1787314320	52759.572420	52764.351071	52750.803343	52755.857984
121061	VIX	120	1787314320	15.454612	15.461661	15.444622	15.451720
121912	SP500	120	1787315160	7640.903090	7642.323888	7640.080914	7641.390896
121913	CRUDE	120	1787315160	87.134843	87.143644	87.053915	87.059805
121552	SP500	120	1787314800	7640.600965	7642.282263	7640.154756	7641.048340
120817	SP500	120	1787314080	7641.261689	7642.433029	7640.238990	7641.660692
120697	SP500	120	1787313960	7640.415423	7642.634825	7639.739425	7641.124230
120698	CRUDE	120	1787313960	86.882600	86.891757	86.825891	86.868186
120699	GOLD	120	1787313960	4655.329230	4655.919207	4654.437831	4655.919207
120700	DOW	120	1787313960	52758.647070	52760.929103	52752.055470	52757.866154
120701	VIX	120	1787313960	15.456595	15.467076	15.454217	15.462930
120818	CRUDE	120	1787314080	86.867163	86.950108	86.850000	86.939073
120572	SP500	120	1787313840	7641.126479	7642.577634	7640.100800	7640.411015
120573	CRUDE	120	1787313840	86.815907	86.893836	86.813010	86.882398
120200	DOW	120	1787313480	52765.812089	52773.148968	52750.540799	52762.857536
120201	VIX	120	1787313480	15.449686	15.466445	15.444202	15.449573
120574	GOLD	120	1787313840	4653.654442	4656.317608	4653.333524	4655.508452
120575	DOW	120	1787313840	52757.567043	52767.709312	52753.848204	52760.516358
120576	VIX	120	1787313840	15.463451	15.466630	15.455963	15.457805
120819	GOLD	120	1787314080	4655.911986	4656.259551	4653.844290	4654.365439
120820	DOW	120	1787314080	52757.856399	52767.711265	52750.700173	52750.700173
120821	VIX	120	1787314080	15.463101	15.467305	15.446446	15.460459
120447	SP500	120	1787313720	7641.626890	7642.428946	7639.985792	7641.253119
120448	CRUDE	120	1787313720	86.776055	86.831669	86.733253	86.816487
120449	GOLD	120	1787313720	4655.407982	4656.304135	4653.400000	4653.549862
120450	DOW	120	1787313720	52760.917894	52764.676731	52753.733164	52758.286654
120451	VIX	120	1787313720	15.462354	15.486042	15.456041	15.462825
121553	CRUDE	120	1787314800	86.827279	87.016047	86.827231	87.016047
121554	GOLD	120	1787314800	4649.899413	4651.323643	4646.839991	4647.237745
121555	DOW	120	1787314800	52762.559002	52766.810882	52751.412435	52762.465004
121556	VIX	120	1787314800	15.488543	15.491297	15.470000	15.472757
121307	SP500	120	1787314560	7641.020958	7642.154153	7639.848749	7641.776132
121308	CRUDE	120	1787314560	86.792742	86.861736	86.788604	86.842428
121309	GOLD	120	1787314560	4654.155471	4654.416523	4651.741489	4652.632762
121310	DOW	120	1787314560	52763.530468	52768.869006	52749.818588	52758.559124
120937	SP500	120	1787314200	7641.893799	7642.619866	7640.413227	7641.286523
120938	CRUDE	120	1787314200	86.942075	86.950000	86.906701	86.930555
120939	GOLD	120	1787314200	4654.210016	4658.649504	4653.119113	4658.649504
120940	DOW	120	1787314200	52750.277723	52764.417342	52746.319430	52760.663408
120941	VIX	120	1787314200	15.461629	15.466821	15.444607	15.453156
121311	VIX	120	1787314560	15.460133	15.480135	15.458367	15.480135
121914	GOLD	120	1787315160	4651.325041	4652.082778	4646.443860	4647.235361
121915	DOW	120	1787315160	52768.336873	52768.336873	52750.006946	52750.006946
121916	VIX	120	1787315160	15.465941	15.481683	15.463455	15.475070
121672	SP500	120	1787314920	7641.078137	7642.148107	7640.269874	7641.428088
121673	CRUDE	120	1787314920	87.018122	87.032845	86.966911	86.974891
121182	SP500	120	1787314440	7640.076797	7642.996883	7640.060156	7641.157757
121674	GOLD	120	1787314920	4647.350829	4648.809375	4645.689492	4646.981844
121675	DOW	120	1787314920	52764.146559	52766.012512	52750.741439	52751.366110
121676	VIX	120	1787314920	15.471784	15.476475	15.465197	15.471139
122156	VIX	120	1787315400	15.497850	15.511421	15.491318	15.508435
122276	VIX	120	1787315520	15.508770	15.512954	15.485746	15.490885
121792	SP500	120	1787315040	7641.730441	7642.238271	7639.765545	7640.768716
121793	CRUDE	120	1787315040	86.977198	87.153276	86.965486	87.133652
121432	SP500	120	1787314680	7641.850694	7642.180551	7639.327655	7640.503215
121433	CRUDE	120	1787314680	86.842329	86.917548	86.822651	86.826682
121434	GOLD	120	1787314680	4652.767452	4654.250080	4649.400000	4649.879506
121435	DOW	120	1787314680	52759.909744	52766.165029	52752.866000	52760.804062
121436	VIX	120	1787314680	15.480742	15.495964	15.478572	15.489330
122032	SP500	120	1787315280	7641.293486	7641.729262	7639.955550	7641.094450
121794	GOLD	120	1787315040	4646.945107	4652.531514	4646.380958	4651.220432
122033	CRUDE	120	1787315280	87.059267	87.080649	87.028124	87.044849
121795	DOW	120	1787315040	52752.048632	52767.624429	52748.865913	52767.487725
121796	VIX	120	1787315040	15.472549	15.475052	15.464927	15.466061
122034	GOLD	120	1787315280	4647.110972	4647.254226	4643.026466	4644.203599
122035	DOW	120	1787315280	52751.608865	52764.368480	52751.316740	52755.029831
122036	VIX	120	1787315280	15.475216	15.501479	15.474278	15.497792
122152	SP500	120	1787315400	7641.163281	7642.418462	7640.064274	7641.599992
122153	CRUDE	120	1787315400	87.042362	87.182090	87.041461	87.180280
122154	GOLD	120	1787315400	4644.143381	4646.337622	4639.461595	4640.097096
122155	DOW	120	1787315400	52754.491073	52765.352892	52753.010543	52755.466771
122394	GOLD	120	1787315640	4640.557759	4645.077544	4639.511757	4641.790010
122272	SP500	120	1787315520	7641.811414	7642.281051	7640.325820	7641.474627
122273	CRUDE	120	1787315520	87.176912	87.325324	87.162640	87.325324
122274	GOLD	120	1787315520	4640.232357	4641.841567	4639.514873	4640.617541
122275	DOW	120	1787315520	52753.928625	52771.554397	52752.190609	52765.746392
122392	SP500	120	1787315640	7641.456569	7642.092679	7639.756376	7640.923382
122393	CRUDE	120	1787315640	87.325773	87.325773	87.176560	87.183282
123764	GOLD	120	1787316960	4632.153893	4635.271711	4632.047433	4633.602943
123765	DOW	120	1787316960	52754.455591	52773.812165	52752.805770	52761.932062
123766	VIX	120	1787316960	15.442729	15.443662	15.411166	15.418023
122512	SP500	120	1787315760	7641.157575	7641.611177	7640.123695	7640.950399
122513	CRUDE	120	1787315760	87.186407	87.191196	87.091753	87.131528
122514	GOLD	120	1787315760	4641.860437	4644.164029	4641.806051	4643.361157
122515	DOW	120	1787315760	52757.647771	52767.014945	52751.595271	52755.075223
122516	VIX	120	1787315760	15.501362	15.520000	15.494963	15.516556
124516	VIX	120	1787317680	15.417495	15.444274	15.417495	15.442509
124387	SP500	120	1787317560	7641.292130	7641.846169	7639.823633	7640.985481
124137	SP500	120	1787317320	7639.691449	7642.543705	7639.633940	7641.697086
124012	SP500	120	1787317200	7641.073146	7642.091522	7639.729722	7639.729722
123387	SP500	120	1787316600	7641.375386	7642.241340	7640.063119	7640.909476
123388	CRUDE	120	1787316600	86.920236	87.001329	86.901317	86.970984
123389	GOLD	120	1787316600	4622.989589	4626.695854	4621.260626	4626.668590
123390	DOW	120	1787316600	52764.908674	52768.223978	52751.702793	52765.468972
123391	VIX	120	1787316600	15.432359	15.446710	15.428307	15.439211
123262	SP500	120	1787316480	7640.256042	7642.165234	7639.808312	7641.117805
123263	CRUDE	120	1787316480	86.958238	86.993010	86.881435	86.919994
123264	GOLD	120	1787316480	4627.819703	4627.950660	4622.922034	4622.963510
123265	DOW	120	1787316480	52762.809969	52765.726732	52750.298981	52763.817802
123266	VIX	120	1787316480	15.421099	15.442487	15.407100	15.432556
122887	SP500	120	1787316120	7640.364012	7642.071375	7639.898145	7640.567983
122888	CRUDE	120	1787316120	86.979577	86.987227	86.947524	86.975638
122889	GOLD	120	1787316120	4640.295284	4641.010679	4634.594947	4635.535739
122890	DOW	120	1787316120	52760.652670	52773.164746	52752.543783	52756.186952
122891	VIX	120	1787316120	15.452456	15.452456	15.434084	15.444471
122762	SP500	120	1787316000	7641.338222	7641.909452	7639.699936	7640.574474
122763	CRUDE	120	1787316000	87.053188	87.053539	86.972635	86.978382
122764	GOLD	120	1787316000	4642.521371	4642.683323	4635.864192	4640.228133
122395	DOW	120	1787315640	52764.529136	52766.849273	52754.125902	52756.088863
122396	VIX	120	1787315640	15.492401	15.503261	15.485815	15.502705
122765	DOW	120	1787316000	52761.929888	52768.378458	52751.587893	52759.945862
122766	VIX	120	1787316000	15.448576	15.460642	15.444011	15.451651
123012	SP500	120	1787316240	7640.772686	7642.087279	7640.031465	7641.323377
122637	SP500	120	1787315880	7640.895478	7642.534793	7640.347074	7641.516639
122638	CRUDE	120	1787315880	87.130931	87.157611	87.019903	87.054702
122639	GOLD	120	1787315880	4643.263815	4643.814178	4641.961530	4642.528582
122640	DOW	120	1787315880	52754.474375	52767.519196	52751.442646	52760.235683
122641	VIX	120	1787315880	15.516816	15.517781	15.446733	15.447414
123013	CRUDE	120	1787316240	86.973235	87.034592	86.890000	86.903397
123014	GOLD	120	1787316240	4635.694943	4637.076228	4628.102840	4628.265297
123015	DOW	120	1787316240	52757.738701	52766.055015	52753.101616	52763.075136
123016	VIX	120	1787316240	15.444449	15.445543	15.404682	15.420703
124013	CRUDE	120	1787317200	86.996101	87.137342	86.996101	87.128365
123637	SP500	120	1787316840	7640.402274	7642.288428	7640.220302	7641.936132
123638	CRUDE	120	1787316840	86.881365	86.881365	86.793680	86.869876
123639	GOLD	120	1787316840	4633.119000	4633.273383	4630.596562	4632.044335
123640	DOW	120	1787316840	52770.556499	52772.047890	52750.925195	52756.207435
123641	VIX	120	1787316840	15.441741	15.451390	15.437081	15.441902
123512	SP500	120	1787316720	7640.956594	7642.241311	7640.256780	7640.602727
123137	SP500	120	1787316360	7641.287190	7642.074921	7639.775876	7640.446232
123138	CRUDE	120	1787316360	86.900123	86.963230	86.898398	86.955889
123139	GOLD	120	1787316360	4628.270385	4628.743189	4626.744648	4627.824870
123140	DOW	120	1787316360	52764.078350	52768.773613	52750.072402	52763.901135
123141	VIX	120	1787316360	15.421945	15.427384	15.407947	15.420480
123513	CRUDE	120	1787316720	86.973765	86.986921	86.864977	86.879322
123514	GOLD	120	1787316720	4626.624091	4633.204260	4626.535401	4633.204260
123515	DOW	120	1787316720	52763.674314	52770.289545	52754.469034	52770.289545
123516	VIX	120	1787316720	15.438386	15.445052	15.424399	15.440968
124014	GOLD	120	1787317200	4636.319679	4636.954834	4633.972335	4636.554650
124015	DOW	120	1787317200	52750.409059	52763.696693	52748.677254	52757.293230
124016	VIX	120	1787317200	15.411085	15.424602	15.404448	15.421101
124138	CRUDE	120	1787317320	87.126040	87.155639	87.100000	87.118282
123887	SP500	120	1787317080	7640.964302	7641.888283	7640.342147	7641.299633
123888	CRUDE	120	1787317080	87.016743	87.038349	86.947893	86.994343
123889	GOLD	120	1787317080	4633.761025	4636.573239	4633.761025	4636.451298
123890	DOW	120	1787317080	52760.756221	52769.483062	52749.344944	52749.344944
123891	VIX	120	1787317080	15.417149	15.431299	15.407028	15.409770
123762	SP500	120	1787316960	7642.120594	7642.309512	7639.580342	7640.659110
123763	CRUDE	120	1787316960	86.872517	87.017930	86.819593	87.013545
124139	GOLD	120	1787317320	4636.556845	4637.082903	4634.775838	4635.556219
124140	DOW	120	1787317320	52757.688249	52770.059041	52751.299294	52754.937624
124141	VIX	120	1787317320	15.422324	15.431780	15.416620	15.416620
124388	CRUDE	120	1787317560	87.054563	87.055552	86.892078	86.892078
124389	GOLD	120	1787317560	4634.772934	4636.669413	4631.689974	4633.045735
124390	DOW	120	1787317560	52765.095047	52766.457949	52749.263871	52760.947538
124391	VIX	120	1787317560	15.426892	15.429549	15.417385	15.418778
124262	SP500	120	1787317440	7641.845218	7643.016115	7640.147016	7641.102478
124263	CRUDE	120	1787317440	87.119183	87.121667	87.016381	87.052420
124264	GOLD	120	1787317440	4635.543536	4637.942337	4634.872114	4634.872114
124265	DOW	120	1787317440	52754.204910	52765.307532	52752.814741	52765.011603
124266	VIX	120	1787317440	15.417972	15.427196	15.413565	15.426680
124512	SP500	120	1787317680	7641.159596	7642.124443	7639.396651	7640.836921
124513	CRUDE	120	1787317680	86.895422	86.936742	86.860128	86.906901
124514	GOLD	120	1787317680	4632.897372	4634.855522	4632.011811	4633.796459
124515	DOW	120	1787317680	52759.029628	52768.531821	52752.191211	52761.925736
124632	SP500	120	1787317800	7641.138573	7642.462245	7639.834269	7641.736750
124633	CRUDE	120	1787317800	86.909890	86.913252	86.687531	86.706878
124634	GOLD	120	1787317800	4633.654104	4640.712374	4632.845367	4640.712374
126008	CRUDE	120	1787319120	86.760149	86.965483	86.753740	86.962859
126009	GOLD	120	1787319120	4641.568330	4643.709251	4639.791385	4640.475383
126010	DOW	120	1787319120	53033.146075	53063.157550	53015.670797	53016.784879
126011	VIX	120	1787319120	15.493101	15.505006	15.477881	15.490709
124757	SP500	120	1787317920	7641.719222	7642.848203	7639.564982	7640.591141
124758	CRUDE	120	1787317920	86.707346	86.761281	86.628090	86.640018
124759	GOLD	120	1787317920	4640.804710	4641.251140	4638.200000	4638.685204
124760	DOW	120	1787317920	52758.358896	52765.021408	52752.406971	52752.406971
124761	VIX	120	1787317920	15.430664	15.436348	15.425478	15.430773
126761	VIX	120	1787319840	15.480277	15.483086	15.475359	15.483086
126632	SP500	120	1787319720	7670.165056	7671.945011	7666.105104	7666.875148
126382	SP500	120	1787319480	7668.493649	7670.866151	7666.306967	7667.934014
126257	SP500	120	1787319360	7666.228285	7669.589643	7665.900712	7668.216952
125632	SP500	120	1787318760	7641.442562	7642.266985	7640.166299	7641.535899
125633	CRUDE	120	1787318760	86.703821	87.030000	86.703821	87.026320
125634	GOLD	120	1787318760	4644.126257	4644.126257	4637.363887	4637.438358
125635	DOW	120	1787318760	52760.609319	52770.906731	52747.424544	52764.222728
125636	VIX	120	1787318760	15.481524	15.481803	15.464847	15.470147
125507	SP500	120	1787318640	7641.182090	7641.983940	7640.545509	7641.238753
125508	CRUDE	120	1787318640	86.716903	86.801695	86.679950	86.701717
125509	GOLD	120	1787318640	4641.649396	4644.700000	4640.387488	4644.200452
125510	DOW	120	1787318640	52756.144300	52765.949103	52753.795504	52761.695331
125511	VIX	120	1787318640	15.436423	15.480793	15.436381	15.480793
125132	SP500	120	1787318280	7642.117840	7642.659687	7640.291524	7641.224574
125133	CRUDE	120	1787318280	86.875225	86.913660	86.777153	86.777509
125134	GOLD	120	1787318280	4636.728031	4640.601924	4636.479735	4637.709209
125135	DOW	120	1787318280	52763.940049	52766.596678	52751.406722	52757.202310
125136	VIX	120	1787318280	15.414491	15.426048	15.407581	15.417645
125007	SP500	120	1787318160	7641.445872	7642.328974	7639.167081	7641.905248
124635	DOW	120	1787317800	52761.735763	52765.198197	52752.661103	52760.410619
124636	VIX	120	1787317800	15.442852	15.444302	15.422688	15.430189
125008	CRUDE	120	1787318160	86.699304	86.879160	86.686963	86.875716
125009	GOLD	120	1787318160	4638.542422	4640.468145	4636.766147	4636.766147
125010	DOW	120	1787318160	52764.916226	52770.703163	52751.485363	52761.931170
125011	VIX	120	1787318160	15.425905	15.426984	15.404614	15.413559
124882	SP500	120	1787318040	7640.840833	7641.625190	7639.925847	7641.440021
124883	CRUDE	120	1787318040	86.636880	86.697641	86.596628	86.697641
124884	GOLD	120	1787318040	4638.744974	4638.997913	4636.420709	4638.391027
124885	DOW	120	1787318040	52750.747642	52770.867481	52746.663578	52764.429826
124886	VIX	120	1787318040	15.431274	15.436174	15.417376	15.425804
125257	SP500	120	1787318400	7641.310208	7642.216149	7640.590064	7641.463961
125258	CRUDE	120	1787318400	86.776820	86.787025	86.695322	86.734778
125259	GOLD	120	1787318400	4637.612834	4644.149103	4637.058189	4642.386625
125260	DOW	120	1787318400	52758.511017	52767.358945	52752.567516	52758.635120
125261	VIX	120	1787318400	15.418967	15.450429	15.415232	15.440972
126258	CRUDE	120	1787319360	86.944226	86.951297	86.863346	86.902262
125882	SP500	120	1787319000	7640.855982	7678.100000	7640.839074	7672.733177
125883	CRUDE	120	1787319000	86.795581	86.830000	86.746970	86.759226
125884	GOLD	120	1787319000	4637.032068	4641.800000	4636.700000	4641.484258
125885	DOW	120	1787319000	52760.620836	53056.748785	52759.899548	53031.188484
125886	VIX	120	1787319000	15.493980	15.501366	15.481781	15.491975
125757	SP500	120	1787318880	7641.657645	7642.322708	7639.436063	7640.899243
125758	CRUDE	120	1787318880	87.023742	87.026575	86.783473	86.795530
125759	GOLD	120	1787318880	4637.513059	4639.204645	4636.594640	4636.939514
125760	DOW	120	1787318880	52764.961016	52773.149205	52751.486757	52759.706614
125382	SP500	120	1787318520	7641.689727	7641.854572	7640.370003	7641.170124
125383	CRUDE	120	1787318520	86.734862	86.739918	86.692577	86.715155
125384	GOLD	120	1787318520	4642.461077	4643.033424	4640.488470	4641.558133
125385	DOW	120	1787318520	52758.005333	52767.040156	52752.727897	52754.307981
125386	VIX	120	1787318520	15.441344	15.444487	15.433537	15.437725
125761	VIX	120	1787318880	15.468617	15.494734	15.465331	15.494734
126259	GOLD	120	1787319360	4641.641537	4641.641537	4638.516069	4638.610094
126260	DOW	120	1787319360	53016.137435	53067.830126	53014.497151	53067.830126
126261	VIX	120	1787319360	15.504772	15.511573	15.497607	15.510289
126383	CRUDE	120	1787319480	86.900899	86.939016	86.882464	86.894923
126384	GOLD	120	1787319480	4638.447997	4642.942869	4638.447997	4642.330374
126132	SP500	120	1787319240	7668.815876	7671.090459	7665.411392	7666.521679
126133	CRUDE	120	1787319240	86.962816	87.012549	86.888662	86.945829
126134	GOLD	120	1787319240	4640.587184	4641.570169	4639.466778	4641.570169
126135	DOW	120	1787319240	53016.585498	53047.069136	53011.670000	53016.916303
126007	SP500	120	1787319120	7672.731234	7673.059080	7667.713477	7668.554338
126385	DOW	120	1787319480	53068.548860	53077.226931	53048.621752	53071.009873
126386	VIX	120	1787319480	15.510683	15.513849	15.478624	15.482436
126136	VIX	120	1787319240	15.492080	15.514704	15.490292	15.504131
126633	CRUDE	120	1787319720	86.873205	87.014500	86.867553	86.951612
126634	GOLD	120	1787319720	4639.477219	4641.671670	4633.957395	4634.217275
126635	DOW	120	1787319720	53080.722097	53085.982527	53065.171414	53085.181804
126636	VIX	120	1787319720	15.483694	15.485517	15.475463	15.479619
126507	SP500	120	1787319600	7667.774134	7671.742180	7667.125155	7670.337403
126508	CRUDE	120	1787319600	86.896590	86.897391	86.721322	86.876477
126509	GOLD	120	1787319600	4642.433762	4643.214145	4639.000000	4639.403774
126510	DOW	120	1787319600	53072.283384	53107.525790	53071.199048	53081.198366
126511	VIX	120	1787319600	15.483653	15.484634	15.476644	15.482399
126879	GOLD	120	1787319960	4634.218305	4643.900000	4634.107286	4643.507287
126757	SP500	120	1787319840	7666.819126	7672.737710	7666.498392	7672.561038
126758	CRUDE	120	1787319840	86.950159	86.973119	86.861004	86.920990
126759	GOLD	120	1787319840	4634.172630	4634.800000	4630.310940	4634.256651
126760	DOW	120	1787319840	53084.726648	53129.192301	53078.185120	53110.658196
126877	SP500	120	1787319960	7672.771039	7673.223844	7666.379908	7666.593475
126878	CRUDE	120	1787319960	86.920435	87.108752	86.917620	87.100002
126999	GOLD	120	1787320080	4643.617493	4648.281911	4641.400000	4643.258585
127000	DOW	120	1787320080	53087.225678	53115.954210	53083.563174	53095.118372
127001	VIX	120	1787320080	15.439799	15.472732	15.427435	15.453622
128493	CRUDE	120	1787321520	86.392473	86.450000	86.290000	86.296705
128494	GOLD	120	1787321520	4639.833075	4645.275391	4638.600000	4643.288640
128495	DOW	120	1787321520	53127.935130	53143.629289	53115.677267	53120.991736
127867	SP500	120	1787320920	7667.227586	7667.387986	7664.180870	7667.201001
127868	CRUDE	120	1787320920	86.583694	86.604704	86.555396	86.583436
127869	GOLD	120	1787320920	4642.609747	4642.967663	4637.550506	4637.684106
127870	DOW	120	1787320920	53114.825960	53143.574486	53107.426285	53135.664422
127871	VIX	120	1787320920	15.411482	15.463975	15.410261	15.435412
127742	SP500	120	1787320800	7665.322818	7667.905836	7664.059591	7667.024396
127743	CRUDE	120	1787320800	86.600121	86.627166	86.541552	86.582708
127744	GOLD	120	1787320800	4646.571467	4647.874201	4642.221586	4642.462303
127745	DOW	120	1787320800	53089.131907	53114.441061	53067.487742	53113.462765
127746	VIX	120	1787320800	15.474806	15.474819	15.398263	15.412272
127367	SP500	120	1787320440	7665.636751	7665.935229	7660.022872	7662.849019
127368	CRUDE	120	1787320440	86.827267	86.832284	86.603095	86.606357
127369	GOLD	120	1787320440	4643.317844	4645.297464	4642.055936	4644.513613
127370	DOW	120	1787320440	53107.410592	53111.562095	53069.896186	53088.389196
127371	VIX	120	1787320440	15.479793	15.500790	15.468626	15.474010
127242	SP500	120	1787320320	7667.004031	7667.252258	7663.524345	7665.600339
127243	CRUDE	120	1787320320	86.874893	86.877255	86.796854	86.825068
127244	GOLD	120	1787320320	4646.850471	4647.071384	4642.995773	4643.197534
127245	DOW	120	1787320320	53104.252220	53113.341145	53095.213854	53106.272899
127246	VIX	120	1787320320	15.485529	15.488086	15.460000	15.480535
126880	DOW	120	1787319960	53109.679232	53111.217111	53086.499477	53086.499477
126881	VIX	120	1787319960	15.483306	15.483611	15.386872	15.439751
127492	SP500	120	1787320560	7662.688857	7666.075650	7661.928770	7663.069604
127493	CRUDE	120	1787320560	86.604989	86.636167	86.541938	86.579425
127494	GOLD	120	1787320560	4644.368693	4647.304074	4643.295990	4646.970429
127117	SP500	120	1787320200	7666.410642	7670.889073	7666.151316	7666.854601
127118	CRUDE	120	1787320200	86.777380	86.902732	86.745293	86.873621
127119	GOLD	120	1787320200	4643.121153	4646.788645	4642.974775	4646.709404
127120	DOW	120	1787320200	53093.484650	53125.215334	53089.507294	53105.396509
127121	VIX	120	1787320200	15.453421	15.501298	15.452847	15.484506
127495	DOW	120	1787320560	53086.965438	53111.306316	53076.807703	53084.334534
127496	VIX	120	1787320560	15.473209	15.483471	15.444729	15.447637
128117	SP500	120	1787321160	7670.715542	7673.801887	7670.187286	7671.339818
128118	CRUDE	120	1787321160	86.508781	86.514529	86.427711	86.477194
128119	GOLD	120	1787321160	4640.548775	4643.006398	4639.374143	4639.481357
128120	DOW	120	1787321160	53131.938342	53168.004800	53120.982694	53145.380238
128121	VIX	120	1787321160	15.424567	15.525360	15.424567	15.495922
127992	SP500	120	1787321040	7667.082913	7671.949418	7665.774051	7670.960016
127993	CRUDE	120	1787321040	86.583171	86.608871	86.471995	86.508888
127994	GOLD	120	1787321040	4637.607856	4642.785478	4634.807025	4640.548600
126997	SP500	120	1787320080	7666.864491	7670.873009	7666.200000	7666.648557
126998	CRUDE	120	1787320080	87.097985	87.099169	86.769916	86.779322
127617	SP500	120	1787320680	7663.088111	7667.239868	7661.412547	7665.332761
127618	CRUDE	120	1787320680	86.581120	86.680000	86.577546	86.596820
127619	GOLD	120	1787320680	4647.038964	4648.321549	4645.152610	4646.539150
127620	DOW	120	1787320680	53083.503412	53092.380000	53074.211214	53087.119345
127621	VIX	120	1787320680	15.447925	15.490255	15.447124	15.475091
127995	DOW	120	1787321040	53135.409750	53139.758359	53119.217143	53130.832474
127996	VIX	120	1787321040	15.436500	15.453682	15.424157	15.424653
128496	VIX	120	1787321520	15.507670	15.530092	15.482401	15.522785
128367	SP500	120	1787321400	7672.960781	7672.960781	7669.604588	7670.291111
128368	CRUDE	120	1787321400	86.473313	86.474574	86.366969	86.390792
128369	GOLD	120	1787321400	4638.929079	4640.200000	4637.508762	4639.787736
128370	DOW	120	1787321400	53146.142419	53153.979037	53124.398441	53128.459338
128371	VIX	120	1787321400	15.558605	15.559825	15.505576	15.507737
128242	SP500	120	1787321280	7671.495871	7673.316773	7670.513207	7672.675909
128243	CRUDE	120	1787321280	86.479337	86.540000	86.470000	86.472477
128244	GOLD	120	1787321280	4639.557454	4640.061782	4637.496647	4638.931891
128245	DOW	120	1787321280	53144.665526	53159.213930	53130.427814	53144.834892
128246	VIX	120	1787321280	15.494571	15.570706	15.494315	15.557568
128619	GOLD	120	1787321640	4643.320917	4647.681658	4642.662339	4647.602294
128620	DOW	120	1787321640	53122.021149	53144.741242	53118.848019	53143.031107
128621	VIX	120	1787321640	15.523852	15.525162	15.457649	15.459647
128744	GOLD	120	1787321760	4647.543719	4647.543719	4641.500000	4642.096603
128867	SP500	120	1787321880	7666.694547	7667.477618	7664.121085	7664.730121
128617	SP500	120	1787321640	7665.736401	7668.163738	7664.412122	7667.576116
128492	SP500	120	1787321520	7670.252067	7671.694199	7665.356606	7665.605789
128618	CRUDE	120	1787321640	86.298265	86.381925	86.293965	86.366088
128745	DOW	120	1787321760	53142.516081	53149.923856	53126.531770	53143.803546
128746	VIX	120	1787321760	15.459165	15.474293	15.448273	15.473816
128868	CRUDE	120	1787321880	86.351840	86.417743	86.296541	86.365529
128742	SP500	120	1787321760	7667.570690	7669.828137	7665.220000	7666.538739
128743	CRUDE	120	1787321760	86.362746	86.422329	86.307982	86.348463
128869	GOLD	120	1787321880	4641.992959	4645.032051	4640.581308	4644.567327
128870	DOW	120	1787321880	53144.089339	53171.861117	53137.257118	53158.058176
128871	VIX	120	1787321880	15.474872	15.490757	15.426121	15.426121
128992	SP500	120	1787322000	7664.841227	7665.599053	7662.488199	7662.648116
128993	CRUDE	120	1787322000	86.362913	86.434131	86.360584	86.431336
128994	GOLD	120	1787322000	4644.426213	4644.989042	4642.200000	4644.511275
128995	DOW	120	1787322000	53157.558290	53161.550000	53137.500857	53143.754968
128996	VIX	120	1787322000	15.427386	15.428473	15.318746	15.319539
129117	SP500	120	1787322120	7662.835989	7670.069504	7662.801869	7669.161454
129118	CRUDE	120	1787322120	86.432140	86.519845	86.432140	86.482784
129119	GOLD	120	1787322120	4644.391249	4646.832534	4644.176389	4645.466854
130493	CRUDE	120	1787323440	86.669187	86.765174	86.642376	86.644420
130494	GOLD	120	1787323440	4649.584008	4649.695549	4645.585451	4646.702922
130495	DOW	120	1787323440	53078.025929	53099.548058	53077.535681	53091.698011
130496	VIX	120	1787323440	15.381861	15.426307	15.377692	15.405603
129242	SP500	120	1787322240	7669.289968	7670.370623	7665.711296	7669.034710
129243	CRUDE	120	1787322240	86.486154	86.620000	86.455174	86.576424
129244	GOLD	120	1787322240	4645.455500	4647.108155	4643.349911	4644.328488
129245	DOW	120	1787322240	53175.576095	53185.206297	53154.137865	53178.319587
129246	VIX	120	1787322240	15.360711	15.372204	15.337695	15.337695
130867	SP500	120	1787323800	7668.771883	7669.811545	7667.046130	7668.432209
130868	CRUDE	120	1787323800	86.491977	86.492479	86.386752	86.398195
130869	GOLD	120	1787323800	4641.025808	4643.500000	4637.540527	4643.447995
130742	SP500	120	1787323680	7666.061512	7668.967900	7665.640000	7668.522788
130117	SP500	120	1787323080	7660.453137	7664.170000	7660.332287	7663.180974
130118	CRUDE	120	1787323080	86.473318	86.474316	86.381371	86.395146
130119	GOLD	120	1787323080	4658.973530	4659.719628	4658.435771	4658.435771
130120	DOW	120	1787323080	53066.491698	53096.692829	53060.373237	53080.460481
130121	VIX	120	1787323080	15.380292	15.421395	15.377154	15.418382
129992	SP500	120	1787322960	7663.427571	7663.427571	7659.727136	7660.590818
129993	CRUDE	120	1787322960	86.390289	86.493027	86.386752	86.472926
129994	GOLD	120	1787322960	4656.401367	4659.175658	4654.839252	4658.951378
129995	DOW	120	1787322960	53093.004651	53097.131946	53059.616403	53066.397437
129996	VIX	120	1787322960	15.438343	15.459144	15.379772	15.379772
129617	SP500	120	1787322600	7665.069479	7666.962962	7664.102633	7666.297511
129618	CRUDE	120	1787322600	86.278357	86.470288	86.278357	86.464256
129619	GOLD	120	1787322600	4646.884895	4652.900000	4645.993624	4652.435760
129620	DOW	120	1787322600	53137.507942	53155.240098	53128.895000	53136.449131
129621	VIX	120	1787322600	15.441625	15.452103	15.417980	15.437864
129492	SP500	120	1787322480	7669.045003	7670.314959	7664.442379	7664.871863
129493	CRUDE	120	1787322480	86.334312	86.420782	86.241593	86.277816
129120	DOW	120	1787322120	53145.326799	53189.873553	53144.402008	53175.446709
129121	VIX	120	1787322120	15.320156	15.360678	15.316885	15.359448
129494	GOLD	120	1787322480	4645.647600	4647.257860	4645.375348	4646.943120
129495	DOW	120	1787322480	53129.468880	53148.095200	53122.293155	53136.360578
129496	VIX	120	1787322480	15.381832	15.441863	15.381832	15.441100
129367	SP500	120	1787322360	7668.832458	7669.471190	7667.291617	7668.881517
129368	CRUDE	120	1787322360	86.575134	86.577245	86.336325	86.336784
129369	GOLD	120	1787322360	4644.226208	4646.489977	4643.840555	4645.674137
129370	DOW	120	1787322360	53178.180294	53181.585312	53128.757846	53130.086190
129371	VIX	120	1787322360	15.337366	15.382450	15.336043	15.381353
129742	SP500	120	1787322720	7666.208554	7667.356807	7664.342988	7664.727344
129743	CRUDE	120	1787322720	86.462456	86.483716	86.391231	86.399969
129744	GOLD	120	1787322720	4652.603530	4653.673571	4652.269916	4653.581986
129745	DOW	120	1787322720	53135.322598	53139.159923	53102.438788	53102.627075
129746	VIX	120	1787322720	15.439228	15.450530	15.416062	15.431929
130743	CRUDE	120	1787323680	86.567143	86.570986	86.436568	86.492492
130367	SP500	120	1787323320	7661.571090	7667.999644	7659.905609	7667.790176
130368	CRUDE	120	1787323320	86.568233	86.692482	86.558874	86.668462
130369	GOLD	120	1787323320	4655.721563	4656.533850	4649.457700	4649.568684
130370	DOW	120	1787323320	53050.980432	53088.495855	53047.160626	53079.282823
130371	VIX	120	1787323320	15.379933	15.386766	15.352338	15.381443
130242	SP500	120	1787323200	7663.455388	7664.226002	7660.507121	7661.552202
130243	CRUDE	120	1787323200	86.395186	86.580000	86.374971	86.570889
130244	GOLD	120	1787323200	4658.588259	4659.468236	4655.754222	4655.754222
130245	DOW	120	1787323200	53081.099048	53085.812288	53047.248489	53050.765717
129867	SP500	120	1787322840	7664.514478	7665.617264	7662.173087	7663.616750
129868	CRUDE	120	1787322840	86.401012	86.413009	86.338520	86.388769
129869	GOLD	120	1787322840	4653.765703	4656.610597	4652.897884	4656.453891
129870	DOW	120	1787322840	53102.803269	53118.036048	53091.793245	53091.793245
129871	VIX	120	1787322840	15.432409	15.456803	15.431036	15.437601
130246	VIX	120	1787323200	15.418195	15.421541	15.376953	15.378772
130744	GOLD	120	1787323680	4643.946954	4643.946954	4638.863778	4641.033825
130745	DOW	120	1787323680	53080.048577	53117.611004	53079.071844	53117.611004
130746	VIX	120	1787323680	15.410823	15.433050	15.407436	15.427648
130870	DOW	120	1787323800	53118.982796	53121.708818	53102.800000	53106.830099
130871	VIX	120	1787323800	15.426252	15.495428	15.424450	15.471923
130617	SP500	120	1787323560	7665.690681	7668.114584	7665.240000	7666.317854
130618	CRUDE	120	1787323560	86.643535	86.653068	86.529997	86.564055
130619	GOLD	120	1787323560	4646.801490	4648.321773	4643.500000	4643.860754
130620	DOW	120	1787323560	53091.675826	53111.830021	53079.220570	53081.135290
130492	SP500	120	1787323440	7667.567711	7667.656915	7663.388104	7665.514698
130995	DOW	120	1787323920	53108.814756	53132.733942	53102.342953	53108.919391
131367	SP500	120	1787324280	7674.365990	7676.760565	7672.097116	7676.327614
130621	VIX	120	1787323560	15.404804	15.423892	15.397009	15.410356
131117	SP500	120	1787324040	7669.638228	7670.496313	7666.998050	7670.242691
130992	SP500	120	1787323920	7668.676858	7671.886050	7667.392666	7669.471369
130993	CRUDE	120	1787323920	86.397098	86.426024	86.335606	86.384327
130996	VIX	120	1787323920	15.471164	15.502702	15.470123	15.497424
130994	GOLD	120	1787323920	4643.366090	4645.904820	4638.441473	4645.570312
131118	CRUDE	120	1787324040	86.383026	86.477975	86.380000	86.474054
131119	GOLD	120	1787324040	4645.641946	4645.962256	4638.531365	4639.408068
131120	DOW	120	1787324040	53106.993446	53123.503897	53096.593290	53118.486791
131121	VIX	120	1787324040	15.496225	15.496449	15.449398	15.457235
131242	SP500	120	1787324160	7670.235562	7674.380311	7669.813514	7674.308240
131243	CRUDE	120	1787324160	86.476725	86.507907	86.461101	86.499203
131244	GOLD	120	1787324160	4639.264793	4644.034879	4639.085341	4641.660612
131245	DOW	120	1787324160	53119.963179	53150.926510	53118.607273	53145.134453
131246	VIX	120	1787324160	15.455748	15.476670	15.454112	15.464433
131370	DOW	120	1787324280	53143.689382	53178.077893	53139.896365	53168.672871
131371	VIX	120	1787324280	15.464812	15.469004	15.382708	15.409964
131495	DOW	120	1787324400	53167.243717	53181.597660	53157.526610	53158.541230
131496	VIX	120	1787324400	15.410417	15.416184	15.349787	15.349787
131972	SP500	120	1787324880	7679.840513	7680.660000	7676.419097	7676.481299
131973	CRUDE	120	1787324880	86.610477	86.686041	86.520000	86.523997
131974	GOLD	120	1787324880	4647.705005	4649.118887	4646.822452	4647.718230
131852	SP500	120	1787324760	7678.234979	7681.855561	7677.660194	7679.576600
131853	CRUDE	120	1787324760	86.590750	86.643522	86.587548	86.610932
131854	GOLD	120	1787324760	4641.811536	4647.695281	4641.811536	4647.695281
131855	DOW	120	1787324760	53187.279958	53207.511484	53184.786778	53189.989230
131856	VIX	120	1787324760	15.344564	15.348149	15.330000	15.334048
131975	DOW	120	1787324880	53190.829883	53195.315412	53159.351147	53160.647520
131976	VIX	120	1787324880	15.335531	15.344859	15.310000	15.340922
131732	SP500	120	1787324640	7679.771321	7681.788070	7678.401425	7678.401425
131733	CRUDE	120	1787324640	86.640470	86.662390	86.521838	86.593114
131734	GOLD	120	1787324640	4647.888619	4647.888619	4641.427005	4641.688994
131735	DOW	120	1787324640	53189.837485	53200.078613	53174.569758	53189.031464
131736	VIX	120	1787324640	15.349215	15.351810	15.320196	15.345888
132468	CRUDE	120	1787325360	86.276556	86.279781	86.171190	86.234389
132469	GOLD	120	1787325360	4650.852828	4653.847390	4650.709360	4653.643576
132470	DOW	120	1787325360	53144.527273	53156.685159	53136.553960	53142.563973
132471	VIX	120	1787325360	15.308674	15.364395	15.298710	15.358815
131368	CRUDE	120	1787324280	86.498877	86.500174	86.448145	86.474430
131369	GOLD	120	1787324280	4641.654358	4647.598507	4641.579981	4647.296085
131612	SP500	120	1787324520	7677.319192	7679.950000	7675.087230	7679.778104
131613	CRUDE	120	1787324520	86.501659	86.642101	86.493234	86.638989
131614	GOLD	120	1787324520	4650.057060	4650.112983	4645.772408	4647.965852
131615	DOW	120	1787324520	53157.571759	53190.428079	53153.484050	53190.428079
131616	VIX	120	1787324520	15.349589	15.373946	15.348491	15.349660
132843	CRUDE	120	1787325720	86.453798	86.565722	86.440000	86.534774
132844	GOLD	120	1787325720	4653.911072	4653.973446	4651.571806	4651.571806
132845	DOW	120	1787325720	53150.230480	53166.553203	53147.416356	53157.054525
132846	VIX	120	1787325720	15.323239	15.353821	15.323177	15.346679
132092	SP500	120	1787325000	7676.666769	7678.574922	7676.054725	7678.489596
132093	CRUDE	120	1787325000	86.526818	86.560000	86.477620	86.531223
132094	GOLD	120	1787325000	4647.643552	4648.611735	4644.339896	4645.580395
132095	DOW	120	1787325000	53161.012334	53177.052151	53158.249768	53174.845266
132096	VIX	120	1787325000	15.342374	15.344959	15.286733	15.287540
132717	SP500	120	1787325600	7674.363218	7676.383677	7672.879716	7674.546197
132718	CRUDE	120	1787325600	86.311086	86.460000	86.267931	86.456089
132719	GOLD	120	1787325600	4651.477348	4654.843690	4650.694683	4653.978090
132720	DOW	120	1787325600	53147.260869	53155.214100	53135.841443	53150.700387
132721	VIX	120	1787325600	15.322859	15.334821	15.307492	15.322943
131492	SP500	120	1787324400	7676.362312	7680.063780	7676.252579	7677.450041
131493	CRUDE	120	1787324400	86.476263	86.504659	86.367555	86.502475
131494	GOLD	120	1787324400	4647.457185	4651.900691	4647.205400	4649.983474
132342	SP500	120	1787325240	7677.307904	7678.019094	7674.774997	7676.309442
132343	CRUDE	120	1787325240	86.289445	86.350000	86.271936	86.276798
132344	GOLD	120	1787325240	4648.822401	4651.251750	4648.822401	4651.016483
132345	DOW	120	1787325240	53160.533822	53160.533822	53124.243116	53145.133611
132346	VIX	120	1787325240	15.288856	15.310196	15.259039	15.307966
132217	SP500	120	1787325120	7678.377116	7678.617853	7676.177152	7677.388083
132218	CRUDE	120	1787325120	86.529247	86.531499	86.284121	86.286925
132219	GOLD	120	1787325120	4645.410205	4649.908969	4644.782488	4648.903001
132220	DOW	120	1787325120	53176.620671	53178.159844	53148.757502	53158.990292
132221	VIX	120	1787325120	15.286595	15.300133	15.279769	15.289697
133342	SP500	120	1787326200	7678.492234	7679.770933	7677.272602	7678.449589
133343	CRUDE	120	1787326200	86.838832	86.849487	86.780393	86.815674
133344	GOLD	120	1787326200	4654.421579	4655.470271	4653.034980	4654.835608
132592	SP500	120	1787325480	7675.195040	7675.951045	7673.564278	7674.579376
132593	CRUDE	120	1787325480	86.234741	86.308730	86.176907	86.308730
132594	GOLD	120	1787325480	4653.663112	4654.411743	4651.086088	4651.480543
132595	DOW	120	1787325480	53142.275003	53158.618178	53137.543866	53146.268428
133345	DOW	120	1787326200	53162.927797	53171.917098	53146.248849	53147.555521
133092	SP500	120	1787325960	7673.672733	7677.907081	7672.732482	7677.874999
132967	SP500	120	1787325840	7676.162760	7677.233552	7672.994277	7673.397919
132968	CRUDE	120	1787325840	86.537368	86.704703	86.535482	86.577367
132969	GOLD	120	1787325840	4651.486015	4655.278714	4651.124155	4654.990681
132467	SP500	120	1787325360	7676.245554	7677.301858	7673.596285	7674.996570
132596	VIX	120	1787325480	15.358034	15.363763	15.317674	15.323063
132970	DOW	120	1787325840	53155.907995	53157.554749	53133.978649	53133.978649
132971	VIX	120	1787325840	15.346492	15.374857	15.345595	15.346779
133093	CRUDE	120	1787325960	86.574940	86.750000	86.566685	86.741146
133094	GOLD	120	1787325960	4654.906960	4655.924908	4653.426939	4654.611870
133095	DOW	120	1787325960	53132.600023	53161.617998	53132.482125	53161.270966
133096	VIX	120	1787325960	15.347110	15.354133	15.336063	15.341101
132842	SP500	120	1787325720	7674.719499	7677.091588	7672.899219	7675.902451
133346	VIX	120	1787326200	15.338227	15.341723	15.320000	15.324862
133217	SP500	120	1787326080	7677.580117	7679.356910	7676.630000	7678.365007
133218	CRUDE	120	1787326080	86.740853	86.837782	86.739553	86.835902
133219	GOLD	120	1787326080	4654.669558	4655.572086	4653.227106	4654.409031
133220	DOW	120	1787326080	53163.194615	53173.777165	53151.375720	53163.272765
133221	VIX	120	1787326080	15.341956	15.343140	15.323666	15.339045
133467	SP500	120	1787326320	7678.276882	7681.490865	7677.493959	7681.105452
133468	CRUDE	120	1787326320	86.818916	86.828994	86.717663	86.781944
133469	GOLD	120	1787326320	4654.784726	4658.139761	4653.547470	4657.663007
133470	DOW	120	1787326320	53147.835671	53169.231268	53142.240048	53158.079900
133471	VIX	120	1787326320	15.324774	15.353630	15.315885	15.317230
133592	SP500	120	1787326440	7680.816792	7684.989080	7680.405977	7684.989080
133593	CRUDE	120	1787326440	86.783023	86.783023	86.631787	86.631787
133594	GOLD	120	1787326440	4657.749671	4662.836665	4657.506979	4658.213142
134968	CRUDE	120	1787327760	86.911768	86.911768	86.774657	86.782306
134969	GOLD	120	1787327760	4667.537130	4668.229445	4666.539013	4666.741807
134970	DOW	120	1787327760	53230.357094	53235.214388	53206.973770	53215.866529
134971	VIX	120	1787327760	15.259296	15.284174	15.235658	15.280878
133717	SP500	120	1787326560	7684.890790	7687.450000	7683.893114	7686.721063
133718	CRUDE	120	1787326560	86.634860	86.726229	86.627358	86.683267
133719	GOLD	120	1787326560	4658.113440	4659.752138	4657.279142	4659.587359
133720	DOW	120	1787326560	53177.823949	53216.940013	53175.668896	53203.300464
133721	VIX	120	1787326560	15.306152	15.311297	15.258463	15.260383
135332	SP500	120	1787328120	7689.794213	7689.934976	7685.560082	7688.085961
135333	CRUDE	120	1787328120	86.773631	86.855950	86.767778	86.819148
135334	GOLD	120	1787328120	4668.290130	4672.352332	4667.527644	4671.826785
135335	DOW	120	1787328120	53199.959475	53200.816917	53175.587052	53188.055280
134592	SP500	120	1787327400	7689.131263	7694.250000	7688.833923	7693.580115
134593	CRUDE	120	1787327400	86.842750	87.055077	86.842367	87.043257
134594	GOLD	120	1787327400	4665.195966	4665.880852	4662.995249	4665.073792
134595	DOW	120	1787327400	53222.016929	53247.826817	53217.817550	53247.826817
134596	VIX	120	1787327400	15.272514	15.272735	15.247560	15.247560
134467	SP500	120	1787327280	7690.975160	7691.702254	7688.280890	7688.872098
134468	CRUDE	120	1787327280	86.778249	86.893366	86.776604	86.844623
134469	GOLD	120	1787327280	4664.082454	4665.218982	4662.440119	4665.030379
134470	DOW	120	1787327280	53234.323868	53239.417326	53206.754665	53223.277477
134471	VIX	120	1787327280	15.272111	15.273621	15.265780	15.271649
134092	SP500	120	1787326920	7692.090568	7692.808296	7689.408280	7689.408280
134093	CRUDE	120	1787326920	86.506674	86.712463	86.503265	86.644755
134094	GOLD	120	1787326920	4658.537495	4662.919377	4657.809496	4662.761767
134095	DOW	120	1787326920	53210.060451	53218.027598	53202.488924	53217.061964
134096	VIX	120	1787326920	15.264700	15.267113	15.228975	15.232586
133967	SP500	120	1787326800	7688.718523	7692.927109	7688.417760	7692.000551
133595	DOW	120	1787326440	53157.500245	53189.181179	53157.400459	53179.386009
133596	VIX	120	1787326440	15.317142	15.333452	15.306737	15.306936
133968	CRUDE	120	1787326800	86.447310	86.515277	86.405140	86.508375
133969	GOLD	120	1787326800	4661.034316	4661.353180	4657.207191	4658.361663
133970	DOW	120	1787326800	53208.800651	53218.033737	53197.833248	53207.937380
133971	VIX	120	1787326800	15.271165	15.280570	15.264807	15.264807
133842	SP500	120	1787326680	7686.953288	7688.952091	7684.653552	7688.952091
133843	CRUDE	120	1787326680	86.683470	86.683470	86.428303	86.444288
133844	GOLD	120	1787326680	4659.676766	4663.044819	4658.777393	4660.881459
133845	DOW	120	1787326680	53201.895150	53211.644025	53175.185833	53208.758144
133846	VIX	120	1787326680	15.259955	15.273090	15.248065	15.271870
134217	SP500	120	1787327040	7689.400906	7693.732904	7689.115012	7692.021161
134218	CRUDE	120	1787327040	86.648123	86.707288	86.586411	86.676106
134219	GOLD	120	1787327040	4662.801701	4664.680038	4661.457491	4664.444724
134220	DOW	120	1787327040	53215.907969	53246.383814	53214.052154	53246.383814
134221	VIX	120	1787327040	15.233439	15.264283	15.230000	15.261302
135336	VIX	120	1787328120	15.340152	15.373941	15.324787	15.359021
134842	SP500	120	1787327640	7696.183267	7697.038258	7693.640000	7694.538753
134843	CRUDE	120	1787327640	86.898521	86.912055	86.830000	86.912055
134844	GOLD	120	1787327640	4666.097784	4668.209456	4666.079823	4667.697949
134845	DOW	120	1787327640	53242.465005	53259.310209	53228.782504	53228.782504
134846	VIX	120	1787327640	15.270137	15.282171	15.255317	15.259003
134717	SP500	120	1787327520	7693.350560	7696.735636	7693.318042	7696.034116
134718	CRUDE	120	1787327520	87.044595	87.044595	86.894583	86.897242
134719	GOLD	120	1787327520	4664.920748	4667.756334	4664.920748	4666.074014
134720	DOW	120	1787327520	53246.518732	53255.890118	53236.770000	53242.759579
134342	SP500	120	1787327160	7692.148351	7693.087083	7690.921210	7691.172584
134343	CRUDE	120	1787327160	86.677303	86.797381	86.625265	86.777457
134344	GOLD	120	1787327160	4664.504989	4665.873461	4663.824072	4664.095805
134345	DOW	120	1787327160	53248.250887	53250.142222	53227.503990	53235.214746
134346	VIX	120	1787327160	15.259960	15.274710	15.244083	15.272929
134721	VIX	120	1787327520	15.247442	15.271693	15.244344	15.271319
135092	SP500	120	1787327880	7690.479954	7691.882719	7689.857033	7690.241379
135093	CRUDE	120	1787327880	86.783956	86.815400	86.738555	86.786508
135094	GOLD	120	1787327880	4666.769087	4666.987116	4664.198307	4665.020108
135095	DOW	120	1787327880	53217.858055	53217.914197	53200.132392	53205.110730
135096	VIX	120	1787327880	15.280615	15.341721	15.278125	15.328054
134967	SP500	120	1787327760	7694.840867	7695.099458	7690.744788	7690.744788
135576	VIX	120	1787328360	15.332788	15.350000	15.327335	15.348141
135212	SP500	120	1787328000	7690.336822	7691.812891	7688.755078	7689.708214
135213	CRUDE	120	1787328000	86.784171	86.907878	86.745784	86.774797
135696	VIX	120	1787328480	15.348513	15.388550	15.346608	15.377666
135452	SP500	120	1787328240	7688.026660	7688.143921	7684.549037	7685.132566
135453	CRUDE	120	1787328240	86.816146	86.817216	86.716948	86.785279
135214	GOLD	120	1787328000	4665.186744	4668.533532	4664.950646	4668.351512
135215	DOW	120	1787328000	53207.201112	53216.280875	53190.853635	53200.475239
135216	VIX	120	1787328000	15.328204	15.354033	15.325828	15.338986
135454	GOLD	120	1787328240	4671.895846	4672.381697	4670.922838	4671.138813
135455	DOW	120	1787328240	53189.582829	53192.864215	53164.650000	53168.436642
135456	VIX	120	1787328240	15.360514	15.361994	15.326641	15.332689
135572	SP500	120	1787328360	7685.076326	7685.738943	7682.325981	7683.686300
135573	CRUDE	120	1787328360	86.781892	86.874049	86.766021	86.852755
135574	GOLD	120	1787328360	4671.244403	4672.837850	4669.597942	4670.652253
135575	DOW	120	1787328360	53170.301078	53172.127223	53153.076655	53163.318663
135692	SP500	120	1787328480	7683.870681	7685.351471	7681.249817	7681.468935
135693	CRUDE	120	1787328480	86.852460	86.882657	86.816235	86.817643
135694	GOLD	120	1787328480	4670.710848	4671.646360	4668.055248	4670.953218
135695	DOW	120	1787328480	53163.617955	53180.472464	53158.770448	53163.257745
135812	SP500	120	1787328600	7681.697196	7683.880006	7681.292328	7682.476348
135813	CRUDE	120	1787328600	86.819419	86.923292	86.776176	86.921202
135814	GOLD	120	1787328600	4671.104563	4673.656352	4670.679052	4672.955273
137189	GOLD	120	1787329920	4673.331158	4673.411600	4670.048807	4670.048807
137190	DOW	120	1787329920	53178.951513	53185.363476	53165.064380	53175.780388
137191	VIX	120	1787329920	15.318178	15.322922	15.313440	15.319379
135937	SP500	120	1787328720	7682.746049	7683.790110	7681.229064	7682.590812
135938	CRUDE	120	1787328720	86.919801	86.920897	86.836253	86.837878
135939	GOLD	120	1787328720	4672.869741	4675.419705	4670.993192	4674.200480
135940	DOW	120	1787328720	53176.916622	53176.916622	53156.003466	53162.207661
135941	VIX	120	1787328720	15.383968	15.386651	15.358139	15.370614
137812	SP500	120	1787330520	7683.011470	7685.010302	7682.033840	7682.505071
137562	SP500	120	1787330280	7681.973194	7683.659041	7680.748502	7683.659041
137437	SP500	120	1787330160	7680.054960	7682.444503	7678.734562	7682.221547
136812	SP500	120	1787329560	7680.734864	7682.413747	7679.726188	7681.017148
136813	CRUDE	120	1787329560	86.903538	86.952587	86.899481	86.910207
136814	GOLD	120	1787329560	4672.230138	4674.053264	4672.047756	4672.655679
136815	DOW	120	1787329560	53143.626460	53170.284630	53129.984573	53166.911134
136816	VIX	120	1787329560	15.359914	15.364391	15.348558	15.349944
136687	SP500	120	1787329440	7679.773050	7682.566644	7679.549216	7680.889877
136688	CRUDE	120	1787329440	86.897004	86.906038	86.845025	86.905347
136689	GOLD	120	1787329440	4672.714063	4673.331561	4671.187934	4672.064563
136690	DOW	120	1787329440	53139.446566	53154.311223	53134.050580	53144.704439
136691	VIX	120	1787329440	15.357969	15.366223	15.354376	15.361292
136312	SP500	120	1787329080	7683.471956	7683.954739	7678.599383	7679.455170
136313	CRUDE	120	1787329080	86.978010	86.985964	86.878161	86.904869
136314	GOLD	120	1787329080	4670.760180	4672.222609	4666.800000	4668.648967
136315	DOW	120	1787329080	53145.301182	53152.893300	53117.136668	53120.905007
136316	VIX	120	1787329080	15.391882	15.396041	15.375667	15.388595
136187	SP500	120	1787328960	7682.442632	7684.564093	7682.037791	7683.385362
136188	CRUDE	120	1787328960	86.902723	86.993570	86.874119	86.979904
136189	GOLD	120	1787328960	4671.845419	4673.900000	4670.615487	4670.782041
135815	DOW	120	1787328600	53161.804977	53178.793183	53158.528106	53175.749013
135816	VIX	120	1787328600	15.377421	15.390666	15.368504	15.383053
136190	DOW	120	1787328960	53153.269454	53167.379004	53145.269312	53145.269312
136191	VIX	120	1787328960	15.389022	15.395188	15.379882	15.391312
136437	SP500	120	1787329200	7679.528375	7684.826509	7677.557362	7682.590048
136438	CRUDE	120	1787329200	86.904923	86.910905	86.824913	86.832200
136439	GOLD	120	1787329200	4668.498490	4671.408446	4666.997960	4670.896632
136062	SP500	120	1787328840	7682.802722	7683.916918	7680.570249	7682.235131
136063	CRUDE	120	1787328840	86.841074	86.912431	86.812229	86.901287
136064	GOLD	120	1787328840	4674.369259	4674.859497	4671.861471	4671.861471
136065	DOW	120	1787328840	53160.927986	53173.191979	53148.141091	53155.051191
136066	VIX	120	1787328840	15.370778	15.391305	15.367988	15.390025
136440	DOW	120	1787329200	53119.428103	53169.543722	53117.614251	53158.458066
136441	VIX	120	1787329200	15.389816	15.401523	15.378505	15.393923
137438	CRUDE	120	1787330160	86.574566	86.621567	86.515264	86.546415
137062	SP500	120	1787329800	7682.843535	7684.030975	7679.869873	7681.419362
137063	CRUDE	120	1787329800	86.902653	86.980234	86.573682	86.678969
137064	GOLD	120	1787329800	4672.818229	4676.063477	4668.847282	4673.222811
137065	DOW	120	1787329800	53175.805024	53184.819238	53167.653098	53178.504413
137066	VIX	120	1787329800	15.343083	15.344273	15.318121	15.318121
136937	SP500	120	1787329680	7681.201278	7685.194957	7681.201278	7682.921615
136562	SP500	120	1787329320	7682.870411	7683.248424	7679.891685	7679.925197
136563	CRUDE	120	1787329320	86.835082	86.924309	86.830764	86.900039
136564	GOLD	120	1787329320	4670.733222	4672.769441	4669.005865	4672.769441
136565	DOW	120	1787329320	53160.191943	53164.725059	53134.486465	53139.158031
136566	VIX	120	1787329320	15.392636	15.396453	15.358080	15.358080
136938	CRUDE	120	1787329680	86.913595	86.920000	86.869013	86.903669
136939	GOLD	120	1787329680	4672.804809	4673.100000	4671.348634	4672.762396
136940	DOW	120	1787329680	53168.689789	53188.613134	53167.832871	53175.415030
136941	VIX	120	1787329680	15.348537	15.348537	15.336110	15.341974
137439	GOLD	120	1787330160	4670.782908	4670.782908	4668.153781	4669.342692
137440	DOW	120	1787330160	53158.973356	53184.490000	53149.821766	53181.873548
137441	VIX	120	1787330160	15.351355	15.351355	15.290000	15.311069
137563	CRUDE	120	1787330280	86.545872	86.626756	86.545872	86.617299
137312	SP500	120	1787330040	7681.908969	7682.038978	7678.578092	7680.258049
137313	CRUDE	120	1787330040	86.836669	86.842964	86.538301	86.573582
137314	GOLD	120	1787330040	4670.078655	4671.919659	4669.903013	4670.730051
137315	DOW	120	1787330040	53173.855295	53175.851210	53147.768422	53158.045598
137316	VIX	120	1787330040	15.319813	15.352676	15.319813	15.352676
137187	SP500	120	1787329920	7681.199170	7682.124897	7680.100733	7681.695605
137188	CRUDE	120	1787329920	86.679270	86.846467	86.636267	86.838353
137564	GOLD	120	1787330280	4669.471065	4671.576842	4669.314313	4670.566882
137565	DOW	120	1787330280	53180.767368	53195.578897	53169.677635	53190.198483
137566	VIX	120	1787330280	15.310986	15.315538	15.307927	15.314240
137813	CRUDE	120	1787330520	86.587562	86.591161	86.513766	86.588879
137814	GOLD	120	1787330520	4669.970171	4673.100000	4669.840982	4672.780208
137815	DOW	120	1787330520	53187.715487	53191.651042	53166.211583	53169.301975
137816	VIX	120	1787330520	15.310050	15.312184	15.293757	15.312184
137687	SP500	120	1787330400	7683.665640	7684.281223	7681.689979	7683.056430
137688	CRUDE	120	1787330400	86.618372	86.618372	86.544380	86.586213
137689	GOLD	120	1787330400	4670.482554	4672.805696	4669.789479	4669.790536
137690	DOW	120	1787330400	53188.258996	53196.706173	53180.244531	53186.899042
137691	VIX	120	1787330400	15.315700	15.317429	15.305607	15.310048
137937	SP500	120	1787330640	7682.541032	7683.283893	7679.989591	7680.037752
137938	CRUDE	120	1787330640	86.589959	86.639244	86.562016	86.600205
137939	GOLD	120	1787330640	4672.617395	4673.734615	4672.398904	4673.110437
137940	DOW	120	1787330640	53168.195053	53173.351527	53152.829007	53158.197563
137941	VIX	120	1787330640	15.312595	15.315265	15.298502	15.308962
138062	SP500	120	1787330760	7680.333902	7682.876076	7679.637299	7680.767807
138063	CRUDE	120	1787330760	86.601983	86.760163	86.574917	86.745111
138064	GOLD	120	1787330760	4672.946329	4673.864127	4672.189663	4673.441536
140027	SP500	120	1787332680	7680.538380	7681.477486	7678.769206	7680.213652
139057	SP500	120	1787331720	7682.814893	7684.303864	7681.108842	7681.869554
139058	CRUDE	120	1787331720	86.734739	86.887325	86.731474	86.816546
139059	GOLD	120	1787331720	4683.610614	4684.247124	4681.534751	4683.435977
139060	DOW	120	1787331720	53180.386579	53180.484528	53159.442768	53175.323020
138187	SP500	120	1787330880	7680.463318	7681.769461	7679.767901	7680.842091
138188	CRUDE	120	1787330880	86.743551	86.825287	86.741121	86.814573
138189	GOLD	120	1787330880	4673.583687	4677.784770	4673.583687	4677.064276
138190	DOW	120	1787330880	53160.456404	53178.036187	53158.286565	53172.299323
138191	VIX	120	1787330880	15.327527	15.340650	15.322110	15.340635
139061	VIX	120	1787331720	15.308006	15.323323	15.305448	15.320138
139417	SP500	120	1787332080	7680.080244	7683.370000	7680.080244	7682.547704
139418	CRUDE	120	1787332080	86.894501	86.930663	86.894501	86.920973
138937	SP500	120	1787331600	7681.883863	7684.247711	7681.321378	7682.853445
138938	CRUDE	120	1787331600	86.789679	86.789820	86.691281	86.734985
138939	GOLD	120	1787331600	4681.185558	4684.356068	4680.970427	4683.507060
138940	DOW	120	1787331600	53195.753619	53199.470869	53176.330000	53178.820451
138941	VIX	120	1787331600	15.304559	15.312548	15.296728	15.308764
139419	GOLD	120	1787332080	4684.721963	4687.195227	4684.355373	4686.000106
139177	SP500	120	1787331840	7681.920388	7682.665936	7679.877966	7682.232883
139178	CRUDE	120	1787331840	86.814648	86.883961	86.811854	86.868174
139179	GOLD	120	1787331840	4683.565700	4685.147784	4683.491851	4684.912572
138562	SP500	120	1787331240	7679.020350	7679.827691	7677.311933	7677.311933
138563	CRUDE	120	1787331240	86.875059	86.900542	86.809227	86.892849
138564	GOLD	120	1787331240	4678.286971	4680.071079	4677.755818	4679.245451
138565	DOW	120	1787331240	53156.198958	53172.058504	53151.888907	53165.502060
138566	VIX	120	1787331240	15.330296	15.331467	15.284431	15.292221
138437	SP500	120	1787331120	7678.716577	7679.013777	7676.686416	7678.818125
138065	DOW	120	1787330760	53156.691134	53169.880000	53140.081414	53158.995040
138066	VIX	120	1787330760	15.308313	15.330605	15.301559	15.328983
138438	CRUDE	120	1787331120	86.838264	86.931346	86.837924	86.872935
138439	GOLD	120	1787331120	4676.430386	4679.259002	4676.142021	4678.343771
138440	DOW	120	1787331120	53159.246891	53164.551644	53150.166255	53156.150608
138441	VIX	120	1787331120	15.330307	15.334772	15.322546	15.330019
139180	DOW	120	1787331840	53174.967142	53178.999795	53154.572390	53160.938745
139181	VIX	120	1787331840	15.321009	15.344441	15.313898	15.344441
138312	SP500	120	1787331000	7680.681745	7681.659046	7676.369864	7678.512564
138313	CRUDE	120	1787331000	86.816712	86.920353	86.808420	86.838966
138314	GOLD	120	1787331000	4677.118576	4677.611813	4674.887488	4676.476738
138315	DOW	120	1787331000	53172.621027	53174.023790	53144.085793	53157.325290
138316	VIX	120	1787331000	15.342082	15.345822	15.329696	15.330570
138687	SP500	120	1787331360	7677.044016	7680.865809	7676.864536	7680.865809
138688	CRUDE	120	1787331360	86.891981	86.947294	86.860000	86.871465
138689	GOLD	120	1787331360	4679.332971	4681.395707	4678.191094	4680.805442
138690	DOW	120	1787331360	53166.973374	53185.801141	53160.080000	53181.008050
138691	VIX	120	1787331360	15.292625	15.294003	15.269526	15.272225
139420	DOW	120	1787332080	53172.217470	53185.160000	53162.752802	53178.375300
139421	VIX	120	1787332080	15.338906	15.342454	15.326042	15.334828
140028	CRUDE	120	1787332680	86.984389	87.081356	86.982523	87.037853
140029	GOLD	120	1787332680	4687.709064	4690.304995	4687.679832	4688.419653
140030	DOW	120	1787332680	53185.131661	53189.760213	53168.011573	53178.371184
139777	SP500	120	1787332440	7679.914202	7681.576423	7679.105188	7679.904426
138812	SP500	120	1787331480	7680.861068	7683.420091	7680.065674	7682.118036
138813	CRUDE	120	1787331480	86.874503	86.881598	86.786512	86.790123
138814	GOLD	120	1787331480	4680.709164	4683.184775	4680.419678	4681.259839
138815	DOW	120	1787331480	53182.001292	53195.508100	53177.395736	53194.090874
138816	VIX	120	1787331480	15.271042	15.305634	15.270391	15.303957
139778	CRUDE	120	1787332440	86.986650	86.992832	86.870419	86.928911
139779	GOLD	120	1787332440	4687.729664	4688.460524	4684.132896	4684.132896
139780	DOW	120	1787332440	53160.835117	53178.893494	53154.340245	53177.517134
139537	SP500	120	1787332200	7682.527028	7683.126548	7680.217647	7681.002712
139538	CRUDE	120	1787332200	86.917775	87.038432	86.911581	86.957141
139539	GOLD	120	1787332200	4685.937925	4686.819860	4684.366536	4684.533715
139540	DOW	120	1787332200	53178.173102	53182.482183	53155.637910	53156.954476
139541	VIX	120	1787332200	15.334634	15.343912	15.324497	15.328318
139297	SP500	120	1787331960	7682.060748	7682.606981	7680.182299	7680.379667
139298	CRUDE	120	1787331960	86.870279	86.918601	86.860426	86.892630
139299	GOLD	120	1787331960	4684.814330	4685.262273	4683.600000	4684.714048
139781	VIX	120	1787332440	15.314712	15.322922	15.306552	15.322922
139657	SP500	120	1787332320	7680.786599	7681.747643	7679.801157	7679.941763
139300	DOW	120	1787331960	53161.477807	53176.007020	53156.108272	53171.278470
139301	VIX	120	1787331960	15.343283	15.347460	15.334791	15.339346
139658	CRUDE	120	1787332320	86.954313	87.031790	86.940239	86.984480
139659	GOLD	120	1787332320	4684.443305	4688.952703	4684.098548	4687.746600
140031	VIX	120	1787332680	15.315309	15.334717	15.314714	15.330707
139902	SP500	120	1787332560	7679.795232	7682.158350	7679.099637	7680.269453
139903	CRUDE	120	1787332560	86.925859	86.991807	86.897650	86.985244
139660	DOW	120	1787332320	53155.630462	53166.797356	53149.453649	53158.922781
139661	VIX	120	1787332320	15.329316	15.331660	15.306339	15.315915
139904	GOLD	120	1787332560	4684.054224	4688.000000	4683.916775	4687.807432
139905	DOW	120	1787332560	53175.534091	53186.051585	53160.052325	53185.519871
139906	VIX	120	1787332560	15.322218	15.338570	15.316398	15.316398
140152	SP500	120	1787332800	7680.239222	7681.095567	7677.103598	7677.238668
140153	CRUDE	120	1787332800	87.035714	87.140373	86.954165	87.140373
140154	GOLD	120	1787332800	4688.383024	4689.917863	4686.777596	4689.492642
140155	DOW	120	1787332800	53178.315883	53180.959604	53160.013245	53168.878094
140156	VIX	120	1787332800	15.329933	15.342619	15.318308	15.319204
140277	SP500	120	1787332920	7677.174475	7678.876734	7675.828708	7677.055226
140278	CRUDE	120	1787332920	87.140921	87.191289	87.119042	87.152934
140279	GOLD	120	1787332920	4689.601162	4689.989215	4680.084888	4680.398715
141653	CRUDE	120	1787334240	87.362930	87.390000	87.314592	87.318928
141654	GOLD	120	1787334240	4678.953683	4682.525269	4677.706996	4682.105779
141655	DOW	120	1787334240	53182.553400	53205.221056	53178.694300	53205.221056
141656	VIX	120	1787334240	15.309812	15.309812	15.294160	15.295557
140402	SP500	120	1787333040	7677.093332	7678.100638	7675.723329	7676.075427
140403	CRUDE	120	1787333040	87.151903	87.178628	87.117581	87.123063
140404	GOLD	120	1787333040	4680.268202	4682.300000	4680.118736	4681.116089
140405	DOW	120	1787333040	53171.059202	53175.047336	53158.914092	53164.118381
140406	VIX	120	1787333040	15.301262	15.304596	15.286138	15.302074
142277	SP500	120	1787334840	7676.067849	7676.067849	7673.500972	7673.645459
142027	SP500	120	1787334600	7675.683330	7677.216293	7674.556586	7674.837302
141902	SP500	120	1787334480	7676.237363	7678.133574	7674.546951	7675.811964
141277	SP500	120	1787333880	7674.525546	7675.898755	7674.134457	7674.309498
141278	CRUDE	120	1787333880	87.152013	87.239517	87.130958	87.231087
141279	GOLD	120	1787333880	4676.972916	4681.982610	4676.718535	4680.853600
141280	DOW	120	1787333880	53181.297393	53185.087098	53168.387506	53176.582157
141281	VIX	120	1787333880	15.326572	15.333507	15.313705	15.314396
141152	SP500	120	1787333760	7674.660872	7676.716166	7673.989497	7674.463369
141153	CRUDE	120	1787333760	87.173440	87.206088	87.123080	87.150656
141154	GOLD	120	1787333760	4675.388540	4677.103422	4673.382573	4676.894393
141155	DOW	120	1787333760	53177.493371	53195.789834	53175.872084	53179.197282
141156	VIX	120	1787333760	15.310425	15.331978	15.305140	15.327322
140777	SP500	120	1787333400	7677.792212	7678.263389	7675.285043	7675.285043
140778	CRUDE	120	1787333400	87.141598	87.142315	87.040000	87.043336
140779	GOLD	120	1787333400	4681.279222	4682.400000	4680.072583	4681.588216
140780	DOW	120	1787333400	53168.066978	53175.777177	53155.746214	53161.797075
140781	VIX	120	1787333400	15.306653	15.313258	15.293017	15.302654
140652	SP500	120	1787333280	7676.488704	7678.977488	7676.017719	7677.681830
140280	DOW	120	1787332920	53168.952759	53182.616143	53158.776256	53172.251252
140281	VIX	120	1787332920	15.318930	15.321346	15.295398	15.301328
140653	CRUDE	120	1787333280	87.179459	87.179459	87.062227	87.143976
140654	GOLD	120	1787333280	4683.009225	4683.901911	4680.765245	4681.110887
140655	DOW	120	1787333280	53163.952560	53182.489172	53159.568360	53167.159992
140656	VIX	120	1787333280	15.309611	15.314545	15.305085	15.306611
140902	SP500	120	1787333520	7675.491548	7676.901619	7673.931357	7675.975239
140527	SP500	120	1787333160	7675.872658	7676.955763	7674.583195	7676.434963
140528	CRUDE	120	1787333160	87.125650	87.185150	87.119436	87.179185
140529	GOLD	120	1787333160	4681.008279	4683.744329	4680.376251	4683.063122
140530	DOW	120	1787333160	53163.727247	53174.875378	53160.759163	53163.393558
140531	VIX	120	1787333160	15.302444	15.321174	15.294720	15.310009
140903	CRUDE	120	1787333520	87.041395	87.102660	86.993060	87.098271
140904	GOLD	120	1787333520	4681.403827	4681.504359	4673.832252	4674.251107
140905	DOW	120	1787333520	53160.579331	53174.460000	53158.905314	53163.302864
140906	VIX	120	1787333520	15.303754	15.305649	15.287270	15.299686
141903	CRUDE	120	1787334480	87.340123	87.340123	87.226680	87.292956
141527	SP500	120	1787334120	7675.749435	7676.665755	7673.877467	7674.932767
141528	CRUDE	120	1787334120	87.380026	87.443745	87.333933	87.363172
141529	GOLD	120	1787334120	4680.047925	4680.047925	4677.552725	4678.946835
141530	DOW	120	1787334120	53181.713308	53192.793762	53174.133637	53181.558320
141531	VIX	120	1787334120	15.323935	15.330253	15.303665	15.308967
141402	SP500	120	1787334000	7674.287163	7675.596989	7672.867265	7675.571047
141403	CRUDE	120	1787334000	87.234527	87.385501	87.233500	87.383262
141027	SP500	120	1787333640	7675.704741	7676.300000	7673.825204	7674.434644
141028	CRUDE	120	1787333640	87.099382	87.212360	87.095929	87.172574
141029	GOLD	120	1787333640	4674.221834	4677.039074	4673.497770	4675.498201
141030	DOW	120	1787333640	53161.725185	53188.505341	53161.725185	53178.885711
141031	VIX	120	1787333640	15.298328	15.310755	15.295280	15.309006
141404	GOLD	120	1787334000	4680.965808	4680.981808	4677.756103	4679.882757
141405	DOW	120	1787334000	53178.191546	53187.269704	53172.951700	53182.416188
141406	VIX	120	1787334000	15.315415	15.332842	15.313481	15.324609
141904	GOLD	120	1787334480	4682.486487	4682.486487	4680.450129	4680.450129
141905	DOW	120	1787334480	53207.073944	53221.806010	53193.490256	53205.731567
141906	VIX	120	1787334480	15.298785	15.308138	15.296601	15.298682
142028	CRUDE	120	1787334600	87.293988	87.308862	87.190000	87.251845
142029	GOLD	120	1787334600	4680.622494	4682.765393	4680.522270	4682.590511
141777	SP500	120	1787334360	7676.982619	7677.520645	7673.971680	7676.293005
141778	CRUDE	120	1787334360	87.320267	87.342815	87.302372	87.337422
141779	GOLD	120	1787334360	4681.967602	4683.126035	4681.094334	4682.600236
141780	DOW	120	1787334360	53203.967159	53214.220446	53190.964396	53208.990106
141652	SP500	120	1787334240	7674.853619	7676.720745	7673.958870	7676.718282
142030	DOW	120	1787334600	53206.987717	53213.045293	53187.897528	53194.030191
142031	VIX	120	1787334600	15.298327	15.313041	15.296697	15.301125
141781	VIX	120	1787334360	15.294405	15.305899	15.292981	15.299840
142278	CRUDE	120	1787334840	87.231360	87.241019	87.152974	87.211878
142279	GOLD	120	1787334840	4681.168542	4681.590170	4675.850287	4677.547365
142280	DOW	120	1787334840	53192.452937	53199.758213	53181.257506	53187.982595
142281	VIX	120	1787334840	15.293311	15.293764	15.281902	15.289929
142152	SP500	120	1787334720	7674.971474	7676.272878	7673.091027	7675.996358
142153	CRUDE	120	1787334720	87.249984	87.300000	87.230374	87.230374
142154	GOLD	120	1787334720	4682.448556	4683.138125	4680.106016	4681.262786
142155	DOW	120	1787334720	53193.935086	53196.046625	53181.130998	53190.950773
142156	VIX	120	1787334720	15.302058	15.302058	15.278383	15.292578
142402	SP500	120	1787334960	7673.508637	7674.527470	7672.499813	7673.711248
142403	CRUDE	120	1787334960	87.208402	87.322882	87.207904	87.298126
142404	GOLD	120	1787334960	4677.709056	4677.709056	4675.266002	4677.280894
142405	DOW	120	1787334960	53189.283593	53198.830091	53183.626769	53196.292149
142406	VIX	120	1787334960	15.289777	15.293903	15.277196	15.279373
142527	SP500	120	1787335080	7673.994751	7674.735189	7672.886901	7673.876294
142528	CRUDE	120	1787335080	87.297894	87.314997	87.280725	87.303900
142529	GOLD	120	1787335080	4677.392411	4677.609423	4675.513522	4677.424008
143903	CRUDE	120	1787336400	87.137930	87.170000	87.113508	87.161089
143904	GOLD	120	1787336400	4684.491768	4684.966324	4681.155544	4681.781928
143905	DOW	120	1787336400	53203.983975	53219.428782	53198.546812	53218.944437
143906	VIX	120	1787336400	15.242816	15.280000	15.239266	15.277838
142652	SP500	120	1787335200	7673.581344	7675.303686	7672.441016	7674.181164
142653	CRUDE	120	1787335200	87.302250	87.330237	87.255616	87.282502
142654	GOLD	120	1787335200	4677.605231	4678.926575	4675.895777	4676.723908
142655	DOW	120	1787335200	53208.015426	53213.242020	53192.217043	53209.869859
142656	VIX	120	1787335200	15.271589	15.272741	15.238151	15.239418
144527	SP500	120	1787337000	7671.622156	7672.464672	7667.591659	7670.238498
144277	SP500	120	1787336760	7672.405247	7673.229798	7670.294999	7672.618355
144152	SP500	120	1787336640	7674.600446	7675.615505	7672.297629	7672.644029
143527	SP500	120	1787336040	7672.337772	7674.148074	7671.650387	7672.545262
143528	CRUDE	120	1787336040	87.198213	87.213979	87.070649	87.074743
143529	GOLD	120	1787336040	4683.674408	4685.041219	4682.578215	4682.715138
143530	DOW	120	1787336040	53190.039330	53207.252723	53187.816719	53196.759577
143531	VIX	120	1787336040	15.228240	15.247706	15.225332	15.228358
143402	SP500	120	1787335920	7672.810250	7674.732585	7671.604867	7672.496384
143403	CRUDE	120	1787335920	87.114821	87.202047	87.105625	87.198570
143404	GOLD	120	1787335920	4680.869074	4684.621477	4680.126828	4683.567195
143405	DOW	120	1787335920	53195.445156	53209.182672	53190.748276	53192.057620
143406	VIX	120	1787335920	15.230339	15.235819	15.225163	15.229575
143027	SP500	120	1787335560	7674.864629	7675.071988	7671.368345	7673.083219
143028	CRUDE	120	1787335560	87.367329	87.385993	87.316709	87.334965
143029	GOLD	120	1787335560	4677.904959	4679.182281	4677.637822	4678.811662
143030	DOW	120	1787335560	53197.748186	53210.749333	53194.563505	53202.878214
143031	VIX	120	1787335560	15.231072	15.240469	15.216240	15.239078
142902	SP500	120	1787335440	7676.444650	7677.106102	7674.513081	7674.572392
142530	DOW	120	1787335080	53194.656161	53209.121514	53188.275525	53205.925231
142531	VIX	120	1787335080	15.279950	15.284916	15.264690	15.270827
142903	CRUDE	120	1787335440	87.277704	87.391820	87.276326	87.369463
142904	GOLD	120	1787335440	4677.302773	4678.657524	4676.933613	4678.006453
142905	DOW	120	1787335440	53210.132168	53214.644481	53195.792318	53195.792318
142906	VIX	120	1787335440	15.219911	15.231697	15.215274	15.231697
142777	SP500	120	1787335320	7674.204575	7676.631829	7671.288254	7676.631829
142778	CRUDE	120	1787335320	87.281154	87.283585	87.224024	87.274361
142779	GOLD	120	1787335320	4676.837640	4678.621626	4676.837640	4677.296045
142780	DOW	120	1787335320	53208.180074	53223.598166	53198.914373	53210.162198
142781	VIX	120	1787335320	15.239550	15.244162	15.207773	15.220631
143152	SP500	120	1787335680	7672.795823	7673.585416	7671.914169	7672.365137
143153	CRUDE	120	1787335680	87.331779	87.344066	87.301429	87.323999
143154	GOLD	120	1787335680	4678.824263	4679.595401	4677.860198	4678.271054
143155	DOW	120	1787335680	53203.315420	53209.433028	53199.180000	53207.352189
143156	VIX	120	1787335680	15.239237	15.244566	15.224411	15.231002
144153	CRUDE	120	1787336640	87.183177	87.194584	87.151834	87.190290
143777	SP500	120	1787336280	7673.895916	7674.158675	7671.741630	7673.574444
143778	CRUDE	120	1787336280	87.100842	87.145917	87.096926	87.137810
143779	GOLD	120	1787336280	4684.396648	4685.926437	4683.796090	4684.316184
143780	DOW	120	1787336280	53202.137039	53211.677860	53199.878138	53204.872745
143781	VIX	120	1787336280	15.261570	15.263837	15.232622	15.242192
143652	SP500	120	1787336160	7672.717459	7673.960681	7671.074888	7673.960681
143653	CRUDE	120	1787336160	87.075650	87.111989	87.015374	87.100891
143654	GOLD	120	1787336160	4682.885469	4684.536595	4682.381756	4684.209750
143655	DOW	120	1787336160	53196.867256	53206.591778	53183.966706	53202.191506
143277	SP500	120	1787335800	7672.491404	7673.497692	7671.102638	7672.873392
143278	CRUDE	120	1787335800	87.325431	87.326765	87.056470	87.114430
143279	GOLD	120	1787335800	4678.342016	4681.402577	4677.837222	4680.769554
143280	DOW	120	1787335800	53206.254243	53207.731423	53186.911256	53195.004301
143281	VIX	120	1787335800	15.229483	15.236777	15.226288	15.229560
143656	VIX	120	1787336160	15.228510	15.264224	15.225612	15.262096
144154	GOLD	120	1787336640	4682.722606	4683.563051	4681.818950	4682.650620
144155	DOW	120	1787336640	53198.645181	53225.040000	53196.764790	53220.437475
144156	VIX	120	1787336640	15.292370	15.306281	15.286550	15.301321
144278	CRUDE	120	1787336760	87.190478	87.210000	87.153468	87.200842
144279	GOLD	120	1787336760	4682.788621	4684.125557	4682.383830	4684.026669
144027	SP500	120	1787336520	7674.839866	7675.423847	7673.344298	7674.438305
144028	CRUDE	120	1787336520	87.157773	87.233024	87.151703	87.184365
144029	GOLD	120	1787336520	4681.918435	4683.229841	4681.645343	4682.597225
144030	DOW	120	1787336520	53217.990546	53221.412903	53194.940684	53200.452492
143902	SP500	120	1787336400	7673.612653	7676.012488	7672.504959	7674.828800
144280	DOW	120	1787336760	53219.378792	53238.582767	53219.378792	53236.436278
144281	VIX	120	1787336760	15.300684	15.309073	15.293493	15.298684
144031	VIX	120	1787336520	15.276562	15.298288	15.273268	15.293574
144528	CRUDE	120	1787337000	87.302363	87.306907	87.262937	87.277884
144529	GOLD	120	1787337000	4685.144295	4686.131094	4683.544697	4684.976047
144530	DOW	120	1787337000	53241.360373	53243.571031	53218.768089	53226.842615
144531	VIX	120	1787337000	15.297312	15.317324	15.296893	15.310583
144402	SP500	120	1787336880	7672.689948	7673.312374	7670.739490	7671.789567
144403	CRUDE	120	1787336880	87.198574	87.315484	87.196355	87.299154
144404	GOLD	120	1787336880	4684.060097	4685.728072	4682.872786	4685.288509
144405	DOW	120	1787336880	53236.116497	53242.963400	53229.117389	53242.227856
144406	VIX	120	1787336880	15.297353	15.304258	15.286426	15.296168
144652	SP500	120	1787337120	7670.380500	7672.107980	7668.741395	7670.427657
144653	CRUDE	120	1787337120	87.279681	87.312091	87.239747	87.246726
144654	GOLD	120	1787337120	4684.866808	4685.231498	4683.486049	4685.231498
144655	DOW	120	1787337120	53227.161272	53240.670515	53220.870053	53229.679959
144656	VIX	120	1787337120	15.310487	15.313475	15.296304	15.302025
144777	SP500	120	1787337240	7670.654514	7671.547667	7669.257528	7670.297371
144778	CRUDE	120	1787337240	87.245245	87.292100	87.227864	87.262357
144779	GOLD	120	1787337240	4685.145670	4685.820145	4683.320741	4685.675950
146393	CRUDE	120	1787338800	86.921210	87.108038	86.921210	87.097375
146394	GOLD	120	1787338800	4682.517195	4682.888348	4681.140862	4682.034303
146017	SP500	120	1787338440	7676.390196	7678.084243	7675.902740	7676.273748
145767	SP500	120	1787338200	7676.364486	7676.868669	7674.359888	7675.094670
145768	CRUDE	120	1787338200	87.012064	87.012064	86.929766	86.980280
145769	GOLD	120	1787338200	4677.568766	4679.298853	4677.154394	4678.806067
144902	SP500	120	1787337360	7670.417814	7672.521456	7669.965244	7670.976025
144903	CRUDE	120	1787337360	87.264197	87.270015	87.169228	87.190095
144904	GOLD	120	1787337360	4685.763121	4686.272280	4683.137340	4683.662158
144905	DOW	120	1787337360	53230.794348	53245.893232	53230.144703	53245.550408
144906	VIX	120	1787337360	15.293546	15.295316	15.268418	15.269718
145770	DOW	120	1787338200	53267.454000	53273.475123	53257.270267	53259.926857
145771	VIX	120	1787338200	15.328623	15.332657	15.307284	15.309529
145642	SP500	120	1787338080	7673.438707	7676.109653	7672.714557	7676.109653
145643	CRUDE	120	1787338080	87.097650	87.097650	87.008308	87.014755
145644	GOLD	120	1787338080	4680.515884	4680.686386	4677.223807	4677.566966
145645	DOW	120	1787338080	53260.343041	53266.598344	53249.986549	53266.598344
145646	VIX	120	1787338080	15.325980	15.335502	15.318471	15.329028
146018	CRUDE	120	1787338440	86.979379	86.990000	86.934147	86.954495
146019	GOLD	120	1787338440	4678.379797	4680.200000	4677.181163	4679.568328
146020	DOW	120	1787338440	53279.579987	53292.179038	53273.129707	53281.236554
146021	VIX	120	1787338440	15.313116	15.320755	15.304336	15.312422
145402	SP500	120	1787337840	7671.604949	7674.019480	7671.491795	7671.876479
145277	SP500	120	1787337720	7672.301241	7672.712224	7670.355378	7671.484477
145278	CRUDE	120	1787337720	87.045593	87.128188	87.045593	87.128188
145279	GOLD	120	1787337720	4679.086780	4679.991358	4678.087353	4679.086395
145280	DOW	120	1787337720	53252.392989	53265.008073	53244.110329	53263.398396
145281	VIX	120	1787337720	15.296953	15.314403	15.295857	15.312458
145152	SP500	120	1787337600	7670.118813	7672.814066	7669.883425	7672.105205
144780	DOW	120	1787337240	53230.325098	53244.903876	53220.505700	53230.548372
144781	VIX	120	1787337240	15.300586	15.303778	15.286433	15.292704
145153	CRUDE	120	1787337600	87.030810	87.155214	87.013082	87.043858
145154	GOLD	120	1787337600	4683.302488	4683.406615	4678.386410	4679.217180
145155	DOW	120	1787337600	53244.402941	53257.329946	53236.388429	53254.321313
145156	VIX	120	1787337600	15.260955	15.304849	15.260955	15.298182
145403	CRUDE	120	1787337840	87.129283	87.150315	87.095584	87.098720
145404	GOLD	120	1787337840	4679.212374	4681.032485	4678.967640	4679.497486
145405	DOW	120	1787337840	53263.263312	53272.414634	53251.002178	53257.696673
145406	VIX	120	1787337840	15.311310	15.330000	15.305896	15.326405
145027	SP500	120	1787337480	7671.128689	7672.279711	7669.774320	7670.291372
145028	CRUDE	120	1787337480	87.190129	87.192424	86.988457	87.029508
145029	GOLD	120	1787337480	4683.515908	4684.271681	4682.338021	4683.204434
145030	DOW	120	1787337480	53245.239233	53253.809634	53235.659824	53243.744660
145031	VIX	120	1787337480	15.268221	15.271692	15.246846	15.260168
145892	SP500	120	1787338320	7674.845652	7677.278993	7674.845652	7676.297190
145893	CRUDE	120	1787338320	86.977416	86.990000	86.955665	86.981744
145894	GOLD	120	1787338320	4678.947793	4679.284485	4677.438551	4678.344798
145895	DOW	120	1787338320	53260.074944	53280.220388	53244.641214	53280.220388
145896	VIX	120	1787338320	15.310683	15.320000	15.305771	15.311759
145522	SP500	120	1787337960	7672.099787	7674.183282	7671.077248	7673.163834
145523	CRUDE	120	1787337960	87.100139	87.102792	87.046954	87.098921
145524	GOLD	120	1787337960	4679.645827	4681.978534	4678.970253	4680.423441
145525	DOW	120	1787337960	53257.399604	53267.617725	53248.402998	53259.614069
145526	VIX	120	1787337960	15.327743	15.330000	15.313566	15.326725
146395	DOW	120	1787338800	53300.603243	53329.600000	53298.576074	53321.733735
146396	VIX	120	1787338800	15.298550	15.303893	15.289072	15.291607
146267	SP500	120	1787338680	7677.733933	7679.505118	7677.305161	7678.676889
146268	CRUDE	120	1787338680	86.931670	86.940943	86.908993	86.918913
146269	GOLD	120	1787338680	4680.679623	4683.100000	4680.502008	4682.409075
146270	DOW	120	1787338680	53284.903194	53308.280169	53283.278275	53301.077132
146271	VIX	120	1787338680	15.305331	15.312259	15.295838	15.299068
146142	SP500	120	1787338560	7676.010561	7678.070231	7675.010177	7677.800344
146143	CRUDE	120	1787338560	86.952439	86.974505	86.927141	86.935057
146144	GOLD	120	1787338560	4679.671460	4681.432943	4679.671460	4680.706394
146145	DOW	120	1787338560	53281.472835	53294.974270	53273.189287	53283.253505
146146	VIX	120	1787338560	15.312629	15.316068	15.303080	15.304849
146519	GOLD	120	1787338920	4682.078296	4682.466739	4680.319330	4682.466739
146520	DOW	120	1787338920	53322.751084	53340.307039	53311.922251	53313.874251
146521	VIX	120	1787338920	15.292821	15.296916	15.278455	15.279800
146644	GOLD	120	1787339040	4682.335741	4682.557666	4680.953611	4681.845365
146767	SP500	120	1787339160	7679.952231	7681.193667	7677.815603	7680.852120
146517	SP500	120	1787338920	7681.468123	7682.972956	7679.281157	7679.590348
146392	SP500	120	1787338800	7678.634879	7682.040000	7678.265663	7681.719442
146518	CRUDE	120	1787338920	87.095193	87.099176	87.049473	87.071610
146645	DOW	120	1787339040	53313.175466	53327.118469	53309.867986	53314.899290
146646	VIX	120	1787339040	15.279520	15.287265	15.263657	15.269327
146768	CRUDE	120	1787339160	87.037259	87.084890	87.030000	87.044816
146642	SP500	120	1787339040	7679.487798	7680.749136	7677.903775	7679.760959
146643	CRUDE	120	1787339040	87.070407	87.070407	87.005921	87.034941
146769	GOLD	120	1787339160	4682.011021	4682.270205	4680.523622	4681.287520
146770	DOW	120	1787339160	53315.268151	53339.557273	53311.084409	53327.462161
146771	VIX	120	1787339160	15.268048	15.282670	15.263656	15.281110
146892	SP500	120	1787339280	7681.113527	7681.530979	7678.765176	7679.671676
146893	CRUDE	120	1787339280	87.045808	87.056860	87.011827	87.025422
146894	GOLD	120	1787339280	4681.147688	4682.132154	4680.708662	4680.885997
146895	DOW	120	1787339280	53326.768571	53343.451701	53311.322757	53315.824169
146896	VIX	120	1787339280	15.282034	15.283901	15.258798	15.259445
147017	SP500	120	1787339400	7679.429691	7680.776435	7677.849904	7679.853692
147018	CRUDE	120	1787339400	87.022926	87.025674	86.947686	86.954191
147019	GOLD	120	1787339400	4680.973461	4683.531713	4680.326122	4680.326122
148393	CRUDE	120	1787340720	86.845684	86.863036	86.805455	86.810479
148394	GOLD	120	1787340720	4680.204258	4680.464381	4678.420909	4680.272211
148395	DOW	120	1787340720	53319.183438	53323.833618	53302.620756	53302.620756
148396	VIX	120	1787340720	15.255905	15.255905	15.225127	15.242146
147142	SP500	120	1787339520	7679.792579	7679.792579	7676.555461	7677.752825
147143	CRUDE	120	1787339520	86.951106	86.966469	86.832171	86.869689
147144	GOLD	120	1787339520	4680.493747	4682.252553	4679.280079	4681.116613
147145	DOW	120	1787339520	53308.924917	53323.814366	53297.378268	53322.730635
147146	VIX	120	1787339520	15.260729	15.266175	15.238806	15.243589
149017	SP500	120	1787341320	7680.058912	7681.803765	7679.562564	7681.417805
148767	SP500	120	1787341080	7681.031705	7683.124461	7680.570663	7681.421819
148642	SP500	120	1787340960	7679.491491	7681.412797	7678.993128	7680.954387
148017	SP500	120	1787340360	7678.923491	7681.069693	7677.857920	7679.956092
148018	CRUDE	120	1787340360	86.869958	86.921791	86.861999	86.902027
148019	GOLD	120	1787340360	4678.720480	4679.332671	4677.386402	4678.194474
148020	DOW	120	1787340360	53327.584221	53328.648001	53286.871702	53296.188494
148021	VIX	120	1787340360	15.290640	15.290640	15.266830	15.266830
147892	SP500	120	1787340240	7680.469859	7681.525154	7678.786792	7678.951600
147893	CRUDE	120	1787340240	86.813686	86.885276	86.794762	86.867649
147894	GOLD	120	1787340240	4680.062295	4680.844206	4678.303032	4678.803793
147895	DOW	120	1787340240	53337.944857	53350.207647	53318.439820	53326.715374
147896	VIX	120	1787340240	15.291827	15.304809	15.283672	15.291487
147517	SP500	120	1787339880	7677.363166	7680.640853	7677.201977	7678.785993
147518	CRUDE	120	1787339880	86.843791	86.891012	86.829365	86.840371
147519	GOLD	120	1787339880	4678.855899	4679.965167	4677.763826	4677.763826
147520	DOW	120	1787339880	53321.988025	53333.842213	53313.075243	53332.429557
147521	VIX	120	1787339880	15.256626	15.270726	15.256120	15.267540
147392	SP500	120	1787339760	7678.141234	7679.048600	7676.754434	7677.162959
147020	DOW	120	1787339400	53314.364274	53328.268173	53302.135580	53308.196516
147021	VIX	120	1787339400	15.260454	15.273640	15.258135	15.259536
147393	CRUDE	120	1787339760	86.836579	86.882630	86.830659	86.843840
147394	GOLD	120	1787339760	4676.866063	4679.000000	4676.817472	4678.751302
147395	DOW	120	1787339760	53308.866641	53328.223935	53302.737633	53319.947768
147396	VIX	120	1787339760	15.258217	15.270000	15.247407	15.257611
147267	SP500	120	1787339640	7677.664925	7679.376109	7677.367423	7677.960153
147268	CRUDE	120	1787339640	86.869662	86.883997	86.832949	86.838860
147269	GOLD	120	1787339640	4681.036565	4681.036565	4675.917382	4676.701094
147270	DOW	120	1787339640	53322.119976	53329.016593	53304.578035	53307.298184
147271	VIX	120	1787339640	15.242649	15.263071	15.238692	15.258274
147642	SP500	120	1787340000	7678.543486	7680.872821	7677.446737	7679.070562
147643	CRUDE	120	1787340000	86.842454	86.845503	86.787807	86.793736
147644	GOLD	120	1787340000	4677.611195	4679.183528	4677.315491	4679.131293
147645	DOW	120	1787340000	53331.630271	53339.337136	53326.112492	53326.179484
147646	VIX	120	1787340000	15.266629	15.296049	15.266629	15.289106
148643	CRUDE	120	1787340960	86.840220	86.845775	86.793191	86.801884
148267	SP500	120	1787340600	7678.945353	7681.667664	7678.945353	7680.181844
148268	CRUDE	120	1787340600	86.877455	86.890227	86.835789	86.842905
148269	GOLD	120	1787340600	4679.947340	4680.920967	4678.901289	4680.038285
148270	DOW	120	1787340600	53321.183122	53333.336117	53314.024585	53319.182331
148271	VIX	120	1787340600	15.249896	15.257643	15.245361	15.255358
148142	SP500	120	1787340480	7679.811443	7680.396135	7678.688620	7679.195269
148143	CRUDE	120	1787340480	86.904200	86.925500	86.877379	86.880450
148144	GOLD	120	1787340480	4678.208921	4680.066946	4678.208921	4680.055085
148145	DOW	120	1787340480	53297.931484	53331.734573	53291.155401	53319.734505
147767	SP500	120	1787340120	7679.262927	7680.620760	7678.425378	7680.620760
147768	CRUDE	120	1787340120	86.793200	86.835823	86.778336	86.813159
147769	GOLD	120	1787340120	4679.255228	4680.542872	4678.600000	4680.118204
147770	DOW	120	1787340120	53324.091880	53342.338585	53321.048521	53338.277791
147771	VIX	120	1787340120	15.289625	15.294148	15.284709	15.291423
148146	VIX	120	1787340480	15.267894	15.277569	15.249241	15.250681
148644	GOLD	120	1787340960	4679.939019	4680.394712	4678.258519	4679.126506
148645	DOW	120	1787340960	53303.440223	53313.964957	53301.551410	53302.758580
148646	VIX	120	1787340960	15.241038	15.245522	15.227701	15.243760
148768	CRUDE	120	1787341080	86.804073	86.819989	86.782861	86.809109
148769	GOLD	120	1787341080	4679.117427	4679.456156	4675.162590	4675.176659
148517	SP500	120	1787340840	7678.770954	7680.166488	7677.816210	7679.618860
148518	CRUDE	120	1787340840	86.809383	86.857403	86.777032	86.839082
148519	GOLD	120	1787340840	4680.431780	4680.682256	4679.011615	4679.921702
148520	DOW	120	1787340840	53301.429131	53324.290332	53297.696400	53305.535004
148392	SP500	120	1787340720	7679.995538	7680.940635	7678.597449	7679.059846
148770	DOW	120	1787341080	53302.483099	53330.132268	53302.483099	53323.900313
148771	VIX	120	1787341080	15.243575	15.243575	15.212333	15.222772
148521	VIX	120	1787340840	15.242688	15.253478	15.224844	15.241457
149018	CRUDE	120	1787341320	86.819251	86.860586	86.808501	86.855371
149019	GOLD	120	1787341320	4676.103594	4676.588300	4675.000000	4675.570886
149020	DOW	120	1787341320	53314.325851	53331.568969	53305.460135	53325.215303
149021	VIX	120	1787341320	15.194308	15.205901	15.184716	15.196682
148892	SP500	120	1787341200	7681.320893	7682.415819	7679.525661	7680.011199
148893	CRUDE	120	1787341200	86.807683	86.834791	86.774872	86.820741
148894	GOLD	120	1787341200	4675.214177	4677.087096	4674.976577	4675.931757
148895	DOW	120	1787341200	53323.489048	53329.727646	53312.016174	53312.917784
148896	VIX	120	1787341200	15.224100	15.225367	15.186596	15.193566
149142	SP500	120	1787341440	7681.274065	7685.479481	7681.274065	7684.320525
149143	CRUDE	120	1787341440	86.856363	86.924898	86.844798	86.907023
149144	GOLD	120	1787341440	4675.394851	4675.766348	4672.643160	4673.415235
149145	DOW	120	1787341440	53324.402445	53340.319482	53320.730997	53339.528151
149146	VIX	120	1787341440	15.197912	15.199021	15.173799	15.189481
149267	SP500	120	1787341560	7684.497528	7685.156554	7682.457878	7685.156554
149268	CRUDE	120	1787341560	86.909903	86.909903	86.824714	86.824714
149269	GOLD	120	1787341560	4673.380206	4674.668291	4673.273622	4674.523136
150643	CRUDE	120	1787342880	86.670266	86.681921	86.620000	86.653425
150644	GOLD	120	1787342880	4676.203484	4676.542972	4673.268534	4673.268534
150645	DOW	120	1787342880	53283.406935	53287.072733	53269.713683	53276.568726
150646	VIX	120	1787342880	15.206846	15.236825	15.206846	15.221111
149392	SP500	120	1787341680	7685.354767	7686.700636	7684.530014	7685.681526
149393	CRUDE	120	1787341680	86.821862	86.822086	86.773299	86.788498
149394	GOLD	120	1787341680	4674.696150	4675.917601	4673.397842	4674.295412
149395	DOW	120	1787341680	53350.216490	53354.984917	53336.686813	53340.339403
149396	VIX	120	1787341680	15.193212	15.193212	15.164993	15.168967
151267	SP500	120	1787343480	7674.348337	7675.145856	7673.221575	7674.024372
151017	SP500	120	1787343240	7673.715399	7675.383929	7673.378737	7674.490921
150892	SP500	120	1787343120	7674.004368	7675.308577	7673.061121	7673.903247
150267	SP500	120	1787342520	7674.013186	7675.741700	7673.510414	7673.510414
150268	CRUDE	120	1787342520	86.737511	86.790000	86.712865	86.717511
150269	GOLD	120	1787342520	4679.334628	4680.610511	4678.852353	4679.700392
150270	DOW	120	1787342520	53274.174262	53281.888176	53266.789637	53273.627333
150271	VIX	120	1787342520	15.113767	15.122272	15.072462	15.088385
150142	SP500	120	1787342400	7673.258657	7675.096493	7672.815443	7674.280050
150143	CRUDE	120	1787342400	86.783743	86.785964	86.718054	86.739196
150144	GOLD	120	1787342400	4679.652748	4680.646785	4678.454697	4679.264026
150145	DOW	120	1787342400	53283.011791	53284.475779	53268.610980	53275.060408
150146	VIX	120	1787342400	15.122016	15.125674	15.109450	15.115104
149767	SP500	120	1787342040	7678.122842	7678.669020	7673.141553	7676.256574
149768	CRUDE	120	1787342040	86.774067	86.816741	86.747753	86.809653
149769	GOLD	120	1787342040	4676.038761	4677.278764	4674.780674	4675.290597
149770	DOW	120	1787342040	53310.125576	53320.319760	53281.155551	53301.494670
149771	VIX	120	1787342040	15.119747	15.154445	15.119747	15.146575
149642	SP500	120	1787341920	7681.051439	7681.838177	7677.625138	7677.844525
149270	DOW	120	1787341560	53339.556879	53349.405419	53312.749937	53349.405419
149271	VIX	120	1787341560	15.189774	15.193906	15.170000	15.193750
149643	CRUDE	120	1787341920	86.788935	86.791573	86.737204	86.772702
149644	GOLD	120	1787341920	4676.310773	4676.682569	4674.780525	4676.129368
149645	DOW	120	1787341920	53327.868588	53328.296386	53304.696045	53311.702849
149646	VIX	120	1787341920	15.124752	15.134017	15.118007	15.119717
149517	SP500	120	1787341800	7685.517375	7685.662104	7680.586297	7681.152073
149518	CRUDE	120	1787341800	86.789611	86.802584	86.760000	86.785572
149519	GOLD	120	1787341800	4674.361299	4677.427501	4673.961425	4676.372535
149520	DOW	120	1787341800	53341.182852	53341.182852	53324.583728	53327.833073
149521	VIX	120	1787341800	15.169583	15.174592	15.115258	15.123465
149892	SP500	120	1787342160	7676.419277	7678.744469	7675.419944	7678.744469
149893	CRUDE	120	1787342160	86.809655	86.850221	86.766984	86.771685
149894	GOLD	120	1787342160	4675.107432	4676.905537	4675.107432	4676.134062
149895	DOW	120	1787342160	53302.930396	53327.365584	53302.065635	53324.988117
149896	VIX	120	1787342160	15.146691	15.158934	15.135514	15.136533
150893	CRUDE	120	1787343120	86.604733	86.638505	86.602555	86.626428
150517	SP500	120	1787342760	7674.359653	7675.279612	7673.050146	7674.164361
150518	CRUDE	120	1787342760	86.616670	86.670000	86.615172	86.669816
150519	GOLD	120	1787342760	4677.266501	4678.692749	4674.587703	4676.120831
150520	DOW	120	1787342760	53274.151659	53281.797096	53268.053121	53281.797096
150521	VIX	120	1787342760	15.134911	15.210058	15.133595	15.207969
150392	SP500	120	1787342640	7673.680683	7675.363551	7672.842641	7674.561973
150393	CRUDE	120	1787342640	86.716589	86.717407	86.618103	86.618103
150394	GOLD	120	1787342640	4679.589408	4680.474359	4676.300000	4677.231205
150395	DOW	120	1787342640	53274.185466	53285.110330	53272.731392	53273.327351
150017	SP500	120	1787342280	7678.580287	7680.699759	7673.097861	7673.097861
150018	CRUDE	120	1787342280	86.769282	86.795784	86.743342	86.786125
150019	GOLD	120	1787342280	4676.210163	4680.423913	4676.199103	4679.591320
150020	DOW	120	1787342280	53324.398393	53324.664963	53281.263172	53281.263172
150021	VIX	120	1787342280	15.135644	15.145260	15.117668	15.121733
150396	VIX	120	1787342640	15.088406	15.134036	15.088406	15.134036
150894	GOLD	120	1787343120	4673.309500	4674.919942	4671.824610	4674.835303
150895	DOW	120	1787343120	53279.429981	53285.186888	53270.351804	53277.730644
150896	VIX	120	1787343120	15.190311	15.191849	15.146059	15.161202
151018	CRUDE	120	1787343240	86.629806	86.674006	86.608733	86.663528
151019	GOLD	120	1787343240	4674.849086	4675.309326	4674.077722	4674.783106
150767	SP500	120	1787343000	7674.556557	7675.302592	7673.188417	7674.206246
150768	CRUDE	120	1787343000	86.652523	86.660998	86.592820	86.602513
150769	GOLD	120	1787343000	4673.229149	4674.802960	4672.260662	4673.348385
150770	DOW	120	1787343000	53278.026696	53287.649891	53271.496998	53278.280365
150642	SP500	120	1787342880	7674.353685	7675.468631	7673.128635	7674.722079
151020	DOW	120	1787343240	53278.691168	53283.806750	53271.177140	53277.308970
151021	VIX	120	1787343240	15.161397	15.170000	15.145947	15.148563
150771	VIX	120	1787343000	15.220620	15.230697	15.184207	15.190411
151268	CRUDE	120	1787343480	86.646746	86.682290	86.642351	86.651181
151269	GOLD	120	1787343480	4674.242553	4674.884931	4672.874645	4673.544240
151270	DOW	120	1787343480	53277.376467	53283.879385	53265.770283	53276.340964
151271	VIX	120	1787343480	15.158243	15.165114	15.148012	15.160330
151142	SP500	120	1787343360	7674.513445	7675.062627	7672.609225	7674.260386
151143	CRUDE	120	1787343360	86.660851	86.691092	86.627015	86.645923
151144	GOLD	120	1787343360	4674.707142	4675.070560	4673.810065	4674.254631
151145	DOW	120	1787343360	53276.272411	53286.439194	53267.354789	53277.619265
151146	VIX	120	1787343360	15.148357	15.160084	15.135871	15.158291
151392	SP500	120	1787343600	7674.291150	7675.271376	7673.694917	7674.148526
151393	CRUDE	120	1787343600	86.650223	86.704253	86.649094	86.677231
151394	GOLD	120	1787343600	4673.655772	4675.104511	4672.939730	4674.045373
151395	DOW	120	1787343600	53277.183652	53283.250211	53267.392512	53279.011887
151396	VIX	120	1787343600	15.159438	15.163561	15.148460	15.157946
151517	SP500	120	1787343720	7674.055008	7675.474177	7673.434517	7673.704276
151518	CRUDE	120	1787343720	86.679183	86.696754	86.644698	86.665738
151519	GOLD	120	1787343720	4674.055328	4675.019917	4673.823353	4674.229400
153137	SP500	120	1787345280	7675.129710	7675.549210	7673.362188	7674.855664
153138	CRUDE	120	1787345280	86.798485	86.816673	86.757849	86.771617
153139	GOLD	120	1787345280	4668.941957	4668.941957	4665.257021	4666.340300
153140	DOW	120	1787345280	53277.612377	53285.206747	53269.406131	53280.612112
153141	VIX	120	1787345280	15.131500	15.138710	15.122146	15.133294
151642	SP500	120	1787343840	7673.894088	7675.385942	7672.524566	7675.108362
151643	CRUDE	120	1787343840	86.667612	86.699070	86.641707	86.671248
151644	GOLD	120	1787343840	4674.167062	4675.566199	4673.944331	4674.081349
151645	DOW	120	1787343840	53277.788833	53283.483026	53271.541874	53275.998476
151646	VIX	120	1787343840	15.161481	15.172929	15.154054	15.172413
153012	SP500	120	1787345160	7675.396060	7675.643255	7673.390839	7675.022621
153013	CRUDE	120	1787345160	86.772822	86.818380	86.755160	86.798829
153014	GOLD	120	1787345160	4667.559423	4669.882174	4667.481805	4668.762695
153015	DOW	120	1787345160	53274.003142	53284.115356	53272.217614	53277.242527
152517	SP500	120	1787344680	7675.266755	7675.483026	7673.613180	7673.870940
152518	CRUDE	120	1787344680	86.872902	86.875309	86.841304	86.855818
152519	GOLD	120	1787344680	4667.876930	4669.603819	4667.841194	4668.394281
152520	DOW	120	1787344680	53272.635264	53283.135595	53266.111338	53276.665396
152521	VIX	120	1787344680	15.127470	15.136321	15.124330	15.131136
152392	SP500	120	1787344560	7674.432779	7675.762830	7672.647363	7675.277931
152393	CRUDE	120	1787344560	86.849879	86.873441	86.843112	86.872187
152394	GOLD	120	1787344560	4668.297286	4669.641782	4667.352892	4668.033878
152395	DOW	120	1787344560	53273.821846	53285.143195	53270.741180	53271.293147
152396	VIX	120	1787344560	15.127413	15.134546	15.124999	15.128144
152017	SP500	120	1787344200	7674.570628	7675.128079	7673.600138	7674.228328
152018	CRUDE	120	1787344200	86.702684	86.803816	86.702684	86.790866
152019	GOLD	120	1787344200	4669.527960	4670.760173	4669.147097	4670.219631
152020	DOW	120	1787344200	53277.817004	53283.881847	53267.232981	53273.137450
152021	VIX	120	1787344200	15.128576	15.134451	15.126264	15.130656
151892	SP500	120	1787344080	7674.182387	7675.435487	7672.838078	7674.490926
151520	DOW	120	1787343720	53279.779785	53287.783653	53270.594013	53276.883840
151521	VIX	120	1787343720	15.158683	15.164625	15.156930	15.162340
151893	CRUDE	120	1787344080	86.702146	86.721384	86.678059	86.703252
151894	GOLD	120	1787344080	4671.870796	4672.691021	4668.257675	4669.440131
151895	DOW	120	1787344080	53271.177456	53283.462857	53267.345080	53278.201710
151896	VIX	120	1787344080	15.149346	15.152116	15.128926	15.129587
151767	SP500	120	1787343960	7675.376653	7675.594683	7672.641511	7674.440907
151768	CRUDE	120	1787343960	86.671886	86.724977	86.668680	86.701663
151769	GOLD	120	1787343960	4674.246017	4674.520944	4671.602868	4671.890014
151770	DOW	120	1787343960	53276.393124	53288.854432	53268.054867	53273.210074
151771	VIX	120	1787343960	15.172198	15.176285	15.149420	15.149898
152142	SP500	120	1787344320	7674.217371	7675.393062	7672.809298	7675.331690
152143	CRUDE	120	1787344320	86.791388	86.855906	86.790915	86.822206
152144	GOLD	120	1787344320	4670.156645	4670.156645	4668.287195	4669.327686
152145	DOW	120	1787344320	53271.150007	53285.264006	53267.264588	53276.312277
152146	VIX	120	1787344320	15.130663	15.138273	15.126281	15.130303
153016	VIX	120	1787345160	15.131028	15.135209	15.127680	15.132954
152767	SP500	120	1787344920	7674.402248	7675.417783	7672.929009	7675.001342
152768	CRUDE	120	1787344920	86.796659	86.805624	86.778218	86.801731
152769	GOLD	120	1787344920	4668.737121	4669.210958	4666.993836	4668.003587
152770	DOW	120	1787344920	53272.778391	53285.428065	53266.608395	53278.818906
152771	VIX	120	1787344920	15.129237	15.134169	15.125438	15.128401
152642	SP500	120	1787344800	7673.737585	7674.992414	7673.027322	7674.545901
152643	CRUDE	120	1787344800	86.852520	86.852520	86.789612	86.794333
152644	GOLD	120	1787344800	4668.534423	4670.231212	4667.512533	4668.860345
152645	DOW	120	1787344800	53276.932148	53286.944753	53271.420023	53274.691757
152267	SP500	120	1787344440	7675.479703	7675.481823	7672.276638	7674.302348
152268	CRUDE	120	1787344440	86.820439	86.885438	86.776859	86.851460
152269	GOLD	120	1787344440	4669.311891	4669.417235	4667.401831	4668.338283
152270	DOW	120	1787344440	53274.757423	53286.294576	53266.342840	53272.394677
152271	VIX	120	1787344440	15.131540	15.134279	15.122412	15.128385
152646	VIX	120	1787344800	15.130591	15.134624	15.125416	15.129084
153263	CRUDE	120	1787345400	86.774949	86.800294	86.747338	86.769730
153264	GOLD	120	1787345400	4666.517770	4667.572552	4665.686824	4667.572552
153265	DOW	120	1787345400	53281.730718	53284.132985	53269.119640	53276.489286
152892	SP500	120	1787345040	7675.044602	7675.508204	7672.761257	7675.404869
152893	CRUDE	120	1787345040	86.804464	86.807546	86.761669	86.771051
152894	GOLD	120	1787345040	4668.013370	4669.159956	4667.265878	4667.518542
152895	DOW	120	1787345040	53277.457470	53282.547796	53270.332366	53275.707417
152896	VIX	120	1787345040	15.128155	15.134964	15.126477	15.130739
153266	VIX	120	1787345400	15.133288	15.137076	15.127507	15.131854
153388	CRUDE	120	1787345520	86.767153	86.834331	86.754621	86.834331
153512	SP500	120	1787345640	7674.850400	7675.269444	7673.056533	7674.422636
153513	CRUDE	120	1787345640	86.836750	86.848171	86.806890	86.835186
153262	SP500	120	1787345400	7674.896831	7675.771968	7673.160242	7675.033925
153389	GOLD	120	1787345520	4667.427501	4667.532885	4665.558247	4665.651476
153390	DOW	120	1787345520	53276.053963	53284.606083	53270.892651	53276.504519
153514	GOLD	120	1787345640	4665.504550	4666.597001	4664.769711	4666.259535
153387	SP500	120	1787345520	7674.814095	7675.294194	7672.504053	7674.783438
153391	VIX	120	1787345520	15.131902	15.137327	15.124619	15.134866
153515	DOW	120	1787345640	53274.623270	53286.691195	53269.513053	53281.626229
153516	VIX	120	1787345640	15.134030	15.139581	15.125764	15.125764
153637	SP500	120	1787345760	7674.155809	7675.420245	7673.139242	7674.961748
153638	CRUDE	120	1787345760	86.836511	86.837904	86.784504	86.806360
153639	GOLD	120	1787345760	4666.365239	4666.679260	4663.966593	4664.023935
153640	DOW	120	1787345760	53282.938876	53287.223461	53269.689655	53276.342396
153641	VIX	120	1787345760	15.126630	15.137092	15.125314	15.131809
153762	SP500	120	1787345880	7674.654804	7674.926584	7672.554789	7673.239217
153763	CRUDE	120	1787345880	86.803344	86.837829	86.673276	86.677618
153764	GOLD	120	1787345880	4664.118318	4665.709991	4661.400000	4663.072578
155138	CRUDE	120	1787347200	86.648538	86.653148	86.631487	86.638747
155139	GOLD	120	1787347200	4661.262043	4662.073934	4660.994803	4661.532640
155140	DOW	120	1787347200	53277.887605	53281.894271	53266.842166	53280.546847
155141	VIX	120	1787347200	15.130959	15.133729	15.126364	15.130732
153887	SP500	120	1787346000	7673.312273	7675.035470	7673.304375	7675.035470
153888	CRUDE	120	1787346000	86.675234	86.763648	86.670000	86.747896
153889	GOLD	120	1787346000	4663.165928	4665.198966	4660.910385	4662.208787
153890	DOW	120	1787346000	53276.221588	53291.169137	53272.794890	53275.434662
153891	VIX	120	1787346000	15.130698	15.136293	15.123472	15.127496
155762	SP500	120	1787347800	7674.843127	7675.659899	7673.235400	7673.695933
155512	SP500	120	1787347560	7675.141807	7676.288566	7673.367648	7674.821479
155387	SP500	120	1787347440	7674.157002	7675.006397	7673.596247	7675.002937
154762	SP500	120	1787346840	7674.360938	7675.832235	7673.605687	7675.055531
154763	CRUDE	120	1787346840	86.631831	86.649976	86.629138	86.634105
154764	GOLD	120	1787346840	4661.557011	4662.227935	4661.088350	4661.762864
154765	DOW	120	1787346840	53273.223819	53283.186338	53270.192818	53280.811625
154766	VIX	120	1787346840	15.129533	15.135817	15.122142	15.127797
154637	SP500	120	1787346720	7674.527608	7675.218458	7673.388827	7674.491568
154638	CRUDE	120	1787346720	86.636697	86.660857	86.630929	86.631625
154639	GOLD	120	1787346720	4661.770187	4662.195194	4660.663137	4661.389234
154640	DOW	120	1787346720	53274.730153	53287.361596	53269.036556	53273.409387
154641	VIX	120	1787346720	15.130285	15.132618	15.123832	15.130913
154262	SP500	120	1787346360	7675.007725	7675.315710	7673.257125	7674.858927
154263	CRUDE	120	1787346360	86.691651	86.705396	86.660927	86.664450
154264	GOLD	120	1787346360	4661.437407	4663.142732	4660.091947	4662.058089
154265	DOW	120	1787346360	53269.121428	53283.232250	53268.880324	53270.651362
154266	VIX	120	1787346360	15.129646	15.136578	15.126009	15.129226
154137	SP500	120	1787346240	7674.133931	7675.421737	7673.385106	7674.708357
153765	DOW	120	1787345880	53274.507058	53288.074705	53270.281116	53274.187311
153766	VIX	120	1787345880	15.131702	15.133943	15.123749	15.131601
154138	CRUDE	120	1787346240	86.743029	86.748033	86.678357	86.691120
154139	GOLD	120	1787346240	4662.455822	4662.890892	4661.105606	4661.360111
154140	DOW	120	1787346240	53275.972456	53279.948088	53269.038518	53270.596867
154141	VIX	120	1787346240	15.130999	15.135173	15.125493	15.130065
154012	SP500	120	1787346120	7674.787267	7675.513993	7673.727848	7674.274971
154013	CRUDE	120	1787346120	86.746375	86.752152	86.730000	86.740197
154014	GOLD	120	1787346120	4662.170920	4663.396245	4661.200704	4662.494283
154015	DOW	120	1787346120	53274.175946	53285.359461	53266.416453	53275.030127
154016	VIX	120	1787346120	15.128374	15.134803	15.124986	15.130370
154387	SP500	120	1787346480	7674.698208	7675.708725	7672.940799	7673.658862
154388	CRUDE	120	1787346480	86.666733	86.680002	86.632933	86.670605
154389	GOLD	120	1787346480	4661.918867	4662.485358	4661.018262	4661.114122
154390	DOW	120	1787346480	53271.571882	53283.010986	53267.886915	53277.176927
154391	VIX	120	1787346480	15.128158	15.133299	15.124752	15.126931
155388	CRUDE	120	1787347440	86.638555	86.657738	86.632716	86.633663
155012	SP500	120	1787347080	7674.051063	7675.208394	7673.577195	7674.202446
155013	CRUDE	120	1787347080	86.634063	86.653017	86.621067	86.645440
155014	GOLD	120	1787347080	4661.122368	4661.996678	4660.908806	4661.100684
155015	DOW	120	1787347080	53281.796482	53283.194270	53268.396956	53279.744586
155016	VIX	120	1787347080	15.126029	15.137075	15.124379	15.130486
154887	SP500	120	1787346960	7675.149154	7675.404332	7673.504039	7674.264100
154888	CRUDE	120	1787346960	86.636231	86.652675	86.625276	86.635390
154889	GOLD	120	1787346960	4661.914907	4662.106516	4660.469974	4661.129564
154890	DOW	120	1787346960	53279.371270	53281.871614	53268.341073	53280.152455
154512	SP500	120	1787346600	7673.743951	7675.569628	7673.336386	7674.437220
154513	CRUDE	120	1787346600	86.669710	86.676133	86.627615	86.635325
154514	GOLD	120	1787346600	4661.035421	4662.289741	4661.021804	4661.881538
154515	DOW	120	1787346600	53276.220608	53282.331813	53265.475587	53274.627294
154516	VIX	120	1787346600	15.126265	15.133398	15.123008	15.130066
154891	VIX	120	1787346960	15.127183	15.132385	15.125219	15.127273
155389	GOLD	120	1787347440	4661.699328	4662.228928	4660.932848	4661.461531
155390	DOW	120	1787347440	53279.584515	53282.324584	53268.170311	53277.531087
155391	VIX	120	1787347440	15.134270	15.134829	15.123636	15.132273
155513	CRUDE	120	1787347560	86.635782	86.648501	86.625584	86.635331
155514	GOLD	120	1787347560	4661.560375	4662.491306	4660.554051	4661.689146
155262	SP500	120	1787347320	7674.534414	7675.419099	7673.005480	7674.155091
155263	CRUDE	120	1787347320	86.635926	86.654135	86.627097	86.640904
155264	GOLD	120	1787347320	4661.545596	4662.034049	4660.851608	4661.745575
155265	DOW	120	1787347320	53279.607399	53288.578761	53270.612716	53278.987717
155137	SP500	120	1787347200	7674.477771	7675.461867	7673.400497	7674.472214
155515	DOW	120	1787347560	53276.431250	53283.163245	53269.974183	53274.430454
155516	VIX	120	1787347560	15.131139	15.135253	15.123995	15.130277
155266	VIX	120	1787347320	15.132005	15.135847	15.124692	15.134450
155763	CRUDE	120	1787347800	86.639590	86.661527	86.632791	86.639548
155764	GOLD	120	1787347800	4661.832794	4662.113392	4660.870743	4661.805806
155765	DOW	120	1787347800	53278.838219	53285.883772	53269.245520	53282.399793
155766	VIX	120	1787347800	15.135073	15.135410	15.124582	15.128512
155637	SP500	120	1787347680	7675.089544	7675.495622	7673.722410	7675.046698
155638	CRUDE	120	1787347680	86.637535	86.652022	86.621515	86.637278
155639	GOLD	120	1787347680	4661.662784	4662.402469	4660.666200	4661.768854
155640	DOW	120	1787347680	53275.287889	53281.229225	53268.241349	53277.120515
155641	VIX	120	1787347680	15.130744	15.135431	15.124619	15.135342
155887	SP500	120	1787347920	7673.691967	7675.524257	7673.691967	7674.176065
155888	CRUDE	120	1787347920	86.642150	86.655976	86.626514	86.634399
155889	GOLD	120	1787347920	4661.734560	4662.029403	4660.627133	4661.714360
155890	DOW	120	1787347920	53283.052329	53290.189230	53272.005040	53282.360414
155891	VIX	120	1787347920	15.129817	15.136916	15.122832	15.128116
156012	SP500	120	1787348040	7673.957230	7675.988937	7673.484929	7674.202256
156013	CRUDE	120	1787348040	86.633348	86.652328	86.625780	86.642270
156014	GOLD	120	1787348040	4661.732282	4662.173514	4660.873278	4661.820470
157388	CRUDE	120	1787349360	86.634484	86.651042	86.628521	86.628521
157389	GOLD	120	1787349360	4661.533015	4662.458863	4660.733067	4661.157911
157390	DOW	120	1787349360	53280.569968	53283.478575	53266.262570	53275.782256
157391	VIX	120	1787349360	15.130760	15.136711	15.123335	15.128633
156137	SP500	120	1787348160	7674.343858	7675.821296	7673.802257	7674.534994
156138	CRUDE	120	1787348160	86.641649	86.653591	86.628965	86.649102
156139	GOLD	120	1787348160	4661.975197	4662.013771	4660.886224	4661.983438
156140	DOW	120	1787348160	53270.666136	53282.860840	53263.527992	53276.653877
156141	VIX	120	1787348160	15.133302	15.136908	15.124762	15.128814
158012	SP500	120	1787349960	7673.921859	7675.182106	7673.568369	7674.820573
157762	SP500	120	1787349720	7674.934568	7676.039767	7673.810633	7673.921100
157637	SP500	120	1787349600	7674.714571	7675.577513	7673.199191	7675.220969
157012	SP500	120	1787349000	7674.214277	7675.446308	7673.337492	7674.858326
157013	CRUDE	120	1787349000	86.633390	86.652898	86.626190	86.646106
157014	GOLD	120	1787349000	4661.894651	4662.329729	4660.900995	4662.232266
157015	DOW	120	1787349000	53270.360087	53286.162945	53266.630034	53277.747221
157016	VIX	120	1787349000	15.126579	15.133844	15.122633	15.129565
156887	SP500	120	1787348880	7675.100197	7675.489475	7673.538249	7674.045291
156888	CRUDE	120	1787348880	86.631033	86.655699	86.620521	86.630415
156889	GOLD	120	1787348880	4662.069640	4662.073724	4661.235908	4661.784938
156890	DOW	120	1787348880	53277.992427	53283.211648	53269.622232	53270.119071
156891	VIX	120	1787348880	15.126330	15.133288	15.125704	15.127865
156512	SP500	120	1787348520	7675.293984	7675.456211	7673.478945	7675.089822
156513	CRUDE	120	1787348520	86.641992	86.652578	86.625838	86.639608
156514	GOLD	120	1787348520	4661.785103	4662.580432	4660.855893	4661.746601
156515	DOW	120	1787348520	53280.745961	53284.859702	53271.390280	53271.896011
156516	VIX	120	1787348520	15.130848	15.137299	15.128378	15.130385
156387	SP500	120	1787348400	7673.679817	7675.841693	7673.097129	7675.131219
156015	DOW	120	1787348040	53281.049043	53285.506037	53264.065146	53271.940630
156016	VIX	120	1787348040	15.128769	15.135906	15.123400	15.132636
156388	CRUDE	120	1787348400	86.641894	86.646749	86.623995	86.640627
156389	GOLD	120	1787348400	4661.507729	4662.552504	4660.701783	4661.893221
156390	DOW	120	1787348400	53281.220110	53285.144301	53274.799578	53281.750775
156391	VIX	120	1787348400	15.134546	15.138145	15.124833	15.131376
156262	SP500	120	1787348280	7674.627203	7675.621130	7673.380518	7673.959858
156263	CRUDE	120	1787348280	86.649685	86.657821	86.634607	86.640730
156264	GOLD	120	1787348280	4662.143828	4662.515151	4660.795254	4661.669282
156265	DOW	120	1787348280	53274.563468	53285.833119	53265.837239	53279.436447
156266	VIX	120	1787348280	15.128235	15.135040	15.123852	15.133313
156637	SP500	120	1787348640	7675.347303	7675.492401	7673.639552	7674.968584
156638	CRUDE	120	1787348640	86.642132	86.654113	86.624127	86.635619
156639	GOLD	120	1787348640	4661.630956	4662.600510	4660.838255	4661.817750
156640	DOW	120	1787348640	53273.157509	53285.716215	53272.647598	53280.009894
156641	VIX	120	1787348640	15.130377	15.135585	15.125076	15.127395
157638	CRUDE	120	1787349600	86.625393	86.654164	86.625393	86.641684
157262	SP500	120	1787349240	7674.070818	7675.444165	7673.400014	7674.147577
157263	CRUDE	120	1787349240	86.635296	86.647786	86.617956	86.637119
157264	GOLD	120	1787349240	4661.295443	4662.407301	4661.000043	4661.710727
157265	DOW	120	1787349240	53274.536328	53285.570686	53272.090539	53280.340629
157266	VIX	120	1787349240	15.128561	15.133992	15.124312	15.129390
157137	SP500	120	1787349120	7674.736672	7675.620595	7673.343423	7673.994861
157138	CRUDE	120	1787349120	86.647342	86.656625	86.632534	86.636986
157139	GOLD	120	1787349120	4662.278522	4662.278522	4660.523804	4661.251916
157140	DOW	120	1787349120	53275.733174	53286.111158	53271.997599	53274.588753
156762	SP500	120	1787348760	7675.005127	7675.676599	7672.434219	7675.067864
156763	CRUDE	120	1787348760	86.637720	86.650385	86.628172	86.629212
156764	GOLD	120	1787348760	4661.828987	4662.191721	4661.202333	4662.095798
156765	DOW	120	1787348760	53279.195170	53285.276665	53270.568444	53276.941252
156766	VIX	120	1787348760	15.126333	15.133917	15.125445	15.127146
157141	VIX	120	1787349120	15.128341	15.136271	15.125369	15.129498
157639	GOLD	120	1787349600	4661.614344	4662.239769	4661.225575	4661.805994
157640	DOW	120	1787349600	53273.392685	53289.428441	53268.288072	53275.271414
157641	VIX	120	1787349600	15.133787	15.135350	15.125296	15.126680
157763	CRUDE	120	1787349720	86.640733	86.652852	86.625505	86.647494
157764	GOLD	120	1787349720	4661.649732	4662.247437	4660.917562	4661.539180
157512	SP500	120	1787349480	7674.420905	7675.597302	7673.765563	7674.603677
157513	CRUDE	120	1787349480	86.629223	86.652615	86.625260	86.627024
157514	GOLD	120	1787349480	4661.288203	4662.103472	4661.057089	4661.472494
157515	DOW	120	1787349480	53276.994294	53288.025144	53269.423673	53274.485325
157387	SP500	120	1787349360	7674.034727	7675.563486	7673.827484	7674.271544
157765	DOW	120	1787349720	53276.040971	53286.003061	53268.860625	53275.849087
157766	VIX	120	1787349720	15.127264	15.135409	15.124618	15.130511
157516	VIX	120	1787349480	15.129341	15.134837	15.125027	15.133277
158013	CRUDE	120	1787349960	86.641513	86.654469	86.630978	86.632612
158014	GOLD	120	1787349960	4661.239090	4662.368343	4660.987233	4661.618913
158015	DOW	120	1787349960	53277.011227	53285.949831	53272.090310	53276.701258
158016	VIX	120	1787349960	15.128918	15.135959	15.120628	15.126512
157887	SP500	120	1787349840	7673.883662	7675.299822	7672.953367	7674.081406
157888	CRUDE	120	1787349840	86.645037	86.653556	86.623496	86.641002
157889	GOLD	120	1787349840	4661.664056	4662.400336	4660.919634	4661.422770
157890	DOW	120	1787349840	53275.451176	53283.288139	53271.842918	53277.210214
157891	VIX	120	1787349840	15.131614	15.137417	15.123258	15.128131
158137	SP500	120	1787350080	7675.059514	7675.306129	7673.441426	7673.441426
158138	CRUDE	120	1787350080	86.632787	86.650988	86.630010	86.637538
158139	GOLD	120	1787350080	4661.517448	4662.561392	4661.129594	4661.244592
158140	DOW	120	1787350080	53277.269955	53287.102090	53270.125674	53274.769409
158141	VIX	120	1787350080	15.126307	15.136473	15.125378	15.130552
158262	SP500	120	1787350200	7673.171363	7675.148208	7672.649950	7674.758201
158263	CRUDE	120	1787350200	86.635405	86.650068	86.626656	86.648938
158264	GOLD	120	1787350200	4661.189887	4662.457298	4661.127435	4661.346125
159638	CRUDE	120	1787351520	86.645004	86.650847	86.627211	86.643062
159639	GOLD	120	1787351520	4662.049092	4662.221972	4660.939707	4662.092389
159640	DOW	120	1787351520	53279.470749	53284.795698	53270.531018	53282.611694
159641	VIX	120	1787351520	15.131692	15.135506	15.124615	15.133070
158387	SP500	120	1787350320	7674.663443	7675.566868	7672.892498	7674.823368
158388	CRUDE	120	1787350320	86.647745	86.650769	86.631173	86.638110
158389	GOLD	120	1787350320	4661.287321	4662.478725	4660.990434	4661.819535
158390	DOW	120	1787350320	53275.621928	53284.024210	53271.474218	53274.639318
158391	VIX	120	1787350320	15.128630	15.137262	15.127573	15.128126
159889	GOLD	120	1787351760	4661.569982	4661.912298	4660.612698	4661.323573
159890	DOW	120	1787351760	53277.026534	53284.725207	53268.301942	53280.598042
159891	VIX	120	1787351760	15.132052	15.134677	15.122099	15.131585
159262	SP500	120	1787351160	7673.830163	7675.347249	7673.051267	7674.487322
159263	CRUDE	120	1787351160	86.625838	86.651301	86.620835	86.642942
159264	GOLD	120	1787351160	4661.348689	4662.539263	4661.074224	4661.862523
159265	DOW	120	1787351160	53275.108354	53283.017176	53273.308279	53278.606227
159266	VIX	120	1787351160	15.134094	15.135532	15.127033	15.130939
159137	SP500	120	1787351040	7674.636610	7676.032511	7673.466970	7674.011637
159138	CRUDE	120	1787351040	86.642327	86.650961	86.627454	86.627454
159139	GOLD	120	1787351040	4661.509832	4662.099146	4660.917015	4661.206110
159140	DOW	120	1787351040	53270.552942	53283.950329	53269.956785	53277.143328
159141	VIX	120	1787351040	15.132798	15.138183	15.126247	15.134322
158762	SP500	120	1787350680	7674.432987	7675.626042	7673.634295	7673.634295
158763	CRUDE	120	1787350680	86.644328	86.654045	86.624902	86.639605
158764	GOLD	120	1787350680	4661.562118	4662.353468	4660.985358	4661.311227
158765	DOW	120	1787350680	53275.551069	53289.405293	53268.548758	53274.580754
158766	VIX	120	1787350680	15.129325	15.137579	15.123092	15.129400
158637	SP500	120	1787350560	7675.128202	7675.145314	7672.781045	7674.475857
158265	DOW	120	1787350200	53276.449439	53291.686906	53269.542155	53275.263738
158266	VIX	120	1787350200	15.130821	15.134812	15.125122	15.129939
158638	CRUDE	120	1787350560	86.635104	86.647813	86.618264	86.642120
158639	GOLD	120	1787350560	4661.751128	4662.619870	4661.183214	4661.569243
158640	DOW	120	1787350560	53278.976297	53282.661211	53267.955341	53277.585350
158641	VIX	120	1787350560	15.128132	15.139808	15.124323	15.129480
158512	SP500	120	1787350440	7674.687808	7675.411664	7673.019171	7675.074990
158513	CRUDE	120	1787350440	86.635498	86.658072	86.629917	86.637983
158514	GOLD	120	1787350440	4661.705027	4662.307248	4661.055062	4661.569052
158515	DOW	120	1787350440	53276.223296	53287.904887	53270.716145	53279.362285
158516	VIX	120	1787350440	15.127911	15.132731	15.122930	15.129521
158887	SP500	120	1787350800	7673.692857	7675.473382	7672.988225	7674.706038
158888	CRUDE	120	1787350800	86.638306	86.654020	86.625326	86.638511
158889	GOLD	120	1787350800	4661.232440	4662.287842	4661.003951	4661.666327
158890	DOW	120	1787350800	53276.642558	53280.014545	53268.344633	53274.523929
158891	VIX	120	1787350800	15.129987	15.136251	15.128767	15.131703
159512	SP500	120	1787351400	7674.575533	7676.468687	7673.479240	7673.885623
159513	CRUDE	120	1787351400	86.636487	86.649346	86.623956	86.642479
159514	GOLD	120	1787351400	4661.926277	4662.949820	4661.085858	4662.058512
159515	DOW	120	1787351400	53279.384196	53282.762225	53263.418831	53277.919769
159516	VIX	120	1787351400	15.125907	15.134715	15.123669	15.131904
159387	SP500	120	1787351280	7674.520967	7675.888512	7673.246855	7674.475638
159388	CRUDE	120	1787351280	86.640912	86.653941	86.628388	86.637813
159389	GOLD	120	1787351280	4662.003832	4662.173409	4660.865891	4662.087512
159390	DOW	120	1787351280	53279.079849	53283.423639	53269.591036	53278.848052
159012	SP500	120	1787350920	7674.566184	7675.546183	7673.963635	7674.346620
159013	CRUDE	120	1787350920	86.637951	86.648873	86.627131	86.638978
159014	GOLD	120	1787350920	4661.589361	4662.357770	4661.063881	4661.663310
159015	DOW	120	1787350920	53273.989796	53281.086829	53268.540849	53268.540849
159016	VIX	120	1787350920	15.132881	15.138221	15.125581	15.133280
159391	VIX	120	1787351280	15.131822	15.135695	15.124829	15.126923
160131	VIX	120	1787352000	15.128116	15.134614	15.123342	15.131769
160251	VIX	120	1787352120	15.131088	15.134055	15.120574	15.130133
160127	SP500	120	1787352000	7673.423656	7675.251060	7673.022104	7675.011277
160007	SP500	120	1787351880	7675.104340	7675.589214	7672.789748	7673.573522
160008	CRUDE	120	1787351880	86.650609	86.650609	86.624367	86.640660
159762	SP500	120	1787351640	7673.989914	7675.276373	7673.125218	7673.830705
159763	CRUDE	120	1787351640	86.640238	86.658265	86.631894	86.643074
159764	GOLD	120	1787351640	4662.210037	4662.210037	4661.062400	4661.408598
159765	DOW	120	1787351640	53284.232646	53287.394423	53272.145497	53278.457361
159637	SP500	120	1787351520	7673.855174	7674.952516	7672.743703	7674.205656
160009	GOLD	120	1787351880	4661.441328	4662.264030	4660.700593	4661.555798
159887	SP500	120	1787351760	7673.751534	7675.239518	7672.789476	7674.879779
159888	CRUDE	120	1787351760	86.639913	86.655600	86.627897	86.647468
160010	DOW	120	1787351880	53281.452884	53283.406061	53268.101845	53280.291940
160011	VIX	120	1787351880	15.132983	15.135159	15.125757	15.128321
159766	VIX	120	1787351640	15.134200	15.136875	15.124208	15.131020
160128	CRUDE	120	1787352000	86.643638	86.651433	86.632812	86.637257
160129	GOLD	120	1787352000	4661.700332	4662.089387	4660.653291	4661.410331
160130	DOW	120	1787352000	53281.652483	53287.276702	53267.748971	53277.147717
160371	VIX	120	1787352240	15.129763	15.134862	15.124827	15.133597
160247	SP500	120	1787352120	7675.277967	7675.417813	7673.623509	7673.993661
160248	CRUDE	120	1787352120	86.633871	86.654578	86.619904	86.638521
160249	GOLD	120	1787352120	4661.349784	4662.068909	4661.157146	4661.502880
160250	DOW	120	1787352120	53277.088576	53284.083756	53271.752594	53276.908711
160489	GOLD	120	1787352360	4662.295668	4662.523196	4660.935638	4661.860895
160367	SP500	120	1787352240	7674.200792	7675.815395	7673.362873	7674.186376
160368	CRUDE	120	1787352240	86.640040	86.659105	86.630614	86.637217
160369	GOLD	120	1787352240	4661.638997	4662.150995	4661.101131	4662.150995
160370	DOW	120	1787352240	53278.913789	53282.391828	53267.561736	53277.383109
160487	SP500	120	1787352360	7673.906307	7675.626239	7673.159333	7673.921848
160488	CRUDE	120	1787352360	86.638154	86.658447	86.629550	86.643428
160608	CRUDE	120	1787352480	86.645066	86.649734	86.633156	86.635864
160609	GOLD	120	1787352480	4661.823799	4662.538823	4660.628626	4661.447996
160610	DOW	120	1787352480	53272.703951	53284.008160	53268.770618	53272.770791
160611	VIX	120	1787352480	15.134341	15.136596	15.124413	15.129935
162050	DOW	120	1787353920	53279.746665	53286.485748	53267.932955	53282.648604
162051	VIX	120	1787353920	15.130388	15.136403	15.125081	15.129950
161087	SP500	120	1787352960	7674.561920	7675.326268	7673.259645	7674.007104
160967	SP500	120	1787352840	7673.314233	7675.042802	7673.021903	7674.789697
160968	CRUDE	120	1787352840	86.642121	86.658355	86.622126	86.633023
160969	GOLD	120	1787352840	4661.763354	4662.301115	4660.577387	4661.392703
160970	DOW	120	1787352840	53276.692655	53282.728523	53265.784996	53282.728523
160971	VIX	120	1787352840	15.128162	15.135759	15.126472	15.130508
161088	CRUDE	120	1787352960	86.634261	86.648873	86.621882	86.644690
160847	SP500	120	1787352720	7675.115222	7675.924488	7673.198305	7673.466341
160848	CRUDE	120	1787352720	86.639192	86.651776	86.631303	86.641085
160849	GOLD	120	1787352720	4661.453323	4662.138105	4660.965669	4661.694479
160850	DOW	120	1787352720	53276.111706	53282.490993	53267.344260	53277.204309
160851	VIX	120	1787352720	15.131318	15.134475	15.125769	15.126910
161089	GOLD	120	1787352960	4661.514434	4662.649186	4660.853857	4662.155024
161090	DOW	120	1787352960	53284.676417	53284.676417	53272.061912	53282.903331
161091	VIX	120	1787352960	15.131198	15.137327	15.124350	15.126472
160490	DOW	120	1787352360	53275.708830	53284.736523	53267.570683	53272.963588
160491	VIX	120	1787352360	15.132882	15.135536	15.126064	15.133662
161927	SP500	120	1787353800	7674.285927	7676.268527	7673.339766	7674.175677
161928	CRUDE	120	1787353800	86.629803	86.652173	86.624286	86.628569
161929	GOLD	120	1787353800	4661.558775	4662.377664	4661.109407	4661.455261
161930	DOW	120	1787353800	53283.407778	53284.854634	53270.023840	53279.682653
161931	VIX	120	1787353800	15.130450	15.132306	15.123699	15.129435
160727	SP500	120	1787352600	7674.680531	7675.631057	7673.682514	7675.000657
160728	CRUDE	120	1787352600	86.637104	86.649435	86.626502	86.638515
160729	GOLD	120	1787352600	4661.492138	4662.074399	4661.112931	4661.339855
160730	DOW	120	1787352600	53272.320246	53288.487046	53268.717291	53274.612379
160731	VIX	120	1787352600	15.129175	15.134734	15.125717	15.132402
161687	SP500	120	1787353560	7675.250418	7675.609701	7673.374412	7674.788557
161207	SP500	120	1787353080	7674.184753	7676.581925	7673.663434	7674.133816
161208	CRUDE	120	1787353080	86.646223	86.653941	86.628623	86.641036
161209	GOLD	120	1787353080	4661.989642	4662.457478	4660.851450	4662.193033
161210	DOW	120	1787353080	53281.910482	53286.783148	53265.147490	53273.674911
161211	VIX	120	1787353080	15.126731	15.134387	15.121852	15.130300
161688	CRUDE	120	1787353560	86.647444	86.651919	86.627644	86.646228
161689	GOLD	120	1787353560	4661.518957	4661.956093	4660.731297	4661.854542
161690	DOW	120	1787353560	53276.869347	53286.216495	53268.523753	53277.973913
161691	VIX	120	1787353560	15.122284	15.133053	15.119953	15.126717
161447	SP500	120	1787353320	7674.599569	7675.105562	7673.099223	7673.820393
161448	CRUDE	120	1787353320	86.640361	86.655769	86.624605	86.641632
160607	SP500	120	1787352480	7674.036795	7675.463550	7673.229280	7674.893760
161449	GOLD	120	1787353320	4661.830589	4662.791043	4660.729799	4661.205582
161450	DOW	120	1787353320	53279.100940	53286.605684	53271.715825	53280.296187
161451	VIX	120	1787353320	15.124093	15.134623	15.124093	15.127498
161327	SP500	120	1787353200	7674.286241	7675.841501	7673.694944	7674.353786
161328	CRUDE	120	1787353200	86.643999	86.646087	86.627951	86.637063
161329	GOLD	120	1787353200	4662.075173	4662.207716	4660.830574	4661.696234
161330	DOW	120	1787353200	53273.824024	53281.126113	53270.864983	53278.311047
161331	VIX	120	1787353200	15.128812	15.136139	15.123957	15.125142
161567	SP500	120	1787353440	7673.675183	7675.481643	7673.421537	7674.984262
161568	CRUDE	120	1787353440	86.638576	86.649902	86.621842	86.644244
161569	GOLD	120	1787353440	4661.063945	4662.213267	4660.929997	4661.595925
161570	DOW	120	1787353440	53278.838076	53286.506047	53267.894758	53277.946658
161571	VIX	120	1787353440	15.127868	15.134202	15.122665	15.122665
162176	VIX	120	1787354040	15.128880	15.135616	15.121916	15.130317
161807	SP500	120	1787353680	7674.943743	7675.519420	7673.445672	7674.224549
161808	CRUDE	120	1787353680	86.643339	86.648768	86.624981	86.630168
161809	GOLD	120	1787353680	4661.865148	4662.256259	4661.103769	4661.575129
161810	DOW	120	1787353680	53276.157885	53285.505620	53270.769256	53282.383401
161811	VIX	120	1787353680	15.126891	15.135962	15.123430	15.129983
162301	VIX	120	1787354160	15.129003	15.136035	15.125941	15.129892
162172	SP500	120	1787354040	7674.115005	7675.666303	7673.850724	7674.181387
162173	CRUDE	120	1787354040	86.643621	86.649914	86.628555	86.646836
162174	GOLD	120	1787354040	4661.197000	4662.111739	4660.811470	4662.078298
162175	DOW	120	1787354040	53280.543662	53282.622541	53270.924975	53275.640770
162047	SP500	120	1787353920	7674.376435	7675.387661	7673.211479	7674.301093
162048	CRUDE	120	1787353920	86.626463	86.658513	86.622490	86.640978
162049	GOLD	120	1787353920	4661.299952	4662.173364	4660.774945	4661.295645
162297	SP500	120	1787354160	7674.181428	7675.828739	7673.431748	7673.601827
162298	CRUDE	120	1787354160	86.648100	86.649167	86.628849	86.633893
162299	GOLD	120	1787354160	4662.084113	4662.084113	4660.937337	4661.482340
162300	DOW	120	1787354160	53277.025200	53281.955051	53265.141195	53274.200147
162422	SP500	120	1787354280	7673.698416	7674.933625	7673.698030	7674.142388
162423	CRUDE	120	1787354280	86.636435	86.655603	86.628545	86.640385
162424	GOLD	120	1787354280	4661.542903	4662.281073	4660.945848	4661.565223
162425	DOW	120	1787354280	53275.774037	53289.422754	53268.403689	53278.987826
162426	VIX	120	1787354280	15.129214	15.133361	15.125076	15.130885
162547	SP500	120	1787354400	7674.123117	7675.240719	7673.413308	7674.174867
162548	CRUDE	120	1787354400	86.637144	86.650392	86.630203	86.633093
162549	GOLD	120	1787354400	4661.532952	4662.199051	4661.045491	4661.649859
162550	DOW	120	1787354400	53278.455433	53281.862970	53271.063039	53277.357449
162551	VIX	120	1787354400	15.130450	15.137829	15.126258	15.126258
162672	SP500	120	1787354520	7674.047448	7675.748265	7673.595528	7674.490014
162673	CRUDE	120	1787354520	86.632859	86.652768	86.628277	86.646550
162674	GOLD	120	1787354520	4661.735226	4662.247918	4660.985365	4661.885298
164048	CRUDE	120	1787355840	86.643739	86.650218	86.621630	86.648436
164049	GOLD	120	1787355840	4661.919617	4662.782909	4661.214759	4662.303199
164050	DOW	120	1787355840	53273.750991	53283.520645	53269.869273	53269.869273
164051	VIX	120	1787355840	15.127322	15.133895	15.124174	15.131257
162797	SP500	120	1787354640	7674.307668	7675.407747	7673.200151	7674.152491
162798	CRUDE	120	1787354640	86.647387	86.651860	86.627808	86.633748
162799	GOLD	120	1787354640	4661.992172	4662.446318	4661.120932	4661.413690
162800	DOW	120	1787354640	53280.200398	53282.114877	53270.258752	53277.558426
162801	VIX	120	1787354640	15.128421	15.135126	15.124746	15.131688
164672	SP500	120	1787356440	7674.279241	7675.869463	7673.828486	7674.864667
164422	SP500	120	1787356200	7674.005478	7675.318028	7673.313241	7673.953162
164297	SP500	120	1787356080	7674.339895	7675.540918	7673.078904	7673.732455
163672	SP500	120	1787355480	7674.204406	7675.165565	7673.898054	7675.165565
163673	CRUDE	120	1787355480	86.634995	86.664735	86.629106	86.638354
163674	GOLD	120	1787355480	4662.028396	4662.399606	4660.414322	4661.387613
163675	DOW	120	1787355480	53272.648486	53287.777699	53268.665315	53276.804783
163676	VIX	120	1787355480	15.130975	15.133749	15.123568	15.128733
163547	SP500	120	1787355360	7673.886910	7675.253813	7673.663942	7673.925421
163548	CRUDE	120	1787355360	86.646741	86.650256	86.627655	86.636835
163549	GOLD	120	1787355360	4661.651138	4662.422631	4661.309168	4661.882614
163550	DOW	120	1787355360	53275.647369	53279.972262	53267.606779	53273.324726
163551	VIX	120	1787355360	15.133086	15.136940	15.122332	15.130756
163172	SP500	120	1787355000	7674.637177	7675.934924	7673.502067	7674.369719
163173	CRUDE	120	1787355000	86.642356	86.650769	86.624376	86.650769
163174	GOLD	120	1787355000	4661.175056	4662.447193	4660.853268	4661.803148
163175	DOW	120	1787355000	53272.033300	53282.418911	53270.406785	53273.575983
163176	VIX	120	1787355000	15.129939	15.135554	15.124884	15.133473
163047	SP500	120	1787354880	7674.902416	7675.376327	7673.345200	7674.643836
162675	DOW	120	1787354520	53275.261771	53287.231589	53267.965740	53278.547977
162676	VIX	120	1787354520	15.126538	15.138040	15.122326	15.128337
163048	CRUDE	120	1787354880	86.635713	86.654548	86.628932	86.642975
163049	GOLD	120	1787354880	4661.912017	4662.111983	4660.734392	4661.183789
163050	DOW	120	1787354880	53276.282913	53283.439614	53269.646787	53273.566147
163051	VIX	120	1787354880	15.125560	15.135853	15.123478	15.129320
163297	SP500	120	1787355120	7674.324713	7675.694574	7673.289948	7674.289694
163298	CRUDE	120	1787355120	86.650141	86.659168	86.630107	86.633198
163299	GOLD	120	1787355120	4661.913409	4662.314622	4660.664841	4661.620346
162922	SP500	120	1787354760	7674.419494	7675.306596	7673.512384	7674.602939
162923	CRUDE	120	1787354760	86.635950	86.648304	86.621942	86.632909
162924	GOLD	120	1787354760	4661.438238	4662.216909	4660.920996	4662.063871
162925	DOW	120	1787354760	53279.037446	53281.197297	53268.463916	53277.477753
162926	VIX	120	1787354760	15.130505	15.137900	15.124086	15.126406
163300	DOW	120	1787355120	53272.562734	53282.272838	53272.562734	53273.007770
163301	VIX	120	1787355120	15.134057	15.139575	15.123400	15.128919
164298	CRUDE	120	1787356080	86.633492	86.652012	86.632319	86.633188
163922	SP500	120	1787355720	7674.516074	7674.986764	7673.021120	7674.342532
163923	CRUDE	120	1787355720	86.626867	86.651572	86.625394	86.643724
163924	GOLD	120	1787355720	4661.018719	4662.167074	4660.691626	4662.093806
163925	DOW	120	1787355720	53273.177422	53282.274734	53267.234798	53274.976356
163926	VIX	120	1787355720	15.128415	15.132875	15.122962	15.126123
163797	SP500	120	1787355600	7675.008480	7675.612328	7673.058523	7674.230691
163422	SP500	120	1787355240	7674.164123	7675.721097	7672.403716	7674.108084
163423	CRUDE	120	1787355240	86.635949	86.662348	86.627228	86.650080
163424	GOLD	120	1787355240	4661.630482	4662.193659	4660.856580	4661.624137
163425	DOW	120	1787355240	53271.506843	53282.617964	53270.953809	53273.614528
163426	VIX	120	1787355240	15.128733	15.135502	15.127373	15.132041
163798	CRUDE	120	1787355600	86.640393	86.656923	86.628598	86.629331
163799	GOLD	120	1787355600	4661.364048	4662.036296	4660.496085	4660.914834
163800	DOW	120	1787355600	53275.828214	53289.247350	53267.041298	53275.187028
163801	VIX	120	1787355600	15.128635	15.137059	15.127544	15.128292
164299	GOLD	120	1787356080	4661.284631	4662.075409	4661.162826	4661.476549
164300	DOW	120	1787356080	53277.027565	53286.627191	53266.161408	53279.408783
164301	VIX	120	1787356080	15.130382	15.136039	15.126663	15.129920
164423	CRUDE	120	1787356200	86.633693	86.650000	86.627192	86.638380
164424	GOLD	120	1787356200	4661.340491	4662.134131	4661.081702	4661.424923
164172	SP500	120	1787355960	7674.310582	7675.054651	7672.954553	7674.551630
164173	CRUDE	120	1787355960	86.647322	86.656088	86.623393	86.635623
164174	GOLD	120	1787355960	4662.330847	4662.502727	4660.831540	4661.339952
164175	DOW	120	1787355960	53269.535615	53282.688124	53269.249060	53276.335424
164047	SP500	120	1787355840	7674.524740	7675.951224	7673.320656	7674.371283
164425	DOW	120	1787356200	53281.445333	53282.591192	53271.067052	53274.773916
164426	VIX	120	1787356200	15.129991	15.137656	15.124482	15.129944
164176	VIX	120	1787355960	15.130756	15.133572	15.123822	15.130347
164673	CRUDE	120	1787356440	86.646111	86.654289	86.626194	86.639860
164674	GOLD	120	1787356440	4661.430564	4662.144566	4660.783650	4661.723739
164675	DOW	120	1787356440	53271.418011	53287.713738	53269.010095	53281.976716
164676	VIX	120	1787356440	15.131626	15.135717	15.126503	15.130969
164547	SP500	120	1787356320	7673.809556	7675.606339	7673.472196	7674.098068
164548	CRUDE	120	1787356320	86.635573	86.662005	86.629070	86.647199
164549	GOLD	120	1787356320	4661.302160	4662.029440	4660.694620	4661.491920
164550	DOW	120	1787356320	53275.863133	53285.488434	53269.431612	53271.280304
164551	VIX	120	1787356320	15.129198	15.136272	15.124579	15.132527
164797	SP500	120	1787356560	7674.625906	7675.535470	7673.359198	7674.400526
164798	CRUDE	120	1787356560	86.638636	86.666248	86.630888	86.643765
164799	GOLD	120	1787356560	4661.909127	4662.162807	4661.129104	4661.885274
164800	DOW	120	1787356560	53282.355561	53284.171430	53271.879528	53277.881535
164801	VIX	120	1787356560	15.129610	15.136457	15.123318	15.129988
164922	SP500	120	1787356680	7674.224383	7675.503154	7673.407043	7673.935927
164923	CRUDE	120	1787356680	86.642339	86.654325	86.627032	86.645212
164924	GOLD	120	1787356680	4661.803980	4662.328226	4661.239080	4661.640391
166657	SP500	120	1787358360	7674.103751	7675.201538	7673.022623	7674.164666
166658	CRUDE	120	1787358360	86.631316	86.655420	86.628733	86.641504
166659	GOLD	120	1787358360	4661.627149	4662.355166	4660.814683	4661.595208
166660	DOW	120	1787358360	53279.434665	53286.671952	53268.178846	53276.106058
166661	VIX	120	1787358360	15.135898	15.136068	15.125471	15.126460
166417	SP500	120	1787358120	7674.182491	7675.968998	7673.314356	7673.893508
165047	SP500	120	1787356800	7673.910407	7675.315080	7673.737896	7675.080102
165048	CRUDE	120	1787356800	86.647816	86.658649	86.624635	86.636957
165049	GOLD	120	1787356800	4661.651471	4662.427886	4661.054048	4661.473205
165050	DOW	120	1787356800	53278.724739	53283.043537	53266.966188	53276.553432
165051	VIX	120	1787356800	15.125555	15.136169	15.121961	15.126805
166418	CRUDE	120	1787358120	86.645922	86.649965	86.628051	86.643565
166419	GOLD	120	1787358120	4661.517559	4662.060531	4660.859711	4661.727845
166420	DOW	120	1787358120	53272.792321	53280.977230	53265.861551	53276.673214
166421	VIX	120	1787358120	15.132259	15.134882	15.123038	15.132180
165922	SP500	120	1787357640	7674.660540	7675.294427	7673.379048	7674.273246
165923	CRUDE	120	1787357640	86.639523	86.649660	86.627347	86.640942
165924	GOLD	120	1787357640	4661.613136	4661.873869	4660.826194	4661.558808
165925	DOW	120	1787357640	53270.526362	53286.536681	53267.833965	53273.499812
165926	VIX	120	1787357640	15.125550	15.136031	15.124572	15.133338
165797	SP500	120	1787357520	7675.129292	7675.426858	7673.140044	7674.950113
165798	CRUDE	120	1787357520	86.643138	86.654545	86.629028	86.641415
165799	GOLD	120	1787357520	4661.809868	4662.151065	4660.940094	4661.636976
165800	DOW	120	1787357520	53275.602684	53282.754755	53269.611986	53269.611986
165801	VIX	120	1787357520	15.129447	15.135031	15.124456	15.126660
165422	SP500	120	1787357160	7674.684529	7675.294682	7673.710569	7674.079933
165423	CRUDE	120	1787357160	86.625564	86.668285	86.624938	86.648044
165424	GOLD	120	1787357160	4661.523502	4662.231305	4660.943320	4661.665450
165425	DOW	120	1787357160	53275.855718	53284.368252	53265.058083	53272.587618
165426	VIX	120	1787357160	15.133283	15.135538	15.122775	15.127184
165297	SP500	120	1787357040	7673.632287	7675.905817	7673.025987	7674.977814
164925	DOW	120	1787356680	53279.343051	53285.443383	53267.063796	53278.219391
164926	VIX	120	1787356680	15.129553	15.134365	15.125000	15.125547
165298	CRUDE	120	1787357040	86.648983	86.649546	86.624682	86.624682
165299	GOLD	120	1787357040	4662.179915	4662.389462	4661.265771	4661.393055
165300	DOW	120	1787357040	53274.437362	53286.937298	53267.131374	53276.964485
165301	VIX	120	1787357040	15.127537	15.134193	15.123320	15.133516
165172	SP500	120	1787356920	7674.857037	7675.455105	7672.888260	7673.809348
165173	CRUDE	120	1787356920	86.639417	86.647727	86.625752	86.646228
165174	GOLD	120	1787356920	4661.491412	4662.347632	4661.146787	4662.114901
165175	DOW	120	1787356920	53274.911743	53285.203833	53267.679493	53276.408015
165176	VIX	120	1787356920	15.127513	15.135777	15.125593	15.126621
165547	SP500	120	1787357280	7674.260980	7675.514750	7673.527747	7674.358194
165548	CRUDE	120	1787357280	86.646246	86.654013	86.625270	86.632694
165549	GOLD	120	1787357280	4661.758525	4662.055793	4661.047644	4661.258013
165550	DOW	120	1787357280	53272.507439	53283.202107	53270.748923	53275.282861
165551	VIX	120	1787357280	15.127277	15.137732	15.124863	15.128177
166172	SP500	120	1787357880	7673.654033	7674.813428	7673.023534	7674.520898
166173	CRUDE	120	1787357880	86.621072	86.657019	86.617934	86.636435
166174	GOLD	120	1787357880	4661.929712	4662.461064	4661.049391	4661.637805
166175	DOW	120	1787357880	53274.201155	53282.686174	53266.092923	53277.502422
166176	VIX	120	1787357880	15.130373	15.132769	15.126754	15.131203
166047	SP500	120	1787357760	7674.204988	7676.228100	7673.049322	7673.855832
166048	CRUDE	120	1787357760	86.643211	86.649943	86.621877	86.621877
166049	GOLD	120	1787357760	4661.730236	4662.231326	4661.156665	4661.984288
166050	DOW	120	1787357760	53271.852339	53284.581823	53270.248364	53276.006294
165672	SP500	120	1787357400	7674.223760	7675.414004	7672.737316	7674.851372
165673	CRUDE	120	1787357400	86.632852	86.654417	86.629572	86.642087
165674	GOLD	120	1787357400	4661.152714	4662.212102	4661.005238	4661.691200
165675	DOW	120	1787357400	53276.733847	53288.528103	53269.377372	53274.036449
165676	VIX	120	1787357400	15.128898	15.134296	15.127801	15.128870
166051	VIX	120	1787357760	15.134510	15.134510	15.126580	15.131136
166537	SP500	120	1787358240	7673.853185	7675.442863	7673.722435	7674.326148
166538	CRUDE	120	1787358240	86.646686	86.653220	86.629561	86.631815
166539	GOLD	120	1787358240	4661.652301	4662.445443	4660.909833	4661.779575
166297	SP500	120	1787358000	7674.429903	7675.151413	7672.890521	7674.446373
166298	CRUDE	120	1787358000	86.634320	86.656648	86.627858	86.643101
166299	GOLD	120	1787358000	4661.501424	4662.278604	4661.134553	4661.548430
166300	DOW	120	1787358000	53276.913592	53285.289293	53267.857249	53273.729233
166301	VIX	120	1787358000	15.130258	15.136144	15.125870	15.130864
166901	VIX	120	1787358600	15.133745	15.139464	15.126954	15.130990
167021	VIX	120	1787358720	15.129685	15.138529	15.123594	15.127492
166777	SP500	120	1787358480	7674.088178	7675.476479	7673.040574	7674.425623
166540	DOW	120	1787358240	53275.604886	53288.454235	53271.402287	53279.220988
166541	VIX	120	1787358240	15.133452	15.134484	15.125163	15.134483
166778	CRUDE	120	1787358480	86.640425	86.655312	86.628786	86.640201
166779	GOLD	120	1787358480	4661.773192	4662.256801	4660.776391	4661.352961
166780	DOW	120	1787358480	53275.799136	53289.453516	53270.860405	53278.537092
166781	VIX	120	1787358480	15.127889	15.134488	15.125096	15.132661
166897	SP500	120	1787358600	7674.215690	7675.471476	7673.238574	7674.302392
166898	CRUDE	120	1787358600	86.640076	86.654978	86.627465	86.632282
166899	GOLD	120	1787358600	4661.326886	4662.006537	4660.921676	4661.913573
166900	DOW	120	1787358600	53279.179616	53283.510171	53266.149200	53275.637429
167139	GOLD	120	1787358840	4661.502172	4662.756279	4661.105950	4661.105950
167017	SP500	120	1787358720	7674.382619	7675.151258	7672.922814	7674.978999
167018	CRUDE	120	1787358720	86.633555	86.646434	86.622526	86.640960
167019	GOLD	120	1787358720	4661.851724	4662.316402	4660.894659	4661.548429
167020	DOW	120	1787358720	53275.990375	53283.421763	53270.312666	53276.953508
167137	SP500	120	1787358840	7675.009027	7675.561689	7673.779304	7674.076384
167138	CRUDE	120	1787358840	86.642786	86.653860	86.630722	86.640952
167258	CRUDE	120	1787358960	86.644379	86.657768	86.631565	86.649550
167259	GOLD	120	1787358960	4661.018064	4662.413833	4660.356273	4661.304857
167260	DOW	120	1787358960	53275.631928	53278.952143	53267.810384	53276.978759
167261	VIX	120	1787358960	15.128041	15.134533	15.123284	15.123284
168827	SP500	120	1787360520	7673.972372	7675.851591	7672.718370	7674.861230
168702	SP500	120	1787360400	7674.132624	7675.526206	7673.438307	7674.248992
168703	CRUDE	120	1787360400	86.637853	86.649360	86.624124	86.635474
168704	GOLD	120	1787360400	4661.272726	4662.088752	4660.509583	4660.932076
167737	SP500	120	1787359440	7674.176349	7675.264679	7673.253577	7674.756070
167617	SP500	120	1787359320	7674.156160	7675.717321	7672.776552	7674.083860
167618	CRUDE	120	1787359320	86.646013	86.649993	86.629100	86.641496
167619	GOLD	120	1787359320	4661.524509	4662.394497	4660.858160	4661.967263
167620	DOW	120	1787359320	53278.634815	53282.608624	53267.136227	53281.067257
167621	VIX	120	1787359320	15.129981	15.136460	15.123613	15.131585
167738	CRUDE	120	1787359440	86.640717	86.653987	86.625228	86.627929
167497	SP500	120	1787359200	7674.482362	7675.218203	7673.787128	7673.929026
167498	CRUDE	120	1787359200	86.651939	86.654796	86.630000	86.646573
167499	GOLD	120	1787359200	4661.539944	4662.797035	4661.150325	4661.503908
167500	DOW	120	1787359200	53277.096440	53284.375616	53272.422290	53278.209357
167501	VIX	120	1787359200	15.124504	15.134328	15.120426	15.130428
167739	GOLD	120	1787359440	4661.932650	4662.281794	4660.659059	4661.587760
167740	DOW	120	1787359440	53278.956663	53279.830979	53263.985264	53271.759099
167741	VIX	120	1787359440	15.131588	15.134797	15.126849	15.129468
167140	DOW	120	1787358840	53278.981182	53281.459041	53272.120343	53277.323888
167141	VIX	120	1787358840	15.126095	15.136198	15.119104	15.129198
168705	DOW	120	1787360400	53275.220190	53281.228483	53269.243093	53273.125789
168706	VIX	120	1787360400	15.132907	15.134779	15.124758	15.129627
167377	SP500	120	1787359080	7674.559181	7675.449461	7673.265285	7674.290335
167378	CRUDE	120	1787359080	86.646222	86.656080	86.624428	86.649872
167379	GOLD	120	1787359080	4661.344433	4661.958370	4660.706244	4661.660675
167380	DOW	120	1787359080	53278.167909	53285.946229	53268.448078	53277.587994
167381	VIX	120	1787359080	15.121796	15.134394	15.120061	15.123765
168577	SP500	120	1787360280	7674.700348	7676.067212	7673.046463	7673.899169
168578	CRUDE	120	1787360280	86.638979	86.650675	86.630191	86.637958
168579	GOLD	120	1787360280	4661.397038	4662.439309	4660.981725	4661.377530
168337	SP500	120	1787360040	7674.914206	7675.320664	7673.731838	7674.028954
167857	SP500	120	1787359560	7674.696180	7675.574975	7673.486558	7673.486558
167858	CRUDE	120	1787359560	86.628148	86.650939	86.623722	86.634318
167859	GOLD	120	1787359560	4661.600376	4662.401018	4660.770739	4662.005934
167860	DOW	120	1787359560	53273.440220	53284.139141	53268.053922	53270.375765
167861	VIX	120	1787359560	15.128577	15.136533	15.125123	15.131021
168338	CRUDE	120	1787360040	86.637854	86.645978	86.625649	86.640273
168339	GOLD	120	1787360040	4661.732527	4661.862780	4660.778912	4661.584806
168340	DOW	120	1787360040	53279.980830	53286.081852	53269.829614	53278.921492
168341	VIX	120	1787360040	15.131002	15.134714	15.122899	15.125722
168097	SP500	120	1787359800	7674.726862	7675.852546	7673.293567	7674.777074
168098	CRUDE	120	1787359800	86.644241	86.654558	86.628700	86.639195
167257	SP500	120	1787358960	7673.802285	7675.159898	7673.274819	7674.437105
168099	GOLD	120	1787359800	4661.441724	4662.161487	4660.905760	4661.328965
168100	DOW	120	1787359800	53275.054673	53286.470912	53268.773348	53278.985902
168101	VIX	120	1787359800	15.129196	15.136639	15.122432	15.129276
167977	SP500	120	1787359680	7673.415908	7675.778333	7672.964122	7674.503554
167978	CRUDE	120	1787359680	86.637743	86.661717	86.630641	86.642157
167979	GOLD	120	1787359680	4662.130732	4662.130732	4660.974895	4661.568301
167980	DOW	120	1787359680	53269.275332	53284.185322	53262.906635	53273.252731
167981	VIX	120	1787359680	15.130327	15.135149	15.122478	15.130566
168580	DOW	120	1787360280	53275.746537	53287.870344	53270.114147	53277.053364
168581	VIX	120	1787360280	15.132041	15.136099	15.124380	15.132006
168217	SP500	120	1787359920	7674.943896	7675.546359	7672.523823	7674.835245
168218	CRUDE	120	1787359920	86.637539	86.652211	86.620067	86.638815
168219	GOLD	120	1787359920	4661.357567	4662.123752	4661.037566	4661.897169
168220	DOW	120	1787359920	53278.163857	53283.916607	53270.822951	53277.937894
168221	VIX	120	1787359920	15.128273	15.138298	15.124210	15.129622
168828	CRUDE	120	1787360520	86.634033	86.651724	86.621779	86.641949
168829	GOLD	120	1787360520	4660.886262	4662.335991	4660.409243	4661.611185
168830	DOW	120	1787360520	53273.130474	53287.341315	53270.542723	53276.312520
168457	SP500	120	1787360160	7673.931609	7675.440895	7673.175697	7674.934427
168458	CRUDE	120	1787360160	86.642770	86.653836	86.628542	86.640135
168459	GOLD	120	1787360160	4661.739598	4662.519396	4660.898272	4661.473939
168460	DOW	120	1787360160	53277.409958	53284.237679	53270.838482	53276.155297
168461	VIX	120	1787360160	15.125906	15.134380	15.122303	15.131751
168831	VIX	120	1787360520	15.129443	15.134868	15.121937	15.134868
169077	SP500	120	1787360760	7674.138901	7675.535707	7673.951749	7674.320979
169078	CRUDE	120	1787360760	86.640652	86.656151	86.629180	86.641429
169079	GOLD	120	1787360760	4661.482597	4662.209416	4661.110107	4661.621959
169080	DOW	120	1787360760	53276.999722	53280.362103	53264.903769	53271.598211
169081	VIX	120	1787360760	15.130452	15.135761	15.122817	15.132722
168952	SP500	120	1787360640	7674.731869	7675.505955	7673.601695	7674.235412
168953	CRUDE	120	1787360640	86.641740	86.654974	86.635041	86.638653
168954	GOLD	120	1787360640	4661.470945	4662.122041	4660.598697	4661.632665
168955	DOW	120	1787360640	53275.088597	53286.340414	53270.380740	53275.489012
168956	VIX	120	1787360640	15.134529	15.134529	15.121562	15.131086
169202	SP500	120	1787360880	7674.193409	7675.644808	7673.586374	7673.995695
169203	CRUDE	120	1787360880	86.644356	86.649410	86.626862	86.637020
169204	GOLD	120	1787360880	4661.653356	4662.211130	4661.098343	4661.906847
169205	DOW	120	1787360880	53271.936560	53285.235397	53270.112770	53278.562172
169206	VIX	120	1787360880	15.133937	15.136510	15.125261	15.127784
169327	SP500	120	1787361000	7674.151550	7675.178757	7673.879728	7674.014837
169328	CRUDE	120	1787361000	86.637871	86.651151	86.626141	86.627662
169329	GOLD	120	1787361000	4661.832219	4662.271137	4660.849637	4661.648976
170703	CRUDE	120	1787362320	86.651668	86.651903	86.624395	86.636892
170704	GOLD	120	1787362320	4661.218245	4662.265710	4660.923420	4661.384243
170705	DOW	120	1787362320	53274.821791	53283.924026	53268.897989	53279.129269
170706	VIX	120	1787362320	15.134748	15.136353	15.126731	15.131771
169452	SP500	120	1787361120	7673.891679	7675.282113	7673.249103	7675.282113
169453	CRUDE	120	1787361120	86.627294	86.654946	86.625413	86.640208
169454	GOLD	120	1787361120	4661.538735	4662.168232	4661.122420	4661.293810
169455	DOW	120	1787361120	53275.178308	53287.684956	53266.536976	53281.138352
169456	VIX	120	1787361120	15.123517	15.133760	15.123125	15.131891
171080	DOW	120	1787362680	53279.048463	53284.308462	53272.415766	53279.992358
171081	VIX	120	1787362680	15.128164	15.134354	15.123046	15.128986
170952	SP500	120	1787362560	7673.937597	7675.403939	7673.124468	7673.888356
170327	SP500	120	1787361960	7675.177053	7675.692877	7673.646641	7674.358380
170328	CRUDE	120	1787361960	86.629053	86.651858	86.619497	86.634826
170329	GOLD	120	1787361960	4661.779070	4662.256326	4661.096608	4661.626880
170330	DOW	120	1787361960	53273.022576	53286.347420	53265.584203	53279.075396
170331	VIX	120	1787361960	15.131645	15.135546	15.123763	15.127522
170202	SP500	120	1787361840	7673.834870	7675.819756	7673.215501	7675.132221
170203	CRUDE	120	1787361840	86.639515	86.653277	86.624208	86.630412
170204	GOLD	120	1787361840	4661.469051	4661.915061	4660.906060	4661.760780
170205	DOW	120	1787361840	53280.113605	53290.048898	53267.108295	53273.053952
170206	VIX	120	1787361840	15.130480	15.132764	15.125166	15.132352
169827	SP500	120	1787361480	7674.042482	7675.849897	7673.646929	7675.849897
169828	CRUDE	120	1787361480	86.632332	86.648005	86.625362	86.630751
169829	GOLD	120	1787361480	4662.205818	4662.350415	4661.013953	4661.220366
169830	DOW	120	1787361480	53271.385997	53288.591641	53267.210570	53273.501435
169831	VIX	120	1787361480	15.130259	15.134421	15.119354	15.129926
169702	SP500	120	1787361360	7674.637633	7675.242655	7673.554590	7674.137365
169330	DOW	120	1787361000	53280.279830	53287.275428	53269.452756	53274.784722
169331	VIX	120	1787361000	15.127850	15.138067	15.124269	15.124269
169703	CRUDE	120	1787361360	86.632631	86.654634	86.626292	86.635079
169704	GOLD	120	1787361360	4661.471467	4662.357994	4660.987153	4662.071902
169705	DOW	120	1787361360	53275.550047	53286.708709	53268.862803	53272.612309
169706	VIX	120	1787361360	15.125912	15.132963	15.123883	15.131565
169952	SP500	120	1787361600	7675.964324	7675.964324	7672.943424	7674.781053
169577	SP500	120	1787361240	7674.989831	7675.385737	7673.433894	7674.422873
169578	CRUDE	120	1787361240	86.639792	86.647577	86.627010	86.633086
169579	GOLD	120	1787361240	4661.148988	4662.712266	4660.801360	4661.332845
169580	DOW	120	1787361240	53279.988632	53284.610737	53271.809341	53274.306706
169581	VIX	120	1787361240	15.130657	15.137742	15.121319	15.127200
169953	CRUDE	120	1787361600	86.629326	86.650444	86.619663	86.641916
169954	GOLD	120	1787361600	4661.035557	4662.376910	4660.851426	4661.739623
169955	DOW	120	1787361600	53274.437530	53286.201509	53269.387577	53276.682936
169956	VIX	120	1787361600	15.128900	15.134223	15.124171	15.133991
170953	CRUDE	120	1787362560	86.634119	86.648747	86.626979	86.641320
170577	SP500	120	1787362200	7673.613103	7675.272020	7673.270646	7673.546985
170578	CRUDE	120	1787362200	86.640521	86.650723	86.625824	86.650723
170579	GOLD	120	1787362200	4661.729393	4662.079255	4660.944825	4661.237878
170580	DOW	120	1787362200	53273.203955	53283.981678	53261.068500	53273.255637
170581	VIX	120	1787362200	15.126362	15.135200	15.124249	15.133802
170452	SP500	120	1787362080	7674.608957	7675.479436	7673.074143	7673.769583
170453	CRUDE	120	1787362080	86.632240	86.654697	86.626285	86.641238
170454	GOLD	120	1787362080	4661.765652	4662.184487	4660.758816	4661.657202
170077	SP500	120	1787361720	7674.910189	7675.671741	7673.613940	7674.119967
170078	CRUDE	120	1787361720	86.638741	86.645426	86.628195	86.641947
170079	GOLD	120	1787361720	4661.876013	4662.290321	4661.043278	4661.625408
170080	DOW	120	1787361720	53278.006474	53286.851099	53267.589174	53280.461021
170081	VIX	120	1787361720	15.132513	15.137829	15.126932	15.129462
170455	DOW	120	1787362080	53278.437707	53285.876163	53268.147811	53273.938059
170456	VIX	120	1787362080	15.128139	15.134384	15.122759	15.127355
170954	GOLD	120	1787362560	4661.908659	4662.570160	4660.737895	4661.568365
170955	DOW	120	1787362560	53273.688377	53286.845048	53271.192530	53276.966651
170956	VIX	120	1787362560	15.128794	15.136788	15.124464	15.129266
170827	SP500	120	1787362440	7674.342774	7675.213967	7673.153820	7673.791687
170828	CRUDE	120	1787362440	86.634817	86.645506	86.625447	86.635400
170829	GOLD	120	1787362440	4661.247659	4662.275635	4661.035104	4661.722617
170830	DOW	120	1787362440	53278.854243	53284.205236	53270.899256	53273.487954
170702	SP500	120	1787362320	7673.312687	7675.840387	7672.949742	7674.644441
171199	GOLD	120	1787362800	4661.295462	4662.128122	4660.674997	4661.564459
170831	VIX	120	1787362440	15.133205	15.134904	15.125971	15.128324
171321	VIX	120	1787362920	15.126899	15.137384	15.123546	15.132803
171200	DOW	120	1787362800	53281.475870	53288.039412	53271.371193	53275.283436
171077	SP500	120	1787362680	7674.113631	7675.680412	7673.353972	7674.535595
171441	VIX	120	1787363040	15.133786	15.135899	15.124443	15.133428
171317	SP500	120	1787362920	7673.488675	7675.514917	7672.849358	7674.170788
171197	SP500	120	1787362800	7674.792923	7675.211256	7672.390561	7673.315432
171078	CRUDE	120	1787362680	86.642695	86.646968	86.626124	86.633818
171079	GOLD	120	1787362680	4661.633451	4662.049291	4660.973948	4661.164950
171201	VIX	120	1787362800	15.130203	15.137133	15.123819	15.128069
171198	CRUDE	120	1787362800	86.633811	86.648084	86.622298	86.637956
171318	CRUDE	120	1787362920	86.638971	86.655352	86.622310	86.635983
171319	GOLD	120	1787362920	4661.582311	4662.559177	4660.652394	4661.703556
171320	DOW	120	1787362920	53274.106477	53283.982529	53269.342295	53273.809488
171559	GOLD	120	1787363160	4661.521366	4662.235351	4661.164119	4661.935394
171437	SP500	120	1787363040	7674.236965	7675.562998	7672.968230	7674.139526
171438	CRUDE	120	1787363040	86.637884	86.645937	86.626227	86.626737
171439	GOLD	120	1787363040	4661.749145	4662.215818	4660.956284	4661.658806
171440	DOW	120	1787363040	53274.264033	53286.375731	53271.276889	53278.407342
171557	SP500	120	1787363160	7674.353015	7675.280957	7673.676481	7674.253389
171558	CRUDE	120	1787363160	86.625261	86.654907	86.625261	86.648148
171678	CRUDE	120	1787363280	86.646248	86.653476	86.631685	86.636626
171679	GOLD	120	1787363280	4662.063691	4662.403274	4660.791566	4662.022704
171680	DOW	120	1787363280	53279.402491	53285.424537	53269.765758	53283.543006
171681	VIX	120	1787363280	15.129362	15.134172	15.121647	15.131057
173022	SP500	120	1787364600	7674.979043	7675.596620	7673.243808	7674.338528
173023	CRUDE	120	1787364600	86.647136	86.658104	86.630200	86.636348
172647	SP500	120	1787364240	7673.623155	7675.702641	7673.011803	7674.588606
172648	CRUDE	120	1787364240	86.634548	86.649507	86.627252	86.633421
172649	GOLD	120	1787364240	4661.866152	4662.237949	4660.652505	4661.993287
172157	SP500	120	1787363760	7674.088433	7675.317996	7673.050187	7674.038639
172037	SP500	120	1787363640	7674.482513	7675.621817	7673.574322	7674.165153
172038	CRUDE	120	1787363640	86.649743	86.651783	86.628090	86.641879
172039	GOLD	120	1787363640	4661.142168	4661.951637	4660.823626	4661.710922
172040	DOW	120	1787363640	53277.941974	53284.203148	53263.344033	53274.846724
172041	VIX	120	1787363640	15.135511	15.135821	15.126516	15.131718
172158	CRUDE	120	1787363760	86.645078	86.658323	86.632825	86.634946
171917	SP500	120	1787363520	7673.596968	7675.386648	7673.013972	7674.397062
171918	CRUDE	120	1787363520	86.638869	86.659348	86.627733	86.650460
171919	GOLD	120	1787363520	4661.403856	4662.172528	4660.901332	4661.198384
171920	DOW	120	1787363520	53276.850067	53286.754986	53268.934347	53276.768462
171921	VIX	120	1787363520	15.126117	15.136453	15.122027	15.134911
172159	GOLD	120	1787363760	4661.852506	4662.115936	4661.340684	4661.554264
172160	DOW	120	1787363760	53273.115041	53285.011947	53270.588167	53277.354539
172161	VIX	120	1787363760	15.132516	15.134896	15.127014	15.128520
171560	DOW	120	1787363160	53280.312007	53286.198744	53272.885855	53278.421387
171561	VIX	120	1787363160	15.131993	15.135216	15.125675	15.129203
172650	DOW	120	1787364240	53274.509257	53285.373942	53269.832417	53274.155187
172651	VIX	120	1787364240	15.128235	15.135995	15.125255	15.127358
171797	SP500	120	1787363400	7673.380561	7675.458576	7673.343110	7673.693848
171798	CRUDE	120	1787363400	86.637119	86.652856	86.626244	86.636019
171799	GOLD	120	1787363400	4661.895673	4662.125935	4660.779431	4661.482834
171800	DOW	120	1787363400	53282.680267	53288.072307	53269.556961	53274.996985
171801	VIX	120	1787363400	15.131270	15.135470	15.125369	15.126140
173024	GOLD	120	1787364600	4661.046805	4662.075918	4660.634090	4661.441497
173025	DOW	120	1787364600	53268.598273	53283.772520	53264.998365	53264.998365
172277	SP500	120	1787363880	7674.282410	7675.372300	7673.337048	7674.725305
172278	CRUDE	120	1787363880	86.631681	86.654562	86.625514	86.636416
172279	GOLD	120	1787363880	4661.380880	4661.998885	4661.182275	4661.522879
172280	DOW	120	1787363880	53279.331718	53286.506585	53269.132212	53277.245629
172281	VIX	120	1787363880	15.127014	15.136541	15.127014	15.129832
173026	VIX	120	1787364600	15.131608	15.132544	15.125595	15.130011
172897	SP500	120	1787364480	7673.419608	7675.773550	7672.862855	7675.063630
172898	CRUDE	120	1787364480	86.632106	86.661195	86.628089	86.645398
172899	GOLD	120	1787364480	4662.208924	4662.610385	4660.668580	4660.922058
172900	DOW	120	1787364480	53278.802237	53284.068020	53267.627543	53267.627543
172901	VIX	120	1787364480	15.129918	15.133510	15.123355	15.130599
171677	SP500	120	1787363280	7674.168265	7675.178399	7673.205991	7673.478983
172522	SP500	120	1787364120	7674.035054	7675.352554	7673.005016	7673.884958
172523	CRUDE	120	1787364120	86.634560	86.649383	86.621880	86.637691
172524	GOLD	120	1787364120	4661.984608	4662.109271	4660.938040	4661.694457
172525	DOW	120	1787364120	53281.378931	53284.894378	53267.296705	53272.726333
172526	VIX	120	1787364120	15.126568	15.133893	15.125196	15.128980
172397	SP500	120	1787364000	7674.680950	7675.120915	7672.903880	7674.009682
172398	CRUDE	120	1787364000	86.634318	86.648492	86.620848	86.636826
172399	GOLD	120	1787364000	4661.382493	4662.086883	4661.136801	4661.806962
172400	DOW	120	1787364000	53278.862199	53283.150936	53270.998030	53281.319157
172401	VIX	120	1787364000	15.129186	15.137338	15.125645	15.125645
173522	SP500	120	1787365080	7674.443652	7675.288385	7673.337922	7674.413820
173523	CRUDE	120	1787365080	86.632182	86.648255	86.626733	86.645511
173524	GOLD	120	1787365080	4661.466098	4662.262486	4660.759020	4661.284878
173525	DOW	120	1787365080	53271.881753	53284.695006	53265.086412	53274.447091
173272	SP500	120	1787364840	7673.808188	7675.848605	7673.324178	7675.220070
172772	SP500	120	1787364360	7674.303533	7675.336257	7673.460513	7673.460513
173273	CRUDE	120	1787364840	86.640131	86.655603	86.628211	86.651849
173274	GOLD	120	1787364840	4660.945292	4662.195354	4660.790557	4661.438821
173147	SP500	120	1787364720	7674.578254	7675.425351	7673.295395	7673.950558
173148	CRUDE	120	1787364720	86.633319	86.653309	86.627682	86.640574
173149	GOLD	120	1787364720	4661.506381	4662.157162	4660.489457	4660.871189
172773	CRUDE	120	1787364360	86.630771	86.656271	86.629417	86.633006
172774	GOLD	120	1787364360	4661.876532	4662.182361	4661.085688	4662.182361
172775	DOW	120	1787364360	53272.196317	53282.060210	53268.953178	53277.807944
172776	VIX	120	1787364360	15.127885	15.133436	15.124468	15.130528
173275	DOW	120	1787364840	53282.747013	53286.244537	53269.872546	53285.622043
173276	VIX	120	1787364840	15.132597	15.134529	15.125808	15.129713
173526	VIX	120	1787365080	15.131933	15.137443	15.125834	15.132557
173397	SP500	120	1787364960	7675.192371	7676.014964	7672.642502	7674.176277
173150	DOW	120	1787364720	53265.880992	53283.750909	53265.880992	53281.570465
173151	VIX	120	1787364720	15.130531	15.135023	15.124806	15.132934
173398	CRUDE	120	1787364960	86.650455	86.660474	86.623962	86.632077
173399	GOLD	120	1787364960	4661.276551	4661.990748	4660.872774	4661.469683
173400	DOW	120	1787364960	53284.761020	53288.646911	53271.205027	53272.864289
173401	VIX	120	1787364960	15.130303	15.136748	15.124285	15.132741
173647	SP500	120	1787365200	7674.119981	7675.221872	7672.929353	7673.913330
173648	CRUDE	120	1787365200	86.648430	86.654180	86.623146	86.639923
173649	GOLD	120	1787365200	4661.344628	4662.475749	4660.823921	4661.732775
173650	DOW	120	1787365200	53273.853654	53283.808635	53268.883798	53274.434125
173651	VIX	120	1787365200	15.132445	15.135049	15.122423	15.131587
173772	SP500	120	1787365320	7673.608563	7676.227725	7673.388839	7674.959200
173773	CRUDE	120	1787365320	86.636971	86.652834	86.623658	86.643714
173774	GOLD	120	1787365320	4661.918242	4662.331027	4661.179361	4662.056747
175149	GOLD	120	1787366640	4661.164415	4662.190998	4660.989095	4661.656326
175150	DOW	120	1787366640	53273.488054	53285.581838	53267.437224	53277.560229
175151	VIX	120	1787366640	15.130807	15.136238	15.124384	15.125427
173897	SP500	120	1787365440	7674.935597	7675.616607	7673.399224	7674.478219
173898	CRUDE	120	1787365440	86.646343	86.648479	86.626697	86.645502
173899	GOLD	120	1787365440	4661.915786	4662.013197	4660.940559	4661.810014
173900	DOW	120	1787365440	53273.165425	53284.630869	53270.020157	53279.304984
173901	VIX	120	1787365440	15.129879	15.134843	15.125039	15.130083
175525	DOW	120	1787367000	53278.349317	53280.022305	53269.224817	53273.834904
175526	VIX	120	1787367000	15.131946	15.138695	15.123689	15.127098
175397	SP500	120	1787366880	7673.970621	7675.470980	7673.105758	7674.205158
175398	CRUDE	120	1787366880	86.641813	86.650826	86.620206	86.635585
174772	SP500	120	1787366280	7673.593452	7675.452333	7673.022889	7674.490725
174773	CRUDE	120	1787366280	86.646548	86.655375	86.611485	86.645078
174774	GOLD	120	1787366280	4661.269718	4662.379711	4660.894527	4661.197088
174775	DOW	120	1787366280	53278.925352	53282.328157	53265.239069	53280.320534
174776	VIX	120	1787366280	15.127013	15.136409	15.123705	15.129458
174647	SP500	120	1787366160	7675.093000	7675.844530	7673.449101	7673.589312
174648	CRUDE	120	1787366160	86.643488	86.648988	86.630441	86.648988
174649	GOLD	120	1787366160	4661.934719	4662.032981	4661.109858	4661.368117
174650	DOW	120	1787366160	53274.727105	53284.696685	53269.420926	53280.428794
174651	VIX	120	1787366160	15.126667	15.137238	15.125757	15.127608
174272	SP500	120	1787365800	7674.003226	7675.246109	7673.344790	7673.458236
174273	CRUDE	120	1787365800	86.631125	86.653483	86.625718	86.626702
174274	GOLD	120	1787365800	4661.258637	4662.140508	4661.020473	4661.687261
174275	DOW	120	1787365800	53273.728461	53284.931340	53267.768952	53284.931340
174276	VIX	120	1787365800	15.126897	15.134905	15.125861	15.133588
174147	SP500	120	1787365680	7674.840236	7675.392681	7673.196389	7673.991227
173775	DOW	120	1787365320	53272.557866	53282.038296	53268.291382	53274.581600
173776	VIX	120	1787365320	15.130654	15.136773	15.124510	15.130081
174148	CRUDE	120	1787365680	86.638435	86.652387	86.633268	86.633520
174149	GOLD	120	1787365680	4661.362651	4662.142374	4660.922589	4661.186731
174150	DOW	120	1787365680	53268.510689	53289.066377	53267.207725	53273.792648
174151	VIX	120	1787365680	15.131220	15.135804	15.124383	15.127455
174022	SP500	120	1787365560	7674.751019	7676.792186	7673.281890	7674.678716
174023	CRUDE	120	1787365560	86.647577	86.654707	86.630574	86.635457
174024	GOLD	120	1787365560	4661.647977	4662.421633	4660.834345	4661.267338
174025	DOW	120	1787365560	53279.905683	53285.109945	53266.355156	53270.091681
174026	VIX	120	1787365560	15.131091	15.134831	15.126392	15.130300
174397	SP500	120	1787365920	7673.235376	7676.269879	7673.062611	7673.356080
174398	CRUDE	120	1787365920	86.626132	86.654679	86.620512	86.648950
174399	GOLD	120	1787365920	4661.867196	4662.601831	4660.969541	4661.496175
174400	DOW	120	1787365920	53286.434752	53286.434752	53270.164273	53281.218381
174401	VIX	120	1787365920	15.133679	15.134655	15.124681	15.126246
175022	SP500	120	1787366520	7674.573682	7675.448618	7673.480880	7674.239712
175023	CRUDE	120	1787366520	86.640968	86.645586	86.623603	86.639585
175024	GOLD	120	1787366520	4661.432063	4662.386117	4661.099237	4661.142239
175025	DOW	120	1787366520	53282.474058	53286.660323	53266.092485	53273.287426
175026	VIX	120	1787366520	15.134530	15.136059	15.122451	15.131512
174897	SP500	120	1787366400	7674.366822	7675.550825	7673.086423	7674.724871
174898	CRUDE	120	1787366400	86.643252	86.652174	86.623139	86.642361
174899	GOLD	120	1787366400	4661.301845	4662.098361	4660.649922	4661.258352
174900	DOW	120	1787366400	53279.896578	53284.860830	53267.195929	53283.150268
174901	VIX	120	1787366400	15.129000	15.135147	15.125791	15.135147
174522	SP500	120	1787366040	7673.473383	7674.875099	7673.387241	7674.875099
174523	CRUDE	120	1787366040	86.649649	86.652335	86.633008	86.640329
174524	GOLD	120	1787366040	4661.481451	4662.147378	4660.647492	4661.855116
174525	DOW	120	1787366040	53279.807784	53283.266802	53265.188511	53274.347613
174526	VIX	120	1787366040	15.127508	15.134193	15.125833	15.125833
175399	GOLD	120	1787366880	4661.331359	4662.171578	4661.081231	4661.437182
175400	DOW	120	1787366880	53277.470280	53286.905818	53267.082355	53277.232161
175401	VIX	120	1787366880	15.131322	15.134234	15.126053	15.132556
175272	SP500	120	1787366760	7674.457812	7675.010014	7673.326381	7674.217021
175273	CRUDE	120	1787366760	86.649959	86.657806	86.627578	86.642865
175274	GOLD	120	1787366760	4661.592783	4662.311015	4660.960353	4661.506564
175275	DOW	120	1787366760	53278.523874	53282.860993	53268.899047	53276.116002
175276	VIX	120	1787366760	15.125663	15.134583	15.124176	15.130726
175147	SP500	120	1787366640	7674.274513	7675.203819	7672.573896	7674.197657
175148	CRUDE	120	1787366640	86.638241	86.650918	86.622736	86.648450
175644	GOLD	120	1787367120	4661.497968	4662.371149	4661.114312	4661.515524
175766	VIX	120	1787367240	15.133477	15.135281	15.123004	15.132009
175645	DOW	120	1787367120	53272.822731	53283.314333	53269.864965	53279.069683
175522	SP500	120	1787367000	7674.164758	7675.511654	7673.375071	7673.991003
175886	VIX	120	1787367360	15.130613	15.133702	15.125044	15.133589
175762	SP500	120	1787367240	7673.935504	7675.352629	7673.007827	7674.073197
175642	SP500	120	1787367120	7673.941515	7676.059292	7673.397654	7673.697496
175523	CRUDE	120	1787367000	86.636405	86.648452	86.627302	86.638259
175524	GOLD	120	1787367000	4661.594743	4662.577511	4661.067436	4661.398068
175646	VIX	120	1787367120	15.125597	15.136684	15.123404	15.133518
175643	CRUDE	120	1787367120	86.635393	86.662003	86.627940	86.635676
175763	CRUDE	120	1787367240	86.634379	86.656277	86.633298	86.635558
175764	GOLD	120	1787367240	4661.458048	4662.174185	4660.885424	4661.898621
175765	DOW	120	1787367240	53277.137829	53282.648756	53271.127339	53272.133206
176004	GOLD	120	1787367480	4661.795266	4662.514410	4660.675193	4661.675773
175882	SP500	120	1787367360	7674.097069	7675.688210	7673.125304	7674.274867
175883	CRUDE	120	1787367360	86.633784	86.658895	86.630683	86.644407
175884	GOLD	120	1787367360	4661.795251	4662.193857	4660.950029	4661.733462
175885	DOW	120	1787367360	53272.854214	53283.492387	53267.327371	53273.846078
176002	SP500	120	1787367480	7674.307290	7675.730820	7673.380162	7674.215862
176003	CRUDE	120	1787367480	86.643679	86.648855	86.625581	86.643180
176005	DOW	120	1787367480	53273.787178	53284.430507	53271.190886	53274.432539
176006	VIX	120	1787367480	15.132197	15.136216	15.126884	15.131896
\.


--
-- Data for Name: inquiries; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.inquiries (id, user_id, title, content, reply, status, replied_by, replied_at, is_reply_read, created_at) FROM stdin;
1	26b03465-d7a9-49f5-97ce-6ad3714637d3	입금계좌 안내 요청	입금계좌 정보를 안내해 주세요.	테스트	answered	f4a21243-eb2a-498e-bd25-46b1f19640cf	2026-08-20 10:51:43.052	t	2026-08-20 10:42:49.304569
2	26b03465-d7a9-49f5-97ce-6ad3714637d3	테스트	테스트	dz	answered	f4a21243-eb2a-498e-bd25-46b1f19640cf	2026-08-21 04:01:35.793	t	2026-08-20 10:51:54.719492
3	cd3fff13-0da2-4623-a768-4540617e6494	입금계좌 안내 요청	입금계좌 정보를 안내해 주세요.	입금계좌 안내드립니다	answered	f4a21243-eb2a-498e-bd25-46b1f19640cf	2026-08-21 04:12:35.201	t	2026-08-21 04:12:14.526751
4	cd3fff13-0da2-4623-a768-4540617e6494	입금계좌 안내 요청	입금계좌 정보를 안내해 주세요.	ㅇㄴㅁ	answered	f4a21243-eb2a-498e-bd25-46b1f19640cf	2026-08-21 04:14:56.288	t	2026-08-21 04:14:47.602184
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
93	26b03465-d7a9-49f5-97ce-6ad3714637d3	demo	146.70.201.161	Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:153.0) Gecko/20100101 Firefox/153.0	2026-08-20 10:42:06.020271
94	26b03465-d7a9-49f5-97ce-6ad3714637d3	demo	146.70.201.161	Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:153.0) Gecko/20100101 Firefox/153.0	2026-08-21 03:46:31.982828
95	26b03465-d7a9-49f5-97ce-6ad3714637d3	demo	223.119.20.250	Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/151.0.0.0 Mobile Safari/537.36	2026-08-21 03:55:24.973191
96	f4a21243-eb2a-498e-bd25-46b1f19640cf	qwer1234	103.125.146.66	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36	2026-08-21 03:59:50.935622
97	f4a21243-eb2a-498e-bd25-46b1f19640cf	qwer1234	103.125.146.66	Mozilla/5.0 (Linux; Android 15; Pixel 9) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Mobile Safari/537.36	2026-08-21 04:00:10.176533
98	cd3fff13-0da2-4623-a768-4540617e6494	gof	103.125.146.66	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36	2026-08-21 04:04:49.96538
99	822cd4ee-b7c0-4cb9-8926-78bba6617512	oj8401	37.120.210.156	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/151.0.0.0 Safari/537.36	2026-08-21 04:07:16.252005
100	e4ae177e-7eea-4760-bb1a-b68dcb200f6d	seocho	103.125.146.66	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36	2026-08-21 04:08:30.472475
101	cd3fff13-0da2-4623-a768-4540617e6494	gof	103.125.146.66	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36	2026-08-21 04:12:03.348182
102	cd3fff13-0da2-4623-a768-4540617e6494	gof	37.120.210.158	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/151.0.0.0 Safari/537.36	2026-08-21 04:13:52.443567
103	7a64e864-b6b6-49aa-ad5d-f2803eff2dc2	dh9328	37.120.210.156	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/151.0.0.0 Safari/537.36	2026-08-21 04:14:40.749825
104	822cd4ee-b7c0-4cb9-8926-78bba6617512	oj8401	37.120.210.156	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/151.0.0.0 Safari/537.36	2026-08-21 04:19:37.406158
105	cd3fff13-0da2-4623-a768-4540617e6494	gof	103.125.146.66	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36	2026-08-21 04:23:15.626413
106	cd3fff13-0da2-4623-a768-4540617e6494	gof	103.125.146.66	Mozilla/5.0 (Linux; Android 15; Pixel 9) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Mobile Safari/537.36	2026-08-21 04:27:20.559701
107	cd3fff13-0da2-4623-a768-4540617e6494	gof	106.101.79.233	Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Mobile Safari/537.36	2026-08-21 04:29:21.293912
108	cd3fff13-0da2-4623-a768-4540617e6494	gof	103.125.146.66	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36	2026-08-21 04:30:11.871391
109	29b99888-f00a-4feb-a906-5b420bba427d	01062923388	110.15.3.106	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/116.0.0.0 Safari/537.36	2026-08-21 04:35:06.387822
110	cd3fff13-0da2-4623-a768-4540617e6494	gof	37.120.210.156	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/151.0.0.0 Safari/537.36	2026-08-21 05:09:34.710119
112	f4a21243-eb2a-498e-bd25-46b1f19640cf	qwer1234	37.120.210.156	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/151.0.0.0 Safari/537.36	2026-08-21 06:19:37.290333
113	cd3fff13-0da2-4623-a768-4540617e6494	gof	37.120.210.156	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/151.0.0.0 Safari/537.36	2026-08-21 06:52:49.376483
114	2330abc5-6fda-4147-8e70-354243d137f8	안경규	182.230.111.34	Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) SamsungBrowser/30.0 Chrome/143.0.0.0 Mobile Safari/537.36	2026-08-21 06:53:05.069439
115	2330abc5-6fda-4147-8e70-354243d137f8	안경규	37.120.210.156	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/151.0.0.0 Safari/537.36	2026-08-21 07:19:16.420857
116	f4a21243-eb2a-498e-bd25-46b1f19640cf	qwer1234	175.223.31.166	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36	2026-08-21 08:13:25.72395
117	23e74316-76b4-4431-aa8f-db1226a2bb39	ch25252525	110.15.3.106	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/116.0.0.0 Safari/537.36	2026-08-21 08:19:07.515941
119	81a69081-3d28-4cbd-9b72-1f7164ee70b2	applemilk01 	220.70.5.181	Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) SamsungBrowser/30.0 Chrome/143.0.0.0 Mobile Safari/537.36	2026-08-21 08:46:43.470008
120	cd3fff13-0da2-4623-a768-4540617e6494	gof	37.120.210.156	Mozilla/5.0 (Linux; Android 15; Pixel 9) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/151.0.0.0 Mobile Safari/537.36	2026-08-21 08:48:30.806746
121	f5ec3e2c-87d9-40e3-829e-8e1448495880	김창하	61.40.143.198	Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Mobile Safari/537.36	2026-08-21 09:15:55.572927
122	cd3fff13-0da2-4623-a768-4540617e6494	gof	37.120.210.156	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/151.0.0.0 Safari/537.36	2026-08-21 09:17:54.498805
123	cd3fff13-0da2-4623-a768-4540617e6494	gof	175.223.31.166	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36	2026-08-21 09:41:54.934172
124	23e74316-76b4-4431-aa8f-db1226a2bb39	ch25252525	110.15.3.106	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/116.0.0.0 Safari/537.36	2026-08-21 11:25:51.768477
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
1	f4a21243-eb2a-498e-bd25-46b1f19640cf	26b03465-d7a9-49f5-97ce-6ad3714637d3	테스트	테스트	t	2026-08-20 10:50:29.860177	f
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
270	SP500	120	403	display_up	2026-08-21	2026-08-21 04:24:46.681072
271	SP500	120	426	display_up	2026-08-21	2026-08-21 05:11:55.601744
272	SP500	120	481	display_up	2026-08-21	2026-08-21 07:00:49.915215
273	SP500	120	482	display_down	2026-08-21	2026-08-21 07:02:37.36634
274	SP500	120	483	display_down	2026-08-21	2026-08-21 07:04:57.2097
275	SP500	120	484	display_down	2026-08-21	2026-08-21 07:06:28.979926
276	SP500	120	485	display_up	2026-08-21	2026-08-21 07:08:54.508006
277	SP500	120	536	display_up	2026-08-21	2026-08-21 08:50:29.383174
278	SP500	120	537	display_up	2026-08-21	2026-08-21 08:53:52.643931
279	SP500	120	538	display_up	2026-08-21	2026-08-21 08:55:44.549793
280	SP500	120	539	display_down	2026-08-21	2026-08-21 08:56:43.964835
281	SP500	120	540	display_up	2026-08-21	2026-08-21 08:59:13.548265
282	SP500	120	552	display_up	2026-08-21	2026-08-21 09:22:39.014847
283	SP500	120	553	display_up	2026-08-21	2026-08-21 09:25:29.092547
284	SP500	120	554	display_up	2026-08-21	2026-08-21 09:26:33.026963
285	SP500	120	556	display_down	2026-08-21	2026-08-21 09:30:46.898013
286	SP500	120	557	display_up	2026-08-21	2026-08-21 09:32:18.4004
287	SP500	120	558	display_down	2026-08-21	2026-08-21 09:34:28.529943
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
telegram_bot_token		2026-08-20 10:45:24.79
telegram_notification_chat_id		2026-08-20 10:45:24.797
\.


--
-- Data for Name: transaction_requests; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.transaction_requests (id, user_id, type, amount, status, bank_name, account_holder, account_number, sender_name, admin_note, processed_by, processed_at, created_at) FROM stdin;
76	26b03465-d7a9-49f5-97ce-6ad3714637d3	withdrawal	100000	approved	\N	\N	\N	\N	\N	f4a21243-eb2a-498e-bd25-46b1f19640cf	2026-08-21 04:01:26.633	2026-08-20 10:48:13.483113
77	cd3fff13-0da2-4623-a768-4540617e6494	deposit	1000000	approved	\N	\N	\N	gof	\N	f4a21243-eb2a-498e-bd25-46b1f19640cf	2026-08-21 04:14:59.888	2026-08-21 04:14:40.662714
78	2330abc5-6fda-4147-8e70-354243d137f8	withdrawal	70000	approved	\N	\N	\N	\N	\N	f4a21243-eb2a-498e-bd25-46b1f19640cf	2026-08-21 07:26:08.774	2026-08-21 07:19:34.690929
79	81a69081-3d28-4cbd-9b72-1f7164ee70b2	withdrawal	50000	approved	\N	\N	\N	\N	\N	f4a21243-eb2a-498e-bd25-46b1f19640cf	2026-08-21 09:11:43.292	2026-08-21 09:07:32.401379
80	f5ec3e2c-87d9-40e3-829e-8e1448495880	withdrawal	50000	approved	\N	\N	\N	\N	\N	f4a21243-eb2a-498e-bd25-46b1f19640cf	2026-08-21 09:43:36.638	2026-08-21 09:40:30.635805
74	26b03465-d7a9-49f5-97ce-6ad3714637d3	withdrawal	100000	approved	\N	\N	\N	\N	\N	f4a21243-eb2a-498e-bd25-46b1f19640cf	2026-08-20 10:43:23.984	2026-08-20 10:43:17.393413
\.


--
-- Data for Name: user_sessions; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.user_sessions (sid, sess, expire) FROM stdin;
0F4bLNLb5m_a4sTrbsRGZTzfEM9COTt5	{"cookie":{"originalMaxAge":604800000,"expires":"2026-08-28T04:30:16.881Z","secure":true,"httpOnly":true,"path":"/","sameSite":"none"},"userId":"cd3fff13-0da2-4623-a768-4540617e6494","adminUserId":"f4a21243-eb2a-498e-bd25-46b1f19640cf"}	2026-08-28 05:37:31
jg571ffnWgjTzGUt3mOVUqPa-N3boGmc	{"cookie":{"originalMaxAge":604800000,"expires":"2026-08-28T05:26:20.665Z","secure":true,"httpOnly":true,"path":"/","sameSite":"none"},"adminUserId":"f4a21243-eb2a-498e-bd25-46b1f19640cf"}	2026-08-28 05:38:18
l14Cu0o5g1dbfHtTBNH2VFJ0fINUtc5c	{"cookie":{"originalMaxAge":604800000,"expires":"2026-08-28T08:19:07.519Z","secure":true,"httpOnly":true,"path":"/","sameSite":"none"},"userId":"23e74316-76b4-4431-aa8f-db1226a2bb39"}	2026-08-28 11:33:03
Li8UdAv0C3Es2EH7BKp4O7WXhdQiaxMz	{"cookie":{"originalMaxAge":604800000,"expires":"2026-08-28T09:17:54.502Z","secure":true,"httpOnly":true,"path":"/","sameSite":"none"},"adminUserId":"f4a21243-eb2a-498e-bd25-46b1f19640cf","userId":"cd3fff13-0da2-4623-a768-4540617e6494"}	2026-08-29 02:59:37
rY9RHQ1QzxUaqtr2XgQCVOz6-Y7JL-9H	{"cookie":{"originalMaxAge":604800000,"expires":"2026-08-28T10:45:30.225Z","secure":true,"httpOnly":true,"path":"/","sameSite":"none"},"adminUserId":"f4a21243-eb2a-498e-bd25-46b1f19640cf","userId":"cd3fff13-0da2-4623-a768-4540617e6494"}	2026-08-29 02:59:38
xaYPs6fs2WZmBm_W9YDceMrgYRG1j1wW	{"cookie":{"originalMaxAge":604800000,"expires":"2026-08-28T04:13:52.447Z","secure":true,"httpOnly":true,"path":"/","sameSite":"none"},"adminUserId":"f4a21243-eb2a-498e-bd25-46b1f19640cf","userId":"cd3fff13-0da2-4623-a768-4540617e6494"}	2026-08-29 02:59:59
q0lbhT3PHXIQLK1C4l35RUolNH5jgMmE	{"cookie":{"originalMaxAge":604800000,"expires":"2026-08-28T04:29:21.297Z","secure":true,"httpOnly":true,"path":"/","sameSite":"none"},"userId":"cd3fff13-0da2-4623-a768-4540617e6494"}	2026-08-28 04:29:40
Ckz35yGKv8zPKNjclD-dmbbDADf3ADkl	{"cookie":{"originalMaxAge":604800000,"expires":"2026-08-28T09:15:55.594Z","secure":true,"httpOnly":true,"path":"/","sameSite":"none"},"userId":"f5ec3e2c-87d9-40e3-829e-8e1448495880"}	2026-08-28 12:11:31
Qwo2v3F0e6sU8nzfI1aIthkf1YomcUxL	{"cookie":{"originalMaxAge":604800000,"expires":"2026-08-28T08:46:43.474Z","secure":true,"httpOnly":true,"path":"/","sameSite":"none"},"userId":"81a69081-3d28-4cbd-9b72-1f7164ee70b2"}	2026-08-28 10:27:02
rmmfSzHz_NHV-ecKcrqH-MShUlp9kunQ	{"cookie":{"originalMaxAge":604800000,"expires":"2026-08-28T06:03:51.840Z","secure":true,"httpOnly":true,"path":"/","sameSite":"none"},"adminUserId":"f4a21243-eb2a-498e-bd25-46b1f19640cf"}	2026-08-28 06:04:26
JDAGOj8Yxhx-CA19n_ZOdTau-g4c7yV3	{"cookie":{"originalMaxAge":604800000,"expires":"2026-08-28T03:55:24.978Z","secure":true,"httpOnly":true,"path":"/","sameSite":"none"},"userId":"26b03465-d7a9-49f5-97ce-6ad3714637d3"}	2026-08-28 07:21:15
jGZRWKtqDfg48Vhj_3crVmKQl3AHuK6d	{"cookie":{"originalMaxAge":604800000,"expires":"2026-08-28T06:29:34.595Z","secure":true,"httpOnly":true,"path":"/","sameSite":"none"},"userId":"f4a21243-eb2a-498e-bd25-46b1f19640cf","adminUserId":"f4a21243-eb2a-498e-bd25-46b1f19640cf"}	2026-08-29 02:59:50
P-VxVu2wc3rx0G-aA6-MsTZVNyolaS9l	{"cookie":{"originalMaxAge":604800000,"expires":"2026-08-28T06:53:05.073Z","secure":true,"httpOnly":true,"path":"/","sameSite":"none"},"userId":"2330abc5-6fda-4147-8e70-354243d137f8"}	2026-08-29 00:36:52
BNNelZ42SEO_aflYCd4josn01HyBrrCJ	{"cookie":{"originalMaxAge":604800000,"expires":"2026-08-28T03:46:31.989Z","secure":true,"httpOnly":true,"path":"/","sameSite":"none"},"adminUserId":"f4a21243-eb2a-498e-bd25-46b1f19640cf","userId":"26b03465-d7a9-49f5-97ce-6ad3714637d3"}	2026-08-28 06:02:54
amxr4yWBSkSur9okqUi79tUsTwCYW04R	{"cookie":{"originalMaxAge":604800000,"expires":"2026-08-28T06:03:17.146Z","secure":true,"httpOnly":true,"path":"/","sameSite":"none"},"adminUserId":"f4a21243-eb2a-498e-bd25-46b1f19640cf"}	2026-08-28 12:24:25
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.users (id, username, password, name, phone, bank_name, account_holder, account_number, balance, total_deposit, total_withdrawal, total_bet, total_win, role, grade, is_active, last_login_at, created_at, approval_status, birth_date, resident_number, region, branch_code, affiliate_id, last_login_ip, auto_bet_enabled, auto_bet_multiplier, is_betting_blocked, forced_bet_direction, max_execution_enabled, pending_balance_adjustment, always_pending_enabled, telegram_notify_enabled) FROM stdin;
7a64e864-b6b6-49aa-ad5d-f2803eff2dc2	dh9328	6484	황두환	01092386484	신한은행	황두환	110440854427 	0	0	0	0	0	user	브론즈	t	2026-08-21 04:14:40.74	2026-08-21 04:11:04.966348	approved	000000	\N	\N	\N	\N	37.120.210.156	f	10	f	\N	t	0	f	f
29b99888-f00a-4feb-a906-5b420bba427d	01062923388	ch23232323	최진규	01062923388	우리은행	최진규	1002145293003	0	0	0	0	0	user	브론즈	t	2026-08-21 04:35:06.38	2026-08-21 04:33:50.643453	approved	501124	\N	\N	\N	\N	110.15.3.106	f	10	f	\N	t	0	f	f
822cd4ee-b7c0-4cb9-8926-78bba6617512	oj8401	4342	우옥자	01084014243	NH농협은행	우옥자	352 1410 6355 33	2000000	0	0	0	0	user	브론즈	t	2026-08-21 04:19:37.395	2026-08-21 04:05:00.252967	approved	000000	\N	\N	\N	\N	37.120.210.156	f	10	f	\N	t	0	f	f
23e74316-76b4-4431-aa8f-db1226a2bb39	ch25252525	ch2323@2323	최진규	01060923388	우리은행	최진규	1002145293003	0	0	0	0	0	user	브론즈	t	2026-08-21 11:25:51.76	2026-08-21 08:03:27.922653	approved	501124	\N	\N	\N	\N	110.15.3.106	f	10	f	\N	t	0	f	f
e4ae177e-7eea-4760-bb1a-b68dcb200f6d	seocho	1234	체험투자	01044421648	신협	예금	16215264346	1000000	0	0	0	0	user	브론즈	t	2026-08-21 04:08:30.463	2026-08-21 04:07:45.326901	approved	901021	\N	\N	\N	\N	103.125.146.66	f	10	f	\N	t	0	f	f
261dacb4-72ca-44ad-8acc-f0c4cc0574b2	seocho1	1234	체험투자	01012441124	신한은행	체험투자	12345735878	0	0	0	0	0	user	브론즈	t	\N	2026-08-21 04:20:56.100324	approved	901212	\N	\N	\N	\N	\N	f	10	f	\N	t	0	f	f
cd3fff13-0da2-4623-a768-4540617e6494	gof	1234	gof	01055554444	전북은행	지오에프	16215264346	1210000	1000000	0	0	0	user	브론즈	t	2026-08-21 09:41:54.918	2026-08-21 04:03:59.633321	approved	900424	\N	\N	\N	\N	175.223.31.166	f	10	f	\N	t	0	f	f
f5ec3e2c-87d9-40e3-829e-8e1448495880	김창하	0355	김창하	01076770365	KB국민은행	김창하	44530104246808	0	0	50000	0	0	user	브론즈	t	2026-08-21 09:15:55.547	2026-08-21 09:13:27.658271	approved	000000	\N	\N	\N	\N	61.40.143.198	f	10	f	\N	t	0	f	f
f4a21243-eb2a-498e-bd25-46b1f19640cf	qwer1234	1234	관리자	\N	\N	\N	\N	100000000	0	0	0	0	admin	브론즈	t	2026-08-21 08:13:25.715	2026-08-09 11:19:58.005784	approved	\N	\N	\N	\N	\N	175.223.31.166	f	10	f	\N	t	0	f	f
81a69081-3d28-4cbd-9b72-1f7164ee70b2	applemilk01 	4823asdf	이수현	01034477228	카카오뱅크	이수현	3333647843	0	0	50000	0	0	user	브론즈	t	2026-08-21 08:46:43.462	2026-08-21 08:46:01.368893	approved	730117	\N	\N	\N	\N	220.70.5.181	f	10	f	\N	t	0	f	f
2330abc5-6fda-4147-8e70-354243d137f8	안경규	1343	안경규	01088051343	NH농협은행	안경규	352 0478 6167 63	0	0	70000	0	0	user	브론즈	t	2026-08-21 07:19:16.412	2026-08-21 06:51:49.328457	approved	000000	\N	\N	\N	\N	37.120.210.156	f	10	f	\N	t	0	f	f
26b03465-d7a9-49f5-97ce-6ad3714637d3	demo	demo123!	테스트	01012341234	KB국민은행	테스트	111	1810000	2000000	200000	0	0	user	브론즈	t	2026-08-21 03:55:24.962	2026-08-20 10:41:48.977928	approved	901231	\N	\N	\N	\N	223.119.20.250	f	10	f	\N	t	0	f	f
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

SELECT pg_catalog.setval('public.bets_id_seq', 385, true);


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

SELECT pg_catalog.setval('public.forex_candles_id_seq', 176121, true);


--
-- Name: inquiries_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.inquiries_id_seq', 5, true);


--
-- Name: inquiry_templates_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.inquiry_templates_id_seq', 1, false);


--
-- Name: login_history_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.login_history_id_seq', 124, true);


--
-- Name: maintenance_symbols_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.maintenance_symbols_id_seq', 1, false);


--
-- Name: messages_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.messages_id_seq', 2, false);


--
-- Name: round_forced_directions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.round_forced_directions_id_seq', 287, true);


--
-- Name: round_results_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.round_results_id_seq', 1, false);


--
-- Name: transaction_requests_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.transaction_requests_id_seq', 80, true);


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

\unrestrict 820XI6gcawMskfdjAWdzLXla4uTKznrroHJd7lcHBjvrIEhzjmz3iHhh0HsqASA

