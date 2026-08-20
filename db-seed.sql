--
-- PostgreSQL database dump
--

\restrict 5aPugcG4c2wfLqvzNF4Fe3pTRXXOPbPFYyVzr9Whb3k9G8fIdvXi4grs1HmEwL1

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
42157	SP500	120	1787237400	7686.692876	7687.662699	7684.658542	7687.662699
42158	CRUDE	120	1787237400	85.943924	86.110030	85.926875	86.092734
42159	GOLD	120	1787237400	4551.316259	4552.493548	4550.179471	4550.298831
42160	DOW	120	1787237400	53096.938733	53125.510459	53093.103494	53123.413452
42161	VIX	120	1787237400	15.801175	15.840000	15.798536	15.814760
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
42654	GOLD	120	1787237880	4559.817043	4563.075422	4559.500000	4563.016195
42655	DOW	120	1787237880	53126.938046	53157.655100	53121.397141	53147.506276
42656	VIX	120	1787237880	15.752298	15.753661	15.710000	15.715367
42652	SP500	120	1787237880	7684.620900	7691.407982	7684.602046	7691.407982
42653	CRUDE	120	1787237880	86.101862	86.220098	86.066685	86.198334
42282	SP500	120	1787237520	7687.856657	7690.719354	7687.023667	7689.969001
42283	CRUDE	120	1787237520	86.094839	86.216277	86.057525	86.062567
42284	GOLD	120	1787237520	4550.213117	4555.739369	4549.400000	4555.499545
42285	DOW	120	1787237520	53124.160547	53159.447304	53122.149775	53148.330798
42286	VIX	120	1787237520	15.814553	15.819053	15.756935	15.765145
\.


--
-- Data for Name: inquiries; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.inquiries (id, user_id, title, content, reply, status, replied_by, replied_at, is_reply_read, created_at) FROM stdin;
2	26b03465-d7a9-49f5-97ce-6ad3714637d3	테스트	테스트	\N	pending	\N	\N	f	2026-08-20 10:51:54.719492
1	26b03465-d7a9-49f5-97ce-6ad3714637d3	입금계좌 안내 요청	입금계좌 정보를 안내해 주세요.	테스트	answered	f4a21243-eb2a-498e-bd25-46b1f19640cf	2026-08-20 10:51:43.052	t	2026-08-20 10:42:49.304569
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
75	26b03465-d7a9-49f5-97ce-6ad3714637d3	deposit	1000000	approved	\N	\N	\N	테스트	\N	f4a21243-eb2a-498e-bd25-46b1f19640cf	2026-08-20 10:47:55.761	2026-08-20 10:46:24.149887
76	26b03465-d7a9-49f5-97ce-6ad3714637d3	withdrawal	100000	pending	\N	\N	\N	\N	\N	\N	\N	2026-08-20 10:48:13.483113
73	26b03465-d7a9-49f5-97ce-6ad3714637d3	deposit	1000000	approved	\N	\N	\N	테스트	\N	f4a21243-eb2a-498e-bd25-46b1f19640cf	2026-08-20 10:43:05.813	2026-08-20 10:43:01.795393
74	26b03465-d7a9-49f5-97ce-6ad3714637d3	withdrawal	100000	approved	\N	\N	\N	\N	\N	f4a21243-eb2a-498e-bd25-46b1f19640cf	2026-08-20 10:43:23.984	2026-08-20 10:43:17.393413
\.


--
-- Data for Name: user_sessions; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.user_sessions (sid, sess, expire) FROM stdin;
tMoEvbd8uakf4kol-t_xNHwXkuxSAw83	{"cookie":{"originalMaxAge":604800000,"expires":"2026-08-21T05:07:08.612Z","secure":false,"httpOnly":true,"path":"/","sameSite":"lax"},"adminUserId":"f4a21243-eb2a-498e-bd25-46b1f19640cf"}	2026-08-21 05:07:09
sQr_mPYgH-sZR9ca6lRDQPrKEakM9yBk	{"cookie":{"originalMaxAge":604800000,"expires":"2026-08-27T10:42:06.024Z","secure":true,"httpOnly":true,"path":"/","sameSite":"none"},"adminUserId":"f4a21243-eb2a-498e-bd25-46b1f19640cf","userId":"26b03465-d7a9-49f5-97ce-6ad3714637d3"}	2026-08-27 14:55:40
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.users (id, username, password, name, phone, bank_name, account_holder, account_number, balance, total_deposit, total_withdrawal, total_bet, total_win, role, grade, is_active, last_login_at, created_at, approval_status, birth_date, resident_number, region, branch_code, affiliate_id, last_login_ip, auto_bet_enabled, auto_bet_multiplier, is_betting_blocked, forced_bet_direction, max_execution_enabled, pending_balance_adjustment, always_pending_enabled, telegram_notify_enabled) FROM stdin;
f4a21243-eb2a-498e-bd25-46b1f19640cf	admin	admin123	관리자	\N	\N	\N	\N	100000000	0	0	0	0	admin	브론즈	t	\N	2026-08-09 11:19:58.005784	approved	\N	\N	\N	\N	\N	\N	f	10	f	\N	t	0	f	f
26b03465-d7a9-49f5-97ce-6ad3714637d3	demo	demo123!	테스트	01012341234	KB국민은행	테스트	111	1810000	2000000	100000	0	0	user	브론즈	t	2026-08-20 10:42:06.011	2026-08-20 10:41:48.977928	approved	901231	\N	\N	\N	\N	146.70.201.161	f	10	f	\N	t	0	f	f
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

SELECT pg_catalog.setval('public.bets_id_seq', 369, true);


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

SELECT pg_catalog.setval('public.forex_candles_id_seq', 42786, true);


--
-- Name: inquiries_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.inquiries_id_seq', 2, true);


--
-- Name: inquiry_templates_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.inquiry_templates_id_seq', 1, false);


--
-- Name: login_history_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.login_history_id_seq', 93, true);


--
-- Name: maintenance_symbols_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.maintenance_symbols_id_seq', 1, false);


--
-- Name: messages_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.messages_id_seq', 1, true);


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

SELECT pg_catalog.setval('public.transaction_requests_id_seq', 76, true);


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

\unrestrict 5aPugcG4c2wfLqvzNF4Fe3pTRXXOPbPFYyVzr9Whb3k9G8fIdvXi4grs1HmEwL1

