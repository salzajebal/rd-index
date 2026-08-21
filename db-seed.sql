--
-- PostgreSQL database dump
--

\restrict 3xewHFd6jOAgdu6g5cbb7i5f6IuQUMBgHpex9u84uJjUc7YKZxkdxALgrCsInDd

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
85989	GOLD	120	1787281080	4592.240321	4595.156593	4592.037658	4594.562371
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
85987	SP500	120	1787281080	7640.126367	7642.322122	7639.627403	7640.663021
85988	CRUDE	120	1787281080	86.658809	86.668226	86.620000	86.625786
85990	DOW	120	1787281080	52765.277489	52767.628995	52753.992090	52753.992090
85991	VIX	120	1787281080	16.003497	16.019350	16.000961	16.010597
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
BNNelZ42SEO_aflYCd4josn01HyBrrCJ	{"cookie":{"originalMaxAge":604800000,"expires":"2026-08-28T02:40:54.704Z","secure":true,"httpOnly":true,"path":"/","sameSite":"none"},"adminUserId":"f4a21243-eb2a-498e-bd25-46b1f19640cf"}	2026-08-28 03:00:01
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.users (id, username, password, name, phone, bank_name, account_holder, account_number, balance, total_deposit, total_withdrawal, total_bet, total_win, role, grade, is_active, last_login_at, created_at, approval_status, birth_date, resident_number, region, branch_code, affiliate_id, last_login_ip, auto_bet_enabled, auto_bet_multiplier, is_betting_blocked, forced_bet_direction, max_execution_enabled, pending_balance_adjustment, always_pending_enabled, telegram_notify_enabled) FROM stdin;
26b03465-d7a9-49f5-97ce-6ad3714637d3	demo	demo123!	테스트	01012341234	KB국민은행	테스트	111	1810000	2000000	100000	0	0	user	브론즈	t	2026-08-20 10:42:06.011	2026-08-20 10:41:48.977928	approved	901231	\N	\N	\N	\N	146.70.201.161	f	10	f	\N	t	0	f	f
f4a21243-eb2a-498e-bd25-46b1f19640cf	qwer1234	1234	관리자	\N	\N	\N	\N	100000000	0	0	0	0	admin	브론즈	t	\N	2026-08-09 11:19:58.005784	approved	\N	\N	\N	\N	\N	\N	f	10	f	\N	t	0	f	f
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

SELECT pg_catalog.setval('public.bets_id_seq', 370, false);


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

SELECT pg_catalog.setval('public.forex_candles_id_seq', 86106, true);


--
-- Name: inquiries_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.inquiries_id_seq', 3, false);


--
-- Name: inquiry_templates_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.inquiry_templates_id_seq', 1, false);


--
-- Name: login_history_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.login_history_id_seq', 94, false);


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

SELECT pg_catalog.setval('public.round_forced_directions_id_seq', 270, false);


--
-- Name: round_results_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.round_results_id_seq', 1, false);


--
-- Name: transaction_requests_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.transaction_requests_id_seq', 77, false);


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

\unrestrict 3xewHFd6jOAgdu6g5cbb7i5f6IuQUMBgHpex9u84uJjUc7YKZxkdxALgrCsInDd

