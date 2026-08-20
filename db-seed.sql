--
-- PostgreSQL database dump
--

\restrict 6Gwb0fosnsPLZukcIC20tP1wNDHz4mv0dbHwCriDW4GImuAr6DWlFCcXrxluML8

-- Dumped from database version 16.14 (422d414)
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
DROP INDEX IF EXISTS _system.idx_replit_database_migrations_v1_build_id;
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
ALTER TABLE IF EXISTS ONLY _system.replit_database_migrations_v1 DROP CONSTRAINT IF EXISTS replit_database_migrations_v1_pkey;
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
ALTER TABLE IF EXISTS _system.replit_database_migrations_v1 ALTER COLUMN id DROP DEFAULT;
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
DROP SEQUENCE IF EXISTS _system.replit_database_migrations_v1_id_seq;
DROP TABLE IF EXISTS _system.replit_database_migrations_v1;
DROP SCHEMA IF EXISTS _system;
--
-- Name: _system; Type: SCHEMA; Schema: -; Owner: -
--

CREATE SCHEMA _system;


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: replit_database_migrations_v1; Type: TABLE; Schema: _system; Owner: -
--

CREATE TABLE _system.replit_database_migrations_v1 (
    id bigint NOT NULL,
    build_id text NOT NULL,
    deployment_id text NOT NULL,
    statement_count bigint NOT NULL,
    applied_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP
);


--
-- Name: replit_database_migrations_v1_id_seq; Type: SEQUENCE; Schema: _system; Owner: -
--

CREATE SEQUENCE _system.replit_database_migrations_v1_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: replit_database_migrations_v1_id_seq; Type: SEQUENCE OWNED BY; Schema: _system; Owner: -
--

ALTER SEQUENCE _system.replit_database_migrations_v1_id_seq OWNED BY _system.replit_database_migrations_v1.id;


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
-- Name: replit_database_migrations_v1 id; Type: DEFAULT; Schema: _system; Owner: -
--

ALTER TABLE ONLY _system.replit_database_migrations_v1 ALTER COLUMN id SET DEFAULT nextval('_system.replit_database_migrations_v1_id_seq'::regclass);


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
-- Data for Name: replit_database_migrations_v1; Type: TABLE DATA; Schema: _system; Owner: -
--

COPY _system.replit_database_migrations_v1 (id, build_id, deployment_id, statement_count, applied_at) FROM stdin;
1	7f9974f3-0a58-4b3a-8b05-caf9decb46b2	29f6bd25-50a3-4fff-87b3-91d4e4d6c2e5	4	2026-08-11 04:51:51.721324+00
\.


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
1	거래소 도메인 변경 안내	기존 RD 거래소는 해외 기반 거래소로서 국내 서비스 확대 및 한국거래소와의 제휴에 따라 KDI INDEX KOREA(케이디아이 인덱스 코리아)​로 변경되었습니다.\n\n사전에 공지드린 내용과 같이 서비스 이전에 따라 기존 RD 도메인은 더 이상 접속되지 않습니다.\n\n앞으로는 새롭게 변경된 KDI INDEX KOREA 공식 도메인을 통해 접속해 주시기 바랍니다.\n\n기존 이용 고객님의 서비스 이용 정보는 이전 절차에 따라 적용되며, 접속과 이용에 불편이 있으신 경우 고객센터로 문의해 주시면 확인 후 안내드리겠습니다.\n\n[변경 안내]\n\n기존 명칭 : RD-INDEX \n변경 명칭 : KDI-INDEX KOREA\n\n신규 도메인 : KDI-index.com\n\n사전에 안내드린 변경 사항이오니 착오 없으시길 바라며 변경 사항은 금일 15시부터 적용 예정입니다.\n\n앞으로는 반드시 변경된 공식 도메인을 이용해 주시기 바랍니다.\n\n감사합니다.	f	f	2026-08-14 00:00:00	2026-08-14 05:00:39.808253	2026-08-14 05:00:58.575
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
136	b74441c4-1858-43f0-afdc-fbfec02ce9d5	SP500	short	200000.00000000	300	7498.88239471	7506.38127710	0.00000000	1.95	lose	2026-07-23 07:05:00.546	2026-07-23 07:00:17.567303	2026-07-23 07:05:07.37	193	\N	f	\N	2377500.00000000	2177500.00000000
140	b74441c4-1858-43f0-afdc-fbfec02ce9d5	SP500	long	500000.00000000	300	7498.42517469	7490.92674952	0.00000000	1.95	lose	2026-07-23 07:10:00.768	2026-07-23 07:07:02.77582	2026-07-23 07:10:07.391	194	\N	f	\N	2177500.00000000	1677500.00000000
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
173	3007b845-7394-4cb1-81d7-7a5289591da2	SP500	long	300000.00000000	300	7412.79389593	7405.38110203	0.00000000	1.95	lose	2026-07-27 01:40:00.417	2026-07-27 01:37:19.426508	2026-07-27 01:40:06.753	128	\N	f	\N	4975000.00000000	4675000.00000000
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
207	680bfe1a-2a6d-4661-8111-c86c439f1598	SP500	short	10000.00000000	300	7431.04553783	7419.87565923	19500.00000000	1.95	win	2026-07-27 14:25:00.459	2026-07-27 14:21:43.468268	2026-07-27 14:25:06.571	281	\N	f	\N	3167500.00000000	3177000.00000000
208	680bfe1a-2a6d-4661-8111-c86c439f1598	SP500	short	77000.00000000	300	7413.35014196	7408.00811770	150150.00000000	1.95	win	2026-07-27 14:30:00.969	2026-07-27 14:28:34.978883	2026-07-27 14:30:06.816	282	\N	f	\N	3177000.00000000	3250150.00000000
209	680bfe1a-2a6d-4661-8111-c86c439f1598	SP500	long	250000.00000000	300	7399.22942992	7404.41000000	487500.00000000	1.95	win	2026-07-27 14:50:00.072	2026-07-27 14:49:01.082682	2026-07-27 14:50:06.616	286	\N	f	\N	3250150.00000000	3487650.00000000
210	680bfe1a-2a6d-4661-8111-c86c439f1598	SP500	long	487650.00000000	300	7417.53772334	7418.19981725	950917.50000000	1.95	win	2026-07-27 15:00:00.184	2026-07-27 14:59:01.194727	2026-07-27 15:00:06.317	288	\N	f	\N	3487650.00000000	3950917.50000000
226	c84ca9f9-1efe-4ff4-a37d-ff9c3237b279	SP500	long	150000.00000000	300	7413.07853626	7420.49161480	292500.00000000	1.95	win	2026-07-28 01:35:00.56	2026-07-28 01:31:52.569131	2026-07-28 01:35:05.868	127	\N	f	\N	20817500.00000000	20960000.00000000
211	680bfe1a-2a6d-4661-8111-c86c439f1598	SP500	short	200000.00000000	300	7406.92146803	7411.95000000	0.00000000	1.95	lose	2026-07-27 15:20:00.947	2026-07-27 15:18:58.957042	2026-07-27 15:20:06.616	4	\N	f	\N	3950918.00000000	3750918.00000000
212	680bfe1a-2a6d-4661-8111-c86c439f1598	SP500	short	50000.00000000	300	7406.20407604	7406.21000000	0.00000000	1.95	lose	2026-07-27 15:25:00.403	2026-07-27 15:23:58.41119	2026-07-27 15:25:06.416	5	\N	f	\N	3750918.00000000	3700918.00000000
213	680bfe1a-2a6d-4661-8111-c86c439f1598	SP500	long	10000.00000000	300	7403.89772055	7405.27378899	19500.00000000	1.95	win	2026-07-27 15:30:00.844	2026-07-27 15:29:00.851561	2026-07-27 15:30:07.108	6	\N	f	\N	3700918.00000000	3710418.00000000
214	680bfe1a-2a6d-4661-8111-c86c439f1598	SP500	short	10000.00000000	300	7398.49769612	7397.59000000	19500.00000000	1.95	win	2026-07-27 15:35:00.588	2026-07-27 15:33:58.598177	2026-07-27 15:35:06.816	7	\N	f	\N	3710418.00000000	3719918.00000000
215	680bfe1a-2a6d-4661-8111-c86c439f1598	SP500	short	19000.00000000	300	7393.39430527	7396.41304332	0.00000000	1.95	lose	2026-07-27 15:45:00.911	2026-07-27 15:44:00.921914	2026-07-27 15:45:07.2	9	\N	f	\N	3719918.00000000	3700918.00000000
237	c84ca9f9-1efe-4ff4-a37d-ff9c3237b279	SP500	short	850000.00000000	300	7412.50602435	7405.09351833	1657500.00000000	1.95	win	2026-07-28 01:50:00.453	2026-07-28 01:46:10.463289	2026-07-28 01:50:06.446	130	\N	f	\N	20260000.00000000	21067500.00000000
216	680bfe1a-2a6d-4661-8111-c86c439f1598	SP500	short	50000.00000000	300	7393.51798601	7391.14776961	97500.00000000	1.95	win	2026-07-27 15:50:00.846	2026-07-27 15:49:00.855766	2026-07-27 15:50:07.239	10	\N	f	\N	3700918.00000000	3748418.00000000
223	680bfe1a-2a6d-4661-8111-c86c439f1598	SP500	long	150000.00000000	300	7413.03577600	7420.44881178	292500.00000000	1.95	win	2026-07-28 01:35:00.93	2026-07-28 01:31:05.93984	2026-07-28 01:35:06.414	127	\N	f	\N	3748418.00000000	3890918.00000000
218	3007b845-7394-4cb1-81d7-7a5289591da2	SP500	short	1000000.00000000	300	7412.58916835	7405.17657918	1950000.00000000	1.95	win	2026-07-28 01:05:00.68	2026-07-28 01:04:10.690302	2026-07-28 01:05:05.881	121	\N	f	\N	10085000.00000000	11035000.00000000
220	3007b845-7394-4cb1-81d7-7a5289591da2	SP500	long	1000000.00000000	300	7414.01483823	7421.42885307	1950000.00000000	1.95	win	2026-07-28 01:10:00.521	2026-07-28 01:07:40.530981	2026-07-28 01:10:05.98	122	\N	f	\N	11035000.00000000	11985000.00000000
224	b74441c4-1858-43f0-afdc-fbfec02ce9d5	SP500	long	150000.00000000	300	7412.85449671	7420.26735121	292500.00000000	1.95	win	2026-07-28 01:35:00.18	2026-07-28 01:31:44.190237	2026-07-28 01:35:05.812	127	\N	f	\N	3375000.00000000	3517500.00000000
225	3007b845-7394-4cb1-81d7-7a5289591da2	SP500	long	150000.00000000	300	7412.72105995	7420.13378101	292500.00000000	1.95	win	2026-07-28 01:35:00.316	2026-07-28 01:31:46.326658	2026-07-28 01:35:05.841	127	\N	f	\N	11985000.00000000	12127500.00000000
233	b74441c4-1858-43f0-afdc-fbfec02ce9d5	SP500	long	350000.00000000	300	7413.45395708	7406.04050312	0.00000000	1.95	lose	2026-07-28 01:45:00.241	2026-07-28 01:41:01.252427	2026-07-28 01:45:06.324	129	\N	f	\N	3167500.00000000	2817500.00000000
227	b74441c4-1858-43f0-afdc-fbfec02ce9d5	SP500	short	350000.00000000	300	7413.17443214	7420.58760657	0.00000000	1.95	lose	2026-07-28 01:40:00.585	2026-07-28 01:36:00.595827	2026-07-28 01:40:06.116	128	\N	f	\N	3517500.00000000	3167500.00000000
229	c84ca9f9-1efe-4ff4-a37d-ff9c3237b279	SP500	short	350000.00000000	300	7413.52169843	7420.93522013	0.00000000	1.95	lose	2026-07-28 01:40:00.219	2026-07-28 01:36:35.228723	2026-07-28 01:40:06.379	128	\N	f	\N	20960000.00000000	20610000.00000000
238	b74441c4-1858-43f0-afdc-fbfec02ce9d5	SP500	short	850000.00000000	300	7412.32440350	7404.91207910	1657500.00000000	1.95	win	2026-07-28 01:50:00.567	2026-07-28 01:46:11.579203	2026-07-28 01:50:06.478	130	\N	f	\N	2817500.00000000	3625000.00000000
230	3007b845-7394-4cb1-81d7-7a5289591da2	SP500	short	350000.00000000	300	7412.93663879	7420.34957543	0.00000000	1.95	lose	2026-07-28 01:40:00.38	2026-07-28 01:36:48.390388	2026-07-28 01:40:06.418	128	\N	f	\N	12127500.00000000	11777500.00000000
235	680bfe1a-2a6d-4661-8111-c86c439f1598	SP500	long	150000.00000000	300	7413.60000399	7406.18640399	0.00000000	1.95	lose	2026-07-28 01:45:00.849	2026-07-28 01:43:58.858726	2026-07-28 01:45:06.399	129	\N	f	\N	390918.00000000	240918.00000000
231	680bfe1a-2a6d-4661-8111-c86c439f1598	SP500	short	3500000.00000000	300	7412.32238946	7419.73471185	0.00000000	1.95	lose	2026-07-28 01:40:00.225	2026-07-28 01:38:37.23732	2026-07-28 01:40:06.459	128	\N	f	\N	3890918.00000000	390918.00000000
232	c84ca9f9-1efe-4ff4-a37d-ff9c3237b279	SP500	long	350000.00000000	300	7413.59411893	7406.18052481	0.00000000	1.95	lose	2026-07-28 01:45:00.208	2026-07-28 01:40:53.218971	2026-07-28 01:45:06.437	129	\N	f	\N	20610000.00000000	20260000.00000000
236	3007b845-7394-4cb1-81d7-7a5289591da2	SP500	long	350000.00000000	300	7412.67166810	7405.25899643	0.00000000	1.95	lose	2026-07-28 01:50:00.117	2026-07-28 01:45:22.126795	2026-07-28 01:50:06.412	130	\N	f	\N	11777500.00000000	11427500.00000000
244	b74441c4-1858-43f0-afdc-fbfec02ce9d5	SP500	short	200000.00000000	300	7412.56009162	7405.14753153	390000.00000000	1.95	win	2026-07-28 07:05:00.312	2026-07-28 07:00:38.323462	2026-07-28 07:05:05.439	193	\N	f	\N	3625000.00000000	3815000.00000000
245	3007b845-7394-4cb1-81d7-7a5289591da2	SP500	short	200000.00000000	300	7413.36655895	7405.95319239	390000.00000000	1.95	win	2026-07-28 07:05:00.198	2026-07-28 07:00:59.208602	2026-07-28 07:05:05.473	193	\N	f	\N	11427500.00000000	11617500.00000000
247	3007b845-7394-4cb1-81d7-7a5289591da2	SP500	short	900000.00000000	300	7428.25908350	7420.83082442	1755000.00000000	1.95	win	2026-07-29 01:05:00.674	2026-07-29 01:01:03.688953	2026-07-29 01:05:05.909	121	\N	f	\N	16617500.00000000	17472500.00000000
249	3007b845-7394-4cb1-81d7-7a5289591da2	SP500	short	950000.00000000	300	7428.51666702	7421.08815035	1852500.00000000	1.95	win	2026-07-29 01:10:00.807	2026-07-29 01:06:44.816853	2026-07-29 01:10:05.998	122	\N	f	\N	17472500.00000000	18375000.00000000
251	b74441c4-1858-43f0-afdc-fbfec02ce9d5	SP500	short	250000.00000000	300	7428.79361179	7421.36481818	487500.00000000	1.95	win	2026-07-29 01:35:00.33	2026-07-29 01:30:35.340044	2026-07-29 01:35:06.369	127	\N	f	\N	3815000.00000000	4052500.00000000
252	3007b845-7394-4cb1-81d7-7a5289591da2	SP500	short	250000.00000000	300	7428.78983048	7421.36104065	487500.00000000	1.95	win	2026-07-29 01:35:00.957	2026-07-29 01:31:44.965828	2026-07-29 01:35:06.398	127	\N	f	\N	18375000.00000000	18612500.00000000
265	680bfe1a-2a6d-4661-8111-c86c439f1598	SP500	short	50000.00000000	300	7401.63910044	7402.25602638	0.00000000	1.95	lose	2026-07-29 13:55:00.404	2026-07-29 13:53:51.414257	2026-07-29 13:55:06.938	275	\N	f	\N	140918.00000000	90918.00000000
266	680bfe1a-2a6d-4661-8111-c86c439f1598	SP500	short	50000.00000000	300	7394.80591768	7399.09593794	0.00000000	1.95	lose	2026-07-29 14:00:00.733	2026-07-29 13:58:47.741578	2026-07-29 14:00:06.976	276	\N	f	\N	90918.00000000	40918.00000000
257	3007b845-7394-4cb1-81d7-7a5289591da2	SP500	short	250000.00000000	300	7429.85433179	7437.28418612	0.00000000	1.95	lose	2026-07-29 07:05:00.984	2026-07-29 07:00:40.994461	2026-07-29 07:05:07.159	193	\N	f	\N	18612500.00000000	18362500.00000000
281	3007b845-7394-4cb1-81d7-7a5289591da2	SP500	short	200000.00000000	300	7315.41426334	7308.09884908	390000.00000000	1.95	win	2026-07-30 07:05:00.595	2026-07-30 07:00:41.603831	2026-07-30 07:05:06.329	193	\N	f	\N	21390000.00000000	21580000.00000000
258	b74441c4-1858-43f0-afdc-fbfec02ce9d5	SP500	short	250000.00000000	300	7428.41296095	7435.84137391	0.00000000	1.95	lose	2026-07-29 07:05:00.937	2026-07-29 07:00:50.946623	2026-07-29 07:05:07.204	193	\N	f	\N	4052500.00000000	3802500.00000000
267	680bfe1a-2a6d-4661-8111-c86c439f1598	SP500	long	40918.00000000	300	7399.84841018	7399.82472295	0.00000000	1.95	lose	2026-07-29 14:05:00.972	2026-07-29 14:03:58.978388	2026-07-29 14:05:07.03	277	\N	f	\N	40918.00000000	0.00000000
259	b74441c4-1858-43f0-afdc-fbfec02ce9d5	SP500	short	500000.00000000	300	7428.73372539	7421.30499166	975000.00000000	1.95	win	2026-07-29 07:10:00.358	2026-07-29 07:05:41.368853	2026-07-29 07:10:07.148	194	\N	f	\N	3802500.00000000	4277500.00000000
274	3007b845-7394-4cb1-81d7-7a5289591da2	SP500	long	250000.00000000	300	7316.41285908	7309.09644622	0.00000000	1.95	lose	2026-07-30 01:35:00.767	2026-07-30 01:30:59.774232	2026-07-30 01:35:07.036	127	\N	f	\N	21212500.00000000	20962500.00000000
268	3007b845-7394-4cb1-81d7-7a5289591da2	SP500	short	1200000.00000000	300	7316.24689579	7308.93064889	2340000.00000000	1.95	win	2026-07-30 01:05:00.722	2026-07-30 01:01:30.731084	2026-07-30 01:05:06.721	121	\N	f	\N	18837500.00000000	19977500.00000000
261	3007b845-7394-4cb1-81d7-7a5289591da2	SP500	short	500000.00000000	300	7428.78000000	7421.35122000	975000.00000000	1.95	win	2026-07-29 07:10:00.764	2026-07-29 07:05:57.773541	2026-07-29 07:10:07.205	194	\N	f	\N	18362500.00000000	18837500.00000000
263	680bfe1a-2a6d-4661-8111-c86c439f1598	SP500	short	50000.00000000	300	7418.91689830	7420.66742633	0.00000000	1.95	lose	2026-07-29 13:45:00.6	2026-07-29 13:44:02.609133	2026-07-29 13:45:06.852	273	\N	f	\N	240918.00000000	190918.00000000
279	3007b845-7394-4cb1-81d7-7a5289591da2	SP500	short	450000.00000000	300	7316.99311459	7309.67612148	877500.00000000	1.95	win	2026-07-30 01:40:00.205	2026-07-30 01:36:23.2147	2026-07-30 01:40:07.083	128	\N	f	\N	20962500.00000000	21390000.00000000
264	680bfe1a-2a6d-4661-8111-c86c439f1598	SP500	short	50000.00000000	300	7415.51542499	7416.38118740	0.00000000	1.95	lose	2026-07-29 13:50:00.587	2026-07-29 13:49:01.598149	2026-07-29 13:50:06.886	274	\N	f	\N	190918.00000000	140918.00000000
269	3007b845-7394-4cb1-81d7-7a5289591da2	SP500	short	1300000.00000000	300	7315.71232470	7308.39661238	2535000.00000000	1.95	win	2026-07-30 01:10:00.937	2026-07-30 01:06:14.945351	2026-07-30 01:10:06.75	122	\N	f	\N	19977500.00000000	21212500.00000000
275	b74441c4-1858-43f0-afdc-fbfec02ce9d5	SP500	long	250000.00000000	300	7316.24238336	7308.92614098	0.00000000	1.95	lose	2026-07-30 01:35:00.796	2026-07-30 01:32:36.804636	2026-07-30 01:35:07.064	127	\N	f	\N	4277500.00000000	4027500.00000000
277	b74441c4-1858-43f0-afdc-fbfec02ce9d5	SP500	short	450000.00000000	300	7316.35223544	7309.03588320	877500.00000000	1.95	win	2026-07-30 01:40:00.177	2026-07-30 01:35:54.188211	2026-07-30 01:40:07.019	128	\N	f	\N	4027500.00000000	4455000.00000000
282	c84ca9f9-1efe-4ff4-a37d-ff9c3237b279	SP500	short	200000.00000000	300	7316.02311096	7308.70708785	390000.00000000	1.95	win	2026-07-30 07:05:00.705	2026-07-30 07:00:43.713348	2026-07-30 07:05:06.377	193	\N	f	\N	21067500.00000000	21257500.00000000
280	b74441c4-1858-43f0-afdc-fbfec02ce9d5	SP500	short	200000.00000000	300	7315.60392495	7308.28832103	390000.00000000	1.95	win	2026-07-30 07:05:00.83	2026-07-30 07:00:36.840673	2026-07-30 07:05:06.286	193	\N	f	\N	4455000.00000000	4645000.00000000
284	3007b845-7394-4cb1-81d7-7a5289591da2	SP500	long	1000000.00000000	300	7437.60770830	7430.17010059	0.00000000	1.95	lose	2026-07-31 01:05:00.493	2026-07-31 01:03:31.502216	2026-07-31 01:05:05.6	121	\N	f	\N	20580000.00000000	19580000.00000000
285	3007b845-7394-4cb1-81d7-7a5289591da2	SP500	short	2000000.00000000	300	7438.17519066	7430.73701547	3900000.00000000	1.95	win	2026-07-31 01:10:00.715	2026-07-31 01:06:43.725815	2026-07-31 01:10:07.641	122	\N	f	\N	19580000.00000000	21480000.00000000
288	3007b845-7394-4cb1-81d7-7a5289591da2	SP500	long	200000.00000000	300	7437.26056700	7444.69782757	390000.00000000	1.95	win	2026-07-31 01:35:00.031	2026-07-31 01:31:20.040849	2026-07-31 01:35:06.099	127	\N	f	\N	21480000.00000000	21670000.00000000
289	c84ca9f9-1efe-4ff4-a37d-ff9c3237b279	SP500	long	200000.00000000	300	7437.69177924	7445.12947102	390000.00000000	1.95	win	2026-07-31 01:35:00.667	2026-07-31 01:32:59.677721	2026-07-31 01:35:06.137	127	\N	f	\N	21257500.00000000	21447500.00000000
306	3007b845-7394-4cb1-81d7-7a5289591da2	SP500	long	500000.00000000	300	7490.08241276	7497.57249517	975000.00000000	1.95	win	2026-08-03 04:10:00.525	2026-08-03 04:06:39.533449	2026-08-03 04:10:05.858	158	\N	f	\N	5000000.00000000	5475000.00000000
294	b74441c4-1858-43f0-afdc-fbfec02ce9d5	SP500	short	200000.00000000	300	7437.84949457	7430.41164508	390000.00000000	1.95	win	2026-07-31 07:05:00.166	2026-07-31 07:01:01.179602	2026-07-31 07:05:05.605	193	\N	f	\N	4645000.00000000	4835000.00000000
295	c84ca9f9-1efe-4ff4-a37d-ff9c3237b279	SP500	short	200000.00000000	300	7437.51557808	7430.07806250	390000.00000000	1.95	win	2026-07-31 07:05:00.179	2026-07-31 07:01:14.200772	2026-07-31 07:05:05.638	193	\N	f	\N	21447500.00000000	21637500.00000000
320	c84ca9f9-1efe-4ff4-a37d-ff9c3237b279	SP500	short	200000.00000000	300	7599.89925049	7592.29935124	390000.00000000	1.95	win	2026-08-04 01:35:00.23	2026-08-04 01:32:24.240061	2026-08-04 01:35:06.836	127	\N	f	\N	21627500.00000000	21817500.00000000
296	3007b845-7394-4cb1-81d7-7a5289591da2	SP500	short	200000.00000000	300	7437.38135421	7429.94397286	390000.00000000	1.95	win	2026-07-31 07:05:00.266	2026-07-31 07:01:17.276441	2026-07-31 07:05:05.67	193	\N	f	\N	21670000.00000000	21860000.00000000
307	3007b845-7394-4cb1-81d7-7a5289591da2	SP500	long	500000.00000000	300	7489.12895419	7496.61808314	975000.00000000	1.95	win	2026-08-03 04:15:00.406	2026-08-03 04:11:30.413493	2026-08-03 04:15:05.913	159	\N	f	\N	5475000.00000000	5950000.00000000
298	3007b845-7394-4cb1-81d7-7a5289591da2	SP500	long	21860000.00000000	300	7491.06239680	7483.57133440	0.00000000	1.95	lose	2026-08-03 01:05:00.02	2026-08-03 01:01:35.029995	2026-08-03 01:05:05.496	121	\N	f	\N	21860000.00000000	0.00000000
301	b74441c4-1858-43f0-afdc-fbfec02ce9d5	SP500	short	200000.00000000	300	7489.14214497	7496.63128711	0.00000000	1.95	lose	2026-08-03 01:35:00.442	2026-08-03 01:30:19.453283	2026-08-03 01:35:06.041	127	\N	f	\N	4835000.00000000	4635000.00000000
308	c84ca9f9-1efe-4ff4-a37d-ff9c3237b279	SP500	long	200000.00000000	300	7489.62313151	7497.11275464	390000.00000000	1.95	win	2026-08-03 07:05:00.41	2026-08-03 07:00:34.556796	2026-08-03 07:05:05.492	193	\N	f	\N	21437500.00000000	21627500.00000000
303	c84ca9f9-1efe-4ff4-a37d-ff9c3237b279	SP500	short	200000.00000000	300	7490.73008337	7498.22081345	0.00000000	1.95	lose	2026-08-03 01:35:00.007	2026-08-03 01:30:32.019649	2026-08-03 01:35:06.124	127	\N	f	\N	21637500.00000000	21437500.00000000
304	b74441c4-1858-43f0-afdc-fbfec02ce9d5	SP500	short	400000.00000000	300	7490.13064137	7482.64051073	780000.00000000	1.95	win	2026-08-03 01:40:00.68	2026-08-03 01:36:15.693365	2026-08-03 01:40:06.067	128	\N	f	\N	4635000.00000000	5015000.00000000
310	3007b845-7394-4cb1-81d7-7a5289591da2	SP500	long	200000.00000000	300	7489.10131515	7496.59041647	390000.00000000	1.95	win	2026-08-03 07:05:00.288	2026-08-03 07:01:03.29688	2026-08-03 07:05:05.525	193	\N	f	\N	5950000.00000000	6140000.00000000
311	b74441c4-1858-43f0-afdc-fbfec02ce9d5	SP500	long	200000.00000000	300	7489.04515154	7496.53419669	390000.00000000	1.95	win	2026-08-03 07:05:00.705	2026-08-03 07:01:03.717763	2026-08-03 07:05:05.895	193	\N	f	\N	5015000.00000000	5205000.00000000
313	3007b845-7394-4cb1-81d7-7a5289591da2	SP500	long	900000.00000000	300	7599.87953531	7607.47941485	1755000.00000000	1.95	win	2026-08-04 01:05:00.175	2026-08-04 01:01:46.183679	2026-08-04 01:05:05.895	121	\N	f	\N	11140000.00000000	11995000.00000000
314	3007b845-7394-4cb1-81d7-7a5289591da2	SP500	short	1200000.00000000	300	7600.31153420	7592.71122267	2340000.00000000	1.95	win	2026-08-04 01:10:00.025	2026-08-04 01:06:32.033618	2026-08-04 01:10:05.491	122	\N	f	\N	11995000.00000000	13135000.00000000
321	c84ca9f9-1efe-4ff4-a37d-ff9c3237b279	SP500	short	200000.00000000	300	7601.48252215	7593.88103963	390000.00000000	1.95	win	2026-08-04 06:05:00.236	2026-08-04 06:02:02.244637	2026-08-04 06:05:05.867	181	\N	f	\N	21817500.00000000	22007500.00000000
318	b74441c4-1858-43f0-afdc-fbfec02ce9d5	SP500	short	200000.00000000	300	7600.13878868	7592.53864989	390000.00000000	1.95	win	2026-08-04 01:35:00.384	2026-08-04 01:30:59.394212	2026-08-04 01:35:06.759	127	\N	f	\N	5205000.00000000	5395000.00000000
319	3007b845-7394-4cb1-81d7-7a5289591da2	SP500	short	200000.00000000	300	7601.07546269	7593.47438723	390000.00000000	1.95	win	2026-08-04 01:35:00.078	2026-08-04 01:31:06.087422	2026-08-04 01:35:06.797	127	\N	f	\N	13135000.00000000	13325000.00000000
325	c84ca9f9-1efe-4ff4-a37d-ff9c3237b279	SP500	short	200000.00000000	300	7600.40539595	7608.00580135	0.00000000	1.95	lose	2026-08-04 07:05:00.723	2026-08-04 07:00:41.735374	2026-08-04 07:05:05.857	193	\N	f	\N	22007500.00000000	21807500.00000000
323	b74441c4-1858-43f0-afdc-fbfec02ce9d5	SP500	short	200000.00000000	300	7600.35596074	7607.95631670	0.00000000	1.95	lose	2026-08-04 07:05:00.969	2026-08-04 07:00:26.987781	2026-08-04 07:05:07.001	193	\N	f	\N	5395000.00000000	5195000.00000000
324	3007b845-7394-4cb1-81d7-7a5289591da2	SP500	short	200000.00000000	300	7601.06768038	7608.66874806	0.00000000	1.95	lose	2026-08-04 07:05:00.991	2026-08-04 07:00:29.998518	2026-08-04 07:05:07.03	193	\N	f	\N	13325000.00000000	13125000.00000000
326	b74441c4-1858-43f0-afdc-fbfec02ce9d5	SP500	short	350000.00000000	300	7600.20606182	7592.60585576	682500.00000000	1.95	win	2026-08-04 07:10:00.488	2026-08-04 07:05:39.501509	2026-08-04 07:10:05.841	194	\N	f	\N	5195000.00000000	5527500.00000000
328	3007b845-7394-4cb1-81d7-7a5289591da2	SP500	short	350000.00000000	300	7599.55489926	7591.95534436	682500.00000000	1.95	win	2026-08-04 07:10:00.285	2026-08-04 07:06:34.296148	2026-08-04 07:10:05.911	194	\N	f	\N	13125000.00000000	13457500.00000000
329	c84ca9f9-1efe-4ff4-a37d-ff9c3237b279	SP500	short	350000.00000000	300	7600.25243307	7592.65218064	682500.00000000	1.95	win	2026-08-04 07:10:00.7	2026-08-04 07:07:22.712226	2026-08-04 07:10:05.939	194	\N	f	\N	21807500.00000000	22140000.00000000
331	3007b845-7394-4cb1-81d7-7a5289591da2	SP500	short	800000.00000000	300	7736.45642685	7728.71997042	1560000.00000000	1.95	win	2026-08-05 01:05:00.609	2026-08-05 01:01:49.618257	2026-08-05 01:05:06.579	121	\N	f	\N	13457500.00000000	14217500.00000000
333	3007b845-7394-4cb1-81d7-7a5289591da2	SP500	short	800000.00000000	300	7736.52000000	7728.78348000	1560000.00000000	1.95	win	2026-08-05 01:10:00.178	2026-08-05 01:06:27.184209	2026-08-05 01:10:05.39	122	\N	f	\N	14217500.00000000	14977500.00000000
336	3007b845-7394-4cb1-81d7-7a5289591da2	SP500	short	250000.00000000	300	7736.81254092	7729.07572838	487500.00000000	1.95	win	2026-08-05 01:35:00.112	2026-08-05 01:31:05.119984	2026-08-05 01:35:05.6	127	\N	f	\N	14977500.00000000	15215000.00000000
337	c84ca9f9-1efe-4ff4-a37d-ff9c3237b279	SP500	short	250000.00000000	300	7737.72416250	7729.98643834	487500.00000000	1.95	win	2026-08-05 01:35:00.507	2026-08-05 01:32:22.51891	2026-08-05 01:35:05.643	127	\N	f	\N	22140000.00000000	22377500.00000000
356	b74441c4-1858-43f0-afdc-fbfec02ce9d5	SP500	short	200000.00000000	300	7723.03109314	7724.11949445	0.00000000	1.95	lose	2026-08-06 07:05:00.969	2026-08-06 07:00:36.980081	2026-08-06 07:05:06.657	193	\N	f	\N	5735000.00000000	5535000.00000000
335	b74441c4-1858-43f0-afdc-fbfec02ce9d5	SP500	short	250000.00000000	300	7736.15507723	7728.41892215	487500.00000000	1.95	win	2026-08-05 01:35:00.883	2026-08-05 01:30:55.896214	2026-08-05 01:35:06.955	127	\N	f	\N	5527500.00000000	5765000.00000000
338	b74441c4-1858-43f0-afdc-fbfec02ce9d5	SP500	short	300000.00000000	300	7736.57555037	7744.31212592	0.00000000	1.95	lose	2026-08-05 07:05:00.593	2026-08-05 07:00:17.604455	2026-08-05 07:05:06.572	193	\N	f	\N	5765000.00000000	5465000.00000000
349	3007b845-7394-4cb1-81d7-7a5289591da2	SP500	long	600000.00000000	300	7723.36391589	7731.08727981	1170000.00000000	1.95	win	2026-08-06 01:10:00.666	2026-08-06 01:07:46.673855	2026-08-06 01:10:06.606	122	\N	f	\N	15865000.00000000	16435000.00000000
340	3007b845-7394-4cb1-81d7-7a5289591da2	SP500	short	300000.00000000	300	7736.16852849	7743.90469702	0.00000000	1.95	lose	2026-08-05 07:05:00.797	2026-08-05 07:00:53.807613	2026-08-05 07:05:06.652	193	\N	f	\N	15215000.00000000	14915000.00000000
341	c84ca9f9-1efe-4ff4-a37d-ff9c3237b279	SP500	short	300000.00000000	300	7737.12578606	7744.86291185	0.00000000	1.95	lose	2026-08-05 07:05:00.721	2026-08-05 07:01:24.734918	2026-08-05 07:05:06.691	193	\N	f	\N	22377500.00000000	22077500.00000000
343	3007b845-7394-4cb1-81d7-7a5289591da2	SP500	long	600000.00000000	300	7736.26510791	7744.00137302	1170000.00000000	1.95	win	2026-08-05 07:10:00.809	2026-08-05 07:06:22.821359	2026-08-05 07:10:06.665	194	\N	f	\N	14915000.00000000	15485000.00000000
344	c84ca9f9-1efe-4ff4-a37d-ff9c3237b279	SP500	long	600000.00000000	300	7736.02501611	7743.76104113	1170000.00000000	1.95	win	2026-08-05 07:10:00.441	2026-08-05 07:06:26.455065	2026-08-05 07:10:06.703	194	\N	f	\N	22077500.00000000	22647500.00000000
345	b74441c4-1858-43f0-afdc-fbfec02ce9d5	SP500	long	600000.00000000	300	7736.42056927	7744.15698984	1170000.00000000	1.95	win	2026-08-05 07:10:00.282	2026-08-05 07:06:54.293573	2026-08-05 07:10:06.74	194	\N	f	\N	5465000.00000000	6035000.00000000
347	3007b845-7394-4cb1-81d7-7a5289591da2	SP500	long	400000.00000000	300	7723.49877503	7731.22227381	780000.00000000	1.95	win	2026-08-06 01:05:00.981	2026-08-06 01:02:28.995039	2026-08-06 01:05:06.475	121	\N	f	\N	15485000.00000000	15865000.00000000
353	b74441c4-1858-43f0-afdc-fbfec02ce9d5	SP500	short	300000.00000000	300	7724.14916757	7731.87331674	0.00000000	1.95	lose	2026-08-06 01:40:00.359	2026-08-06 01:37:21.369212	2026-08-06 01:40:05.699	128	\N	f	\N	6035000.00000000	5735000.00000000
355	3007b845-7394-4cb1-81d7-7a5289591da2	SP500	short	16435000.00000000	300	7723.49811334	7731.22161145	0.00000000	1.95	lose	2026-08-06 01:45:00.612	2026-08-06 01:41:33.622253	2026-08-06 01:45:05.787	129	\N	f	\N	16435000.00000000	0.00000000
360	b74441c4-1858-43f0-afdc-fbfec02ce9d5	SP500	long	200000.00000000	300	7710.17354469	7717.88371823	390000.00000000	1.95	win	2026-08-07 01:35:00.809	2026-08-07 01:31:39.818047	2026-08-07 01:35:06.447	127	\N	f	\N	5535000.00000000	5725000.00000000
367	c84ca9f9-1efe-4ff4-a37d-ff9c3237b279	SP500	long	200000.00000000	300	7709.83082693	7717.54065776	390000.00000000	1.95	win	2026-08-07 07:05:00.017	2026-08-07 07:01:18.029973	2026-08-07 07:05:05.533	193	\N	f	\N	22647500.00000000	22837500.00000000
368	b74441c4-1858-43f0-afdc-fbfec02ce9d5	SP500	long	200000.00000000	300	7709.78264243	7717.49242507	390000.00000000	1.95	win	2026-08-07 07:05:00.574	2026-08-07 07:01:36.584091	2026-08-07 07:05:06.288	193	\N	f	\N	5725000.00000000	5915000.00000000
369	c84ca9f9-1efe-4ff4-a37d-ff9c3237b279	SP500	long	150000.00000000	300	7757.91851445	7765.67643296	292500.00000000	1.95	win	2026-08-10 01:35:00.996	2026-08-10 01:31:56.007855	2026-08-10 01:35:06.061	127	\N	f	\N	22837500.00000000	22980000.00000000
370	b74441c4-1858-43f0-afdc-fbfec02ce9d5	SP500	long	150000.00000000	300	7758.13636524	7765.89450161	292500.00000000	1.95	win	2026-08-10 01:35:00.056	2026-08-10 01:32:24.06421	2026-08-10 01:35:06.102	127	\N	f	\N	5915000.00000000	6057500.00000000
371	b74441c4-1858-43f0-afdc-fbfec02ce9d5	SP500	long	100000.00000000	300	7757.17422797	7764.93140220	195000.00000000	1.95	win	2026-08-10 01:40:00.122	2026-08-10 01:35:34.131665	2026-08-10 01:40:06.089	128	\N	f	\N	6057500.00000000	6152500.00000000
372	c84ca9f9-1efe-4ff4-a37d-ff9c3237b279	SP500	long	100000.00000000	300	7758.07361458	7765.83168819	195000.00000000	1.95	win	2026-08-10 01:40:00.165	2026-08-10 01:35:39.176182	2026-08-10 01:40:06.128	128	\N	f	\N	22980000.00000000	23075000.00000000
375	c84ca9f9-1efe-4ff4-a37d-ff9c3237b279	SP500	long	150000.00000000	300	7757.66694396	7765.42461090	292500.00000000	1.95	win	2026-08-10 07:05:00.462	2026-08-10 07:00:31.471366	2026-08-10 07:05:06.455	193	\N	f	\N	23075000.00000000	23217500.00000000
397	0c668b3d-7007-4164-bd7b-16b7521832d5	SP500	long	150000.00000000	300	7748.15836231	7755.90652067	292500.00000000	1.95	win	2026-08-13 07:05:00.772	2026-08-13 07:01:42.780192	2026-08-13 07:05:06.517	193	\N	f	\N	3000000.00000000	3142500.00000000
376	b74441c4-1858-43f0-afdc-fbfec02ce9d5	SP500	long	150000.00000000	300	7758.63871801	7766.39735673	292500.00000000	1.95	win	2026-08-10 07:05:00.398	2026-08-10 07:01:49.411315	2026-08-10 07:05:06.491	193	\N	f	\N	6152500.00000000	6295000.00000000
389	0c668b3d-7007-4164-bd7b-16b7521832d5	SP500	short	50000.00000000	300	7748.29763692	7740.54933928	97500.00000000	1.95	win	2026-08-13 04:30:00.112	2026-08-13 04:25:39.121987	2026-08-13 04:30:07.028	162	\N	f	\N	3000000.00000000	3047500.00000000
377	b74441c4-1858-43f0-afdc-fbfec02ce9d5	SP500	short	150000.00000000	300	7753.73908405	7745.98534497	292500.00000000	1.95	win	2026-08-11 01:35:00.668	2026-08-11 01:30:34.676079	2026-08-11 01:35:07.268	127	\N	f	\N	6295000.00000000	6437500.00000000
378	c84ca9f9-1efe-4ff4-a37d-ff9c3237b279	SP500	short	150000.00000000	300	7752.88212062	7745.12923850	292500.00000000	1.95	win	2026-08-11 01:35:00.485	2026-08-11 01:31:12.492615	2026-08-11 01:35:07.303	127	\N	f	\N	23217500.00000000	23360000.00000000
379	b74441c4-1858-43f0-afdc-fbfec02ce9d5	SP500	long	150000.00000000	300	7753.45033698	7761.20378732	292500.00000000	1.95	win	2026-08-11 07:05:00.378	2026-08-11 07:00:24.38856	2026-08-11 07:05:06.039	193	\N	f	\N	6437500.00000000	6580000.00000000
390	e50051bc-006a-43f5-88d8-a08f020b08be	SP500	short	10000.00000000	300	7748.98716838	7749.30757359	0.00000000	1.95	lose	2026-08-13 04:40:00.911	2026-08-13 04:38:35.919608	2026-08-13 04:40:07.083	164	\N	f	\N	5000000.00000000	4990000.00000000
380	c84ca9f9-1efe-4ff4-a37d-ff9c3237b279	SP500	long	150000.00000000	300	7753.77856446	7761.53234302	292500.00000000	1.95	win	2026-08-11 07:05:00.561	2026-08-11 07:02:02.569998	2026-08-11 07:05:06.078	193	\N	f	\N	23360000.00000000	23502500.00000000
381	c84ca9f9-1efe-4ff4-a37d-ff9c3237b279	SP500	short	300000.00000000	300	7728.60799207	7736.33660006	0.00000000	1.95	lose	2026-08-12 01:35:00.209	2026-08-12 01:30:21.220023	2026-08-12 01:35:06.566	127	\N	f	\N	23502500.00000000	23202500.00000000
398	91d27d59-645a-40d4-ae60-f2109c29d5dd	SP500	long	30000.00000000	300	7747.83595393	7755.58378988	58500.00000000	1.95	win	2026-08-13 07:05:00.071	2026-08-13 07:01:53.078514	2026-08-13 07:05:06.55	193	\N	f	\N	2000000.00000000	2028500.00000000
382	b74441c4-1858-43f0-afdc-fbfec02ce9d5	SP500	short	550000.00000000	300	7727.77040537	7720.04263496	1072500.00000000	1.95	win	2026-08-12 01:40:00.312	2026-08-12 01:35:39.32111	2026-08-12 01:40:06.606	128	\N	f	\N	6580000.00000000	7102500.00000000
391	e50051bc-006a-43f5-88d8-a08f020b08be	SP500	short	20000.00000000	300	7748.66514595	7748.44973796	39000.00000000	1.95	win	2026-08-13 05:00:00.354	2026-08-13 04:59:16.364935	2026-08-13 05:00:07.197	168	\N	f	\N	4990000.00000000	5009000.00000000
383	c84ca9f9-1efe-4ff4-a37d-ff9c3237b279	SP500	short	550000.00000000	300	7727.93420299	7720.20626879	1072500.00000000	1.95	win	2026-08-12 01:40:00.136	2026-08-12 01:35:46.144461	2026-08-12 01:40:06.64	128	\N	f	\N	23202500.00000000	23725000.00000000
384	b74441c4-1858-43f0-afdc-fbfec02ce9d5	SP500	short	200000.00000000	300	7728.01846464	7720.29044618	390000.00000000	1.95	win	2026-08-12 07:05:00.896	2026-08-12 07:00:17.907637	2026-08-12 07:05:07.378	193	\N	f	\N	7102500.00000000	7292500.00000000
385	c84ca9f9-1efe-4ff4-a37d-ff9c3237b279	SP500	short	200000.00000000	300	7728.48151238	7720.75303087	390000.00000000	1.95	win	2026-08-12 07:05:00.796	2026-08-12 07:00:42.806491	2026-08-12 07:05:07.412	193	\N	f	\N	23725000.00000000	23915000.00000000
392	e50051bc-006a-43f5-88d8-a08f020b08be	SP500	short	10000.00000000	300	7748.52182170	7749.23351988	0.00000000	1.95	lose	2026-08-13 05:10:00.086	2026-08-13 05:09:18.097417	2026-08-13 05:10:05.259	170	\N	f	\N	5009000.00000000	4999000.00000000
386	e50051bc-006a-43f5-88d8-a08f020b08be	SP500	short	50000.00000000	300	7728.26706124	7720.53879418	97500.00000000	1.95	win	2026-08-12 09:15:00.187	2026-08-12 09:11:27.197523	2026-08-12 09:15:06.435	219	\N	f	\N	5000000.00000000	5047500.00000000
387	b74441c4-1858-43f0-afdc-fbfec02ce9d5	SP500	long	150000.00000000	300	7748.72947777	7756.47820725	292500.00000000	1.95	win	2026-08-13 01:35:00.588	2026-08-13 01:30:47.59795	2026-08-13 01:35:07.005	127	\N	f	\N	7292500.00000000	7435000.00000000
388	e50051bc-006a-43f5-88d8-a08f020b08be	SP500	long	150000.00000000	300	7748.58653513	7756.33512167	292500.00000000	1.95	win	2026-08-13 01:35:00.96	2026-08-13 01:31:09.96936	2026-08-13 01:35:07.039	127	\N	f	\N	5000000.00000000	5142500.00000000
393	e50051bc-006a-43f5-88d8-a08f020b08be	SP500	long	20000.00000000	300	7748.79267633	7748.19513441	0.00000000	1.95	lose	2026-08-13 06:45:00.32	2026-08-13 06:43:37.329207	2026-08-13 06:45:06.31	189	\N	f	\N	4999000.00000000	4979000.00000000
394	b74441c4-1858-43f0-afdc-fbfec02ce9d5	SP500	long	150000.00000000	300	7748.73144638	7756.48017783	292500.00000000	1.95	win	2026-08-13 07:05:00.341	2026-08-13 07:00:36.34941	2026-08-13 07:05:06.421	193	\N	f	\N	7435000.00000000	7577500.00000000
395	c84ca9f9-1efe-4ff4-a37d-ff9c3237b279	SP500	long	150000.00000000	300	7749.00600546	7756.75501147	292500.00000000	1.95	win	2026-08-13 07:05:00.391	2026-08-13 07:00:38.398209	2026-08-13 07:05:06.451	193	\N	f	\N	23915000.00000000	24057500.00000000
396	e50051bc-006a-43f5-88d8-a08f020b08be	SP500	long	150000.00000000	300	7748.35459084	7756.10294543	292500.00000000	1.95	win	2026-08-13 07:05:00.701	2026-08-13 07:01:04.709071	2026-08-13 07:05:06.484	193	\N	f	\N	4979000.00000000	5121500.00000000
403	0c668b3d-7007-4164-bd7b-16b7521832d5	SP500	short	150000.00000000	300	7798.99000000	7791.19101000	292500.00000000	1.95	win	2026-08-14 01:35:00.368	2026-08-14 01:33:29.378222	2026-08-14 01:35:07.401	127	\N	f	\N	3142500.00000000	3285000.00000000
402	e50051bc-006a-43f5-88d8-a08f020b08be	SP500	short	150000.00000000	300	7798.66594359	7790.86727765	292500.00000000	1.95	win	2026-08-14 01:35:00.071	2026-08-14 01:31:19.078878	2026-08-14 01:35:05.322	127	\N	f	\N	5121500.00000000	5264000.00000000
409	e50051bc-006a-43f5-88d8-a08f020b08be	DOW	long	20000.00000000	300	53838.73059977	53840.44532183	39000.00000000	1.95	win	2026-08-14 04:40:00.29	2026-08-14 04:39:03.29673	2026-08-14 04:40:06.899	164	\N	f	\N	5193000.00000000	5212000.00000000
399	b74441c4-1858-43f0-afdc-fbfec02ce9d5	SP500	short	150000.00000000	300	7799.18176888	7791.38258711	292500.00000000	1.95	win	2026-08-14 01:35:00.489	2026-08-14 01:30:23.498946	2026-08-14 01:35:07.319	127	\N	f	\N	7577500.00000000	7720000.00000000
404	e50051bc-006a-43f5-88d8-a08f020b08be	SP500	long	20000.00000000	300	7799.03398149	7798.85083103	0.00000000	1.95	lose	2026-08-14 04:15:00.241	2026-08-14 04:13:19.249059	2026-08-14 04:15:06.733	159	\N	f	\N	5264000.00000000	5244000.00000000
400	c84ca9f9-1efe-4ff4-a37d-ff9c3237b279	SP500	short	150000.00000000	300	7799.46074993	7791.66128918	292500.00000000	1.95	win	2026-08-14 01:35:00.798	2026-08-14 01:30:23.806557	2026-08-14 01:35:07.343	127	\N	f	\N	24057500.00000000	24200000.00000000
401	91d27d59-645a-40d4-ae60-f2109c29d5dd	SP500	short	100000.00000000	300	7798.88395874	7791.08507478	195000.00000000	1.95	win	2026-08-14 01:35:00.816	2026-08-14 01:31:14.82529	2026-08-14 01:35:07.367	127	\N	f	\N	2000000.00000000	2095000.00000000
407	e50051bc-006a-43f5-88d8-a08f020b08be	DOW	long	20000.00000000	300	53834.60739745	53838.35689574	39000.00000000	1.95	win	2026-08-14 04:30:00.325	2026-08-14 04:27:19.332028	2026-08-14 04:30:06.812	162	\N	f	\N	5184000.00000000	5203000.00000000
405	e50051bc-006a-43f5-88d8-a08f020b08be	SP500	long	40000.00000000	300	7799.17635411	7797.80186981	0.00000000	1.95	lose	2026-08-14 04:20:00.251	2026-08-14 04:19:48.266631	2026-08-14 04:20:06.77	160	\N	f	\N	5244000.00000000	5204000.00000000
406	e50051bc-006a-43f5-88d8-a08f020b08be	SP500	long	20000.00000000	300	7799.03610623	7798.51924778	0.00000000	1.95	lose	2026-08-14 04:25:00.856	2026-08-14 04:24:48.86459	2026-08-14 04:25:06.792	161	\N	f	\N	5204000.00000000	5184000.00000000
408	e50051bc-006a-43f5-88d8-a08f020b08be	DOW	long	10000.00000000	300	53846.00231306	53842.09916701	0.00000000	1.95	lose	2026-08-14 04:35:00.375	2026-08-14 04:34:38.38461	2026-08-14 04:35:06.851	163	\N	f	\N	5203000.00000000	5193000.00000000
410	e50051bc-006a-43f5-88d8-a08f020b08be	DXY	short	10000.00000000	300	99.86388418	99.86969000	0.00000000	1.95	lose	2026-08-14 04:50:00.916	2026-08-14 04:49:50.924893	2026-08-14 04:50:06.975	166	\N	f	\N	5212000.00000000	5202000.00000000
411	e50051bc-006a-43f5-88d8-a08f020b08be	DXY	long	20000.00000000	300	99.87197378	99.87805067	39000.00000000	1.95	win	2026-08-14 04:55:00.82	2026-08-14 04:53:50.829287	2026-08-14 04:55:07.027	167	\N	f	\N	5202000.00000000	5221000.00000000
412	e50051bc-006a-43f5-88d8-a08f020b08be	DXY	long	20000.00000000	300	99.86624581	99.86056071	0.00000000	1.95	lose	2026-08-14 05:05:00.94	2026-08-14 05:04:51.948015	2026-08-14 05:05:07.087	169	\N	f	\N	5221000.00000000	5201000.00000000
413	c84ca9f9-1efe-4ff4-a37d-ff9c3237b279	SP500	long	50000.00000000	300	7798.74862757	7799.72817270	97500.00000000	1.95	win	2026-08-14 06:20:00.638	2026-08-14 06:17:22.650881	2026-08-14 06:20:06.309	184	\N	f	\N	24200000.00000000	24247500.00000000
414	0c668b3d-7007-4164-bd7b-16b7521832d5	SP500	short	600000.00000000	300	7799.01496834	7791.21595337	1170000.00000000	1.95	win	2026-08-14 06:35:00.855	2026-08-14 06:32:32.866865	2026-08-14 06:35:06.036	187	\N	f	\N	16285000.00000000	16855000.00000000
415	0c668b3d-7007-4164-bd7b-16b7521832d5	SP500	short	800000.00000000	300	7799.11790967	7791.31879176	1560000.00000000	1.95	win	2026-08-14 06:40:00.504	2026-08-14 06:36:43.51491	2026-08-14 06:40:05.68	188	\N	f	\N	16855000.00000000	17615000.00000000
416	b74441c4-1858-43f0-afdc-fbfec02ce9d5	SP500	short	200000.00000000	300	7798.20228134	7790.40407906	390000.00000000	1.95	win	2026-08-14 07:05:00.054	2026-08-14 07:00:39.066642	2026-08-14 07:05:05.88	193	\N	f	\N	7720000.00000000	7910000.00000000
438	e50051bc-006a-43f5-88d8-a08f020b08be	DOW	long	10000.00000000	300	53736.05029984	53732.41000000	0.00000000	1.95	lose	2026-08-15 15:10:00.943	2026-08-15 15:07:31.95291	2026-08-15 15:10:06.267	2	\N	f	\N	5133500.00000000	5123500.00000000
418	0c668b3d-7007-4164-bd7b-16b7521832d5	SP500	short	200000.00000000	300	7798.35284168	7790.55448884	390000.00000000	1.95	win	2026-08-14 07:05:00.82	2026-08-14 07:01:19.830231	2026-08-14 07:05:05.918	193	\N	f	\N	17615000.00000000	17805000.00000000
430	e50051bc-006a-43f5-88d8-a08f020b08be	SP500	short	10000.00000000	300	7807.00113724	7807.78120569	0.00000000	1.95	lose	2026-08-14 14:05:00.776	2026-08-14 14:03:45.788925	2026-08-14 14:05:06.017	277	\N	f	\N	5156500.00000000	5146500.00000000
419	c84ca9f9-1efe-4ff4-a37d-ff9c3237b279	SP500	short	200000.00000000	300	7798.28362509	7790.48534146	390000.00000000	1.95	win	2026-08-14 07:05:00.526	2026-08-14 07:02:08.53621	2026-08-14 07:05:05.957	193	\N	f	\N	24247500.00000000	24437500.00000000
417	91d27d59-645a-40d4-ae60-f2109c29d5dd	SP500	short	100000.00000000	300	7799.21639093	7791.41717454	195000.00000000	1.95	win	2026-08-14 07:05:00.928	2026-08-14 07:01:14.936677	2026-08-14 07:05:06.914	193	\N	f	\N	2095000.00000000	2190000.00000000
420	e50051bc-006a-43f5-88d8-a08f020b08be	SP500	long	20000.00000000	300	7799.04353641	7798.70803578	0.00000000	1.95	lose	2026-08-14 09:35:00.668	2026-08-14 09:31:48.680752	2026-08-14 09:35:07.224	223	\N	f	\N	5201000.00000000	5181000.00000000
431	e50051bc-006a-43f5-88d8-a08f020b08be	SP500	long	20000.00000000	300	7785.98958237	7785.68475633	0.00000000	1.95	lose	2026-08-14 23:30:00.454	2026-08-14 23:29:53.46619	2026-08-14 23:30:06.612	102	\N	f	\N	5146500.00000000	5126500.00000000
421	e50051bc-006a-43f5-88d8-a08f020b08be	SP500	long	20000.00000000	300	7798.77156103	7798.81723859	39000.00000000	1.95	win	2026-08-14 10:20:00.123	2026-08-14 10:19:50.133278	2026-08-14 10:20:05.532	232	\N	f	\N	5181000.00000000	5200000.00000000
422	e50051bc-006a-43f5-88d8-a08f020b08be	SP500	long	20000.00000000	300	7798.85715170	7799.21474328	39000.00000000	1.95	win	2026-08-14 10:25:00.259	2026-08-14 10:23:29.27018	2026-08-14 10:25:05.578	233	\N	f	\N	5200000.00000000	5219000.00000000
423	e50051bc-006a-43f5-88d8-a08f020b08be	SP500	long	30000.00000000	300	7799.34768844	7799.26103491	0.00000000	1.95	lose	2026-08-14 10:35:00.63	2026-08-14 10:34:46.640616	2026-08-14 10:35:07.646	235	\N	f	\N	5219000.00000000	5189000.00000000
432	e50051bc-006a-43f5-88d8-a08f020b08be	SP500	long	20000.00000000	300	7785.85589157	7785.65643608	0.00000000	1.95	lose	2026-08-14 23:35:00.231	2026-08-14 23:31:55.250816	2026-08-14 23:35:06.638	103	\N	f	\N	5126500.00000000	5106500.00000000
424	e50051bc-006a-43f5-88d8-a08f020b08be	SP500	long	30000.00000000	300	7798.81799359	7798.78810615	0.00000000	1.95	lose	2026-08-14 10:40:00.879	2026-08-14 10:39:49.888431	2026-08-14 10:40:07.684	236	\N	f	\N	5189000.00000000	5159000.00000000
425	e50051bc-006a-43f5-88d8-a08f020b08be	SP500	long	20000.00000000	300	7799.80352008	7799.02260716	0.00000000	1.95	lose	2026-08-14 10:45:00.012	2026-08-14 10:43:41.02656	2026-08-14 10:45:05.722	237	\N	f	\N	5159000.00000000	5139000.00000000
439	e50051bc-006a-43f5-88d8-a08f020b08be	DOW	short	20000.00000000	300	53726.77580123	53732.41000000	0.00000000	1.95	lose	2026-08-15 16:15:00.36	2026-08-15 16:14:47.371994	2026-08-15 16:15:06.631	15	\N	f	\N	5123500.00000000	5103500.00000000
426	e50051bc-006a-43f5-88d8-a08f020b08be	SP500	long	20000.00000000	300	7798.39482964	7799.56448590	39000.00000000	1.95	win	2026-08-14 11:05:00.842	2026-08-14 11:02:45.855914	2026-08-14 11:05:05.894	241	\N	f	\N	5139000.00000000	5158000.00000000
433	e50051bc-006a-43f5-88d8-a08f020b08be	SP500	long	20000.00000000	300	7785.39115905	7785.46312507	39000.00000000	1.95	win	2026-08-14 23:40:00.192	2026-08-14 23:38:11.201643	2026-08-14 23:40:06.678	104	\N	f	\N	5106500.00000000	5125500.00000000
427	e50051bc-006a-43f5-88d8-a08f020b08be	SP500	long	10000.00000000	300	7805.71584742	7805.44350068	0.00000000	1.95	lose	2026-08-14 13:45:00.638	2026-08-14 13:43:59.648364	2026-08-14 13:45:05.825	273	\N	f	\N	5158000.00000000	5148000.00000000
428	e50051bc-006a-43f5-88d8-a08f020b08be	SP500	long	20000.00000000	300	7808.00713119	7807.25843469	0.00000000	1.95	lose	2026-08-14 13:55:00.826	2026-08-14 13:54:48.83733	2026-08-14 13:55:05.928	275	\N	f	\N	5148000.00000000	5128000.00000000
429	e50051bc-006a-43f5-88d8-a08f020b08be	SP500	long	30000.00000000	300	7806.64135541	7806.99028709	58500.00000000	1.95	win	2026-08-14 14:00:00.447	2026-08-14 13:57:11.459346	2026-08-14 14:00:05.977	276	\N	f	\N	5128000.00000000	5156500.00000000
434	e50051bc-006a-43f5-88d8-a08f020b08be	SP500	short	20000.00000000	300	7785.93567911	7785.80916686	39000.00000000	1.95	win	2026-08-15 00:45:00.699	2026-08-15 00:44:49.710487	2026-08-15 00:45:07.708	117	\N	f	\N	5125500.00000000	5144500.00000000
447	0c668b3d-7007-4164-bd7b-16b7521832d5	SP500	short	1000000.00000000	300	7745.24099641	7737.49575541	1950000.00000000	1.95	win	2026-08-18 01:10:00.292	2026-08-18 01:07:06.302161	2026-08-18 01:10:06.628	122	\N	f	\N	18565000.00000000	19515000.00000000
435	e50051bc-006a-43f5-88d8-a08f020b08be	SP500	long	20000.00000000	300	7786.12427489	7786.02052213	0.00000000	1.95	lose	2026-08-15 14:20:00.933	2026-08-15 14:19:05.944826	2026-08-15 14:20:05.986	280	\N	f	\N	5144500.00000000	5124500.00000000
440	e50051bc-006a-43f5-88d8-a08f020b08be	SP500	long	20000.00000000	300	7785.04066112	7785.76000000	39000.00000000	1.95	win	2026-08-15 16:20:00.812	2026-08-15 16:19:26.82209	2026-08-15 16:20:06.668	16	\N	f	\N	5103500.00000000	5122500.00000000
436	e50051bc-006a-43f5-88d8-a08f020b08be	SP500	short	20000.00000000	300	7785.66740522	7784.74948366	39000.00000000	1.95	win	2026-08-15 14:25:00.32	2026-08-15 14:24:51.334215	2026-08-15 14:25:06.008	281	\N	f	\N	5124500.00000000	5143500.00000000
437	e50051bc-006a-43f5-88d8-a08f020b08be	SP500	long	10000.00000000	300	7786.56690351	7785.76000000	0.00000000	1.95	lose	2026-08-15 15:05:00.547	2026-08-15 15:02:17.559113	2026-08-15 15:05:06.228	1	\N	f	\N	5143500.00000000	5133500.00000000
444	e50051bc-006a-43f5-88d8-a08f020b08be	SP500	short	20000.00000000	300	7785.40863885	7786.13022227	0.00000000	1.95	lose	2026-08-16 00:35:00.128	2026-08-16 00:34:18.142012	2026-08-16 00:35:06.222	115	\N	f	\N	5062500.00000000	5042500.00000000
441	e50051bc-006a-43f5-88d8-a08f020b08be	SP500	short	20000.00000000	300	7785.33430239	7785.76000000	0.00000000	1.95	lose	2026-08-15 16:30:00.118	2026-08-15 16:28:03.129419	2026-08-15 16:30:06.776	18	\N	f	\N	5122500.00000000	5102500.00000000
442	e50051bc-006a-43f5-88d8-a08f020b08be	SP500	long	20000.00000000	300	7785.67440629	7785.64921592	0.00000000	1.95	lose	2026-08-15 23:55:00.878	2026-08-15 23:54:17.889821	2026-08-15 23:55:07.763	107	\N	f	\N	5102500.00000000	5082500.00000000
445	e50051bc-006a-43f5-88d8-a08f020b08be	SP500	long	20000.00000000	300	7785.76000000	7786.58798070	39000.00000000	1.95	win	2026-08-16 00:40:00.382	2026-08-16 00:39:22.392965	2026-08-16 00:40:06.265	116	\N	f	\N	5042500.00000000	5061500.00000000
443	e50051bc-006a-43f5-88d8-a08f020b08be	SP500	long	20000.00000000	300	7786.31115791	7786.03757318	0.00000000	1.95	lose	2026-08-16 00:00:00.841	2026-08-15 23:57:12.853094	2026-08-16 00:00:07.818	108	\N	f	\N	5082500.00000000	5062500.00000000
446	0c668b3d-7007-4164-bd7b-16b7521832d5	SP500	short	800000.00000000	300	7744.94988375	7737.20493387	1560000.00000000	1.95	win	2026-08-18 01:05:00.452	2026-08-18 01:03:49.463339	2026-08-18 01:05:06.556	121	\N	f	\N	17805000.00000000	18565000.00000000
449	b74441c4-1858-43f0-afdc-fbfec02ce9d5	SP500	short	300000.00000000	300	7745.60333434	7753.34893767	0.00000000	1.95	lose	2026-08-18 01:35:00.207	2026-08-18 01:31:39.218261	2026-08-18 01:35:06.994	127	\N	f	\N	7910000.00000000	7610000.00000000
448	e50051bc-006a-43f5-88d8-a08f020b08be	SP500	short	300000.00000000	300	7745.37193901	7753.11731095	0.00000000	1.95	lose	2026-08-18 01:35:00.109	2026-08-18 01:31:34.121194	2026-08-18 01:35:06.951	127	\N	f	\N	5061500.00000000	4761500.00000000
450	0c668b3d-7007-4164-bd7b-16b7521832d5	SP500	short	300000.00000000	300	7745.12705419	7752.87218124	0.00000000	1.95	lose	2026-08-18 01:35:00.029	2026-08-18 01:32:05.040389	2026-08-18 01:35:07.033	127	\N	f	\N	19515000.00000000	19215000.00000000
451	b74441c4-1858-43f0-afdc-fbfec02ce9d5	SP500	long	450000.00000000	300	7745.24291437	7737.49767146	0.00000000	1.95	lose	2026-08-18 01:40:00.29	2026-08-18 01:35:43.302614	2026-08-18 01:40:06.983	128	\N	f	\N	7610000.00000000	7160000.00000000
452	e50051bc-006a-43f5-88d8-a08f020b08be	SP500	long	4500000.00000000	300	7744.70313308	7736.95842995	0.00000000	1.95	lose	2026-08-18 01:40:00.226	2026-08-18 01:36:20.237323	2026-08-18 01:40:07.022	128	\N	f	\N	4761500.00000000	261500.00000000
453	0c668b3d-7007-4164-bd7b-16b7521832d5	SP500	long	450000.00000000	300	7745.34916520	7737.60381603	0.00000000	1.95	lose	2026-08-18 01:40:00.087	2026-08-18 01:37:32.09716	2026-08-18 01:40:07.059	128	\N	f	\N	19215000.00000000	18765000.00000000
455	e50051bc-006a-43f5-88d8-a08f020b08be	SP500	long	260000.00000000	300	7744.85224483	7752.59709707	507000.00000000	1.95	win	2026-08-18 01:45:00.955	2026-08-18 01:42:03.965366	2026-08-18 01:45:07.048	129	\N	f	\N	261500.00000000	508500.00000000
456	0c668b3d-7007-4164-bd7b-16b7521832d5	SP500	long	1050000.00000000	300	7744.77372360	7752.51849732	2047500.00000000	1.95	win	2026-08-18 01:45:00.2	2026-08-18 01:42:54.209562	2026-08-18 01:45:07.077	129	\N	f	\N	18765000.00000000	19762500.00000000
454	b74441c4-1858-43f0-afdc-fbfec02ce9d5	SP500	long	1050000.00000000	300	7745.06000000	7752.80506000	2047500.00000000	1.95	win	2026-08-18 01:45:00.329	2026-08-18 01:41:42.339099	2026-08-18 01:45:07.017	129	\N	f	\N	7160000.00000000	8157500.00000000
457	b74441c4-1858-43f0-afdc-fbfec02ce9d5	SP500	short	300000.00000000	300	7745.03549688	7737.29046138	585000.00000000	1.95	win	2026-08-18 07:05:00.938	2026-08-18 07:00:31.951105	2026-08-18 07:05:06.906	193	\N	f	\N	8157500.00000000	8442500.00000000
458	0c668b3d-7007-4164-bd7b-16b7521832d5	SP500	short	300000.00000000	300	7745.12975383	7737.38462408	585000.00000000	1.95	win	2026-08-18 07:05:00.12	2026-08-18 07:02:23.131514	2026-08-18 07:05:06.946	193	\N	f	\N	19762500.00000000	20047500.00000000
471	0c668b3d-7007-4164-bd7b-16b7521832d5	SP500	long	1000000.00000000	300	7707.86142029	7708.34134131	1950000.00000000	1.95	win	2026-08-20 01:05:00.239	2026-08-20 01:03:10.249012	2026-08-20 01:05:07.032	121	\N	f	\N	22327500.00000000	23277500.00000000
459	91d27d59-645a-40d4-ae60-f2109c29d5dd	SP500	short	3000000.00000000	300	7745.47581882	7737.73034300	5850000.00000000	1.95	win	2026-08-18 07:10:00.405	2026-08-18 07:07:26.415598	2026-08-18 07:10:06.959	194	\N	f	\N	52000000.00000000	54850000.00000000
460	91d27d59-645a-40d4-ae60-f2109c29d5dd	SP500	short	4000000.00000000	300	7744.66812219	7736.92345407	7800000.00000000	1.95	win	2026-08-18 07:15:00.847	2026-08-18 07:11:47.857917	2026-08-18 07:15:07.019	195	\N	f	\N	54850000.00000000	58650000.00000000
480	e50051bc-006a-43f5-88d8-a08f020b08be	SP500	short	400000.00000000	300	7707.37846599	7699.67108752	780000.00000000	1.95	win	2026-08-20 01:40:00.17	2026-08-20 01:37:05.178601	2026-08-20 01:40:05.644	128	\N	f	\N	508500.00000000	888500.00000000
461	0c668b3d-7007-4164-bd7b-16b7521832d5	SP500	short	1000000.00000000	300	7692.05343247	7684.36137904	1950000.00000000	1.95	win	2026-08-19 01:05:00.191	2026-08-19 01:01:57.201908	2026-08-19 01:05:06.518	121	\N	f	\N	20047500.00000000	20997500.00000000
472	0c668b3d-7007-4164-bd7b-16b7521832d5	SP500	short	2500000.00000000	300	7707.82737971	7700.11955233	4875000.00000000	1.95	win	2026-08-20 01:15:00.299	2026-08-20 01:12:04.308037	2026-08-20 01:15:07.183	123	\N	f	\N	23277500.00000000	25652500.00000000
462	0c668b3d-7007-4164-bd7b-16b7521832d5	SP500	long	1000000.00000000	300	7691.71535812	7699.40707348	1950000.00000000	1.95	win	2026-08-19 01:10:00.532	2026-08-19 01:07:25.542606	2026-08-19 01:10:06.578	122	\N	f	\N	20997500.00000000	21947500.00000000
463	c84ca9f9-1efe-4ff4-a37d-ff9c3237b279	SP500	short	200000.00000000	300	7691.55869376	7683.86713507	390000.00000000	1.95	win	2026-08-19 01:35:00.328	2026-08-19 01:31:47.347161	2026-08-19 01:35:06.933	127	\N	f	\N	24437500.00000000	24627500.00000000
464	b74441c4-1858-43f0-afdc-fbfec02ce9d5	SP500	short	200000.00000000	300	7692.19331783	7684.50112451	390000.00000000	1.95	win	2026-08-19 01:35:00.635	2026-08-19 01:32:09.647762	2026-08-19 01:35:06.974	127	\N	f	\N	8442500.00000000	8632500.00000000
465	0c668b3d-7007-4164-bd7b-16b7521832d5	SP500	short	200000.00000000	300	7690.89717787	7683.20628069	390000.00000000	1.95	win	2026-08-19 01:35:00.707	2026-08-19 01:32:25.718485	2026-08-19 01:35:07.016	127	\N	f	\N	21947500.00000000	22137500.00000000
466	c84ca9f9-1efe-4ff4-a37d-ff9c3237b279	SP500	long	200000.00000000	300	7692.69875134	7700.39145009	390000.00000000	1.95	win	2026-08-19 07:05:00.08	2026-08-19 07:00:45.094276	2026-08-19 07:05:05.423	193	\N	f	\N	24627500.00000000	24817500.00000000
467	b74441c4-1858-43f0-afdc-fbfec02ce9d5	SP500	long	200000.00000000	300	7692.13167054	7699.82380221	390000.00000000	1.95	win	2026-08-19 07:05:00.439	2026-08-19 07:00:55.451595	2026-08-19 07:05:05.463	193	\N	f	\N	8632500.00000000	8822500.00000000
474	b74441c4-1858-43f0-afdc-fbfec02ce9d5	SP500	short	200000.00000000	300	7708.10784750	7715.81595535	0.00000000	1.95	lose	2026-08-20 01:35:00.412	2026-08-20 01:30:46.421564	2026-08-20 01:35:05.544	127	\N	f	\N	8822500.00000000	8622500.00000000
468	91d27d59-645a-40d4-ae60-f2109c29d5dd	SP500	long	4000000.00000000	300	7692.81708345	7700.50990053	7800000.00000000	1.95	win	2026-08-19 07:05:00.263	2026-08-19 07:01:10.276015	2026-08-19 07:05:05.509	193	\N	f	\N	98650000.00000000	102450000.00000000
477	b74441c4-1858-43f0-afdc-fbfec02ce9d5	SP500	short	400000.00000000	300	7708.13917566	7700.43103648	780000.00000000	1.95	win	2026-08-20 01:40:00.784	2026-08-20 01:36:10.79233	2026-08-20 01:40:07.566	128	\N	f	\N	8622500.00000000	9002500.00000000
469	0c668b3d-7007-4164-bd7b-16b7521832d5	SP500	long	200000.00000000	300	7691.81133287	7699.50314420	390000.00000000	1.95	win	2026-08-19 07:05:00.578	2026-08-19 07:01:31.589714	2026-08-19 07:05:07.424	193	\N	f	\N	22137500.00000000	22327500.00000000
476	0c668b3d-7007-4164-bd7b-16b7521832d5	SP500	short	200000.00000000	300	7708.86614899	7716.57501514	0.00000000	1.95	lose	2026-08-20 01:35:00.352	2026-08-20 01:31:36.361474	2026-08-20 01:35:05.577	127	\N	f	\N	25652500.00000000	25452500.00000000
470	91d27d59-645a-40d4-ae60-f2109c29d5dd	SP500	short	6000000.00000000	300	7692.11394404	7684.42183010	11700000.00000000	1.95	win	2026-08-19 07:10:00.717	2026-08-19 07:06:57.729094	2026-08-19 07:10:07.456	194	\N	f	\N	102450000.00000000	108150000.00000000
473	c84ca9f9-1efe-4ff4-a37d-ff9c3237b279	SP500	short	200000.00000000	300	7707.37940436	7715.08678376	0.00000000	1.95	lose	2026-08-20 01:35:00.596	2026-08-20 01:30:39.606471	2026-08-20 01:35:07.542	127	\N	f	\N	24817500.00000000	24617500.00000000
475	91d27d59-645a-40d4-ae60-f2109c29d5dd	SP500	short	200000.00000000	300	7707.66985797	7715.37752783	0.00000000	1.95	lose	2026-08-20 01:35:00.642	2026-08-20 01:31:22.651134	2026-08-20 01:35:07.576	127	\N	f	\N	108150000.00000000	107950000.00000000
481	e50051bc-006a-43f5-88d8-a08f020b08be	SP500	long	10000.00000000	300	7708.24861816	7707.41083310	0.00000000	1.95	lose	2026-08-20 02:40:00.091	2026-08-20 02:39:34.100182	2026-08-20 02:40:06.199	140	\N	f	\N	888500.00000000	878500.00000000
478	91d27d59-645a-40d4-ae60-f2109c29d5dd	SP500	short	400000.00000000	300	7707.98000000	7700.27202000	780000.00000000	1.95	win	2026-08-20 01:40:00.319	2026-08-20 01:36:45.327259	2026-08-20 01:40:05.571	128	\N	f	\N	107950000.00000000	108330000.00000000
479	0c668b3d-7007-4164-bd7b-16b7521832d5	SP500	short	400000.00000000	300	7707.77205998	7700.06428792	780000.00000000	1.95	win	2026-08-20 01:40:00.078	2026-08-20 01:37:00.087575	2026-08-20 01:40:05.608	128	\N	f	\N	25452500.00000000	25832500.00000000
482	e50051bc-006a-43f5-88d8-a08f020b08be	SP500	long	20000.00000000	300	7707.11070814	7708.03239554	39000.00000000	1.95	win	2026-08-20 02:45:00.084	2026-08-20 02:41:26.093558	2026-08-20 02:45:06.266	141	\N	f	\N	878500.00000000	897500.00000000
483	e50051bc-006a-43f5-88d8-a08f020b08be	SP500	long	10000.00000000	300	7707.43830409	7707.80803238	19500.00000000	1.95	win	2026-08-20 02:50:00.75	2026-08-20 02:48:08.76557	2026-08-20 02:50:06.311	142	\N	f	\N	897500.00000000	907000.00000000
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
319	SP500	300	1786276500	7757.641082	7758.598882	7756.427811	7757.558183
320	DOW	300	1786276500	54034.183208	54046.679763	54029.889027	54036.631162
321	DXY	300	1786276500	99.603189	99.613324	99.590249	99.602177
1	SP500	300	1786274100	7757.640000	7759.082068	7756.606203	7757.640000
2	DOW	300	1786274100	54036.930000	54041.474266	54028.329251	54036.930000
3	DXY	300	1786274100	99.604000	99.611398	99.595563	99.604000
742	SP500	300	1786277400	7757.537495	7759.175192	7756.042945	7757.684498
743	DOW	300	1786277400	54035.402992	54041.733185	54027.772232	54029.432331
744	DXY	300	1786277400	99.602059	99.615116	99.597350	99.603996
139	SP500	300	1786276200	7757.458284	7758.861316	7756.321354	7757.471963
140	DOW	300	1786276200	54036.729971	54042.960984	54026.039132	54034.980784
141	DXY	300	1786276200	99.605218	99.612921	99.593313	99.602912
4014	DXY	300	1786283100	99.597843	99.613477	99.590412	99.603497
3835	SP500	300	1786282800	7758.659281	7759.140843	7755.705453	7757.340562
3836	DOW	300	1786282800	54033.914139	54048.895351	54029.742106	54031.789486
3658	SP500	300	1786282500	7757.016923	7759.116502	7756.001683	7758.638166
3659	DOW	300	1786282500	54039.363804	54045.970591	54018.968443	54033.706465
2395	SP500	300	1786280400	7757.147235	7759.777496	7755.942114	7757.450983
2396	DOW	300	1786280400	54034.262409	54045.891097	54025.999239	54034.925669
2397	DXY	300	1786280400	99.598222	99.615479	99.588652	99.607073
1495	SP500	300	1786278900	7758.447350	7759.022574	7756.150520	7758.105933
1496	DOW	300	1786278900	54037.739508	54046.155338	54026.183520	54034.298077
1497	DXY	300	1786278900	99.605361	99.620665	99.593687	99.603114
946	SP500	300	1786278000	7758.273191	7759.360233	7755.892187	7757.260042
947	DOW	300	1786278000	54033.779925	54045.542542	54028.280947	54036.669097
948	DXY	300	1786278000	99.606586	99.613476	99.592278	99.609128
2212	SP500	300	1786280100	7756.282664	7758.760827	7755.843906	7756.921517
1315	SP500	300	1786278600	7758.452733	7759.642087	7756.375862	7758.715030
1316	DOW	300	1786278600	54035.405923	54049.122776	54030.503719	54039.372564
1317	DXY	300	1786278600	99.599403	99.616309	99.591434	99.605611
2213	DOW	300	1786280100	54041.206755	54047.753931	54028.265022	54035.192719
2214	DXY	300	1786280100	99.597200	99.613678	99.594759	99.598932
1675	SP500	300	1786279200	7758.102581	7758.679225	7756.147056	7757.558562
1676	DOW	300	1786279200	54034.060047	54043.170570	54023.569432	54039.153017
1677	DXY	300	1786279200	99.600921	99.618053	99.593018	99.608084
1135	SP500	300	1786278300	7757.148515	7759.079696	7756.772829	7758.198315
1136	DOW	300	1786278300	54037.466186	54043.604425	54025.892414	54035.582444
1137	DXY	300	1786278300	99.609586	99.613345	99.593207	99.600009
2755	SP500	300	1786281000	7757.779810	7759.233841	7756.253653	7757.195008
2756	DOW	300	1786281000	54032.014486	54045.201142	54026.604448	54041.747735
2757	DXY	300	1786281000	99.602145	99.615163	99.594002	99.601886
889	SP500	300	1786277700	7757.640000	7759.325822	7756.966960	7757.986983
890	DOW	300	1786277700	54036.930000	54042.439499	54027.473436	54033.820546
891	DXY	300	1786277700	99.604000	99.612648	99.598321	99.604964
3298	SP500	300	1786281900	7757.103744	7759.220633	7756.347114	7757.386719
3299	DOW	300	1786281900	54039.130729	54045.976143	54025.989384	54041.312781
3300	DXY	300	1786281900	99.602458	99.616529	99.596739	99.601450
2035	SP500	300	1786279800	7758.840859	7759.255240	7755.348495	7756.241036
2036	DOW	300	1786279800	54032.740931	54047.696852	54028.000334	54040.874251
2037	DXY	300	1786279800	99.600061	99.615675	99.595820	99.598813
1855	SP500	300	1786279500	7757.299880	7759.135766	7756.172464	7758.836861
1856	DOW	300	1786279500	54037.834848	54043.943745	54026.098624	54034.376941
1857	DXY	300	1786279500	99.610037	99.619272	99.590807	99.601758
3837	DXY	300	1786282800	99.612780	99.615362	99.593562	99.599385
3478	SP500	300	1786282200	7757.416831	7758.982003	7756.017285	7756.739742
3118	SP500	300	1786281600	7756.772266	7758.536973	7755.899946	7757.373462
2575	SP500	300	1786280700	7757.738355	7758.847910	7755.877177	7758.052033
2576	DOW	300	1786280700	54036.367728	54052.567588	54025.068112	54030.914000
2577	DXY	300	1786280700	99.609383	99.613296	99.590637	99.599703
3119	DOW	300	1786281600	54038.040773	54045.496229	54026.690703	54039.033516
3479	DOW	300	1786282200	54039.433418	54047.069650	54028.564825	54038.741363
3480	DXY	300	1786282200	99.601166	99.610942	99.595969	99.602057
2935	SP500	300	1786281300	7757.304497	7759.244451	7756.147965	7756.870226
2936	DOW	300	1786281300	54040.193751	54045.492174	54028.897265	54039.595214
2937	DXY	300	1786281300	99.603475	99.612744	99.592130	99.603742
3120	DXY	300	1786281600	99.602399	99.613945	99.596142	99.604304
4012	SP500	300	1786283100	7757.484949	7759.537605	7756.304333	7757.615601
3660	DXY	300	1786282500	99.603377	99.615316	99.595107	99.610396
4013	DOW	300	1786283100	54032.882169	54044.933805	54025.960527	54037.270526
4194	DXY	300	1786283400	99.603734	99.613302	99.595147	99.606243
4374	DXY	300	1786283700	99.605771	99.614501	99.589579	99.597572
4192	SP500	300	1786283400	7757.488554	7759.243337	7756.624859	7758.079971
4193	DOW	300	1786283400	54037.003464	54044.754083	54023.291338	54037.799606
4554	DXY	300	1786284000	99.595109	99.619719	99.595108	99.599145
4372	SP500	300	1786283700	7758.280316	7759.227564	7756.180643	7757.401664
4373	DOW	300	1786283700	54037.920693	54046.947908	54026.330981	54037.973569
4552	SP500	300	1786284000	7757.115300	7759.036587	7756.222400	7757.788316
4553	DOW	300	1786284000	54038.870693	54048.351924	54026.150522	54038.769475
5456	DOW	300	1786285500	54038.108811	54044.715851	54029.787605	54040.906557
5457	DXY	300	1786285500	99.602300	99.615730	99.593319	99.610920
5098	SP500	300	1786284900	7756.957290	7759.122965	7755.887142	7757.658508
5099	DOW	300	1786284900	54033.364679	54044.406501	54029.733417	54032.291970
5100	DXY	300	1786284900	99.599126	99.615354	99.592636	99.603440
8880	DXY	300	1786291200	99.608873	99.619368	99.592642	99.600884
8695	SP500	300	1786290900	7757.430322	7759.314277	7755.946021	7757.356520
4732	SP500	300	1786284300	7757.814049	7758.690703	7756.327150	7757.690753
4733	DOW	300	1786284300	54040.703853	54045.832087	54021.579011	54036.390021
4734	DXY	300	1786284300	99.600882	99.613098	99.593761	99.594236
7255	SP500	300	1786288500	7757.499209	7758.969110	7755.807471	7757.228265
6712	SP500	300	1786287600	7757.365208	7759.027133	7756.021730	7758.052909
6713	DOW	300	1786287600	54038.799841	54047.059649	54029.391329	54039.505016
6714	DXY	300	1786287600	99.600884	99.615470	99.592026	99.603092
7256	DOW	300	1786288500	54033.698467	54046.713604	54026.856226	54034.861855
7257	DXY	300	1786288500	99.600808	99.615369	99.591501	99.605475
6892	SP500	300	1786287900	7757.990800	7758.837359	7756.370540	7757.843338
6893	DOW	300	1786287900	54038.316434	54048.999906	54028.298316	54037.739058
6894	DXY	300	1786287900	99.605284	99.614302	99.592005	99.598970
6532	SP500	300	1786287300	7757.395287	7759.052423	7756.379696	7757.577434
6533	DOW	300	1786287300	54037.268500	54052.795979	54029.947343	54038.441947
6534	DXY	300	1786287300	99.603945	99.613462	99.595325	99.600612
5992	SP500	300	1786286400	7757.557521	7759.445205	7756.458130	7757.430087
5993	DOW	300	1786286400	54034.558252	54048.198746	54030.302991	54043.088302
5994	DXY	300	1786286400	99.603795	99.619542	99.595951	99.603006
5275	SP500	300	1786285200	7757.532448	7758.960773	7755.912415	7757.130532
5276	DOW	300	1786285200	54031.618642	54045.230818	54027.733780	54039.028822
5277	DXY	300	1786285200	99.605553	99.616863	99.589271	99.601664
5809	SP500	300	1786286100	7756.938420	7759.072865	7756.243083	7757.751103
5810	DOW	300	1786286100	54033.722753	54051.605242	54025.464326	54035.695486
5811	DXY	300	1786286100	99.608504	99.617443	99.590309	99.601587
4915	SP500	300	1786284600	7757.552254	7759.303718	7755.998032	7757.209904
4916	DOW	300	1786284600	54038.153241	54047.623581	54028.856023	54035.373695
4917	DXY	300	1786284600	99.595626	99.616354	99.592683	99.598080
5635	SP500	300	1786285800	7758.090636	7759.015822	7756.465044	7757.190383
5636	DOW	300	1786285800	54041.863740	54045.921203	54027.997323	54035.590013
5637	DXY	300	1786285800	99.609295	99.612642	99.593202	99.607967
8335	SP500	300	1786290300	7757.610139	7758.930651	7756.773949	7757.482656
8336	DOW	300	1786290300	54032.695243	54045.640997	54026.450055	54038.848631
7432	SP500	300	1786288800	7757.481045	7758.661993	7756.491583	7757.721793
7433	DOW	300	1786288800	54033.157390	54046.577382	54026.839481	54036.156459
6172	SP500	300	1786286700	7757.643453	7758.799016	7756.148902	7757.968226
6173	DOW	300	1786286700	54042.878006	54051.214586	54027.740620	54035.273274
6174	DXY	300	1786286700	99.602665	99.613742	99.593326	99.606274
7434	DXY	300	1786288800	99.604449	99.613475	99.593832	99.602551
8337	DXY	300	1786290300	99.609950	99.611748	99.592855	99.602252
7075	SP500	300	1786288200	7757.845459	7759.052778	7756.859154	7757.792853
7076	DOW	300	1786288200	54036.179158	54043.812925	54027.294537	54035.309598
7077	DXY	300	1786288200	99.598235	99.616445	99.592615	99.601566
5455	SP500	300	1786285500	7757.079142	7758.995097	7756.116650	7758.323823
8696	DOW	300	1786290900	54034.492386	54046.055672	54027.523695	54038.110612
6352	SP500	300	1786287000	7757.853646	7758.858892	7755.792285	7757.536858
6353	DOW	300	1786287000	54034.888784	54046.204503	54026.169981	54037.830505
6354	DXY	300	1786287000	99.606207	99.611046	99.588719	99.605135
8515	SP500	300	1786290600	7757.516975	7758.928430	7756.634940	7757.731957
8516	DOW	300	1786290600	54040.755565	54047.793468	54024.559624	54035.538013
8517	DXY	300	1786290600	99.602408	99.616652	99.586898	99.601915
8697	DXY	300	1786290900	99.600600	99.614172	99.589448	99.607967
8155	SP500	300	1786290000	7758.149998	7758.676523	7756.523472	7757.754068
8156	DOW	300	1786290000	54035.362077	54044.468698	54026.429415	54032.908173
8157	DXY	300	1786290000	99.605734	99.616181	99.592822	99.608027
7612	SP500	300	1786289100	7757.686921	7758.913946	7755.993304	7757.463657
7613	DOW	300	1786289100	54036.203895	54045.956039	54024.114641	54033.796450
7614	DXY	300	1786289100	99.604519	99.616246	99.595311	99.604933
7972	SP500	300	1786289700	7757.503569	7759.456168	7755.746021	7757.969359
7973	DOW	300	1786289700	54034.971450	54049.152262	54030.068750	54034.872623
7974	DXY	300	1786289700	99.607547	99.617252	99.593842	99.604596
7792	SP500	300	1786289400	7757.587178	7759.167887	7756.252348	7757.803694
7793	DOW	300	1786289400	54033.471586	54047.403563	54025.903981	54036.941347
7794	DXY	300	1786289400	99.606173	99.616921	99.595877	99.606885
9058	SP500	300	1786291500	7757.948281	7759.082229	7755.951495	7758.159375
9059	DOW	300	1786291500	54040.289711	54047.194850	54025.877853	54035.218550
9060	DXY	300	1786291500	99.602446	99.617146	99.590372	99.607246
9420	DXY	300	1786292100	99.603405	99.615624	99.593479	99.603157
9600	DXY	300	1786292400	99.603431	99.613755	99.590860	99.602246
9418	SP500	300	1786292100	7758.117262	7759.050302	7756.769031	7757.599447
8878	SP500	300	1786291200	7757.564299	7759.278861	7756.037836	7757.913116
8879	DOW	300	1786291200	54038.596587	54044.919733	54026.644341	54038.147794
9238	SP500	300	1786291800	7757.955858	7759.072878	7755.652655	7757.934515
9419	DOW	300	1786292100	54034.354026	54047.852779	54030.743194	54039.523805
9239	DOW	300	1786291800	54034.936998	54043.873480	54025.693677	54034.068726
9240	DXY	300	1786291800	99.608869	99.615368	99.590699	99.601813
9779	DOW	300	1786292700	54038.025174	54045.221109	54028.704490	54038.434263
9598	SP500	300	1786292400	7757.480266	7759.088741	7755.838470	7757.920188
9599	DOW	300	1786292400	54038.840158	54045.547519	54025.840646	54038.582763
9780	DXY	300	1786292700	99.599764	99.610757	99.593415	99.605518
9955	SP500	300	1786293000	7757.547667	7758.997914	7756.474531	7757.449925
9778	SP500	300	1786292700	7758.023759	7758.950033	7756.781683	7757.343602
9956	DOW	300	1786293000	54037.457946	54043.959233	54025.925135	54036.372868
13929	DXY	300	1786299600	99.612180	99.618036	99.594130	99.602859
13744	SP500	300	1786299300	7757.640000	7758.428640	7755.972526	7756.737215
13198	SP500	300	1786298400	7757.640000	7759.146404	7756.016775	7757.640000
13199	DOW	300	1786298400	54036.930000	54045.670237	54028.192412	54036.930000
13200	DXY	300	1786298400	99.604000	99.615261	99.590598	99.604000
10678	SP500	300	1786294200	7757.517654	7758.629900	7756.409872	7757.330996
10679	DOW	300	1786294200	54039.624201	54047.187662	54026.956201	54038.780741
10680	DXY	300	1786294200	99.603341	99.619751	99.593707	99.605594
12115	SP500	300	1786296600	7757.722259	7759.305694	7756.314428	7757.366577
12116	DOW	300	1786296600	54032.899450	54047.054325	54027.537853	54037.562851
12117	DXY	300	1786296600	99.605262	99.615348	99.586937	99.605223
10315	SP500	300	1786293600	7756.994357	7759.172429	7755.899167	7757.511877
10316	DOW	300	1786293600	54035.435926	54045.710343	54023.078640	54036.062957
10317	DXY	300	1786293600	99.601348	99.611405	99.592551	99.602658
11398	SP500	300	1786295400	7757.771222	7759.000871	7756.348714	7757.640000
11399	DOW	300	1786295400	54035.321178	54044.896225	54027.966002	54036.930000
11400	DXY	300	1786295400	99.602760	99.616173	99.534604	99.539000
11218	SP500	300	1786295100	7757.582555	7758.448816	7756.466663	7757.592691
11219	DOW	300	1786295100	54040.990678	54044.317571	54023.035167	54036.571555
11220	DXY	300	1786295100	99.602824	99.613020	99.594110	99.604748
11038	SP500	300	1786294800	7757.478281	7759.373246	7756.478295	7757.724514
11039	DOW	300	1786294800	54038.474178	54051.014826	54026.991253	54039.129518
11040	DXY	300	1786294800	99.602521	99.610741	99.594144	99.603166
13745	DOW	300	1786299300	54036.930000	54043.050101	54026.168452	54037.999518
13746	DXY	300	1786299300	99.604000	99.615286	99.590974	99.609971
11935	SP500	300	1786296300	7757.767312	7758.922454	7756.590142	7757.769171
11936	DOW	300	1786296300	54033.265873	54044.262430	54029.669213	54033.591111
10498	SP500	300	1786293900	7757.800364	7759.117329	7756.623379	7757.658979
10499	DOW	300	1786293900	54036.351740	54043.811933	54031.301639	54038.245283
10500	DXY	300	1786293900	99.601415	99.613575	99.588355	99.604833
11575	SP500	300	1786295700	7757.357426	7758.694079	7756.374778	7757.491255
9957	DXY	300	1786293000	99.607423	99.612073	99.592826	99.600709
11576	DOW	300	1786295700	54036.619547	54046.352114	54027.879646	54039.049598
11577	DXY	300	1786295700	99.538666	99.607385	99.525447	99.606481
10858	SP500	300	1786294500	7757.545949	7759.496708	7756.250060	7757.535077
10859	DOW	300	1786294500	54036.636262	54044.530734	54027.094812	54036.862917
10860	DXY	300	1786294500	99.605486	99.615045	99.595863	99.602424
11937	DXY	300	1786296300	99.602734	99.615307	99.593237	99.604848
10132	SP500	300	1786293300	7757.278421	7758.337032	7756.270814	7757.239865
10133	DOW	300	1786293300	54035.517809	54045.235308	54024.017480	54036.241522
10134	DXY	300	1786293300	99.598496	99.614951	99.594753	99.602208
13381	SP500	300	1786298700	7757.623474	7759.054294	7756.050377	7757.640000
13382	DOW	300	1786298700	54036.257349	54044.526616	54029.612815	54036.930000
13383	DXY	300	1786298700	99.603477	99.617417	99.591851	99.604000
12295	SP500	300	1786296900	7757.527957	7758.809817	7756.574864	7757.919617
12296	DOW	300	1786296900	54037.062212	54046.171794	54028.655244	54037.176299
12297	DXY	300	1786296900	99.606188	99.611943	99.595781	99.603724
13018	SP500	300	1786298100	7756.516101	7758.903559	7756.373202	7756.761365
13019	DOW	300	1786298100	54043.029797	54051.363420	54029.509787	54041.121377
13020	DXY	300	1786298100	99.610217	99.613919	99.589764	99.601558
11752	SP500	300	1786296000	7757.536770	7759.191097	7756.249172	7757.715376
11753	DOW	300	1786296000	54040.040997	54052.190710	54026.902617	54035.376378
11754	DXY	300	1786296000	99.607421	99.618194	99.589958	99.603858
12658	SP500	300	1786297500	7757.649766	7759.016192	7756.538908	7757.640000
12659	DOW	300	1786297500	54037.408519	54046.617097	54026.366875	54036.930000
12660	DXY	300	1786297500	99.603751	99.613737	99.588113	99.604000
12478	SP500	300	1786297200	7757.636239	7758.588860	7756.419244	7757.432452
12479	DOW	300	1786297200	54035.725408	54044.447226	54026.929542	54035.483122
12480	DXY	300	1786297200	99.605916	99.615810	99.590166	99.602269
13564	SP500	300	1786299000	7757.609284	7758.980311	7756.551695	7758.275457
13565	DOW	300	1786299000	54036.255116	54052.427260	54030.952500	54036.898278
13566	DXY	300	1786299000	99.606359	99.615237	99.593693	99.600491
12838	SP500	300	1786297800	7757.847870	7758.618020	7756.119145	7756.655551
12839	DOW	300	1786297800	54035.298783	54047.717296	54025.873752	54043.067238
12840	DXY	300	1786297800	99.602738	99.615995	99.595065	99.610479
14470	SP500	300	1786300500	7756.883131	7759.345492	7756.844108	7757.855710
14471	DOW	300	1786300500	54041.058463	54046.589589	54027.776856	54030.965499
14472	DXY	300	1786300500	99.600343	99.612878	99.592714	99.602257
14290	SP500	300	1786300200	7757.609011	7759.193124	7756.332096	7756.823003
14291	DOW	300	1786300200	54040.201657	54043.440519	54030.009885	54040.076010
14292	DXY	300	1786300200	99.607751	99.615587	99.595305	99.600243
15018	DXY	300	1786301400	99.601991	99.614272	99.591473	99.600729
14833	SP500	300	1786301100	7757.613693	7759.086127	7756.638634	7756.723926
14834	DOW	300	1786301100	54031.039108	54047.053960	54028.141925	54031.635156
14107	SP500	300	1786299900	7757.640000	7759.620430	7756.401410	7757.318736
14108	DOW	300	1786299900	54036.930000	54045.858174	54028.097214	54040.338305
13927	SP500	300	1786299600	7756.917511	7759.267767	7756.160371	7757.251881
13928	DOW	300	1786299600	54037.515315	54050.617017	54030.081234	54038.228266
14109	DXY	300	1786299900	99.604000	99.616226	99.594735	99.606101
14650	SP500	300	1786300800	7757.640000	7758.935094	7755.420980	7757.817961
14651	DOW	300	1786300800	54036.930000	54047.022739	54020.771528	54031.667245
14652	DXY	300	1786300800	99.604000	99.612503	99.592909	99.603540
14835	DXY	300	1786301100	99.602242	99.613275	99.595214	99.603928
15016	SP500	300	1786301400	7756.918290	7760.249454	7756.099958	7757.554022
15017	DOW	300	1786301400	54032.700146	54046.668432	54027.380325	54035.692719
15196	SP500	300	1786301700	7757.640000	7759.977300	7756.337139	7758.921483
15197	DOW	300	1786301700	54036.930000	54043.770570	54024.971400	54041.304783
15198	DXY	300	1786301700	99.604000	99.615868	99.592788	99.604285
15379	SP500	300	1786302000	7757.640000	7759.492676	7755.863294	7758.088849
18457	SP500	300	1786307100	7757.576609	7758.599885	7755.905152	7756.810376
18458	DOW	300	1786307100	54043.516302	54045.552381	54023.874141	54039.036250
18459	DXY	300	1786307100	99.604794	99.613858	99.594204	99.602062
17734	SP500	300	1786305900	7756.121553	7759.009557	7755.904711	7757.759693
17735	DOW	300	1786305900	54034.684557	54047.793444	54028.920171	54030.118285
17736	DXY	300	1786305900	99.600160	99.612868	99.589165	99.601239
17191	SP500	300	1786305000	7758.774226	7758.774226	7756.291705	7757.484743
17192	DOW	300	1786305000	54039.909825	54048.533663	54029.209022	54037.612135
17193	DXY	300	1786305000	99.609986	99.616188	99.592978	99.609470
18274	SP500	300	1786306800	7756.907759	7758.627489	7756.475794	7757.377091
18275	DOW	300	1786306800	54039.284500	54045.901225	54026.116104	54042.609239
18276	DXY	300	1786306800	99.598610	99.612559	99.594079	99.604420
16645	SP500	300	1786304100	7757.730978	7758.507932	7756.433694	7756.747731
16646	DOW	300	1786304100	54038.506799	54051.314475	54028.118890	54039.740932
16647	DXY	300	1786304100	99.608165	99.619759	99.594212	99.619759
16462	SP500	300	1786303800	7758.472940	7759.073773	7756.216393	7757.536119
15919	SP500	300	1786302900	7757.640000	7759.164993	7756.346027	7758.539570
15920	DOW	300	1786302900	54036.930000	54045.294490	54028.563295	54037.403538
15921	DXY	300	1786302900	99.604000	99.616702	99.593178	99.596024
16463	DOW	300	1786303800	54045.609276	54047.079241	54028.226009	54040.104188
15380	DOW	300	1786302000	54036.930000	54052.973623	54027.600448	54033.736525
15381	DXY	300	1786302000	99.604000	99.614535	99.591005	99.591005
16464	DXY	300	1786303800	99.597496	99.612265	99.591790	99.606102
16825	SP500	300	1786304400	7756.841987	7759.097806	7756.382808	7756.884899
16282	SP500	300	1786303500	7758.362273	7759.202312	7756.370543	7758.337095
16283	DOW	300	1786303500	54034.813055	54046.881243	54027.020598	54044.901367
16284	DXY	300	1786303500	99.607120	99.613246	99.595517	99.598653
15556	SP500	300	1786302300	7758.354661	7759.692862	7756.663943	7757.314296
15557	DOW	300	1786302300	54034.442605	54047.891716	54024.321252	54037.552243
15558	DXY	300	1786302300	99.589325	99.616055	99.586370	99.603885
16826	DOW	300	1786304400	54038.689005	54045.065060	54026.378738	54038.996421
16827	DXY	300	1786304400	99.620002	99.621856	99.598402	99.612458
19545	DXY	300	1786308900	99.595747	99.613720	99.591558	99.607728
19003	SP500	300	1786308000	7758.032127	7758.819862	7755.898639	7758.113096
19004	DOW	300	1786308000	54039.968114	54043.642787	54024.764538	54024.764538
19005	DXY	300	1786308000	99.600946	99.617727	99.595914	99.609094
18820	SP500	300	1786307700	7757.360673	7759.479688	7756.140598	7757.810829
18821	DOW	300	1786307700	54034.473600	54049.145321	54026.316729	54039.530618
18094	SP500	300	1786306500	7757.354893	7758.632781	7755.969727	7757.184381
18095	DOW	300	1786306500	54027.069516	54047.237334	54026.372392	54041.114291
18096	DXY	300	1786306500	99.607580	99.615055	99.591969	99.597057
17914	SP500	300	1786306200	7758.019638	7759.724213	7756.122364	7757.350444
17915	DOW	300	1786306200	54030.518833	54045.312758	54023.744628	54028.422393
17916	DXY	300	1786306200	99.600306	99.610995	99.594799	99.609365
16099	SP500	300	1786303200	7758.452067	7759.215881	7756.671119	7758.650586
16100	DOW	300	1786303200	54037.114879	54048.622918	54028.107145	54033.101745
16101	DXY	300	1786303200	99.595556	99.615230	99.595556	99.606036
15736	SP500	300	1786302600	7757.289204	7759.080476	7755.881894	7757.216839
15737	DOW	300	1786302600	54039.633846	54048.058523	54021.672530	54034.319211
15738	DXY	300	1786302600	99.602804	99.614623	99.590540	99.606213
17008	SP500	300	1786304700	7756.686888	7758.745542	7756.492100	7758.745542
17009	DOW	300	1786304700	54040.975666	54044.279307	54027.654457	54038.003221
17010	DXY	300	1786304700	99.613159	99.617837	99.591121	99.609278
17554	SP500	300	1786305600	7756.828579	7759.733359	7755.921294	7756.134244
17555	DOW	300	1786305600	54039.898590	54044.613328	54026.555382	54034.116572
17556	DXY	300	1786305600	99.599392	99.611984	99.596209	99.597992
17371	SP500	300	1786305300	7757.539562	7758.951823	7756.418074	7756.778689
17372	DOW	300	1786305300	54036.323162	54044.923756	54024.031307	54040.096753
17373	DXY	300	1786305300	99.607512	99.611477	99.593269	99.598026
18822	DXY	300	1786307700	99.608784	99.613217	99.591058	99.598596
19910	DOW	300	1786309500	54040.747931	54046.885008	54022.429196	54038.791651
19363	SP500	300	1786308600	7757.754491	7759.311923	7756.171446	7757.284038
18637	SP500	300	1786307400	7756.784762	7758.850135	7756.454021	7757.305692
18638	DOW	300	1786307400	54037.692629	54044.880472	54026.278264	54032.812277
18639	DXY	300	1786307400	99.604209	99.614977	99.593439	99.607840
19364	DOW	300	1786308600	54040.080562	54044.939736	54029.632969	54034.836426
19365	DXY	300	1786308600	99.605535	99.613828	99.590663	99.595044
19183	SP500	300	1786308300	7757.863763	7759.204498	7756.210737	7757.603158
19184	DOW	300	1786308300	54023.290126	54045.974600	54021.315207	54041.216411
19185	DXY	300	1786308300	99.608299	99.618716	99.588976	99.603082
19911	DXY	300	1786309500	99.612150	99.612970	99.593877	99.597944
19726	SP500	300	1786309200	7756.523711	7759.306012	7756.185095	7758.009532
19727	DOW	300	1786309200	54046.007855	54047.103326	54026.030193	54042.473266
19728	DXY	300	1786309200	99.606746	99.612666	99.595421	99.609850
19543	SP500	300	1786308900	7757.075286	7758.387798	7756.264049	7756.534362
19544	DOW	300	1786308900	54034.644190	54048.874080	54026.186030	54046.770081
20090	DOW	300	1786309800	54037.301594	54043.799213	54030.104391	54031.863230
20091	DXY	300	1786309800	99.597278	99.614904	99.594433	99.600877
19909	SP500	300	1786309500	7758.256726	7758.752947	7756.433009	7758.312000
20271	DXY	300	1786310100	99.600279	99.611978	99.588920	99.603740
20089	SP500	300	1786309800	7758.293988	7758.806966	7756.111154	7758.187827
20451	DXY	300	1786310400	99.603240	99.619350	99.594797	99.602035
20269	SP500	300	1786310100	7758.374574	7759.052329	7756.224880	7757.406508
20270	DOW	300	1786310100	54033.802291	54047.194156	54031.122044	54037.916075
20449	SP500	300	1786310400	7757.372871	7758.609881	7756.274316	7757.527459
20450	DOW	300	1786310400	54039.089816	54049.111294	54026.895218	54041.662992
20629	SP500	300	1786310700	7757.626900	7758.989664	7756.581367	7758.042737
20630	DOW	300	1786310700	54040.055891	54047.030912	54025.910156	54044.168467
20631	DXY	300	1786310700	99.601288	99.615502	99.595850	99.610124
24077	DOW	300	1786316400	54039.515492	54046.581764	54022.735139	54039.583061
23713	SP500	300	1786315800	7758.206720	7759.255911	7756.047745	7757.682823
23714	DOW	300	1786315800	54043.721139	54048.642720	54023.634428	54037.525288
23715	DXY	300	1786315800	99.620524	99.638739	99.607969	99.624577
22807	SP500	300	1786314300	7757.520021	7759.303655	7756.438258	7757.492065
22808	DOW	300	1786314300	54030.197632	54045.859648	54023.147659	54034.274038
22809	DXY	300	1786314300	99.627593	99.635554	99.612042	99.613299
20812	SP500	300	1786311000	7758.039742	7758.678628	7756.662695	7757.806091
20813	DOW	300	1786311000	54042.338134	54048.917724	54026.259592	54045.218540
20814	DXY	300	1786311000	99.611521	99.619725	99.596540	99.601577
24078	DXY	300	1786316400	99.624656	99.642792	99.614073	99.632871
22987	SP500	300	1786314600	7757.327091	7759.129695	7756.107410	7757.339337
22988	DOW	300	1786314600	54035.276517	54045.109337	54026.375572	54042.732413
22989	DXY	300	1786314600	99.611216	99.642365	99.606884	99.627141
21358	SP500	300	1786311900	7758.050905	7759.033617	7756.509132	7757.167610
21359	DOW	300	1786311900	54043.320603	54044.600197	54025.090928	54035.175502
21360	DXY	300	1786311900	99.613332	99.616449	99.596243	99.607729
22627	SP500	300	1786314000	7758.019554	7758.880546	7756.268312	7757.766902
22628	DOW	300	1786314000	54038.586760	54045.062185	54027.879210	54032.096203
22629	DXY	300	1786314000	99.606732	99.632455	99.604608	99.625823
21898	SP500	300	1786312800	7757.374355	7758.764031	7756.369947	7758.373248
21899	DOW	300	1786312800	54037.312648	54045.941975	54028.371536	54029.887915
20992	SP500	300	1786311300	7758.055495	7759.434841	7756.352150	7758.054789
20993	DOW	300	1786311300	54044.782715	54050.459099	54029.628893	54036.591454
20994	DXY	300	1786311300	99.599262	99.615859	99.590765	99.602352
21900	DXY	300	1786312800	99.602839	99.613262	99.596201	99.603431
22081	SP500	300	1786313100	7758.547800	7759.100703	7756.311772	7757.469783
22082	DOW	300	1786313100	54028.396115	54044.519903	54024.937104	54038.837167
22083	DXY	300	1786313100	99.603628	99.612665	99.590786	99.604801
21718	SP500	300	1786312500	7757.676498	7759.180168	7756.664235	7757.387720
21719	DOW	300	1786312500	54034.806139	54042.754218	54023.757271	54038.158810
21720	DXY	300	1786312500	99.600008	99.614966	99.590275	99.603207
23896	SP500	300	1786316100	7757.652833	7758.711690	7756.066702	7757.709411
23353	SP500	300	1786315200	7757.574681	7758.746773	7755.996245	7757.858565
22264	SP500	300	1786313400	7757.437190	7759.082291	7756.662002	7757.599121
22265	DOW	300	1786313400	54039.241956	54047.469754	54028.641362	54035.266578
22266	DXY	300	1786313400	99.607175	99.620779	99.573798	99.608839
21175	SP500	300	1786311600	7757.919705	7758.715630	7756.006335	7758.123476
21176	DOW	300	1786311600	54037.572836	54054.038235	54027.521736	54044.175842
21177	DXY	300	1786311600	99.603659	99.616151	99.591349	99.612533
23354	DOW	300	1786315200	54034.138618	54045.076992	54028.596837	54032.178829
21538	SP500	300	1786312200	7756.915528	7758.867545	7755.684254	7757.755270
21539	DOW	300	1786312200	54033.603821	54043.965806	54026.598628	54035.092383
21540	DXY	300	1786312200	99.605247	99.616114	99.590085	99.599129
23355	DXY	300	1786315200	99.632245	99.648942	99.614888	99.627775
23897	DOW	300	1786316100	54035.958148	54047.564505	54027.757163	54038.963398
23898	DXY	300	1786316100	99.623403	99.641886	99.612767	99.623108
23533	SP500	300	1786315500	7757.627524	7758.612151	7755.810754	7758.500758
23534	DOW	300	1786315500	54031.036346	54050.165956	54025.761288	54042.123070
23535	DXY	300	1786315500	99.629156	99.640612	99.618615	99.619125
23170	SP500	300	1786314900	7757.126819	7759.369739	7755.921554	7757.846191
23171	DOW	300	1786314900	54043.801707	54047.431833	54028.372146	54035.396488
23172	DXY	300	1786314900	99.625370	99.643505	99.607624	99.630202
22444	SP500	300	1786313700	7757.358602	7758.753525	7756.508959	7757.726722
22445	DOW	300	1786313700	54034.352984	54047.595039	54030.731312	54038.486625
22446	DXY	300	1786313700	99.608417	99.623209	99.603481	99.608792
24258	DXY	300	1786316700	99.630674	99.648267	99.626315	99.647223
24982	SP500	300	1786317900	7757.894540	7759.790230	7755.898709	7758.166429
24983	DOW	300	1786317900	54036.904962	54045.966306	54025.988442	54034.330343
24984	DXY	300	1786317900	99.613164	99.628348	99.608151	99.616955
24802	SP500	300	1786317600	7757.405354	7759.244749	7756.591398	7757.606244
24803	DOW	300	1786317600	54039.480818	54049.403500	54025.201692	54037.022879
24804	DXY	300	1786317600	99.629704	99.631090	99.609020	99.612824
24439	SP500	300	1786317000	7757.216108	7759.201150	7755.913628	7757.207830
24440	DOW	300	1786317000	54036.546449	54054.425024	54025.814709	54030.569895
24441	DXY	300	1786317000	99.647443	99.652134	99.624441	99.624441
24622	SP500	300	1786317300	7756.931627	7759.028241	7756.482659	7757.707886
24623	DOW	300	1786317300	54029.664393	54048.613566	54028.227245	54038.894446
24076	SP500	300	1786316400	7757.681119	7758.743375	7756.377492	7758.257722
24624	DXY	300	1786317300	99.622110	99.637321	99.607844	99.629663
24256	SP500	300	1786316700	7758.341390	7759.117152	7755.957844	7757.445342
24257	DOW	300	1786316700	54038.378740	54044.996202	54029.637920	54036.530565
25164	DXY	300	1786318200	99.617013	99.635096	99.610007	99.610030
25346	DOW	300	1786318500	54033.119336	54045.175317	54029.251940	54033.452145
25347	DXY	300	1786318500	99.611056	99.628921	99.605722	99.616326
25162	SP500	300	1786318200	7758.055579	7758.799202	7756.470039	7757.577113
25163	DOW	300	1786318200	54035.924721	54048.627456	54025.956416	54032.778783
25710	DXY	300	1786319100	99.636075	99.646252	99.621560	99.643296
25525	SP500	300	1786318800	7757.676203	7758.409139	7756.225131	7757.467354
25345	SP500	300	1786318500	7757.688075	7758.859439	7756.231588	7757.814737
25526	DOW	300	1786318800	54032.631945	54046.458615	54029.788369	54040.948007
25527	DXY	300	1786318800	99.615187	99.642911	99.609981	99.634467
25890	DXY	300	1786319400	99.645000	99.645000	99.620731	99.627871
25708	SP500	300	1786319100	7757.768399	7758.504164	7756.390088	7757.801762
25709	DOW	300	1786319100	54040.602457	54046.008558	54020.177770	54040.912486
25888	SP500	300	1786319400	7758.098220	7758.916867	7756.174834	7756.829542
25889	DOW	300	1786319400	54040.588473	54049.849319	54027.599275	54034.874403
26068	SP500	300	1786319700	7756.787943	7759.601816	7755.948469	7757.081179
26069	DOW	300	1786319700	54034.531651	54052.825179	54023.474659	54037.547193
29951	DOW	300	1786325700	54036.931454	54045.955376	54021.125599	54030.108348
29952	DXY	300	1786325700	99.673066	99.674963	99.651535	99.654034
28093	SP500	300	1786323000	7757.641028	7758.653001	7755.890431	7757.465201
28094	DOW	300	1786323000	54037.940390	54045.891536	54032.450588	54035.176617
27727	SP500	300	1786322400	7757.416629	7759.412385	7756.050155	7758.103591
27728	DOW	300	1786322400	54036.249757	54054.097362	54023.677122	54037.662244
27729	DXY	300	1786322400	99.643384	99.653073	99.630350	99.642698
26797	SP500	300	1786320900	7757.852375	7759.115976	7756.097789	7757.647119
26798	DOW	300	1786320900	54029.222680	54045.278656	54026.027427	54038.567752
26799	DXY	300	1786320900	99.607752	99.634577	99.604376	99.613788
26434	SP500	300	1786320300	7757.729156	7758.823483	7756.174386	7757.427912
26435	DOW	300	1786320300	54045.228054	54051.555228	54026.677220	54037.974390
26436	DXY	300	1786320300	99.622392	99.642908	99.618383	99.633058
28095	DXY	300	1786323000	99.649459	99.657832	99.636282	99.647967
29584	SP500	300	1786325100	7757.465314	7759.574514	7755.887459	7758.329377
29585	DOW	300	1786325100	54037.865657	54052.201401	54025.174595	54033.044959
29586	DXY	300	1786325100	99.662282	99.672870	99.635625	99.652967
28273	SP500	300	1786323300	7757.732122	7759.109113	7756.689882	7757.395220
28274	DOW	300	1786323300	54033.773566	54045.332464	54024.680816	54042.764344
28275	DXY	300	1786323300	99.646758	99.661424	99.626738	99.637001
30134	DOW	300	1786326000	54028.845950	54047.090352	54026.709661	54045.720511
30135	DXY	300	1786326000	99.651785	99.694662	99.648949	99.685021
27910	SP500	300	1786322700	7758.152764	7759.449620	7755.886829	7757.453173
27911	DOW	300	1786322700	54036.878279	54045.804081	54027.456236	54039.675857
27160	SP500	300	1786321500	7758.295836	7759.111396	7756.416175	7757.604956
27161	DOW	300	1786321500	54037.030746	54048.207533	54029.128044	54039.665203
27162	DXY	300	1786321500	99.613619	99.644817	99.609924	99.636253
27912	DXY	300	1786322700	99.643229	99.660473	99.630351	99.649069
26614	SP500	300	1786320600	7757.170428	7759.484964	7756.665056	7757.593811
26615	DOW	300	1786320600	54036.754851	54048.190345	54024.517601	54030.806785
26616	DXY	300	1786320600	99.631161	99.642213	99.606728	99.606728
26070	DXY	300	1786319700	99.627446	99.643614	99.616223	99.643471
29767	SP500	300	1786325400	7758.424930	7759.166440	7756.640162	7758.635064
29035	SP500	300	1786324200	7758.163506	7758.839286	7756.020900	7757.345239
29036	DOW	300	1786324200	54042.609941	54045.457011	54027.758519	54037.715432
29037	DXY	300	1786324200	99.637250	99.663502	99.618101	99.654761
26977	SP500	300	1786321200	7757.461034	7758.952496	7756.394684	7758.129220
26978	DOW	300	1786321200	54040.312930	54052.449201	54025.916873	54037.760871
26979	DXY	300	1786321200	99.614263	99.644207	99.603412	99.612654
26251	SP500	300	1786320000	7757.382272	7758.683679	7756.282713	7758.017811
26252	DOW	300	1786320000	54039.368994	54044.273885	54025.675198	54043.742255
26253	DXY	300	1786320000	99.643010	99.646936	99.604342	99.624010
28807	SP500	300	1786323900	7757.099841	7758.792983	7756.100717	7758.134519
28808	DOW	300	1786323900	54032.063665	54049.769576	54027.457754	54040.961049
28809	DXY	300	1786323900	99.623280	99.642245	99.606976	99.636390
27343	SP500	300	1786321800	7757.560637	7758.703127	7756.264392	7757.334845
27344	DOW	300	1786321800	54037.975405	54050.347955	54028.384533	54038.375390
27345	DXY	300	1786321800	99.638017	99.650834	99.624290	99.634777
27547	SP500	300	1786322100	7757.582031	7758.931965	7756.605119	7757.505636
27548	DOW	300	1786322100	54038.332081	54046.490777	54027.992464	54038.263508
27549	DXY	300	1786322100	99.636382	99.652109	99.625326	99.642547
29768	DOW	300	1786325400	54033.932433	54047.488413	54024.513618	54038.165604
29769	DXY	300	1786325400	99.653158	99.679375	99.647258	99.671540
29401	SP500	300	1786324800	7758.698475	7759.328430	7756.371993	7757.304129
29402	DOW	300	1786324800	54037.329481	54045.618644	54027.434776	54035.714224
29403	DXY	300	1786324800	99.666132	99.678465	99.655088	99.663135
28516	SP500	300	1786323600	7757.270436	7759.027666	7755.915836	7757.044353
28517	DOW	300	1786323600	54040.678138	54052.336734	54023.202769	54033.417555
28518	DXY	300	1786323600	99.635818	99.642052	99.611771	99.625034
29218	SP500	300	1786324500	7757.304948	7759.156148	7755.922192	7758.545250
29219	DOW	300	1786324500	54036.223724	54044.450263	54025.645182	54039.340620
29220	DXY	300	1786324500	99.653508	99.687237	99.650823	99.666246
30317	DOW	300	1786326300	54043.627309	54043.627309	54029.352709	54031.197225
30318	DXY	300	1786326300	99.686918	99.696867	99.660212	99.660212
30500	DOW	300	1786326600	54029.836746	54049.477607	54025.864424	54026.064576
30501	DXY	300	1786326600	99.658026	99.686048	99.654758	99.678210
30683	DOW	300	1786326900	54024.024088	54049.513106	54021.652622	54037.985148
29950	SP500	300	1786325700	7758.442248	7758.643874	7756.420574	7757.594821
30684	DXY	300	1786326900	99.676561	99.690383	99.662730	99.670143
30133	SP500	300	1786326000	7757.824091	7758.868599	7756.230725	7757.800820
31045	SP500	300	1786327500	7757.812759	7759.206861	7756.019052	7756.704557
30499	SP500	300	1786326600	7757.086066	7759.455634	7756.044596	7758.344567
30316	SP500	300	1786326300	7757.595270	7759.646355	7756.461344	7757.373440
31046	DOW	300	1786327500	54030.039915	54045.955095	54028.725304	54030.625108
30865	SP500	300	1786327200	7758.391271	7759.431478	7756.262146	7758.109671
31047	DXY	300	1786327500	99.677294	99.703158	99.675025	99.684720
31225	SP500	300	1786327800	7757.002863	7759.854061	7756.484245	7757.180531
30682	SP500	300	1786326900	7758.321489	7759.199630	7755.997337	7758.214411
30866	DOW	300	1786327200	54039.160113	54047.620118	54022.748875	54032.167518
30867	DXY	300	1786327200	99.672415	99.685223	99.661234	99.677100
31226	DOW	300	1786327800	54032.037854	54050.389423	54025.023000	54030.948386
31227	DXY	300	1786327800	99.683541	99.692004	99.662309	99.683742
31408	SP500	300	1786328100	7757.351804	7759.258382	7756.000964	7758.191598
31409	DOW	300	1786328100	54032.975991	54045.616409	54028.203846	54033.701277
31410	DXY	300	1786328100	99.683082	99.696631	99.665810	99.688226
31591	SP500	300	1786328400	7758.136182	7758.661427	7756.539265	7756.773033
31592	DOW	300	1786328400	54032.310808	54047.339674	54026.850519	54035.252605
31593	DXY	300	1786328400	99.689577	99.701723	99.676217	99.699912
31774	SP500	300	1786328700	7756.900244	7758.873055	7756.522449	7758.346077
33421	SP500	300	1786331400	7757.104000	7758.848046	7756.015650	7757.508849
33422	DOW	300	1786331400	54032.842687	54049.537416	54024.864422	54029.967132
33423	DXY	300	1786331400	99.689043	99.714358	99.688355	99.709940
32140	SP500	300	1786329300	7757.365635	7758.960755	7756.359889	7757.492166
32141	DOW	300	1786329300	54040.455404	54043.295879	54028.555890	54030.974648
32142	DXY	300	1786329300	99.685681	99.702131	99.674056	99.684292
32506	SP500	300	1786329900	7758.183129	7758.885830	7756.214713	7757.255346
32507	DOW	300	1786329900	54038.912271	54047.044673	54025.993200	54033.837238
32508	DXY	300	1786329900	99.674444	99.698332	99.671361	99.690816
35064	DXY	300	1786334100	99.703832	99.728089	99.691573	99.701463
34336	SP500	300	1786332900	7757.949383	7758.785331	7756.387646	7757.594382
34337	DOW	300	1786332900	54051.658227	54051.932112	54028.875101	54033.241891
34338	DXY	300	1786332900	99.692347	99.714952	99.689030	99.697072
33970	SP500	300	1786332300	7756.703379	7758.595255	7756.244329	7756.552988
33787	SP500	300	1786332000	7757.103123	7758.607092	7756.409671	7756.437024
33788	DOW	300	1786332000	54030.676598	54049.654652	54028.674597	54035.677869
33789	DXY	300	1786332000	99.711639	99.723349	99.696412	99.723349
33971	DOW	300	1786332300	54036.785998	54044.152690	54029.291191	54040.968694
33972	DXY	300	1786332300	99.721007	99.724336	99.701362	99.711791
31775	DOW	300	1786328700	54033.768698	54046.812070	54031.595746	54043.079362
31776	DXY	300	1786328700	99.698326	99.698326	99.671100	99.688032
34519	SP500	300	1786333200	7757.774973	7758.593674	7756.192100	7757.902640
34520	DOW	300	1786333200	54034.533221	54045.815051	54028.703722	54032.872736
34521	DXY	300	1786333200	99.695983	99.723162	99.693648	99.708824
32323	SP500	300	1786329600	7757.339125	7759.471336	7756.753062	7758.108066
32324	DOW	300	1786329600	54029.021693	54048.292630	54024.362716	54038.331342
32325	DXY	300	1786329600	99.682453	99.694347	99.666312	99.675241
33604	SP500	300	1786331700	7757.384767	7758.666949	7755.971819	7757.253182
33605	DOW	300	1786331700	54028.772448	54044.795115	54026.004660	54032.005467
33606	DXY	300	1786331700	99.710583	99.720217	99.702992	99.712044
33055	SP500	300	1786330800	7758.240869	7758.911111	7756.642497	7758.037999
33056	DOW	300	1786330800	54040.156110	54045.621865	54028.698207	54036.734172
33057	DXY	300	1786330800	99.696349	99.709755	99.682422	99.694998
31957	SP500	300	1786329000	7758.145463	7758.740686	7756.111927	7757.341611
31958	DOW	300	1786329000	54044.694069	54044.694069	54027.104520	54041.969093
31959	DXY	300	1786329000	99.687064	99.701169	99.675388	99.686955
32872	SP500	300	1786330500	7757.821925	7758.795245	7756.168835	7758.006318
32873	DOW	300	1786330500	54038.545678	54050.127317	54025.081438	54040.553785
32874	DXY	300	1786330500	99.698439	99.708616	99.686534	99.695028
32689	SP500	300	1786330200	7757.117475	7758.849987	7756.152831	7757.550446
32690	DOW	300	1786330200	54034.496138	54045.600944	54023.893150	54039.986789
32691	DXY	300	1786330200	99.688876	99.702982	99.681022	99.696175
33238	SP500	300	1786331100	7758.166622	7759.411022	7756.687291	7757.337356
33239	DOW	300	1786331100	54036.672888	54047.857169	54027.174249	54032.355303
33240	DXY	300	1786331100	99.697088	99.706849	99.683309	99.689804
35607	DXY	300	1786335000	99.710292	99.726599	99.704120	99.712969
34153	SP500	300	1786332600	7756.527318	7759.222807	7755.828514	7758.245362
34154	DOW	300	1786332600	54040.529794	54049.833958	54029.697284	54049.833958
34155	DXY	300	1786332600	99.713221	99.714155	99.683624	99.691828
36335	DOW	300	1786336200	54041.896731	54043.464034	54030.301194	54035.102926
35971	SP500	300	1786335600	7756.220330	7759.400319	7755.909639	7757.252130
34882	SP500	300	1786333800	7757.960741	7758.985496	7756.674651	7758.222514
34883	DOW	300	1786333800	54040.019314	54046.803125	54027.492797	54041.543795
34884	DXY	300	1786333800	99.718202	99.724123	99.701185	99.702382
34702	SP500	300	1786333500	7757.761531	7758.642254	7756.415128	7757.780322
34703	DOW	300	1786333500	54033.762175	54044.650528	54027.535118	54038.478230
34704	DXY	300	1786333500	99.706900	99.720461	99.702025	99.717288
35422	SP500	300	1786334700	7757.196878	7759.976811	7756.699345	7757.378047
35242	SP500	300	1786334400	7757.187880	7758.759478	7756.058061	7757.195489
35243	DOW	300	1786334400	54038.710287	54046.660893	54023.691401	54035.700714
35244	DXY	300	1786334400	99.701613	99.719103	99.698636	99.704560
35423	DOW	300	1786334700	54034.040399	54045.939482	54029.191297	54036.554765
35424	DXY	300	1786334700	99.706242	99.721244	99.699836	99.708705
35972	DOW	300	1786335600	54040.882540	54047.693814	54028.198103	54041.654849
35973	DXY	300	1786335600	99.716865	99.732297	99.709129	99.713962
35062	SP500	300	1786334100	7758.266905	7759.003107	7756.650121	7757.036199
35063	DOW	300	1786334100	54039.680460	54044.823036	54022.884726	54037.968202
36336	DXY	300	1786336200	99.725530	99.739979	99.711203	99.722439
36154	SP500	300	1786335900	7757.006791	7759.316132	7756.626082	7756.771921
36155	DOW	300	1786335900	54043.510690	54047.695128	54024.498665	54044.010874
35788	SP500	300	1786335300	7756.331229	7759.483402	7755.807461	7756.057047
35789	DOW	300	1786335300	54035.568095	54043.641563	54025.844702	54039.516578
35605	SP500	300	1786335000	7757.314196	7758.766350	7756.325434	7756.325434
35606	DOW	300	1786335000	54036.526128	54047.143820	54029.287251	54037.307103
35790	DXY	300	1786335300	99.712728	99.737454	99.711634	99.719251
36156	DXY	300	1786335900	99.711904	99.738087	99.710572	99.723822
36515	DOW	300	1786336500	54033.829793	54044.638839	54026.648371	54041.629003
36516	DXY	300	1786336500	99.722274	99.724232	99.706440	99.717875
36334	SP500	300	1786336200	7757.021056	7758.813693	7755.806489	7757.908420
36514	SP500	300	1786336500	7757.697703	7758.731858	7756.181932	7757.104994
36694	SP500	300	1786336800	7757.261155	7759.223639	7755.834241	7758.571699
36695	DOW	300	1786336800	54043.777559	54045.358657	54030.018382	54037.168065
36696	DXY	300	1786336800	99.716807	99.729320	99.704663	99.722404
36877	SP500	300	1786337100	7758.723564	7759.881504	7756.199200	7758.153459
36878	DOW	300	1786337100	54035.716329	54047.403466	54026.415005	54035.546003
36879	DXY	300	1786337100	99.720317	99.734283	99.713229	99.727182
37060	SP500	300	1786337400	7758.277382	7759.473553	7756.170562	7757.964406
37061	DOW	300	1786337400	54035.819736	54043.709652	54026.657666	54042.265669
37062	DXY	300	1786337400	99.729000	99.736221	99.707554	99.715552
39235	SP500	300	1786341000	7757.940465	7759.168758	7756.563148	7758.355131
39236	DOW	300	1786341000	54039.337498	54043.940814	54026.200956	54034.764485
39237	DXY	300	1786341000	99.693952	99.720080	99.687941	99.709375
39416	DOW	300	1786341300	54034.295905	54046.899993	54029.208159	54039.176869
39417	DXY	300	1786341300	99.708623	99.718172	99.690672	99.693811
37243	SP500	300	1786337700	7758.073518	7759.010957	7756.551634	7758.058475
37244	DOW	300	1786337700	54043.887280	54046.869093	54023.452959	54039.855889
37245	DXY	300	1786337700	99.715049	99.727268	99.697426	99.704436
40146	DXY	300	1786342500	99.703536	99.703536	99.676188	99.680063
39055	SP500	300	1786340700	7758.128414	7759.151598	7755.870576	7758.028426
39056	DOW	300	1786340700	54043.382760	54048.889403	54025.675274	54041.377929
39057	DXY	300	1786340700	99.704404	99.720930	99.691994	99.696243
38515	SP500	300	1786339800	7758.046112	7759.149991	7756.273194	7757.443673
37792	SP500	300	1786338600	7757.478472	7759.235501	7755.988743	7757.923034
37793	DOW	300	1786338600	54036.539155	54050.897901	54025.833372	54036.622987
37794	DXY	300	1786338600	99.708687	99.720109	99.697733	99.700793
38516	DOW	300	1786339800	54035.386858	54045.148846	54022.463291	54032.392495
38517	DXY	300	1786339800	99.724112	99.727487	99.707389	99.722247
38335	SP500	300	1786339500	7759.251739	7759.251739	7755.642547	7758.193552
38336	DOW	300	1786339500	54035.022750	54045.179068	54028.516449	54033.957268
38337	DXY	300	1786339500	99.720051	99.736171	99.704087	99.725837
37426	SP500	300	1786338000	7757.847728	7759.461520	7755.754015	7757.945246
37427	DOW	300	1786338000	54038.754782	54049.468953	54026.378284	54041.616388
37428	DXY	300	1786338000	99.705505	99.707216	99.685371	99.696275
41061	DXY	300	1786344000	99.675008	99.692955	99.667691	99.692312
39778	SP500	300	1786341900	7757.182112	7758.914236	7755.507178	7757.836000
39779	DOW	300	1786341900	54036.703857	54046.889378	54026.238365	54039.346488
39780	DXY	300	1786341900	99.682463	99.694129	99.672608	99.676426
38155	SP500	300	1786339200	7758.209717	7759.208866	7755.796221	7758.987150
38156	DOW	300	1786339200	54037.751774	54047.123547	54026.948787	54036.685350
38157	DXY	300	1786339200	99.708183	99.725532	99.697058	99.719793
38695	SP500	300	1786340100	7757.701797	7758.802188	7756.196151	7758.022433
38696	DOW	300	1786340100	54031.337773	54049.552711	54022.951101	54040.115085
38697	DXY	300	1786340100	99.722808	99.730575	99.709031	99.718868
40693	SP500	300	1786343400	7756.322481	7759.051349	7755.247284	7757.585524
40510	SP500	300	1786343100	7756.976360	7758.878067	7756.270334	7756.571646
40511	DOW	300	1786343100	54035.942613	54047.233942	54030.465794	54036.066311
37609	SP500	300	1786338300	7757.654069	7759.137901	7756.738684	7757.322858
37610	DOW	300	1786338300	54043.240925	54047.427498	54020.592975	54035.002488
37611	DXY	300	1786338300	99.694256	99.715377	99.691764	99.707875
40327	SP500	300	1786342800	7757.685464	7759.026812	7756.497818	7757.081648
39595	SP500	300	1786341600	7756.747344	7759.072135	7756.199376	7757.400338
39596	DOW	300	1786341600	54037.671386	54048.409186	54027.178734	54038.182185
39597	DXY	300	1786341600	99.692938	99.710155	99.680304	99.682807
37975	SP500	300	1786338900	7757.848252	7758.654968	7755.753124	7758.408512
37976	DOW	300	1786338900	54037.212122	54046.308273	54023.812854	54037.624560
37977	DXY	300	1786338900	99.702390	99.716649	99.685926	99.709336
40328	DOW	300	1786342800	54038.962081	54047.763282	54025.798927	54035.659358
39961	SP500	300	1786342200	7757.824168	7759.201041	7756.425221	7758.026592
39962	DOW	300	1786342200	54039.289933	54046.699417	54025.095661	54044.066525
39963	DXY	300	1786342200	99.678257	99.702464	99.674079	99.702464
38875	SP500	300	1786340400	7757.850426	7759.223862	7756.404638	7758.269140
38876	DOW	300	1786340400	54041.784455	54052.968792	54025.965395	54041.652170
38877	DXY	300	1786340400	99.719305	99.730633	99.703616	99.704443
40329	DXY	300	1786342800	99.679445	99.698654	99.675371	99.689295
40512	DXY	300	1786343100	99.688482	99.695889	99.664134	99.675798
40694	DOW	300	1786343400	54035.242734	54048.640846	54026.518384	54033.588950
40695	DXY	300	1786343400	99.677374	99.697067	99.669114	99.690044
39415	SP500	300	1786341300	7758.314023	7758.818367	7756.165597	7756.938685
41976	DXY	300	1786345500	99.689037	99.704240	99.669456	99.677999
41791	SP500	300	1786345200	7757.300845	7758.968460	7755.740092	7757.096417
41608	SP500	300	1786344900	7756.634757	7759.048624	7755.897004	7757.335768
41609	DOW	300	1786344900	54039.110169	54049.383050	54022.735872	54038.880279
41792	DOW	300	1786345200	54040.671144	54050.976350	54026.668375	54027.943438
41793	DXY	300	1786345200	99.674116	99.716525	99.672491	99.687626
40876	SP500	300	1786343700	7757.534168	7759.277018	7756.359756	7758.118535
40144	SP500	300	1786342500	7758.063713	7758.916677	7756.682959	7757.578551
40145	DOW	300	1786342500	54045.719441	54048.126717	54027.457964	54040.136452
40877	DOW	300	1786343700	54033.030406	54044.002049	54030.579105	54038.343239
40878	DXY	300	1786343700	99.687955	99.699650	99.668515	99.676256
42156	DXY	300	1786345800	99.679451	99.709564	99.673665	99.684897
41610	DXY	300	1786344900	99.702944	99.704947	99.671514	99.673817
41242	SP500	300	1786344300	7757.266493	7759.331381	7756.625122	7757.890468
41425	SP500	300	1786344600	7757.611543	7759.006543	7756.041889	7756.853187
41426	DOW	300	1786344600	54039.653607	54047.332024	54026.888960	54037.535314
41059	SP500	300	1786344000	7758.007429	7759.195751	7756.215345	7757.272972
41060	DOW	300	1786344000	54037.793514	54047.745342	54025.866277	54033.867875
41243	DOW	300	1786344300	54032.965253	54050.913568	54032.289411	54040.654511
41244	DXY	300	1786344300	99.691658	99.696386	99.665851	99.682317
41427	DXY	300	1786344600	99.679868	99.702941	99.666767	99.702117
41974	SP500	300	1786345500	7757.397131	7758.702747	7756.711948	7757.817047
41975	DOW	300	1786345500	54026.324622	54049.419607	54025.058770	54037.990787
42336	DXY	300	1786346100	99.686518	99.710950	99.674923	99.683938
42154	SP500	300	1786345800	7758.075271	7758.938813	7756.598364	7757.213533
42155	DOW	300	1786345800	54038.658912	54047.223769	54026.980669	54033.236917
42515	DOW	300	1786346400	54039.588397	54046.370084	54028.592514	54037.864939
42334	SP500	300	1786346100	7757.337904	7759.570769	7756.481759	7758.486437
42335	DOW	300	1786346100	54031.438753	54042.182162	54027.569710	54040.677058
42514	SP500	300	1786346400	7758.747962	7759.390586	7756.396796	7757.957031
45597	DXY	300	1786351500	99.640666	99.646173	99.616839	99.640401
45055	SP500	300	1786350600	7757.814949	7759.606594	7756.208030	7758.695234
45056	DOW	300	1786350600	54039.030537	54043.305946	54023.548549	54038.797969
44335	SP500	300	1786349400	7757.872397	7758.818912	7756.721973	7758.818912
44336	DOW	300	1786349400	54039.991955	54046.768921	54028.436561	54036.818293
44337	DXY	300	1786349400	99.632417	99.652322	99.628282	99.639040
45057	DXY	300	1786350600	99.605235	99.620033	99.598195	99.618859
43243	SP500	300	1786347600	7757.604231	7758.561953	7756.539357	7757.494136
43244	DOW	300	1786347600	54035.700751	54050.190767	54031.205392	54040.006612
43245	DXY	300	1786347600	99.680216	99.687801	99.660636	99.673091
42877	SP500	300	1786347000	7758.126721	7759.175764	7756.678936	7758.447430
42878	DOW	300	1786347000	54033.821658	54051.149118	54030.381790	54038.053621
42879	DXY	300	1786347000	99.680033	99.696611	99.657010	99.657010
45415	SP500	300	1786351200	7756.847011	7758.916631	7755.991893	7757.395638
45416	DOW	300	1786351200	54041.624047	54046.534485	54030.407099	54031.826215
45417	DXY	300	1786351200	99.613531	99.641597	99.607091	99.641394
47974	SP500	300	1786355400	7757.420892	7759.054786	7756.681990	7757.485211
47425	SP500	300	1786354500	7758.256336	7758.802706	7755.817899	7757.742836
47426	DOW	300	1786354500	54038.557724	54044.225116	54028.864127	54030.800011
47242	SP500	300	1786354200	7757.045999	7758.506792	7756.034683	7758.235397
44695	SP500	300	1786350000	7757.765492	7758.758937	7756.033960	7757.503242
43792	SP500	300	1786348500	7758.294616	7759.315770	7756.637519	7757.629482
43793	DOW	300	1786348500	54031.596558	54044.469930	54026.525624	54030.522199
43794	DXY	300	1786348500	99.629937	99.643587	99.604748	99.638230
43972	SP500	300	1786348800	7757.416739	7758.732522	7756.284344	7757.856956
43973	DOW	300	1786348800	54030.240049	54047.416955	54023.858171	54032.204432
43974	DXY	300	1786348800	99.640022	99.658070	99.630576	99.649936
43609	SP500	300	1786348200	7757.144003	7759.062401	7756.593186	7758.067137
43610	DOW	300	1786348200	54037.095479	54051.073099	54027.499541	54033.750266
43611	DXY	300	1786348200	99.658555	99.661771	99.620508	99.629109
43060	SP500	300	1786347300	7758.475296	7758.671886	7755.970755	7757.538007
43061	DOW	300	1786347300	54039.464052	54044.923764	54027.646589	54035.262953
43062	DXY	300	1786347300	99.655804	99.688006	99.653136	99.679496
42516	DXY	300	1786346400	99.685841	99.694894	99.664999	99.686590
44696	DOW	300	1786350000	54037.524859	54052.999925	54025.594121	54036.559498
44697	DXY	300	1786350000	99.634609	99.635029	99.599944	99.604222
47243	DOW	300	1786354200	54040.618380	54048.511457	54027.255109	54038.339623
46144	SP500	300	1786352400	7757.123597	7759.224056	7756.381368	7757.544638
46145	DOW	300	1786352400	54038.673859	54046.322635	54026.842819	54038.374358
46146	DXY	300	1786352400	99.640298	99.661908	99.635798	99.653694
42694	SP500	300	1786346700	7758.128339	7758.860919	7756.334024	7758.261226
42695	DOW	300	1786346700	54038.215580	54043.301171	54029.316240	54032.084289
42696	DXY	300	1786346700	99.685586	99.698106	99.670145	99.678669
43426	SP500	300	1786347900	7757.597772	7759.333437	7756.525253	7757.024386
43427	DOW	300	1786347900	54038.018850	54047.824150	54025.146047	54037.102047
43428	DXY	300	1786347900	99.674407	99.675717	99.633985	99.656264
44515	SP500	300	1786349700	7758.786516	7758.886426	7756.224841	7757.608310
44516	DOW	300	1786349700	54036.060347	54047.991601	54027.236172	54036.571290
44152	SP500	300	1786349100	7757.845946	7759.552290	7755.548726	7757.726366
44153	DOW	300	1786349100	54033.890299	54043.603830	54030.019958	54038.415328
44154	DXY	300	1786349100	99.651384	99.665350	99.632264	99.632264
44517	DXY	300	1786349700	99.636909	99.644052	99.611389	99.635338
44875	SP500	300	1786350300	7757.794716	7758.635281	7756.129745	7757.846056
44876	DOW	300	1786350300	54037.430956	54045.928039	54029.165641	54037.152751
44877	DXY	300	1786350300	99.605544	99.624465	99.595370	99.606776
45778	SP500	300	1786351800	7757.109133	7759.721437	7756.279915	7757.650068
45779	DOW	300	1786351800	54033.065853	54043.938662	54028.747738	54043.938662
45780	DXY	300	1786351800	99.640731	99.644942	99.616798	99.636716
46327	SP500	300	1786352700	7757.385870	7758.918275	7756.548478	7758.100393
46328	DOW	300	1786352700	54038.589980	54047.187493	54027.414956	54037.564172
46329	DXY	300	1786352700	99.655142	99.663599	99.642210	99.652819
45235	SP500	300	1786350900	7758.810808	7759.115036	7756.337288	7756.684912
45236	DOW	300	1786350900	54040.087351	54047.261782	54030.489518	54041.240291
45237	DXY	300	1786350900	99.620996	99.627090	99.606988	99.612064
45961	SP500	300	1786352100	7757.598297	7758.792204	7755.829939	7757.325916
45962	DOW	300	1786352100	54041.857395	54049.244313	54022.090267	54037.682195
45963	DXY	300	1786352100	99.638142	99.649851	99.630410	99.641042
45595	SP500	300	1786351500	7757.684537	7758.401714	7756.358020	7757.269029
45596	DOW	300	1786351500	54032.258445	54044.417644	54026.339542	54031.639288
46510	SP500	300	1786353000	7758.279377	7758.929780	7756.156631	7757.218978
46511	DOW	300	1786353000	54037.651221	54046.978747	54024.812381	54034.497524
46512	DXY	300	1786353000	99.651211	99.671926	99.649106	99.664120
46693	SP500	300	1786353300	7757.288128	7758.962026	7756.606368	7757.600784
46694	DOW	300	1786353300	54032.505625	54049.470377	54027.640169	54040.135194
46695	DXY	300	1786353300	99.664403	99.678647	99.642907	99.652305
46876	SP500	300	1786353600	7757.605215	7758.687909	7756.063818	7758.092007
47244	DXY	300	1786354200	99.652221	99.662407	99.633053	99.638553
47059	SP500	300	1786353900	7758.070354	7758.477911	7756.095225	7757.161142
46877	DOW	300	1786353600	54040.652997	54042.968853	54028.696346	54035.312064
47060	DOW	300	1786353900	54034.543151	54046.424335	54025.343264	54041.289370
46878	DXY	300	1786353600	99.652208	99.663070	99.631009	99.633259
47061	DXY	300	1786353900	99.632236	99.658651	99.630490	99.653231
47427	DXY	300	1786354500	99.639184	99.655155	99.628293	99.647250
47608	SP500	300	1786354800	7757.583163	7758.819822	7756.698216	7757.143937
47609	DOW	300	1786354800	54029.937517	54048.174429	54028.591549	54048.018019
47610	DXY	300	1786354800	99.647444	99.674970	99.636321	99.653340
47791	SP500	300	1786355100	7757.129225	7759.066361	7755.780561	7757.163739
47792	DOW	300	1786355100	54049.749450	54049.749450	54027.286912	54028.026986
47793	DXY	300	1786355100	99.654092	99.696635	99.653292	99.690137
48335	DOW	300	1786356000	54045.705752	54048.976496	54027.580668	54039.154482
48336	DXY	300	1786356000	99.666976	99.696164	99.661812	99.672717
48702	DXY	300	1786356600	99.702387	99.721639	99.698706	99.721639
51062	DOW	300	1786360500	54040.430243	54050.901997	54030.041789	54037.063211
49981	SP500	300	1786358700	7758.085570	7758.868206	7756.022316	7757.332666
49982	DOW	300	1786358700	54037.870650	54045.693932	54027.834435	54041.717053
49983	DXY	300	1786358700	99.686266	99.717108	99.683800	99.700099
51063	DXY	300	1786360500	99.693758	99.719813	99.684066	99.719061
50881	SP500	300	1786360200	7757.900423	7758.624652	7756.189618	7757.860628
50882	DOW	300	1786360200	54034.534671	54047.977657	54028.528379	54038.433033
50883	DXY	300	1786360200	99.700862	99.707750	99.679184	99.695210
50341	SP500	300	1786359300	7757.721813	7759.469140	7755.868060	7757.316829
50342	DOW	300	1786359300	54041.284580	54047.014422	54024.431673	54042.204796
50343	DXY	300	1786359300	99.695104	99.709584	99.677139	99.690832
49798	SP500	300	1786358400	7757.533571	7758.674383	7756.469325	7758.327722
49799	DOW	300	1786358400	54037.247910	54047.710421	54030.765361	54035.985535
49800	DXY	300	1786358400	99.700819	99.709464	99.686149	99.686952
47975	DOW	300	1786355400	54028.791199	54050.290521	54024.121830	54038.013329
47976	DXY	300	1786355400	99.692359	99.696620	99.664461	99.672485
48517	SP500	300	1786356300	7758.113792	7759.034106	7755.964422	7757.834182
48518	DOW	300	1786356300	54039.368455	54049.757677	54026.630130	54035.207082
48519	DXY	300	1786356300	99.674201	99.704403	99.668044	99.704403
49249	SP500	300	1786357500	7758.715011	7758.962831	7756.159606	7756.783341
49250	DOW	300	1786357500	54036.049482	54046.948499	54027.633250	54042.329126
49251	DXY	300	1786357500	99.707965	99.718819	99.698385	99.706896
49066	SP500	300	1786357200	7757.093521	7758.963407	7755.521079	7758.544366
49067	DOW	300	1786357200	54036.142132	54047.522695	54028.076812	54037.994855
49068	DXY	300	1786357200	99.701940	99.714027	99.696911	99.706679
48154	SP500	300	1786355700	7757.457047	7759.133466	7756.393826	7757.480619
48155	DOW	300	1786355700	54038.145183	54045.643669	54027.087482	54045.403651
48156	DXY	300	1786355700	99.673438	99.685787	99.657708	99.667791
51791	DOW	300	1786361700	54042.384477	54050.150754	54025.762198	54033.680977
51792	DXY	300	1786361700	99.721982	99.736703	99.707082	99.729446
48883	SP500	300	1786356900	7758.633189	7759.004467	7756.521102	7756.798689
48884	DOW	300	1786356900	54036.343010	54045.286580	54028.416934	54036.124788
48885	DXY	300	1786356900	99.719914	99.721859	99.697381	99.702967
49432	SP500	300	1786357800	7757.014357	7758.978225	7756.491958	7757.056656
49433	DOW	300	1786357800	54044.025498	54046.703748	54024.633346	54040.288373
49434	DXY	300	1786357800	99.705005	99.707252	99.677457	99.696608
52523	DOW	300	1786362900	54036.651995	54043.936284	54028.208786	54033.346291
51607	SP500	300	1786361400	7758.047715	7759.100093	7756.017848	7758.305425
51424	SP500	300	1786361100	7756.544313	7758.762710	7755.962611	7758.096859
48334	SP500	300	1786356000	7757.695607	7759.460425	7755.726670	7758.182900
51425	DOW	300	1786361100	54036.322262	54047.008878	54025.176075	54034.247454
51426	DXY	300	1786361100	99.729159	99.733452	99.709982	99.724057
48700	SP500	300	1786356600	7757.673177	7758.904054	7756.018158	7758.480870
48701	DOW	300	1786356600	54033.997805	54045.998400	54024.410922	54034.743994
50701	SP500	300	1786359900	7756.389191	7759.296940	7755.646236	7758.086131
50702	DOW	300	1786359900	54039.816261	54047.488377	54030.494701	54036.064682
50703	DXY	300	1786359900	99.696467	99.710064	99.682814	99.702293
50521	SP500	300	1786359600	7757.049319	7758.690081	7756.668685	7756.668685
50522	DOW	300	1786359600	54040.977461	54045.937202	54029.505241	54038.136421
50523	DXY	300	1786359600	99.692525	99.708417	99.676332	99.698907
49615	SP500	300	1786358100	7756.851801	7759.459634	7756.210537	7757.643003
49616	DOW	300	1786358100	54038.587107	54048.878286	54028.909954	54035.953292
49617	DXY	300	1786358100	99.698103	99.708715	99.683081	99.700298
51608	DOW	300	1786361400	54032.733457	54044.737843	54028.420866	54042.028099
51609	DXY	300	1786361400	99.721740	99.731194	99.707840	99.722107
50161	SP500	300	1786359000	7757.360070	7758.780217	7756.293242	7757.578299
50162	DOW	300	1786359000	54040.606928	54045.970848	54023.989905	54041.840559
50163	DXY	300	1786359000	99.700963	99.712966	99.689226	99.694460
51241	SP500	300	1786360800	7757.249572	7758.461213	7756.269878	7756.707908
51242	DOW	300	1786360800	54035.239619	54046.522789	54027.019247	54035.106284
51243	DXY	300	1786360800	99.718573	99.738265	99.700500	99.731499
52156	SP500	300	1786362300	7757.243937	7758.928647	7756.021319	7757.920703
52157	DOW	300	1786362300	54035.174132	54050.428335	54026.322859	54035.732709
52158	DXY	300	1786362300	99.726985	99.734384	99.704744	99.720842
51061	SP500	300	1786360500	7757.843162	7759.613524	7756.168507	7757.413140
52524	DXY	300	1786362900	99.731714	99.743513	99.717240	99.743513
52703	DOW	300	1786363200	54032.987177	54045.179849	54022.755365	54037.576692
52704	DXY	300	1786363200	99.745044	99.756503	99.728374	99.728727
52522	SP500	300	1786362900	7757.321103	7758.805279	7756.023557	7757.399503
51790	SP500	300	1786361700	7758.047864	7758.827441	7755.998764	7757.739792
51973	SP500	300	1786362000	7757.804023	7758.918351	7755.697246	7756.992176
51974	DOW	300	1786362000	54033.260829	54044.220687	54025.299081	54037.026818
51975	DXY	300	1786362000	99.727122	99.738881	99.713118	99.727915
52339	SP500	300	1786362600	7758.086005	7759.058404	7756.056901	7757.110933
52340	DOW	300	1786362600	54035.037711	54047.737651	54029.311683	54035.643614
52341	DXY	300	1786362600	99.720299	99.741563	99.703238	99.734206
52702	SP500	300	1786363200	7757.697145	7758.984980	7756.556085	7757.066226
52882	SP500	300	1786363500	7757.059245	7759.058675	7756.382677	7756.757173
52883	DOW	300	1786363500	54037.038389	54050.892715	54026.717037	54036.415978
52884	DXY	300	1786363500	99.728673	99.745494	99.713282	99.714597
53065	SP500	300	1786363800	7756.717767	7759.362265	7755.985382	7755.985382
53066	DOW	300	1786363800	54035.945013	54046.603507	54028.401090	54046.603507
53067	DXY	300	1786363800	99.713856	99.737793	99.711968	99.716102
53248	SP500	300	1786364100	7756.004758	7758.713706	7756.004758	7757.831570
53249	DOW	300	1786364100	54045.297954	54047.896114	54027.366840	54037.924436
53250	DXY	300	1786364100	99.713892	99.734506	99.674628	99.702065
57446	DOW	300	1786371000	53919.857040	53936.676346	53897.880000	53923.130789
57262	SP500	300	1786370700	7761.151613	7764.414376	7760.147837	7763.089414
57263	DOW	300	1786370700	53945.089493	53945.873857	53902.187931	53918.397951
57264	DXY	300	1786370700	99.794604	99.809001	99.767843	99.783871
55078	SP500	300	1786367100	7759.054411	7759.408151	7756.986093	7757.473542
55079	DOW	300	1786367100	54034.867631	54048.600587	54022.776620	54044.629598
55080	DXY	300	1786367100	99.765810	99.781331	99.755329	99.775899
53431	SP500	300	1786364400	7757.854484	7759.786812	7756.471690	7758.076663
53432	DOW	300	1786364400	54035.918118	54048.387161	54031.580221	54036.004996
53433	DXY	300	1786364400	99.704015	99.728634	99.682266	99.725376
57447	DXY	300	1786371000	99.785723	99.804401	99.774338	99.787726
56899	SP500	300	1786370100	7754.155219	7758.703037	7752.970599	7757.991355
56900	DOW	300	1786370100	53945.185291	53982.159133	53941.997632	53949.674784
56901	DXY	300	1786370100	99.757506	99.787300	99.755542	99.776756
56719	SP500	300	1786369800	7754.665633	7757.591024	7749.110000	7754.008763
56720	DOW	300	1786369800	53907.272825	53982.097893	53870.286174	53946.703723
56356	SP500	300	1786369200	7750.791020	7754.876456	7748.920821	7751.710356
53980	SP500	300	1786365300	7756.961729	7758.784253	7756.709885	7757.283088
53981	DOW	300	1786365300	54035.403954	54046.500974	54028.569599	54035.093494
53982	DXY	300	1786365300	99.739534	99.763519	99.731751	99.752273
56357	DOW	300	1786369200	53939.535162	54008.290000	53935.579769	53957.918993
56358	DXY	300	1786369200	99.738345	99.764568	99.726065	99.742563
55441	SP500	300	1786367700	7756.798898	7759.320938	7756.646396	7758.290843
55442	DOW	300	1786367700	54042.168527	54049.420412	54027.972060	54033.098083
55443	DXY	300	1786367700	99.772684	99.795007	99.766425	99.766425
53614	SP500	300	1786364700	7758.278054	7758.911129	7755.811953	7758.170005
53615	DOW	300	1786364700	54035.894493	54044.582384	54028.018768	54038.887194
53616	DXY	300	1786364700	99.724834	99.743663	99.710447	99.743663
55624	SP500	300	1786368000	7758.280367	7759.517976	7756.413971	7756.534690
54529	SP500	300	1786366200	7757.951680	7758.891825	7756.439001	7757.843869
54530	DOW	300	1786366200	54040.074068	54052.332016	54029.801769	54040.014214
54531	DXY	300	1786366200	99.759230	99.783828	99.754546	99.771177
54712	SP500	300	1786366500	7757.533610	7759.083779	7755.677558	7757.856505
54713	DOW	300	1786366500	54038.625740	54049.378465	54027.264542	54037.141034
54714	DXY	300	1786366500	99.773487	99.786177	99.753131	99.758389
54346	SP500	300	1786365900	7757.779284	7759.331083	7756.054856	7757.989206
54347	DOW	300	1786365900	54036.991292	54044.045887	54025.751393	54039.610926
54348	DXY	300	1786365900	99.753272	99.773020	99.747131	99.757992
55625	DOW	300	1786368000	54032.970757	54047.518023	54020.926319	54032.129839
55626	DXY	300	1786368000	99.765523	99.769987	99.732202	99.743339
55258	SP500	300	1786367400	7757.395746	7759.399625	7756.337335	7756.940741
53797	SP500	300	1786365000	7758.138874	7758.828027	7756.541556	7757.239239
53798	DOW	300	1786365000	54037.861621	54041.950765	54027.325268	54035.786513
53799	DXY	300	1786365000	99.741715	99.744604	99.714740	99.737686
55259	DOW	300	1786367400	54042.504460	54045.988102	54029.380314	54042.319643
55260	DXY	300	1786367400	99.775875	99.783753	99.758874	99.773233
54895	SP500	300	1786366800	7757.629455	7758.943346	7756.173831	7758.943346
54896	DOW	300	1786366800	54038.789015	54044.703511	54024.394011	54034.201897
54163	SP500	300	1786365600	7757.327870	7758.982848	7756.553522	7757.821182
54164	DOW	300	1786365600	54034.755880	54046.064678	54030.712428	54037.779927
54165	DXY	300	1786365600	99.751521	99.760286	99.729426	99.755133
54897	DXY	300	1786366800	99.756787	99.782340	99.752061	99.765688
56721	DXY	300	1786369800	99.762180	99.772691	99.746501	99.757754
55990	SP500	300	1786368600	7757.305326	7761.300000	7749.570000	7750.809627
55991	DOW	300	1786368600	54040.153477	54042.184754	53949.060000	53963.237068
55992	DXY	300	1786368600	99.736937	99.767200	99.722828	99.754436
56539	SP500	300	1786369500	7751.604994	7756.210635	7751.047055	7754.644108
56540	DOW	300	1786369500	53958.942881	53961.250832	53905.509105	53905.509105
56541	DXY	300	1786369500	99.740110	99.767010	99.733789	99.763133
56173	SP500	300	1786368900	7750.898515	7754.975787	7749.069173	7751.080413
56174	DOW	300	1786368900	53962.706167	53984.818568	53919.308765	53938.108194
55807	SP500	300	1786368300	7756.755552	7758.674352	7756.419937	7757.132997
55808	DOW	300	1786368300	54030.941316	54047.681086	54020.873350	54042.236237
55809	DXY	300	1786368300	99.743472	99.746832	99.726019	99.737982
56175	DXY	300	1786368900	99.754496	99.763341	99.728062	99.738272
57629	DOW	300	1786371300	53924.878126	53980.981821	53913.592373	53972.156051
57630	DXY	300	1786371300	99.790021	99.790021	99.744417	99.754811
58179	DXY	300	1786372200	99.729306	99.739453	99.712777	99.734181
57994	SP500	300	1786371900	7762.652849	7768.729237	7761.076977	7768.325557
57995	DOW	300	1786371900	53959.474725	54007.570085	53958.617039	54003.227263
57079	SP500	300	1786370400	7758.144157	7762.750014	7757.789822	7761.458605
57080	DOW	300	1786370400	53951.480351	53984.739099	53942.700000	53946.194124
57081	DXY	300	1786370400	99.776344	99.813504	99.776344	99.796911
57996	DXY	300	1786371900	99.744283	99.753066	99.718734	99.730930
58359	DXY	300	1786372500	99.732269	99.739209	99.696910	99.711268
57445	SP500	300	1786371000	7763.015012	7767.049132	7762.582731	7764.487145
58177	SP500	300	1786372200	7768.197555	7771.271098	7765.837103	7767.640498
58178	DOW	300	1786372200	54003.402412	54007.106297	53967.005650	53979.430914
57628	SP500	300	1786371300	7764.703874	7767.196625	7763.060689	7766.960825
57811	SP500	300	1786371600	7767.153417	7768.215946	7761.927939	7762.710623
57812	DOW	300	1786371600	53971.932988	53987.954119	53953.897722	53959.017535
57813	DXY	300	1786371600	99.753198	99.764272	99.728583	99.741793
58539	DXY	300	1786372800	99.709634	99.728941	99.704874	99.711391
58357	SP500	300	1786372500	7767.421518	7771.155552	7765.111330	7768.163199
58358	DOW	300	1786372500	53981.176865	53994.591242	53952.699435	53982.053660
58718	DOW	300	1786373100	53992.087218	54059.135759	53985.473131	54028.765938
58537	SP500	300	1786372800	7768.222073	7770.744772	7766.341244	7768.301095
58538	DOW	300	1786372800	53983.200106	54003.893141	53974.190193	53993.040304
58717	SP500	300	1786373100	7767.997181	7774.552488	7767.533517	7773.394941
60533	DOW	300	1786376100	54042.248777	54044.267990	53992.210036	53998.444362
60534	DXY	300	1786376100	99.705223	99.752397	99.700547	99.726518
61444	SP500	300	1786377600	7766.829508	7768.118423	7763.910128	7765.851661
61445	DOW	300	1786377600	54005.056780	54023.125898	53972.791939	53983.793601
61446	DXY	300	1786377600	99.734151	99.740370	99.699612	99.721436
59077	SP500	300	1786373700	7763.857050	7764.538520	7759.235506	7759.743132
59078	DOW	300	1786373700	54017.851073	54041.061122	54003.496593	54004.511777
59079	DXY	300	1786373700	99.696622	99.706957	99.680626	99.685851
61261	SP500	300	1786377300	7765.278367	7767.867774	7763.293250	7766.754606
61262	DOW	300	1786377300	54011.096739	54017.351263	53979.795917	54005.394665
61263	DXY	300	1786377300	99.728731	99.739304	99.710948	99.731741
63268	SP500	300	1786380600	7747.624694	7749.183070	7745.605452	7746.666096
59983	SP500	300	1786375200	7763.382094	7765.472157	7760.993425	7762.384194
59984	DOW	300	1786375200	54050.223457	54069.624181	54042.576869	54051.949276
59985	DXY	300	1786375200	99.739795	99.750886	99.712670	99.719886
59800	SP500	300	1786374900	7760.365390	7765.321577	7760.116059	7763.286957
59801	DOW	300	1786374900	54023.589360	54052.910961	54011.823590	54050.858491
59802	DXY	300	1786374900	99.746321	99.756155	99.725681	99.739812
63269	DOW	300	1786380600	53930.046412	53941.123958	53914.173918	53936.156048
63270	DXY	300	1786380600	99.714757	99.746286	99.710522	99.746156
63088	SP500	300	1786380300	7744.088677	7748.746910	7742.950730	7747.858486
60166	SP500	300	1786375500	7762.387399	7762.816269	7757.514719	7760.955946
60167	DOW	300	1786375500	54053.646982	54056.909446	54019.379786	54030.462229
60168	DXY	300	1786375500	99.720548	99.722636	99.686692	99.698127
59257	SP500	300	1786374000	7760.019644	7766.256717	7756.220474	7760.065048
59258	DOW	300	1786374000	54004.132176	54011.561715	53927.233188	53990.971525
59259	DXY	300	1786374000	99.683706	99.791337	99.683706	99.716886
59617	SP500	300	1786374600	7760.581381	7762.778524	7758.156953	7760.625735
59618	DOW	300	1786374600	54009.102608	54037.978840	53982.392480	54025.470467
59619	DXY	300	1786374600	99.713099	99.748372	99.706239	99.744812
61810	SP500	300	1786378200	7764.068460	7765.224591	7760.640563	7760.871849
58719	DXY	300	1786373100	99.712229	99.723279	99.695010	99.700940
61811	DOW	300	1786378200	53993.583104	54005.501405	53970.679548	53985.822721
61812	DXY	300	1786378200	99.699207	99.710544	99.688060	99.704012
60898	SP500	300	1786376700	7762.453447	7762.798375	7758.061752	7760.223820
60899	DOW	300	1786376700	53967.880867	53995.006637	53961.375322	53978.213181
60900	DXY	300	1786376700	99.742036	99.750535	99.724613	99.741827
58897	SP500	300	1786373400	7773.383832	7773.772522	7760.574438	7763.662613
58898	DOW	300	1786373400	54030.434684	54049.113126	54000.095251	54017.631653
58899	DXY	300	1786373400	99.700900	99.721166	99.692609	99.694847
60349	SP500	300	1786375800	7760.808403	7762.313524	7756.273434	7757.792332
60350	DOW	300	1786375800	54029.211651	54044.370822	54026.689155	54041.961290
60351	DXY	300	1786375800	99.697800	99.712577	99.689065	99.706914
61627	SP500	300	1786377900	7765.564294	7765.772500	7761.776039	7763.797131
60715	SP500	300	1786376400	7756.275053	7762.233202	7754.376110	7762.233202
60716	DOW	300	1786376400	53997.612839	54006.025342	53964.765556	53966.867749
60717	DXY	300	1786376400	99.725176	99.753169	99.714606	99.739919
59437	SP500	300	1786374300	7759.831872	7764.197665	7759.628400	7760.573985
59438	DOW	300	1786374300	53989.988672	54021.005421	53986.338330	54009.593591
59439	DXY	300	1786374300	99.717827	99.730779	99.710610	99.715199
61628	DOW	300	1786377900	53984.195338	54004.382398	53969.590077	53994.271075
61629	DXY	300	1786377900	99.722086	99.725935	99.695295	99.701484
61081	SP500	300	1786377000	7760.223618	7766.486871	7757.838744	7765.207395
61082	DOW	300	1786377000	53979.510612	54015.046096	53970.060404	54009.435339
61083	DXY	300	1786377000	99.740678	99.746929	99.719828	99.728852
63089	DOW	300	1786380300	53913.737360	53930.714773	53891.229238	53929.638911
63090	DXY	300	1786380300	99.724049	99.724049	99.692844	99.717078
62908	SP500	300	1786380000	7749.248275	7749.695770	7742.806115	7743.985891
62909	DOW	300	1786380000	53934.543987	53948.581509	53895.484597	53913.171912
60532	SP500	300	1786376100	7758.055557	7758.888262	7754.529485	7756.534316
62910	DXY	300	1786380000	99.698042	99.739173	99.690099	99.725988
62359	SP500	300	1786379100	7759.596191	7763.504491	7756.275760	7758.273016
62360	DOW	300	1786379100	53944.215272	53961.455520	53934.993996	53954.492183
62361	DXY	300	1786379100	99.703064	99.723705	99.692895	99.707164
62542	SP500	300	1786379400	7758.562716	7759.113597	7743.266752	7750.660450
61993	SP500	300	1786378500	7760.805188	7761.482746	7757.726856	7761.022092
61994	DOW	300	1786378500	53985.537166	53987.189293	53948.545187	53952.308553
61995	DXY	300	1786378500	99.704113	99.714040	99.682444	99.694600
62543	DOW	300	1786379400	53952.897715	53963.143770	53860.709037	53924.796307
62544	DXY	300	1786379400	99.708744	99.731656	99.704586	99.719150
62176	SP500	300	1786378800	7761.004760	7762.710873	7757.229502	7759.854575
62725	SP500	300	1786379700	7750.564558	7752.965886	7748.126278	7749.093914
62726	DOW	300	1786379700	53922.967820	53963.905407	53921.597838	53932.648576
62727	DXY	300	1786379700	99.718681	99.735352	99.690960	99.698655
62177	DOW	300	1786378800	53952.272199	53962.333298	53922.415494	53942.155833
62178	DXY	300	1786378800	99.694033	99.708954	99.684137	99.704545
63631	SP500	300	1786381200	7753.049000	7754.081607	7747.783736	7748.536703
63632	DOW	300	1786381200	53944.302096	53950.856717	53903.736198	53910.367414
63448	SP500	300	1786380900	7746.725448	7753.272929	7746.379454	7753.272929
63449	DOW	300	1786380900	53934.026710	53946.270482	53919.618387	53944.230952
63450	DXY	300	1786380900	99.746306	99.771975	99.735868	99.756120
63633	DXY	300	1786381200	99.754550	99.763012	99.734834	99.746649
63814	SP500	300	1786381500	7748.608409	7754.423669	7747.720391	7753.215506
63815	DOW	300	1786381500	53910.984346	53920.736603	53895.458603	53913.990114
63816	DXY	300	1786381500	99.748632	99.761702	99.736363	99.752325
63997	SP500	300	1786381800	7753.325918	7755.207330	7751.862487	7754.338530
63998	DOW	300	1786381800	53913.034404	53922.116501	53891.910380	53912.020502
63999	DXY	300	1786381800	99.754201	99.783424	99.743500	99.779451
64180	SP500	300	1786382100	7754.140940	7757.589839	7752.494066	7753.731207
68930	DOW	300	1786389900	53899.801861	53909.707588	53864.220174	53864.220174
66739	SP500	300	1786386300	7748.629094	7750.582602	7746.948384	7748.931399
66740	DOW	300	1786386300	53882.650777	53887.071739	53863.346977	53870.060289
64912	SP500	300	1786383300	7753.983651	7755.266206	7750.233434	7751.987888
64546	SP500	300	1786382700	7753.818104	7754.775362	7751.709247	7753.213855
64547	DOW	300	1786382700	53907.372455	53922.995863	53894.384592	53914.620052
64548	DXY	300	1786382700	99.785409	99.807081	99.772865	99.807081
64913	DOW	300	1786383300	53900.368300	53911.217510	53872.317541	53893.311961
64914	DXY	300	1786383300	99.798934	99.809187	99.776053	99.786103
66741	DXY	300	1786386300	99.796312	99.813437	99.793651	99.796953
66373	SP500	300	1786385700	7749.643263	7751.465876	7748.334782	7749.953601
66190	SP500	300	1786385400	7751.788778	7754.361090	7749.088993	7749.950804
66191	DOW	300	1786385400	53903.072069	53912.638072	53869.156789	53874.641485
66192	DXY	300	1786385400	99.802839	99.814150	99.792560	99.796883
66374	DOW	300	1786385700	53876.727055	53892.772693	53863.782232	53875.220881
66375	DXY	300	1786385700	99.797412	99.809031	99.785757	99.803295
66922	SP500	300	1786386600	7749.054933	7750.550773	7746.471461	7750.105929
66923	DOW	300	1786386600	53871.128050	53878.677570	53850.167634	53854.018578
66007	SP500	300	1786385100	7751.650496	7753.708458	7748.987965	7751.921998
66008	DOW	300	1786385100	53901.361404	53914.895051	53892.189020	53901.164749
66009	DXY	300	1786385100	99.803429	99.816922	99.793431	99.802052
64181	DOW	300	1786382100	53913.867544	53924.132726	53894.430875	53908.168983
64182	DXY	300	1786382100	99.780299	99.800029	99.771578	99.780228
66924	DXY	300	1786386600	99.794544	99.820112	99.789358	99.803523
64729	SP500	300	1786383000	7753.410233	7756.674637	7752.633417	7754.171258
64730	DOW	300	1786383000	53913.217765	53914.525349	53893.023927	53901.860802
64731	DXY	300	1786383000	99.809347	99.813827	99.794189	99.801041
65461	SP500	300	1786384200	7748.809293	7750.561691	7747.342394	7749.693045
65462	DOW	300	1786384200	53915.343272	53920.408573	53886.196293	53903.890436
65463	DXY	300	1786384200	99.781342	99.787049	99.768375	99.777577
65278	SP500	300	1786383900	7749.058978	7751.701457	7748.283193	7749.084779
64363	SP500	300	1786382400	7753.740700	7756.423880	7751.927271	7753.616518
64364	DOW	300	1786382400	53907.040278	53918.344735	53888.597876	53906.183992
64365	DXY	300	1786382400	99.778462	99.803713	99.772462	99.783505
65279	DOW	300	1786383900	53888.930308	53920.360153	53877.952781	53916.208134
65280	DXY	300	1786383900	99.779302	99.786409	99.759769	99.782366
67468	SP500	300	1786387500	7751.527331	7753.393571	7750.541572	7750.937471
67469	DOW	300	1786387500	53887.471529	53901.178503	53881.433532	53883.121574
67470	DXY	300	1786387500	99.795627	99.808827	99.785561	99.801603
66556	SP500	300	1786386000	7749.844749	7750.960741	7747.430945	7748.804658
66557	DOW	300	1786386000	53877.009088	53889.437374	53858.199395	53882.064139
65095	SP500	300	1786383600	7752.155287	7753.553541	7749.215300	7749.215300
65096	DOW	300	1786383600	53893.619326	53912.533889	53880.162416	53889.376130
65097	DXY	300	1786383600	99.785509	99.793806	99.764859	99.777867
65641	SP500	300	1786384500	7749.451747	7752.025586	7747.771733	7750.463034
65642	DOW	300	1786384500	53903.521313	53911.457060	53886.113580	53888.305362
65643	DXY	300	1786384500	99.780067	99.809471	99.774820	99.795908
66558	DXY	300	1786386000	99.805583	99.805623	99.781843	99.795875
68197	SP500	300	1786388700	7755.436198	7757.635050	7754.700000	7756.442558
68198	DOW	300	1786388700	53894.829555	53915.247382	53879.410993	53903.007300
68014	SP500	300	1786388400	7755.084304	7756.171060	7753.749448	7755.721723
68015	DOW	300	1786388400	53893.697128	53897.393965	53870.331265	53895.576109
68016	DXY	300	1786388400	99.796050	99.830725	99.788892	99.829359
67288	SP500	300	1786387200	7748.446726	7753.121543	7747.968436	7751.596831
67289	DOW	300	1786387200	53864.166467	53895.135681	53864.166467	53887.466381
65824	SP500	300	1786384800	7750.510026	7752.230912	7748.607341	7751.691317
67290	DXY	300	1786387200	99.804971	99.818549	99.773182	99.793323
67105	SP500	300	1786386900	7750.029125	7750.490140	7746.131426	7748.699272
67106	DOW	300	1786386900	53854.790797	53875.736802	53843.512805	53863.330095
65825	DOW	300	1786384800	53887.987029	53913.292381	53887.400803	53901.668374
65826	DXY	300	1786384800	99.793525	99.808728	99.776818	99.802940
67107	DXY	300	1786386900	99.805432	99.818785	99.794833	99.807299
68199	DXY	300	1786388700	99.827839	99.831205	99.797549	99.804835
67831	SP500	300	1786388100	7754.410261	7757.118773	7752.360364	7755.326101
67832	DOW	300	1786388100	53906.359388	53914.094585	53891.103131	53891.861524
67833	DXY	300	1786388100	99.786789	99.803300	99.778665	99.793921
67648	SP500	300	1786387800	7750.666415	7755.040878	7750.666415	7754.606153
67649	DOW	300	1786387800	53884.788278	53908.933630	53880.952049	53905.555306
67650	DXY	300	1786387800	99.801276	99.803511	99.777933	99.785289
68563	SP500	300	1786389300	7756.046671	7758.249180	7754.135422	7755.767527
68564	DOW	300	1786389300	53889.875856	53910.699486	53884.243387	53910.396242
68565	DXY	300	1786389300	99.822129	99.831718	99.802766	99.821601
68380	SP500	300	1786389000	7756.218662	7757.566042	7754.317565	7755.763080
68381	DOW	300	1786389000	53904.757631	53910.902504	53888.159824	53888.624053
68382	DXY	300	1786389000	99.805035	99.827975	99.804958	99.822904
68746	SP500	300	1786389600	7756.015859	7757.085625	7754.309365	7756.702671
68747	DOW	300	1786389600	53908.772595	53920.112160	53893.412729	53901.619688
68931	DXY	300	1786389900	99.821364	99.841191	99.809783	99.815637
69111	DXY	300	1786390200	99.813445	99.824331	99.796460	99.803738
68748	DXY	300	1786389600	99.824086	99.833550	99.810631	99.820858
68929	SP500	300	1786389900	7756.994464	7757.037317	7751.674826	7752.968825
69291	DXY	300	1786390500	99.801551	99.821898	99.799195	99.804874
69109	SP500	300	1786390200	7752.699171	7752.797921	7749.590801	7751.989940
69110	DOW	300	1786390200	53864.278459	53880.155014	53854.945031	53877.983034
69289	SP500	300	1786390500	7752.251310	7756.095529	7750.384850	7754.203823
69290	DOW	300	1786390500	53878.550482	53904.807037	53860.923847	53898.397241
69469	SP500	300	1786390800	7754.066606	7755.553663	7751.643008	7753.621776
69470	DOW	300	1786390800	53896.517221	53914.206977	53884.128875	53899.797163
69471	DXY	300	1786390800	99.803405	99.836187	99.803050	99.828966
71294	DOW	300	1786393800	53980.229643	53983.992567	53963.229192	53977.076049
71295	DXY	300	1786393800	99.814585	99.826093	99.803749	99.814354
73298	DOW	300	1786397100	53980.049195	53984.407155	53967.424979	53970.208906
73299	DXY	300	1786397100	99.814031	99.822857	99.802982	99.803527
74027	DOW	300	1786398300	53971.640624	53987.034919	53968.370801	53971.375296
73660	SP500	300	1786397700	7753.097214	7755.184107	7752.360259	7752.691593
73661	DOW	300	1786397700	53979.160606	53983.536301	53969.472662	53977.765255
69652	SP500	300	1786391100	7753.432459	7755.174116	7750.512294	7754.779732
69653	DOW	300	1786391100	53899.477795	53914.572849	53891.337370	53909.990636
69654	DXY	300	1786391100	99.828245	99.829641	99.802172	99.822902
73477	SP500	300	1786397400	7752.672859	7754.463508	7752.163878	7753.045313
73478	DOW	300	1786397400	53968.353834	53983.693827	53965.732884	53979.816523
73479	DXY	300	1786397400	99.805835	99.824082	99.799753	99.812753
71653	SP500	300	1786394400	7754.279813	7754.537595	7752.112384	7753.622362
71654	DOW	300	1786394400	53975.693043	53986.223654	53969.239591	53973.130988
71655	DXY	300	1786394400	99.824365	99.832404	99.813379	99.818720
72568	SP500	300	1786395900	7753.209757	7754.505627	7751.492232	7753.123523
70201	SP500	300	1786392000	7752.149614	7754.441372	7750.641008	7754.309492
70202	DOW	300	1786392000	53964.346579	53984.665125	53963.922385	53979.042463
70203	DXY	300	1786392000	99.813009	99.824779	99.798345	99.811144
71836	SP500	300	1786394700	7753.479777	7754.436589	7751.853470	7752.481694
71837	DOW	300	1786394700	53972.846223	53986.131374	53962.565601	53977.066064
71838	DXY	300	1786394700	99.816972	99.829651	99.807164	99.813704
71473	SP500	300	1786394100	7752.458173	7754.376753	7751.921457	7754.376753
69835	SP500	300	1786391400	7754.484750	7754.804744	7745.009780	7747.452895
69836	DOW	300	1786391400	53910.848492	53911.767926	53890.994819	53894.612363
69837	DXY	300	1786391400	99.824607	99.827636	99.800431	99.814656
71474	DOW	300	1786394100	53976.422854	53984.524980	53966.194698	53974.366545
71475	DXY	300	1786394100	99.812000	99.832433	99.808279	99.822826
70933	SP500	300	1786393200	7753.369225	7754.880597	7751.791538	7751.868574
70934	DOW	300	1786393200	53969.806099	53985.614861	53964.925707	53981.498752
70935	DXY	300	1786393200	99.814145	99.818916	99.799646	99.801810
70750	SP500	300	1786392900	7752.515583	7754.337682	7752.138439	7753.333620
70751	DOW	300	1786392900	53975.503196	53985.966472	53966.236968	53969.765659
70752	DXY	300	1786392900	99.805417	99.821203	99.802283	99.815331
70567	SP500	300	1786392600	7752.785418	7754.211174	7751.219859	7752.516515
70568	DOW	300	1786392600	53971.698146	53982.907296	53967.889924	53974.743353
70569	DXY	300	1786392600	99.824171	99.826406	99.802504	99.807859
72569	DOW	300	1786395900	53975.799204	53987.151239	53969.606054	53970.598120
72570	DXY	300	1786395900	99.817439	99.823807	99.805248	99.807671
71113	SP500	300	1786393500	7751.563988	7754.439107	7751.178031	7752.458976
70018	SP500	300	1786391700	7747.226451	7752.327391	7744.901986	7752.234823
70019	DOW	300	1786391700	53896.153966	53965.972864	53888.240540	53964.051440
70020	DXY	300	1786391700	99.812844	99.819889	99.803183	99.814516
71114	DOW	300	1786393500	53981.641233	53984.961400	53966.690653	53978.256519
71115	DXY	300	1786393500	99.799934	99.824040	99.794418	99.815943
70384	SP500	300	1786392300	7754.076838	7754.350658	7752.167628	7753.020751
70385	DOW	300	1786392300	53978.616155	53988.752176	53967.414560	53971.485301
70386	DXY	300	1786392300	99.812034	99.826301	99.802639	99.822288
72202	SP500	300	1786395300	7752.574387	7754.411363	7751.736604	7752.886199
72203	DOW	300	1786395300	53978.726961	53985.099349	53966.525904	53975.684024
72204	DXY	300	1786395300	99.814388	99.822723	99.805831	99.815723
73117	SP500	300	1786396800	7752.112514	7754.478768	7751.814592	7752.079149
73118	DOW	300	1786396800	53977.708685	53984.002883	53963.998696	53977.893465
73119	DXY	300	1786396800	99.812217	99.820064	99.801216	99.812346
72934	SP500	300	1786396500	7752.108211	7754.308184	7751.901960	7752.413151
72019	SP500	300	1786395000	7752.286212	7754.700725	7751.535734	7752.702291
72020	DOW	300	1786395000	53976.539571	53985.371922	53966.340497	53978.564044
72021	DXY	300	1786395000	99.813688	99.827490	99.804746	99.814862
71293	SP500	300	1786393800	7752.528115	7754.184238	7750.664387	7752.548213
72935	DOW	300	1786396500	53974.558521	53985.955863	53965.082140	53979.060968
72385	SP500	300	1786395600	7752.645916	7754.197302	7752.333746	7753.429449
72386	DOW	300	1786395600	53973.578902	53984.154490	53967.695811	53973.810530
72387	DXY	300	1786395600	99.813790	99.823767	99.805619	99.817341
72751	SP500	300	1786396200	7753.318001	7754.501985	7752.246478	7752.344886
72752	DOW	300	1786396200	53970.118184	53985.531374	53967.623308	53976.223235
72753	DXY	300	1786396200	99.809163	99.820083	99.791834	99.809696
72936	DXY	300	1786396500	99.808953	99.823108	99.794137	99.811458
73662	DXY	300	1786397700	99.812327	99.820485	99.793428	99.808290
73843	SP500	300	1786398000	7752.684135	7755.002814	7752.156244	7753.389887
73844	DOW	300	1786398000	53978.995603	53984.719656	53963.247475	53972.144975
73845	DXY	300	1786398000	99.807320	99.818834	99.791364	99.809373
73297	SP500	300	1786397100	7752.031354	7754.885774	7751.392919	7752.771390
74028	DXY	300	1786398300	99.807144	99.815350	99.793316	99.802035
74210	DOW	300	1786398600	53970.000167	53989.043845	53969.355832	53980.063657
74392	SP500	300	1786398900	7752.116251	7754.367103	7751.975620	7752.957448
74211	DXY	300	1786398600	99.800552	99.815311	99.794394	99.807365
74026	SP500	300	1786398300	7753.641130	7754.322668	7751.725840	7754.321119
74209	SP500	300	1786398600	7754.320020	7754.637119	7751.970199	7752.309646
74393	DOW	300	1786398900	53981.720724	53983.259809	53963.467280	53976.440940
74394	DXY	300	1786398900	99.809847	99.817460	99.795952	99.807934
74575	SP500	300	1786399200	7753.025885	7754.392917	7752.303003	7753.428149
74576	DOW	300	1786399200	53974.594089	53987.787024	53965.665716	53982.114538
74577	DXY	300	1786399200	99.809588	99.817977	99.796447	99.798807
74758	SP500	300	1786399500	7753.701509	7754.374092	7751.965143	7753.801099
74759	DOW	300	1786399500	53982.944876	53987.180841	53964.875196	53974.385714
74760	DXY	300	1786399500	99.800007	99.822712	99.794796	99.804789
74941	SP500	300	1786399800	7753.601123	7754.173351	7751.685449	7753.705876
74942	DOW	300	1786399800	53972.959052	53985.201588	53965.639209	53976.283622
77481	DXY	300	1786404000	99.798670	99.817895	99.793248	99.801971
76759	SP500	300	1786402800	7752.203097	7754.646082	7751.596682	7752.214759
76760	DOW	300	1786402800	53974.178630	53984.919258	53964.656083	53978.318213
76761	DXY	300	1786402800	99.804640	99.820521	99.796361	99.808339
78026	DOW	300	1786404900	53980.182600	53983.363059	53966.681181	53975.539792
78027	DXY	300	1786404900	99.813552	99.816801	99.797289	99.816801
75673	SP500	300	1786401000	7753.204499	7754.220121	7751.783172	7753.679652
75674	DOW	300	1786401000	53976.774250	53986.197488	53965.989720	53972.899523
75675	DXY	300	1786401000	99.808361	99.818718	99.791316	99.810099
75307	SP500	300	1786400400	7753.189076	7755.026682	7751.968246	7753.541828
75308	DOW	300	1786400400	53975.047683	53992.309947	53963.482581	53971.827865
75309	DXY	300	1786400400	99.803638	99.819081	99.793915	99.810891
79489	SP500	300	1786407300	7752.899648	7754.311160	7751.784114	7752.983616
77842	SP500	300	1786404600	7753.511124	7754.110060	7750.949602	7753.794458
77843	DOW	300	1786404600	53975.308091	53991.524083	53967.392413	53981.388850
77844	DXY	300	1786404600	99.805864	99.816276	99.793424	99.811384
79490	DOW	300	1786407300	53976.639468	53986.425483	53966.413761	53972.877927
77119	SP500	300	1786403400	7753.243562	7754.423266	7751.538830	7753.474761
77120	DOW	300	1786403400	53979.528553	53981.865187	53964.687287	53973.651854
77121	DXY	300	1786403400	99.811392	99.815179	99.798417	99.812505
76219	SP500	300	1786401900	7752.856737	7753.803068	7751.678652	7752.152899
76220	DOW	300	1786401900	53973.548637	53985.472433	53967.080557	53979.164704
76221	DXY	300	1786401900	99.808916	99.815295	99.787378	99.810529
76399	SP500	300	1786402200	7752.434205	7754.622595	7751.584751	7753.106620
76400	DOW	300	1786402200	53978.457748	53984.132965	53967.749806	53975.040902
76401	DXY	300	1786402200	99.811924	99.818697	99.790880	99.810654
76039	SP500	300	1786401600	7752.974765	7754.086263	7751.502875	7752.987362
76040	DOW	300	1786401600	53973.782407	53984.276983	53966.754469	53972.120621
76041	DXY	300	1786401600	99.808592	99.816111	99.797627	99.806700
75490	SP500	300	1786400700	7753.398136	7754.482488	7751.972942	7753.405960
75491	DOW	300	1786400700	53973.452252	53986.015231	53966.339761	53978.787024
75492	DXY	300	1786400700	99.813341	99.819000	99.796947	99.806656
74943	DXY	300	1786399800	99.804110	99.818606	99.793273	99.808413
79491	DXY	300	1786407300	99.771814	99.779217	99.757046	99.758102
79852	SP500	300	1786407900	7753.069141	7754.372225	7752.031541	7752.550497
79853	DOW	300	1786407900	53980.554334	53985.908678	53966.855609	53976.314393
78574	SP500	300	1786405800	7753.256740	7754.718421	7751.537992	7752.809891
76939	SP500	300	1786403100	7752.400094	7754.859645	7752.249474	7753.472912
76940	DOW	300	1786403100	53976.548447	53986.238244	53967.714482	53978.441850
76579	SP500	300	1786402500	7752.984965	7754.921527	7751.783381	7751.920462
75124	SP500	300	1786400100	7753.897708	7754.445297	7751.349902	7753.051393
75125	DOW	300	1786400100	53975.911305	53986.920147	53966.459436	53973.085311
75126	DXY	300	1786400100	99.806826	99.817620	99.797709	99.805253
75856	SP500	300	1786401300	7753.511615	7754.567027	7752.135377	7752.824453
75857	DOW	300	1786401300	53973.001466	53985.461626	53962.627935	53972.097153
75858	DXY	300	1786401300	99.812164	99.814038	99.796692	99.807275
76580	DOW	300	1786402500	53973.070607	53984.814497	53968.972546	53975.733227
76581	DXY	300	1786402500	99.809946	99.816074	99.795760	99.804009
76941	DXY	300	1786403100	99.805844	99.816937	99.792680	99.810040
77299	SP500	300	1786403700	7753.175160	7753.771880	7751.414159	7752.287744
77300	DOW	300	1786403700	53971.612177	53984.930884	53964.398103	53968.752918
77301	DXY	300	1786403700	99.814960	99.820703	99.797245	99.801124
78575	DOW	300	1786405800	53979.372678	53988.939268	53964.106975	53973.118399
78576	DXY	300	1786405800	99.801323	99.811138	99.795504	99.804094
78208	SP500	300	1786405200	7751.898862	7754.675140	7751.483907	7752.826234
78209	DOW	300	1786405200	53973.514246	53985.571656	53966.957136	53974.705401
78210	DXY	300	1786405200	99.815736	99.818269	99.793316	99.804348
78757	SP500	300	1786406100	7752.585368	7754.306441	7750.958787	7752.527672
77659	SP500	300	1786404300	7752.363692	7754.186941	7751.516663	7753.618151
77660	DOW	300	1786404300	53979.439525	53986.140351	53968.872932	53976.500691
77661	DXY	300	1786404300	99.802880	99.814184	99.794991	99.804551
77479	SP500	300	1786404000	7752.510731	7754.027317	7751.432713	7752.520512
77480	DOW	300	1786404000	53967.128702	53987.107153	53965.401811	53978.851998
78758	DOW	300	1786406100	53973.129170	53984.829196	53966.430254	53980.386172
78759	DXY	300	1786406100	99.801643	99.806689	99.779386	99.790507
78391	SP500	300	1786405500	7752.680070	7754.741235	7751.393256	7753.157173
78392	DOW	300	1786405500	53973.532175	53986.024138	53968.337207	53979.364271
78393	DXY	300	1786405500	99.805018	99.818862	99.790001	99.802798
78025	SP500	300	1786404900	7753.930477	7754.529213	7750.991275	7752.089701
78940	SP500	300	1786406400	7752.809358	7754.701334	7751.360661	7754.174494
78941	DOW	300	1786406400	53978.974520	53987.307845	53968.164822	53981.381812
78942	DXY	300	1786406400	99.790697	99.799824	99.778097	99.794008
79123	SP500	300	1786406700	7754.342743	7754.709782	7751.729158	7753.386147
79124	DOW	300	1786406700	53980.930946	53983.627854	53967.706736	53973.769362
79125	DXY	300	1786406700	99.794309	99.802533	99.761432	99.767448
79306	SP500	300	1786407000	7753.186710	7754.218251	7751.848216	7752.732104
79307	DOW	300	1786407000	53972.060698	53982.849386	53967.430531	53977.988336
79308	DXY	300	1786407000	99.765229	99.779429	99.758249	99.772275
79669	SP500	300	1786407600	7753.203866	7754.067059	7751.525977	7752.843821
79670	DOW	300	1786407600	53972.646589	53984.259170	53967.794617	53978.547217
79671	DXY	300	1786407600	99.756950	99.775552	99.750914	99.761843
79854	DXY	300	1786407900	99.760308	99.777757	99.751053	99.759278
80035	SP500	300	1786408200	7752.801006	7754.296163	7752.104004	7752.696085
80036	DOW	300	1786408200	53977.715526	53987.919808	53969.376218	53981.235983
80037	DXY	300	1786408200	99.756937	99.777795	99.751870	99.761743
80218	SP500	300	1786408500	7752.913010	7754.992164	7751.903425	7752.848834
80219	DOW	300	1786408500	53980.113659	53988.588345	53969.108202	53977.201034
80220	DXY	300	1786408500	99.761394	99.769491	99.742800	99.761934
80401	SP500	300	1786408800	7752.552010	7754.610348	7751.996644	7753.313260
82405	SP500	300	1786412100	7753.632310	7754.469060	7751.745349	7752.175146
80767	SP500	300	1786409400	7752.241805	7754.627595	7751.855547	7752.980452
80768	DOW	300	1786409400	53975.335365	53986.770837	53966.493209	53976.372966
80769	DXY	300	1786409400	99.759212	99.764667	99.725083	99.738957
82406	DOW	300	1786412100	53976.472141	53982.048040	53964.932672	53972.849599
82407	DXY	300	1786412100	99.753156	99.767752	99.736878	99.744281
85137	DXY	300	1786416600	99.814337	99.818795	99.797548	99.813061
84586	SP500	300	1786415700	7753.640964	7754.569767	7751.648864	7752.681986
84587	DOW	300	1786415700	53970.941709	53989.800601	53966.985457	53970.907853
84040	SP500	300	1786414800	7753.374869	7754.452843	7751.005463	7753.790758
83857	SP500	300	1786414500	7752.993433	7755.312847	7751.636074	7753.225518
83858	DOW	300	1786414500	53971.689591	53985.028155	53965.307594	53974.600169
83859	DXY	300	1786414500	99.782184	99.795229	99.762532	99.795229
84041	DOW	300	1786414800	53973.605513	53990.149110	53968.486718	53977.806013
84042	DXY	300	1786414800	99.793488	99.801599	99.776092	99.778458
82222	SP500	300	1786411800	7753.271377	7755.040124	7751.784389	7753.639554
82223	DOW	300	1786411800	53975.584615	53989.837389	53967.131030	53976.276531
82224	DXY	300	1786411800	99.753492	99.759475	99.731122	99.750798
81673	SP500	300	1786410900	7753.415032	7754.919324	7751.331213	7752.860170
81674	DOW	300	1786410900	53980.747113	53988.682798	53969.743389	53973.649269
81675	DXY	300	1786410900	99.791086	99.795062	99.753525	99.759151
81490	SP500	300	1786410600	7752.962941	7754.255751	7752.042831	7753.482284
80402	DOW	300	1786408800	53975.178250	53985.735362	53963.841777	53971.545326
80403	DXY	300	1786408800	99.763367	99.772688	99.749245	99.768427
80947	SP500	300	1786409700	7753.187012	7754.572832	7751.468646	7753.438267
80948	DOW	300	1786409700	53977.666819	53984.315662	53966.770013	53973.927926
80949	DXY	300	1786409700	99.738817	99.754779	99.729235	99.746661
81491	DOW	300	1786410600	53975.901080	53983.447992	53965.203404	53982.685945
81492	DXY	300	1786410600	99.766122	99.805673	99.762031	99.793088
83674	SP500	300	1786414200	7752.965649	7754.348743	7751.291213	7753.262636
83131	SP500	300	1786413300	7752.961158	7754.507903	7751.803906	7753.980350
83132	DOW	300	1786413300	53972.904995	53988.531656	53964.654778	53977.791229
81307	SP500	300	1786410300	7753.327203	7754.301358	7751.328705	7753.113348
80584	SP500	300	1786409100	7753.450747	7754.585882	7751.874854	7752.396515
80585	DOW	300	1786409100	53972.868289	53986.242674	53960.340242	53976.427339
80586	DXY	300	1786409100	99.769514	99.777004	99.750960	99.759827
81308	DOW	300	1786410300	53975.026621	53991.682157	53967.364867	53975.497686
81309	DXY	300	1786410300	99.745653	99.774087	99.742930	99.767522
83133	DXY	300	1786413300	99.766913	99.775082	99.742149	99.748604
82948	SP500	300	1786413000	7753.193286	7754.750226	7751.975403	7752.785281
81856	SP500	300	1786411200	7752.883094	7754.185463	7752.003276	7753.133671
81857	DOW	300	1786411200	53974.539279	53983.440767	53963.964155	53973.462930
81858	DXY	300	1786411200	99.758026	99.775943	99.749742	99.749742
82949	DOW	300	1786413000	53976.987444	53987.677875	53962.167731	53973.726777
82950	DXY	300	1786413000	99.750503	99.770867	99.737243	99.767568
83675	DOW	300	1786414200	53975.859316	53989.680844	53966.769747	53973.179759
81127	SP500	300	1786410000	7753.278166	7754.034953	7751.833955	7753.141617
81128	DOW	300	1786410000	53974.403989	53988.304319	53968.672392	53977.040357
81129	DXY	300	1786410000	99.745701	99.759325	99.736657	99.747928
83676	DXY	300	1786414200	99.767425	99.785110	99.765138	99.781025
82585	SP500	300	1786412400	7752.399271	7754.674682	7751.947215	7752.969251
82586	DOW	300	1786412400	53972.866646	53986.396214	53968.074704	53976.821012
82039	SP500	300	1786411500	7753.026146	7754.044462	7751.360870	7753.491915
82040	DOW	300	1786411500	53974.238578	53988.729339	53961.593790	53977.184403
82041	DXY	300	1786411500	99.750136	99.763752	99.740043	99.752377
82587	DXY	300	1786412400	99.743553	99.755266	99.727296	99.744335
84588	DXY	300	1786415700	99.821350	99.828935	99.792345	99.813318
82765	SP500	300	1786412700	7752.916581	7754.581845	7751.709253	7753.420233
82766	DOW	300	1786412700	53977.511536	53984.505667	53965.989279	53977.837118
82767	DXY	300	1786412700	99.746127	99.754273	99.727880	99.751731
84403	SP500	300	1786415400	7753.472530	7754.615908	7752.031624	7753.617436
84404	DOW	300	1786415400	53974.073017	53981.690381	53963.161613	53971.204612
83311	SP500	300	1786413600	7754.248450	7754.801852	7752.168598	7752.955535
83312	DOW	300	1786413600	53978.468252	53985.571579	53963.488043	53977.637854
84223	SP500	300	1786415100	7753.533936	7754.739793	7751.263685	7753.660303
84224	DOW	300	1786415100	53976.466293	53981.921395	53962.403246	53973.248557
83491	SP500	300	1786413900	7753.089743	7754.789065	7751.353791	7752.807540
83313	DXY	300	1786413600	99.746187	99.767867	99.739023	99.742015
83492	DOW	300	1786413900	53978.732633	53986.106461	53971.147025	53974.743568
83493	DXY	300	1786413900	99.741806	99.770542	99.741627	99.766922
84225	DXY	300	1786415100	99.776565	99.804310	99.774885	99.792703
84405	DXY	300	1786415400	99.795158	99.825946	99.787597	99.819738
85136	DOW	300	1786416600	53976.248078	53985.376670	53968.041634	53972.054851
85135	SP500	300	1786416600	7754.632394	7755.014205	7751.997552	7753.428145
84769	SP500	300	1786416000	7752.898777	7754.596383	7751.720201	7753.643389
84770	DOW	300	1786416000	53972.935170	53985.405424	53964.982875	53976.957663
84771	DXY	300	1786416000	99.815024	99.825783	99.802960	99.815178
84952	SP500	300	1786416300	7753.523033	7754.618476	7751.547761	7754.618476
84953	DOW	300	1786416300	53978.982992	53985.998639	53964.873054	53975.107381
84954	DXY	300	1786416300	99.813937	99.824140	99.799573	99.811988
85318	SP500	300	1786416900	7753.723997	7754.787654	7751.522851	7753.062430
85319	DOW	300	1786416900	53971.377776	53985.906029	53968.867809	53975.212202
85320	DXY	300	1786416900	99.814251	99.828500	99.807378	99.828147
85501	SP500	300	1786417200	7753.236352	7755.069387	7751.446313	7752.339805
85502	DOW	300	1786417200	53977.242380	53985.022955	53966.798823	53977.300833
85503	DXY	300	1786417200	99.829490	99.833608	99.809617	99.829105
85684	SP500	300	1786417500	7752.410262	7754.422552	7751.532812	7753.538362
85685	DOW	300	1786417500	53975.868953	53983.147025	53964.863993	53978.797557
85686	DXY	300	1786417500	99.828518	99.842184	99.810905	99.826116
90496	SP500	300	1786425000	7752.270429	7754.478180	7751.827876	7752.821087
90497	DOW	300	1786425000	53984.703980	53987.484043	53965.809656	53971.876236
90157	SP500	300	1786424700	7753.612560	7755.094199	7751.646815	7752.235934
90158	DOW	300	1786424700	53981.093428	53992.258440	53960.590515	53982.614344
90159	DXY	300	1786424700	99.794062	99.810768	99.783280	99.789443
89962	SP500	300	1786424400	7752.917110	7754.095253	7750.694865	7753.538722
87514	SP500	300	1786420500	7752.386743	7754.205138	7751.472149	7753.252933
87515	DOW	300	1786420500	53980.283548	53986.403451	53967.129283	53978.623200
87516	DXY	300	1786420500	99.796426	99.801421	99.778534	99.795399
85867	SP500	300	1786417800	7753.798718	7754.965017	7751.777388	7752.286067
85868	DOW	300	1786417800	53976.822043	53984.494437	53964.345618	53970.314264
85869	DXY	300	1786417800	99.824622	99.827136	99.812109	99.813956
88780	SP500	300	1786422600	7752.931167	7755.148592	7752.159762	7753.108690
88781	DOW	300	1786422600	53975.564386	53984.588027	53963.791741	53974.464072
88782	DXY	300	1786422600	99.778171	99.791348	99.771074	99.790656
89963	DOW	300	1786424400	53974.010391	53984.086838	53961.563886	53982.738350
89964	DXY	300	1786424400	99.821542	99.831017	99.794159	99.796500
88057	SP500	300	1786421400	7752.686110	7754.606062	7751.258449	7754.337072
87877	SP500	300	1786421100	7752.597302	7754.380180	7751.812815	7752.940672
86416	SP500	300	1786418700	7752.742732	7754.449727	7751.923249	7753.297449
86417	DOW	300	1786418700	53976.441066	53987.906201	53964.050907	53979.255794
86418	DXY	300	1786418700	99.802185	99.813662	99.782842	99.782842
87878	DOW	300	1786421100	53979.438257	53981.952371	53967.818572	53980.214099
87879	DXY	300	1786421100	99.792290	99.800479	99.777562	99.786677
86050	SP500	300	1786418100	7752.539772	7754.620289	7751.379839	7753.321463
86051	DOW	300	1786418100	53971.546915	53984.910760	53966.896474	53977.843483
86052	DXY	300	1786418100	99.813461	99.824520	99.797338	99.808232
88058	DOW	300	1786421400	53981.743533	53984.701368	53965.513999	53976.219812
88059	DXY	300	1786421400	99.784680	99.800968	99.774659	99.784218
88417	SP500	300	1786422000	7752.621918	7754.765630	7751.909513	7753.215624
86965	SP500	300	1786419600	7753.955890	7754.535253	7752.002954	7753.053468
86966	DOW	300	1786419600	53978.306826	53988.058502	53969.075384	53978.539756
86967	DXY	300	1786419600	99.783467	99.784731	99.759437	99.780258
87148	SP500	300	1786419900	7753.062022	7754.110010	7752.059968	7753.243718
87149	DOW	300	1786419900	53979.915116	53984.422636	53964.921949	53974.557979
87150	DXY	300	1786419900	99.780413	99.793643	99.762882	99.785144
86782	SP500	300	1786419300	7753.800592	7754.442865	7752.041463	7754.058844
86783	DOW	300	1786419300	53977.149229	53985.821593	53966.814185	53979.927365
86784	DXY	300	1786419300	99.797243	99.806475	99.774398	99.783386
88418	DOW	300	1786422000	53981.622558	53985.556972	53967.842270	53978.316779
88419	DXY	300	1786422000	99.780528	99.799474	99.774549	99.785409
87697	SP500	300	1786420800	7753.232117	7754.398840	7751.845825	7752.776407
86233	SP500	300	1786418400	7753.613954	7754.721181	7751.567063	7752.551414
86234	DOW	300	1786418400	53977.231263	53984.728670	53966.370081	53975.976147
86235	DXY	300	1786418400	99.809082	99.821458	99.792051	99.802546
87698	DOW	300	1786420800	53980.369796	53990.805751	53963.768642	53980.671863
87699	DXY	300	1786420800	99.796147	99.809237	99.783517	99.790565
87331	SP500	300	1786420200	7753.525591	7754.957877	7751.821187	7752.517629
87332	DOW	300	1786420200	53973.470711	53988.206528	53969.186946	53979.057867
86599	SP500	300	1786419000	7753.359424	7754.385556	7751.989636	7753.865924
86600	DOW	300	1786419000	53979.238478	53988.187129	53968.130843	53978.100513
86601	DXY	300	1786419000	99.780575	99.808833	99.778924	99.795837
87333	DXY	300	1786420200	99.784360	99.798608	99.771443	99.795298
89329	SP500	300	1786423500	7753.162780	7754.910098	7751.448388	7753.898604
89146	SP500	300	1786423200	7751.607792	7754.770296	7751.100168	7752.987794
89147	DOW	300	1786423200	53973.526017	53987.600280	53962.561089	53974.667781
88597	SP500	300	1786422300	7753.008406	7754.899979	7752.274463	7752.798039
88598	DOW	300	1786422300	53980.174770	53982.892967	53967.939645	53974.460184
88599	DXY	300	1786422300	99.783848	99.792091	99.764071	99.776197
88237	SP500	300	1786421700	7754.152083	7754.557870	7751.403899	7752.517731
88238	DOW	300	1786421700	53974.681943	53985.016809	53965.401214	53979.656172
88239	DXY	300	1786421700	99.783310	99.796201	99.774743	99.779204
88963	SP500	300	1786422900	7753.078355	7754.320044	7751.822904	7751.911076
88964	DOW	300	1786422900	53976.450616	53981.108134	53964.294714	53972.545627
88965	DXY	300	1786422900	99.791515	99.796627	99.766909	99.781966
89148	DXY	300	1786423200	99.782091	99.798140	99.770843	99.797799
89330	DOW	300	1786423500	53976.402613	53986.018508	53965.796709	53974.653379
89331	DXY	300	1786423500	99.797517	99.803791	99.783213	99.799282
89512	SP500	300	1786423800	7753.931862	7754.705711	7751.894556	7753.016682
89513	DOW	300	1786423800	53974.194117	53985.185416	53966.736454	53976.990580
89514	DXY	300	1786423800	99.797512	99.814907	99.789426	99.808177
90498	DXY	300	1786425000	99.787810	99.810698	99.784128	99.794174
89782	SP500	300	1786424100	7753.284724	7754.429119	7751.886161	7753.218229
89783	DOW	300	1786424100	53976.693295	53983.451871	53968.534795	53974.662617
89784	DXY	300	1786424100	99.806205	99.820965	99.784713	99.820965
90679	SP500	300	1786425300	7752.645552	7754.604797	7751.860712	7753.409737
90680	DOW	300	1786425300	53971.487256	53985.796165	53960.233766	53976.973890
90681	DXY	300	1786425300	99.791913	99.810011	99.788023	99.794485
90862	SP500	300	1786425600	7753.605183	7754.440746	7751.729947	7752.726847
90863	DOW	300	1786425600	53977.862803	53985.182166	53962.289712	53984.162582
90864	DXY	300	1786425600	99.792865	99.810774	99.786853	99.809154
91045	SP500	300	1786425900	7752.724663	7754.393177	7751.698836	7753.555229
91046	DOW	300	1786425900	53984.585143	53987.693658	53962.516799	53968.193726
91047	DXY	300	1786425900	99.807937	99.814574	99.792103	99.802543
91228	SP500	300	1786426200	7753.703885	7754.695239	7751.616771	7753.051934
91229	DOW	300	1786426200	53966.300057	53984.333127	53965.027194	53978.400530
91230	DXY	300	1786426200	99.802556	99.821020	99.789728	99.801246
91411	SP500	300	1786426500	7752.913961	7754.189969	7751.461002	7753.163279
91412	DOW	300	1786426500	53979.089097	53985.299136	53968.731936	53976.791237
95971	SP500	300	1786434000	7752.858496	7753.901439	7752.015373	7753.394401
94876	SP500	300	1786432200	7753.592226	7754.685555	7752.167662	7752.823312
94877	DOW	300	1786432200	53980.271908	53989.716659	53966.083508	53970.454091
94878	DXY	300	1786432200	99.839557	99.849724	99.817643	99.824788
95972	DOW	300	1786434000	53977.358917	53986.837186	53964.123015	53968.301612
95973	DXY	300	1786434000	99.840837	99.862813	99.830396	99.842438
93235	SP500	300	1786429500	7752.912937	7754.344111	7751.957067	7752.727955
93236	DOW	300	1786429500	53968.515122	53984.134390	53963.300036	53972.468035
93237	DXY	300	1786429500	99.813496	99.827772	99.796559	99.827340
92143	SP500	300	1786427700	7754.024507	7754.216905	7751.616344	7753.730738
92144	DOW	300	1786427700	53975.176200	53986.923424	53965.033823	53974.599923
92145	DXY	300	1786427700	99.781290	99.805331	99.776871	99.795432
91777	SP500	300	1786427100	7753.157746	7754.389407	7751.688052	7753.418109
91778	DOW	300	1786427100	53973.839826	53987.756087	53965.840341	53975.466295
91779	DXY	300	1786427100	99.797457	99.813564	99.786689	99.789061
94150	SP500	300	1786431000	7753.243538	7754.421437	7751.871868	7752.943497
94151	DOW	300	1786431000	53980.748979	53987.840909	53968.576370	53982.738558
94152	DXY	300	1786431000	99.826341	99.844933	99.823240	99.842981
94510	SP500	300	1786431600	7753.581839	7754.279471	7751.881577	7752.612628
94511	DOW	300	1786431600	53980.898697	53983.025362	53967.373370	53980.620226
93967	SP500	300	1786430700	7752.954535	7754.358729	7751.671282	7753.551368
93968	DOW	300	1786430700	53977.308683	53987.517112	53965.013911	53982.405027
93969	DXY	300	1786430700	99.853841	99.860987	99.828070	99.828070
94512	DXY	300	1786431600	99.837477	99.864357	99.836682	99.852236
92692	SP500	300	1786428600	7753.746236	7754.040430	7751.635539	7752.802784
92693	DOW	300	1786428600	53973.748371	53984.203524	53965.300571	53984.057317
92694	DXY	300	1786428600	99.801953	99.803757	99.774368	99.800282
92875	SP500	300	1786428900	7753.026034	7754.338896	7751.734790	7753.094936
92509	SP500	300	1786428300	7753.023502	7754.419032	7751.926568	7753.823665
92510	DOW	300	1786428300	53984.086019	53989.204166	53967.722244	53972.550056
92511	DXY	300	1786428300	99.820008	99.820209	99.793134	99.802511
91960	SP500	300	1786427400	7753.284274	7754.523161	7751.852365	7753.729813
91961	DOW	300	1786427400	53973.808611	53984.375344	53970.380297	53974.281936
91962	DXY	300	1786427400	99.791403	99.799435	99.774816	99.781160
91413	DXY	300	1786426500	99.800792	99.817485	99.791090	99.806673
92876	DOW	300	1786428900	53983.095247	53986.385441	53962.119457	53968.743440
92877	DXY	300	1786428900	99.801786	99.806032	99.786323	99.803772
94330	SP500	300	1786431300	7753.124922	7754.313390	7751.851711	7753.752272
94331	DOW	300	1786431300	53983.319550	53987.147345	53962.017252	53981.473431
94332	DXY	300	1786431300	99.841430	99.855257	99.834974	99.838291
91594	SP500	300	1786426800	7753.286581	7754.315309	7751.950658	7753.043892
91595	DOW	300	1786426800	53978.346176	53983.233941	53968.934495	53974.861455
91596	DXY	300	1786426800	99.805668	99.815581	99.788851	99.797875
92326	SP500	300	1786428000	7753.963943	7754.566392	7751.993414	7752.958999
92327	DOW	300	1786428000	53974.068302	53985.319716	53966.613465	53982.241716
92328	DXY	300	1786428000	99.794806	99.822808	99.789168	99.821649
93601	SP500	300	1786430100	7753.562892	7753.965355	7751.726856	7753.332695
93602	DOW	300	1786430100	53967.510242	53982.764347	53964.471835	53981.755780
93603	DXY	300	1786430100	99.842616	99.857331	99.826406	99.836114
93055	SP500	300	1786429200	7753.391446	7754.275341	7751.910720	7752.870444
93056	DOW	300	1786429200	53967.567029	53984.104091	53966.605298	53967.339716
93057	DXY	300	1786429200	99.805343	99.814208	99.792076	99.814208
93418	SP500	300	1786429800	7752.489107	7755.051037	7751.459424	7753.516336
93419	DOW	300	1786429800	53974.318643	53984.248942	53963.652843	53969.592343
93420	DXY	300	1786429800	99.827772	99.851998	99.824011	99.842137
96519	DXY	300	1786434900	99.879752	99.895741	99.867787	99.873367
96334	SP500	300	1786434600	7753.084111	7754.077446	7751.719391	7753.433384
96335	DOW	300	1786434600	53970.050792	53986.411492	53962.461825	53978.876933
95242	SP500	300	1786432800	7752.011125	7754.268186	7751.735032	7753.780261
93784	SP500	300	1786430400	7753.465061	7754.644188	7751.499569	7752.683295
93785	DOW	300	1786430400	53983.316004	53985.285836	53970.441399	53975.513899
93786	DXY	300	1786430400	99.835118	99.870678	99.823986	99.853131
95243	DOW	300	1786432800	53974.948574	53984.383162	53968.058695	53983.332048
95244	DXY	300	1786432800	99.836709	99.846564	99.820505	99.830774
95059	SP500	300	1786432500	7753.077029	7754.576174	7752.050183	7752.212907
95060	DOW	300	1786432500	53969.682869	53983.020773	53963.168643	53973.982251
95061	DXY	300	1786432500	99.825228	99.842239	99.819600	99.834393
94693	SP500	300	1786431900	7752.393897	7754.407380	7750.913565	7753.703512
94694	DOW	300	1786431900	53980.374669	53986.914887	53966.717282	53979.072456
94695	DXY	300	1786431900	99.851813	99.856885	99.833433	99.838462
95422	SP500	300	1786433100	7754.003993	7754.858951	7751.846708	7753.856566
95423	DOW	300	1786433100	53983.358058	53988.930394	53970.589837	53972.158841
95424	DXY	300	1786433100	99.829800	99.854123	99.825375	99.836914
95605	SP500	300	1786433400	7754.035023	7754.250692	7751.813705	7754.095795
95606	DOW	300	1786433400	53972.913253	53984.562874	53967.975194	53971.752370
95607	DXY	300	1786433400	99.834497	99.866045	99.826426	99.858409
95788	SP500	300	1786433700	7754.087661	7754.664796	7751.697611	7753.034546
95789	DOW	300	1786433700	53973.188966	53983.868673	53967.381644	53978.774338
95790	DXY	300	1786433700	99.860473	99.861740	99.832622	99.843317
96151	SP500	300	1786434300	7753.315632	7754.400720	7752.156328	7752.873148
96152	DOW	300	1786434300	53968.480125	53985.049598	53959.956492	53970.525489
96153	DXY	300	1786434300	99.843500	99.868268	99.837082	99.868268
96336	DXY	300	1786434600	99.866973	99.891250	99.864656	99.877457
96699	DXY	300	1786435200	99.872649	99.887114	99.852701	99.862687
96517	SP500	300	1786434900	7753.530026	7754.646899	7751.900518	7752.713210
96518	DOW	300	1786434900	53977.066645	53987.034688	53967.112127	53974.158466
96697	SP500	300	1786435200	7752.813521	7754.313002	7751.821180	7753.340487
96698	DOW	300	1786435200	53975.730555	53989.256180	53965.788292	53975.202678
96877	SP500	300	1786435500	7753.427265	7754.318869	7752.094405	7752.925303
99435	DXY	300	1786439700	99.857969	99.885974	99.852360	99.880085
97606	SP500	300	1786436700	7752.963529	7754.071440	7751.344524	7753.672217
97607	DOW	300	1786436700	53981.533180	53986.405285	53965.018621	53981.367125
97608	DXY	300	1786436700	99.884892	99.894319	99.868156	99.873079
97243	SP500	300	1786436100	7753.304056	7754.749605	7751.644656	7753.844938
97244	DOW	300	1786436100	53979.546123	53988.472890	53967.737183	53977.930290
97245	DXY	300	1786436100	99.874787	99.901301	99.870290	99.876231
99067	SP500	300	1786439100	7752.784820	7754.758412	7752.036729	7753.815453
98884	SP500	300	1786438800	7753.137239	7754.647262	7751.525857	7753.006823
98885	DOW	300	1786438800	53971.769357	53986.784995	53967.234519	53970.572033
98886	DXY	300	1786438800	99.841469	99.871481	99.837100	99.871481
99068	DOW	300	1786439100	53971.284265	53987.359914	53965.876946	53975.757022
99069	DXY	300	1786439100	99.871677	99.871677	99.848638	99.855837
99618	DXY	300	1786440000	99.877695	99.880163	99.859189	99.879118
98704	SP500	300	1786438500	7752.522484	7754.627339	7751.770921	7753.322824
98705	DOW	300	1786438500	53975.587822	53985.396891	53963.215581	53973.338687
98706	DXY	300	1786438500	99.838540	99.859331	99.834966	99.840534
96878	DOW	300	1786435500	53975.221751	53984.035167	53963.801274	53968.716639
96879	DXY	300	1786435500	99.861693	99.905918	99.861637	99.896099
100164	DXY	300	1786440900	99.873274	99.887684	99.855491	99.878742
97426	SP500	300	1786436400	7753.584897	7754.535280	7751.688105	7753.024833
97427	DOW	300	1786436400	53976.415837	53981.894535	53967.276834	53979.570548
97428	DXY	300	1786436400	99.875202	99.904485	99.873001	99.882614
100900	SP500	300	1786441800	7752.574536	7754.873626	7751.457010	7752.171994
100901	DOW	300	1786441800	53976.728440	53985.997779	53965.337384	53975.603747
100902	DXY	300	1786441800	99.883817	99.883817	99.856427	99.864966
102000	DXY	300	1786443300	99.854935	99.859217	99.828715	99.852629
98155	SP500	300	1786437600	7752.417970	7754.895338	7751.470054	7753.131725
98156	DOW	300	1786437600	53976.469165	53985.878979	53966.190402	53977.639323
98157	DXY	300	1786437600	99.876215	99.880558	99.854231	99.856822
97972	SP500	300	1786437300	7753.437404	7754.286570	7751.575271	7752.533330
97973	DOW	300	1786437300	53978.021819	53984.886244	53963.124936	53977.617698
97974	DXY	300	1786437300	99.877081	99.888335	99.867859	99.875859
97060	SP500	300	1786435800	7753.164395	7754.288022	7751.775436	7753.116075
97061	DOW	300	1786435800	53968.153497	53986.060242	53968.153497	53977.819206
97062	DXY	300	1786435800	99.893934	99.902809	99.877249	99.877249
99250	SP500	300	1786439400	7753.772685	7754.632083	7752.181320	7752.960473
99251	DOW	300	1786439400	53976.350587	53985.017546	53966.380817	53971.406680
99252	DXY	300	1786439400	99.857849	99.875650	99.852139	99.859778
97789	SP500	300	1786437000	7753.949874	7754.519827	7752.107751	7753.608575
97790	DOW	300	1786437000	53980.378468	53986.309104	53964.871366	53979.497112
97791	DXY	300	1786437000	99.875545	99.889846	99.869970	99.876272
98338	SP500	300	1786437900	7753.177058	7754.362993	7751.806477	7753.588720
98339	DOW	300	1786437900	53979.543806	53985.387649	53968.671234	53972.767731
98340	DXY	300	1786437900	99.856393	99.874879	99.836237	99.848224
101449	SP500	300	1786442400	7752.962901	7754.940104	7751.863124	7752.780354
101450	DOW	300	1786442400	53973.097023	53984.691472	53964.356425	53981.965282
101451	DXY	300	1786442400	99.846374	99.864358	99.838241	99.855356
99982	SP500	300	1786440600	7752.607371	7754.378157	7751.827975	7753.833997
99983	DOW	300	1786440600	53967.319570	53984.812342	53966.475161	53982.920499
99984	DXY	300	1786440600	99.870539	99.883023	99.859248	99.875259
99799	SP500	300	1786440300	7753.874946	7754.254909	7751.595101	7752.749671
99800	DOW	300	1786440300	53976.745456	53987.528129	53967.787807	53968.606049
99801	DXY	300	1786440300	99.879405	99.883814	99.861682	99.871644
98521	SP500	300	1786438200	7753.677741	7754.955721	7752.083535	7752.715350
98522	DOW	300	1786438200	53973.598149	53985.615351	53962.836135	53975.133950
98523	DXY	300	1786438200	99.848286	99.854100	99.830446	99.836925
101999	DOW	300	1786443300	53980.107659	53984.120563	53964.365153	53975.596921
101998	SP500	300	1786443300	7752.697678	7754.729859	7751.846980	7753.576270
101209	SP500	300	1786442100	7753.823193	7755.179787	7751.782539	7752.860998
101210	DOW	300	1786442100	53975.663761	53985.791255	53966.029620	53974.553143
101211	DXY	300	1786442100	99.870047	99.875099	99.841605	99.845650
99433	SP500	300	1786439700	7753.245526	7755.058750	7751.323216	7753.575553
99434	DOW	300	1786439700	53973.543263	53984.841614	53970.025322	53979.214845
99616	SP500	300	1786440000	7753.834297	7754.669637	7751.316180	7753.670672
99617	DOW	300	1786440000	53978.602652	53985.842902	53966.489127	53976.387303
100717	SP500	300	1786441500	7753.048117	7754.272941	7751.459165	7752.436605
100718	DOW	300	1786441500	53981.912545	53987.750395	53965.982751	53977.463110
100498	SP500	300	1786441200	7752.803100	7754.305204	7751.835104	7753.056171
100499	DOW	300	1786441200	53967.316491	53986.287075	53963.298860	53980.551022
100162	SP500	300	1786440900	7753.604513	7754.720416	7751.075577	7753.154034
100163	DOW	300	1786440900	53984.214762	53986.550904	53964.948422	53972.816586
100500	DXY	300	1786441200	99.870158	99.885020	99.863689	99.869522
100719	DXY	300	1786441500	99.869520	99.885376	99.854369	99.885376
101632	SP500	300	1786442700	7752.650446	7754.486788	7751.863449	7753.964039
101633	DOW	300	1786442700	53982.070345	53982.763684	53965.085616	53978.715135
101634	DXY	300	1786442700	99.856736	99.863343	99.835089	99.844415
101815	SP500	300	1786443000	7754.113372	7754.653814	7751.528687	7752.693895
101816	DOW	300	1786443000	53979.082802	53987.416041	53962.501007	53979.720753
101817	DXY	300	1786443000	99.844863	99.871846	99.842085	99.856251
102181	SP500	300	1786443600	7753.591022	7753.937204	7750.670214	7753.448330
102182	DOW	300	1786443600	53973.502616	53987.433693	53964.124659	53978.571729
102183	DXY	300	1786443600	99.853042	99.863424	99.835508	99.853091
102364	SP500	300	1786443900	7753.731538	7754.611573	7751.607728	7753.778861
102365	DOW	300	1786443900	53979.336701	53987.124774	53969.422611	53973.857344
102366	DXY	300	1786443900	99.853882	99.875996	99.843410	99.874149
102547	SP500	300	1786444200	7754.022428	7754.322149	7751.609437	7753.302709
102548	DOW	300	1786444200	53975.926011	53986.741268	53965.091630	53975.097385
102549	DXY	300	1786444200	99.873030	99.883941	99.848127	99.868746
106373	DOW	300	1786450500	53979.047188	53989.122326	53968.354997	53978.549841
106374	DXY	300	1786450500	99.858109	99.869290	99.813914	99.819755
107105	DOW	300	1786451700	53975.927393	53983.809646	53963.755683	53974.366861
106738	SP500	300	1786451100	7753.831717	7754.273662	7751.841322	7753.151378
106739	DOW	300	1786451100	53974.191166	53982.289279	53966.339568	53973.592451
106555	SP500	300	1786450800	7752.873445	7754.443943	7751.668794	7753.663330
106556	DOW	300	1786450800	53979.654127	53986.995898	53966.781672	53972.297373
105643	SP500	300	1786449300	7751.887185	7754.805414	7750.848921	7753.219580
104914	SP500	300	1786448100	7753.286795	7754.526836	7751.850335	7752.982757
104731	SP500	300	1786447800	7753.667228	7754.494149	7751.796708	7753.332925
102730	SP500	300	1786444500	7753.115098	7754.249632	7751.709591	7753.459015
102731	DOW	300	1786444500	53974.812390	53986.493936	53967.518477	53977.257726
102732	DXY	300	1786444500	99.870132	99.874429	99.827317	99.850261
104732	DOW	300	1786447800	53975.750720	53987.571620	53966.655813	53973.786996
104733	DXY	300	1786447800	99.823310	99.839553	99.811100	99.824716
104915	DOW	300	1786448100	53973.940242	53988.094691	53969.574647	53971.269717
104916	DXY	300	1786448100	99.826984	99.838563	99.807325	99.829871
103279	SP500	300	1786445400	7752.207906	7754.893388	7751.056363	7753.521812
103280	DOW	300	1786445400	53980.563324	53986.588472	53967.059472	53971.720840
103281	DXY	300	1786445400	99.837739	99.855572	99.830842	99.853860
105644	DOW	300	1786449300	53974.042787	53989.427636	53967.763704	53979.187060
103819	SP500	300	1786446300	7752.667300	7754.103907	7752.036783	7753.130952
103820	DOW	300	1786446300	53974.871242	53990.175454	53965.685883	53977.046916
103821	DXY	300	1786446300	99.856723	99.875037	99.843336	99.856591
102913	SP500	300	1786444800	7753.362848	7754.530352	7751.761076	7753.579946
102914	DOW	300	1786444800	53978.325808	53987.795014	53963.316527	53972.002151
102915	DXY	300	1786444800	99.849531	99.860976	99.831129	99.839031
103999	SP500	300	1786446600	7753.436152	7754.428398	7751.870281	7752.739202
104000	DOW	300	1786446600	53978.506879	53986.147235	53968.407413	53971.406007
104001	DXY	300	1786446600	99.858988	99.865797	99.783904	99.809075
103639	SP500	300	1786446000	7754.017479	7754.279841	7751.565641	7752.874291
103640	DOW	300	1786446000	53973.199063	53986.386364	53965.980009	53976.278216
103641	DXY	300	1786446000	99.856216	99.871564	99.844420	99.854374
104548	SP500	300	1786447500	7752.881884	7754.974661	7751.568282	7753.557659
104549	DOW	300	1786447500	53973.156037	53992.845618	53967.078690	53977.294171
104550	DXY	300	1786447500	99.812051	99.826445	99.791651	99.823496
105645	DXY	300	1786449300	99.838685	99.874121	99.838491	99.852252
104182	SP500	300	1786446900	7752.640002	7754.582753	7751.668869	7753.525980
104183	DOW	300	1786446900	53972.530359	53987.979282	53968.976347	53974.690159
104184	DXY	300	1786446900	99.809222	99.825864	99.790080	99.823444
103096	SP500	300	1786445100	7753.527697	7754.283328	7751.686049	7752.504437
103097	DOW	300	1786445100	53973.196637	53986.736386	53969.600262	53978.940803
103098	DXY	300	1786445100	99.841436	99.853016	99.823463	99.837444
103459	SP500	300	1786445700	7753.482981	7754.624593	7751.475099	7753.780248
103460	DOW	300	1786445700	53971.749822	53984.642455	53966.850050	53973.346338
103461	DXY	300	1786445700	99.853801	99.860586	99.838116	99.856314
106189	SP500	300	1786450200	7752.685882	7754.394382	7751.828724	7753.346954
105277	SP500	300	1786448700	7753.355515	7754.382160	7752.116106	7752.874733
105278	DOW	300	1786448700	53979.414885	53986.546545	53968.064510	53981.401087
105279	DXY	300	1786448700	99.823961	99.837775	99.821530	99.837326
106009	SP500	300	1786449900	7754.352684	7754.634214	7752.214088	7752.900183
106010	DOW	300	1786449900	53981.165150	53987.164341	53962.885232	53975.894478
106011	DXY	300	1786449900	99.855602	99.870986	99.842204	99.854596
105094	SP500	300	1786448400	7752.887488	7754.760434	7751.639810	7753.660365
105095	DOW	300	1786448400	53972.309274	53986.854968	53968.129137	53980.797628
105096	DXY	300	1786448400	99.829930	99.846066	99.820936	99.823133
105460	SP500	300	1786449000	7752.862218	7754.772452	7752.044059	7752.044059
105461	DOW	300	1786449000	53980.977765	53986.895961	53969.822583	53973.278203
104365	SP500	300	1786447200	7753.694651	7754.154909	7750.960850	7753.142261
104366	DOW	300	1786447200	53975.823036	53983.820932	53967.866119	53974.873534
104367	DXY	300	1786447200	99.823818	99.825453	99.795740	99.810783
105462	DXY	300	1786449000	99.836843	99.849000	99.819711	99.840654
105826	SP500	300	1786449600	7753.516255	7754.338521	7751.328544	7754.329490
105827	DOW	300	1786449600	53979.495229	53983.623594	53963.567409	53981.160625
105828	DXY	300	1786449600	99.852435	99.865846	99.837483	99.854264
106190	DOW	300	1786450200	53974.887556	53985.532967	53968.100038	53977.535086
106191	DXY	300	1786450200	99.856310	99.870947	99.845453	99.860162
106557	DXY	300	1786450800	99.818921	99.858282	99.818921	99.848056
106740	DXY	300	1786451100	99.847156	99.864587	99.843443	99.857606
106921	SP500	300	1786451400	7753.378760	7754.349003	7751.524276	7753.348826
106922	DOW	300	1786451400	53973.750087	53989.724077	53967.354309	53974.424974
106923	DXY	300	1786451400	99.859363	99.883927	99.828529	99.866590
106372	SP500	300	1786450500	7753.118034	7754.856027	7752.470856	7753.173259
107106	DXY	300	1786451700	99.867072	99.879514	99.845960	99.856261
107288	DOW	300	1786452000	53974.515299	53983.634108	53964.470339	53973.244998
107472	DXY	300	1786452300	99.821048	99.846066	99.818884	99.836977
107289	DXY	300	1786452000	99.858359	99.865877	99.811379	99.821891
107104	SP500	300	1786451700	7753.253701	7754.338804	7752.119430	7753.241859
107287	SP500	300	1786452000	7753.311746	7755.148872	7752.019319	7752.944925
107470	SP500	300	1786452300	7753.208783	7754.122214	7751.773873	7753.054791
107471	DOW	300	1786452300	53972.663031	53984.276138	53965.897421	53977.078791
107650	SP500	300	1786452600	7752.912545	7754.845055	7751.204118	7753.053819
107651	DOW	300	1786452600	53978.747109	53988.038787	53963.337940	53977.477420
107652	DXY	300	1786452600	99.839160	99.850225	99.821636	99.827207
107833	SP500	300	1786452900	7753.236188	7754.146785	7751.068363	7753.100010
107834	DOW	300	1786452900	53977.435288	53985.659841	53967.876529	53977.839484
107835	DXY	300	1786452900	99.829389	99.839740	99.804757	99.828442
108016	SP500	300	1786453200	7753.262794	7754.750300	7751.147268	7753.581872
108017	DOW	300	1786453200	53976.425106	53985.681842	53967.400336	53974.714744
113313	DXY	300	1786461900	99.838901	99.862433	99.837263	99.846706
111481	SP500	300	1786458900	7759.076047	7761.859816	7754.813466	7756.615436
111482	DOW	300	1786458900	53998.955583	54031.029775	53961.041743	53995.639629
111483	DXY	300	1786458900	99.811398	99.846119	99.808221	99.828506
110752	SP500	300	1786457700	7759.929270	7762.804327	7757.288820	7759.020387
110753	DOW	300	1786457700	54055.064065	54083.757608	54017.267094	54042.582671
110754	DXY	300	1786457700	99.824622	99.831092	99.802871	99.825967
108748	SP500	300	1786454400	7753.373416	7754.481929	7752.210446	7753.375502
108749	DOW	300	1786454400	53974.915641	53983.745673	53964.229362	53975.058670
108750	DXY	300	1786454400	99.805058	99.819754	99.793054	99.819754
109843	SP500	300	1786456200	7751.885124	7754.231235	7749.165174	7752.432627
108382	SP500	300	1786453800	7753.204058	7755.490832	7751.445408	7752.311874
108383	DOW	300	1786453800	53975.090407	53988.870857	53968.463808	53979.637116
108384	DXY	300	1786453800	99.820568	99.821765	99.788169	99.815223
109844	DOW	300	1786456200	54194.325905	54221.198601	54185.350000	54215.180299
109845	DXY	300	1786456200	99.808912	99.817023	99.794221	99.795131
110569	SP500	300	1786457400	7760.459011	7762.740661	7757.921795	7759.819156
110570	DOW	300	1786457400	54065.805874	54074.620000	54028.617062	54057.026064
110571	DXY	300	1786457400	99.801190	99.836124	99.801190	99.824942
112945	SP500	300	1786461300	7749.380399	7750.732148	7745.163958	7748.034158
112946	DOW	300	1786461300	53941.681723	53960.747044	53914.919937	53933.553075
111115	SP500	300	1786458300	7757.387499	7762.564464	7755.702117	7762.335528
111116	DOW	300	1786458300	54027.803922	54052.391030	54022.494213	54048.978777
111117	DXY	300	1786458300	99.821857	99.831374	99.804872	99.809973
109294	SP500	300	1786455300	7758.629108	7758.986270	7751.524687	7753.729588
109295	DOW	300	1786455300	54077.682359	54157.103415	54072.337755	54124.247613
109296	DXY	300	1786455300	99.804577	99.814764	99.798000	99.809952
109111	SP500	300	1786455000	7753.509057	7764.449910	7753.023865	7758.934774
109112	DOW	300	1786455000	53968.440799	54112.717710	53965.651133	54078.232166
109113	DXY	300	1786455000	99.822177	99.824590	99.795150	99.804708
108565	SP500	300	1786454100	7752.451077	7754.083067	7751.487352	7753.361406
108566	DOW	300	1786454100	53978.485960	53982.785236	53967.609409	53976.071249
108567	DXY	300	1786454100	99.814413	99.819180	99.792099	99.802672
108018	DXY	300	1786453200	99.830408	99.837159	99.814745	99.825924
109477	SP500	300	1786455600	7754.009010	7760.782640	7753.803266	7757.470906
109478	DOW	300	1786455600	54122.717807	54169.213238	54098.034143	54155.645338
109479	DXY	300	1786455600	99.810756	99.841388	99.807430	99.830624
110932	SP500	300	1786458000	7759.083840	7762.545687	7756.790000	7757.671988
108928	SP500	300	1786454700	7753.597425	7754.358757	7750.951561	7753.698781
108929	DOW	300	1786454700	53975.991883	53987.666042	53964.635237	53970.093261
108930	DXY	300	1786454700	99.819457	99.834816	99.798868	99.821874
108199	SP500	300	1786453500	7753.526634	7754.851338	7751.344164	7753.488422
108200	DOW	300	1786453500	53974.417927	53983.809676	53964.124011	53974.547178
108201	DXY	300	1786453500	99.824914	99.834013	99.799824	99.820515
110933	DOW	300	1786458000	54043.413291	54067.828448	54024.756325	54027.908848
110934	DXY	300	1786458000	99.827895	99.842439	99.813069	99.821426
110209	SP500	300	1786456800	7757.461601	7765.009761	7757.314937	7761.987563
110210	DOW	300	1786456800	54164.279213	54195.986267	54129.394395	54137.082548
110211	DXY	300	1786456800	99.799273	99.802049	99.764632	99.791823
109660	SP500	300	1786455900	7757.468662	7758.073344	7748.651839	7751.839068
109661	DOW	300	1786455900	54157.016949	54195.067465	54144.574725	54195.067465
109662	DXY	300	1786455900	99.830359	99.836831	99.794263	99.809206
112762	SP500	300	1786461000	7751.563497	7752.484318	7747.932724	7749.201096
110389	SP500	300	1786457100	7762.026579	7763.198573	7758.087237	7760.310777
110390	DOW	300	1786457100	54136.420791	54138.644134	54038.594644	54067.796902
110026	SP500	300	1786456500	7752.640601	7758.770000	7750.967658	7757.577722
110027	DOW	300	1786456500	54213.623289	54226.289104	54163.422703	54163.422703
110028	DXY	300	1786456500	99.795109	99.801899	99.771316	99.799056
110391	DXY	300	1786457100	99.792362	99.808013	99.786315	99.798888
112763	DOW	300	1786461000	53936.488568	53955.550909	53921.030000	53943.791449
112764	DXY	300	1786461000	99.809526	99.818943	99.791804	99.799466
112579	SP500	300	1786460700	7757.034264	7758.335139	7750.829066	7751.769183
112580	DOW	300	1786460700	53972.339259	53987.341040	53927.133332	53936.645864
112581	DXY	300	1786460700	99.799581	99.823778	99.788515	99.809448
112213	SP500	300	1786460100	7763.201519	7763.996206	7758.482879	7760.300912
112214	DOW	300	1786460100	53985.262176	54003.377487	53953.490000	53979.756597
112215	DXY	300	1786460100	99.803617	99.828429	99.799783	99.819089
111664	SP500	300	1786459200	7756.474410	7759.853661	7755.769935	7756.254081
111665	DOW	300	1786459200	53996.161901	54000.747112	53953.313763	53953.732252
111666	DXY	300	1786459200	99.828353	99.847220	99.810104	99.810104
111298	SP500	300	1786458600	7762.487214	7762.487214	7756.717227	7759.313544
111299	DOW	300	1786458600	54050.551069	54053.385376	53999.134675	53999.134675
111300	DXY	300	1786458600	99.809667	99.832141	99.799160	99.811557
111847	SP500	300	1786459500	7756.034731	7763.284303	7756.032844	7762.322538
111848	DOW	300	1786459500	53955.402635	54016.087006	53950.737189	54011.585143
111849	DXY	300	1786459500	99.812443	99.830595	99.798189	99.802747
112396	SP500	300	1786460400	7760.126655	7762.035058	7756.828914	7757.068695
112397	DOW	300	1786460400	53980.126427	54010.152215	53962.291285	53970.849229
112398	DXY	300	1786460400	99.816838	99.830778	99.791292	99.800057
112030	SP500	300	1786459800	7762.622088	7764.257629	7758.333742	7763.140123
112031	DOW	300	1786459800	54011.821272	54013.632291	53974.106938	53985.488169
112032	DXY	300	1786459800	99.800468	99.827667	99.795035	99.804913
112947	DXY	300	1786461300	99.800574	99.830508	99.795553	99.824994
113128	SP500	300	1786461600	7748.196434	7752.575850	7746.999582	7747.964400
113129	DOW	300	1786461600	53935.480687	53965.567170	53925.351096	53965.567170
113130	DXY	300	1786461600	99.824097	99.847046	99.811903	99.839422
113491	SP500	300	1786462200	7748.564648	7749.455853	7742.380119	7742.380119
113311	SP500	300	1786461900	7748.066274	7751.393332	7746.847278	7748.799600
113312	DOW	300	1786461900	53964.753118	53968.267750	53934.146515	53963.938236
113853	DXY	300	1786462800	99.822345	99.846376	99.806725	99.845716
114219	DXY	300	1786463400	99.842155	99.857001	99.831656	99.849115
115496	DOW	300	1786465500	53904.578071	53920.606444	53890.101168	53913.530032
115497	DXY	300	1786465500	99.813684	99.831441	99.800602	99.827831
116764	SP500	300	1786467600	7734.741100	7735.428400	7730.540447	7731.886132
116765	DOW	300	1786467600	53879.924520	53906.987087	53872.569978	53880.411044
116766	DXY	300	1786467600	99.819048	99.829879	99.808623	99.824731
117494	DOW	300	1786468800	53888.086683	53890.425942	53858.645009	53876.182391
117310	SP500	300	1786468500	7726.369413	7731.722241	7725.926919	7730.895173
117311	DOW	300	1786468500	53866.462040	53892.161893	53857.655566	53886.361030
115855	SP500	300	1786466100	7738.606079	7743.855965	7737.738405	7741.218511
115856	DOW	300	1786466100	53893.771399	53916.379398	53880.694526	53897.769670
115857	DXY	300	1786466100	99.822139	99.831334	99.802676	99.814007
115312	SP500	300	1786465200	7743.106650	7745.752979	7740.106319	7740.233359
115313	DOW	300	1786465200	53942.865439	53951.768965	53905.479060	53905.479060
115314	DXY	300	1786465200	99.804525	99.822549	99.788132	99.811383
113492	DOW	300	1786462200	53963.876068	53968.001468	53918.504321	53921.693170
113493	DXY	300	1786462200	99.847139	99.854969	99.810107	99.835844
114763	SP500	300	1786464300	7743.773634	7748.566332	7743.154705	7745.773076
114034	SP500	300	1786463100	7744.779555	7745.238805	7740.988979	7744.097939
114035	DOW	300	1786463100	53927.329672	53946.396025	53915.877625	53939.257881
114036	DXY	300	1786463100	99.845943	99.849983	99.822679	99.844466
114764	DOW	300	1786464300	53937.007749	53968.251774	53926.775681	53930.746724
114765	DXY	300	1786464300	99.831399	99.833835	99.795947	99.821377
114583	SP500	300	1786464000	7742.486115	7745.707351	7741.966450	7743.623878
114584	DOW	300	1786464000	53943.432643	53966.770744	53934.775092	53937.003638
114585	DXY	300	1786464000	99.830269	99.851372	99.824634	99.832779
113671	SP500	300	1786462500	7742.356134	7744.628901	7741.030273	7742.143526
113672	DOW	300	1786462500	53923.223393	53936.834240	53911.395830	53924.690839
113673	DXY	300	1786462500	99.833526	99.834093	99.815619	99.821919
116398	SP500	300	1786467000	7737.166555	7738.271382	7735.353541	7736.274434
116399	DOW	300	1786467000	53899.828028	53916.570069	53887.674124	53907.719614
116400	DXY	300	1786467000	99.818975	99.833248	99.799176	99.812231
114400	SP500	300	1786463700	7741.418014	7744.170000	7740.424606	7742.501840
114401	DOW	300	1786463700	53918.758613	53945.545574	53915.176270	53945.477237
114402	DXY	300	1786463700	99.850430	99.855339	99.825142	99.831648
114946	SP500	300	1786464600	7745.556199	7747.502855	7741.945230	7741.945230
114947	DOW	300	1786464600	53929.951028	53941.076775	53907.268285	53918.177053
114948	DXY	300	1786464600	99.821220	99.824912	99.795546	99.814116
116581	SP500	300	1786467300	7736.394336	7737.371155	7733.171827	7734.559435
116582	DOW	300	1786467300	53908.061630	53910.736395	53879.678736	53880.889029
116583	DXY	300	1786467300	99.813782	99.826493	99.806470	99.817968
113851	SP500	300	1786462800	7742.267219	7745.796011	7740.874491	7744.608895
113852	DOW	300	1786462800	53926.532164	53942.762594	53919.086147	53925.595660
117312	DXY	300	1786468500	99.824266	99.869647	99.813914	99.857002
114217	SP500	300	1786463400	7743.960325	7745.524221	7739.905313	7741.628824
114218	DOW	300	1786463400	53937.165543	53952.684548	53911.821336	53917.096047
117495	DXY	300	1786468800	99.858892	99.868121	99.846239	99.860073
116218	SP500	300	1786466700	7738.333766	7738.532786	7735.303600	7737.137529
116219	DOW	300	1786466700	53886.398061	53907.168984	53878.159053	53898.683979
115129	SP500	300	1786464900	7742.094387	7749.067433	7740.374913	7743.214520
115130	DOW	300	1786464900	53918.771038	53961.183417	53912.351139	53942.863172
115131	DXY	300	1786464900	99.815846	99.831200	99.803063	99.803063
116220	DXY	300	1786466700	99.822436	99.827623	99.805599	99.817486
116038	SP500	300	1786466400	7740.941987	7741.811323	7737.095675	7738.433307
116039	DOW	300	1786466400	53896.741264	53906.272553	53881.172536	53888.255935
116040	DXY	300	1786466400	99.815057	99.836604	99.802115	99.820463
115675	SP500	300	1786465800	7739.852956	7742.572663	7736.982246	7738.482347
115676	DOW	300	1786465800	53911.556089	53913.830460	53877.531046	53894.903116
115677	DXY	300	1786465800	99.829253	99.837322	99.808484	99.821164
115495	SP500	300	1786465500	7740.203242	7741.846133	7737.844446	7739.946446
117130	SP500	300	1786468200	7731.493057	7731.777756	7726.292532	7726.599505
117131	DOW	300	1786468200	53882.237906	53899.873636	53865.109451	53866.919007
117132	DXY	300	1786468200	99.828273	99.837124	99.814994	99.824562
116947	SP500	300	1786467900	7731.904626	7734.358831	7729.981419	7731.686151
116948	DOW	300	1786467900	53881.317388	53898.908141	53874.152987	53883.629508
116949	DXY	300	1786467900	99.824959	99.837868	99.812636	99.826324
117860	DOW	300	1786469400	53878.791987	53890.840000	53868.171684	53878.862958
117861	DXY	300	1786469400	99.857663	99.869740	99.840386	99.856738
117676	SP500	300	1786469100	7731.167175	7733.706290	7729.409606	7733.002387
117677	DOW	300	1786469100	53877.109335	53883.921996	53855.235105	53878.882201
117678	DXY	300	1786469100	99.858912	99.869177	99.843172	99.857329
117493	SP500	300	1786468800	7731.195200	7733.853644	7728.611262	7731.213132
118404	DXY	300	1786470300	99.874666	99.881971	99.853966	99.857400
118042	SP500	300	1786469700	7731.535949	7734.749249	7730.400461	7731.625249
118224	DXY	300	1786470000	99.867437	99.879923	99.855971	99.872250
118223	DOW	300	1786470000	53868.188088	53903.312292	53868.188088	53889.292830
117859	SP500	300	1786469400	7732.944517	7733.019483	7729.891339	7731.632434
118043	DOW	300	1786469700	53877.303809	53885.824942	53857.133504	53868.244841
118044	DXY	300	1786469700	99.854954	99.883388	99.854387	99.865128
118222	SP500	300	1786470000	7731.320830	7736.811135	7730.577292	7735.292003
118584	DXY	300	1786470600	99.855500	99.867238	99.845234	99.854513
118402	SP500	300	1786470300	7735.107449	7737.010257	7733.201076	7735.061566
118403	DOW	300	1786470300	53887.655470	53899.087142	53877.414455	53891.448876
118582	SP500	300	1786470600	7734.954892	7737.069668	7734.204077	7736.806362
118583	DOW	300	1786470600	53893.585318	53896.689756	53873.097770	53881.924251
118762	SP500	300	1786470900	7736.947558	7737.192773	7733.176876	7734.963212
118763	DOW	300	1786470900	53883.832951	53897.028729	53872.293271	53886.848380
118764	DXY	300	1786470900	99.856128	99.865711	99.830238	99.839045
120584	DOW	300	1786473900	53822.131263	53840.818716	53814.686533	53836.669926
120585	DXY	300	1786473900	99.831454	99.851991	99.817481	99.831457
122951	DOW	300	1786477800	53808.426439	53811.087171	53761.244603	53770.602283
122767	SP500	300	1786477500	7729.611326	7731.063814	7725.788894	7727.662344
122768	DOW	300	1786477500	53816.557639	53823.479201	53794.168309	53807.748802
122769	DXY	300	1786477500	99.814850	99.826385	99.803055	99.815315
121858	SP500	300	1786476000	7727.343460	7730.488340	7726.243465	7729.902340
121859	DOW	300	1786476000	53797.391309	53814.909224	53786.324414	53811.290921
118945	SP500	300	1786471200	7734.942076	7736.538790	7731.285033	7734.098206
118946	DOW	300	1786471200	53887.910166	53894.794708	53862.965205	53874.242921
118947	DXY	300	1786471200	99.839006	99.852317	99.829946	99.843246
121860	DXY	300	1786476000	99.821443	99.834471	99.806420	99.823387
121129	SP500	300	1786474800	7723.407041	7725.036994	7721.467352	7723.228649
120949	SP500	300	1786474500	7726.460575	7727.009147	7722.927512	7723.493682
120950	DOW	300	1786474500	53825.472542	53830.836271	53799.541732	53805.600596
120951	DXY	300	1786474500	99.822506	99.833044	99.810691	99.822818
119494	SP500	300	1786472100	7731.217033	7732.000000	7728.793977	7730.613345
119495	DOW	300	1786472100	53862.847567	53875.531650	53846.600746	53864.755903
119496	DXY	300	1786472100	99.849550	99.869416	99.841398	99.858459
121130	DOW	300	1786474800	53805.790253	53816.812413	53779.728216	53787.726586
121131	DXY	300	1786474800	99.823237	99.842522	99.812792	99.837748
120034	SP500	300	1786473000	7720.287577	7723.558851	7717.760036	7723.208687
120035	DOW	300	1786473000	53832.070097	53850.212445	53811.918328	53835.009741
120036	DXY	300	1786473000	99.868850	99.877491	99.858503	99.871233
119128	SP500	300	1786471500	7733.906346	7734.705769	7729.176304	7730.220815
119129	DOW	300	1786471500	53875.001089	53879.142770	53850.239515	53850.609983
119130	DXY	300	1786471500	99.843451	99.859943	99.838111	99.844426
120217	SP500	300	1786473300	7723.274804	7724.573439	7721.391795	7722.205366
120218	DOW	300	1786473300	53834.229894	53854.129477	53832.359646	53839.174946
120219	DXY	300	1786473300	99.871542	99.872738	99.849629	99.860364
119854	SP500	300	1786472700	7727.183651	7728.976711	7720.030781	7720.155584
119855	DOW	300	1786472700	53864.785137	53881.804798	53826.723385	53831.356228
119856	DXY	300	1786472700	99.863195	99.881071	99.854553	99.869891
122218	SP500	300	1786476600	7728.917906	7731.628473	7728.690930	7730.760391
120766	SP500	300	1786474200	7725.836862	7727.611618	7723.570695	7726.398876
120767	DOW	300	1786474200	53838.389842	53843.177920	53817.796328	53825.249265
120768	DXY	300	1786474200	99.833336	99.843664	99.819977	99.822748
120400	SP500	300	1786473600	7721.988520	7723.915151	7718.962611	7720.451407
120401	DOW	300	1786473600	53837.895286	53837.895286	53811.403083	53821.701506
120402	DXY	300	1786473600	99.860043	99.866885	99.830898	99.832013
119311	SP500	300	1786471800	7730.054520	7731.888723	7729.307057	7730.943790
119312	DOW	300	1786471800	53851.397575	53871.381412	53838.637031	53861.629125
119313	DXY	300	1786471800	99.845467	99.864933	99.839896	99.851878
119674	SP500	300	1786472400	7730.421101	7730.756656	7725.189313	7727.254460
119675	DOW	300	1786472400	53863.228311	53870.505604	53837.173105	53865.174437
119676	DXY	300	1786472400	99.856482	99.874914	99.846321	99.861140
122219	DOW	300	1786476600	53803.146033	53829.104772	53800.686677	53816.587300
122038	SP500	300	1786476300	7729.611684	7730.861957	7726.526378	7729.166996
121492	SP500	300	1786475400	7723.584580	7727.618588	7722.608878	7725.642357
121493	DOW	300	1786475400	53775.996399	53795.810032	53771.403949	53774.702227
121494	DXY	300	1786475400	99.828891	99.835956	99.817605	99.828975
122039	DOW	300	1786476300	53811.983983	53817.208151	53792.631969	53803.354444
122040	DXY	300	1786476300	99.820925	99.844796	99.813456	99.828374
121309	SP500	300	1786475100	7723.030881	7724.980521	7720.928401	7723.478662
121310	DOW	300	1786475100	53788.625278	53797.381439	53769.273198	53775.289447
121311	DXY	300	1786475100	99.838864	99.840255	99.821045	99.830296
120583	SP500	300	1786473900	7720.259982	7726.147522	7720.255299	7725.576420
121675	SP500	300	1786475700	7725.567011	7727.562744	7724.016012	7727.194714
121676	DOW	300	1786475700	53776.746721	53800.810000	53766.645087	53796.778234
121677	DXY	300	1786475700	99.830472	99.840482	99.810702	99.822152
122220	DXY	300	1786476600	99.830499	99.844241	99.810569	99.821948
122401	SP500	300	1786476900	7731.057312	7734.222752	7729.330992	7732.987610
122402	DOW	300	1786476900	53818.202355	53844.718633	53806.295817	53834.498597
122403	DXY	300	1786476900	99.822126	99.828715	99.804421	99.814546
122952	DXY	300	1786477800	99.814195	99.826285	99.804274	99.817299
123134	DOW	300	1786478100	53770.176266	53786.533182	53748.158344	53784.860300
123135	DXY	300	1786478100	99.815055	99.825978	99.802719	99.813520
122584	SP500	300	1786477200	7733.159956	7734.172775	7729.328275	7729.546625
122585	DOW	300	1786477200	53835.190421	53844.010867	53814.641828	53816.025201
123501	DXY	300	1786478700	99.813088	99.826703	99.802077	99.809466
122586	DXY	300	1786477200	99.815050	99.823125	99.797618	99.816441
122950	SP500	300	1786477800	7727.646251	7727.911401	7720.535781	7726.490821
123499	SP500	300	1786478700	7728.721566	7730.137434	7726.751428	7728.080759
123500	DOW	300	1786478700	53795.756794	53802.362501	53781.776382	53793.001335
123133	SP500	300	1786478100	7726.622755	7727.054068	7722.464919	7726.773310
123316	SP500	300	1786478400	7726.757438	7730.069500	7726.242172	7728.892338
123317	DOW	300	1786478400	53786.364091	53802.939056	53783.924684	53797.636643
123318	DXY	300	1786478400	99.815545	99.825163	99.797820	99.815082
123679	SP500	300	1786479000	7728.105703	7729.216675	7727.077933	7727.519431
123680	DOW	300	1786479000	53794.490104	53801.800083	53782.304305	53793.796926
123681	DXY	300	1786479000	99.809047	99.823925	99.801921	99.807090
123862	SP500	300	1786479300	7727.690937	7729.417920	7726.623020	7728.044121
123863	DOW	300	1786479300	53795.449478	53801.086254	53784.512817	53795.110334
123864	DXY	300	1786479300	99.806217	99.818894	99.795092	99.812146
124045	SP500	300	1786479600	7727.763119	7729.059470	7726.994913	7728.073295
124046	DOW	300	1786479600	53793.903313	53798.049891	53782.361228	53790.268300
124047	DXY	300	1786479600	99.813802	99.829404	99.798076	99.821823
124228	SP500	300	1786479900	7728.382010	7729.613871	7727.274487	7727.873940
124229	DOW	300	1786479900	53790.628896	53802.153111	53786.223105	53791.994396
126952	SP500	300	1786484400	7728.503839	7729.249737	7726.941838	7727.774233
126953	DOW	300	1786484400	53798.720236	53799.603158	53782.787050	53792.621805
126954	DXY	300	1786484400	99.828595	99.840892	99.811505	99.820999
124954	SP500	300	1786481100	7727.894231	7729.204895	7727.164109	7728.243680
124955	DOW	300	1786481100	53791.571156	53798.910757	53783.720957	53788.050546
124956	DXY	300	1786481100	99.823441	99.843403	99.820429	99.829412
128041	SP500	300	1786486200	7728.382165	7730.062491	7727.141935	7728.208967
128042	DOW	300	1786486200	53793.828276	53798.102082	53783.984413	53794.672526
126769	SP500	300	1786484100	7727.951524	7729.479638	7726.466666	7728.700364
126770	DOW	300	1786484100	53794.174760	53798.929241	53777.183218	53796.771682
124594	SP500	300	1786480500	7728.712752	7729.718741	7727.158544	7727.677819
124595	DOW	300	1786480500	53787.126285	53798.128803	53782.805921	53795.580756
124596	DXY	300	1786480500	99.820763	99.836519	99.813437	99.827397
126771	DXY	300	1786484100	99.815611	99.838278	99.815154	99.828871
128043	DXY	300	1786486200	99.829807	99.834328	99.800431	99.810240
127315	SP500	300	1786485000	7727.975584	7729.491697	7726.839513	7728.178420
127316	DOW	300	1786485000	53794.021365	53799.299172	53777.914995	53791.824201
127317	DXY	300	1786485000	99.828230	99.834404	99.818984	99.829128
126403	SP500	300	1786483500	7728.146604	7729.506318	7726.695656	7728.288572
125500	SP500	300	1786482000	7727.316577	7729.233825	7726.889404	7728.156027
125501	DOW	300	1786482000	53791.106487	53802.903034	53780.255384	53794.143914
125502	DXY	300	1786482000	99.821479	99.832712	99.813113	99.826465
125680	SP500	300	1786482300	7727.973360	7729.505440	7727.002274	7728.661366
125681	DOW	300	1786482300	53795.531742	53798.720078	53784.002073	53794.322034
125682	DXY	300	1786482300	99.824951	99.833960	99.802088	99.815002
125317	SP500	300	1786481700	7728.125477	7729.518300	7726.969325	7727.406479
125318	DOW	300	1786481700	53786.209363	53803.973906	53783.891226	53789.991116
125319	DXY	300	1786481700	99.847919	99.852127	99.819261	99.822132
124774	SP500	300	1786480800	7727.603186	7729.518380	7726.778391	7727.879981
124775	DOW	300	1786480800	53795.367835	53800.053404	53778.653725	53791.671904
124776	DXY	300	1786480800	99.828313	99.841047	99.813057	99.822299
126404	DOW	300	1786483500	53790.152169	53803.818626	53783.267884	53789.195431
126405	DXY	300	1786483500	99.827892	99.835216	99.813547	99.827478
124230	DXY	300	1786479900	99.820795	99.831137	99.806719	99.824949
126220	SP500	300	1786483200	7727.757548	7729.661083	7726.935975	7727.857960
125134	SP500	300	1786481400	7728.052536	7730.067237	7726.988741	7728.131439
125135	DOW	300	1786481400	53786.316377	53802.188241	53781.454532	53787.237283
125136	DXY	300	1786481400	99.831015	99.851122	99.827637	99.847640
126221	DOW	300	1786483200	53790.103905	53800.292686	53783.657713	53792.099214
126222	DXY	300	1786483200	99.827058	99.836009	99.815066	99.825566
125860	SP500	300	1786482600	7728.493691	7730.018584	7727.173132	7728.131061
124411	SP500	300	1786480200	7727.947632	7729.859008	7727.101019	7728.835527
124412	DOW	300	1786480200	53791.651941	53801.634779	53784.239705	53787.181998
124413	DXY	300	1786480200	99.824145	99.830594	99.809804	99.820547
125861	DOW	300	1786482600	53795.450659	53799.598984	53782.952804	53796.568210
125862	DXY	300	1786482600	99.812797	99.834739	99.810702	99.820813
127132	SP500	300	1786484700	7727.801900	7729.754864	7726.710429	7727.984429
127133	DOW	300	1786484700	53793.340481	53803.096654	53780.259268	53794.588834
127134	DXY	300	1786484700	99.820038	99.838291	99.813891	99.830694
126586	SP500	300	1786483800	7728.286387	7729.564031	7726.951924	7727.723464
126587	DOW	300	1786483800	53789.781105	53799.140590	53780.371078	53793.926418
126588	DXY	300	1786483800	99.828315	99.840931	99.815472	99.817520
127861	SP500	300	1786485900	7729.323748	7729.828772	7726.503882	7728.097099
127862	DOW	300	1786485900	53793.130493	53803.051521	53781.271111	53793.369383
126040	SP500	300	1786482900	7728.031016	7730.094433	7727.113228	7727.847451
126041	DOW	300	1786482900	53797.813449	53800.165374	53784.084509	53788.942062
127863	DXY	300	1786485900	99.826641	99.837885	99.815823	99.827817
126042	DXY	300	1786482900	99.818840	99.839807	99.814151	99.824630
128761	SP500	300	1786487400	7727.374736	7730.015228	7726.786008	7728.030767
128762	DOW	300	1786487400	53791.979928	53803.385444	53783.116423	53788.134453
128763	DXY	300	1786487400	99.814026	99.825573	99.801975	99.811784
128581	SP500	300	1786487100	7727.750339	7729.452582	7727.238161	7727.604052
127498	SP500	300	1786485300	7727.882226	7730.110943	7726.710224	7727.430210
127499	DOW	300	1786485300	53793.218201	53799.766634	53781.531690	53793.458369
127500	DXY	300	1786485300	99.831567	99.842210	99.814685	99.827003
128582	DOW	300	1786487100	53793.761843	53800.800982	53781.050519	53791.122952
128583	DXY	300	1786487100	99.810642	99.826537	99.796889	99.814897
127681	SP500	300	1786485600	7727.144180	7729.980494	7726.566530	7729.227018
127682	DOW	300	1786485600	53792.051166	53803.586360	53783.348744	53791.759603
127683	DXY	300	1786485600	99.826209	99.834850	99.814887	99.827122
128401	SP500	300	1786486800	7728.054781	7729.617807	7727.093834	7727.693836
128402	DOW	300	1786486800	53793.856664	53799.307211	53781.956986	53792.336680
128403	DXY	300	1786486800	99.807735	99.820652	99.802037	99.808934
128941	SP500	300	1786487700	7727.817054	7729.408347	7726.979278	7728.222375
128942	DOW	300	1786487700	53787.290432	53799.899997	53783.345592	53794.900556
128943	DXY	300	1786487700	99.809490	99.825911	99.798632	99.808517
128221	SP500	300	1786486500	7728.314992	7729.169378	7726.729901	7728.253807
128222	DOW	300	1786486500	53793.650721	53803.726078	53783.944197	53794.038133
128223	DXY	300	1786486500	99.810690	99.823879	99.801342	99.808796
129121	SP500	300	1786488000	7728.223759	7729.270465	7727.143842	7729.177283
129122	DOW	300	1786488000	53796.667095	53799.686910	53778.027409	53788.445616
129123	DXY	300	1786488000	99.806587	99.821957	99.798041	99.809251
129304	SP500	300	1786488300	7728.962006	7729.493304	7726.792742	7727.931226
129305	DOW	300	1786488300	53786.601760	53800.593144	53785.669345	53793.183709
129306	DXY	300	1786488300	99.811332	99.822853	99.801895	99.818665
129487	SP500	300	1786488600	7727.955000	7729.006751	7726.498340	7728.477724
129488	DOW	300	1786488600	53792.096246	53798.256284	53784.534658	53790.328290
129489	DXY	300	1786488600	99.819693	99.824874	99.801205	99.812297
129670	SP500	300	1786488900	7728.298025	7729.354017	7727.263386	7727.988913
132228	DXY	300	1786493100	99.807991	99.820412	99.792986	99.804476
131860	SP500	300	1786492500	7728.256583	7729.766537	7726.656935	7727.918552
131677	SP500	300	1786492200	7728.107566	7730.219261	7727.197597	7728.549927
131678	DOW	300	1786492200	53793.232534	53800.579268	53780.183195	53789.731747
130036	SP500	300	1786489500	7727.964205	7729.404647	7726.514109	7728.531066
130037	DOW	300	1786489500	53798.185096	53803.096712	53782.300298	53787.691362
130038	DXY	300	1786489500	99.808516	99.826634	99.802563	99.811788
130402	SP500	300	1786490100	7729.007473	7729.642558	7726.483770	7728.016924
130403	DOW	300	1786490100	53793.938238	53803.043032	53783.085964	53788.277571
130404	DXY	300	1786490100	99.813656	99.828460	99.799519	99.816736
131679	DXY	300	1786492200	99.810188	99.817472	99.797222	99.804834
131861	DOW	300	1786492500	53787.969668	53799.828168	53778.946241	53795.275700
131862	DXY	300	1786492500	99.804591	99.823737	99.796387	99.808481
132411	DXY	300	1786493400	99.802942	99.819016	99.788073	99.800678
131497	SP500	300	1786491900	7728.711542	7729.683913	7727.111934	7728.166470
131498	DOW	300	1786491900	53786.196011	53799.756316	53775.926227	53792.374127
131499	DXY	300	1786491900	99.808227	99.815884	99.797679	99.811678
129671	DOW	300	1786488900	53791.879999	53799.063913	53784.479031	53789.688532
129672	DXY	300	1786488900	99.810298	99.821258	99.801375	99.815913
133866	DXY	300	1786495800	99.815227	99.822784	99.787281	99.811689
133504	SP500	300	1786495200	7728.295270	7730.088941	7726.865676	7728.457588
133505	DOW	300	1786495200	53794.813407	53801.242595	53784.738107	53795.311974
130219	SP500	300	1786489800	7728.308120	7729.316568	7726.803084	7728.878512
130220	DOW	300	1786489800	53787.031698	53801.715161	53782.601245	53793.210487
130221	DXY	300	1786489800	99.809881	99.820758	99.798906	99.811780
132958	SP500	300	1786494300	7727.667620	7729.698183	7726.936569	7728.159344
132043	SP500	300	1786492800	7727.733746	7729.371384	7726.792169	7729.073456
132044	DOW	300	1786492800	53793.591963	53805.443635	53784.369079	53789.529071
132045	DXY	300	1786492800	99.808762	99.821191	99.805773	99.809310
130951	SP500	300	1786491000	7727.767058	7729.611021	7726.521283	7728.440534
130952	DOW	300	1786491000	53790.283362	53801.461992	53780.352040	53790.077090
130953	DXY	300	1786491000	99.812435	99.828017	99.800906	99.815190
129853	SP500	300	1786489200	7728.185780	7729.764631	7726.994285	7727.944462
129854	DOW	300	1786489200	53789.712442	53800.519140	53780.843727	53796.921923
129855	DXY	300	1786489200	99.813421	99.822027	99.803871	99.810121
130768	SP500	300	1786490700	7727.818483	7729.593903	7727.143635	7728.015978
130769	DOW	300	1786490700	53789.739114	53798.907559	53780.961895	53791.683179
130770	DXY	300	1786490700	99.811219	99.823604	99.803145	99.810000
130585	SP500	300	1786490400	7728.237822	7729.575878	7726.944411	7728.003830
130586	DOW	300	1786490400	53789.268599	53799.987378	53780.956709	53788.621880
130587	DXY	300	1786490400	99.817814	99.823477	99.798920	99.810798
132959	DOW	300	1786494300	53796.520977	53804.997008	53781.244535	53792.211233
132960	DXY	300	1786494300	99.793757	99.808437	99.786147	99.795149
131134	SP500	300	1786491300	7728.295685	7730.539121	7727.203729	7728.443673
131135	DOW	300	1786491300	53791.459532	53803.632950	53782.755953	53790.613714
131136	DXY	300	1786491300	99.813010	99.827180	99.801296	99.814507
133506	DXY	300	1786495200	99.794917	99.815887	99.790339	99.802356
132592	SP500	300	1786493700	7728.476652	7729.426630	7727.277831	7728.468181
132593	DOW	300	1786493700	53792.510354	53803.810969	53781.862682	53786.211501
132594	DXY	300	1786493700	99.799204	99.810011	99.789021	99.796379
132775	SP500	300	1786494000	7728.300219	7730.482181	7726.319719	7727.892403
132776	DOW	300	1786494000	53787.319871	53801.817945	53778.876836	53794.717906
132777	DXY	300	1786494000	99.796046	99.808346	99.785864	99.796064
131317	SP500	300	1786491600	7728.486497	7729.707546	7726.954156	7728.496130
131318	DOW	300	1786491600	53791.784792	53801.818273	53780.321460	53787.557765
131319	DXY	300	1786491600	99.815679	99.821010	99.798082	99.810699
134045	DOW	300	1786496100	53791.733746	53801.939320	53783.558986	53791.093113
132226	SP500	300	1786493100	7729.180391	7729.360320	7727.076519	7727.877363
132227	DOW	300	1786493100	53791.445060	53800.280488	53780.422392	53790.735375
134046	DXY	300	1786496100	99.811855	99.830052	99.794840	99.829094
132409	SP500	300	1786493400	7728.059233	7730.093528	7726.784129	7728.724985
132410	DOW	300	1786493400	53791.252141	53800.737058	53784.205894	53790.393285
133324	SP500	300	1786494900	7727.654496	7729.189963	7726.918948	7728.547873
133325	DOW	300	1786494900	53790.683252	53807.740219	53783.139313	53793.570078
133326	DXY	300	1786494900	99.789626	99.807823	99.785905	99.794552
133141	SP500	300	1786494600	7727.862296	7729.898027	7726.716904	7727.692750
133142	DOW	300	1786494600	53790.578209	53800.196754	53785.167298	53791.713054
133143	DXY	300	1786494600	99.797455	99.805989	99.780925	99.790307
134405	DOW	300	1786496700	53786.920628	53799.965152	53782.363283	53791.242315
134224	SP500	300	1786496400	7728.293486	7729.629615	7726.655021	7727.790157
133684	SP500	300	1786495500	7728.228762	7729.295813	7726.644781	7727.826710
133685	DOW	300	1786495500	53793.165756	53803.435807	53783.655255	53792.011752
133686	DXY	300	1786495500	99.802495	99.819607	99.790342	99.812790
134406	DXY	300	1786496700	99.834199	99.850016	99.813046	99.831589
133864	SP500	300	1786495800	7727.564382	7729.281536	7726.288086	7728.165350
133865	DOW	300	1786495800	53792.053311	53802.387004	53780.649536	53792.462162
134586	DXY	300	1786497000	99.830637	99.857770	99.826330	99.850145
134044	SP500	300	1786496100	7728.217676	7729.580384	7726.785772	7728.353027
134225	DOW	300	1786496400	53790.571899	53798.364957	53781.131738	53786.864457
134226	DXY	300	1786496400	99.828334	99.848738	99.816939	99.834367
134404	SP500	300	1786496700	7728.040449	7729.927501	7727.328118	7728.312178
134766	DXY	300	1786497300	99.848201	99.867968	99.838661	99.848102
134584	SP500	300	1786497000	7728.264487	7729.743450	7727.273626	7728.004420
134585	DOW	300	1786497000	53790.604105	53800.600844	53781.138786	53790.413848
134946	DXY	300	1786497600	99.849031	99.872759	99.845167	99.855764
134764	SP500	300	1786497300	7727.894834	7729.318110	7727.020550	7728.014130
134765	DOW	300	1786497300	53789.360091	53802.011800	53782.864886	53793.158894
134944	SP500	300	1786497600	7728.098597	7729.459580	7726.785470	7728.563093
134945	DOW	300	1786497600	53794.209105	53800.915624	53782.220747	53793.216651
139683	DXY	300	1786505400	99.865764	99.882415	99.850414	99.863417
139321	SP500	300	1786504800	7727.401924	7729.649399	7727.034988	7728.197956
136765	SP500	300	1786500600	7728.473256	7730.015777	7726.740103	7727.988679
136766	DOW	300	1786500600	53794.364669	53800.600187	53783.318523	53793.376477
136767	DXY	300	1786500600	99.849526	99.868491	99.846059	99.857181
139322	DOW	300	1786504800	53790.328860	53799.858383	53785.085466	53792.040747
139323	DXY	300	1786504800	99.859571	99.867097	99.840722	99.854188
139141	SP500	300	1786504500	7728.513553	7729.740010	7726.756817	7727.630867
138775	SP500	300	1786503900	7728.122483	7729.906688	7726.875978	7728.161676
135124	SP500	300	1786497900	7728.521157	7729.413269	7727.002075	7727.667502
135125	DOW	300	1786497900	53794.229210	53799.648663	53779.439529	53789.222796
135126	DXY	300	1786497900	99.856584	99.868152	99.840057	99.848361
138776	DOW	300	1786503900	53793.177374	53800.990919	53783.300618	53788.396597
138777	DXY	300	1786503900	99.858960	99.867094	99.844768	99.852060
135670	SP500	300	1786498800	7728.256261	7729.125783	7726.684729	7728.139240
135671	DOW	300	1786498800	53793.909166	53800.014613	53777.430438	53790.187668
135672	DXY	300	1786498800	99.850554	99.858340	99.838900	99.854558
139142	DOW	300	1786504500	53794.956763	53797.992003	53780.297174	53791.234149
139143	DXY	300	1786504500	99.863271	99.874259	99.852290	99.861391
138043	SP500	300	1786502700	7727.992093	7729.515473	7727.281069	7728.305023
138044	DOW	300	1786502700	53794.668515	53800.477407	53780.406816	53793.123610
137131	SP500	300	1786501200	7727.985468	7730.425041	7726.423444	7728.350520
137132	DOW	300	1786501200	53797.687809	53801.612312	53779.483101	53796.957186
137133	DXY	300	1786501200	99.860782	99.868875	99.849388	99.864128
135307	SP500	300	1786498200	7727.560979	7729.685943	7726.295276	7728.215475
135308	DOW	300	1786498200	53789.838900	53799.539884	53783.596129	53794.255821
135309	DXY	300	1786498200	99.849574	99.862806	99.838249	99.846218
136216	SP500	300	1786499700	7728.098810	7730.186464	7726.711925	7728.189876
136217	DOW	300	1786499700	53790.893792	53801.155976	53783.160961	53790.654639
136218	DXY	300	1786499700	99.835129	99.847834	99.825804	99.836129
136399	SP500	300	1786500000	7727.996006	7729.433843	7726.454377	7728.216614
136400	DOW	300	1786500000	53789.740016	53804.212591	53779.810262	53789.455638
136401	DXY	300	1786500000	99.836396	99.855886	99.827201	99.840218
136033	SP500	300	1786499400	7728.025088	7729.805571	7726.698556	7728.214107
136034	DOW	300	1786499400	53797.324637	53801.870086	53779.887104	53791.669716
136035	DXY	300	1786499400	99.847706	99.856322	99.826037	99.835836
138045	DXY	300	1786502700	99.851703	99.867770	99.830613	99.856611
137314	SP500	300	1786501500	7728.170820	7730.233897	7726.800959	7727.966720
137315	DOW	300	1786501500	53797.879274	53803.683376	53781.802190	53789.616780
137316	DXY	300	1786501500	99.863806	99.891617	99.855331	99.879285
135490	SP500	300	1786498500	7727.931473	7729.784783	7727.094551	7728.097636
135491	DOW	300	1786498500	53794.264196	53803.499173	53783.489117	53794.755761
135492	DXY	300	1786498500	99.844135	99.867559	99.843350	99.850359
136948	SP500	300	1786500900	7727.878738	7729.500191	7726.424950	7727.857000
136949	DOW	300	1786500900	53793.898802	53801.828498	53783.282881	53796.013620
136950	DXY	300	1786500900	99.857244	99.870921	99.843353	99.859823
136582	SP500	300	1786500300	7728.159720	7729.532767	7727.079430	7728.761708
135850	SP500	300	1786499100	7727.833389	7729.433214	7727.130647	7728.045570
135851	DOW	300	1786499100	53790.796315	53802.527400	53780.720928	53795.803502
135852	DXY	300	1786499100	99.857053	99.860053	99.840129	99.845593
136583	DOW	300	1786500300	53788.066028	53803.399954	53783.180777	53795.105715
136584	DXY	300	1786500300	99.838374	99.862884	99.838374	99.850976
138958	SP500	300	1786504200	7728.262297	7729.439858	7726.698851	7728.219625
137677	SP500	300	1786502100	7728.602798	7729.712880	7727.257421	7728.570871
137678	DOW	300	1786502100	53796.019258	53802.387809	53781.218397	53790.524724
137679	DXY	300	1786502100	99.880405	99.882665	99.859210	99.867453
138959	DOW	300	1786504200	53790.288476	53801.222406	53785.798855	53793.458695
138960	DXY	300	1786504200	99.850979	99.874108	99.844830	99.865151
138409	SP500	300	1786503300	7727.853151	7729.239757	7726.508346	7727.990664
137497	SP500	300	1786501800	7728.124398	7729.419211	7726.625089	7728.714931
137498	DOW	300	1786501800	53788.705509	53799.254013	53779.256488	53796.915687
137499	DXY	300	1786501800	99.881257	99.885366	99.862604	99.879260
138410	DOW	300	1786503300	53793.782996	53802.104796	53782.115538	53791.195912
137860	SP500	300	1786502400	7728.324263	7729.311025	7726.812129	7728.139046
137861	DOW	300	1786502400	53790.598250	53804.415639	53782.091596	53793.731175
137862	DXY	300	1786502400	99.867598	99.873171	99.844984	99.853614
138226	SP500	300	1786503000	7728.129371	7729.644138	7726.898761	7728.105662
138227	DOW	300	1786503000	53793.992104	53798.938621	53780.918592	53791.886373
138228	DXY	300	1786503000	99.855387	99.872213	99.844974	99.853662
138411	DXY	300	1786503300	99.852559	99.863038	99.839550	99.859580
138592	SP500	300	1786503600	7728.233294	7729.205305	7726.710210	7728.271328
138593	DOW	300	1786503600	53791.299770	53803.853485	53782.234308	53793.899407
138594	DXY	300	1786503600	99.858196	99.869230	99.844785	99.857737
139863	DXY	300	1786505700	99.865833	99.878612	99.849022	99.869590
139501	SP500	300	1786505100	7728.311545	7729.578457	7727.278724	7728.082261
139681	SP500	300	1786505400	7727.894571	7729.646196	7727.174699	7727.188789
139502	DOW	300	1786505100	53790.887865	53800.157833	53783.799498	53794.581031
139503	DXY	300	1786505100	99.851988	99.873612	99.850671	99.865142
139682	DOW	300	1786505400	53794.838299	53800.198682	53783.751372	53791.895611
140043	DXY	300	1786506000	99.870553	99.878158	99.858487	99.869077
139861	SP500	300	1786505700	7727.240435	7729.182611	7727.037553	7728.413318
139862	DOW	300	1786505700	53792.801198	53800.843767	53784.076831	53792.182289
140223	DXY	300	1786506300	99.868350	99.875291	99.854156	99.874280
140041	SP500	300	1786506000	7728.316884	7729.660338	7727.033617	7728.626711
140042	DOW	300	1786506000	53791.121143	53800.911304	53783.636468	53788.993628
140221	SP500	300	1786506300	7728.492053	7730.053563	7726.760671	7727.752942
140222	DOW	300	1786506300	53787.850023	53799.060642	53784.522777	53792.913352
140401	SP500	300	1786506600	7727.895513	7729.558090	7726.850665	7727.949043
140402	DOW	300	1786506600	53793.693461	53801.444419	53780.215140	53791.302021
143688	DXY	300	1786512000	99.887262	99.900742	99.872524	99.884902
144964	SP500	300	1786514100	7728.000384	7729.493135	7726.299369	7727.617681
144965	DOW	300	1786514100	53796.412445	53806.747765	53774.108337	53788.462702
144966	DXY	300	1786514100	99.880183	99.902566	99.878529	99.890644
143869	SP500	300	1786512300	7728.176252	7729.804056	7726.524951	7728.454112
143870	DOW	300	1786512300	53786.211816	53798.762416	53780.522882	53793.016018
143871	DXY	300	1786512300	99.886037	99.899396	99.878594	99.894091
142228	SP500	300	1786509600	7727.685044	7729.805529	7726.357289	7728.414179
142229	DOW	300	1786509600	53794.692991	53801.751038	53780.885768	53792.183825
142230	DXY	300	1786509600	99.886719	99.896656	99.873328	99.886695
141133	SP500	300	1786507800	7728.555023	7730.161850	7726.816830	7728.560468
141134	DOW	300	1786507800	53795.252316	53802.879393	53783.672274	53792.173552
141135	DXY	300	1786507800	99.876551	99.890070	99.866042	99.873794
140767	SP500	300	1786507200	7728.768507	7729.926946	7727.148230	7728.399385
140768	DOW	300	1786507200	53794.214817	53804.312789	53782.801963	53791.688729
140769	DXY	300	1786507200	99.871731	99.892741	99.860785	99.880180
143137	SP500	300	1786511100	7728.384309	7729.875780	7726.900332	7727.905712
143138	DOW	300	1786511100	53792.136296	53805.527632	53779.867293	53791.216745
143139	DXY	300	1786511100	99.879793	99.889195	99.865426	99.872289
142954	SP500	300	1786510800	7728.605206	7729.886163	7727.081655	7728.150064
142955	DOW	300	1786510800	53793.789930	53799.330168	53783.357964	53791.167726
142956	DXY	300	1786510800	99.875723	99.886918	99.866944	99.879534
145144	SP500	300	1786514400	7727.912847	7729.175747	7726.697250	7728.127806
143503	SP500	300	1786511700	7728.952802	7729.545271	7727.140312	7728.108651
141682	SP500	300	1786508700	7728.223513	7729.186026	7726.778083	7728.622084
141683	DOW	300	1786508700	53788.750993	53806.722761	53784.912853	53794.573318
141684	DXY	300	1786508700	99.886511	99.906649	99.880487	99.892547
141499	SP500	300	1786508400	7729.329611	7730.025887	7726.852075	7728.265249
141500	DOW	300	1786508400	53796.287402	53799.110416	53781.293144	53788.252886
141501	DXY	300	1786508400	99.876350	99.903129	99.870097	99.888794
140950	SP500	300	1786507500	7728.626813	7729.307339	7726.662176	7728.303460
140951	DOW	300	1786507500	53789.573785	53799.006829	53778.220759	53793.837923
140952	DXY	300	1786507500	99.880233	99.893611	99.865692	99.876515
140403	DXY	300	1786506600	99.873940	99.887945	99.860516	99.872810
143504	DOW	300	1786511700	53790.922812	53803.533991	53782.145508	53791.217884
143505	DXY	300	1786511700	99.886249	99.897589	99.876700	99.887213
141865	SP500	300	1786509000	7728.681595	7729.675023	7726.972436	7728.507400
141866	DOW	300	1786509000	53794.890013	53802.453959	53783.411976	53791.063442
141867	DXY	300	1786509000	99.891358	99.903156	99.878438	99.895970
140584	SP500	300	1786506900	7727.785592	7729.454222	7726.827731	7728.551439
140585	DOW	300	1786506900	53789.394728	53801.974923	53784.633070	53792.367065
140586	DXY	300	1786506900	99.874802	99.884365	99.863854	99.873012
141316	SP500	300	1786508100	7728.500033	7730.173844	7727.151800	7729.524435
141317	DOW	300	1786508100	53792.195458	53798.862351	53782.276847	53794.251652
141318	DXY	300	1786508100	99.871493	99.885465	99.862470	99.875976
142591	SP500	300	1786510200	7727.551123	7729.210875	7727.023076	7728.618469
142592	DOW	300	1786510200	53796.402952	53799.585461	53781.305041	53792.125626
142593	DXY	300	1786510200	99.879721	99.887952	99.865538	99.872825
143320	SP500	300	1786511400	7728.103136	7729.162662	7727.378530	7728.769839
142048	SP500	300	1786509300	7728.400634	7729.509442	7726.613198	7727.729187
142049	DOW	300	1786509300	53792.701753	53799.512878	53781.992260	53796.244201
142050	DXY	300	1786509300	99.893742	99.901707	99.876858	99.885728
143321	DOW	300	1786511400	53789.219284	53799.588377	53778.318407	53792.262519
142408	SP500	300	1786509900	7728.583475	7730.274177	7727.284153	7727.741011
142409	DOW	300	1786509900	53790.996533	53804.100319	53778.342480	53798.096378
142410	DXY	300	1786509900	99.887563	99.897882	99.872714	99.881584
143322	DXY	300	1786511400	99.872814	99.892055	99.869015	99.885976
142774	SP500	300	1786510500	7728.678454	7729.062789	7726.815721	7728.532226
142775	DOW	300	1786510500	53792.037985	53803.537055	53778.753374	53793.401844
142776	DXY	300	1786510500	99.871113	99.885695	99.855721	99.873674
145145	DOW	300	1786514400	53787.260686	53806.695605	53780.244260	53789.477793
145146	DXY	300	1786514400	99.891822	99.900569	99.877065	99.886510
144598	SP500	300	1786513500	7727.806413	7729.628528	7727.332727	7728.041321
144599	DOW	300	1786513500	53791.397363	53800.091138	53782.546405	53794.459590
144052	SP500	300	1786512600	7728.188814	7729.270036	7726.456911	7727.648737
144053	DOW	300	1786512600	53794.265986	53800.510006	53780.909059	53792.776272
144054	DXY	300	1786512600	99.896211	99.907558	99.877135	99.899196
143686	SP500	300	1786512000	7728.155413	7729.583316	7726.992476	7728.311986
143687	DOW	300	1786512000	53793.349993	53801.795565	53783.647304	53785.935544
144232	SP500	300	1786512900	7727.804907	7730.140540	7727.173095	7728.033091
144233	DOW	300	1786512900	53794.891589	53802.191908	53782.580096	53795.077549
144234	DXY	300	1786512900	99.900382	99.907068	99.888491	99.893812
144415	SP500	300	1786513200	7728.086334	7728.919971	7726.500562	7727.681187
144416	DOW	300	1786513200	53793.280643	53805.950538	53783.001567	53789.589231
144600	DXY	300	1786513500	99.891455	99.897963	99.874481	99.877123
144781	SP500	300	1786513800	7727.900427	7729.645187	7727.007487	7728.194186
144782	DOW	300	1786513800	53793.114972	53797.516634	53781.837104	53794.890008
144417	DXY	300	1786513200	99.896014	99.903859	99.872302	99.890939
144783	DXY	300	1786513800	99.875515	99.896727	99.870058	99.882427
145326	DXY	300	1786514700	99.884825	99.895842	99.875803	99.888942
145506	DXY	300	1786515000	99.887252	99.897041	99.875544	99.876330
145324	SP500	300	1786514700	7728.097208	7729.399156	7726.750080	7728.496254
145325	DOW	300	1786514700	53788.620617	53799.370759	53778.124113	53789.443508
145504	SP500	300	1786515000	7728.512226	7729.336265	7726.177270	7728.344009
145505	DOW	300	1786515000	53788.801032	53798.573148	53776.764068	53788.634947
145684	SP500	300	1786515300	7728.527273	7729.784448	7726.953510	7728.602552
145685	DOW	300	1786515300	53788.514762	53799.427401	53780.542456	53792.298668
145686	DXY	300	1786515300	99.877968	99.900732	99.869735	99.876367
145867	SP500	300	1786515600	7728.660786	7729.911933	7726.846437	7727.918233
146598	DXY	300	1786516800	99.871992	99.895991	99.865130	99.868456
146233	SP500	300	1786516200	7728.601326	7729.080592	7726.372852	7728.278892
146234	DOW	300	1786516200	53790.927935	53799.244935	53785.848095	53792.375225
146235	DXY	300	1786516200	99.873353	99.886149	99.858191	99.878393
148054	SP500	300	1786519200	7729.233735	7729.714308	7726.242083	7728.621995
147871	SP500	300	1786518900	7728.169270	7729.603213	7727.315796	7729.147230
147872	DOW	300	1786518900	53794.176473	53800.659259	53781.114654	53792.281601
147873	DXY	300	1786518900	99.867942	99.875149	99.845077	99.851571
148055	DOW	300	1786519200	53792.112813	53802.410642	53781.173766	53792.791829
148056	DXY	300	1786519200	99.850828	99.859337	99.836178	99.859023
150429	DXY	300	1786523100	99.875715	99.886005	99.847518	99.856236
150244	SP500	300	1786522800	7728.560712	7729.203722	7726.902571	7728.559668
149878	SP500	300	1786522200	7728.161501	7729.849322	7727.160218	7728.119007
149149	SP500	300	1786521000	7728.287612	7729.651348	7727.092217	7728.166907
149150	DOW	300	1786521000	53795.852477	53799.574527	53785.831294	53791.169643
147688	SP500	300	1786518600	7728.542732	7729.321576	7727.452238	7728.395229
147689	DOW	300	1786518600	53792.193315	53801.457483	53778.261996	53793.548732
147690	DXY	300	1786518600	99.863443	99.869554	99.848320	99.869381
149151	DXY	300	1786521000	99.859572	99.878058	99.846206	99.866136
147139	SP500	300	1786517700	7728.677922	7730.081153	7726.787238	7727.554876
147140	DOW	300	1786517700	53788.741726	53799.838336	53784.633441	53791.905595
145868	DOW	300	1786515600	53792.718564	53803.209247	53784.239547	53794.952780
145869	DXY	300	1786515600	99.877735	99.884092	99.863214	99.877810
147141	DXY	300	1786517700	99.875734	99.884686	99.862451	99.878362
146956	SP500	300	1786517400	7728.103693	7729.956844	7726.779844	7728.491659
146957	DOW	300	1786517400	53788.415690	53799.492654	53779.729692	53789.374347
146416	SP500	300	1786516500	7728.116912	7729.732944	7726.318782	7727.763814
146417	DOW	300	1786516500	53793.048195	53805.404914	53779.918208	53786.871114
146418	DXY	300	1786516500	99.880515	99.885277	99.861653	99.873463
146958	DXY	300	1786517400	99.876851	99.882026	99.859882	99.877339
146050	SP500	300	1786515900	7727.997803	7729.750634	7727.067584	7728.466582
146051	DOW	300	1786515900	53796.549432	53801.175215	53779.111647	53790.384604
146052	DXY	300	1786515900	99.877021	99.885980	99.860509	99.875594
148237	SP500	300	1786519500	7728.528860	7730.413455	7726.616555	7728.176912
146776	SP500	300	1786517100	7727.917044	7729.193521	7727.140656	7727.881625
146777	DOW	300	1786517100	53793.621147	53801.677466	53783.353616	53786.375828
146778	DXY	300	1786517100	99.869520	99.884960	99.860533	99.877101
148238	DOW	300	1786519500	53790.849451	53802.895398	53780.618280	53794.756515
148239	DXY	300	1786519500	99.857898	99.864263	99.840101	99.851748
147322	SP500	300	1786518000	7727.405501	7729.545348	7726.363542	7728.254741
147323	DOW	300	1786518000	53792.842637	53801.119849	53782.283906	53795.058184
147324	DXY	300	1786518000	99.880235	99.891240	99.865657	99.879327
149879	DOW	300	1786522200	53789.302326	53798.224659	53776.575046	53788.477038
149698	SP500	300	1786521900	7728.103883	7729.177473	7726.904528	7727.880692
149699	DOW	300	1786521900	53789.049923	53798.635671	53782.232650	53789.619623
148783	SP500	300	1786520400	7728.016706	7729.473075	7726.983539	7728.422303
148784	DOW	300	1786520400	53790.416059	53803.048271	53783.679184	53791.912181
148785	DXY	300	1786520400	99.868983	99.879345	99.842534	99.863489
146596	SP500	300	1786516800	7728.056699	7729.224852	7726.828018	7727.909847
146597	DOW	300	1786516800	53788.826555	53804.140324	53781.604095	53793.370785
148966	SP500	300	1786520700	7728.272774	7729.605339	7726.597212	7728.584700
148967	DOW	300	1786520700	53790.856489	53802.389909	53782.312565	53795.045360
148968	DXY	300	1786520700	99.861895	99.879578	99.850198	99.858803
147505	SP500	300	1786518300	7728.417426	7729.491430	7726.597395	7728.244063
147506	DOW	300	1786518300	53793.009458	53802.519169	53784.398536	53790.450126
147507	DXY	300	1786518300	99.880631	99.891327	99.856224	99.863836
149700	DXY	300	1786521900	99.862958	99.878792	99.855352	99.866395
149880	DXY	300	1786522200	99.863964	99.884441	99.855321	99.878555
148417	SP500	300	1786519800	7728.137902	7729.423269	7726.900685	7728.432203
148418	DOW	300	1786519800	53794.381832	53798.883283	53780.461459	53794.744211
148419	DXY	300	1786519800	99.852104	99.872825	99.846401	99.858343
148600	SP500	300	1786520100	7728.127094	7729.858986	7727.021538	7727.828094
150245	DOW	300	1786522800	53788.129041	53798.544927	53785.908600	53787.054536
148601	DOW	300	1786520100	53795.537243	53800.430150	53777.327903	53792.506191
148602	DXY	300	1786520100	99.857488	99.870128	99.844800	99.867268
149515	SP500	300	1786521600	7727.980157	7729.272905	7726.745484	7728.030809
149332	SP500	300	1786521300	7728.254494	7729.200999	7726.509086	7728.173128
149333	DOW	300	1786521300	53792.795329	53801.692836	53783.961317	53792.404163
149334	DXY	300	1786521300	99.867739	99.871189	99.850333	99.857837
149516	DOW	300	1786521600	53792.888356	53799.728289	53783.882908	53790.161727
149517	DXY	300	1786521600	99.857593	99.866243	99.845794	99.863054
150246	DXY	300	1786522800	99.869036	99.879230	99.851206	99.873818
150061	SP500	300	1786522500	7728.221295	7729.649773	7726.432486	7728.449156
150062	DOW	300	1786522500	53790.087275	53806.591113	53779.745949	53788.606072
150063	DXY	300	1786522500	99.876664	99.892066	99.858028	99.866840
150609	DXY	300	1786523400	99.858630	99.863410	99.840372	99.858560
150427	SP500	300	1786523100	7728.627490	7729.769353	7727.214858	7728.404485
150428	DOW	300	1786523100	53786.432308	53804.400828	53784.548676	53792.206406
150608	DOW	300	1786523400	53793.307159	53807.032356	53783.111470	53791.987284
150607	SP500	300	1786523400	7728.624546	7729.343784	7726.955619	7728.664051
150790	SP500	300	1786523700	7728.830694	7729.071373	7727.002842	7728.152465
150791	DOW	300	1786523700	53791.385582	53801.117701	53783.488661	53793.255790
150792	DXY	300	1786523700	99.857908	99.871714	99.850435	99.856418
150973	SP500	300	1786524000	7727.951559	7729.546802	7726.838733	7728.773304
150974	DOW	300	1786524000	53795.371145	53800.508918	53777.166013	53792.492868
150975	DXY	300	1786524000	99.854234	99.878214	99.849342	99.869969
151156	SP500	300	1786524300	7728.599042	7729.088947	7726.886344	7727.888117
151157	DOW	300	1786524300	53793.357114	53805.776565	53782.872791	53791.688861
151158	DXY	300	1786524300	99.868853	99.879404	99.845954	99.851665
155884	SP500	300	1786532100	7728.238859	7729.134604	7727.089673	7728.784577
155701	SP500	300	1786531800	7728.291341	7729.981448	7726.872879	7728.010303
155702	DOW	300	1786531800	53795.452654	53800.060701	53784.524626	53796.870734
155885	DOW	300	1786532100	53797.230326	53801.777729	53779.053308	53792.607520
155338	SP500	300	1786531200	7728.396956	7729.066663	7726.725401	7728.089924
155339	DOW	300	1786531200	53794.482887	53804.548339	53785.100994	53792.123626
154798	SP500	300	1786530300	7727.704815	7729.215451	7726.701980	7728.941021
154799	DOW	300	1786530300	53792.350608	53799.846747	53781.913382	53790.123084
154800	DXY	300	1786530300	99.842773	99.857981	99.829186	99.837330
154618	SP500	300	1786530000	7728.469952	7730.066012	7727.276658	7727.803390
154619	DOW	300	1786530000	53793.794002	53799.289287	53782.571580	53790.652553
153340	SP500	300	1786527900	7728.479730	7729.421013	7726.826353	7728.140088
151339	SP500	300	1786524600	7727.895959	7729.478333	7727.030605	7728.541051
151340	DOW	300	1786524600	53790.849461	53805.327497	53783.816815	53791.067214
151341	DXY	300	1786524600	99.850090	99.862318	99.840594	99.846920
153341	DOW	300	1786527900	53788.786223	53799.526615	53782.509214	53787.060564
153342	DXY	300	1786527900	99.797176	99.822181	99.783566	99.815967
151882	SP500	300	1786525500	7728.415555	7729.424615	7727.048398	7728.212339
151883	DOW	300	1786525500	53789.980596	53804.221218	53783.651364	53791.548194
151884	DXY	300	1786525500	99.851797	99.871089	99.847632	99.858734
154255	SP500	300	1786529400	7727.844485	7729.892466	7726.476836	7728.625017
154256	DOW	300	1786529400	53795.214952	53800.942689	53785.885283	53793.031021
153523	SP500	300	1786528200	7727.965042	7729.071214	7727.220087	7727.444759
153524	DOW	300	1786528200	53788.079345	53801.646395	53785.183230	53794.200521
153525	DXY	300	1786528200	99.815972	99.835301	99.801249	99.830999
153157	SP500	300	1786527600	7728.490422	7729.193972	7726.519217	7728.432808
153158	DOW	300	1786527600	53792.641804	53802.995339	53782.613352	53787.582075
151522	SP500	300	1786524900	7728.356014	7729.548344	7726.353912	7727.991254
151523	DOW	300	1786524900	53792.400174	53803.124514	53781.618871	53789.599947
151524	DXY	300	1786524900	99.844874	99.870217	99.840494	99.853160
153159	DXY	300	1786527600	99.800372	99.808791	99.777778	99.796385
152614	SP500	300	1786526700	7728.739106	7729.418008	7727.331104	7728.200803
152615	DOW	300	1786526700	53792.674464	53799.670826	53782.555341	53787.375580
152616	DXY	300	1786526700	99.829781	99.837209	99.806604	99.811884
152431	SP500	300	1786526400	7728.131362	7729.295661	7727.097796	7728.836425
152432	DOW	300	1786526400	53790.273245	53799.617135	53779.101888	53791.715844
152433	DXY	300	1786526400	99.859470	99.864578	99.823509	99.830219
152248	SP500	300	1786526100	7727.959588	7729.498857	7727.242194	7727.997765
152249	DOW	300	1786526100	53790.306675	53799.360687	53784.927986	53791.823275
152250	DXY	300	1786526100	99.846899	99.866445	99.836669	99.857393
154257	DXY	300	1786529400	99.858452	99.868877	99.834879	99.849262
151702	SP500	300	1786525200	7727.747321	7729.779164	7726.732674	7728.394152
151703	DOW	300	1786525200	53788.600025	53799.584696	53781.256758	53787.880493
151704	DXY	300	1786525200	99.852881	99.864664	99.840739	99.852081
152794	SP500	300	1786527000	7728.263132	7729.597025	7727.178892	7728.590179
152795	DOW	300	1786527000	53786.499082	53801.560565	53781.885086	53791.231419
152796	DXY	300	1786527000	99.813139	99.831746	99.728387	99.757048
152065	SP500	300	1786525800	7728.346112	7729.442352	7727.111716	7728.043119
152066	DOW	300	1786525800	53793.111047	53803.374345	53782.185714	53792.047222
152067	DXY	300	1786525800	99.858634	99.873275	99.845000	99.845330
154620	DXY	300	1786530000	99.843584	99.848133	99.822745	99.841052
153889	SP500	300	1786528800	7728.579378	7729.857989	7726.914819	7728.423550
153890	DOW	300	1786528800	53793.469983	53801.249089	53784.105573	53793.046644
153891	DXY	300	1786528800	99.841871	99.860677	99.821216	99.843971
154438	SP500	300	1786529700	7728.784257	7729.370003	7727.398790	7728.361259
154439	DOW	300	1786529700	53792.555581	53799.234159	53782.688996	53793.218144
153706	SP500	300	1786528500	7727.616625	7729.836215	7726.971548	7728.818809
153707	DOW	300	1786528500	53795.632571	53802.385669	53777.778738	53791.343302
153708	DXY	300	1786528500	99.829753	99.850116	99.820914	99.844045
154440	DXY	300	1786529700	99.850818	99.854571	99.821140	99.844082
152974	SP500	300	1786527300	7728.526262	7729.098414	7727.043773	7728.190734
152975	DOW	300	1786527300	53790.439754	53802.558990	53783.646296	53791.048099
152976	DXY	300	1786527300	99.755044	99.801934	99.746032	99.798606
154072	SP500	300	1786529100	7728.121517	7729.392781	7726.527316	7727.911733
154073	DOW	300	1786529100	53794.102784	53802.979948	53781.701020	53795.061352
154074	DXY	300	1786529100	99.844195	99.865956	99.837899	99.857862
155340	DXY	300	1786531200	99.826707	99.856392	99.822424	99.844620
155518	SP500	300	1786531500	7728.318591	7729.715587	7726.728851	7728.376321
155519	DOW	300	1786531500	53792.229157	53802.378313	53783.605577	53795.019908
154978	SP500	300	1786530600	7728.834597	7729.474011	7727.077420	7727.683994
154979	DOW	300	1786530600	53789.692798	53802.701627	53780.908089	53795.357386
154980	DXY	300	1786530600	99.836780	99.849492	99.825367	99.835238
155886	DXY	300	1786532100	99.840522	99.864533	99.817829	99.859917
155158	SP500	300	1786530900	7727.496620	7729.831640	7726.367297	7728.207839
155159	DOW	300	1786530900	53794.962531	53802.151202	53783.158581	53795.929036
155160	DXY	300	1786530900	99.834095	99.842516	99.823046	99.828200
155520	DXY	300	1786531500	99.846886	99.854761	99.831767	99.833399
156067	SP500	300	1786532400	7728.741205	7729.371807	7726.178544	7727.905445
155703	DXY	300	1786531800	99.833633	99.849864	99.824119	99.839364
156068	DOW	300	1786532400	53792.827729	53805.206283	53784.863113	53792.900498
156069	DXY	300	1786532400	99.862346	99.875632	99.844410	99.855665
156250	SP500	300	1786532700	7727.887140	7729.559333	7726.741884	7728.002539
156251	DOW	300	1786532700	53790.853371	53803.980578	53784.204728	53789.950787
156252	DXY	300	1786532700	99.855010	99.864384	99.838914	99.852100
156433	SP500	300	1786533000	7728.027899	7729.527034	7726.826152	7727.976512
156434	DOW	300	1786533000	53791.867774	53800.948594	53782.057825	53789.627684
156435	DXY	300	1786533000	99.853960	99.866284	99.840841	99.845662
156616	SP500	300	1786533300	7728.074846	7729.984567	7726.901960	7728.349016
156617	DOW	300	1786533300	53788.436301	53800.972025	53784.257710	53793.398853
161545	SP500	300	1786541400	7728.330437	7764.631334	7728.330437	7754.704440
160081	SP500	300	1786539000	7727.821959	7729.838408	7726.997811	7728.362669
160082	DOW	300	1786539000	53790.265027	53801.472065	53783.896129	53791.128535
160083	DXY	300	1786539000	99.682329	99.692421	99.634330	99.648017
161546	DOW	300	1786541400	53792.637119	53959.271855	53792.570558	53871.202731
161362	SP500	300	1786541100	7727.948128	7729.335453	7726.956587	7728.047319
157348	SP500	300	1786534500	7728.849598	7729.469710	7726.513244	7728.018976
157349	DOW	300	1786534500	53792.096158	53800.654860	53781.364349	53793.761878
157350	DXY	300	1786534500	99.834873	99.846068	99.808166	99.821572
159718	SP500	300	1786538400	7728.128981	7729.608565	7726.439677	7728.127125
159719	DOW	300	1786538400	53795.330758	53799.604074	53777.333123	53787.682137
159355	SP500	300	1786537800	7728.050136	7729.646879	7726.867989	7727.759915
156982	SP500	300	1786533900	7727.302341	7729.010179	7726.807157	7727.497914
156983	DOW	300	1786533900	53789.470190	53803.411006	53783.793624	53790.865394
156984	DXY	300	1786533900	99.851869	99.862957	99.838654	99.847582
158443	SP500	300	1786536300	7728.456123	7729.447431	7726.703885	7728.379588
158444	DOW	300	1786536300	53792.493103	53802.892804	53781.750018	53791.674035
158445	DXY	300	1786536300	99.777181	99.793598	99.762425	99.787737
159356	DOW	300	1786537800	53792.140641	53802.886851	53781.025576	53795.242204
159357	DXY	300	1786537800	99.789155	99.798973	99.767335	99.782342
159172	SP500	300	1786537500	7728.045264	7729.431104	7727.208732	7728.309057
159173	DOW	300	1786537500	53790.306348	53800.322747	53782.249714	53792.480895
159174	DXY	300	1786537500	99.766440	99.801648	99.758695	99.791486
157894	SP500	300	1786535400	7728.634517	7729.540632	7727.289599	7728.230424
157895	DOW	300	1786535400	53792.295357	53801.362845	53782.244811	53793.409067
157896	DXY	300	1786535400	99.814364	99.823457	99.791803	99.807036
157711	SP500	300	1786535100	7728.777420	7729.253943	7726.686162	7728.738914
157712	DOW	300	1786535100	53794.247928	53803.042314	53780.169561	53793.082217
157713	DXY	300	1786535100	99.822136	99.841639	99.812720	99.814972
159720	DXY	300	1786538400	99.750192	99.847573	99.690667	99.714106
157165	SP500	300	1786534200	7727.542207	7729.878914	7726.822963	7728.661272
157166	DOW	300	1786534200	53791.318029	53799.123530	53781.622771	53793.706522
157167	DXY	300	1786534200	99.846793	99.859567	99.828357	99.835812
156618	DXY	300	1786533300	99.845823	99.859548	99.830474	99.848651
158077	SP500	300	1786535700	7728.471322	7730.245512	7725.923827	7728.118855
158078	DOW	300	1786535700	53795.417670	53803.430357	53785.225509	53793.701171
158079	DXY	300	1786535700	99.807694	99.814849	99.787026	99.804458
157528	SP500	300	1786534800	7727.958166	7729.664057	7726.673009	7728.512708
157529	DOW	300	1786534800	53795.023987	53799.573750	53784.802709	53794.680495
157530	DXY	300	1786534800	99.821096	99.832338	99.808707	99.824618
156799	SP500	300	1786533600	7728.342329	7729.232323	7726.315605	7727.571375
156800	DOW	300	1786533600	53791.677027	53803.087085	53781.630052	53791.334569
156801	DXY	300	1786533600	99.847279	99.862841	99.834815	99.853930
161363	DOW	300	1786541100	53795.606821	53802.689787	53781.790161	53792.418067
161364	DXY	300	1786541100	99.718698	99.725482	99.672986	99.699501
161179	SP500	300	1786540800	7727.729015	7729.252826	7727.171315	7727.688272
159538	SP500	300	1786538100	7727.666912	7729.656961	7726.916574	7728.205614
159539	DOW	300	1786538100	53795.477035	53798.710903	53782.723262	53794.281927
159540	DXY	300	1786538100	99.781686	99.803209	99.748000	99.751696
158809	SP500	300	1786536900	7728.502602	7729.788634	7725.869220	7727.991661
158810	DOW	300	1786536900	53794.071155	53799.352403	53779.364212	53791.273503
158811	DXY	300	1786536900	99.788096	99.796066	99.761225	99.768882
158260	SP500	300	1786536000	7727.940324	7729.900216	7726.926766	7728.502418
158261	DOW	300	1786536000	53794.921369	53803.398731	53781.633085	53793.558909
158262	DXY	300	1786536000	99.804557	99.810460	99.762417	99.777350
158626	SP500	300	1786536600	7728.366850	7729.185763	7726.825076	7728.755758
158627	DOW	300	1786536600	53793.304160	53803.873523	53783.606855	53794.363461
158628	DXY	300	1786536600	99.789734	99.797764	99.764414	99.786771
161180	DOW	300	1786540800	53789.550253	53802.764062	53779.685331	53795.383066
161181	DXY	300	1786540800	99.641936	99.719700	99.631590	99.719700
158992	SP500	300	1786537200	7728.050860	7729.919288	7727.136056	7728.338222
158993	DOW	300	1786537200	53789.511150	53802.908884	53782.470752	53790.732405
160813	SP500	300	1786540200	7727.598407	7729.290505	7726.468936	7728.052312
158994	DXY	300	1786537200	99.767418	99.791311	99.759913	99.768749
160814	DOW	300	1786540200	53788.791989	53802.038460	53782.348400	53788.094682
160815	DXY	300	1786540200	99.651452	99.676455	99.630852	99.669489
160996	SP500	300	1786540500	7728.160570	7729.416102	7726.789086	7727.979312
160264	SP500	300	1786539300	7728.659140	7730.870472	7727.147537	7728.617029
160265	DOW	300	1786539300	53791.206151	53801.198968	53783.227805	53787.526668
160266	DXY	300	1786539300	99.647641	99.718299	99.647011	99.676053
159898	SP500	300	1786538700	7727.915976	7729.266072	7726.741682	7727.638178
159899	DOW	300	1786538700	53786.725663	53798.401542	53781.774830	53790.693160
159900	DXY	300	1786538700	99.713919	99.738404	99.684551	99.684551
160447	SP500	300	1786539600	7728.450859	7729.854023	7726.988888	7728.113928
160448	DOW	300	1786539600	53788.628478	53801.027294	53783.355173	53788.778638
160449	DXY	300	1786539600	99.674407	99.692317	99.657549	99.664350
160997	DOW	300	1786540500	53786.996652	53803.171288	53784.805043	53790.703438
160998	DXY	300	1786540500	99.667690	99.669344	99.608488	99.640608
160630	SP500	300	1786539900	7728.126201	7729.376160	7726.055181	7727.745316
160631	DOW	300	1786539900	53789.892585	53801.499491	53780.582121	53787.942187
160632	DXY	300	1786539900	99.663182	99.685563	99.650327	99.653541
161547	DXY	300	1786541400	99.698387	99.727027	99.692000	99.705496
161728	SP500	300	1786541700	7754.902898	7758.564078	7750.815731	7752.283685
161729	DOW	300	1786541700	53870.202899	53913.952551	53864.810870	53895.355929
161730	DXY	300	1786541700	99.704806	99.717989	99.684089	99.689863
161911	SP500	300	1786542000	7752.232858	7754.723572	7748.401103	7752.841428
161912	DOW	300	1786542000	53894.907353	53916.415558	53841.110000	53843.445347
161913	DXY	300	1786542000	99.690457	99.696440	99.662046	99.680069
162094	SP500	300	1786542300	7752.916572	7759.992737	7747.327236	7759.992737
166115	DOW	300	1786548900	53779.177841	53789.359768	53758.867215	53758.867215
162823	SP500	300	1786543500	7743.703005	7748.317112	7742.545624	7746.020811
162824	DOW	300	1786543500	53785.112762	53795.625246	53741.196538	53750.143489
162825	DXY	300	1786543500	99.725990	99.731888	99.706640	99.726477
162460	SP500	300	1786542900	7751.247135	7751.973753	7744.213653	7749.452487
162461	DOW	300	1786542900	53841.977570	53843.103289	53778.912383	53787.217273
162462	DXY	300	1786542900	99.758455	99.770232	99.726615	99.743301
164653	SP500	300	1786546500	7743.174690	7746.045172	7741.018146	7745.571262
164654	DOW	300	1786546500	53774.556237	53786.236326	53759.526835	53782.111651
164655	DXY	300	1786546500	99.797248	99.826279	99.772301	99.807856
164287	SP500	300	1786545900	7752.346510	7754.784054	7747.004092	7748.444022
164104	SP500	300	1786545600	7747.812343	7753.286407	7747.482204	7752.062827
164105	DOW	300	1786545600	53804.552498	53847.591307	53802.046651	53819.972300
164106	DXY	300	1786545600	99.756664	99.775000	99.734586	99.771964
164288	DOW	300	1786545900	53820.899977	53840.680000	53781.960891	53816.656525
164289	DXY	300	1786545900	99.772876	99.779895	99.750538	99.765645
164836	SP500	300	1786546800	7745.348414	7745.631870	7739.153723	7741.101215
164837	DOW	300	1786546800	53782.919657	53782.919657	53748.787167	53762.035538
163921	SP500	300	1786545300	7743.562047	7751.180864	7742.177285	7748.118690
163922	DOW	300	1786545300	53793.692701	53810.802555	53780.469901	53804.835414
163923	DXY	300	1786545300	99.725610	99.758830	99.711610	99.758412
162095	DOW	300	1786542300	53844.869161	53876.146980	53805.234866	53873.402840
162096	DXY	300	1786542300	99.681942	99.738288	99.679077	99.731839
162643	SP500	300	1786543200	7749.734631	7750.838487	7743.121967	7743.544552
162644	DOW	300	1786543200	53787.655523	53828.153262	53775.402681	53785.009214
162645	DXY	300	1786543200	99.744509	99.746438	99.705689	99.724079
164838	DXY	300	1786546800	99.807285	99.843061	99.801555	99.817369
163372	SP500	300	1786544400	7748.618698	7752.754606	7745.090000	7752.290395
163373	DOW	300	1786544400	53837.760757	53868.774997	53803.377708	53851.953686
163374	DXY	300	1786544400	99.742849	99.752063	99.733658	99.740587
163189	SP500	300	1786544100	7746.131106	7753.304244	7745.098104	7748.406536
163190	DOW	300	1786544100	53781.965637	53859.144035	53762.645237	53838.098307
163191	DXY	300	1786544100	99.713190	99.750318	99.698418	99.745223
162277	SP500	300	1786542600	7760.263743	7760.278933	7748.985543	7751.056908
162278	DOW	300	1786542600	53871.881576	53887.116674	53818.889136	53842.092186
162279	DXY	300	1786542600	99.729791	99.764018	99.725544	99.760853
166116	DXY	300	1786548900	99.824812	99.842000	99.810370	99.840408
163006	SP500	300	1786543800	7746.297377	7750.110416	7743.865502	7745.930136
163007	DOW	300	1786543800	53751.797898	53790.667032	53732.139112	53782.960000
163008	DXY	300	1786543800	99.728762	99.736467	99.710000	99.712089
164470	SP500	300	1786546200	7748.295280	7749.768412	7743.003971	7743.301876
164471	DOW	300	1786546200	53816.134784	53833.855408	53774.436721	53774.436721
164472	DXY	300	1786546200	99.766188	99.802981	99.749199	99.796108
163555	SP500	300	1786544700	7752.340140	7756.707672	7750.100000	7750.585811
163556	DOW	300	1786544700	53851.449937	53861.802496	53820.690000	53832.283905
163557	DXY	300	1786544700	99.741149	99.756030	99.720625	99.733551
165934	SP500	300	1786548600	7744.896320	7747.541595	7739.653297	7741.736827
165935	DOW	300	1786548600	53785.541335	53798.506403	53757.190275	53777.929433
165936	DXY	300	1786548600	99.828122	99.835256	99.811456	99.822657
165385	SP500	300	1786547700	7745.043496	7746.210410	7742.022646	7743.494851
165386	DOW	300	1786547700	53768.552588	53782.327895	53747.383146	53764.489956
165387	DXY	300	1786547700	99.843963	99.850335	99.804822	99.828179
165019	SP500	300	1786547100	7741.255798	7744.691190	7739.642992	7743.688073
165020	DOW	300	1786547100	53763.829514	53769.990907	53741.118360	53765.304213
165021	DXY	300	1786547100	99.817877	99.832942	99.802258	99.815926
163738	SP500	300	1786545000	7750.682235	7752.664932	7743.250000	7743.584762
163739	DOW	300	1786545000	53831.811572	53852.406781	53793.713730	53794.465092
163740	DXY	300	1786545000	99.732263	99.739251	99.706014	99.727875
165202	SP500	300	1786547400	7743.659037	7746.478336	7739.686631	7744.948346
165203	DOW	300	1786547400	53763.248456	53797.440367	53756.695551	53769.756494
165204	DXY	300	1786547400	99.814532	99.855510	99.811973	99.845064
166294	SP500	300	1786549200	7739.522416	7742.389394	7738.191604	7740.763078
166295	DOW	300	1786549200	53758.042249	53812.160519	53752.902317	53808.170394
166296	DXY	300	1786549200	99.840099	99.854353	99.826022	99.840976
165751	SP500	300	1786548300	7741.184805	7745.540000	7740.673178	7745.028141
165752	DOW	300	1786548300	53753.717379	53783.840315	53747.194510	53783.840315
165568	SP500	300	1786548000	7743.251308	7744.476628	7739.704528	7741.113096
165569	DOW	300	1786548000	53762.919189	53773.493909	53739.027091	53755.427087
165753	DXY	300	1786548300	99.811719	99.839821	99.810938	99.825763
166839	DXY	300	1786550100	99.864765	99.887687	99.855243	99.869433
166474	SP500	300	1786549500	7740.605734	7743.698647	7739.869787	7743.048973
165570	DXY	300	1786548000	99.827566	99.832411	99.794728	99.811074
166114	SP500	300	1786548900	7741.802158	7744.303937	7739.418151	7739.418151
166475	DOW	300	1786549500	53806.376532	53820.776732	53787.554216	53806.459939
166476	DXY	300	1786549500	99.839283	99.855047	99.829468	99.843891
166654	SP500	300	1786549800	7743.098600	7745.082058	7740.486967	7742.015173
166655	DOW	300	1786549800	53804.447281	53814.960652	53785.758895	53806.195965
166838	DOW	300	1786550100	53807.550212	53832.427747	53786.538159	53808.713278
166837	SP500	300	1786550100	7742.234795	7744.413617	7740.886041	7742.776738
166656	DXY	300	1786549800	99.844645	99.869000	99.836556	99.865738
167020	SP500	300	1786550400	7742.572628	7747.078681	7742.325863	7744.993246
167021	DOW	300	1786550400	53808.743479	53849.600026	53798.264757	53832.001415
167022	DXY	300	1786550400	99.867717	99.876372	99.837886	99.845897
167203	SP500	300	1786550700	7745.099995	7746.631758	7742.655033	7745.557669
167204	DOW	300	1786550700	53831.261769	53847.771933	53807.674406	53823.686656
167205	DXY	300	1786550700	99.845295	99.861481	99.826490	99.838766
167386	SP500	300	1786551000	7745.477504	7749.034512	7744.518121	7746.941845
167387	DOW	300	1786551000	53824.288395	53849.109314	53802.283751	53840.848923
167388	DXY	300	1786551000	99.840819	99.871617	99.822729	99.851618
172110	DXY	300	1786558800	100.000143	100.004257	99.970755	99.984419
171748	SP500	300	1786558200	7751.453283	7755.001740	7750.634935	7754.479024
171749	DOW	300	1786558200	53801.766356	53817.499246	53788.754431	53812.536946
171750	DXY	300	1786558200	100.002229	100.020839	99.992270	100.004746
171568	SP500	300	1786557900	7751.505865	7752.931481	7749.875910	7751.620615
170479	SP500	300	1786556100	7751.933032	7753.882589	7750.521322	7751.031466
170480	DOW	300	1786556100	53817.504994	53826.245050	53803.822098	53812.165722
170481	DXY	300	1786556100	99.962179	99.969111	99.939251	99.954413
167569	SP500	300	1786551300	7747.158057	7749.955113	7745.384933	7746.647154
167570	DOW	300	1786551300	53841.569015	53847.439939	53826.439112	53829.303040
167571	DXY	300	1786551300	99.851204	99.898769	99.850168	99.880953
169570	SP500	300	1786554600	7753.076183	7754.747786	7751.333252	7753.419496
168109	SP500	300	1786552200	7747.129596	7748.914342	7744.498461	7744.711570
168110	DOW	300	1786552200	53811.375747	53833.652359	53803.096189	53809.836064
168111	DXY	300	1786552200	99.895687	99.917716	99.888190	99.904634
169571	DOW	300	1786554600	53821.521453	53828.029068	53803.241840	53815.840730
169572	DXY	300	1786554600	99.946121	99.949394	99.921463	99.946511
171569	DOW	300	1786557900	53811.808847	53814.733151	53796.806358	53800.139426
169753	SP500	300	1786554900	7753.429034	7753.945931	7748.724334	7750.421911
168655	SP500	300	1786553100	7749.208359	7751.840948	7748.250654	7750.549455
168656	DOW	300	1786553100	53820.154328	53827.607079	53805.229973	53818.690843
168657	DXY	300	1786553100	99.937551	99.944127	99.921092	99.928507
167749	SP500	300	1786551600	7746.613601	7749.662445	7745.138915	7747.396905
167750	DOW	300	1786551600	53827.904023	53837.981362	53817.118032	53822.167529
167751	DXY	300	1786551600	99.878990	99.889429	99.856954	99.870678
168838	SP500	300	1786553400	7750.390324	7755.866798	7749.669931	7753.627700
168839	DOW	300	1786553400	53818.442232	53852.364921	53809.713499	53826.998543
168840	DXY	300	1786553400	99.928994	99.935657	99.913246	99.920023
168472	SP500	300	1786552800	7749.736023	7752.077745	7749.004123	7749.004123
168473	DOW	300	1786552800	53824.406480	53836.918282	53813.750726	53821.082368
168474	DXY	300	1786552800	99.904700	99.936941	99.899609	99.935538
169754	DOW	300	1786554900	53816.939391	53823.393115	53786.542263	53801.455441
169755	DXY	300	1786554900	99.946941	99.955998	99.926034	99.940903
169387	SP500	300	1786554300	7752.937765	7756.885899	7752.399333	7752.982712
169388	DOW	300	1786554300	53813.283649	53844.161620	53799.098230	53822.525080
169389	DXY	300	1786554300	99.957366	99.971615	99.934404	99.944074
169021	SP500	300	1786553700	7753.486871	7754.005197	7750.710682	7752.074059
167929	SP500	300	1786551900	7747.311866	7750.331501	7745.942249	7747.060227
167930	DOW	300	1786551900	53824.004899	53829.312019	53806.925499	53813.452207
167931	DXY	300	1786551900	99.870916	99.899621	99.862366	99.894645
169022	DOW	300	1786553700	53829.090952	53829.680750	53807.664644	53819.306766
169023	DXY	300	1786553700	99.920698	99.968853	99.918705	99.962580
168289	SP500	300	1786552500	7744.640798	7750.505815	7744.213524	7749.768768
168290	DOW	300	1786552500	53810.854044	53834.213610	53809.784976	53823.925994
168291	DXY	300	1786552500	99.902441	99.913891	99.884265	99.905338
170116	SP500	300	1786555500	7749.771969	7753.145046	7749.771969	7750.686285
170117	DOW	300	1786555500	53794.046155	53824.456788	53791.826358	53803.500295
170118	DXY	300	1786555500	99.953122	99.966531	99.945556	99.956538
171028	SP500	300	1786557000	7750.210248	7753.305026	7749.502190	7750.292667
171029	DOW	300	1786557000	53807.336248	53830.072322	53804.174670	53807.987279
171030	DXY	300	1786557000	99.982336	100.000784	99.966791	99.998090
170845	SP500	300	1786556700	7750.550188	7753.277184	7749.956850	7750.089231
170846	DOW	300	1786556700	53822.556418	53843.139604	53809.147997	53809.147997
170296	SP500	300	1786555800	7750.527509	7753.780143	7749.835013	7752.162795
170297	DOW	300	1786555800	53801.909669	53820.446181	53796.814864	53818.911652
169936	SP500	300	1786555200	7750.584309	7752.456291	7749.082044	7750.001110
169937	DOW	300	1786555200	53800.061250	53807.513847	53779.888481	53792.465872
169938	DXY	300	1786555200	99.942351	99.960620	99.929999	99.952462
169204	SP500	300	1786554000	7751.772818	7754.334462	7751.232853	7753.081705
169205	DOW	300	1786554000	53820.548791	53826.502231	53803.276152	53811.962702
169206	DXY	300	1786554000	99.964086	99.972354	99.946398	99.954885
170298	DXY	300	1786555800	99.955096	99.968419	99.943621	99.961517
170662	SP500	300	1786556400	7751.063565	7753.387239	7750.726830	7750.794988
170663	DOW	300	1786556400	53813.467643	53842.175864	53810.135658	53823.579114
170664	DXY	300	1786556400	99.952167	99.971919	99.937429	99.955459
170847	DXY	300	1786556700	99.956253	99.988560	99.951706	99.981331
171570	DXY	300	1786557900	99.997436	100.009414	99.988892	100.004645
171208	SP500	300	1786557300	7750.062670	7752.765773	7748.932328	7751.660227
171209	DOW	300	1786557300	53808.696141	53827.944665	53792.828164	53807.828015
171210	DXY	300	1786557300	99.999904	100.003946	99.973785	99.982578
171388	SP500	300	1786557600	7751.883480	7752.768405	7749.241432	7751.428402
171389	DOW	300	1786557600	53806.200633	53825.611745	53801.633955	53809.894658
171390	DXY	300	1786557600	99.980417	100.007491	99.979581	99.995580
171928	SP500	300	1786558500	7754.600995	7755.095831	7751.866245	7753.928168
172108	SP500	300	1786558800	7754.192997	7755.032669	7751.853913	7754.770460
171929	DOW	300	1786558500	53810.980044	53815.389870	53793.864593	53808.147768
171930	DXY	300	1786558500	100.005795	100.016512	99.991111	99.998688
172109	DOW	300	1786558800	53806.906445	53819.415561	53796.656779	53804.573043
172288	SP500	300	1786559100	7754.820475	7756.210385	7752.897149	7753.785508
172289	DOW	300	1786559100	53805.896043	53819.682433	53795.873724	53798.580260
172290	DXY	300	1786559100	99.982441	99.992368	99.976018	99.979953
172471	SP500	300	1786559400	7753.689453	7757.941249	7752.963721	7755.503144
172472	DOW	300	1786559400	53800.689515	53825.840983	53795.446417	53819.099370
172473	DXY	300	1786559400	99.981104	99.989688	99.967230	99.975742
172654	SP500	300	1786559700	7755.588932	7759.180272	7754.839983	7756.186738
172655	DOW	300	1786559700	53820.364712	53843.510461	53810.962603	53822.197676
172656	DXY	300	1786559700	99.973364	99.982407	99.954617	99.979922
172837	SP500	300	1786560000	7756.466205	7760.471447	7756.466205	7758.487497
172838	DOW	300	1786560000	53822.034449	53865.562958	53821.539435	53857.898902
175216	SP500	300	1786563900	7750.778654	7753.685841	7749.196656	7751.821948
175217	DOW	300	1786563900	53807.414823	53828.122098	53797.116150	53810.425864
175218	DXY	300	1786563900	100.005732	100.018416	99.995556	100.005357
177772	SP500	300	1786568100	7747.718195	7749.891584	7747.420122	7748.668778
176131	SP500	300	1786565400	7748.712593	7749.437330	7746.812531	7747.866070
176132	DOW	300	1786565400	53769.554104	53777.915116	53763.102729	53772.224516
176133	DXY	300	1786565400	100.005953	100.015822	99.984182	99.998504
173569	SP500	300	1786561200	7753.622148	7756.202510	7753.110018	7755.404664
173570	DOW	300	1786561200	53830.780520	53864.158370	53824.164299	53852.507530
173571	DXY	300	1786561200	99.991948	100.008920	99.977305	100.002407
173203	SP500	300	1786560600	7757.815876	7759.394810	7756.475624	7756.789820
173204	DOW	300	1786560600	53849.662770	53857.426470	53838.428511	53850.977668
173205	DXY	300	1786560600	99.989754	100.006924	99.981446	99.993797
177773	DOW	300	1786568100	53770.735915	53779.296469	53760.968323	53770.833924
174667	SP500	300	1786563000	7752.031615	7753.238717	7749.943948	7751.771517
174668	DOW	300	1786563000	53815.010023	53829.491825	53807.006496	53821.076175
174669	DXY	300	1786563000	99.993330	100.001040	99.973541	99.989563
177589	SP500	300	1786567800	7748.506775	7750.431605	7747.044589	7747.881794
176314	SP500	300	1786565700	7748.022359	7750.202400	7746.781602	7748.015333
176315	DOW	300	1786565700	53772.066945	53778.311420	53758.163005	53769.551976
176316	DXY	300	1786565700	99.999843	100.012973	99.981910	99.995865
175582	SP500	300	1786564500	7746.216998	7749.412501	7742.692496	7748.847177
175583	DOW	300	1786564500	53754.240395	53784.095589	53745.309938	53772.023853
175584	DXY	300	1786564500	100.004409	100.012030	99.991918	100.005473
175399	SP500	300	1786564200	7751.774950	7752.038750	7745.269594	7746.074644
174118	SP500	300	1786562100	7753.930635	7755.557591	7752.064254	7754.209563
174119	DOW	300	1786562100	53820.062900	53826.762482	53805.089429	53820.567669
174120	DXY	300	1786562100	100.009914	100.026434	99.998509	100.006040
175400	DOW	300	1786564200	53808.566693	53809.096363	53740.164844	53755.606494
173935	SP500	300	1786561800	7754.575855	7756.368453	7752.465697	7753.767479
173936	DOW	300	1786561800	53845.383846	53852.124174	53815.326165	53818.074163
173937	DXY	300	1786561800	100.016962	100.022422	99.992336	100.011438
173386	SP500	300	1786560900	7756.496183	7757.619660	7753.318393	7753.590488
173387	DOW	300	1786560900	53849.243435	53857.525832	53822.785487	53829.819056
173388	DXY	300	1786560900	99.995259	100.004353	99.981226	99.992974
172839	DXY	300	1786560000	99.982396	100.000698	99.970663	99.983133
175401	DXY	300	1786564200	100.003257	100.016309	99.990441	100.005551
174301	SP500	300	1786562400	7754.227221	7754.653697	7749.514171	7751.605462
174302	DOW	300	1786562400	53819.355219	53826.712495	53803.243008	53811.615871
174303	DXY	300	1786562400	100.007695	100.014046	99.988658	99.997872
173020	SP500	300	1786560300	7758.513195	7758.955086	7755.227203	7757.911007
173021	DOW	300	1786560300	53855.852510	53862.466637	53844.065061	53851.226728
173022	DXY	300	1786560300	99.981035	100.001593	99.970045	99.991334
173752	SP500	300	1786561500	7755.287696	7756.744661	7753.920974	7754.478372
173753	DOW	300	1786561500	53854.326939	53863.030570	53833.893261	53843.591746
173754	DXY	300	1786561500	100.001952	100.028123	99.990580	100.016666
177590	DOW	300	1786567800	53771.650758	53777.809359	53759.947782	53770.161337
177591	DXY	300	1786567800	99.988880	99.993819	99.968955	99.984481
175948	SP500	300	1786565100	7748.351755	7750.202760	7746.998761	7748.410149
175033	SP500	300	1786563600	7751.082048	7751.837931	7747.536961	7750.906037
175034	DOW	300	1786563600	53827.236956	53834.271831	53797.618916	53808.398135
175035	DXY	300	1786563600	100.007705	100.019953	99.989256	100.007474
174484	SP500	300	1786562700	7751.590715	7753.813325	7750.006327	7752.101851
174485	DOW	300	1786562700	53812.898794	53835.579336	53801.467842	53813.635889
174486	DXY	300	1786562700	99.999793	100.013224	99.986829	99.994453
175949	DOW	300	1786565100	53768.134767	53779.227345	53759.840099	53771.127994
175950	DXY	300	1786565100	100.019207	100.025033	99.997325	100.005395
174850	SP500	300	1786563300	7751.689114	7753.019724	7749.974430	7751.200039
174851	DOW	300	1786563300	53819.784439	53843.804414	53816.889133	53828.508710
174852	DXY	300	1786563300	99.987570	100.007214	99.985784	100.005628
175765	SP500	300	1786564800	7748.966607	7749.944320	7747.329157	7748.207700
175766	DOW	300	1786564800	53772.309765	53779.689330	53759.376814	53768.909190
175767	DXY	300	1786564800	100.006549	100.032548	99.996360	100.019664
177406	SP500	300	1786567500	7748.529318	7750.171266	7746.937002	7748.572266
177407	DOW	300	1786567500	53769.530674	53779.225681	53759.418561	53769.914492
177408	DXY	300	1786567500	99.995992	100.003724	99.975319	99.989394
177040	SP500	300	1786566900	7748.386904	7749.952439	7747.317024	7748.848762
177041	DOW	300	1786566900	53770.613257	53780.520885	53761.611268	53770.438681
176494	SP500	300	1786566000	7748.086724	7750.411026	7747.471452	7748.606316
176495	DOW	300	1786566000	53769.492006	53776.004021	53760.913606	53769.594883
176496	DXY	300	1786566000	99.996488	100.013689	99.985950	100.004217
176674	SP500	300	1786566300	7748.668020	7750.132290	7747.378133	7748.294830
176675	DOW	300	1786566300	53769.178502	53781.475772	53759.835318	53771.741885
176676	DXY	300	1786566300	100.002828	100.014338	99.993843	100.006934
176857	SP500	300	1786566600	7748.445552	7749.951595	7746.882944	7748.629572
176858	DOW	300	1786566600	53770.725634	53780.933249	53760.282038	53770.003455
177042	DXY	300	1786566900	100.004170	100.012564	99.985784	99.997139
177223	SP500	300	1786567200	7748.810399	7749.746782	7747.251385	7748.815442
177224	DOW	300	1786567200	53771.337858	53774.482726	53761.938151	53769.404581
176859	DXY	300	1786566600	100.004566	100.015434	99.984676	100.002917
177225	DXY	300	1786567200	99.998221	100.013763	99.985998	99.995462
177774	DXY	300	1786568100	99.983272	99.991428	99.961135	99.969544
177955	SP500	300	1786568400	7748.959925	7749.844138	7747.197170	7748.113240
177956	DOW	300	1786568400	53770.003103	53777.873418	53758.431588	53770.996237
177957	DXY	300	1786568400	99.967145	99.985261	99.953763	99.974463
178138	SP500	300	1786568700	7748.179539	7749.890047	7746.822955	7748.834850
178139	DOW	300	1786568700	53769.749048	53783.965648	53761.575290	53769.476986
178140	DXY	300	1786568700	99.976305	99.988692	99.968043	99.970041
178321	SP500	300	1786569000	7748.599402	7749.925616	7747.192530	7749.082631
182676	DXY	300	1786576200	99.986487	99.996593	99.979035	99.986608
179053	SP500	300	1786570200	7748.355351	7750.016973	7746.482349	7748.792076
179054	DOW	300	1786570200	53770.324778	53778.926699	53756.000928	53767.737259
179055	DXY	300	1786570200	99.986918	99.993348	99.973966	99.987895
178687	SP500	300	1786569600	7748.414472	7749.483692	7747.049086	7748.219319
178688	DOW	300	1786569600	53768.753851	53777.400692	53760.804531	53770.996181
178689	DXY	300	1786569600	99.974575	99.997703	99.961715	99.985815
179962	SP500	300	1786571700	7749.167346	7749.593430	7746.516119	7748.262418
179963	DOW	300	1786571700	53772.294675	53779.120310	53762.449525	53773.295798
179964	DXY	300	1786571700	99.981501	100.003048	99.975718	99.986120
180685	SP500	300	1786572900	7748.404425	7749.750921	7746.977085	7748.524823
180686	DOW	300	1786572900	53769.655403	53781.170385	53762.961560	53769.542111
180687	DXY	300	1786572900	99.987417	99.996112	99.977034	99.981391
181225	SP500	300	1786573800	7748.249416	7749.690239	7747.383490	7748.269278
181226	DOW	300	1786573800	53769.959171	53781.402995	53762.184825	53769.125095
180145	SP500	300	1786572000	7748.079551	7750.075293	7747.187357	7748.630998
180146	DOW	300	1786572000	53773.800508	53781.056202	53757.897696	53770.681340
180147	DXY	300	1786572000	99.983901	99.999420	99.976197	99.989969
181227	DXY	300	1786573800	99.987082	99.999693	99.975367	99.988712
178322	DOW	300	1786569000	53771.264266	53781.652150	53762.405056	53770.685143
178323	DXY	300	1786569000	99.969893	99.981007	99.942113	99.969988
181408	SP500	300	1786574100	7747.970583	7749.911490	7747.303824	7748.522823
179596	SP500	300	1786571100	7748.819668	7749.500439	7747.041094	7748.468064
179597	DOW	300	1786571100	53769.874060	53780.239418	53761.542886	53766.719578
178870	SP500	300	1786569900	7748.524655	7749.917093	7746.955138	7748.524928
178871	DOW	300	1786569900	53772.971607	53783.194019	53763.551817	53770.594615
178872	DXY	300	1786569900	99.988219	99.995104	99.976366	99.986082
179598	DXY	300	1786571100	99.986757	99.995386	99.969845	99.987384
179413	SP500	300	1786570800	7748.244062	7749.968531	7747.003173	7748.836432
179414	DOW	300	1786570800	53771.231090	53783.664153	53759.371606	53768.972050
179415	DXY	300	1786570800	99.983569	99.996385	99.975062	99.987312
178504	SP500	300	1786569300	7749.113603	7749.693099	7747.061543	7748.646143
178505	DOW	300	1786569300	53770.299216	53775.724206	53761.027529	53770.002497
178506	DXY	300	1786569300	99.967910	99.984971	99.962723	99.973677
181409	DOW	300	1786574100	53767.291943	53781.906791	53763.463005	53768.916425
181410	DXY	300	1786574100	99.988275	99.999882	99.970322	99.983035
179233	SP500	300	1786570500	7748.508080	7749.859736	7747.268350	7748.349574
179234	DOW	300	1786570500	53765.835056	53778.827390	53762.569943	53772.505441
179235	DXY	300	1786570500	99.988849	99.995544	99.972059	99.983071
181954	SP500	300	1786575000	7748.049198	7749.483248	7746.944821	7748.220683
179779	SP500	300	1786571400	7748.273727	7749.456182	7747.180236	7748.897103
179780	DOW	300	1786571400	53767.934225	53777.893995	53761.726733	53770.486113
179781	DXY	300	1786571400	99.989057	99.994554	99.975626	99.983413
181955	DOW	300	1786575000	53769.035168	53780.401995	53759.875057	53772.058391
181956	DXY	300	1786575000	99.985446	99.998750	99.974327	99.987249
181774	SP500	300	1786574700	7749.099615	7749.328797	7747.315471	7748.216870
181775	DOW	300	1786574700	53776.117310	53783.765237	53757.463479	53767.418988
181045	SP500	300	1786573500	7748.031708	7750.002379	7747.074935	7748.053479
181046	DOW	300	1786573500	53768.839623	53779.070863	53760.298857	53770.581295
181047	DXY	300	1786573500	99.989372	99.996209	99.973127	99.986593
180865	SP500	300	1786573200	7748.609623	7749.967433	7747.305092	7748.133804
180866	DOW	300	1786573200	53767.428115	53777.332827	53763.702468	53768.264436
180867	DXY	300	1786573200	99.981710	99.995362	99.972921	99.987477
180505	SP500	300	1786572600	7749.018948	7749.608583	7747.052746	7748.562918
180506	DOW	300	1786572600	53768.282215	53780.144229	53758.873235	53769.984064
180507	DXY	300	1786572600	99.984044	99.996523	99.971086	99.987870
180325	SP500	300	1786572300	7748.606722	7749.631002	7746.680268	7748.793706
180326	DOW	300	1786572300	53769.065601	53779.481618	53763.246483	53768.428375
180327	DXY	300	1786572300	99.992466	99.997258	99.974589	99.982256
181776	DXY	300	1786574700	99.988200	99.995344	99.977364	99.987295
182854	SP500	300	1786576500	7748.982481	7750.218685	7746.624535	7748.363837
182314	SP500	300	1786575600	7748.328638	7750.031565	7747.349861	7747.950259
182315	DOW	300	1786575600	53767.842475	53781.484447	53763.938685	53770.194630
182316	DXY	300	1786575600	99.979946	99.995413	99.976693	99.986319
181591	SP500	300	1786574400	7748.614866	7749.996490	7746.743047	7749.063864
181592	DOW	300	1786574400	53770.032526	53778.658719	53760.543573	53774.383584
181593	DXY	300	1786574400	99.982362	99.993665	99.975601	99.986269
182134	SP500	300	1786575300	7748.186570	7749.752538	7747.152092	7748.493366
182135	DOW	300	1786575300	53772.043914	53780.717821	53763.175283	53768.956852
182136	DXY	300	1786575300	99.986595	100.001085	99.974940	99.982179
182855	DOW	300	1786576500	53774.823316	53780.957148	53757.878193	53769.336731
182494	SP500	300	1786575900	7747.907400	7750.231545	7747.514684	7749.218138
182495	DOW	300	1786575900	53771.523716	53780.076150	53760.119002	53770.977029
182496	DXY	300	1786575900	99.985694	99.997321	99.973058	99.985958
183035	DOW	300	1786576800	53767.607184	53777.988512	53762.920747	53769.907230
183036	DXY	300	1786576800	99.981242	100.000526	99.975327	99.982316
183216	DXY	300	1786577100	99.983507	99.996075	99.975555	99.986291
182674	SP500	300	1786576200	7749.335786	7749.845128	7747.452952	7748.959738
182675	DOW	300	1786576200	53769.758274	53778.611896	53759.209112	53773.573172
182856	DXY	300	1786576500	99.987139	99.994414	99.975881	99.978892
183034	SP500	300	1786576800	7748.256922	7749.834388	7747.170218	7748.051147
183396	DXY	300	1786577400	99.985059	100.000326	99.975778	99.987134
183214	SP500	300	1786577100	7748.281982	7749.685285	7746.702747	7748.001582
183215	DOW	300	1786577100	53770.582658	53778.395310	53760.326173	53771.764789
183394	SP500	300	1786577400	7747.821281	7749.764970	7746.997567	7748.476706
183395	DOW	300	1786577400	53773.625273	53776.498499	53763.841189	53771.454786
183574	SP500	300	1786577700	7748.413272	7749.441843	7746.979228	7748.399078
183575	DOW	300	1786577700	53771.712880	53777.254056	53763.420667	53768.222670
183576	DXY	300	1786577700	99.988337	100.004209	99.975553	99.985796
185399	DOW	300	1786580700	53773.854316	53778.644776	53761.840341	53770.103363
185400	DXY	300	1786580700	99.946102	99.950248	99.930939	99.932267
188856	DXY	300	1786586400	99.956645	99.985023	99.951916	99.975226
188305	SP500	300	1786585500	7748.542780	7749.531755	7747.022354	7748.280781
188122	SP500	300	1786585200	7748.617337	7749.848173	7746.780790	7748.490793
188123	DOW	300	1786585200	53770.447659	53785.087167	53759.325361	53768.449815
188306	DOW	300	1786585500	53767.704582	53779.505462	53755.253119	53771.871454
187216	SP500	300	1786583700	7749.133904	7750.539070	7747.470390	7748.367068
187217	DOW	300	1786583700	53771.441531	53782.255997	53762.052981	53769.044159
187218	DXY	300	1786583700	99.942881	99.961552	99.936153	99.943067
183757	SP500	300	1786578000	7748.482113	7749.426351	7747.249700	7748.298149
183758	DOW	300	1786578000	53766.535606	53780.254171	53762.312734	53766.412723
183759	DXY	300	1786578000	99.984442	99.993380	99.959561	99.962014
187036	SP500	300	1786583400	7748.004431	7749.385059	7747.056900	7748.837596
187037	DOW	300	1786583400	53771.541669	53780.777656	53759.515905	53770.391975
186676	SP500	300	1786582800	7748.133690	7749.887178	7747.233756	7748.641843
186677	DOW	300	1786582800	53766.054257	53779.619421	53761.444091	53767.138908
186678	DXY	300	1786582800	99.945279	99.957592	99.928986	99.949881
185761	SP500	300	1786581300	7748.194888	7749.857199	7747.597666	7748.224782
185762	DOW	300	1786581300	53769.828828	53778.519430	53760.101212	53770.723166
185763	DXY	300	1786581300	99.932917	99.944922	99.923126	99.933160
184306	SP500	300	1786578900	7748.299419	7750.299599	7747.539816	7747.981781
184307	DOW	300	1786578900	53769.154652	53781.207333	53760.981421	53774.074063
184308	DXY	300	1786578900	99.962294	99.969451	99.949427	99.962551
185944	SP500	300	1786581600	7748.395894	7749.714225	7747.067882	7747.977140
185945	DOW	300	1786581600	53769.587698	53784.435799	53757.674875	53769.529233
183940	SP500	300	1786578300	7748.055975	7749.766652	7747.089720	7748.403063
183941	DOW	300	1786578300	53767.252129	53778.589798	53757.066253	53767.740140
183942	DXY	300	1786578300	99.959990	99.974715	99.950376	99.961375
185946	DXY	300	1786581600	99.935354	99.941619	99.907836	99.925056
185578	SP500	300	1786581000	7747.913193	7749.750032	7747.006803	7748.414754
185038	SP500	300	1786580100	7748.434352	7749.765031	7747.491180	7748.902705
185039	DOW	300	1786580100	53769.227974	53782.175988	53760.363542	53773.615571
185040	DXY	300	1786580100	99.938774	99.946989	99.922549	99.938662
184855	SP500	300	1786579800	7748.541431	7750.215896	7747.226708	7748.586873
184856	DOW	300	1786579800	53771.257932	53778.730958	53759.699139	53771.253292
184857	DXY	300	1786579800	99.949520	99.955578	99.924619	99.937564
184672	SP500	300	1786579500	7748.464390	7749.778069	7746.638904	7748.742786
184673	DOW	300	1786579500	53767.161085	53778.453294	53759.805528	53773.123721
184674	DXY	300	1786579500	99.955858	99.961117	99.934793	99.948708
185579	DOW	300	1786581000	53772.188815	53780.573545	53760.876081	53769.655154
185580	DXY	300	1786581000	99.934744	99.946987	99.922071	99.932096
185218	SP500	300	1786580400	7749.167186	7749.331728	7746.953731	7748.959014
184123	SP500	300	1786578600	7748.218531	7749.866901	7747.501176	7748.551919
184124	DOW	300	1786578600	53769.623446	53780.697416	53764.198614	53767.895198
184125	DXY	300	1786578600	99.959925	99.971761	99.947393	99.963011
185219	DOW	300	1786580400	53773.329488	53778.465469	53760.586707	53772.715733
185220	DXY	300	1786580400	99.938704	99.953506	99.925325	99.946432
184489	SP500	300	1786579200	7747.728189	7750.273159	7746.424674	7748.645879
184490	DOW	300	1786579200	53775.912493	53780.973180	53762.566847	53766.914256
184491	DXY	300	1786579200	99.962458	99.970773	99.944461	99.957368
187038	DXY	300	1786583400	99.938086	99.948828	99.928033	99.945043
186856	SP500	300	1786583100	7748.463458	7750.397269	7747.402826	7748.225215
186310	SP500	300	1786582200	7748.231066	7749.895274	7746.736155	7748.678827
186311	DOW	300	1786582200	53769.851555	53776.449157	53760.751489	53769.028226
186312	DXY	300	1786582200	99.924074	99.939095	99.913207	99.915922
186857	DOW	300	1786583100	53766.505585	53780.428927	53760.757820	53769.790631
186858	DXY	300	1786583100	99.947684	99.963426	99.931139	99.936958
186127	SP500	300	1786581900	7747.951264	7750.080111	7746.774392	7747.935761
186128	DOW	300	1786581900	53768.232252	53787.481142	53763.743013	53769.851801
185398	SP500	300	1786580700	7748.835676	7750.348587	7747.242596	7748.101264
186129	DXY	300	1786581900	99.922653	99.932699	99.912363	99.921904
186493	SP500	300	1786582500	7748.802087	7749.834297	7746.714267	7748.239611
186494	DOW	300	1786582500	53767.183357	53777.423655	53764.342653	53767.948864
186495	DXY	300	1786582500	99.917677	99.947249	99.915769	99.945291
188307	DXY	300	1786585500	99.926745	99.948686	99.915365	99.937720
188488	SP500	300	1786585800	7748.349552	7750.013943	7747.263518	7748.467697
188124	DXY	300	1786585200	99.941058	99.947302	99.910907	99.928382
187756	SP500	300	1786584600	7748.390777	7749.572328	7747.150731	7748.200925
187757	DOW	300	1786584600	53769.109889	53778.437358	53764.304227	53772.639650
187396	SP500	300	1786584000	7748.563554	7750.278930	7746.441518	7748.628969
187397	DOW	300	1786584000	53768.750872	53779.291433	53762.664727	53769.937784
187398	DXY	300	1786584000	99.941037	99.948279	99.924361	99.938796
187576	SP500	300	1786584300	7748.674787	7749.705451	7747.260779	7748.444624
187577	DOW	300	1786584300	53769.990657	53780.308291	53756.565605	53769.884431
187939	SP500	300	1786584900	7748.382672	7749.391427	7747.265138	7748.850260
187758	DXY	300	1786584600	99.933601	99.946641	99.923387	99.930585
187578	DXY	300	1786584300	99.940743	99.946198	99.914382	99.932687
187940	DOW	300	1786584900	53773.807852	53781.186834	53757.229009	53771.844636
187941	DXY	300	1786584900	99.928272	99.947090	99.918072	99.939050
188489	DOW	300	1786585800	53772.212553	53783.089657	53761.342254	53767.287190
188490	DXY	300	1786585800	99.938650	99.955159	99.924864	99.949837
188671	SP500	300	1786586100	7748.172787	7749.802983	7746.844160	7748.244230
188672	DOW	300	1786586100	53766.640096	53784.401160	53762.827392	53770.784942
188673	DXY	300	1786586100	99.951827	99.972452	99.941537	99.955310
188854	SP500	300	1786586400	7748.074407	7750.406226	7747.338039	7748.710576
188855	DOW	300	1786586400	53769.600116	53782.169230	53762.916186	53772.985181
189034	SP500	300	1786586700	7748.474040	7750.027737	7746.742865	7748.453681
189035	DOW	300	1786586700	53772.778543	53778.354577	53756.174880	53768.476425
192498	DXY	300	1786592400	100.010447	100.019002	99.992948	100.005513
193957	SP500	300	1786594800	7747.993325	7750.455374	7747.404539	7748.283375
193958	DOW	300	1786594800	53771.169010	53780.131440	53759.478797	53771.985030
193774	SP500	300	1786594500	7748.661331	7750.246400	7747.325896	7747.969895
193775	DOW	300	1786594500	53769.928163	53780.423465	53761.027340	53770.457066
190858	SP500	300	1786589700	7748.908805	7749.640987	7747.034191	7748.393774
190859	DOW	300	1786589700	53773.546407	53787.039693	53754.511258	53770.466771
190860	DXY	300	1786589700	100.007575	100.020436	99.997371	100.004024
189766	SP500	300	1786587900	7748.674744	7749.861079	7746.809968	7748.209971
189767	DOW	300	1786587900	53772.326819	53778.917446	53759.674352	53768.072269
189768	DXY	300	1786587900	99.989877	100.009125	99.980041	99.991337
189400	SP500	300	1786587300	7748.586963	7750.323481	7746.871862	7748.750698
189401	DOW	300	1786587300	53769.931601	53781.308301	53760.040667	53769.498596
189402	DXY	300	1786587300	99.971254	99.987881	99.961428	99.977766
192136	SP500	300	1786591800	7748.337698	7750.482687	7747.123608	7748.740065
192137	DOW	300	1786591800	53770.472316	53778.455577	53761.332832	53770.929531
191773	SP500	300	1786591200	7747.755016	7750.049173	7746.669279	7748.496179
191774	DOW	300	1786591200	53766.663560	53777.207337	53755.953144	53769.382169
191775	DXY	300	1786591200	99.991048	100.023754	99.988538	100.002500
191590	SP500	300	1786590900	7748.673208	7749.890127	7746.979278	7747.957314
191591	DOW	300	1786590900	53771.993038	53777.873617	53760.844130	53768.521396
191592	DXY	300	1786590900	100.003503	100.004660	99.981286	99.991499
190315	SP500	300	1786588800	7748.484698	7749.577199	7747.085575	7748.731270
190316	DOW	300	1786588800	53772.759514	53777.162568	53762.079481	53770.602197
190317	DXY	300	1786588800	100.003228	100.023719	99.990603	100.009245
190495	SP500	300	1786589100	7748.914605	7750.082215	7747.105754	7748.466521
190496	DOW	300	1786589100	53768.881421	53778.611459	53761.390011	53769.885108
190497	DXY	300	1786589100	100.008098	100.030128	99.999388	100.017625
190132	SP500	300	1786588500	7748.621595	7749.926042	7747.325639	7748.209328
190133	DOW	300	1786588500	53772.171901	53779.014126	53758.870696	53770.622910
190134	DXY	300	1786588500	99.996312	100.011401	99.989940	100.003315
189583	SP500	300	1786587600	7748.837770	7749.718888	7747.227937	7748.450288
189584	DOW	300	1786587600	53767.631567	53781.991563	53763.282474	53772.326076
189585	DXY	300	1786587600	99.977670	99.994529	99.969561	99.987959
189036	DXY	300	1786586700	99.975081	99.986367	99.965119	99.975252
192138	DXY	300	1786591800	100.020606	100.030858	100.004784	100.018095
193776	DXY	300	1786594500	100.006082	100.021046	100.000562	100.012453
193228	SP500	300	1786593600	7748.811469	7750.259694	7746.983378	7748.428308
193229	DOW	300	1786593600	53767.925961	53780.329137	53757.438596	53770.564289
191956	SP500	300	1786591500	7748.580617	7749.809571	7747.134088	7748.580164
189217	SP500	300	1786587000	7748.471993	7749.736751	7747.469020	7748.734167
189218	DOW	300	1786587000	53768.342442	53786.567407	53759.281108	53771.263945
189219	DXY	300	1786587000	99.973658	99.982396	99.960946	99.971387
189949	SP500	300	1786588200	7748.054810	7750.065469	7746.843725	7748.416015
189950	DOW	300	1786588200	53768.238054	53778.319765	53762.292251	53771.969202
189951	DXY	300	1786588200	99.992386	100.000608	99.977303	99.996969
191957	DOW	300	1786591500	53768.272757	53779.956366	53759.378543	53770.239479
191224	SP500	300	1786590300	7748.287324	7750.065717	7747.364924	7748.390232
191225	DOW	300	1786590300	53772.002682	53780.764876	53754.300007	53772.542943
191226	DXY	300	1786590300	100.006046	100.019377	99.991366	100.007887
190675	SP500	300	1786589400	7748.232272	7749.648409	7746.777913	7748.882133
190676	DOW	300	1786589400	53767.762067	53777.147351	53762.644764	53773.044259
190677	DXY	300	1786589400	100.018093	100.025686	99.999360	100.006013
191958	DXY	300	1786591500	100.003314	100.019589	99.999631	100.018851
191041	SP500	300	1786590000	7748.442206	7749.715761	7746.838940	7748.461122
191042	DOW	300	1786590000	53769.664191	53777.575842	53763.936436	53770.332757
191043	DXY	300	1786590000	100.005308	100.019629	99.994314	100.006010
193230	DXY	300	1786593600	100.008674	100.013759	99.988861	100.000328
192679	SP500	300	1786592700	7748.567073	7750.394363	7747.353106	7748.350742
191407	SP500	300	1786590600	7748.414356	7749.908821	7747.533198	7748.583642
191408	DOW	300	1786590600	53772.927900	53781.381902	53762.935083	53770.649272
191409	DXY	300	1786590600	100.006459	100.019779	99.996534	100.002450
192680	DOW	300	1786592700	53770.938831	53780.115533	53760.403312	53768.577346
192681	DXY	300	1786592700	100.004341	100.016767	99.994185	99.997693
192316	SP500	300	1786592100	7749.032966	7750.291522	7747.168180	7748.801548
192317	DOW	300	1786592100	53771.329204	53780.656669	53762.444008	53770.510140
192318	DXY	300	1786592100	100.017673	100.024098	99.998687	100.012935
192862	SP500	300	1786593000	7748.132376	7749.648359	7747.075692	7748.355196
192863	DOW	300	1786593000	53769.035685	53784.695779	53759.589134	53768.805510
192864	DXY	300	1786593000	99.999794	100.008680	99.989683	100.001388
193045	SP500	300	1786593300	7748.361723	7749.719435	7747.117970	7748.944349
192496	SP500	300	1786592400	7748.587528	7749.918361	7747.126540	7748.759658
192497	DOW	300	1786592400	53769.847965	53783.575024	53758.694884	53771.688685
193046	DOW	300	1786593300	53767.670546	53782.826549	53762.290166	53766.890371
193047	DXY	300	1786593300	100.003850	100.015919	99.982629	100.009388
193591	SP500	300	1786594200	7748.660607	7749.527372	7747.102764	7748.599629
193592	DOW	300	1786594200	53775.205413	53778.066585	53763.077825	53769.903867
193593	DXY	300	1786594200	99.998609	100.018981	99.997432	100.006442
193408	SP500	300	1786593900	7748.725585	7749.547944	7746.889717	7748.687368
193409	DOW	300	1786593900	53770.248386	53779.994316	53762.361915	53773.134212
193410	DXY	300	1786593900	100.000110	100.013580	99.994418	99.999263
193959	DXY	300	1786594800	100.010123	100.027667	100.002905	100.018412
194140	SP500	300	1786595100	7748.307133	7749.174912	7747.067597	7748.221230
194141	DOW	300	1786595100	53771.039450	53781.916718	53754.059373	53768.324801
194142	DXY	300	1786595100	100.019317	100.030134	100.000561	100.018093
194323	SP500	300	1786595400	7748.300991	7750.228387	7746.732448	7747.974180
194324	DOW	300	1786595400	53768.917450	53782.827670	53762.647125	53772.779708
194325	DXY	300	1786595400	100.018545	100.032413	100.008588	100.015758
194506	SP500	300	1786595700	7748.134585	7749.937141	7747.119020	7748.493445
195237	DXY	300	1786596900	100.011413	100.016431	99.975688	99.986741
194872	SP500	300	1786596300	7748.115926	7749.893630	7747.099763	7748.947017
194873	DOW	300	1786596300	53771.304984	53782.238774	53759.753848	53771.323157
194874	DXY	300	1786596300	100.009127	100.021362	100.002637	100.014048
196509	DXY	300	1786599000	99.966930	99.977595	99.956928	99.965196
198327	DXY	300	1786602000	99.997564	100.019924	99.986024	100.009621
199241	DOW	300	1786603500	53772.224377	53779.004565	53762.083733	53773.046576
198691	SP500	300	1786602600	7748.877635	7750.268195	7747.414611	7748.478250
197602	SP500	300	1786600800	7748.898694	7750.430946	7747.562210	7748.244193
197603	DOW	300	1786600800	53773.497092	53779.543381	53762.375283	53766.399777
197604	DXY	300	1786600800	99.982185	99.989007	99.961818	99.972476
196873	SP500	300	1786599600	7748.208720	7750.326653	7747.138977	7748.770671
196324	SP500	300	1786598700	7748.417129	7749.423156	7746.857255	7748.474244
196325	DOW	300	1786598700	53773.167230	53778.994706	53759.269292	53772.168998
196326	DXY	300	1786598700	99.967300	99.977987	99.952554	99.967186
196874	DOW	300	1786599600	53770.042402	53783.458779	53761.227911	53770.224065
196875	DXY	300	1786599600	99.963629	99.984278	99.955037	99.974775
197422	SP500	300	1786600500	7748.555957	7750.306886	7747.557719	7748.724675
194507	DOW	300	1786595700	53771.167004	53777.824945	53761.007532	53767.779079
194508	DXY	300	1786595700	100.018103	100.029279	100.001230	100.009360
197423	DOW	300	1786600500	53773.920504	53776.375518	53760.676847	53771.746097
195781	SP500	300	1786597800	7748.792511	7749.996514	7747.041504	7748.673141
195782	DOW	300	1786597800	53769.401449	53778.442852	53759.599447	53766.854223
195055	SP500	300	1786596600	7748.647706	7749.392684	7746.871338	7748.256986
195056	DOW	300	1786596600	53771.936658	53777.255533	53758.349118	53770.207269
195057	DXY	300	1786596600	100.011633	100.023732	100.000678	100.011305
195783	DXY	300	1786597800	99.957831	99.973672	99.947660	99.964277
195598	SP500	300	1786597500	7748.897250	7750.290939	7746.906959	7748.747433
195599	DOW	300	1786597500	53769.078568	53776.960974	53758.879178	53770.475118
195600	DXY	300	1786597500	99.984710	99.989855	99.942835	99.957753
194689	SP500	300	1786596000	7748.455946	7750.042848	7747.480160	7748.338426
194690	DOW	300	1786596000	53766.909218	53781.257444	53761.383129	53772.456190
194691	DXY	300	1786596000	100.010705	100.026309	100.001216	100.011396
197424	DXY	300	1786600500	99.977759	99.998437	99.970095	99.984449
195964	SP500	300	1786598100	7748.865783	7750.147268	7747.548797	7748.526765
195415	SP500	300	1786597200	7748.716461	7750.746633	7746.675285	7748.839234
195416	DOW	300	1786597200	53770.301107	53781.185529	53756.666304	53769.658636
195417	DXY	300	1786597200	99.986912	100.004082	99.974304	99.985730
195965	DOW	300	1786598100	53765.233463	53779.659850	53762.335758	53773.579079
195966	DXY	300	1786598100	99.964855	99.977274	99.952841	99.970232
198142	SP500	300	1786601700	7748.171991	7749.586675	7746.969852	7748.693715
197962	SP500	300	1786601400	7747.884409	7750.289742	7747.445545	7748.387603
197963	DOW	300	1786601400	53767.921173	53780.708386	53761.051483	53770.382916
197964	DXY	300	1786601400	99.966918	99.998379	99.949134	99.983557
195235	SP500	300	1786596900	7748.531424	7749.975586	7747.197493	7748.886382
195236	DOW	300	1786596900	53768.266787	53776.168114	53763.842285	53768.617608
198143	DOW	300	1786601700	53771.347901	53778.127017	53760.963954	53769.714846
196144	SP500	300	1786598400	7748.519089	7749.665471	7747.067825	7748.155428
196145	DOW	300	1786598400	53771.760790	53777.414280	53760.202788	53771.433931
196146	DXY	300	1786598400	99.969668	99.979079	99.956402	99.965860
198144	DXY	300	1786601700	99.985933	99.999384	99.974778	99.995739
198692	DOW	300	1786602600	53768.065331	53782.742837	53761.741439	53770.345613
198693	DXY	300	1786602600	100.004189	100.010838	99.982168	100.008090
197056	SP500	300	1786599900	7748.468723	7749.917460	7746.407856	7748.332909
197057	DOW	300	1786599900	53769.898461	53780.017093	53761.422234	53770.887920
197058	DXY	300	1786599900	99.972479	99.991996	99.961410	99.971776
196690	SP500	300	1786599300	7747.842807	7749.774321	7745.767083	7748.265136
196507	SP500	300	1786599000	7748.727024	7749.625940	7746.833568	7748.149033
196508	DOW	300	1786599000	53774.126158	53780.584908	53761.662252	53770.421523
196691	DOW	300	1786599300	53768.695749	53779.123889	53762.628822	53771.694910
196692	DXY	300	1786599300	99.967015	99.973561	99.949340	99.961498
197239	SP500	300	1786600200	7748.557858	7749.819574	7747.094764	7748.488842
197240	DOW	300	1786600200	53771.505577	53777.192224	53758.147092	53771.796211
197241	DXY	300	1786600200	99.973411	99.992450	99.965869	99.978948
197782	SP500	300	1786601100	7748.397608	7749.825282	7747.121937	7747.986879
197783	DOW	300	1786601100	53766.087328	53780.739349	53760.780506	53768.726296
197784	DXY	300	1786601100	99.972164	99.983423	99.952807	99.966910
199242	DXY	300	1786603500	100.080662	100.092552	100.045674	100.057318
199422	DXY	300	1786603800	100.057869	100.067420	100.044730	100.046796
198508	SP500	300	1786602300	7748.587486	7749.861204	7747.000423	7748.792796
198509	DOW	300	1786602300	53767.162429	53778.184051	53759.045515	53767.774135
198325	SP500	300	1786602000	7748.431952	7750.173567	7747.415627	7748.600504
198326	DOW	300	1786602000	53768.442193	53779.782516	53758.328720	53767.663512
198510	DXY	300	1786602300	100.010100	100.017686	99.984351	100.002057
199240	SP500	300	1786603500	7748.001583	7750.066492	7746.905054	7748.810269
198874	SP500	300	1786602900	7748.481749	7749.913226	7747.453777	7748.388276
198875	DOW	300	1786602900	53771.365025	53783.125916	53762.208001	53773.335566
198876	DXY	300	1786602900	100.010238	100.034404	99.995694	100.028352
199057	SP500	300	1786603200	7748.437072	7750.150079	7747.411729	7748.253873
199058	DOW	300	1786603200	53773.111500	53778.570465	53760.093735	53771.475772
199059	DXY	300	1786603200	100.028711	100.092838	100.026500	100.081381
199602	DXY	300	1786604100	100.044856	100.055727	100.030999	100.039363
199420	SP500	300	1786603800	7748.793649	7750.578747	7747.194970	7748.785787
199421	DOW	300	1786603800	53773.035748	53779.413471	53762.664050	53770.040611
199782	DXY	300	1786604400	100.038633	100.048747	100.020189	100.032191
199600	SP500	300	1786604100	7748.662675	7750.053058	7746.900399	7748.659042
199601	DOW	300	1786604100	53768.152518	53780.339711	53764.432824	53772.801774
199780	SP500	300	1786604400	7748.381813	7749.585076	7746.945939	7748.489467
199781	DOW	300	1786604400	53774.492421	53777.640518	53759.435978	53772.436401
203974	SP500	300	1786611300	7748.783583	7749.840112	7747.010068	7748.655507
203975	DOW	300	1786611300	53772.147420	53782.571102	53761.096840	53770.145690
203976	DXY	300	1786611300	99.969199	99.978569	99.951799	99.960288
203611	SP500	300	1786610700	7748.359188	7749.714495	7746.492554	7748.535638
201604	SP500	300	1786607400	7748.071308	7749.434705	7747.096488	7748.648928
201605	DOW	300	1786607400	53774.622700	53778.601298	53761.576108	53772.480598
201606	DXY	300	1786607400	99.998518	100.000919	99.969185	99.976284
203612	DOW	300	1786610700	53769.576328	53783.846728	53759.071910	53770.273954
203613	DXY	300	1786610700	99.979459	99.993132	99.965170	99.972344
199960	SP500	300	1786604700	7748.447395	7750.284861	7747.420318	7748.596679
199961	DOW	300	1786604700	53773.694022	53782.757326	53761.822209	53768.617853
199962	DXY	300	1786604700	100.030950	100.050997	100.022231	100.028356
203794	SP500	300	1786611000	7748.670457	7750.344775	7747.121922	7748.888557
203795	DOW	300	1786611000	53772.019344	53780.585127	53758.981915	53771.223191
203796	DXY	300	1786611000	99.971885	99.990305	99.955323	99.970528
202882	SP500	300	1786609500	7749.022548	7750.092521	7747.277767	7748.290346
200506	SP500	300	1786605600	7748.656530	7749.714421	7747.159526	7749.061829
200507	DOW	300	1786605600	53771.998874	53781.467307	53763.304290	53767.573228
200508	DXY	300	1786605600	100.023113	100.047089	100.007388	100.034969
202883	DOW	300	1786609500	53770.868317	53778.719128	53761.962427	53772.865734
202884	DXY	300	1786609500	99.976422	99.995843	99.972184	99.988221
201970	SP500	300	1786608000	7748.501617	7750.113844	7747.026314	7748.398683
201971	DOW	300	1786608000	53769.820513	53782.230723	53763.590016	53770.993179
201972	DXY	300	1786608000	99.981426	99.988873	99.956597	99.962443
200143	SP500	300	1786605000	7748.389331	7749.332383	7747.141181	7748.375013
200144	DOW	300	1786605000	53768.811326	53778.547792	53758.157177	53771.184181
200145	DXY	300	1786605000	100.027429	100.037114	100.007075	100.022286
201055	SP500	300	1786606500	7749.063393	7749.826812	7746.983070	7748.458594
201056	DOW	300	1786606500	53771.370122	53783.446776	53762.625197	53774.475310
201057	DXY	300	1786606500	100.013723	100.021137	99.993356	100.002599
201238	SP500	300	1786606800	7748.264506	7749.739208	7747.321710	7748.403273
201239	DOW	300	1786606800	53774.768168	53781.960124	53760.250757	53771.863465
201240	DXY	300	1786606800	100.004762	100.022499	99.993704	100.009215
200872	SP500	300	1786606200	7748.414805	7749.855464	7746.451899	7748.916853
200873	DOW	300	1786606200	53770.530053	53777.664922	53761.845472	53770.271099
200874	DXY	300	1786606200	100.024489	100.031130	100.003869	100.011242
203428	SP500	300	1786610400	7748.039443	7750.141921	7746.278940	7748.577146
202519	SP500	300	1786608900	7748.432428	7749.790553	7747.510602	7748.557742
202153	SP500	300	1786608300	7748.669907	7749.915330	7746.614708	7748.042202
202154	DOW	300	1786608300	53769.460487	53777.260312	53760.233986	53772.827942
200326	SP500	300	1786605300	7748.234762	7749.791500	7746.891917	7748.567711
200327	DOW	300	1786605300	53769.354419	53780.752622	53759.607551	53770.582343
200328	DXY	300	1786605300	100.021992	100.035407	100.009580	100.021025
202155	DXY	300	1786608300	99.960418	99.984647	99.950323	99.973144
201787	SP500	300	1786607700	7748.539901	7749.517162	7747.119779	7748.317894
201788	DOW	300	1786607700	53774.189835	53779.648466	53761.508447	53770.035243
201789	DXY	300	1786607700	99.975406	99.988651	99.957909	99.983828
201421	SP500	300	1786607100	7748.462903	7750.185503	7746.843177	7748.358047
201422	DOW	300	1786607100	53770.939957	53780.919127	53757.288517	53773.692475
200689	SP500	300	1786605900	7748.907626	7750.039539	7746.966037	7748.557346
200690	DOW	300	1786605900	53765.825876	53780.698934	53761.575466	53772.192899
200691	DXY	300	1786605900	100.034326	100.035715	100.013419	100.024851
201423	DXY	300	1786607100	100.008440	100.020334	99.987804	99.998888
202520	DOW	300	1786608900	53767.487721	53779.112535	53761.296630	53771.971436
202521	DXY	300	1786608900	99.992537	100.000895	99.975902	99.982791
203248	SP500	300	1786610100	7748.222179	7749.630318	7747.018667	7747.990833
203249	DOW	300	1786610100	53770.216845	53780.400975	53765.947212	53773.270055
203250	DXY	300	1786610100	99.994904	100.006574	99.971667	99.985776
202699	SP500	300	1786609200	7748.383718	7749.758897	7747.300844	7748.768574
202700	DOW	300	1786609200	53771.226884	53782.365644	53757.862147	53769.425922
202701	DXY	300	1786609200	99.980294	99.992458	99.970878	99.977991
202336	SP500	300	1786608600	7747.937059	7749.993318	7747.170703	7748.683594
202337	DOW	300	1786608600	53772.890446	53779.686301	53763.418440	53769.203482
202338	DXY	300	1786608600	99.972063	100.005047	99.962532	99.992704
203065	SP500	300	1786609800	7748.336732	7750.129512	7747.495978	7748.030311
203066	DOW	300	1786609800	53774.416645	53778.254802	53761.891013	53769.205991
203067	DXY	300	1786609800	99.989805	100.006233	99.976260	99.994833
203429	DOW	300	1786610400	53772.888697	53784.935442	53753.692735	53771.718997
203430	DXY	300	1786610400	99.983307	99.994405	99.970984	99.980846
204335	DOW	300	1786611900	53771.135850	53778.354314	53759.943118	53771.918277
204336	DXY	300	1786611900	99.978710	99.996763	99.972907	99.987469
204515	DOW	300	1786612200	53773.060785	53778.025777	53758.809976	53769.256355
204516	DXY	300	1786612200	99.987815	100.006000	99.979150	100.001349
204334	SP500	300	1786611900	7748.193693	7749.753317	7747.277493	7748.239881
204697	SP500	300	1786612500	7748.253949	7750.093225	7747.011324	7748.619527
204154	SP500	300	1786611600	7748.645070	7750.065256	7746.769608	7748.128465
204155	DOW	300	1786611600	53768.308878	53779.499804	53758.233498	53770.350361
204156	DXY	300	1786611600	99.959328	99.985377	99.956638	99.976905
204514	SP500	300	1786612200	7748.242870	7749.930285	7747.336143	7748.518333
204698	DOW	300	1786612500	53770.980622	53779.393025	53761.287996	53769.410415
204699	DXY	300	1786612500	99.999439	100.007370	99.972152	99.980947
204880	SP500	300	1786612800	7748.750931	7749.841221	7747.606452	7748.335992
204881	DOW	300	1786612800	53767.475426	53785.042646	53760.611396	53769.774478
204882	DXY	300	1786612800	99.980872	99.990468	99.954256	99.962497
205063	SP500	300	1786613100	7748.304077	7749.528758	7746.897662	7748.583808
205064	DOW	300	1786613100	53771.456366	53778.436736	53762.322030	53770.248655
205065	DXY	300	1786613100	99.960715	99.972080	99.942013	99.955428
205246	SP500	300	1786613400	7748.618897	7749.525627	7746.876075	7748.821814
205247	DOW	300	1786613400	53771.159936	53779.461108	53761.644909	53767.112430
210178	SP500	300	1786621500	7748.090781	7749.536784	7747.237742	7748.558514
208717	SP500	300	1786619100	7748.575696	7749.767579	7747.043219	7748.288755
208718	DOW	300	1786619100	53771.249065	53776.965621	53760.924206	53770.624770
208719	DXY	300	1786619100	99.895486	99.912735	99.882596	99.903045
207985	SP500	300	1786617900	7748.865310	7750.084557	7747.262559	7748.438629
207986	DOW	300	1786617900	53771.377103	53780.766300	53761.400489	53767.275071
205975	SP500	300	1786614600	7748.399495	7749.309464	7747.365200	7748.297986
205976	DOW	300	1786614600	53771.272248	53782.590909	53755.647655	53770.644610
205977	DXY	300	1786614600	99.921693	99.943476	99.913268	99.927505
207987	DXY	300	1786617900	99.877370	99.890894	99.865287	99.874822
207070	SP500	300	1786616400	7748.657893	7750.134179	7746.916885	7748.516866
207071	DOW	300	1786616400	53768.452207	53778.934551	53760.847050	53767.578374
205612	SP500	300	1786614000	7749.223204	7749.700710	7747.135110	7748.236974
205613	DOW	300	1786614000	53773.982387	53778.332628	53760.439989	53772.119424
205614	DXY	300	1786614000	99.932213	99.945789	99.920156	99.930498
207072	DXY	300	1786616400	99.900368	99.912606	99.888347	99.901163
210179	DOW	300	1786621500	53770.377795	53782.548641	53760.759742	53770.454629
209995	SP500	300	1786621200	7748.148585	7750.113172	7747.228820	7748.375523
209996	DOW	300	1786621200	53772.222822	53778.660428	53760.422156	53772.223386
207802	SP500	300	1786617600	7748.584544	7749.837712	7747.304161	7748.581960
207803	DOW	300	1786617600	53766.049330	53781.550983	53762.112883	53771.850239
207804	DXY	300	1786617600	99.883786	99.891923	99.861449	99.875496
206524	SP500	300	1786615500	7748.321141	7750.081651	7747.001578	7748.557322
206525	DOW	300	1786615500	53769.568762	53781.901233	53762.603264	53772.396637
206526	DXY	300	1786615500	99.925939	99.931268	99.893198	99.905393
208351	SP500	300	1786618500	7748.349980	7749.704642	7747.110785	7748.769388
206341	SP500	300	1786615200	7748.427101	7749.834640	7746.393726	7748.137232
206342	DOW	300	1786615200	53771.707487	53777.136194	53761.235381	53771.182566
206343	DXY	300	1786615200	99.931288	99.940845	99.914590	99.925300
205795	SP500	300	1786614300	7748.533825	7750.008705	7747.414473	7748.096982
205796	DOW	300	1786614300	53772.532138	53780.207915	53759.669737	53769.328216
205797	DXY	300	1786614300	99.929560	99.938302	99.912887	99.922339
205248	DXY	300	1786613400	99.955892	99.959007	99.937876	99.943734
206704	SP500	300	1786615800	7748.787906	7749.965439	7747.809362	7748.342899
206705	DOW	300	1786615800	53774.009854	53779.962486	53759.275096	53768.672387
206706	DXY	300	1786615800	99.907772	99.914166	99.893643	99.903752
208352	DOW	300	1786618500	53769.984573	53782.428901	53759.885495	53771.938853
208353	DXY	300	1786618500	99.885640	99.904784	99.879617	99.897395
206158	SP500	300	1786614900	7748.024033	7749.740782	7746.696667	7748.637739
206159	DOW	300	1786614900	53769.188114	53779.344743	53761.910877	53770.294864
206160	DXY	300	1786614900	99.929206	99.941193	99.914687	99.931108
205429	SP500	300	1786613700	7748.895330	7749.702350	7746.768118	7749.012529
205430	DOW	300	1786613700	53768.190905	53777.435385	53757.366213	53773.701309
205431	DXY	300	1786613700	99.943411	99.945594	99.924778	99.932067
208168	SP500	300	1786618200	7748.410410	7749.503854	7747.261193	7748.230135
208169	DOW	300	1786618200	53765.796790	53778.444779	53762.166277	53770.376219
208170	DXY	300	1786618200	99.875865	99.895955	99.867373	99.885755
207436	SP500	300	1786617000	7748.464118	7749.593410	7747.208821	7748.604796
207437	DOW	300	1786617000	53769.387923	53785.077258	53761.286007	53770.781814
207438	DXY	300	1786617000	99.895737	99.903912	99.875672	99.895038
206887	SP500	300	1786616100	7748.344011	7749.762079	7746.899813	7748.399404
206888	DOW	300	1786616100	53766.581590	53780.118022	53761.025577	53769.526794
206889	DXY	300	1786616100	99.905267	99.911358	99.884815	99.899374
207253	SP500	300	1786616700	7748.711058	7749.928611	7747.185606	7748.655502
207254	DOW	300	1786616700	53767.421997	53782.335649	53760.399384	53770.532661
207255	DXY	300	1786616700	99.898984	99.912644	99.886588	99.894847
209997	DXY	300	1786621200	99.889988	99.905612	99.877382	99.888677
209812	SP500	300	1786620900	7748.298495	7750.063462	7746.345187	7748.418675
209813	DOW	300	1786620900	53768.405331	53776.788295	53756.431743	53771.085967
209814	DXY	300	1786620900	99.888239	99.896284	99.871210	99.887794
209266	SP500	300	1786620000	7748.451231	7749.528980	7746.326096	7748.426640
207619	SP500	300	1786617300	7748.603556	7750.810459	7746.984098	7748.541608
207620	DOW	300	1786617300	53770.042733	53781.490942	53760.070097	53767.291303
207621	DXY	300	1786617300	99.896930	99.903980	99.869163	99.885743
209267	DOW	300	1786620000	53771.215723	53783.300335	53763.343594	53769.513308
209268	DXY	300	1786620000	99.898661	99.899877	99.870230	99.878912
208900	SP500	300	1786619400	7748.188152	7749.875495	7746.811357	7748.671694
208901	DOW	300	1786619400	53772.607018	53779.971274	53761.101063	53767.604308
208902	DXY	300	1786619400	99.903069	99.921984	99.887204	99.908522
208534	SP500	300	1786618800	7748.960275	7750.446572	7746.521382	7748.804021
208535	DOW	300	1786618800	53770.930701	53776.950004	53763.193034	53770.385877
208536	DXY	300	1786618800	99.896351	99.908685	99.886309	99.896306
209083	SP500	300	1786619700	7748.499731	7750.405547	7747.685846	7748.435561
209084	DOW	300	1786619700	53765.517530	53780.330306	53759.190261	53770.466583
209085	DXY	300	1786619700	99.906240	99.916557	99.890556	99.897463
209446	SP500	300	1786620300	7748.319121	7750.264653	7747.437001	7748.625816
209447	DOW	300	1786620300	53769.562828	53778.788809	53761.656339	53767.285846
209448	DXY	300	1786620300	99.878049	99.908772	99.874556	99.891510
209629	SP500	300	1786620600	7748.579136	7750.121270	7746.703752	7748.544049
209630	DOW	300	1786620600	53768.377771	53777.692371	53760.112401	53768.392983
209631	DXY	300	1786620600	99.892869	99.901317	99.865378	99.887906
210180	DXY	300	1786621500	99.888506	99.903426	99.881022	99.890264
210361	SP500	300	1786621800	7748.263644	7749.599580	7747.334924	7748.736889
210362	DOW	300	1786621800	53769.167314	53777.904478	53761.656274	53772.158902
210363	DXY	300	1786621800	99.888979	99.905687	99.886143	99.894469
210544	SP500	300	1786622100	7748.749663	7749.482589	7747.059714	7748.212181
210545	DOW	300	1786622100	53772.043245	53777.932842	53760.573047	53770.361845
210546	DXY	300	1786622100	99.892227	99.910813	99.886884	99.893553
210727	SP500	300	1786622400	7748.149456	7749.992967	7746.990183	7748.662821
215094	DXY	300	1786629600	99.916602	99.928829	99.883347	99.900474
212920	SP500	300	1786626000	7748.618382	7749.581770	7746.427712	7748.480511
212921	DOW	300	1786626000	53769.950502	53778.599392	53760.228036	53770.872629
211093	SP500	300	1786623000	7748.674967	7749.876120	7746.787943	7748.627294
211094	DOW	300	1786623000	53768.958545	53780.890248	53759.579197	53768.812810
211095	DXY	300	1786623000	99.919429	99.937052	99.900408	99.922305
211459	SP500	300	1786623600	7748.624618	7750.184008	7746.887900	7748.596430
211460	DOW	300	1786623600	53769.054463	53779.306253	53760.293001	53768.430262
211461	DXY	300	1786623600	99.918571	99.934429	99.907311	99.928163
212922	DXY	300	1786626000	99.865735	99.897665	99.847598	99.883413
212737	SP500	300	1786625700	7748.657553	7749.904216	7746.412978	7748.313578
212738	DOW	300	1786625700	53771.106716	53777.260069	53758.682544	53770.213641
212739	DXY	300	1786625700	99.914250	99.926551	99.856508	99.864978
214372	SP500	300	1786628400	7786.495010	7786.897287	7779.528207	7779.714984
214373	DOW	300	1786628400	53922.659920	53947.509684	53894.200000	53896.343225
214374	DXY	300	1786628400	99.877528	99.908383	99.876227	99.901672
213832	SP500	300	1786627500	7748.175234	7749.598719	7747.364006	7748.464504
213833	DOW	300	1786627500	53767.498065	53780.398815	53761.539820	53770.114390
213834	DXY	300	1786627500	99.844556	99.851256	99.829000	99.842218
212554	SP500	300	1786625400	7748.401940	7749.889937	7746.779316	7748.524711
212555	DOW	300	1786625400	53769.691995	53780.537208	53759.390610	53769.357564
212556	DXY	300	1786625400	99.924801	99.937204	99.902325	99.915274
210728	DOW	300	1786622400	53771.410522	53781.560759	53761.545302	53768.901719
210729	DXY	300	1786622400	99.894059	99.915514	99.881000	99.905777
213652	SP500	300	1786627200	7748.716472	7750.040612	7747.145318	7748.251619
213653	DOW	300	1786627200	53770.532819	53779.892133	53762.048855	53768.560283
213654	DXY	300	1786627200	99.838828	99.859983	99.830202	99.842294
211276	SP500	300	1786623300	7748.464859	7749.457891	7747.171036	7748.749052
211277	DOW	300	1786623300	53768.215791	53780.075857	53761.308573	53770.343194
211278	DXY	300	1786623300	99.923487	99.933483	99.906071	99.918590
213103	SP500	300	1786626300	7748.427931	7749.826048	7747.545527	7748.125104
212005	SP500	300	1786624500	7748.329695	7749.809073	7747.183646	7748.448326
212006	DOW	300	1786624500	53772.664888	53779.635931	53760.326559	53770.431946
212007	DXY	300	1786624500	99.940564	99.955538	99.922956	99.922956
211822	SP500	300	1786624200	7748.678327	7749.725431	7747.503748	7748.419468
211823	DOW	300	1786624200	53769.032450	53777.237054	53759.227756	53771.669549
211824	DXY	300	1786624200	99.936936	99.952630	99.926321	99.942425
210910	SP500	300	1786622700	7748.959207	7750.071262	7747.212346	7748.593941
210911	DOW	300	1786622700	53768.711203	53777.988367	53760.506868	53768.126230
210912	DXY	300	1786622700	99.905693	99.930953	99.905693	99.920828
213104	DOW	300	1786626300	53769.679143	53779.809153	53761.608104	53769.823740
213105	DXY	300	1786626300	99.882230	99.891856	99.807338	99.813051
211642	SP500	300	1786623900	7748.644679	7749.872278	7747.191885	7748.370263
211643	DOW	300	1786623900	53766.900608	53780.457318	53759.512534	53770.655981
211644	DXY	300	1786623900	99.928961	99.953978	99.915778	99.938657
212188	SP500	300	1786624800	7748.450361	7750.273899	7746.920804	7748.644929
212189	DOW	300	1786624800	53769.882025	53779.819127	53761.675683	53771.808251
212190	DXY	300	1786624800	99.922490	99.982514	99.907835	99.937281
214192	SP500	300	1786628100	7776.537313	7787.030000	7776.145130	7786.775200
214193	DOW	300	1786628100	53874.360173	53923.040000	53837.726176	53921.871397
214194	DXY	300	1786628100	99.861315	99.890759	99.853757	99.879573
215274	DXY	300	1786629900	99.901469	99.917004	99.888728	99.906486
214732	SP500	300	1786629000	7793.190450	7794.510833	7789.818583	7794.144742
214733	DOW	300	1786629000	53890.736268	53893.715424	53833.156924	53883.138713
212371	SP500	300	1786625100	7748.775161	7749.480974	7747.359762	7748.697572
212372	DOW	300	1786625100	53771.975180	53780.355218	53765.071256	53770.572390
212373	DXY	300	1786625100	99.939749	99.951263	99.918403	99.926540
214734	DXY	300	1786629000	99.896610	99.916819	99.885219	99.894624
213469	SP500	300	1786626900	7748.674013	7749.954486	7746.926244	7748.779148
213470	DOW	300	1786626900	53769.872876	53779.456843	53760.962212	53769.794534
213286	SP500	300	1786626600	7748.120497	7749.641194	7747.173989	7748.567022
213287	DOW	300	1786626600	53767.796015	53777.692461	53756.878536	53771.808068
213471	DXY	300	1786626900	99.820497	99.847945	99.810857	99.839729
213288	DXY	300	1786626600	99.814231	99.845996	99.800130	99.819401
214012	SP500	300	1786627800	7748.255663	7777.632211	7748.107670	7776.355391
214013	DOW	300	1786627800	53770.116649	53967.209240	53768.461335	53872.315680
214014	DXY	300	1786627800	99.844631	99.863335	99.818903	99.863335
214552	SP500	300	1786628700	7779.715651	7793.363389	7779.343931	7792.906549
214553	DOW	300	1786628700	53896.964831	53964.896221	53887.940000	53892.788984
214554	DXY	300	1786628700	99.902460	99.929649	99.892876	99.896013
214912	SP500	300	1786629300	7794.192778	7800.064405	7792.249411	7799.304967
214913	DOW	300	1786629300	53884.509537	53913.733878	53860.267752	53893.371628
214914	DXY	300	1786629300	99.892451	99.915993	99.883285	99.914176
215457	DXY	300	1786630200	99.908920	99.926606	99.875393	99.907749
215092	SP500	300	1786629600	7798.993549	7806.561418	7797.439472	7805.022261
215093	DOW	300	1786629600	53893.817854	53989.958881	53891.087466	53988.265457
215637	DXY	300	1786630500	99.907817	99.916668	99.863511	99.876496
215272	SP500	300	1786629900	7804.758549	7806.996735	7802.006420	7805.373741
215273	DOW	300	1786629900	53990.016387	54000.269888	53943.079693	53966.525381
215456	DOW	300	1786630200	53965.120090	53974.315327	53943.171733	53967.056872
215455	SP500	300	1786630200	7805.388765	7809.989406	7804.099265	7808.485928
215635	SP500	300	1786630500	7808.577543	7810.115308	7802.907814	7808.914086
215636	DOW	300	1786630500	53968.389218	53989.081168	53923.562602	53989.081168
215815	SP500	300	1786630800	7809.102158	7815.168281	7807.039119	7813.174263
215816	DOW	300	1786630800	53987.714433	54049.426513	53977.671532	54033.411808
215817	DXY	300	1786630800	99.878096	99.881449	99.828634	99.835966
215998	SP500	300	1786631100	7813.356653	7815.817412	7811.497341	7815.457065
215999	DOW	300	1786631100	54032.325244	54047.567206	54013.900000	54015.736029
216000	DXY	300	1786631100	99.837222	99.839134	99.792120	99.798337
220192	SP500	300	1786638000	7781.540036	7784.266815	7780.218732	7783.675833
217822	SP500	300	1786634100	7794.484523	7795.568969	7789.020732	7794.734096
217823	DOW	300	1786634100	53746.491557	53750.922051	53696.297332	53732.452752
217824	DXY	300	1786634100	99.828906	99.850573	99.812654	99.842546
219826	SP500	300	1786637400	7782.895157	7785.000860	7779.529141	7779.729576
219827	DOW	300	1786637400	53667.879253	53687.316214	53664.764705	53670.694473
219828	DXY	300	1786637400	99.934007	99.944937	99.914859	99.924979
216181	SP500	300	1786631400	7815.675375	7817.007922	7812.876641	7815.459888
216182	DOW	300	1786631400	54014.410067	54014.410067	53956.938181	53962.286843
216183	DXY	300	1786631400	99.796626	99.840092	99.794340	99.822858
220193	DOW	300	1786638000	53680.454478	53699.273393	53669.766176	53678.959436
219094	SP500	300	1786636200	7782.085616	7782.657008	7778.414730	7779.368851
219095	DOW	300	1786636200	53708.109858	53722.287489	53691.912663	53696.230078
219096	DXY	300	1786636200	99.895649	99.919693	99.884951	99.913112
216727	SP500	300	1786632300	7808.883105	7810.278179	7799.139750	7799.435665
216728	DOW	300	1786632300	53913.583789	53919.006685	53840.315339	53848.320670
216729	DXY	300	1786632300	99.848686	99.880990	99.838998	99.851307
220194	DXY	300	1786638000	99.929317	99.963946	99.929317	99.955803
218371	SP500	300	1786635000	7784.495681	7785.290992	7780.110000	7780.348607
218188	SP500	300	1786634700	7792.612377	7793.070683	7781.219659	7784.601364
218189	DOW	300	1786634700	53710.996634	53711.585616	53622.945108	53646.359347
218190	DXY	300	1786634700	99.875847	99.910005	99.871119	99.904435
216364	SP500	300	1786631700	7815.616910	7817.475972	7811.130455	7813.740664
216365	DOW	300	1786631700	53964.232607	53990.213573	53941.560670	53963.332872
216366	DXY	300	1786631700	99.825031	99.851618	99.825031	99.851618
217273	SP500	300	1786633200	7801.007773	7806.617799	7796.960739	7796.960739
217274	DOW	300	1786633200	53850.549907	53874.269522	53804.144745	53812.319044
217275	DXY	300	1786633200	99.860020	99.867856	99.822218	99.843024
217456	SP500	300	1786633500	7797.065863	7800.087630	7793.608243	7796.004958
217457	DOW	300	1786633500	53814.230722	53820.489382	53781.604814	53792.178442
217458	DXY	300	1786633500	99.842132	99.854541	99.812947	99.828508
217090	SP500	300	1786632900	7800.132094	7803.328925	7797.099224	7800.773036
217091	DOW	300	1786632900	53849.901094	53851.566972	53803.405273	53851.566972
217092	DXY	300	1786632900	99.846512	99.872609	99.836371	99.861070
218372	DOW	300	1786635000	53647.139201	53694.461560	53642.348850	53674.057354
218373	DXY	300	1786635000	99.906181	99.914655	99.879086	99.879086
218731	SP500	300	1786635600	7782.207680	7786.262929	7779.702217	7783.368178
218005	SP500	300	1786634400	7794.503165	7796.803238	7791.701619	7792.597660
216547	SP500	300	1786632000	7813.850800	7815.823200	7808.880000	7808.908162
216548	DOW	300	1786632000	53962.941103	53972.315209	53913.130000	53914.102319
216549	DXY	300	1786632000	99.853177	99.866526	99.828891	99.848873
218006	DOW	300	1786634400	53734.581265	53742.361503	53698.245313	53709.752847
218007	DXY	300	1786634400	99.841593	99.883189	99.833508	99.878317
217639	SP500	300	1786633800	7795.917325	7797.255874	7793.444408	7794.525433
217640	DOW	300	1786633800	53793.184689	53796.291128	53742.020000	53745.434755
216907	SP500	300	1786632600	7799.697532	7802.270857	7798.897475	7800.426664
216908	DOW	300	1786632600	53849.749035	53869.388220	53828.582046	53848.084833
216909	DXY	300	1786632600	99.851418	99.857570	99.833849	99.846367
217641	DXY	300	1786633800	99.826541	99.840181	99.809936	99.826886
218732	DOW	300	1786635600	53695.075980	53709.907695	53675.798036	53694.776698
218733	DXY	300	1786635600	99.905779	99.922101	99.893589	99.917623
219643	SP500	300	1786637100	7781.378151	7785.595234	7780.437556	7782.622201
219460	SP500	300	1786636800	7777.682878	7783.938663	7777.679837	7781.544684
219461	DOW	300	1786636800	53661.820718	53694.118316	53655.821293	53679.123549
218911	SP500	300	1786635900	7783.112078	7784.135427	7780.552249	7782.372222
218912	DOW	300	1786635900	53696.663059	53719.789386	53684.022272	53706.907965
218551	SP500	300	1786635300	7780.125623	7784.476929	7779.105487	7782.176798
218552	DOW	300	1786635300	53672.913992	53699.645603	53666.035546	53694.444774
218553	DXY	300	1786635300	99.879350	99.922198	99.869055	99.908221
218913	DXY	300	1786635900	99.918556	99.931290	99.889994	99.897318
219277	SP500	300	1786636500	7779.143502	7782.919281	7776.693688	7777.390104
219278	DOW	300	1786636500	53696.337746	53703.698568	53659.220000	53661.188064
219279	DXY	300	1786636500	99.915041	99.922686	99.889856	99.906375
219462	DXY	300	1786636800	99.906712	99.938430	99.904977	99.926069
219644	DOW	300	1786637100	53680.706012	53710.801718	53667.730000	53667.860283
219645	DXY	300	1786637100	99.925688	99.938327	99.914239	99.932279
220009	SP500	300	1786637700	7780.012732	7782.075522	7778.470617	7781.284374
220010	DOW	300	1786637700	53672.524107	53689.277056	53661.026722	53680.835014
220011	DXY	300	1786637700	99.925334	99.936440	99.908656	99.930958
220553	DOW	300	1786638600	53713.161642	53740.110000	53705.120377	53737.998832
220554	DXY	300	1786638600	99.973899	99.992569	99.966885	99.966885
220732	SP500	300	1786638900	7789.969118	7791.353991	7784.853623	7785.537337
220914	DXY	300	1786639200	99.969201	99.985777	99.960790	99.962765
220552	SP500	300	1786638600	7787.636614	7790.289241	7786.693503	7789.671397
220733	DOW	300	1786638900	53736.112493	53743.012658	53715.765338	53715.765338
220734	DXY	300	1786638900	99.968664	99.980052	99.950764	99.970081
220372	SP500	300	1786638300	7783.737355	7788.659042	7783.368070	7787.442536
220373	DOW	300	1786638300	53679.448801	53715.504461	53678.381354	53714.049358
220374	DXY	300	1786638300	99.957659	99.976865	99.945327	99.976272
221094	DXY	300	1786639500	99.963150	99.976587	99.950800	99.958834
220912	SP500	300	1786639200	7785.503408	7788.607100	7784.215358	7787.619605
220913	DOW	300	1786639200	53713.795125	53730.741452	53706.417964	53723.750180
221274	DXY	300	1786639800	99.958996	99.976188	99.937453	99.957412
221092	SP500	300	1786639500	7787.357046	7789.587322	7785.809602	7788.135331
221093	DOW	300	1786639500	53725.617473	53730.417545	53706.174217	53716.383651
221453	DOW	300	1786640100	53728.377847	53734.980611	53719.309412	53723.003983
221272	SP500	300	1786639800	7788.400302	7790.321665	7787.241690	7789.519273
221273	DOW	300	1786639800	53718.481552	53739.383189	53714.942304	53729.262122
221452	SP500	300	1786640100	7789.535468	7790.775886	7787.939725	7790.109995
225454	SP500	300	1786646700	7799.450627	7801.407877	7798.576820	7801.048564
224179	SP500	300	1786644600	7790.911725	7794.402006	7790.156730	7793.464088
224180	DOW	300	1786644600	53766.195900	53794.561025	53758.026636	53792.425291
224181	DXY	300	1786644600	99.969544	99.985232	99.963903	99.983169
223273	SP500	300	1786643100	7789.233044	7793.333733	7789.009793	7791.078425
223274	DOW	300	1786643100	53729.557859	53758.202718	53721.960766	53738.298860
223275	DXY	300	1786643100	99.974662	99.987697	99.959257	99.964603
222178	SP500	300	1786641300	7794.352845	7797.221049	7793.956832	7796.222576
222179	DOW	300	1786641300	53747.329604	53776.733517	53743.899852	53762.688718
222180	DXY	300	1786641300	99.961578	99.973328	99.946809	99.967514
221812	SP500	300	1786640700	7792.714520	7796.603098	7791.299576	7794.877304
221813	DOW	300	1786640700	53728.149039	53758.776587	53720.809701	53744.951420
221814	DXY	300	1786640700	99.946219	99.958372	99.936804	99.949898
225455	DOW	300	1786646700	53821.681482	53827.542896	53783.134743	53806.998103
223999	SP500	300	1786644300	7791.812205	7793.350380	7789.881728	7790.904361
224000	DOW	300	1786644300	53769.492112	53778.345710	53757.989118	53766.231230
224001	DXY	300	1786644300	99.960348	99.977365	99.948008	99.969646
225456	DXY	300	1786646700	99.964204	99.971201	99.940415	99.949220
225274	SP500	300	1786646400	7796.766172	7801.258299	7795.803569	7799.621803
225275	DOW	300	1786646400	53805.285144	53831.833900	53791.379077	53821.155531
224545	SP500	300	1786645200	7792.156972	7793.524540	7788.785322	7790.073320
224546	DOW	300	1786645200	53769.853609	53776.962827	53750.190145	53753.422395
224547	DXY	300	1786645200	99.968271	99.977114	99.929859	99.939747
222727	SP500	300	1786642200	7794.179901	7797.112927	7791.066883	7792.515202
222728	DOW	300	1786642200	53747.325369	53754.924598	53722.253122	53731.133788
222729	DXY	300	1786642200	99.968428	99.986462	99.952548	99.971137
222910	SP500	300	1786642500	7792.824104	7792.824104	7788.976146	7790.779140
222911	DOW	300	1786642500	53732.352730	53736.468887	53707.474973	53726.056544
222544	SP500	300	1786641900	7795.480535	7796.466765	7793.901676	7794.090808
222545	DOW	300	1786641900	53761.360072	53771.334320	53745.050936	53748.144724
222546	DXY	300	1786641900	99.968388	99.976276	99.941107	99.969085
221995	SP500	300	1786641000	7794.831672	7796.969710	7792.211397	7794.286037
221996	DOW	300	1786641000	53744.674035	53757.270659	53724.436585	53746.620460
221997	DXY	300	1786641000	99.952150	99.971748	99.926185	99.963734
221454	DXY	300	1786640100	99.957266	99.968938	99.944066	99.952685
222912	DXY	300	1786642500	99.973126	99.986355	99.958541	99.981994
224362	SP500	300	1786644900	7793.435438	7794.950278	7790.645855	7792.227026
224363	DOW	300	1786644900	53794.348923	53802.182964	53758.676383	53770.871349
224364	DXY	300	1786644900	99.983744	99.988845	99.959850	99.966558
223639	SP500	300	1786643700	7790.883107	7793.052778	7788.952805	7790.054718
221632	SP500	300	1786640400	7790.219321	7793.779877	7788.707083	7792.877435
221633	DOW	300	1786640400	53721.210758	53743.850659	53718.455201	53729.979930
221634	DXY	300	1786640400	99.952126	99.959158	99.932839	99.947465
222361	SP500	300	1786641600	7796.058022	7798.159162	7794.033107	7795.579033
222362	DOW	300	1786641600	53763.754741	53771.270073	53745.486113	53762.015592
222363	DXY	300	1786641600	99.968316	99.972541	99.948752	99.967177
223640	DOW	300	1786643700	53748.599586	53757.900684	53733.344351	53742.810815
223641	DXY	300	1786643700	99.957805	99.974620	99.953621	99.961202
223090	SP500	300	1786642800	7791.010441	7793.750547	7789.441284	7789.441284
223091	DOW	300	1786642800	53726.432768	53750.584189	53720.129733	53730.745618
223092	DXY	300	1786642800	99.980435	99.995841	99.974432	99.976554
225276	DXY	300	1786646400	99.957094	99.974604	99.948017	99.964219
223456	SP500	300	1786643400	7791.338137	7792.831298	7789.441175	7790.622708
223457	DOW	300	1786643400	53738.749333	53763.669644	53736.840561	53748.843533
223458	DXY	300	1786643400	99.965645	99.976294	99.949714	99.959318
225094	SP500	300	1786646100	7795.500138	7798.076638	7794.400927	7796.556868
223819	SP500	300	1786644000	7790.087892	7792.983095	7789.608623	7791.742950
223820	DOW	300	1786644000	53742.850822	53778.111688	53738.602927	53767.594071
223821	DXY	300	1786644000	99.963071	99.977581	99.957262	99.958569
225095	DOW	300	1786646100	53774.771283	53805.620000	53773.145219	53805.141474
225096	DXY	300	1786646100	99.959512	99.971468	99.947733	99.958268
224728	SP500	300	1786645500	7790.037655	7793.989439	7789.356953	7792.491203
224729	DOW	300	1786645500	53752.394110	53771.229334	53746.287077	53761.262276
224730	DXY	300	1786645500	99.941833	99.958290	99.934461	99.950580
225994	SP500	300	1786647600	7800.121586	7803.433088	7799.228711	7802.104511
225995	DOW	300	1786647600	53778.048679	53802.838569	53766.566006	53791.306657
225996	DXY	300	1786647600	99.955416	99.967330	99.948271	99.958220
225814	SP500	300	1786647300	7802.082077	7803.204740	7799.173214	7799.966803
225815	DOW	300	1786647300	53807.716547	53814.265230	53768.698362	53776.703912
225816	DXY	300	1786647300	99.951475	99.974905	99.947831	99.954636
226540	SP500	300	1786648500	7801.971175	7804.223593	7800.243198	7804.223593
224911	SP500	300	1786645800	7792.508103	7796.128245	7792.100736	7795.200000
224912	DOW	300	1786645800	53759.368949	53776.440678	53756.005621	53773.360000
224913	DXY	300	1786645800	99.952630	99.975024	99.943108	99.961000
226357	SP500	300	1786648200	7806.206007	7806.694384	7800.433553	7802.030333
226358	DOW	300	1786648200	53811.574245	53818.794596	53780.565971	53794.162188
225634	SP500	300	1786647000	7800.793543	7802.890720	7799.148292	7801.822739
225635	DOW	300	1786647000	53807.176509	53823.251322	53787.826923	53806.130566
225636	DXY	300	1786647000	99.951661	99.970430	99.940362	99.953399
226174	SP500	300	1786647900	7802.212637	7807.208827	7800.957460	7805.997383
226175	DOW	300	1786647900	53790.328381	53818.186712	53778.502038	53810.278376
226176	DXY	300	1786647900	99.956544	99.969977	99.946806	99.963276
226359	DXY	300	1786648200	99.962260	99.971065	99.946034	99.958845
226541	DOW	300	1786648500	53794.609240	53830.717705	53787.977997	53822.536411
226542	DXY	300	1786648500	99.958995	99.970077	99.951167	99.957934
226714	SP500	300	1786648800	7804.022197	7806.944511	7803.326141	7805.245018
226715	DOW	300	1786648800	53824.290911	53847.200014	53819.652541	53846.973838
226716	DXY	300	1786648800	99.958756	99.966394	99.947732	99.953333
226897	SP500	300	1786649100	7805.385438	7806.227945	7801.710332	7802.678787
227262	DXY	300	1786649700	99.945035	99.961975	99.933030	99.946738
227625	DXY	300	1786650300	99.950269	99.968719	99.937951	99.951513
228902	DOW	300	1786652400	53840.150429	53846.875565	53832.387968	53838.770429
228903	DXY	300	1786652400	99.975517	99.989650	99.960149	99.971925
229083	DXY	300	1786652700	99.970489	99.989239	99.959980	99.979190
231096	DXY	300	1786656000	99.967011	99.983740	99.954857	99.971777
230179	SP500	300	1786654500	7798.947232	7800.589997	7797.604685	7799.196247
230180	DOW	300	1786654500	53837.069789	53848.241636	53829.143573	53840.347815
230181	DXY	300	1786654500	99.972430	99.978122	99.954457	99.964562
228721	SP500	300	1786652100	7798.823237	7800.424665	7798.311391	7799.164159
228722	DOW	300	1786652100	53838.668143	53849.686578	53829.982618	53839.180131
228723	DXY	300	1786652100	99.961283	99.984853	99.956329	99.973720
229264	SP500	300	1786653000	7799.396309	7800.023896	7797.636163	7798.978194
227440	SP500	300	1786650000	7801.712503	7803.912331	7799.263032	7799.263032
227441	DOW	300	1786650000	53829.626188	53842.154447	53817.970950	53818.363415
226898	DOW	300	1786649100	53846.507273	53850.953561	53818.804828	53829.579400
226899	DXY	300	1786649100	99.954836	99.969145	99.942694	99.945901
227442	DXY	300	1786650000	99.944930	99.963460	99.936550	99.950616
229265	DOW	300	1786653000	53842.071683	53849.910786	53831.957269	53840.978576
229266	DXY	300	1786653000	99.977208	99.990517	99.968457	99.977533
228172	SP500	300	1786651200	7799.960925	7800.558278	7797.760637	7799.153417
228173	DOW	300	1786651200	53833.248450	53853.872017	53826.435052	53842.188459
228174	DXY	300	1786651200	99.969184	99.983032	99.955641	99.961922
227989	SP500	300	1786650900	7798.489755	7801.262159	7795.635028	7799.664838
227990	DOW	300	1786650900	53825.789739	53852.650353	53820.464082	53834.501244
227991	DXY	300	1786650900	99.971215	99.981043	99.959414	99.971370
227080	SP500	300	1786649400	7802.691572	7805.924584	7801.586564	7802.459260
227081	DOW	300	1786649400	53830.207819	53851.966021	53826.862975	53839.933009
227082	DXY	300	1786649400	99.944044	99.954004	99.934312	99.945821
227806	SP500	300	1786650600	7800.377018	7800.601659	7795.560683	7798.461722
227807	DOW	300	1786650600	53832.682754	53833.426809	53803.869019	53825.192328
227808	DXY	300	1786650600	99.953758	99.974806	99.946499	99.972079
231645	DXY	300	1786656900	99.963692	99.970571	99.944875	99.957363
230911	SP500	300	1786655700	7798.449816	7800.523172	7797.621358	7799.156449
229813	SP500	300	1786653900	7798.674751	7800.339631	7797.328542	7799.261641
228355	SP500	300	1786651500	7799.299210	7800.098855	7797.340649	7798.791871
228356	DOW	300	1786651500	53841.208130	53851.361888	53829.644052	53840.984176
228357	DXY	300	1786651500	99.964142	99.972848	99.951186	99.958048
229814	DOW	300	1786653900	53839.988582	53847.376876	53830.278681	53841.208934
229815	DXY	300	1786653900	99.969231	99.979011	99.955863	99.971395
227260	SP500	300	1786649700	7802.192558	7803.668909	7799.373106	7801.691617
227261	DOW	300	1786649700	53840.825603	53841.293730	53814.358625	53828.756874
229996	SP500	300	1786654200	7798.956811	7800.322755	7797.519201	7799.166434
227623	SP500	300	1786650300	7799.163169	7800.959516	7798.217568	7800.453765
227624	DOW	300	1786650300	53817.931304	53843.323154	53806.006715	53830.971874
229997	DOW	300	1786654200	53841.212282	53849.157143	53828.102627	53839.054832
229998	DXY	300	1786654200	99.973622	99.982286	99.963651	99.973855
230912	DOW	300	1786655700	53838.319809	53851.471603	53832.104776	53841.236977
230728	SP500	300	1786655400	7798.951861	7800.465714	7797.577269	7798.746959
230729	DOW	300	1786655400	53843.415564	53849.455176	53830.617627	53838.069637
230730	DXY	300	1786655400	99.960308	99.972761	99.952388	99.957039
228538	SP500	300	1786651800	7799.007898	7800.444153	7797.971171	7798.920113
228539	DOW	300	1786651800	53841.652542	53848.317900	53826.633826	53838.917834
228540	DXY	300	1786651800	99.959486	99.971277	99.949472	99.959597
230913	DXY	300	1786655700	99.955724	99.975112	99.946941	99.966910
229630	SP500	300	1786653600	7798.868231	7800.778821	7797.718869	7798.775443
229447	SP500	300	1786653300	7798.850652	7800.303071	7797.171407	7798.822077
229448	DOW	300	1786653300	53839.999841	53852.917008	53827.237099	53838.971735
228901	SP500	300	1786652400	7799.391031	7800.476868	7797.494561	7799.199793
229081	SP500	300	1786652700	7799.368002	7800.731936	7797.625648	7799.216392
229082	DOW	300	1786652700	53840.760900	53849.233216	53836.012459	53840.012277
229449	DXY	300	1786653300	99.977147	99.979694	99.954458	99.969737
229631	DOW	300	1786653600	53838.671341	53848.113073	53831.152872	53840.442999
229632	DXY	300	1786653600	99.968669	99.987850	99.961645	99.971681
230545	SP500	300	1786655100	7799.300044	7800.301044	7797.997218	7798.972894
230362	SP500	300	1786654800	7799.144367	7800.839610	7796.945049	7799.105105
230363	DOW	300	1786654800	53838.497711	53849.690865	53832.899706	53835.883047
230364	DXY	300	1786654800	99.963589	99.972810	99.944772	99.954951
230546	DOW	300	1786655100	53834.824123	53846.939550	53832.982690	53842.509758
230547	DXY	300	1786655100	99.955995	99.967401	99.943283	99.959365
231277	SP500	300	1786656300	7798.998840	7800.211221	7797.558794	7798.838816
231278	DOW	300	1786656300	53838.233233	53847.384325	53829.280646	53838.665006
231279	DXY	300	1786656300	99.973321	99.983488	99.958037	99.965604
231094	SP500	300	1786656000	7799.349014	7800.130034	7798.020347	7799.227133
231095	DOW	300	1786656000	53842.659575	53850.045046	53832.157841	53839.028422
231644	DOW	300	1786656900	53840.250213	53847.597485	53831.339190	53839.769702
231643	SP500	300	1786656900	7799.099943	7800.795148	7797.975298	7799.213549
231460	SP500	300	1786656600	7798.631461	7799.922102	7797.644672	7799.049706
231461	DOW	300	1786656600	53838.456329	53852.817632	53831.047144	53839.984805
231462	DXY	300	1786656600	99.963138	99.977357	99.953805	99.961655
231826	SP500	300	1786657200	7799.291110	7800.887317	7797.730146	7799.069867
231827	DOW	300	1786657200	53839.115331	53849.304065	53830.728887	53841.810344
231828	DXY	300	1786657200	99.954987	99.961186	99.937816	99.947739
232009	SP500	300	1786657500	7799.087764	7800.399963	7797.325996	7799.280171
232010	DOW	300	1786657500	53843.961761	53849.661231	53828.721140	53841.436481
232011	DXY	300	1786657500	99.947342	99.957525	99.933607	99.939609
232192	SP500	300	1786657800	7799.363394	7800.465844	7797.785858	7798.885225
232193	DOW	300	1786657800	53840.457320	53853.009385	53832.671999	53842.862281
232194	DXY	300	1786657800	99.940186	99.960963	99.940186	99.955285
236923	SP500	300	1786665600	7798.715475	7800.397956	7797.630406	7799.234489
236740	SP500	300	1786665300	7799.108052	7800.430226	7797.964751	7798.824340
236741	DOW	300	1786665300	53839.958596	53846.180146	53826.915468	53839.281843
236924	DOW	300	1786665600	53838.145705	53849.080314	53828.855483	53837.964921
234019	SP500	300	1786660800	7798.547169	7800.266408	7797.566456	7799.114711
234020	DOW	300	1786660800	53840.341406	53849.699316	53830.504663	53840.277181
234021	DXY	300	1786660800	99.948223	99.962807	99.939927	99.951022
236377	SP500	300	1786664700	7798.678632	7801.158327	7797.482254	7798.698447
232375	SP500	300	1786658100	7799.028743	7800.481537	7797.792513	7799.010074
232376	DOW	300	1786658100	53842.451498	53846.762181	53829.056347	53841.558394
232377	DXY	300	1786658100	99.957102	99.969472	99.944611	99.963141
236378	DOW	300	1786664700	53844.286478	53848.759230	53827.225831	53841.438215
235837	SP500	300	1786663800	7799.030353	7800.495031	7797.479877	7799.105035
235838	DOW	300	1786663800	53836.548586	53846.380209	53829.748854	53838.675451
235839	DXY	300	1786663800	99.950822	99.956722	99.938893	99.948981
235657	SP500	300	1786663500	7799.035822	7800.012549	7797.270503	7799.104539
235658	DOW	300	1786663500	53840.571387	53849.836442	53835.258254	53838.286143
235297	SP500	300	1786662900	7799.469369	7800.030343	7795.766973	7798.919488
235298	DOW	300	1786662900	53839.585247	53850.179037	53832.304037	53840.817997
232924	SP500	300	1786659000	7799.400987	7800.627354	7797.571843	7798.806435
232925	DOW	300	1786659000	53843.789927	53847.812270	53832.255673	53838.907138
232926	DXY	300	1786659000	99.965145	99.970187	99.937847	99.950572
235299	DXY	300	1786662900	99.945534	99.958926	99.936336	99.950349
235659	DXY	300	1786663500	99.949267	99.961475	99.941307	99.948380
234385	SP500	300	1786661400	7798.739722	7800.602134	7797.565247	7799.284299
234386	DOW	300	1786661400	53839.766982	53848.221326	53827.636524	53839.843385
232558	SP500	300	1786658400	7798.716696	7800.427244	7797.958676	7798.745498
232559	DOW	300	1786658400	53840.693642	53854.085391	53831.402799	53840.053512
232560	DXY	300	1786658400	99.962612	99.979583	99.954686	99.967926
234387	DXY	300	1786661400	99.950991	99.962635	99.936249	99.950405
233470	SP500	300	1786659900	7799.268408	7800.144427	7797.380456	7799.183733
233471	DOW	300	1786659900	53839.426706	53850.321400	53826.507617	53841.760250
233472	DXY	300	1786659900	99.951603	99.961478	99.936957	99.949566
233653	SP500	300	1786660200	7798.955389	7800.127665	7797.657851	7799.193821
233654	DOW	300	1786660200	53842.766015	53854.631939	53830.765935	53838.116188
233655	DXY	300	1786660200	99.950294	99.964782	99.937174	99.949670
233287	SP500	300	1786659600	7799.004900	7800.582448	7797.611893	7799.040759
233288	DOW	300	1786659600	53838.096078	53851.274486	53833.726376	53837.909020
233289	DXY	300	1786659600	99.946096	99.958386	99.936608	99.951200
235477	SP500	300	1786663200	7799.135447	7800.333257	7797.152162	7799.194446
234568	SP500	300	1786661700	7799.075466	7799.665976	7797.609546	7799.048105
234569	DOW	300	1786661700	53838.504118	53849.839653	53827.313259	53838.482964
234570	DXY	300	1786661700	99.952000	99.957177	99.936235	99.951143
232741	SP500	300	1786658700	7798.463560	7799.981848	7797.619915	7799.176418
232742	DOW	300	1786658700	53841.944098	53848.625161	53823.159522	53841.798445
232743	DXY	300	1786658700	99.967698	99.977674	99.956656	99.967266
234202	SP500	300	1786661100	7798.877499	7800.286191	7797.610086	7798.883723
234203	DOW	300	1786661100	53841.644077	53848.725149	53828.647053	53841.524854
234204	DXY	300	1786661100	99.951095	99.963360	99.941006	99.951706
233836	SP500	300	1786660500	7799.215783	7800.141742	7797.458021	7798.721008
233104	SP500	300	1786659300	7798.604567	7800.607094	7797.755176	7798.828491
233105	DOW	300	1786659300	53838.822623	53852.359252	53829.327548	53838.279311
233106	DXY	300	1786659300	99.950339	99.963468	99.936495	99.948329
233837	DOW	300	1786660500	53839.093577	53850.211406	53830.301291	53838.960097
233838	DXY	300	1786660500	99.950431	99.961201	99.932933	99.947718
235478	DOW	300	1786663200	53839.186445	53850.600246	53829.727635	53840.478768
235479	DXY	300	1786663200	99.950965	99.956545	99.933383	99.947832
234934	SP500	300	1786662300	7798.950510	7800.239187	7798.082475	7798.949197
234935	DOW	300	1786662300	53839.902237	53847.419981	53829.555290	53840.638543
234936	DXY	300	1786662300	99.952031	99.959908	99.941079	99.947429
235117	SP500	300	1786662600	7799.198846	7800.288583	7797.293015	7799.234849
235118	DOW	300	1786662600	53840.829086	53848.743887	53831.884149	53840.068379
235119	DXY	300	1786662600	99.946693	99.956121	99.937306	99.947011
234751	SP500	300	1786662000	7799.103690	7800.921090	7797.713040	7799.100610
234752	DOW	300	1786662000	53836.481903	53848.323991	53832.160021	53839.646620
234753	DXY	300	1786662000	99.951738	99.962354	99.935528	99.950978
236379	DXY	300	1786664700	99.946090	99.963216	99.938379	99.949281
236557	SP500	300	1786665000	7798.476413	7800.490961	7796.702543	7799.073243
236558	DOW	300	1786665000	53843.028691	53851.043367	53828.956515	53839.473782
236017	SP500	300	1786664100	7799.233253	7801.173472	7797.346999	7799.336957
236018	DOW	300	1786664100	53836.672823	53847.219360	53826.850399	53840.118244
236019	DXY	300	1786664100	99.948163	99.958218	99.938778	99.945884
236925	DXY	300	1786665600	99.925150	99.935406	99.909806	99.920663
236197	SP500	300	1786664400	7799.534128	7800.194342	7798.134611	7798.640949
236198	DOW	300	1786664400	53841.501834	53849.226193	53831.187321	53842.311594
236199	DXY	300	1786664400	99.945218	99.963117	99.940302	99.947641
236559	DXY	300	1786665000	99.951124	99.959959	99.937116	99.947932
237106	SP500	300	1786665900	7799.277619	7800.088480	7796.683484	7798.937850
236742	DXY	300	1786665300	99.946828	99.946828	99.911842	99.923879
237107	DOW	300	1786665900	53836.854415	53849.611334	53829.167563	53838.203202
237108	DXY	300	1786665900	99.920661	99.930685	99.906120	99.921639
237289	SP500	300	1786666200	7798.882436	7800.057022	7797.742325	7798.715967
237290	DOW	300	1786666200	53836.463491	53848.380174	53831.539512	53840.936234
237291	DXY	300	1786666200	99.922904	99.928973	99.897308	99.917263
237472	SP500	300	1786666500	7798.944126	7801.026844	7797.753581	7798.721047
237473	DOW	300	1786666500	53841.993491	53851.938628	53831.042399	53838.897283
237474	DXY	300	1786666500	99.917821	99.922743	99.898984	99.911807
237655	SP500	300	1786666800	7798.837329	7800.424304	7797.982595	7799.285482
237656	DOW	300	1786666800	53840.994449	53849.843145	53832.218695	53838.320362
240032	DOW	300	1786670700	53838.228946	53847.564247	53829.770765	53841.497140
240033	DXY	300	1786670700	99.919449	99.933059	99.899876	99.923272
240947	DOW	300	1786672200	53838.001168	53849.463697	53829.170330	53837.989459
240948	DXY	300	1786672200	99.894173	99.918073	99.887007	99.902421
242769	DXY	300	1786675200	99.902750	99.913073	99.887211	99.895353
241126	SP500	300	1786672500	7798.820353	7800.558365	7797.695064	7799.116203
241127	DOW	300	1786672500	53836.845704	53851.049333	53829.616600	53839.468720
238387	SP500	300	1786668000	7799.167000	7800.461969	7798.171048	7798.818378
238388	DOW	300	1786668000	53836.604289	53850.920036	53825.754977	53842.128541
238389	DXY	300	1786668000	99.890273	99.908450	99.881672	99.891589
238021	SP500	300	1786667400	7798.501990	7800.077061	7797.041818	7798.935632
238022	DOW	300	1786667400	53837.640499	53849.562884	53830.002970	53840.914895
238023	DXY	300	1786667400	99.909394	99.912131	99.884217	99.895705
239482	SP500	300	1786669800	7799.258164	7800.137615	7797.174954	7799.053838
239483	DOW	300	1786669800	53838.490654	53850.178010	53829.785791	53838.453085
239484	DXY	300	1786669800	99.873295	99.902859	99.867741	99.896434
241128	DXY	300	1786672500	99.900970	99.917996	99.890991	99.906075
242584	SP500	300	1786674900	7798.756571	7799.976050	7797.693874	7798.864483
242585	DOW	300	1786674900	53839.886342	53852.604151	53827.316217	53837.570539
240397	SP500	300	1786671300	7799.202241	7800.160772	7797.639972	7799.189886
240398	DOW	300	1786671300	53840.411699	53851.185713	53826.119652	53837.888454
240399	DXY	300	1786671300	99.933719	99.938084	99.908231	99.921349
240214	SP500	300	1786671000	7799.079366	7801.152132	7797.188940	7798.907017
240215	DOW	300	1786671000	53839.794216	53851.615832	53831.756762	53842.032569
240216	DXY	300	1786671000	99.921247	99.941239	99.917484	99.935303
238936	SP500	300	1786668900	7799.244605	7800.156919	7797.152721	7798.762294
238937	DOW	300	1786668900	53841.049745	53852.584428	53827.558045	53841.058437
238938	DXY	300	1786668900	99.893547	99.909550	99.881939	99.898448
238753	SP500	300	1786668600	7799.101123	7800.355883	7797.786425	7799.148561
238754	DOW	300	1786668600	53840.698482	53849.073061	53825.282232	53842.038616
238755	DXY	300	1786668600	99.895035	99.913720	99.884840	99.895022
238204	SP500	300	1786667700	7798.674258	7800.021255	7798.038811	7798.868469
238205	DOW	300	1786667700	53839.821761	53854.599197	53828.107094	53837.890175
238206	DXY	300	1786667700	99.894822	99.908448	99.888691	99.891902
237657	DXY	300	1786666800	99.910831	99.929789	99.903453	99.916332
239119	SP500	300	1786669200	7798.750657	7800.246182	7797.932356	7799.279438
239120	DOW	300	1786669200	53841.171787	53848.360075	53829.546371	53841.694652
239121	DXY	300	1786669200	99.898610	99.908049	99.879253	99.879253
237838	SP500	300	1786667100	7799.227150	7800.315920	7797.704215	7798.725046
237839	DOW	300	1786667100	53838.652919	53846.868441	53830.004031	53838.435549
237840	DXY	300	1786667100	99.914623	99.921353	99.896332	99.907216
238570	SP500	300	1786668300	7798.966254	7800.459371	7797.496752	7799.255257
238571	DOW	300	1786668300	53841.542293	53852.455517	53832.461106	53838.831222
238572	DXY	300	1786668300	99.890059	99.907162	99.877239	99.897191
242401	SP500	300	1786674600	7799.094491	7799.955716	7797.356341	7798.956227
242402	DOW	300	1786674600	53838.961985	53847.319342	53828.902717	53839.539688
242403	DXY	300	1786674600	99.902403	99.917986	99.897130	99.904641
242218	SP500	300	1786674300	7799.207446	7800.439731	7797.408793	7798.833594
239848	SP500	300	1786670400	7798.527426	7800.670585	7797.571421	7799.187329
239849	DOW	300	1786670400	53838.913534	53851.299327	53831.806587	53839.301655
239850	DXY	300	1786670400	99.904410	99.927616	99.900924	99.918259
239302	SP500	300	1786669500	7799.494013	7800.036681	7796.801210	7799.165757
239303	DOW	300	1786669500	53841.968561	53846.362201	53831.440662	53840.262566
239304	DXY	300	1786669500	99.879591	99.891622	99.867058	99.873007
240763	SP500	300	1786671900	7798.494739	7800.655108	7797.831137	7799.132330
240764	DOW	300	1786671900	53840.359418	53851.663705	53829.491535	53839.726128
239665	SP500	300	1786670100	7798.825607	7800.676693	7797.954814	7798.727813
239666	DOW	300	1786670100	53839.997408	53850.205485	53828.544592	53840.177772
239667	DXY	300	1786670100	99.894393	99.912159	99.884442	99.902210
240765	DXY	300	1786671900	99.903819	99.905318	99.887312	99.894036
240580	SP500	300	1786671600	7798.991247	7800.688207	7797.899539	7798.749729
240581	DOW	300	1786671600	53840.033368	53845.832552	53827.681386	53839.254342
240031	SP500	300	1786670700	7799.395446	7800.302008	7797.272169	7799.108015
240582	DXY	300	1786671600	99.922209	99.934031	99.894583	99.902884
242219	DOW	300	1786674300	53838.900298	53851.837148	53830.833747	53838.144207
242220	DXY	300	1786674300	99.903211	99.914492	99.892931	99.903312
241306	SP500	300	1786672800	7799.334669	7800.619306	7798.049795	7799.100152
241307	DOW	300	1786672800	53837.853436	53853.712039	53830.704360	53842.050103
241308	DXY	300	1786672800	99.907741	99.917073	99.891396	99.897836
241486	SP500	300	1786673100	7799.020343	7799.886015	7797.959601	7799.231178
240946	SP500	300	1786672200	7799.295745	7800.505403	7797.962034	7798.964305
241487	DOW	300	1786673100	53844.029070	53850.142544	53829.910706	53841.147075
241488	DXY	300	1786673100	99.898876	99.928260	99.888132	99.923125
241669	SP500	300	1786673400	7799.068803	7799.997015	7797.772477	7799.283820
241670	DOW	300	1786673400	53839.031951	53845.873822	53828.381115	53839.468511
241671	DXY	300	1786673400	99.923550	99.933441	99.903987	99.915379
241852	SP500	300	1786673700	7799.251138	7800.489115	7797.755178	7799.249313
241853	DOW	300	1786673700	53837.470849	53845.987821	53825.083742	53841.913836
241854	DXY	300	1786673700	99.914172	99.924729	99.902706	99.906863
242035	SP500	300	1786674000	7798.955913	7800.520444	7797.723644	7799.216233
242036	DOW	300	1786674000	53842.362936	53850.709402	53833.157072	53839.512290
242037	DXY	300	1786674000	99.906545	99.915889	99.897145	99.904680
242586	DXY	300	1786674900	99.907003	99.910698	99.883979	99.902716
242767	SP500	300	1786675200	7798.813307	7799.922622	7797.593102	7799.082036
242768	DOW	300	1786675200	53837.470383	53849.925769	53832.189578	53838.026288
242947	SP500	300	1786675500	7799.297356	7800.643177	7797.640564	7799.283349
242948	DOW	300	1786675500	53836.886715	53850.154341	53832.944902	53840.180169
242949	DXY	300	1786675500	99.897089	99.904865	99.879821	99.894988
243130	SP500	300	1786675800	7799.438363	7800.203084	7797.971238	7799.200804
244778	DOW	300	1786678500	53838.936331	53847.350081	53827.936375	53839.108887
244779	DXY	300	1786678500	99.880726	99.897035	99.872692	99.878744
243496	SP500	300	1786676400	7798.973645	7799.843598	7798.022183	7799.232674
243497	DOW	300	1786676400	53838.398931	53850.193484	53833.283650	53837.997946
243498	DXY	300	1786676400	99.904444	99.920879	99.888218	99.916751
243862	SP500	300	1786677000	7799.051424	7800.260769	7797.188080	7799.157034
243863	DOW	300	1786677000	53839.263557	53853.017892	53831.676097	53841.694736
243864	DXY	300	1786677000	99.916777	99.926731	99.901257	99.903633
245689	SP500	300	1786680000	7799.366398	7800.495675	7797.516350	7798.758101
245690	DOW	300	1786680000	53841.444884	53855.558112	53833.785911	53839.219408
245691	DXY	300	1786680000	99.885706	99.906842	99.872034	99.892559
245323	SP500	300	1786679400	7798.880123	7800.876539	7797.716030	7798.801169
245140	SP500	300	1786679100	7799.088266	7801.402499	7797.853092	7799.156831
245141	DOW	300	1786679100	53841.211184	53855.241218	53831.340599	53841.378207
245142	DXY	300	1786679100	99.871407	99.895418	99.863660	99.885872
245324	DOW	300	1786679400	53841.419484	53848.764440	53824.438079	53840.220647
245325	DXY	300	1786679400	99.883518	99.896359	99.874261	99.886240
245872	SP500	300	1786680300	7799.025994	7800.126287	7797.186444	7798.917362
243131	DOW	300	1786675800	53839.477631	53849.854644	53831.102167	53839.506132
243132	DXY	300	1786675800	99.897289	99.908633	99.873338	99.888613
245873	DOW	300	1786680300	53839.859421	53849.163016	53832.483746	53839.089558
244960	SP500	300	1786678800	7798.821933	7800.325832	7797.501924	7799.073268
244961	DOW	300	1786678800	53838.940071	53848.453160	53830.941338	53840.465057
244962	DXY	300	1786678800	99.879389	99.887168	99.868044	99.873799
243679	SP500	300	1786676700	7799.064874	7800.696400	7797.143079	7798.901281
243680	DOW	300	1786676700	53840.088707	53849.094523	53832.276039	53840.777033
243681	DXY	300	1786676700	99.916243	99.928017	99.901763	99.915757
245874	DXY	300	1786680300	99.890886	99.901994	99.876693	99.886724
244411	SP500	300	1786677900	7798.924324	7800.569462	7797.337060	7798.996382
244412	DOW	300	1786677900	53840.451095	53847.193710	53831.465936	53840.599406
244413	DXY	300	1786677900	99.906156	99.914526	99.889362	99.897843
243313	SP500	300	1786676100	7799.100716	7800.517781	7797.685848	7799.012210
243314	DOW	300	1786676100	53840.317319	53850.165052	53828.983651	53840.140915
243315	DXY	300	1786676100	99.889530	99.916553	99.886784	99.902952
244228	SP500	300	1786677600	7799.346416	7800.333502	7797.915957	7798.991182
244229	DOW	300	1786677600	53839.145152	53848.051140	53828.593264	53839.343577
244230	DXY	300	1786677600	99.911222	99.918248	99.898154	99.906184
247514	DOW	300	1786683000	53839.574918	53847.647075	53829.624454	53840.900885
247515	DXY	300	1786683000	99.869255	99.886749	99.858288	99.878426
244045	SP500	300	1786677300	7799.097122	7800.507691	7798.015672	7799.086183
244046	DOW	300	1786677300	53843.103555	53851.340959	53829.009404	53839.805299
244047	DXY	300	1786677300	99.905735	99.915161	99.889412	99.908750
247153	SP500	300	1786682400	7799.009592	7800.292587	7797.368246	7798.990000
245506	SP500	300	1786679700	7798.946716	7800.260643	7797.583562	7799.084447
244594	SP500	300	1786678200	7799.180653	7800.910746	7798.106231	7798.851802
244595	DOW	300	1786678200	53839.539391	53847.879325	53831.124133	53840.848185
244596	DXY	300	1786678200	99.899108	99.908031	99.869178	99.881968
245507	DOW	300	1786679700	53841.078153	53847.890123	53830.200393	53841.237773
245508	DXY	300	1786679700	99.887395	99.898853	99.876475	99.884695
247154	DOW	300	1786682400	53840.185140	53851.044836	53831.669964	53839.990000
247155	DXY	300	1786682400	99.885561	99.895604	99.860068	99.871000
246421	SP500	300	1786681200	7798.609778	7800.086099	7797.732847	7798.918784
246422	DOW	300	1786681200	53842.488944	53848.885720	53827.216081	53841.679578
246423	DXY	300	1786681200	99.868325	99.878244	99.856497	99.866493
246970	SP500	300	1786682100	7799.152323	7799.834445	7798.072309	7798.888569
246971	DOW	300	1786682100	53840.463161	53848.234876	53832.177716	53841.872076
246055	SP500	300	1786680600	7798.659782	7799.906929	7797.777702	7798.954629
244777	SP500	300	1786678500	7798.810349	7800.205238	7797.779661	7799.126354
246056	DOW	300	1786680600	53837.011435	53848.077518	53833.642505	53839.475275
246057	DXY	300	1786680600	99.888110	99.896719	99.874022	99.880479
246238	SP500	300	1786680900	7799.207070	7799.861539	7797.730716	7798.750712
246239	DOW	300	1786680900	53837.383193	53848.017685	53832.518889	53840.386546
246240	DXY	300	1786680900	99.879868	99.884694	99.864409	99.866463
246972	DXY	300	1786682100	99.873412	99.896978	99.870486	99.886704
247333	SP500	300	1786682700	7799.189578	7800.176677	7797.435825	7798.990000
247334	DOW	300	1786682700	53839.215207	53846.896753	53826.425816	53839.990000
246787	SP500	300	1786681800	7799.021701	7800.231578	7797.776126	7799.151429
246788	DOW	300	1786681800	53841.994682	53851.387772	53832.945127	53839.838031
246604	SP500	300	1786681500	7798.764552	7800.830208	7798.131989	7798.739788
246605	DOW	300	1786681500	53842.356687	53847.976278	53829.832447	53842.015820
246606	DXY	300	1786681500	99.866760	99.879381	99.858529	99.874617
246789	DXY	300	1786681800	99.875171	99.886262	99.861758	99.875857
247335	DXY	300	1786682700	99.872028	99.880724	99.853136	99.867000
247697	DOW	300	1786683300	53841.032464	53848.107222	53830.549556	53841.900909
247698	DXY	300	1786683300	99.876603	99.889010	99.863583	99.879441
247513	SP500	300	1786683000	7798.754536	7800.265217	7797.596226	7799.191274
247881	DXY	300	1786683600	99.878878	99.887206	99.857681	99.869877
248062	SP500	300	1786683900	7799.115694	7800.743074	7797.657721	7799.224358
247696	SP500	300	1786683300	7798.938910	7800.487329	7797.412781	7798.822651
247880	DOW	300	1786683600	53842.775831	53850.819602	53833.411359	53838.188127
247879	SP500	300	1786683600	7798.547750	7800.198208	7797.679131	7799.103679
248063	DOW	300	1786683900	53839.054290	53851.609339	53825.580576	53839.292380
248064	DXY	300	1786683900	99.868339	99.882372	99.858194	99.874411
248403	DXY	300	1786684200	99.880960	99.882883	99.856219	99.861039
248401	SP500	300	1786684200	7797.849373	7800.221483	7796.967575	7798.953528
248402	DOW	300	1786684200	53843.117789	53850.096886	53829.135198	53838.528558
248608	SP500	300	1786684500	7799.181476	7800.274696	7797.104857	7798.309475
248609	DOW	300	1786684500	53836.992318	53852.776346	53830.688913	53849.133470
248610	DXY	300	1786684500	99.860308	99.876179	99.851304	99.857351
253717	SP500	300	1786691400	7799.386301	7800.086912	7797.504725	7798.635202
251362	SP500	300	1786688400	7798.618186	7800.743250	7796.991522	7798.636819
251363	DOW	300	1786688400	53835.238102	53851.782984	53830.491058	53840.296674
251364	DXY	300	1786688400	99.834106	99.846155	99.817918	99.835330
253718	DOW	300	1786691400	53839.483565	53848.050370	53827.355859	53838.770887
253426	SP500	300	1786691100	7798.934083	7800.364122	7797.657868	7799.276282
253427	DOW	300	1786691100	53840.921165	53853.657598	53826.836442	53841.356017
253428	DXY	300	1786691100	99.831957	99.846768	99.807340	99.812476
248791	SP500	300	1786684800	7798.574490	7800.293653	7797.727762	7799.281026
248792	DOW	300	1786684800	53849.696359	53851.469668	53829.361298	53833.951419
248793	DXY	300	1786684800	99.856730	99.869348	99.851234	99.851362
253225	SP500	300	1786690800	7798.929549	7800.914126	7798.154656	7798.869513
250654	SP500	300	1786687800	7799.079462	7800.240012	7797.394366	7800.155035
250655	DOW	300	1786687800	53842.925141	53850.374310	53828.091635	53846.621596
250656	DXY	300	1786687800	99.841720	99.847774	99.815191	99.815825
253226	DOW	300	1786690800	53842.428305	53849.071704	53828.578954	53838.977987
253227	DXY	300	1786690800	99.823788	99.849770	99.812156	99.834852
249340	SP500	300	1786685700	7799.005190	7800.645137	7797.558658	7798.602627
249341	DOW	300	1786685700	53836.976953	53849.343505	53827.576032	53841.125690
249342	DXY	300	1786685700	99.864157	99.868804	99.842770	99.847691
250063	SP500	300	1786686900	7798.521164	7800.174477	7797.039077	7798.819293
250064	DOW	300	1786686900	53837.625821	53850.260074	53832.041878	53832.790584
250065	DXY	300	1786686900	99.842305	99.859314	99.835702	99.854438
249883	SP500	300	1786686600	7799.868341	7800.424902	7797.610777	7798.623901
249884	DOW	300	1786686600	53841.446994	53847.616245	53831.984481	53839.542767
248974	SP500	300	1786685100	7799.405373	7800.234200	7797.798876	7800.150356
248975	DOW	300	1786685100	53832.973530	53852.337690	53830.940138	53842.214159
248976	DXY	300	1786685100	99.851850	99.873208	99.845232	99.851744
249885	DXY	300	1786686600	99.850011	99.852951	99.824162	99.840567
253045	SP500	300	1786690500	7799.309222	7800.466526	7797.202603	7798.809220
253046	DOW	300	1786690500	53840.888484	53850.658272	53834.410720	53840.444537
249703	SP500	300	1786686300	7799.005028	7800.453911	7797.995680	7799.967519
249704	DOW	300	1786686300	53836.626686	53853.326773	53833.978038	53840.044379
249705	DXY	300	1786686300	99.841836	99.864457	99.838154	99.849093
253047	DXY	300	1786690500	99.827656	99.842053	99.810821	99.821990
252499	SP500	300	1786689600	7798.869716	7800.125887	7797.457139	7799.432226
252500	DOW	300	1786689600	53838.572781	53855.718787	53832.522644	53840.408696
250243	SP500	300	1786687200	7798.712122	7800.523279	7797.668288	7798.218881
250244	DOW	300	1786687200	53833.491325	53847.091676	53831.310516	53835.365385
250245	DXY	300	1786687200	99.854253	99.858335	99.835453	99.839811
249157	SP500	300	1786685400	7800.396765	7800.961521	7797.695708	7798.957209
249158	DOW	300	1786685400	53840.800668	53850.724567	53832.502114	53837.687643
249159	DXY	300	1786685400	99.852814	99.868877	99.850343	99.864666
251950	SP500	300	1786689000	7799.916178	7801.134406	7797.913898	7798.815942
251951	DOW	300	1786689000	53838.742714	53847.339453	53833.989434	53838.633592
251952	DXY	300	1786689000	99.843678	99.859845	99.834758	99.857129
252501	DXY	300	1786689600	99.852924	99.860656	99.830281	99.842173
249523	SP500	300	1786686000	7798.654131	7800.866266	7797.089816	7799.089961
249524	DOW	300	1786686000	53841.540381	53848.560594	53827.483521	53834.487825
249525	DXY	300	1786686000	99.847672	99.863952	99.834517	99.842810
251674	SP500	300	1786688700	7798.823771	7800.351994	7796.962679	7799.706919
251675	DOW	300	1786688700	53839.763998	53850.848757	53829.919313	53839.370360
251676	DXY	300	1786688700	99.833433	99.853002	99.823335	99.845081
250423	SP500	300	1786687500	7798.516258	7800.357417	7797.937927	7799.007278
250424	DOW	300	1786687500	53836.309568	53848.502848	53830.648938	53841.731739
250425	DXY	300	1786687500	99.840425	99.858998	99.829402	99.839794
252865	SP500	300	1786690200	7799.077334	7799.887206	7797.511091	7799.065007
252866	DOW	300	1786690200	53837.546727	53846.007520	53827.937049	53840.947190
252867	DXY	300	1786690200	99.834817	99.849045	99.820664	99.826446
252133	SP500	300	1786689300	7799.026744	7800.181549	7797.307090	7798.733715
252134	DOW	300	1786689300	53839.680991	53853.434933	53832.859923	53840.543291
251089	SP500	300	1786688100	7800.422047	7800.787450	7798.005610	7798.732645
251090	DOW	300	1786688100	53847.305929	53850.535873	53830.837151	53836.179252
251091	DXY	300	1786688100	99.817111	99.835517	99.809528	99.831620
252135	DXY	300	1786689300	99.858297	99.867938	99.829058	99.853759
252682	SP500	300	1786689900	7799.722078	7799.923320	7797.760816	7799.040943
252683	DOW	300	1786689900	53840.834645	53847.689541	53832.288075	53835.796388
252684	DXY	300	1786689900	99.840838	99.849931	99.818775	99.834127
253719	DXY	300	1786691400	99.809983	99.822496	99.785925	99.802811
253901	DOW	300	1786691700	53837.951443	53850.463704	53831.363286	53839.210321
253902	DXY	300	1786691700	99.804738	99.830019	99.796547	99.802361
254997	DXY	300	1786693200	99.803012	99.814560	99.791598	99.803070
254446	SP500	300	1786692300	7798.021283	7800.451066	7797.573564	7798.226053
254206	SP500	300	1786692000	7798.552458	7800.586600	7797.589004	7798.165332
254207	DOW	300	1786692000	53848.488929	53848.488929	53830.792280	53839.057601
253900	SP500	300	1786691700	7798.930590	7800.854488	7797.403142	7799.110534
254447	DOW	300	1786692300	53840.062903	53852.468141	53828.122157	53833.113718
254448	DXY	300	1786692300	99.806164	99.814813	99.788521	99.800336
254629	SP500	300	1786692600	7798.273687	7800.270578	7797.524847	7799.741063
254208	DXY	300	1786692000	99.809367	99.812821	99.783839	99.806643
254630	DOW	300	1786692600	53834.404262	53845.840323	53831.962530	53840.385970
254631	DXY	300	1786692600	99.799294	99.819954	99.784969	99.809095
254812	SP500	300	1786692900	7800.034910	7800.997282	7797.944865	7799.598810
254813	DOW	300	1786692900	53839.639342	53853.715082	53828.169535	53832.300062
254814	DXY	300	1786692900	99.807415	99.819334	99.791884	99.801424
255176	DOW	300	1786693500	53840.634055	53849.296437	53828.660277	53840.165020
254995	SP500	300	1786693200	7799.539740	7800.248534	7797.890081	7799.286959
254996	DOW	300	1786693200	53833.729087	53849.770297	53828.398647	53841.498893
255175	SP500	300	1786693500	7799.221314	7800.147277	7797.976399	7798.957422
256986	DXY	300	1786696500	99.743163	99.750922	99.722676	99.731904
257899	SP500	300	1786698000	7798.873663	7800.944419	7797.603865	7798.521117
257900	DOW	300	1786698000	53847.147071	53849.752564	53829.401199	53839.200944
257901	DXY	300	1786698000	99.733724	99.749113	99.715321	99.731242
255904	SP500	300	1786694700	7798.518701	7800.064035	7797.893663	7799.753476
255905	DOW	300	1786694700	53838.451124	53848.332236	53831.410057	53834.538098
255906	DXY	300	1786694700	99.761842	99.776962	99.748313	99.756835
257716	SP500	300	1786697700	7798.867763	7799.990767	7798.028089	7798.940672
257717	DOW	300	1786697700	53838.474693	53848.813447	53827.383240	53848.813447
255538	SP500	300	1786694100	7798.155045	7800.353452	7797.484945	7798.925181
255539	DOW	300	1786694100	53836.003529	53846.551149	53830.700360	53833.801340
255540	DXY	300	1786694100	99.784813	99.789456	99.756266	99.756662
257718	DXY	300	1786697700	99.736404	99.750508	99.723624	99.731820
260091	DXY	300	1786701600	99.732466	99.743401	99.720571	99.724712
260271	DXY	300	1786701900	99.724505	99.746688	99.711991	99.714481
260089	SP500	300	1786701600	7798.460653	7800.579313	7797.618611	7799.257445
259906	SP500	300	1786701300	7801.138639	7801.138639	7798.076169	7798.452183
258265	SP500	300	1786698600	7799.339932	7800.105390	7797.466083	7799.379030
256444	SP500	300	1786695600	7799.377873	7799.875463	7797.787354	7798.856426
256445	DOW	300	1786695600	53834.357879	53849.457885	53832.515451	53841.675426
256446	DXY	300	1786695600	99.734267	99.747649	99.720052	99.743255
256624	SP500	300	1786695900	7798.820014	7800.451862	7797.742118	7798.003612
256625	DOW	300	1786695900	53841.690187	53849.995050	53827.566480	53839.961630
256626	DXY	300	1786695900	99.744897	99.760794	99.731300	99.752971
256264	SP500	300	1786695300	7799.781352	7800.361211	7797.354614	7799.528951
256265	DOW	300	1786695300	53838.419854	53852.846465	53829.534369	53836.173891
256266	DXY	300	1786695300	99.739619	99.750139	99.719194	99.731830
258266	DOW	300	1786698600	53835.914756	53850.743805	53826.965294	53838.649815
258267	DXY	300	1786698600	99.732557	99.736785	99.708253	99.719032
255721	SP500	300	1786694400	7799.216017	7800.239469	7797.716724	7798.352582
255722	DOW	300	1786694400	53835.485260	53846.986007	53827.330198	53838.249260
255723	DXY	300	1786694400	99.756306	99.783301	99.751887	99.762877
255177	DXY	300	1786693500	99.803730	99.817010	99.785995	99.786759
257350	SP500	300	1786697100	7798.603222	7800.441153	7797.528813	7800.085082
257351	DOW	300	1786697100	53834.535834	53846.623991	53830.691744	53837.465210
257352	DXY	300	1786697100	99.743793	99.747387	99.702410	99.702410
256084	SP500	300	1786695000	7799.810457	7801.364478	7797.716905	7799.764946
256085	DOW	300	1786695000	53834.670222	53851.129102	53829.008593	53840.488092
256086	DXY	300	1786695000	99.755624	99.763271	99.732599	99.741223
255355	SP500	300	1786693800	7799.074388	7800.410415	7797.648250	7798.151137
255356	DOW	300	1786693800	53839.983529	53850.369606	53828.572925	53837.775179
255357	DXY	300	1786693800	99.785988	99.800215	99.768025	99.784552
256804	SP500	300	1786696200	7797.913242	7800.194678	7797.715233	7798.461661
256805	DOW	300	1786696200	53841.754798	53848.467145	53828.789939	53836.560337
256806	DXY	300	1786696200	99.752266	99.767177	99.735599	99.743696
257167	SP500	300	1786696800	7800.135382	7800.658266	7797.767542	7798.722724
257168	DOW	300	1786696800	53839.301713	53853.299962	53830.298404	53836.632856
257169	DXY	300	1786696800	99.731817	99.753071	99.725675	99.743197
258082	SP500	300	1786698300	7798.612700	7800.398635	7797.067703	7799.397602
258083	DOW	300	1786698300	53839.478380	53851.653824	53828.879169	53836.523167
258084	DXY	300	1786698300	99.732105	99.744748	99.707118	99.732461
257533	SP500	300	1786697400	7799.897162	7800.323052	7797.624210	7799.120168
257534	DOW	300	1786697400	53839.318409	53851.759770	53828.028751	53837.480346
257535	DXY	300	1786697400	99.703026	99.736577	99.687004	99.736577
259907	DOW	300	1786701300	53841.218215	53853.439002	53830.805900	53842.193664
259360	SP500	300	1786700400	7798.291961	7800.228451	7797.121959	7798.759660
259361	DOW	300	1786700400	53841.005349	53850.348513	53829.410616	53839.921333
259362	DXY	300	1786700400	99.728190	99.745916	99.716894	99.740302
256984	SP500	300	1786696500	7798.521291	7800.538164	7797.704900	7799.980323
256985	DOW	300	1786696500	53836.579773	53850.490790	53827.402399	53837.212619
258814	SP500	300	1786699500	7799.568455	7800.452173	7797.740225	7799.128285
258815	DOW	300	1786699500	53836.100126	53845.902902	53827.879328	53839.240691
258816	DXY	300	1786699500	99.718336	99.733770	99.709611	99.731818
258997	SP500	300	1786699800	7799.029129	7800.395007	7797.175681	7799.087284
258998	DOW	300	1786699800	53837.208141	53850.513522	53827.587398	53849.112448
258448	SP500	300	1786698900	7799.367934	7800.720177	7797.447128	7799.646237
258449	DOW	300	1786698900	53837.710482	53850.707287	53831.686807	53836.172800
258450	DXY	300	1786698900	99.717758	99.732451	99.705343	99.713757
258999	DXY	300	1786699800	99.732200	99.751560	99.718674	99.723336
258631	SP500	300	1786699200	7799.505417	7800.508221	7797.780145	7799.841260
259180	SP500	300	1786700100	7799.296931	7800.467412	7797.233279	7798.089909
259181	DOW	300	1786700100	53848.686800	53848.686800	53832.224525	53840.221511
259182	DXY	300	1786700100	99.724254	99.738265	99.713322	99.728890
258632	DOW	300	1786699200	53836.269403	53850.721805	53830.268127	53837.887531
258633	DXY	300	1786699200	99.714684	99.736566	99.710906	99.718219
259540	SP500	300	1786700700	7798.541290	7800.484696	7797.472548	7798.799963
259541	DOW	300	1786700700	53841.947620	53847.350430	53830.850463	53842.862113
259908	DXY	300	1786701300	99.735180	99.749196	99.716655	99.733580
259723	SP500	300	1786701000	7798.738154	7801.006894	7797.584012	7801.006894
259724	DOW	300	1786701000	53844.892903	53847.970323	53829.712261	53840.959454
259542	DXY	300	1786700700	99.739731	99.757751	99.730374	99.735812
259725	DXY	300	1786701000	99.737360	99.753118	99.728001	99.734826
260090	DOW	300	1786701600	53843.856505	53848.594733	53829.901727	53838.119648
260451	DXY	300	1786702200	99.714490	99.741823	99.712781	99.735074
260269	SP500	300	1786701900	7799.032221	7800.794656	7797.855573	7798.668975
260270	DOW	300	1786701900	53836.837958	53848.071832	53830.458667	53838.443724
260449	SP500	300	1786702200	7798.490319	7799.987270	7798.253037	7798.981983
260450	DOW	300	1786702200	53839.293740	53855.400080	53830.386390	53843.624282
260629	SP500	300	1786702500	7799.028463	7800.681830	7796.443840	7798.460553
261360	DXY	300	1786703700	99.717759	99.741140	99.706484	99.736407
260995	SP500	300	1786703100	7798.601603	7800.807668	7797.885296	7799.835605
260996	DOW	300	1786703100	53840.453013	53850.939285	53833.001691	53841.595204
260997	DXY	300	1786703100	99.719540	99.725705	99.705372	99.722235
263905	SP500	300	1786707900	7799.527906	7800.765394	7797.675075	7798.480181
263906	DOW	300	1786707900	53832.643120	53847.165511	53829.293105	53842.730446
263907	DXY	300	1786707900	99.630498	99.635507	99.595138	99.617187
265358	DOW	300	1786710300	53837.353708	53852.701727	53830.657767	53852.701727
264808	SP500	300	1786709400	7799.847010	7800.489124	7797.824706	7798.439224
264809	DOW	300	1786709400	53839.663705	53848.219481	53828.113498	53838.976805
262444	SP500	300	1786705500	7797.909689	7800.204922	7797.322751	7797.422671
262445	DOW	300	1786705500	53837.806678	53851.936014	53825.756897	53841.229963
262446	DXY	300	1786705500	99.717872	99.731337	99.706068	99.726292
262990	SP500	300	1786706400	7799.141908	7800.826254	7797.995050	7798.106373
262991	DOW	300	1786706400	53836.878038	53846.895910	53831.963946	53834.612622
262992	DXY	300	1786706400	99.712392	99.717734	99.689063	99.692189
264810	DXY	300	1786709400	99.639223	99.639223	99.600508	99.608559
263539	SP500	300	1786707300	7798.381174	7800.215934	7797.155195	7799.893945
261901	SP500	300	1786704600	7797.421508	7800.696644	7797.222322	7798.383928
260630	DOW	300	1786702500	53844.848320	53853.745781	53830.879789	53832.897311
260631	DXY	300	1786702500	99.737226	99.738996	99.714100	99.717817
261902	DOW	300	1786704600	53844.837069	53845.567695	53833.193733	53844.360669
261903	DXY	300	1786704600	99.723216	99.738525	99.715145	99.724512
261718	SP500	300	1786704300	7800.003624	7800.384116	7797.456691	7797.583625
261178	SP500	300	1786703400	7799.834492	7800.554694	7797.714132	7799.071136
261179	DOW	300	1786703400	53840.892706	53851.249546	53829.867864	53837.470583
261180	DXY	300	1786703400	99.722997	99.726866	99.710190	99.719877
261719	DOW	300	1786704300	53847.592032	53850.437564	53830.184900	53844.495516
261720	DXY	300	1786704300	99.729677	99.730693	99.708081	99.722396
263540	DOW	300	1786707300	53848.165542	53850.601426	53829.739139	53836.706600
263541	DXY	300	1786707300	99.651640	99.664614	99.639086	99.658241
260812	SP500	300	1786702800	7798.546833	7800.355493	7797.188483	7798.334899
260813	DOW	300	1786702800	53833.190437	53846.803900	53832.185934	53838.847009
260814	DXY	300	1786702800	99.720266	99.726122	99.697655	99.720062
261538	SP500	300	1786704000	7799.004596	7800.305349	7797.508119	7799.706811
261539	DOW	300	1786704000	53835.220677	53847.190592	53830.105119	53845.884903
261540	DXY	300	1786704000	99.734541	99.740039	99.711199	99.729902
262084	SP500	300	1786704900	7798.165848	7800.537491	7797.336384	7798.598011
262085	DOW	300	1786704900	53845.015842	53851.785066	53829.345182	53844.678562
262086	DXY	300	1786704900	99.722608	99.731820	99.709556	99.727630
263722	SP500	300	1786707600	7800.064212	7800.131887	7798.117868	7799.617634
263723	DOW	300	1786707600	53838.162844	53853.632393	53831.820669	53833.676932
263724	DXY	300	1786707600	99.656453	99.668554	99.625756	99.632386
264265	SP500	300	1786708500	7799.683451	7800.031781	7797.775784	7800.031781
264266	DOW	300	1786708500	53838.958004	53849.796957	53831.428845	53845.695183
264267	DXY	300	1786708500	99.610480	99.635998	99.607465	99.617683
261358	SP500	300	1786703700	7798.889224	7800.550484	7797.776616	7798.696531
261359	DOW	300	1786703700	53837.500027	53849.142964	53824.732359	53836.412937
262264	SP500	300	1786705200	7798.451662	7800.347088	7797.358662	7797.631451
262265	DOW	300	1786705200	53846.055268	53848.586616	53830.736205	53836.772742
262266	DXY	300	1786705200	99.725971	99.730495	99.701635	99.716857
264085	SP500	300	1786708200	7798.764180	7800.479760	7797.702598	7799.545194
264086	DOW	300	1786708200	53844.815328	53852.719095	53830.204831	53839.050043
264087	DXY	300	1786708200	99.615891	99.616542	99.581469	99.612845
263173	SP500	300	1786706700	7797.993009	7800.230928	7797.993009	7799.607763
262807	SP500	300	1786706100	7799.438961	7800.726638	7797.490126	7799.194704
262808	DOW	300	1786706100	53834.012697	53846.289785	53831.172203	53835.879299
262624	SP500	300	1786705800	7797.253951	7799.880592	7797.253951	7799.156347
262625	DOW	300	1786705800	53843.027026	53853.389382	53829.850027	53833.075653
262626	DXY	300	1786705800	99.725647	99.725647	99.686828	99.705099
262809	DXY	300	1786706100	99.707135	99.722620	99.695544	99.713427
263174	DOW	300	1786706700	53834.290892	53847.368911	53821.636071	53847.367714
263175	DXY	300	1786706700	99.693880	99.698973	99.656883	99.669165
263356	SP500	300	1786707000	7799.530757	7800.255222	7797.880019	7798.332453
263357	DOW	300	1786707000	53848.072776	53850.478477	53832.026670	53847.618258
263358	DXY	300	1786707000	99.670580	99.670802	99.639451	99.652916
265359	DXY	300	1786710300	99.626704	99.632111	99.599654	99.602399
264625	SP500	300	1786709100	7798.120918	7801.441880	7797.136143	7799.598611
264626	DOW	300	1786709100	53847.632918	53847.632918	53834.087813	53841.074584
264627	DXY	300	1786709100	99.614083	99.645338	99.609952	99.637710
264445	SP500	300	1786708800	7800.192632	7800.299828	7798.093731	7798.359902
264446	DOW	300	1786708800	53844.139369	53850.289668	53834.659105	53846.603412
264447	DXY	300	1786708800	99.618097	99.635828	99.596936	99.614449
265357	SP500	300	1786710300	7798.827897	7800.338539	7797.800500	7798.840111
264991	SP500	300	1786709700	7798.561371	7800.206219	7796.847971	7798.209788
264992	DOW	300	1786709700	53840.199535	53854.501445	53823.716904	53841.699486
264993	DXY	300	1786709700	99.609522	99.620919	99.584992	99.612592
265174	SP500	300	1786710000	7797.954913	7800.126381	7797.374029	7798.918037
265175	DOW	300	1786710000	53842.414651	53849.957783	53832.762463	53838.494552
265176	DXY	300	1786710000	99.614537	99.638315	99.606538	99.628863
265540	SP500	300	1786710600	7799.079685	7800.727117	7797.887441	7798.306649
265541	DOW	300	1786710600	53851.885211	53853.749644	53831.565558	53839.385175
265542	DXY	300	1786710600	99.604858	99.607805	99.562000	99.576255
265723	SP500	300	1786710900	7798.387448	7800.509003	7798.178619	7798.419588
265724	DOW	300	1786710900	53841.035601	53848.001904	53832.109174	53841.537895
265725	DXY	300	1786710900	99.576434	99.593917	99.559601	99.577995
265906	SP500	300	1786711200	7798.440017	7800.392000	7797.832869	7799.859797
265907	DOW	300	1786711200	53841.469029	53851.011035	53831.437892	53836.336262
265908	DXY	300	1786711200	99.579409	99.581683	99.494344	99.536612
268078	SP500	300	1786714800	7800.881723	7806.780000	7799.919900	7805.299088
268079	DOW	300	1786714800	53795.042761	53824.228309	53758.486052	53808.062727
268080	DXY	300	1786714800	99.597478	99.617317	99.568651	99.579400
268259	DOW	300	1786715100	53809.040928	53855.744946	53797.726126	53840.259646
268260	DXY	300	1786715100	99.578703	99.578703	99.507637	99.517668
269164	SP500	300	1786716600	7807.526552	7809.096508	7803.841315	7807.275723
268621	SP500	300	1786715700	7809.536156	7809.536156	7803.007487	7804.824234
266089	SP500	300	1786711500	7800.106622	7800.564458	7797.384297	7798.568137
266090	DOW	300	1786711500	53837.283861	53849.741136	53833.037530	53844.843230
266091	DXY	300	1786711500	99.537383	99.599861	99.529289	99.584302
268622	DOW	300	1786715700	53866.021159	53882.347915	53831.489774	53851.624937
268623	DXY	300	1786715700	99.509821	99.509821	99.470440	99.484377
267898	SP500	300	1786714500	7802.975533	7804.277110	7797.661408	7801.097091
267899	DOW	300	1786714500	53787.381635	53847.969044	53787.381635	53794.669023
267900	DXY	300	1786714500	99.616840	99.624045	99.585505	99.599525
266638	SP500	300	1786712400	7799.144077	7800.001696	7797.709205	7799.113874
266639	DOW	300	1786712400	53836.781071	53853.799612	53830.022714	53844.089394
266640	DXY	300	1786712400	99.581195	99.613064	99.579997	99.592851
267358	SP500	300	1786713600	7798.145561	7801.097759	7797.744526	7798.915988
267359	DOW	300	1786713600	53842.527139	53848.709752	53828.405924	53837.131256
267360	DXY	300	1786713600	99.640249	99.651329	99.622740	99.642475
267178	SP500	300	1786713300	7799.162584	7800.529361	7798.207719	7798.326437
267179	DOW	300	1786713300	53837.195805	53847.996045	53832.363895	53842.507388
267180	DXY	300	1786713300	99.634642	99.646458	99.622102	99.639868
266272	SP500	300	1786711800	7798.500383	7800.280528	7797.717970	7799.252992
266273	DOW	300	1786711800	53844.698210	53850.490397	53826.322948	53836.435707
266274	DXY	300	1786711800	99.584330	99.615307	99.583504	99.610268
266998	SP500	300	1786713000	7800.014106	7800.817758	7797.797587	7799.444554
266999	DOW	300	1786713000	53841.584529	53847.493389	53831.923870	53836.837445
267000	DXY	300	1786713000	99.611399	99.650336	99.608446	99.633733
269165	DOW	300	1786716600	53814.408302	53832.176438	53790.313662	53819.044956
269166	DXY	300	1786716600	99.509827	99.539131	99.481597	99.519791
268801	SP500	300	1786716000	7805.079997	7808.325173	7804.530901	7807.820775
267538	SP500	300	1786713900	7798.954029	7800.044934	7797.617772	7798.240256
267539	DOW	300	1786713900	53838.031907	53852.739541	53832.740676	53836.050418
267540	DXY	300	1786713900	99.644808	99.655799	99.634810	99.648405
268802	DOW	300	1786716000	53851.901910	53863.590000	53805.354069	53805.354069
268803	DXY	300	1786716000	99.482014	99.526487	99.475318	99.515785
268438	SP500	300	1786715400	7802.507800	7809.385085	7799.993553	7809.306782
268439	DOW	300	1786715400	53841.517207	53892.957480	53811.796333	53866.705101
266455	SP500	300	1786712100	7799.391148	7800.321969	7797.610503	7799.155017
266456	DOW	300	1786712100	53836.588634	53850.927595	53828.862755	53835.724250
266457	DXY	300	1786712100	99.609247	99.621927	99.573784	99.581448
268440	DXY	300	1786715400	99.518453	99.533602	99.481105	99.507588
266818	SP500	300	1786712700	7798.849649	7800.706686	7797.491629	7799.873935
266819	DOW	300	1786712700	53846.100922	53847.665432	53832.142932	53842.689824
266820	DXY	300	1786712700	99.592123	99.639786	99.589500	99.608969
269349	DXY	300	1786716900	99.522010	99.546599	99.505581	99.530060
267718	SP500	300	1786714200	7797.963441	7807.347585	7797.859138	7803.122950
267719	DOW	300	1786714200	53834.110918	53853.091730	53702.925944	53785.986165
267720	DXY	300	1786714200	99.647404	99.660187	99.612399	99.616636
271361	DOW	300	1786720200	53741.065136	53773.422601	53739.896132	53742.031578
270628	SP500	300	1786719000	7793.409115	7796.985271	7791.528520	7792.305933
270445	SP500	300	1786718700	7793.128682	7796.485495	7791.468888	7793.680518
270446	DOW	300	1786718700	53751.630655	53782.759530	53742.571846	53769.693495
269713	SP500	300	1786717500	7797.078591	7797.908652	7792.327395	7795.060622
269714	DOW	300	1786717500	53832.688319	53832.688319	53793.679870	53807.143662
269715	DXY	300	1786717500	99.533501	99.547502	99.510397	99.537827
270079	SP500	300	1786718100	7791.901776	7796.877709	7790.015292	7796.819882
270080	DOW	300	1786718100	53761.355762	53780.884264	53739.927671	53757.178572
268258	SP500	300	1786715100	7805.234465	7808.036935	7799.992795	7802.655325
270081	DXY	300	1786718100	99.523671	99.524759	99.477371	99.495414
268981	SP500	300	1786716300	7808.015473	7810.414219	7806.189180	7807.532725
268982	DOW	300	1786716300	53804.641237	53832.818190	53791.978584	53816.329793
268983	DXY	300	1786716300	99.517088	99.543000	99.510319	99.511961
269896	SP500	300	1786717800	7795.048712	7795.797494	7789.858748	7791.960332
269897	DOW	300	1786717800	53808.058024	53818.427716	53760.612494	53762.609036
269898	DXY	300	1786717800	99.536696	99.555331	99.511762	99.522773
269347	SP500	300	1786716900	7807.226295	7807.459949	7800.174121	7801.296208
269348	DOW	300	1786716900	53818.210844	53857.277077	53790.582172	53830.773164
269530	SP500	300	1786717200	7801.177291	7801.376474	7794.872174	7797.010503
269531	DOW	300	1786717200	53830.549950	53838.179173	53793.142501	53833.213449
269532	DXY	300	1786717200	99.532443	99.538409	99.507407	99.534619
270262	SP500	300	1786718400	7797.122948	7797.122948	7791.331204	7792.986482
270263	DOW	300	1786718400	53755.459629	53771.336345	53739.258246	53751.151153
270264	DXY	300	1786718400	99.494681	99.533232	99.490080	99.526635
270629	DOW	300	1786719000	53771.519109	53771.519109	53736.766385	53742.104188
270630	DXY	300	1786719000	99.521830	99.550718	99.507834	99.512298
270811	SP500	300	1786719300	7792.396885	7792.973323	7787.857296	7787.875023
270447	DXY	300	1786718700	99.525142	99.546512	99.508598	99.522411
270812	DOW	300	1786719300	53741.880521	53757.446672	53724.792329	53746.207113
270813	DXY	300	1786719300	99.512986	99.550531	99.508489	99.544333
270994	SP500	300	1786719600	7787.687794	7792.767375	7787.687794	7789.641821
270995	DOW	300	1786719600	53744.567240	53793.239429	53739.141480	53783.527231
270996	DXY	300	1786719600	99.542363	99.556869	99.516351	99.540774
271177	SP500	300	1786719900	7789.440747	7792.895141	7787.203106	7788.532846
271178	DOW	300	1786719900	53785.579164	53794.075319	53741.776580	53741.776580
271179	DXY	300	1786719900	99.542961	99.553886	99.525054	99.535135
271360	SP500	300	1786720200	7788.407008	7789.768027	7785.791970	7786.341931
274823	DOW	300	1786725900	53731.910177	53737.912568	53711.142559	53719.401249
274824	DXY	300	1786725900	99.573302	99.587032	99.551490	99.567600
275544	DXY	300	1786727100	99.623713	99.648342	99.606196	99.617746
275362	SP500	300	1786726800	7778.085323	7780.588899	7777.469123	7779.726665
275363	DOW	300	1786726800	53672.044958	53702.231582	53670.834320	53692.852421
275364	DXY	300	1786726800	99.604120	99.629499	99.599665	99.621243
272086	SP500	300	1786721400	7784.622759	7786.018673	7780.849289	7782.892135
272087	DOW	300	1786721400	53737.845718	53763.792177	53728.508536	53736.370014
272088	DXY	300	1786721400	99.553551	99.591744	99.541376	99.572556
271720	SP500	300	1786720800	7787.866273	7788.865906	7781.630000	7782.112306
271721	DOW	300	1786720800	53749.174847	53752.379229	53729.660802	53744.451671
271722	DXY	300	1786720800	99.524948	99.544757	99.511606	99.529673
274093	SP500	300	1786724700	7787.135218	7790.583984	7786.582900	7788.400306
273184	SP500	300	1786723200	7783.304167	7787.815922	7782.852624	7786.777489
273185	DOW	300	1786723200	53688.977252	53713.949932	53686.064172	53709.654094
273186	DXY	300	1786723200	99.517503	99.535393	99.502137	99.531929
274094	DOW	300	1786724700	53721.542007	53734.050182	53706.291905	53722.810783
274095	DXY	300	1786724700	99.568673	99.580883	99.547094	99.554556
273910	SP500	300	1786724400	7787.828534	7789.232439	7785.132720	7787.360127
273911	DOW	300	1786724400	53729.524081	53741.023821	53716.909537	53722.356774
273912	DXY	300	1786724400	99.572678	99.589876	99.559824	99.569984
275182	SP500	300	1786726500	7780.600614	7781.935697	7777.386325	7777.931379
275183	DOW	300	1786726500	53711.741086	53715.041949	53670.741424	53672.042762
275184	DXY	300	1786726500	99.601629	99.610629	99.583603	99.604394
272635	SP500	300	1786722300	7781.620836	7786.821333	7779.527879	7781.542816
272636	DOW	300	1786722300	53722.731260	53734.059998	53691.586991	53702.376708
272637	DXY	300	1786722300	99.527205	99.531644	99.502374	99.518824
272452	SP500	300	1786722000	7783.420592	7783.592129	7779.454420	7781.554021
272453	DOW	300	1786722000	53748.087121	53750.021769	53704.190930	53723.043692
272454	DXY	300	1786722000	99.534439	99.545811	99.510179	99.524857
271903	SP500	300	1786721100	7781.999480	7784.774373	7780.510000	7784.774373
271904	DOW	300	1786721100	53742.427099	53751.630615	53722.596309	53736.277898
271905	DXY	300	1786721100	99.531011	99.558590	99.522441	99.555166
271362	DXY	300	1786720200	99.537301	99.548325	99.492345	99.511097
275002	SP500	300	1786726200	7782.083686	7782.948588	7779.514558	7780.797884
274459	SP500	300	1786725300	7784.629809	7787.597077	7783.996344	7786.483295
274460	DOW	300	1786725300	53731.500264	53746.350000	53723.000213	53740.876218
272818	SP500	300	1786722600	7781.717823	7784.773726	7779.126388	7783.741937
272819	DOW	300	1786722600	53701.063879	53711.161993	53681.081357	53689.753309
272820	DXY	300	1786722600	99.521029	99.548602	99.520055	99.541561
271540	SP500	300	1786720500	7786.586406	7788.568312	7785.265722	7787.635266
271541	DOW	300	1786720500	53741.797921	53759.061785	53730.916890	53749.355363
271542	DXY	300	1786720500	99.513582	99.532352	99.499473	99.526066
272269	SP500	300	1786721700	7782.988167	7786.513657	7782.395379	7783.186746
272270	DOW	300	1786721700	53734.660881	53752.388971	53721.985665	53749.446965
272271	DXY	300	1786721700	99.573559	99.584801	99.533809	99.534455
274461	DXY	300	1786725300	99.565984	99.598692	99.565984	99.598692
273544	SP500	300	1786723800	7783.316869	7787.560414	7782.907078	7787.462806
273545	DOW	300	1786723800	53706.479438	53723.435728	53689.088962	53718.187361
273546	DXY	300	1786723800	99.539988	99.561210	99.524696	99.553238
273364	SP500	300	1786723500	7786.536271	7787.178679	7782.686336	7783.174061
273365	DOW	300	1786723500	53710.212994	53725.337957	53698.245937	53705.003994
273001	SP500	300	1786722900	7783.665635	7785.316366	7781.590000	7783.161733
273002	DOW	300	1786722900	53691.487185	53706.470716	53683.901994	53690.493541
273003	DXY	300	1786722900	99.540908	99.542571	99.501961	99.515502
273366	DXY	300	1786723500	99.533556	99.553442	99.512012	99.541254
274276	SP500	300	1786725000	7788.166036	7789.441264	7783.842455	7784.869166
274277	DOW	300	1786725000	53722.425196	53739.301092	53716.358914	53731.587290
274278	DXY	300	1786725000	99.552913	99.572751	99.547255	99.568125
273727	SP500	300	1786724100	7787.740531	7789.665479	7786.138084	7787.683710
273728	DOW	300	1786724100	53717.536971	53748.861611	53716.273179	53729.321922
273729	DXY	300	1786724100	99.554386	99.573813	99.531933	99.571762
275003	DOW	300	1786726200	53717.306744	53724.750285	53686.580733	53710.322178
275004	DXY	300	1786726200	99.567083	99.609598	99.567036	99.599682
274642	SP500	300	1786725600	7786.372189	7787.499303	7782.677615	7784.166249
274643	DOW	300	1786725600	53741.015605	53756.142896	53729.261048	53733.449857
274644	DXY	300	1786725600	99.598227	99.607412	99.570169	99.575653
274822	SP500	300	1786725900	7784.241127	7784.442981	7781.257692	7782.116460
276268	SP500	300	1786728300	7780.075934	7782.536111	7777.139640	7778.818473
276269	DOW	300	1786728300	53720.119798	53738.753784	53714.888881	53730.221175
276085	SP500	300	1786728000	7780.570189	7783.282637	7779.563148	7780.314826
275722	SP500	300	1786727400	7779.485456	7783.031933	7779.180325	7781.543760
275723	DOW	300	1786727400	53690.972905	53729.407020	53690.439221	53715.903228
275542	SP500	300	1786727100	7780.015483	7781.991584	7778.503249	7779.672180
275543	DOW	300	1786727100	53691.201515	53710.388136	53688.893807	53693.098831
276086	DOW	300	1786728000	53723.828833	53744.621971	53711.950733	53719.759367
276087	DXY	300	1786728000	99.665720	99.676739	99.649634	99.668843
275902	SP500	300	1786727700	7781.507001	7783.232061	7779.786767	7780.587714
275724	DXY	300	1786727400	99.618835	99.642294	99.618006	99.630388
275903	DOW	300	1786727700	53715.994336	53729.650537	53702.247318	53724.555115
275904	DXY	300	1786727700	99.629400	99.666268	99.629400	99.663307
276270	DXY	300	1786728300	99.668860	99.687337	99.653943	99.673850
276451	SP500	300	1786728600	7778.899254	7781.599014	7778.659219	7780.403893
276452	DOW	300	1786728600	53731.017809	53737.912832	53714.305474	53733.068148
276453	DXY	300	1786728600	99.674817	99.693172	99.672071	99.684767
276634	SP500	300	1786728900	7780.276093	7780.725084	7775.860732	7776.940484
276635	DOW	300	1786728900	53731.673768	53732.859089	53687.851108	53707.600159
276636	DXY	300	1786728900	99.683713	99.697356	99.670285	99.671028
276817	SP500	300	1786729200	7777.214525	7778.475468	7775.621800	7777.130148
277182	DXY	300	1786729800	99.667492	99.687702	99.657586	99.670816
278816	DOW	300	1786732500	53772.791616	53784.899096	53762.719893	53782.768618
278817	DXY	300	1786732500	99.673836	99.679611	99.652437	99.656194
279000	DXY	300	1786732800	99.655660	99.683496	99.648922	99.683496
280640	DOW	300	1786735500	53768.897960	53784.915241	53758.137620	53761.188001
280641	DXY	300	1786735500	99.641419	99.665770	99.639610	99.653356
280096	SP500	300	1786734600	7783.975825	7784.409588	7781.339154	7782.687534
280097	DOW	300	1786734600	53770.525865	53785.209570	53751.173864	53764.152259
280098	DXY	300	1786734600	99.667149	99.671076	99.645304	99.665083
278632	SP500	300	1786732200	7781.026464	7783.844994	7778.792597	7779.104370
278633	DOW	300	1786732200	53772.413251	53784.417851	53764.417810	53772.960508
278634	DXY	300	1786732200	99.676925	99.688166	99.659510	99.672543
278083	SP500	300	1786731300	7784.341356	7785.722084	7782.242290	7783.371342
278084	DOW	300	1786731300	53760.688341	53788.588885	53760.574582	53764.720643
278085	DXY	300	1786731300	99.679165	99.683100	99.652059	99.657551
277900	SP500	300	1786731000	7781.577145	7785.225620	7781.229643	7784.415306
277901	DOW	300	1786731000	53747.112848	53779.223714	53741.176205	53760.628878
277360	SP500	300	1786730100	7778.488779	7781.509425	7777.274559	7779.512315
277361	DOW	300	1786730100	53707.936622	53739.137759	53707.936622	53736.664138
277362	DXY	300	1786730100	99.670059	99.690508	99.668796	99.670641
276818	DOW	300	1786729200	53709.032608	53709.910059	53684.423589	53705.794468
276819	DXY	300	1786729200	99.669160	99.685679	99.663366	99.666635
277902	DXY	300	1786731000	99.670886	99.689204	99.668397	99.678350
277720	SP500	300	1786730700	7782.110947	7783.567079	7779.773535	7781.394987
277721	DOW	300	1786730700	53746.096403	53757.625554	53728.032970	53748.447257
277722	DXY	300	1786730700	99.671488	99.685857	99.666010	99.668955
277000	SP500	300	1786729500	7777.026511	7779.509921	7776.872279	7777.889909
277001	DOW	300	1786729500	53707.576895	53719.220242	53695.145766	53699.791355
277002	DXY	300	1786729500	99.667519	99.682750	99.655668	99.666843
279181	SP500	300	1786733100	7783.877423	7784.686585	7781.278760	7783.395401
279182	DOW	300	1786733100	53785.006010	53804.210144	53764.457099	53792.677350
279183	DXY	300	1786733100	99.685026	99.687169	99.654880	99.665499
278266	SP500	300	1786731600	7783.101272	7785.319081	7781.952311	7784.096118
278267	DOW	300	1786731600	53763.426460	53780.371769	53756.250820	53776.319009
278268	DXY	300	1786731600	99.655311	99.688767	99.655006	99.684601
281553	DXY	300	1786737000	99.660954	99.664208	99.642748	99.651733
279730	SP500	300	1786734000	7782.981526	7785.583768	7780.860208	7781.515001
279731	DOW	300	1786734000	53794.138298	53800.446016	53765.394558	53775.047791
279732	DXY	300	1786734000	99.657242	99.675147	99.652207	99.654171
277540	SP500	300	1786730400	7779.365782	7782.774685	7778.390987	7782.388519
277541	DOW	300	1786730400	53736.097523	53758.218335	53715.188924	53743.969082
277542	DXY	300	1786730400	99.669379	99.695988	99.663753	99.672889
277180	SP500	300	1786729800	7777.990174	7780.472315	7775.285064	7778.767760
277181	DOW	300	1786729800	53701.779783	53720.090916	53699.714150	53708.791874
279913	SP500	300	1786734300	7781.571893	7784.223436	7780.003580	7783.994280
279914	DOW	300	1786734300	53774.937271	53777.400540	53749.083688	53768.582385
279915	DXY	300	1786734300	99.655353	99.676079	99.649496	99.664803
278449	SP500	300	1786731900	7784.122944	7784.670562	7779.759748	7781.127285
278450	DOW	300	1786731900	53775.879579	53783.185044	53763.953708	53773.079243
278451	DXY	300	1786731900	99.684247	99.691330	99.669698	99.677382
281002	SP500	300	1786736100	7783.591809	7784.949707	7781.202523	7782.148406
281003	DOW	300	1786736100	53772.863192	53775.804769	53737.982553	53748.312235
281004	DXY	300	1786736100	99.655610	99.659122	99.636933	99.645655
280459	SP500	300	1786735200	7781.344006	7783.749824	7780.085754	7783.749824
280460	DOW	300	1786735200	53766.992250	53780.366791	53752.301197	53770.157049
280461	DXY	300	1786735200	99.652105	99.669413	99.629628	99.640299
280279	SP500	300	1786734900	7782.581866	7783.950646	7780.577542	7781.505864
280280	DOW	300	1786734900	53762.666322	53780.074423	53752.606933	53766.751086
279547	SP500	300	1786733700	7786.224188	7786.485247	7782.149933	7783.059885
279364	SP500	300	1786733400	7783.614061	7787.349399	7783.004696	7786.223326
279365	DOW	300	1786733400	53793.480272	53819.819875	53793.480272	53813.524523
278815	SP500	300	1786732500	7779.342797	7783.390387	7779.342797	7783.390387
278998	SP500	300	1786732800	7783.619480	7784.853715	7779.948209	7783.787194
278999	DOW	300	1786732800	53783.433529	53788.285362	53766.143753	53786.776959
279366	DXY	300	1786733400	99.663488	99.672529	99.653804	99.666175
279548	DOW	300	1786733700	53813.248959	53813.958696	53787.786958	53795.912657
279549	DXY	300	1786733700	99.664280	99.677067	99.656243	99.657943
280281	DXY	300	1786734900	99.664408	99.682028	99.649961	99.652748
281552	DOW	300	1786737000	53746.085225	53749.390331	53715.820231	53719.224810
281551	SP500	300	1786737000	7783.838246	7786.324813	7782.796122	7784.922046
280639	SP500	300	1786735500	7783.776395	7785.384675	7782.211753	7783.759974
280819	SP500	300	1786735800	7783.999700	7784.595192	7781.799857	7783.709660
280820	DOW	300	1786735800	53761.768957	53775.430627	53753.649227	53773.977084
280821	DXY	300	1786735800	99.650989	99.664398	99.640383	99.653953
281185	SP500	300	1786736400	7782.050720	7784.973469	7781.835825	7782.733737
281186	DOW	300	1786736400	53746.920009	53771.018107	53746.920009	53754.321825
281187	DXY	300	1786736400	99.646517	99.662605	99.635981	99.641968
281368	SP500	300	1786736700	7782.988857	7784.556133	7780.696100	7784.057613
281369	DOW	300	1786736700	53752.594253	53756.326158	53730.401362	53747.584775
281370	DXY	300	1786736700	99.642591	99.672240	99.641245	99.662341
281734	SP500	300	1786737300	7785.203557	7785.213268	7779.038977	7783.375248
281735	DOW	300	1786737300	53718.645361	53724.727704	53701.099189	53722.424457
281736	DXY	300	1786737300	99.652951	99.669338	99.648868	99.651162
281917	SP500	300	1786737600	7783.581528	7787.127993	7783.519867	7785.741187
281918	DOW	300	1786737600	53723.194648	53742.237187	53718.531014	53730.888313
281919	DXY	300	1786737600	99.651910	99.665685	99.642640	99.652900
282100	SP500	300	1786737900	7786.003601	7787.082077	7784.557269	7786.530573
282101	DOW	300	1786737900	53731.051517	53740.309921	53718.652331	53731.686173
282102	DXY	300	1786737900	99.652561	99.671446	99.639890	99.662000
284662	SP500	300	1786742100	7785.500608	7787.321957	7784.538850	7785.200198
284663	DOW	300	1786742100	53732.612427	53743.111177	53723.064114	53732.342897
284664	DXY	300	1786742100	99.646580	99.648421	99.624829	99.638779
286293	DXY	300	1786744800	99.632201	99.645013	99.625271	99.634470
286108	SP500	300	1786744500	7785.696319	7787.270894	7784.427595	7786.141693
283930	SP500	300	1786740900	7785.282982	7787.345903	7784.471237	7784.471237
283931	DOW	300	1786740900	53727.952187	53741.092831	53721.085064	53729.384873
283932	DXY	300	1786740900	99.646160	99.656057	99.629320	99.646788
282283	SP500	300	1786738200	7786.274084	7787.320650	7784.758546	7786.752441
282284	DOW	300	1786738200	53733.765829	53743.603562	53721.532092	53735.779464
282285	DXY	300	1786738200	99.660832	99.663705	99.636561	99.643217
286109	DOW	300	1786744500	53740.467783	53740.467783	53721.054832	53736.236581
286110	DXY	300	1786744500	99.635318	99.644562	99.621578	99.634044
285748	SP500	300	1786743900	7785.579321	7786.991225	7784.415961	7786.866783
285749	DOW	300	1786743900	53741.488763	53744.500216	53721.469740	53731.438961
285750	DXY	300	1786743900	99.636942	99.647608	99.628463	99.644389
282832	SP500	300	1786739100	7785.651057	7787.520837	7784.657978	7785.197933
282833	DOW	300	1786739100	53736.653193	53741.632390	53719.960343	53729.483358
282834	DXY	300	1786739100	99.650544	99.662644	99.639417	99.657363
285568	SP500	300	1786743600	7784.540048	7787.478170	7784.392817	7785.305896
285569	DOW	300	1786743600	53731.005473	53741.097875	53721.653102	53739.947829
285208	SP500	300	1786743000	7784.924306	7787.307738	7784.578238	7785.889818
285209	DOW	300	1786743000	53726.964037	53742.905169	53716.792700	53723.689692
285210	DXY	300	1786743000	99.633658	99.645068	99.625746	99.625746
282466	SP500	300	1786738500	7786.639340	7786.887014	7784.102966	7786.617930
282467	DOW	300	1786738500	53736.608701	53745.113801	53723.324551	53729.415310
282468	DXY	300	1786738500	99.644580	99.660680	99.630534	99.640309
284296	SP500	300	1786741500	7786.244075	7787.117543	7784.265493	7786.086147
284297	DOW	300	1786741500	53726.683585	53744.429419	53723.368948	53732.922116
284298	DXY	300	1786741500	99.637804	99.652964	99.627798	99.639153
283381	SP500	300	1786740000	7785.751240	7786.673439	7784.000511	7785.877155
283382	DOW	300	1786740000	53732.320361	53742.338763	53720.108485	53735.398147
283383	DXY	300	1786740000	99.639686	99.650989	99.623239	99.643415
283564	SP500	300	1786740300	7786.112623	7786.867852	7784.346469	7785.792406
283565	DOW	300	1786740300	53734.748882	53741.635294	53719.626827	53725.930402
283566	DXY	300	1786740300	99.642672	99.660009	99.636478	99.643577
283198	SP500	300	1786739700	7786.773997	7787.241565	7784.493996	7785.662467
283199	DOW	300	1786739700	53730.960226	53743.471511	53721.735998	53732.276874
283200	DXY	300	1786739700	99.646474	99.655683	99.633866	99.641458
284479	SP500	300	1786741800	7786.074278	7787.386481	7784.656756	7785.407859
284480	DOW	300	1786741800	53731.774279	53738.173704	53724.601443	53733.161746
282649	SP500	300	1786738800	7786.420892	7787.003526	7784.345698	7785.514065
282650	DOW	300	1786738800	53730.914697	53742.190607	53720.354491	53734.669505
282651	DXY	300	1786738800	99.639714	99.659524	99.633810	99.651763
284481	DXY	300	1786741800	99.637749	99.646845	99.625544	99.644682
284113	SP500	300	1786741200	7784.258534	7787.225210	7783.934525	7786.551350
284114	DOW	300	1786741200	53729.756096	53746.110257	53722.615841	53725.756712
284115	DXY	300	1786741200	99.648492	99.653790	99.635674	99.636323
283747	SP500	300	1786740600	7785.797228	7786.688437	7783.992223	7785.307108
283748	DOW	300	1786740600	53724.854213	53742.540335	53723.822131	53727.289956
283015	SP500	300	1786739400	7785.361951	7787.596326	7784.209868	7786.755359
283016	DOW	300	1786739400	53730.977231	53738.241329	53726.065057	53731.175198
283017	DXY	300	1786739400	99.656376	99.659779	99.636428	99.645482
283749	DXY	300	1786740600	99.644327	99.657656	99.639131	99.644129
285570	DXY	300	1786743600	99.637956	99.652594	99.627068	99.634840
285388	SP500	300	1786743300	7785.851094	7787.165898	7784.507657	7784.685462
285389	DOW	300	1786743300	53721.628281	53742.775539	53721.628281	53731.845164
285390	DXY	300	1786743300	99.626238	99.647049	99.625086	99.640440
284845	SP500	300	1786742400	7785.338826	7787.832253	7784.106411	7785.553529
284846	DOW	300	1786742400	53731.455356	53741.936265	53716.008170	53725.641035
284847	DXY	300	1786742400	99.638480	99.645026	99.626073	99.640345
285028	SP500	300	1786742700	7785.677226	7787.308584	7783.946838	7784.638047
285029	DOW	300	1786742700	53727.627368	53739.783141	53724.625702	53727.786625
285030	DXY	300	1786742700	99.640886	99.643515	99.626535	99.633013
286476	DXY	300	1786745100	99.636077	99.651024	99.625393	99.630947
285928	SP500	300	1786744200	7786.888156	7787.239015	7784.452561	7785.501118
285929	DOW	300	1786744200	53729.559549	53744.357792	53720.669620	53738.938839
286840	SP500	300	1786745700	7785.514815	7787.455552	7784.883493	7785.796292
286841	DOW	300	1786745700	53730.831614	53743.370136	53723.347098	53727.661728
285930	DXY	300	1786744200	99.646784	99.649806	99.617295	99.634135
286657	SP500	300	1786745400	7785.273236	7786.941352	7784.556748	7785.473501
286842	DXY	300	1786745700	99.638089	99.645800	99.624875	99.641929
287023	SP500	300	1786746000	7785.716079	7787.062557	7784.251245	7786.060629
286291	SP500	300	1786744800	7786.357463	7786.700731	7784.395374	7784.967038
286292	DOW	300	1786744800	53735.540702	53744.155620	53725.933750	53729.724541
287024	DOW	300	1786746000	53728.021017	53738.448483	53723.279827	53729.053680
286474	SP500	300	1786745100	7785.150218	7787.426444	7784.457921	7785.429650
286475	DOW	300	1786745100	53730.362073	53740.059651	53725.831288	53730.939723
286658	DOW	300	1786745400	53730.294213	53741.340554	53721.401091	53732.727652
286659	DXY	300	1786745400	99.628617	99.646557	99.627513	99.639524
287025	DXY	300	1786746000	99.644362	99.645878	99.625850	99.633290
287206	SP500	300	1786746300	7786.062315	7787.299380	7784.664971	7785.562552
287207	DOW	300	1786746300	53727.381768	53741.660978	53720.642546	53726.867332
287208	DXY	300	1786746300	99.633240	99.648570	99.628525	99.638659
287389	SP500	300	1786746600	7785.436280	7786.907536	7783.871822	7786.134841
287390	DOW	300	1786746600	53727.301098	53741.430658	53725.935497	53741.430658
287391	DXY	300	1786746600	99.636319	99.648392	99.623300	99.637861
287572	SP500	300	1786746900	7786.149750	7786.950605	7784.655559	7786.945048
287573	DOW	300	1786746900	53741.909893	53742.110387	53725.188021	53731.831396
292674	DXY	300	1786755300	99.635848	99.646120	99.623994	99.638616
288295	SP500	300	1786748100	7786.455052	7787.525430	7784.722250	7786.151657
288296	DOW	300	1786748100	53730.057381	53741.034760	53720.996372	53730.612257
288297	DXY	300	1786748100	99.648307	99.648307	99.622408	99.636620
289390	SP500	300	1786749900	7785.044660	7787.295554	7784.250182	7785.991693
289391	DOW	300	1786749900	53731.745415	53744.908057	53720.060165	53735.492860
289392	DXY	300	1786749900	99.627252	99.645708	99.622798	99.638037
287935	SP500	300	1786747500	7785.600912	7787.318847	7783.993338	7785.809579
287936	DOW	300	1786747500	53734.702418	53742.626373	53722.854710	53736.802316
287937	DXY	300	1786747500	99.635414	99.646787	99.624664	99.626693
290659	SP500	300	1786752000	7786.111725	7786.866227	7783.764885	7785.904683
290110	SP500	300	1786751100	7785.070743	7787.350887	7784.805936	7786.481497
290111	DOW	300	1786751100	53730.352351	53743.780084	53725.014375	53734.732301
290112	DXY	300	1786751100	99.641142	99.646180	99.621376	99.644675
290660	DOW	300	1786752000	53732.189618	53744.478585	53725.475171	53731.185837
290661	DXY	300	1786752000	99.642600	99.647370	99.624732	99.630565
290476	SP500	300	1786751700	7786.731786	7787.460416	7784.218537	7786.197918
290477	DOW	300	1786751700	53721.764248	53742.086602	53719.928599	53734.312950
288841	SP500	300	1786749000	7786.684652	7787.224579	7784.283363	7785.773098
288842	DOW	300	1786749000	53731.719766	53745.396810	53720.055464	53737.867489
288843	DXY	300	1786749000	99.642726	99.650741	99.629122	99.637710
288658	SP500	300	1786748700	7786.466795	7787.033592	7784.939747	7786.792185
288659	DOW	300	1786748700	53732.320176	53742.692346	53722.994938	53733.685149
288660	DXY	300	1786748700	99.637296	99.653256	99.628720	99.644151
290478	DXY	300	1786751700	99.633528	99.647057	99.626723	99.641589
288115	SP500	300	1786747800	7785.758453	7787.064553	7784.150618	7786.275746
288116	DOW	300	1786747800	53737.908181	53742.481871	53719.544377	53731.157765
288117	DXY	300	1786747800	99.625413	99.646143	99.624741	99.646143
289750	SP500	300	1786750500	7785.534274	7786.926524	7783.499413	7785.865345
289024	SP500	300	1786749300	7785.621614	7787.141597	7784.773256	7786.425656
289025	DOW	300	1786749300	53738.023744	53740.820441	53723.290105	53737.824002
289026	DXY	300	1786749300	99.639392	99.644037	99.625685	99.641646
287574	DXY	300	1786746900	99.636213	99.652721	99.624291	99.632160
289751	DOW	300	1786750500	53724.807142	53744.149738	53722.289935	53726.129877
288475	SP500	300	1786748400	7786.315231	7787.179558	7784.596309	7786.450595
288476	DOW	300	1786748400	53730.699269	53743.054061	53722.428782	53731.183671
288477	DXY	300	1786748400	99.637273	99.647921	99.624782	99.635678
289752	DXY	300	1786750500	99.637239	99.649299	99.624571	99.625188
287755	SP500	300	1786747200	7787.066451	7787.391547	7784.794326	7785.910385
287756	DOW	300	1786747200	53731.309807	53743.751830	53725.339252	53732.738783
287757	DXY	300	1786747200	99.629747	99.649025	99.626799	99.636445
292489	SP500	300	1786755000	7786.494743	7786.684295	7784.808584	7785.291218
292490	DOW	300	1786755000	53725.510704	53743.579070	53721.174924	53733.234900
292306	SP500	300	1786754700	7786.487432	7786.994175	7784.524280	7786.667232
289570	SP500	300	1786750200	7786.100208	7787.208428	7784.261070	7785.305979
289571	DOW	300	1786750200	53735.040014	53743.409397	53721.190170	53723.470664
289207	SP500	300	1786749600	7786.221142	7786.638134	7784.646408	7784.931347
289208	DOW	300	1786749600	53738.452132	53740.053960	53723.996136	53733.305369
289209	DXY	300	1786749600	99.643497	99.645600	99.626028	99.627948
289572	DXY	300	1786750200	99.637607	99.645681	99.628614	99.637151
289930	SP500	300	1786750800	7785.971959	7787.070709	7783.992391	7785.369439
289931	DOW	300	1786750800	53726.034580	53740.351731	53724.132415	53732.340676
289932	DXY	300	1786750800	99.623946	99.645031	99.618661	99.640566
292307	DOW	300	1786754700	53732.515099	53741.654005	53722.769651	53727.454287
292308	DXY	300	1786754700	99.642205	99.646921	99.629072	99.632539
291391	SP500	300	1786753200	7786.118593	7787.200246	7784.025723	7785.870949
291208	SP500	300	1786752900	7784.519985	7787.159714	7783.796848	7785.875925
291209	DOW	300	1786752900	53726.470996	53738.346491	53722.675131	53733.863543
291210	DXY	300	1786752900	99.631760	99.649891	99.623505	99.638405
290842	SP500	300	1786752300	7785.692932	7786.907710	7784.562691	7785.296320
290843	DOW	300	1786752300	53731.573208	53739.534028	53717.804891	53730.169165
290844	DXY	300	1786752300	99.628242	99.647601	99.623913	99.623913
291392	DOW	300	1786753200	53732.085154	53740.589098	53721.547292	53721.547292
291393	DXY	300	1786753200	99.638849	99.647716	99.626056	99.631571
290293	SP500	300	1786751400	7786.415422	7787.601385	7784.395023	7786.516083
290294	DOW	300	1786751400	53734.078938	53740.409489	53721.081458	53722.007767
290295	DXY	300	1786751400	99.643501	99.649247	99.627824	99.635714
291025	SP500	300	1786752600	7785.560887	7786.924538	7783.802919	7784.720103
291026	DOW	300	1786752600	53731.499332	53742.328604	53719.208311	53728.395508
291027	DXY	300	1786752600	99.624477	99.652984	99.622477	99.633053
291574	SP500	300	1786753500	7785.560428	7787.527762	7784.148816	7785.903039
291575	DOW	300	1786753500	53721.139876	53747.202182	53721.139876	53732.907467
291576	DXY	300	1786753500	99.632022	99.644171	99.624600	99.628935
291757	SP500	300	1786753800	7786.195557	7786.966497	7784.654904	7786.966497
291758	DOW	300	1786753800	53732.286840	53743.618409	53720.436105	53735.936254
291759	DXY	300	1786753800	99.629684	99.645886	99.626966	99.639357
292123	SP500	300	1786754400	7786.184986	7786.666887	7784.684954	7786.221413
292124	DOW	300	1786754400	53734.921017	53742.769303	53722.993325	53731.432015
292125	DXY	300	1786754400	99.633635	99.646523	99.623862	99.643414
291940	SP500	300	1786754100	7787.040031	7787.281452	7784.798149	7786.083918
291941	DOW	300	1786754100	53735.429660	53739.856821	53721.014934	53734.840070
291942	DXY	300	1786754100	99.639105	99.648632	99.629273	99.635877
292491	DXY	300	1786755000	99.631081	99.643646	99.622884	99.635512
292854	DXY	300	1786755600	99.639364	99.644821	99.623709	99.630057
292672	SP500	300	1786755300	7785.400338	7786.847209	7783.667769	7786.423275
292673	DOW	300	1786755300	53734.397871	53740.159079	53722.959040	53734.433622
293032	SP500	300	1786755900	7786.707903	7786.913969	7784.761855	7786.180238
292852	SP500	300	1786755600	7786.701107	7786.983732	7783.836943	7786.983732
292853	DOW	300	1786755600	53732.339821	53742.414231	53722.848344	53733.148452
297921	DXY	300	1786763700	99.669996	99.682244	99.659873	99.672320
295033	SP500	300	1786759200	7786.238178	7787.473223	7784.479559	7785.803268
295034	DOW	300	1786759200	53732.738122	53740.918712	53719.850490	53735.069628
295035	DXY	300	1786759200	99.632710	99.644483	99.625831	99.641547
297370	SP500	300	1786762800	7784.720804	7786.873823	7784.247767	7785.479546
296674	SP500	300	1786761900	7784.223637	7787.231513	7784.042012	7786.451792
296308	SP500	300	1786761300	7786.605184	7787.273060	7784.093898	7785.015152
296309	DOW	300	1786761300	53732.866132	53740.330459	53722.017097	53727.311603
296310	DXY	300	1786761300	99.634599	99.646341	99.626341	99.635801
295396	SP500	300	1786759800	7784.923381	7786.995409	7784.665022	7785.119009
295397	DOW	300	1786759800	53729.181664	53741.957694	53723.249855	53731.341352
295398	DXY	300	1786759800	99.625829	99.651555	99.624708	99.633904
294850	SP500	300	1786758900	7786.651042	7787.229836	7784.251354	7786.246966
294851	DOW	300	1786758900	53735.193587	53740.405520	53723.351959	53731.515568
294852	DXY	300	1786758900	99.629580	99.646674	99.627171	99.633734
294301	SP500	300	1786758000	7784.491129	7786.755205	7784.491129	7785.989770
294302	DOW	300	1786758000	53722.140233	53746.524289	53722.140233	53732.191299
293572	SP500	300	1786756800	7786.281100	7787.266580	7784.585739	7785.666419
293573	DOW	300	1786756800	53728.000246	53741.050316	53721.871752	53733.296046
293574	DXY	300	1786756800	99.630850	99.645350	99.616837	99.637428
294303	DXY	300	1786758000	99.635066	99.647965	99.626596	99.630312
294118	SP500	300	1786757700	7786.207969	7786.876601	7784.143393	7784.613643
293033	DOW	300	1786755900	53732.569868	53741.035809	53721.243634	53729.151460
293034	DXY	300	1786755900	99.631016	99.645070	99.622921	99.636114
294119	DOW	300	1786757700	53732.166430	53740.423597	53721.458990	53722.110941
294120	DXY	300	1786757700	99.644818	99.644818	99.628126	99.636080
296675	DOW	300	1786761900	53733.004718	53743.072210	53723.095019	53732.185981
293935	SP500	300	1786757400	7786.400749	7786.733356	7784.412065	7786.050352
293936	DOW	300	1786757400	53721.604831	53740.591307	53721.349032	53731.508876
293937	DXY	300	1786757400	99.635400	99.644108	99.618922	99.643528
293212	SP500	300	1786756200	7786.483929	7786.782120	7783.944888	7786.128147
293213	DOW	300	1786756200	53727.154941	53742.333863	53720.640491	53738.517084
293214	DXY	300	1786756200	99.638034	99.648736	99.619537	99.627166
296676	DXY	300	1786761900	99.636523	99.646521	99.626161	99.641328
294484	SP500	300	1786758300	7785.912026	7786.781262	7784.204932	7786.067960
294485	DOW	300	1786758300	53731.118163	53740.987201	53722.038648	53730.190074
294486	DXY	300	1786758300	99.632197	99.646489	99.620298	99.636566
295942	SP500	300	1786760700	7785.640688	7787.135382	7784.110710	7785.757680
295943	DOW	300	1786760700	53731.086006	53743.815220	53722.328491	53730.341912
295944	DXY	300	1786760700	99.624266	99.648395	99.624266	99.634252
296125	SP500	300	1786761000	7785.708212	7786.967183	7784.378253	7786.321937
296126	DOW	300	1786761000	53732.053551	53740.960217	53724.807872	53732.289633
296127	DXY	300	1786761000	99.636503	99.649296	99.626059	99.634442
293752	SP500	300	1786757100	7785.656725	7787.197240	7784.960732	7786.404352
293753	DOW	300	1786757100	53731.886246	53741.528312	53719.129946	53722.033295
293754	DXY	300	1786757100	99.635199	99.646651	99.622872	99.635753
293392	SP500	300	1786756500	7786.116300	7787.018195	7784.389770	7786.084066
293393	DOW	300	1786756500	53737.229294	53740.760091	53724.987072	53728.075993
293394	DXY	300	1786756500	99.629048	99.645538	99.623866	99.628555
297371	DOW	300	1786762800	53730.661869	53744.564261	53726.324457	53742.762858
294667	SP500	300	1786758600	7786.296068	7787.341194	7784.242439	7786.953711
294668	DOW	300	1786758600	53730.244780	53741.072999	53719.049274	53734.517710
294669	DXY	300	1786758600	99.638444	99.648757	99.624056	99.629489
297372	DXY	300	1786762800	99.627590	99.649564	99.623620	99.639334
295576	SP500	300	1786760100	7785.227744	7786.911442	7784.070526	7784.526248
295577	DOW	300	1786760100	53732.168035	53740.092825	53722.434992	53733.510420
295578	DXY	300	1786760100	99.635319	99.646695	99.623914	99.631231
295759	SP500	300	1786760400	7784.427313	7787.222211	7784.415807	7785.878341
295760	DOW	300	1786760400	53732.102216	53740.677314	53721.491827	53729.946835
295761	DXY	300	1786760400	99.632788	99.647555	99.623018	99.625863
295216	SP500	300	1786759500	7785.633359	7786.887380	7783.902670	7784.792534
295217	DOW	300	1786759500	53733.060358	53743.237434	53722.009165	53727.102689
295218	DXY	300	1786759500	99.641071	99.645413	99.625286	99.628101
297920	DOW	300	1786763700	53728.754413	53743.200026	53726.058719	53738.094309
297187	SP500	300	1786762500	7786.075652	7787.759994	7784.130419	7784.629316
296491	SP500	300	1786761600	7785.211048	7787.160932	7784.451604	7784.451604
296492	DOW	300	1786761600	53727.773195	53740.351299	53723.193758	53731.641972
296493	DXY	300	1786761600	99.633952	99.647730	99.626234	99.637215
297188	DOW	300	1786762500	53727.137288	53744.168849	53722.912364	53732.683638
297189	DXY	300	1786762500	99.633799	99.646450	99.626698	99.629033
297004	SP500	300	1786762200	7786.216680	7786.747160	7783.569133	7786.244312
297005	DOW	300	1786762200	53730.746399	53741.016973	53721.004090	53727.497766
297006	DXY	300	1786762200	99.641384	99.646290	99.624334	99.634034
297919	SP500	300	1786763700	7784.589876	7787.321896	7784.191016	7785.982827
297553	SP500	300	1786763100	7785.209970	7787.289123	7784.273804	7785.303892
297554	DOW	300	1786763100	53741.858592	53743.545780	53723.717556	53737.010011
297555	DXY	300	1786763100	99.637592	99.648901	99.626197	99.628734
297736	SP500	300	1786763400	7785.500641	7786.867350	7784.360784	7784.487664
297737	DOW	300	1786763400	53735.212556	53741.677623	53723.508950	53728.794620
297738	DXY	300	1786763400	99.631063	99.677635	99.626579	99.670151
298102	SP500	300	1786764000	7786.097714	7787.022580	7784.516191	7785.568710
298103	DOW	300	1786764000	53739.183988	53742.785826	53721.988470	53732.227103
298104	DXY	300	1786764000	99.672248	99.673076	99.626248	99.635994
298285	SP500	300	1786764300	7785.344335	7787.470836	7783.508496	7786.050476
298286	DOW	300	1786764300	53731.549728	53741.053378	53725.631125	53731.073446
298287	DXY	300	1786764300	99.633858	99.643585	99.623296	99.633299
298468	SP500	300	1786764600	7785.995402	7786.599462	7784.379266	7784.595721
298469	DOW	300	1786764600	53729.012443	53744.945980	53724.398228	53744.258076
298470	DXY	300	1786764600	99.635301	99.650851	99.626377	99.635312
303207	DXY	300	1786772400	99.632402	99.649751	99.621172	99.626245
300292	SP500	300	1786767600	7785.826368	7787.046507	7784.251793	7785.315783
300293	DOW	300	1786767600	53741.411208	53745.689645	53721.250426	53737.827772
300294	DXY	300	1786767600	99.636263	99.651880	99.628279	99.635663
302845	SP500	300	1786771800	7785.344199	7787.732551	7784.754883	7786.512780
302846	DOW	300	1786771800	53732.277608	53745.244854	53723.837425	53732.831001
302847	DXY	300	1786771800	99.638691	99.650053	99.627965	99.631034
302665	SP500	300	1786771500	7786.658205	7786.884024	7784.053303	7785.328559
302666	DOW	300	1786771500	53732.867896	53742.848147	53726.525520	53733.978177
298651	SP500	300	1786764900	7784.402555	7787.094584	7784.014490	7784.837005
298652	DOW	300	1786764900	53742.729230	53744.102881	53720.381032	53735.467394
298653	DXY	300	1786764900	99.633943	99.645253	99.628186	99.634656
302667	DXY	300	1786771500	99.637871	99.642842	99.626652	99.636645
302485	SP500	300	1786771200	7786.116994	7787.665747	7784.450183	7786.778148
302486	DOW	300	1786771200	53740.458213	53744.694871	53725.206914	53733.839652
302487	DXY	300	1786771200	99.636882	99.648018	99.623406	99.638255
302305	SP500	300	1786770900	7785.024562	7786.949817	7783.720198	7786.101416
302306	DOW	300	1786770900	53727.287624	53738.606001	53724.584279	53738.309264
299200	SP500	300	1786765800	7784.687614	7787.002496	7784.521791	7785.407839
299201	DOW	300	1786765800	53733.816378	53745.538671	53722.449187	53734.890300
299202	DXY	300	1786765800	99.640641	99.646877	99.620720	99.637995
302307	DXY	300	1786770900	99.631245	99.649033	99.627563	99.637026
300658	SP500	300	1786768200	7785.821005	7787.966054	7784.898796	7785.187608
300659	DOW	300	1786768200	53724.620889	53741.508169	53721.006164	53728.207129
300660	DXY	300	1786768200	99.639399	99.653934	99.619347	99.635467
298834	SP500	300	1786765200	7784.753816	7787.709429	7784.187782	7785.699793
298835	DOW	300	1786765200	53735.030403	53739.767799	53720.434358	53731.565655
298836	DXY	300	1786765200	99.634618	99.646360	99.628493	99.639609
299743	SP500	300	1786766700	7786.568940	7786.792317	7784.434282	7785.685846
299744	DOW	300	1786766700	53733.513205	53743.673254	53724.294849	53731.093796
299745	DXY	300	1786766700	99.628962	99.649630	99.622971	99.641228
299926	SP500	300	1786767000	7785.858546	7786.795571	7784.334163	7785.698691
299927	DOW	300	1786767000	53731.149431	53742.073190	53722.465352	53728.765990
299928	DXY	300	1786767000	99.640866	99.651017	99.630624	99.634949
299560	SP500	300	1786766400	7785.511448	7786.836095	7784.601705	7786.483753
299561	DOW	300	1786766400	53727.279862	53741.839640	53721.805518	53733.271351
299562	DXY	300	1786766400	99.633329	99.644198	99.625816	99.631331
301573	SP500	300	1786769700	7786.101472	7786.957055	7783.854793	7785.518406
301574	DOW	300	1786769700	53735.977172	53740.551516	53722.957337	53729.159878
300841	SP500	300	1786768500	7784.881986	7787.496164	7784.256610	7785.363250
300842	DOW	300	1786768500	53726.913787	53743.217568	53721.105633	53731.112430
300843	DXY	300	1786768500	99.635636	99.643692	99.624186	99.635308
300475	SP500	300	1786767900	7785.463597	7786.669925	7783.944469	7785.699730
300476	DOW	300	1786767900	53738.478910	53742.800208	53725.123037	53725.547949
300477	DXY	300	1786767900	99.636060	99.639931	99.622959	99.637655
300109	SP500	300	1786767300	7785.708115	7786.840573	7784.374627	7785.527804
299017	SP500	300	1786765500	7785.604873	7787.346813	7784.442086	7784.755168
299018	DOW	300	1786765500	53731.469910	53744.527218	53723.828882	53734.278986
299019	DXY	300	1786765500	99.640951	99.649336	99.624625	99.638520
300110	DOW	300	1786767300	53727.767317	53742.887174	53724.985133	53739.742597
299380	SP500	300	1786766100	7785.409888	7787.180660	7784.263012	7785.656378
299381	DOW	300	1786766100	53733.600404	53741.103873	53721.282540	53728.789284
299382	DXY	300	1786766100	99.638183	99.645320	99.625724	99.630923
300111	DXY	300	1786767300	99.636076	99.643630	99.627296	99.636971
301575	DXY	300	1786769700	99.629163	99.646793	99.615500	99.634034
301207	SP500	300	1786769100	7785.602293	7787.153407	7784.515596	7786.150505
301208	DOW	300	1786769100	53728.874362	53736.314094	53722.991540	53727.980493
301209	DXY	300	1786769100	99.635697	99.647762	99.628456	99.638228
301939	SP500	300	1786770300	7785.538491	7787.263519	7784.890560	7785.268641
301940	DOW	300	1786770300	53734.458647	53745.375053	53722.497671	53739.904762
301024	SP500	300	1786768800	7785.512947	7786.718010	7784.768270	7785.454730
301025	DOW	300	1786768800	53729.154365	53740.443150	53724.219885	53728.715099
301026	DXY	300	1786768800	99.635105	99.647527	99.622682	99.634723
301756	SP500	300	1786770000	7785.380029	7787.570406	7784.518552	7785.275406
301390	SP500	300	1786769400	7786.140589	7787.093150	7784.387636	7786.066506
301391	DOW	300	1786769400	53726.480214	53741.380825	53722.335068	53736.237442
301757	DOW	300	1786770000	53730.667235	53741.029985	53719.808988	53732.408028
301758	DXY	300	1786770000	99.632165	99.648855	99.624599	99.641723
301392	DXY	300	1786769400	99.640344	99.645008	99.623961	99.629783
301941	DXY	300	1786770300	99.642568	99.644533	99.626138	99.633032
302122	SP500	300	1786770600	7785.345743	7787.336184	7784.595200	7784.985082
302123	DOW	300	1786770600	53741.535603	53741.535603	53724.773092	53727.808264
302124	DXY	300	1786770600	99.631117	99.645388	99.625861	99.632810
303387	DXY	300	1786772700	99.625745	99.648065	99.624962	99.632202
303025	SP500	300	1786772100	7786.784761	7787.308615	7784.376948	7785.284014
303205	SP500	300	1786772400	7785.225187	7787.286715	7784.139044	7785.759873
303026	DOW	300	1786772100	53733.245956	53740.593828	53721.787360	53733.150280
303027	DXY	300	1786772100	99.633211	99.648164	99.625964	99.633173
303206	DOW	300	1786772400	53731.779793	53740.436801	53722.739724	53732.447507
303567	DXY	300	1786773000	99.632897	99.649775	99.625762	99.630479
303385	SP500	300	1786772700	7785.798713	7787.763161	7784.222116	7786.149729
303386	DOW	300	1786772700	53733.024292	53742.732681	53722.581439	53731.838333
303747	DXY	300	1786773300	99.629606	99.644274	99.626310	99.632158
303565	SP500	300	1786773000	7786.123962	7787.723308	7784.322313	7785.303599
303566	DOW	300	1786773000	53733.042234	53742.994520	53726.884737	53727.855628
303745	SP500	300	1786773300	7785.448050	7787.329451	7784.074413	7785.235327
303746	DOW	300	1786773300	53727.420314	53740.725469	53720.996235	53740.238351
303925	SP500	300	1786773600	7785.514023	7787.631316	7784.601290	7786.473032
303926	DOW	300	1786773600	53739.082517	53742.998327	53720.802326	53731.021558
306304	SP500	300	1786777500	7785.768316	7787.114729	7784.534723	7785.675565
306305	DOW	300	1786777500	53729.829773	53739.933379	53718.917946	53729.901011
306306	DXY	300	1786777500	99.633159	99.645977	99.627818	99.637087
307747	SP500	300	1786779900	7786.316340	7787.764507	7784.331471	7786.120827
307748	DOW	300	1786779900	53734.467470	53743.373715	53721.346013	53727.032484
307749	DXY	300	1786779900	99.625612	99.646201	99.624517	99.635931
307567	SP500	300	1786779600	7785.430459	7786.909700	7784.145241	7786.250295
307568	DOW	300	1786779600	53729.959875	53745.248887	53725.829419	53734.893417
307569	DXY	300	1786779600	99.631780	99.646983	99.619492	99.627772
304657	SP500	300	1786774800	7785.951205	7787.442152	7784.997997	7786.226494
304658	DOW	300	1786774800	53737.466336	53744.853641	53724.418213	53725.986706
304659	DXY	300	1786774800	99.633736	99.645944	99.625307	99.633971
304291	SP500	300	1786774200	7785.180143	7786.979186	7784.284746	7786.506508
304292	DOW	300	1786774200	53736.906224	53742.626895	53715.510072	53736.382899
304293	DXY	300	1786774200	99.632749	99.646690	99.625149	99.638791
307027	SP500	300	1786778700	7785.714820	7786.981160	7784.332703	7785.116234
307028	DOW	300	1786778700	53726.690383	53738.847571	53721.358895	53738.407417
306667	SP500	300	1786778100	7786.517489	7787.146867	7784.228492	7786.359794
305755	SP500	300	1786776600	7785.598263	7786.658748	7783.768961	7786.280637
305756	DOW	300	1786776600	53734.338214	53743.175057	53723.783716	53731.044393
305757	DXY	300	1786776600	99.640671	99.646902	99.612116	99.629410
306668	DOW	300	1786778100	53735.707729	53742.257879	53725.810863	53729.973167
306669	DXY	300	1786778100	99.661810	99.676574	99.657323	99.676212
307029	DXY	300	1786778700	99.639230	99.647015	99.623093	99.634336
306487	SP500	300	1786777800	7785.416758	7787.276008	7784.060140	7786.468771
306488	DOW	300	1786777800	53728.310080	53740.359289	53718.954226	53735.365652
306489	DXY	300	1786777800	99.639565	99.682263	99.629197	99.663588
305206	SP500	300	1786775700	7785.371276	7787.055732	7784.666885	7785.572860
305207	DOW	300	1786775700	53736.069425	53743.096754	53720.904638	53734.766616
305208	DXY	300	1786775700	99.638053	99.646935	99.625825	99.628475
305023	SP500	300	1786775400	7785.827668	7787.203144	7784.767067	7785.622480
305024	DOW	300	1786775400	53731.860235	53738.389820	53723.968385	53734.291851
305025	DXY	300	1786775400	99.626934	99.651151	99.624521	99.637147
304474	SP500	300	1786774500	7786.305364	7786.955812	7784.801078	7786.165370
304475	DOW	300	1786774500	53737.688914	53742.164240	53722.602988	53738.390684
304476	DXY	300	1786774500	99.640630	99.648117	99.622075	99.635586
303927	DXY	300	1786773600	99.632755	99.651051	99.624528	99.637234
305389	SP500	300	1786776000	7785.318371	7787.314572	7784.334877	7784.747452
305390	DOW	300	1786776000	53732.980376	53739.532313	53719.981641	53728.818434
305391	DXY	300	1786776000	99.627598	99.646457	99.624412	99.628379
304108	SP500	300	1786773900	7786.533157	7787.184181	7784.379693	7785.443117
304109	DOW	300	1786773900	53731.293378	53743.888843	53724.196618	53736.961427
304110	DXY	300	1786773900	99.637476	99.645356	99.621363	99.632178
304840	SP500	300	1786775100	7786.134662	7786.664075	7784.335826	7785.862318
304841	DOW	300	1786775100	53725.397870	53742.014651	53714.923910	53733.752045
304842	DXY	300	1786775100	99.635492	99.650848	99.625321	99.626110
306847	SP500	300	1786778400	7786.250991	7786.824057	7784.614301	7785.994665
306848	DOW	300	1786778400	53730.991720	53743.324117	53722.796141	53728.709544
306849	DXY	300	1786778400	99.677902	99.681756	99.622934	99.641241
306121	SP500	300	1786777200	7787.306709	7787.390812	7784.165121	7785.486322
306122	DOW	300	1786777200	53732.909826	53738.377104	53720.170820	53729.497105
306123	DXY	300	1786777200	99.638178	99.646486	99.625981	99.635404
305572	SP500	300	1786776300	7784.762815	7787.001770	7784.058398	7785.732929
305573	DOW	300	1786776300	53728.700215	53741.513411	53725.056348	53733.754255
305574	DXY	300	1786776300	99.626914	99.652720	99.621166	99.642877
305938	SP500	300	1786776900	7786.537053	7787.240969	7784.749298	7786.997673
309388	SP500	300	1786782600	7785.328536	7787.335395	7784.090074	7784.740327
305939	DOW	300	1786776900	53730.067763	53742.275153	53721.457717	53733.284553
305940	DXY	300	1786776900	99.628432	99.644917	99.625672	99.640667
308839	SP500	300	1786781700	7785.059461	7787.441681	7784.370852	7786.346969
308840	DOW	300	1786781700	53728.241424	53746.051561	53718.150988	53730.543223
308656	SP500	300	1786781400	7785.041330	7787.148365	7784.284454	7785.256946
307207	SP500	300	1786779000	7784.833453	7787.237380	7784.204734	7786.142076
307208	DOW	300	1786779000	53737.382646	53742.866388	53722.942458	53738.570321
307209	DXY	300	1786779000	99.634960	99.645564	99.623568	99.635505
308657	DOW	300	1786781400	53728.730530	53740.839321	53720.021287	53730.056799
308658	DXY	300	1786781400	99.629832	99.645249	99.618741	99.643140
307387	SP500	300	1786779300	7786.359794	7787.695064	7783.893566	7785.620158
307388	DOW	300	1786779300	53740.510134	53740.510134	53722.593679	53731.029848
307389	DXY	300	1786779300	99.634159	99.643640	99.626295	99.630201
308473	SP500	300	1786781100	7784.943488	7787.554456	7783.781559	7784.791040
308474	DOW	300	1786781100	53730.493171	53741.888936	53723.421163	53730.138788
308475	DXY	300	1786781100	99.634207	99.646223	99.626561	99.631131
308107	SP500	300	1786780500	7785.113726	7787.550228	7783.938620	7786.643390
308108	DOW	300	1786780500	53736.280979	53742.389260	53721.725892	53721.725892
307927	SP500	300	1786780200	7786.245724	7787.244913	7784.029513	7785.083603
308109	DXY	300	1786780500	99.636537	99.647832	99.628079	99.639737
308290	SP500	300	1786780800	7786.616062	7787.264854	7785.100253	7785.227995
307928	DOW	300	1786780200	53727.542969	53740.232079	53722.397297	53734.514776
308291	DOW	300	1786780800	53723.479156	53740.412721	53719.832880	53732.180580
307929	DXY	300	1786780200	99.633959	99.653965	99.626391	99.634134
308292	DXY	300	1786780800	99.639300	99.647722	99.624570	99.633123
308841	DXY	300	1786781700	99.643564	99.651560	99.623278	99.635155
309022	SP500	300	1786782000	7786.076377	7787.343532	7784.379985	7785.945094
309023	DOW	300	1786782000	53730.887368	53746.370036	53724.301666	53735.020894
309024	DXY	300	1786782000	99.637519	99.648543	99.624514	99.627094
309205	SP500	300	1786782300	7785.819546	7787.159503	7784.000627	7785.612609
309206	DOW	300	1786782300	53737.051439	53739.169106	53722.808234	53731.617778
309207	DXY	300	1786782300	99.624773	99.643706	99.621065	99.635138
312656	DOW	300	1786788000	53731.892147	53741.844265	53719.272400	53738.264886
312657	DXY	300	1786788000	99.635871	99.648188	99.624876	99.628428
311740	SP500	300	1786786500	7785.015619	7787.160358	7784.441302	7786.421187
311191	SP500	300	1786785600	7786.029932	7787.138805	7783.478658	7785.391786
311192	DOW	300	1786785600	53737.801645	53738.191846	53723.135946	53731.989042
311193	DXY	300	1786785600	99.636403	99.647528	99.623021	99.630215
311741	DOW	300	1786786500	53731.180732	53741.339070	53715.542349	53726.982472
311742	DXY	300	1786786500	99.636234	99.646004	99.621370	99.636892
310648	SP500	300	1786784700	7784.884849	7787.140955	7784.065661	7785.389323
310649	DOW	300	1786784700	53727.005706	53742.723499	53723.114541	53726.455715
310650	DXY	300	1786784700	99.645193	99.650248	99.626958	99.637711
310468	SP500	300	1786784400	7785.278788	7787.152362	7784.421810	7784.797123
310469	DOW	300	1786784400	53743.302030	53743.683679	53724.944405	53728.437060
310470	DXY	300	1786784400	99.623511	99.646777	99.621405	99.645214
309928	SP500	300	1786783500	7786.271877	7787.293167	7784.118029	7785.332397
309929	DOW	300	1786783500	53735.470727	53741.801067	53723.995665	53732.648439
309930	DXY	300	1786783500	99.634306	99.647893	99.618344	99.637774
309389	DOW	300	1786782600	53729.804090	53739.271947	53725.955798	53731.116396
309390	DXY	300	1786782600	99.636809	99.649485	99.629260	99.633388
310828	SP500	300	1786785000	7785.147138	7787.435860	7784.648934	7785.525979
310829	DOW	300	1786785000	53724.533381	53740.410336	53724.080960	53731.987787
310830	DXY	300	1786785000	99.636113	99.646374	99.628313	99.632791
314121	DXY	300	1786790400	99.637030	99.648222	99.629318	99.642583
310288	SP500	300	1786784100	7785.901509	7787.312210	7785.041571	7785.161873
310289	DOW	300	1786784100	53737.773502	53742.241033	53717.634887	53741.992266
310290	DXY	300	1786784100	99.637663	99.645733	99.622331	99.625352
313753	SP500	300	1786789800	7785.852223	7787.467679	7784.191846	7786.187235
313754	DOW	300	1786789800	53725.737217	53739.200124	53720.720945	53734.497980
309568	SP500	300	1786782900	7784.677636	7787.346942	7784.560483	7785.070029
309569	DOW	300	1786782900	53729.829168	53743.091854	53722.791894	53732.592847
309570	DXY	300	1786782900	99.630912	99.646041	99.622493	99.641845
312289	SP500	300	1786787400	7786.026750	7787.083453	7784.313227	7785.678435
312290	DOW	300	1786787400	53733.999494	53740.617372	53721.448926	53726.956556
312291	DXY	300	1786787400	99.631115	99.645583	99.626212	99.634819
312472	SP500	300	1786787700	7785.887120	7787.114343	7784.372609	7786.926264
312473	DOW	300	1786787700	53727.544151	53741.100884	53724.216729	53731.828209
312474	DXY	300	1786787700	99.634638	99.646701	99.626252	99.633779
311008	SP500	300	1786785300	7785.403516	7787.146838	7784.402156	7785.853323
311009	DOW	300	1786785300	53734.007055	53738.926809	53723.724546	53736.305174
311010	DXY	300	1786785300	99.634008	99.649941	99.629858	99.637909
310108	SP500	300	1786783800	7785.475976	7786.940744	7784.674962	7786.190655
310109	DOW	300	1786783800	53733.454091	53746.722271	53724.506386	53736.112042
310110	DXY	300	1786783800	99.636560	99.648039	99.625158	99.637114
309748	SP500	300	1786783200	7785.072859	7786.898008	7784.327174	7786.305394
309749	DOW	300	1786783200	53732.213642	53744.718093	53720.829517	53733.862173
309750	DXY	300	1786783200	99.640414	99.651983	99.626416	99.632386
313387	SP500	300	1786789200	7786.523318	7787.397067	7784.193472	7785.588315
313388	DOW	300	1786789200	53729.011586	53738.435423	53722.918375	53735.184106
313204	SP500	300	1786788900	7785.787211	7786.923893	7784.616412	7786.217535
313205	DOW	300	1786788900	53732.036175	53739.950310	53723.198826	53729.765551
313206	DXY	300	1786788900	99.639366	99.645962	99.622973	99.637297
311923	SP500	300	1786786800	7786.306592	7787.044397	7784.666769	7785.157064
311924	DOW	300	1786786800	53724.898095	53742.705662	53722.645148	53730.100658
311925	DXY	300	1786786800	99.638960	99.645629	99.619955	99.631621
311557	SP500	300	1786786200	7785.756796	7787.389506	7783.824382	7785.320994
311558	DOW	300	1786786200	53729.166143	53740.273633	53723.262515	53729.372607
311374	SP500	300	1786785900	7785.350665	7787.688998	7784.871779	7785.679354
311375	DOW	300	1786785900	53733.553528	53740.024976	53725.669689	53728.886427
311376	DXY	300	1786785900	99.629096	99.646670	99.621739	99.629907
311559	DXY	300	1786786200	99.629284	99.643338	99.623591	99.636982
312106	SP500	300	1786787100	7785.392714	7787.512118	7784.643643	7785.968638
312107	DOW	300	1786787100	53731.830594	53742.255289	53720.541164	53735.352474
312108	DXY	300	1786787100	99.630798	99.643011	99.620589	99.632552
313389	DXY	300	1786789200	99.639022	99.647284	99.624674	99.635094
313021	SP500	300	1786788600	7786.215003	7787.175970	7784.115840	7785.864560
312838	SP500	300	1786788300	7785.591610	7787.845957	7784.312430	7786.370496
312839	DOW	300	1786788300	53737.271370	53741.999784	53724.531572	53736.399273
312840	DXY	300	1786788300	99.630853	99.649834	99.624774	99.634245
313022	DOW	300	1786788600	53737.242150	53740.933267	53720.783812	53733.686567
313023	DXY	300	1786788600	99.635749	99.646797	99.624285	99.640266
312655	SP500	300	1786788000	7787.120455	7787.736146	7784.556372	7785.665711
313755	DXY	300	1786789800	99.632801	99.648661	99.625178	99.635039
313570	SP500	300	1786789500	7785.655114	7787.064803	7784.182446	7785.865669
313571	DOW	300	1786789500	53736.536900	53740.869192	53723.339319	53726.599081
313572	DXY	300	1786789500	99.635144	99.647050	99.627011	99.634583
313936	SP500	300	1786790100	7786.490109	7787.726141	7784.357584	7785.993956
313937	DOW	300	1786790100	53735.795041	53740.290335	53723.428799	53739.210381
314120	DOW	300	1786790400	53741.093316	53741.621760	53722.234908	53731.177562
314119	SP500	300	1786790400	7785.702861	7787.229521	7783.662918	7785.931079
313938	DXY	300	1786790100	99.637054	99.645987	99.623872	99.637192
314302	SP500	300	1786790700	7785.994158	7787.709010	7784.110951	7785.183257
314303	DOW	300	1786790700	53729.774079	53741.437346	53723.490467	53727.174299
314304	DXY	300	1786790700	99.643714	99.649102	99.625292	99.635325
314485	SP500	300	1786791000	7785.235697	7787.365292	7784.585623	7784.898922
314486	DOW	300	1786791000	53727.767154	53742.685668	53723.200030	53729.911104
314487	DXY	300	1786791000	99.636626	99.645664	99.625295	99.639940
314668	SP500	300	1786791300	7784.772209	7786.743629	7784.720691	7786.112174
314669	DOW	300	1786791300	53728.093643	53743.441440	53724.059379	53731.996015
314670	DXY	300	1786791300	99.639709	99.648138	99.626480	99.630116
316489	SP500	300	1786794300	7785.618390	7787.289140	7784.729038	7785.223248
316490	DOW	300	1786794300	53730.922147	53740.583838	53720.692836	53736.478941
316491	DXY	300	1786794300	99.633571	99.648984	99.628228	99.630758
319602	DXY	300	1786799400	99.641191	99.646200	99.629061	99.635811
319417	SP500	300	1786799100	7785.814602	7787.387379	7784.061892	7785.698835
319234	SP500	300	1786798800	7784.885024	7786.724677	7784.497668	7785.840442
319235	DOW	300	1786798800	53738.964985	53740.893957	53721.374289	53723.926677
319418	DOW	300	1786799100	53725.986061	53743.419813	53719.932181	53742.682484
319419	DXY	300	1786799100	99.634522	99.646291	99.625397	99.640315
318502	SP500	300	1786797600	7787.370511	7787.620097	7784.148026	7785.978874
314851	SP500	300	1786791600	7786.000709	7787.139305	7784.570263	7785.870767
314852	DOW	300	1786791600	53733.987056	53738.454311	53718.057772	53736.970316
314853	DXY	300	1786791600	99.629144	99.649774	99.624736	99.633745
318503	DOW	300	1786797600	53736.293369	53740.026626	53723.973232	53729.382467
318504	DXY	300	1786797600	99.633398	99.648716	99.622844	99.642876
315394	SP500	300	1786792500	7784.788775	7787.271032	7784.390874	7785.678108
315395	DOW	300	1786792500	53731.499432	53741.824551	53721.862191	53730.544977
315396	DXY	300	1786792500	99.630305	99.645107	99.620670	99.632951
319782	DXY	300	1786799700	99.635647	99.647533	99.624622	99.628621
318868	SP500	300	1786798200	7785.851530	7787.513602	7784.754941	7786.115900
318869	DOW	300	1786798200	53726.369196	53742.513459	53723.128028	53734.885849
316855	SP500	300	1786794900	7785.676348	7786.647792	7784.383019	7786.496173
316856	DOW	300	1786794900	53737.094720	53738.628317	53724.746723	53731.889242
316857	DXY	300	1786794900	99.635986	99.643444	99.622291	99.633410
315034	SP500	300	1786791900	7785.701517	7787.398150	7785.021176	7785.538484
315035	DOW	300	1786791900	53735.840319	53740.336243	53719.351528	53737.814450
315036	DXY	300	1786791900	99.633084	99.650097	99.625279	99.643472
315940	SP500	300	1786793400	7785.637520	7787.361733	7784.747096	7784.982318
315941	DOW	300	1786793400	53731.339576	53743.297463	53722.174243	53734.512330
315942	DXY	300	1786793400	99.636015	99.646442	99.622287	99.644401
316123	SP500	300	1786793700	7784.830488	7786.782457	7784.373590	7786.196202
316124	DOW	300	1786793700	53733.730008	53741.116234	53719.122592	53733.902215
316125	DXY	300	1786793700	99.646643	99.651015	99.622417	99.631614
315757	SP500	300	1786793100	7785.110695	7787.318841	7783.975356	7785.370542
315758	DOW	300	1786793100	53729.145571	53744.632662	53721.148099	53732.531107
315759	DXY	300	1786793100	99.636962	99.649883	99.628522	99.635147
318685	SP500	300	1786797900	7785.942323	7786.996839	7784.403374	7785.857526
317770	SP500	300	1786796400	7786.208572	7787.576817	7784.726854	7784.848051
317038	SP500	300	1786795200	7786.533301	7787.401295	7784.472433	7785.829225
317039	DOW	300	1786795200	53731.842679	53738.480424	53722.402620	53727.526485
317040	DXY	300	1786795200	99.631328	99.644346	99.623760	99.635085
315214	SP500	300	1786792200	7785.789796	7786.892204	7784.164756	7785.017340
315215	DOW	300	1786792200	53736.768105	53741.670749	53723.178851	53731.146068
315216	DXY	300	1786792200	99.645599	99.647317	99.623622	99.631122
316672	SP500	300	1786794600	7785.439070	7787.575950	7784.316857	7785.919116
316673	DOW	300	1786794600	53738.465515	53740.783102	53722.216088	53735.379977
316674	DXY	300	1786794600	99.632692	99.647756	99.625951	99.638333
316306	SP500	300	1786794000	7785.968916	7786.887822	7784.317937	7785.522668
315574	SP500	300	1786792800	7785.636475	7786.925009	7784.425265	7784.848361
315575	DOW	300	1786792800	53728.681874	53740.528147	53721.903323	53729.678153
315576	DXY	300	1786792800	99.631491	99.645289	99.625362	99.638539
316307	DOW	300	1786794000	53732.153806	53739.862216	53722.824658	53732.405198
316308	DXY	300	1786794000	99.633694	99.645671	99.622744	99.633245
317771	DOW	300	1786796400	53735.292987	53744.430581	53725.585390	53730.658921
317772	DXY	300	1786796400	99.634275	99.645600	99.627749	99.635078
318686	DOW	300	1786797900	53727.905825	53745.534689	53723.666610	53728.140093
317404	SP500	300	1786795800	7785.562268	7787.411268	7783.759450	7785.200056
317405	DOW	300	1786795800	53729.405850	53744.625973	53721.787066	53735.503090
317406	DXY	300	1786795800	99.637944	99.646489	99.627888	99.635499
318687	DXY	300	1786797900	99.641978	99.646280	99.621113	99.646126
318136	SP500	300	1786797000	7785.567224	7787.091519	7784.749832	7787.030842
317221	SP500	300	1786795500	7785.970315	7787.339078	7784.633945	7785.652342
317222	DOW	300	1786795500	53728.589317	53738.591691	53722.833678	53729.038719
317223	DXY	300	1786795500	99.637518	99.647699	99.627726	99.636608
318137	DOW	300	1786797000	53728.906675	53740.012929	53718.761293	53737.356380
317587	SP500	300	1786796100	7785.291390	7787.003178	7784.304334	7786.068421
317588	DOW	300	1786796100	53737.269457	53740.751111	53724.628712	53736.841562
317589	DXY	300	1786796100	99.637042	99.649035	99.628109	99.634537
317953	SP500	300	1786796700	7784.547458	7787.294211	7784.016008	7785.654861
317954	DOW	300	1786796700	53728.978023	53742.644788	53723.535020	53730.659485
317955	DXY	300	1786796700	99.633781	99.648363	99.623608	99.633148
318138	DXY	300	1786797000	99.635320	99.646895	99.621717	99.633979
318870	DXY	300	1786798200	99.645611	99.650683	99.625988	99.637131
319236	DXY	300	1786798800	99.635945	99.648925	99.625049	99.635646
318319	SP500	300	1786797300	7786.780811	7787.426847	7784.083930	7787.426847
318320	DOW	300	1786797300	53735.388699	53741.025071	53719.050810	53736.103548
318321	DXY	300	1786797300	99.631775	99.645204	99.625288	99.634845
319051	SP500	300	1786798500	7786.122884	7787.523993	7784.137614	7784.988406
319052	DOW	300	1786798500	53733.778628	53741.861222	53721.061474	53738.012973
319053	DXY	300	1786798500	99.635109	99.646654	99.625958	99.637354
319600	SP500	300	1786799400	7785.479687	7787.253025	7784.488361	7785.685988
319601	DOW	300	1786799400	53742.964570	53746.079892	53717.545940	53726.115018
319962	DXY	300	1786800000	99.626582	99.647195	99.617721	99.633664
319780	SP500	300	1786799700	7785.758471	7786.975607	7784.262815	7785.493719
319781	DOW	300	1786799700	53727.279768	53741.640345	53715.814543	53732.410455
319960	SP500	300	1786800000	7785.565507	7787.150154	7784.120503	7785.402314
319961	DOW	300	1786800000	53734.386436	53742.710867	53720.921261	53721.689695
320140	SP500	300	1786800300	7785.634710	7787.197618	7783.900414	7785.871033
320141	DOW	300	1786800300	53719.800991	53746.381898	53719.800991	53732.847824
323600	DOW	300	1786806000	53732.434843	53744.443823	53721.485303	53727.113873
323601	DXY	300	1786806000	99.635452	99.648698	99.622629	99.629053
325425	DXY	300	1786809000	99.634670	99.649632	99.620487	99.634747
325057	SP500	300	1786808400	7785.833336	7787.388713	7784.686902	7786.661803
321964	SP500	300	1786803300	7786.050200	7786.647131	7784.097802	7785.918086
321965	DOW	300	1786803300	53733.355337	53749.048300	53722.390257	53731.848963
321966	DXY	300	1786803300	99.635149	99.648592	99.625348	99.637400
320869	SP500	300	1786801500	7784.809698	7787.434065	7784.371071	7785.908813
320870	DOW	300	1786801500	53731.672955	53740.140486	53723.299744	53731.534618
320871	DXY	300	1786801500	99.631171	99.645514	99.629328	99.634805
320506	SP500	300	1786800900	7786.086065	7787.059260	7783.915587	7785.182971
320507	DOW	300	1786800900	53733.848519	53742.131038	53721.458615	53727.960403
320508	DXY	300	1786800900	99.635048	99.647378	99.624728	99.637951
323236	SP500	300	1786805400	7784.830493	7787.740294	7784.198079	7785.773859
323237	DOW	300	1786805400	53734.493056	53744.881480	53725.300982	53736.747104
322876	SP500	300	1786804800	7785.458091	7787.435823	7784.563174	7785.591398
322877	DOW	300	1786804800	53734.817039	53741.849520	53725.725111	53731.477504
322878	DXY	300	1786804800	99.636289	99.648163	99.629625	99.642969
323238	DXY	300	1786805400	99.635184	99.643310	99.621668	99.641449
322693	SP500	300	1786804500	7786.313873	7786.724399	7784.481930	7785.492771
322694	DOW	300	1786804500	53730.068498	53745.824330	53722.742959	53734.317503
322695	DXY	300	1786804500	99.636794	99.648071	99.622284	99.635388
321418	SP500	300	1786802400	7786.267220	7787.029405	7784.522076	7787.029405
321419	DOW	300	1786802400	53731.637434	53744.846073	53719.301110	53730.218838
321420	DXY	300	1786802400	99.633134	99.644611	99.625307	99.639251
321235	SP500	300	1786802100	7784.919170	7786.955297	7783.659123	7785.970877
321236	DOW	300	1786802100	53733.043490	53745.135140	53720.260158	53732.830822
321237	DXY	300	1786802100	99.632603	99.649291	99.622219	99.630937
320689	SP500	300	1786801200	7784.986182	7787.083706	7784.246180	7784.923769
320690	DOW	300	1786801200	53729.138962	53743.209102	53725.896422	53730.568306
320691	DXY	300	1786801200	99.636338	99.645724	99.627526	99.633492
320142	DXY	300	1786800300	99.631365	99.645185	99.624951	99.637149
325058	DOW	300	1786808400	53736.747537	53743.441990	53720.575796	53732.679871
324511	SP500	300	1786807500	7785.708509	7787.584987	7784.263201	7785.164616
321601	SP500	300	1786802700	7787.333921	7787.704022	7784.198643	7785.924601
321602	DOW	300	1786802700	53728.959141	53741.518386	53720.997310	53735.914576
321603	DXY	300	1786802700	99.637672	99.645754	99.624361	99.640630
324512	DOW	300	1786807500	53735.269852	53739.730625	53725.580305	53732.036802
321052	SP500	300	1786801800	7785.816292	7786.701794	7784.727804	7785.181659
321053	DOW	300	1786801800	53729.907083	53742.794988	53722.815408	53734.361050
321054	DXY	300	1786801800	99.632485	99.644387	99.626143	99.631744
320323	SP500	300	1786800600	7786.082918	7786.810294	7784.226338	7785.859796
320324	DOW	300	1786800600	53734.485618	53739.645907	53724.349870	53735.093613
320325	DXY	300	1786800600	99.638762	99.649309	99.627547	99.633500
323056	SP500	300	1786805100	7785.408775	7787.031486	7783.877411	7785.043776
322327	SP500	300	1786803900	7784.947985	7786.761074	7784.040021	7785.428899
322328	DOW	300	1786803900	53731.222438	53741.514285	53724.730773	53737.329869
322329	DXY	300	1786803900	99.640015	99.648594	99.627430	99.630857
323057	DOW	300	1786805100	53731.497352	53741.417387	53719.464854	53734.370173
321784	SP500	300	1786803000	7785.906270	7787.453796	7784.350410	7785.806310
321785	DOW	300	1786803000	53735.050045	53741.242951	53721.431195	53733.233740
321786	DXY	300	1786803000	99.638851	99.647537	99.625498	99.636096
323058	DXY	300	1786805100	99.643929	99.648697	99.621481	99.633464
322144	SP500	300	1786803600	7786.142486	7786.933014	7784.427150	7785.092793
322145	DOW	300	1786803600	53730.324041	53741.491982	53724.666371	53732.506926
322146	DXY	300	1786803600	99.639778	99.643695	99.623948	99.641338
324513	DXY	300	1786807500	99.635696	99.649317	99.620479	99.633673
324331	SP500	300	1786807200	7786.448363	7787.819157	7784.672537	7785.417650
324332	DOW	300	1786807200	53731.313289	53743.400046	53722.904314	53733.188762
322510	SP500	300	1786804200	7785.204603	7787.093242	7784.341032	7786.323439
322511	DOW	300	1786804200	53736.283490	53740.962554	53720.895677	53732.021598
322512	DXY	300	1786804200	99.632415	99.647979	99.624397	99.638955
324333	DXY	300	1786807200	99.636066	99.646320	99.626177	99.633263
323965	SP500	300	1786806600	7786.410826	7786.877318	7784.445878	7786.082342
323782	SP500	300	1786806300	7784.929432	7787.173073	7784.321902	7786.602464
323783	DOW	300	1786806300	53728.532045	53740.401435	53720.781458	53735.656806
323784	DXY	300	1786806300	99.631168	99.645801	99.624481	99.633302
323416	SP500	300	1786805700	7786.074498	7786.832065	7784.226798	7785.773195
323417	DOW	300	1786805700	53738.211295	53741.934524	53721.309875	53731.422747
323418	DXY	300	1786805700	99.643715	99.645224	99.624210	99.635163
323966	DOW	300	1786806600	53737.112991	53745.162670	53724.465018	53728.694033
323967	DXY	300	1786806600	99.632614	99.649664	99.623914	99.642231
324148	SP500	300	1786806900	7786.353692	7787.146502	7784.889233	7786.545618
323599	SP500	300	1786806000	7785.814257	7787.123311	7784.569578	7784.949230
324149	DOW	300	1786806900	53730.472347	53742.729092	53726.126023	53729.300042
324150	DXY	300	1786806900	99.642017	99.650998	99.619708	99.634792
324874	SP500	300	1786808100	7784.683831	7787.428405	7784.076084	7785.952239
324875	DOW	300	1786808100	53726.087939	53743.465399	53722.085053	53736.212182
324876	DXY	300	1786808100	99.635412	99.647096	99.621974	99.634724
324691	SP500	300	1786807800	7785.475546	7787.164084	7783.843397	7784.775631
324692	DOW	300	1786807800	53730.620870	53741.153065	53719.601188	53728.139159
324693	DXY	300	1786807800	99.633643	99.645459	99.628766	99.634610
325059	DXY	300	1786808400	99.635924	99.644556	99.620048	99.642788
325240	SP500	300	1786808700	7786.694305	7786.762941	7784.528439	7785.817672
325241	DOW	300	1786808700	53733.714310	53744.572282	53721.965546	53730.391183
325242	DXY	300	1786808700	99.641152	99.646380	99.627398	99.633529
325603	SP500	300	1786809300	7785.136467	7786.955987	7784.442247	7786.754521
325423	SP500	300	1786809000	7785.876915	7786.947223	7783.465292	7785.320885
325424	DOW	300	1786809000	53730.717636	53741.663871	53721.106707	53732.750185
326331	DXY	300	1786810500	99.640914	99.645898	99.626252	99.634087
325966	SP500	300	1786809900	7786.568903	7786.813100	7784.042642	7785.805805
325967	DOW	300	1786809900	53735.720792	53739.232876	53720.689440	53735.577265
325968	DXY	300	1786809900	99.632679	99.651305	99.626016	99.642485
330330	DXY	300	1786817100	99.641216	99.645498	99.625014	99.636137
329779	SP500	300	1786816200	7785.510987	7786.797840	7784.288908	7785.629274
329416	SP500	300	1786815600	7786.372859	7786.920874	7784.440493	7785.877279
329417	DOW	300	1786815600	53733.668839	53740.639882	53724.176478	53739.652341
329418	DXY	300	1786815600	99.630857	99.647833	99.624336	99.642584
328690	SP500	300	1786814400	7785.390824	7786.954659	7784.355090	7785.330192
328691	DOW	300	1786814400	53731.594888	53738.304904	53721.866161	53733.626709
327961	SP500	300	1786813200	7785.599946	7786.748151	7784.370354	7785.436918
327418	SP500	300	1786812300	7785.307668	7787.625769	7783.991040	7785.362299
327419	DOW	300	1786812300	53726.084643	53744.141919	53723.753722	53733.327893
327420	DXY	300	1786812300	99.640691	99.644834	99.625296	99.641383
327962	DOW	300	1786813200	53733.772732	53744.377990	53721.840237	53732.383800
327963	DXY	300	1786813200	99.632196	99.647929	99.626589	99.635588
328692	DXY	300	1786814400	99.634796	99.647416	99.628528	99.633902
328510	SP500	300	1786814100	7785.403003	7787.273454	7784.435256	7785.684157
328511	DOW	300	1786814100	53727.661533	53742.836336	53718.380281	53731.308609
328512	DXY	300	1786814100	99.630235	99.645296	99.625006	99.632867
325604	DOW	300	1786809300	53734.379934	53748.673303	53723.239082	53728.056991
325605	DXY	300	1786809300	99.633959	99.646243	99.624345	99.632914
326878	SP500	300	1786811400	7786.954314	7786.968794	7784.574369	7785.269245
326879	DOW	300	1786811400	53739.084142	53743.849865	53724.747422	53739.761978
326149	SP500	300	1786810200	7785.955088	7787.105304	7784.519350	7784.973787
326150	DOW	300	1786810200	53735.951922	53739.079803	53719.530691	53734.710272
326151	DXY	300	1786810200	99.640154	99.645377	99.625325	99.640084
326880	DXY	300	1786811400	99.642733	99.646573	99.620814	99.639377
326695	SP500	300	1786811100	7786.029649	7786.868431	7784.574230	7786.842919
326696	DOW	300	1786811100	53732.556968	53743.479313	53725.630188	53739.305760
326697	DXY	300	1786811100	99.630226	99.649585	99.628404	99.641437
325783	SP500	300	1786809600	7786.690078	7787.173644	7784.436433	7786.398655
325784	DOW	300	1786809600	53727.504745	53740.128813	53717.438071	53735.941609
325785	DXY	300	1786809600	99.634613	99.647427	99.626117	99.634784
327058	SP500	300	1786811700	7785.012788	7787.146044	7784.569811	7785.684946
327059	DOW	300	1786811700	53737.791466	53739.926986	53722.308172	53724.046340
327060	DXY	300	1786811700	99.639464	99.645931	99.621385	99.635060
326512	SP500	300	1786810800	7785.681733	7787.197561	7784.667816	7785.810402
326513	DOW	300	1786810800	53738.563611	53738.730791	53723.655858	53731.074882
326514	DXY	300	1786810800	99.632118	99.644389	99.625650	99.629774
329780	DOW	300	1786816200	53730.458366	53742.658631	53726.270070	53735.291838
329233	SP500	300	1786815300	7786.234435	7787.018680	7784.443258	7786.520476
329050	SP500	300	1786815000	7785.393685	7787.150916	7784.322659	7785.955032
329051	DOW	300	1786815000	53724.248275	53739.153118	53724.248275	53727.992277
329052	DXY	300	1786815000	99.641388	99.646994	99.627998	99.633245
327238	SP500	300	1786812000	7785.579349	7786.981995	7784.474778	7785.305212
326329	SP500	300	1786810500	7784.802027	7787.042968	7783.957630	7785.661810
326330	DOW	300	1786810500	53736.777496	53740.553411	53721.001129	53738.147985
327239	DOW	300	1786812000	53724.670583	53741.732777	53719.864008	53728.228262
327240	DXY	300	1786812000	99.635371	99.652213	99.627007	99.638655
329234	DOW	300	1786815300	53728.529614	53743.304824	53723.225875	53731.666475
329235	DXY	300	1786815300	99.631829	99.647169	99.624256	99.630130
327778	SP500	300	1786812900	7786.421772	7787.277730	7784.241395	7785.761935
327598	SP500	300	1786812600	7785.558969	7787.192774	7784.497407	7786.579208
327599	DOW	300	1786812600	53731.495904	53739.512276	53719.193286	53737.673948
327600	DXY	300	1786812600	99.640750	99.645014	99.623967	99.630666
327779	DOW	300	1786812900	53736.853941	53740.335017	53723.292387	53734.217418
327780	DXY	300	1786812900	99.630132	99.644232	99.625977	99.632729
328144	SP500	300	1786813500	7785.170670	7787.282810	7784.493283	7784.951294
328145	DOW	300	1786813500	53734.278743	53744.839276	53720.739007	53729.496447
328146	DXY	300	1786813500	99.635596	99.650574	99.626255	99.645950
328327	SP500	300	1786813800	7784.877425	7787.086011	7784.342570	7785.584744
328328	DOW	300	1786813800	53731.191743	53739.225446	53722.974365	53726.692591
328329	DXY	300	1786813800	99.647626	99.648789	99.626361	99.630243
328870	SP500	300	1786814700	7785.275720	7787.026314	7784.467403	7785.462839
328871	DOW	300	1786814700	53733.170405	53741.186603	53721.391564	53725.731449
328872	DXY	300	1786814700	99.633325	99.654666	99.626244	99.641920
329781	DXY	300	1786816200	99.637260	99.647675	99.623019	99.636332
330696	DXY	300	1786817700	99.645286	99.647337	99.626202	99.634525
330329	DOW	300	1786817100	53730.253025	53739.921164	53725.573693	53728.207036
330328	SP500	300	1786817100	7785.913654	7787.297553	7784.655520	7786.003016
329599	SP500	300	1786815900	7785.598051	7787.170209	7784.828229	7785.643711
329600	DOW	300	1786815900	53739.975742	53743.654945	53723.351267	53728.817080
329601	DXY	300	1786815900	99.643794	99.647476	99.627503	99.636405
329962	SP500	300	1786816500	7785.332845	7787.216024	7784.661119	7786.041058
329963	DOW	300	1786816500	53734.808450	53741.693308	53723.477552	53729.139633
329964	DXY	300	1786816500	99.634174	99.649001	99.627700	99.634269
330145	SP500	300	1786816800	7785.877625	7786.894342	7784.281832	7785.718383
330146	DOW	300	1786816800	53727.335921	53745.044340	53723.633563	53731.753291
330147	DXY	300	1786816800	99.636511	99.651881	99.623379	99.641249
330511	SP500	300	1786817400	7786.055649	7787.167103	7784.106694	7785.841978
330512	DOW	300	1786817400	53727.447597	53738.816320	53721.502632	53738.816320
330513	DXY	300	1786817400	99.634371	99.650759	99.628002	99.643535
330876	DXY	300	1786818000	99.636377	99.645178	99.623148	99.635407
330694	SP500	300	1786817700	7785.542105	7786.829383	7783.637562	7784.893795
330695	DOW	300	1786817700	53739.526393	53741.558434	53723.537210	53729.837186
330874	SP500	300	1786818000	7784.893713	7786.955209	7784.386588	7786.955209
330875	DOW	300	1786818000	53731.258584	53741.667282	53722.357938	53735.981619
335417	DOW	300	1786825500	53734.280247	53740.582929	53721.357931	53731.844226
334873	SP500	300	1786824600	7785.287421	7787.048761	7784.253118	7785.147316
334874	DOW	300	1786824600	53728.410719	53739.865591	53724.465919	53733.088051
334875	DXY	300	1786824600	99.634444	99.646879	99.626691	99.634816
333961	SP500	300	1786823100	7785.549177	7787.240170	7784.555296	7786.561146
333962	DOW	300	1786823100	53731.571062	53742.010751	53718.339724	53732.613623
333963	DXY	300	1786823100	99.635548	99.649246	99.619639	99.637902
333235	SP500	300	1786821900	7786.450553	7787.590446	7784.591071	7785.977507
333055	SP500	300	1786821600	7785.414029	7787.002130	7784.641838	7786.366607
331054	SP500	300	1786818300	7786.704268	7787.295248	7784.454079	7785.491281
331055	DOW	300	1786818300	53736.479807	53739.945734	53724.748726	53727.970174
331056	DXY	300	1786818300	99.635502	99.654556	99.628020	99.636943
333056	DOW	300	1786821600	53734.847597	53741.562315	53724.211707	53732.058391
333057	DXY	300	1786821600	99.632803	99.645390	99.621993	99.643170
333236	DOW	300	1786821900	53730.654959	53741.927065	53723.584461	53731.869106
333237	DXY	300	1786821900	99.640842	99.647619	99.627465	99.639725
331597	SP500	300	1786819200	7786.122236	7786.924704	7784.117948	7785.794708
331598	DOW	300	1786819200	53734.657631	53741.365383	53722.238222	53734.112172
331599	DXY	300	1786819200	99.635290	99.644936	99.623056	99.632495
334507	SP500	300	1786824000	7785.774799	7787.360591	7784.308281	7785.495549
331234	SP500	300	1786818600	7785.601245	7787.338417	7784.196152	7785.490493
331235	DOW	300	1786818600	53729.814276	53742.466888	53721.465758	53733.700245
331236	DXY	300	1786818600	99.638911	99.646526	99.622192	99.638116
333595	SP500	300	1786822500	7786.834947	7787.632531	7784.347193	7785.118014
332140	SP500	300	1786820100	7786.012889	7787.195783	7784.094046	7785.407575
332141	DOW	300	1786820100	53736.731471	53738.904682	53725.375601	53730.272095
332142	DXY	300	1786820100	99.625666	99.650711	99.618813	99.635229
332323	SP500	300	1786820400	7785.386944	7787.033490	7783.934518	7785.278805
332324	DOW	300	1786820400	53731.097694	53737.580239	53720.839052	53730.885161
332325	DXY	300	1786820400	99.632961	99.645705	99.626160	99.640952
331960	SP500	300	1786819800	7785.643824	7787.226542	7784.845186	7785.880231
331961	DOW	300	1786819800	53733.538757	53743.539216	53719.939147	53737.969604
331962	DXY	300	1786819800	99.633342	99.653944	99.624197	99.624197
332872	SP500	300	1786821300	7785.676227	7787.392868	7784.923139	7785.432432
332873	DOW	300	1786821300	53730.432989	53742.755683	53721.702054	53733.526684
332874	DXY	300	1786821300	99.640251	99.650206	99.623727	99.634611
333596	DOW	300	1786822500	53735.209668	53738.619328	53720.254580	53737.338711
333597	DXY	300	1786822500	99.635413	99.649270	99.626175	99.629301
331414	SP500	300	1786818900	7785.740296	7787.148133	7784.311104	7786.200622
331415	DOW	300	1786818900	53732.438078	53741.999176	53726.570512	53732.570465
331416	DXY	300	1786818900	99.638585	99.646970	99.627019	99.635438
332506	SP500	300	1786820700	7785.291241	7787.449953	7784.166337	7785.799340
332507	DOW	300	1786820700	53728.854649	53738.822606	53724.376324	53731.295561
332508	DXY	300	1786820700	99.639579	99.643356	99.624652	99.635888
331780	SP500	300	1786819500	7786.019784	7787.061124	7783.976033	7785.698145
331781	DOW	300	1786819500	53733.606611	53741.174530	53720.972447	53732.225260
331782	DXY	300	1786819500	99.630935	99.646590	99.627961	99.632099
334327	SP500	300	1786823700	7785.543997	7787.176895	7784.723708	7785.760636
334328	DOW	300	1786823700	53734.508653	53743.357432	53720.803397	53729.109161
334329	DXY	300	1786823700	99.629059	99.645067	99.626959	99.628378
333415	SP500	300	1786822200	7786.172985	7787.025175	7784.758259	7786.565938
333416	DOW	300	1786822200	53731.835844	53739.020445	53726.214647	53736.582138
333417	DXY	300	1786822200	99.641460	99.648792	99.626462	99.636186
333778	SP500	300	1786822800	7785.323447	7787.370609	7784.404422	7785.519770
333779	DOW	300	1786822800	53737.641191	53741.595877	53722.191506	53733.129145
333780	DXY	300	1786822800	99.630021	99.646708	99.628297	99.633892
334144	SP500	300	1786823400	7786.789773	7787.048286	7784.483163	7785.558862
334145	DOW	300	1786823400	53734.614257	53742.890747	53722.544193	53733.256930
332689	SP500	300	1786821000	7785.882192	7786.781988	7784.747753	7785.668890
332690	DOW	300	1786821000	53730.734965	53742.202787	53722.485932	53728.908743
332691	DXY	300	1786821000	99.634001	99.647414	99.626178	99.638372
334146	DXY	300	1786823400	99.640254	99.647939	99.624670	99.627853
334508	DOW	300	1786824000	53728.362345	53744.107258	53723.190138	53735.241395
334509	DXY	300	1786824000	99.627633	99.648796	99.624730	99.631675
335418	DXY	300	1786825500	99.638207	99.650037	99.626246	99.627192
335236	SP500	300	1786825200	7785.310074	7787.130518	7784.655706	7785.493252
335237	DOW	300	1786825200	53736.352256	53744.995126	53722.824275	53733.593853
335238	DXY	300	1786825200	99.643488	99.643863	99.627010	99.638340
334690	SP500	300	1786824300	7785.740103	7786.690646	7784.310570	7785.246116
334691	DOW	300	1786824300	53734.233324	53740.317654	53721.760693	53726.291514
334692	DXY	300	1786824300	99.633692	99.645974	99.623609	99.633881
335596	SP500	300	1786825800	7786.016567	7786.913901	7784.586468	7784.657034
335056	SP500	300	1786824900	7785.279877	7786.319178	7784.189884	7785.055253
335416	SP500	300	1786825500	7785.236102	7787.129396	7784.668778	7786.050049
335057	DOW	300	1786824900	53732.587265	53741.125990	53725.205001	53737.234753
335058	DXY	300	1786824900	99.636502	99.652638	99.625081	99.644950
335597	DOW	300	1786825800	53730.384591	53748.320031	53722.662877	53734.235173
335598	DXY	300	1786825800	99.627612	99.644567	99.622064	99.632521
335776	SP500	300	1786826100	7784.903292	7787.212330	7784.451061	7787.212330
335777	DOW	300	1786826100	53735.805539	53741.702987	53720.666137	53731.051083
335778	DXY	300	1786826100	99.631246	99.643689	99.623863	99.638520
335959	SP500	300	1786826400	7787.124868	7788.119656	7784.459093	7786.117517
335960	DOW	300	1786826400	53730.985101	53740.745376	53722.241947	53726.280570
335961	DXY	300	1786826400	99.636782	99.644235	99.624119	99.631132
336142	SP500	300	1786826700	7785.920499	7787.236889	7784.149560	7785.748529
336143	DOW	300	1786826700	53725.610154	53745.135438	53724.790884	53735.827143
336144	DXY	300	1786826700	99.628988	99.644029	99.625043	99.633078
336325	SP500	300	1786827000	7785.828749	7786.903008	7784.544208	7785.943801
336326	DOW	300	1786827000	53735.702044	53742.020517	53724.346002	53742.020517
341047	SP500	300	1786834800	7786.213084	7787.706684	7784.407237	7786.441270
338143	SP500	300	1786830000	7784.801613	7787.241336	7784.383057	7785.860993
338144	DOW	300	1786830000	53730.913619	53741.839935	53722.307731	53731.537899
338145	DXY	300	1786830000	99.641215	99.649213	99.626446	99.642145
340501	SP500	300	1786833900	7786.341397	7787.005962	7784.144915	7786.158777
338866	SP500	300	1786831200	7785.576024	7787.220826	7784.394549	7785.730089
338867	DOW	300	1786831200	53734.139654	53741.011889	53722.375731	53722.375731
337054	SP500	300	1786828200	7785.756839	7787.016901	7784.201926	7786.627293
337055	DOW	300	1786828200	53726.926437	53741.497298	53724.171933	53734.832023
337056	DXY	300	1786828200	99.631732	99.646059	99.627133	99.634942
336691	SP500	300	1786827600	7785.403050	7787.356004	7784.033483	7785.554385
336692	DOW	300	1786827600	53736.292325	53742.519921	53723.643431	53736.494815
336693	DXY	300	1786827600	99.639546	99.646103	99.622676	99.635776
338868	DXY	300	1786831200	99.628310	99.650581	99.627084	99.634347
340502	DOW	300	1786833900	53726.377175	53739.447156	53722.260028	53731.389843
340503	DXY	300	1786833900	99.634856	99.648208	99.626462	99.631381
339226	SP500	300	1786831800	7785.664255	7787.093020	7784.529224	7786.336452
339227	DOW	300	1786831800	53730.029527	53743.386426	53726.162486	53731.537351
339228	DXY	300	1786831800	99.633655	99.643609	99.624414	99.633397
339952	SP500	300	1786833000	7784.937092	7787.107687	7784.041982	7785.739369
339953	DOW	300	1786833000	53730.076678	53745.964858	53722.877029	53735.462664
337597	SP500	300	1786829100	7785.253793	7787.143909	7784.667621	7786.535400
337598	DOW	300	1786829100	53732.352918	53744.398151	53721.371332	53730.192805
337599	DXY	300	1786829100	99.641581	99.645364	99.626466	99.632075
337417	SP500	300	1786828800	7786.281793	7787.288324	7783.235357	7785.301701
337418	DOW	300	1786828800	53726.872921	53740.788731	53725.173423	53730.308115
337419	DXY	300	1786828800	99.637489	99.647002	99.626652	99.639420
339954	DXY	300	1786833000	99.641857	99.645188	99.629026	99.640111
338506	SP500	300	1786830600	7785.475565	7787.825472	7784.223345	7785.819111
337780	SP500	300	1786829400	7786.380863	7786.743626	7783.689031	7785.111167
336871	SP500	300	1786827900	7785.410490	7786.932985	7784.534603	7786.003809
336872	DOW	300	1786827900	53734.387354	53746.425610	53722.779064	53728.845369
336873	DXY	300	1786827900	99.635503	99.645964	99.624532	99.633012
337781	DOW	300	1786829400	53730.366351	53739.023756	53722.528167	53736.194688
336327	DXY	300	1786827000	99.632913	99.650625	99.624483	99.636213
337782	DXY	300	1786829400	99.633983	99.649032	99.626293	99.640206
338507	DOW	300	1786830600	53731.401662	53746.836762	53722.129446	53731.623660
338508	DXY	300	1786830600	99.643612	99.647643	99.626663	99.628127
337237	SP500	300	1786828500	7786.792248	7787.248900	7784.433273	7786.311436
337238	DOW	300	1786828500	53734.431999	53738.732535	53724.130875	53726.621073
337239	DXY	300	1786828500	99.636934	99.647403	99.624579	99.635372
336508	SP500	300	1786827300	7785.689939	7787.007859	7784.531734	7785.320914
336509	DOW	300	1786827300	53741.343967	53744.835208	53724.975324	53738.011302
336510	DXY	300	1786827300	99.636483	99.646230	99.623164	99.638063
339586	SP500	300	1786832400	7786.111327	7786.875346	7784.187003	7785.525650
339587	DOW	300	1786832400	53737.019089	53744.701961	53724.891228	53727.404203
339588	DXY	300	1786832400	99.635437	99.648998	99.627212	99.630209
337963	SP500	300	1786829700	7785.286538	7787.110273	7784.502183	7784.832093
337964	DOW	300	1786829700	53734.931732	53744.892162	53720.800566	53731.263724
337965	DXY	300	1786829700	99.642635	99.646505	99.621124	99.641255
338323	SP500	300	1786830300	7785.984909	7787.228028	7784.475615	7785.757515
338324	DOW	300	1786830300	53733.444903	53742.380804	53724.520993	53731.285305
338325	DXY	300	1786830300	99.644562	99.646225	99.624211	99.641537
338686	SP500	300	1786830900	7785.842758	7786.806802	7784.370782	7785.417294
338687	DOW	300	1786830900	53730.163286	53743.643252	53724.231600	53733.740918
338688	DXY	300	1786830900	99.629328	99.643191	99.624837	99.628113
340135	SP500	300	1786833300	7786.049843	7786.778296	7784.444058	7785.856476
340136	DOW	300	1786833300	53734.057324	53740.788240	53725.968947	53729.758491
340137	DXY	300	1786833300	99.638278	99.652493	99.627009	99.634684
339769	SP500	300	1786832700	7785.574067	7787.478889	7784.371439	7784.690031
339770	DOW	300	1786832700	53727.249651	53741.522263	53722.163060	53730.141037
339771	DXY	300	1786832700	99.631068	99.647110	99.621520	99.640375
339046	SP500	300	1786831500	7785.467814	7786.718432	7784.675950	7785.496391
339047	DOW	300	1786831500	53721.879286	53742.616618	53716.123419	53729.317198
339048	DXY	300	1786831500	99.634905	99.649253	99.622334	99.634066
339406	SP500	300	1786832100	7786.592075	7786.903065	7784.954455	7785.866934
339407	DOW	300	1786832100	53732.356939	53745.343578	53722.074334	53736.553992
340318	SP500	300	1786833600	7786.060511	7787.285803	7783.516651	7786.178057
339408	DXY	300	1786832100	99.631695	99.646330	99.622928	99.633962
340319	DOW	300	1786833600	53730.934462	53743.664304	53724.021745	53726.709198
340320	DXY	300	1786833600	99.633545	99.648785	99.625935	99.634032
340681	SP500	300	1786834200	7786.319784	7787.165625	7784.354965	7785.366478
340682	DOW	300	1786834200	53733.048268	53741.018700	53724.661024	53734.355616
340683	DXY	300	1786834200	99.632468	99.647230	99.624730	99.632332
340864	SP500	300	1786834500	7785.283113	7786.873444	7784.442917	7786.199707
340865	DOW	300	1786834500	53735.458840	53743.781315	53724.179621	53733.407660
340866	DXY	300	1786834500	99.630781	99.652328	99.621828	99.630600
341048	DOW	300	1786834800	53733.765467	53742.348161	53724.247255	53735.066523
341049	DXY	300	1786834800	99.631500	99.646377	99.623684	99.639120
341776	SP500	300	1786836000	7784.672877	7787.698268	7784.420935	7785.456126
341227	SP500	300	1786835100	7786.341877	7787.381071	7784.472327	7786.465851
341228	DOW	300	1786835100	53736.041703	53742.108512	53721.599304	53734.878605
341229	DXY	300	1786835100	99.639999	99.648184	99.623105	99.634038
341410	SP500	300	1786835400	7786.479838	7787.202049	7784.861662	7785.397586
341411	DOW	300	1786835400	53733.302518	53741.602418	53724.868709	53733.302651
341412	DXY	300	1786835400	99.634963	99.642190	99.627701	99.639879
341593	SP500	300	1786835700	7785.151784	7786.852866	7784.770780	7784.887191
341594	DOW	300	1786835700	53732.701861	53743.916055	53718.204897	53732.029062
341595	DXY	300	1786835700	99.641928	99.647298	99.626608	99.632198
345045	DXY	300	1786841400	99.638809	99.645961	99.626458	99.628778
344128	SP500	300	1786839900	7785.713576	7786.843747	7784.035087	7785.658658
344129	DOW	300	1786839900	53738.040234	53741.124318	53720.372322	53730.175999
344130	DXY	300	1786839900	99.633425	99.648635	99.622574	99.633232
343585	SP500	300	1786839000	7785.342323	7787.287908	7783.657633	7784.494854
343586	DOW	300	1786839000	53737.273988	53744.321905	53724.152054	53733.749231
343587	DXY	300	1786839000	99.638638	99.647174	99.620454	99.639632
345950	DOW	300	1786842900	53734.118119	53742.935380	53724.429417	53730.514296
345951	DXY	300	1786842900	99.637573	99.647531	99.625108	99.637586
344677	SP500	300	1786840800	7786.353183	7786.852029	7784.077979	7786.047067
343045	SP500	300	1786838100	7786.067547	7787.109039	7784.499639	7785.390757
343046	DOW	300	1786838100	53729.632900	53741.147537	53722.234919	53731.266462
343047	DXY	300	1786838100	99.628902	99.644949	99.623782	99.640227
344678	DOW	300	1786840800	53732.400312	53743.430502	53724.375356	53732.934307
342865	SP500	300	1786837800	7785.032256	7787.047073	7784.043034	7785.810834
342866	DOW	300	1786837800	53733.245499	53743.539893	53725.134004	53731.425820
342316	SP500	300	1786836900	7785.367390	7786.945766	7784.061815	7785.182032
342317	DOW	300	1786836900	53726.990617	53739.194852	53718.985441	53731.333157
342318	DXY	300	1786836900	99.636872	99.645592	99.625525	99.638740
341777	DOW	300	1786836000	53731.133003	53742.805440	53723.004102	53737.535118
341778	DXY	300	1786836000	99.634619	99.645772	99.626840	99.635946
342867	DXY	300	1786837800	99.642592	99.651660	99.625467	99.630104
344679	DXY	300	1786840800	99.623546	99.644842	99.619321	99.637161
343225	SP500	300	1786838400	7785.471548	7786.904145	7784.171598	7785.003608
343226	DOW	300	1786838400	53730.917742	53741.727446	53720.723269	53732.918892
343227	DXY	300	1786838400	99.638581	99.645380	99.624400	99.632785
342682	SP500	300	1786837500	7785.512953	7787.130679	7784.428071	7784.785342
341956	SP500	300	1786836300	7785.298928	7786.927018	7784.045405	7784.506962
341957	DOW	300	1786836300	53738.352173	53742.758115	53724.013565	53732.233489
341958	DXY	300	1786836300	99.638117	99.642785	99.622660	99.637551
342683	DOW	300	1786837500	53723.440952	53745.110500	53723.440952	53734.184629
342684	DXY	300	1786837500	99.634372	99.651991	99.624363	99.643211
344860	SP500	300	1786841100	7785.786576	7786.770676	7784.668033	7785.629267
344861	DOW	300	1786841100	53732.947845	53742.375584	53723.889990	53736.714064
344862	DXY	300	1786841100	99.636697	99.645000	99.626137	99.637927
346500	DXY	300	1786843800	99.638203	99.646273	99.624433	99.632821
345409	SP500	300	1786842000	7786.152900	7787.095693	7784.373150	7784.996088
343405	SP500	300	1786838700	7784.771332	7786.360701	7784.334437	7785.518034
343406	DOW	300	1786838700	53734.008017	53741.210069	53719.843969	53735.463073
343407	DXY	300	1786838700	99.630502	99.650845	99.623610	99.640131
345410	DOW	300	1786842000	53727.308316	53743.899342	53720.177910	53729.225674
345411	DXY	300	1786842000	99.630786	99.645953	99.622637	99.633641
342136	SP500	300	1786836600	7784.738208	7786.999375	7784.019268	7785.608481
342137	DOW	300	1786836600	53730.098684	53745.066227	53725.250615	53726.964640
342138	DXY	300	1786836600	99.636718	99.647136	99.627779	99.637123
342499	SP500	300	1786837200	7785.371451	7786.758312	7784.666993	7785.330596
342500	DOW	300	1786837200	53732.220753	53745.281290	53724.691534	53725.046966
342501	DXY	300	1786837200	99.640773	99.648147	99.628354	99.633663
344311	SP500	300	1786840200	7785.672657	7787.008119	7784.025745	7786.067759
343945	SP500	300	1786839600	7785.624484	7787.476700	7784.281711	7785.555105
343946	DOW	300	1786839600	53730.002951	53741.719667	53723.449540	53738.142381
343765	SP500	300	1786839300	7784.246754	7787.155283	7783.866325	7785.320260
343766	DOW	300	1786839300	53732.032114	53743.882654	53724.667038	53730.626161
343767	DXY	300	1786839300	99.640830	99.646300	99.624882	99.631920
343947	DXY	300	1786839600	99.631263	99.644604	99.625728	99.635712
344312	DOW	300	1786840200	53730.913331	53744.141204	53723.039516	53737.193560
344313	DXY	300	1786840200	99.635201	99.646281	99.624001	99.639119
344494	SP500	300	1786840500	7785.948822	7787.073535	7784.092995	7786.257492
344495	DOW	300	1786840500	53738.243277	53741.872623	53723.766720	53734.294265
344496	DXY	300	1786840500	99.638222	99.645389	99.621943	99.624237
345226	SP500	300	1786841700	7785.754430	7786.788083	7784.289197	7786.036592
345227	DOW	300	1786841700	53734.967095	53743.133389	53722.864544	53727.112473
345228	DXY	300	1786841700	99.626590	99.644550	99.625687	99.632422
345769	SP500	300	1786842600	7785.677311	7787.121525	7784.273834	7785.080994
345770	DOW	300	1786842600	53735.101740	53747.786526	53719.994978	53734.958544
345771	DXY	300	1786842600	99.638434	99.649091	99.627462	99.635546
345043	SP500	300	1786841400	7785.832823	7787.271340	7784.565627	7786.044783
345044	DOW	300	1786841400	53736.789786	53741.343805	53721.126947	53734.396581
347049	DXY	300	1786844700	99.640051	99.646270	99.627195	99.635449
345589	SP500	300	1786842300	7785.305762	7787.425810	7784.575070	7785.569479
345590	DOW	300	1786842300	53730.469723	53744.132984	53721.793491	53733.819868
345591	DXY	300	1786842300	99.633626	99.645214	99.623150	99.638541
346499	DOW	300	1786843800	53735.870499	53741.800351	53720.670510	53730.271051
346132	SP500	300	1786843200	7786.171068	7787.509445	7784.521600	7785.840362
346133	DOW	300	1786843200	53732.627740	53740.807738	53719.998259	53727.898180
346134	DXY	300	1786843200	99.637617	99.646355	99.623645	99.637862
345949	SP500	300	1786842900	7785.091791	7787.220286	7784.359733	7785.873246
346498	SP500	300	1786843800	7785.452176	7787.022952	7784.730488	7785.891325
346315	SP500	300	1786843500	7785.669630	7786.966762	7783.954785	7785.330601
346316	DOW	300	1786843500	53730.003353	53740.833740	53723.125282	53734.692286
346317	DXY	300	1786843500	99.635635	99.645808	99.629733	99.638443
346681	SP500	300	1786844100	7786.000044	7787.299471	7784.626249	7786.181733
346682	DOW	300	1786844100	53728.674948	53741.626257	53721.839896	53736.474928
346683	DXY	300	1786844100	99.634995	99.653342	99.627910	99.635606
346864	SP500	300	1786844400	7785.965881	7786.886506	7784.816132	7785.577769
346865	DOW	300	1786844400	53734.532640	53739.358999	53722.340095	53727.850087
346866	DXY	300	1786844400	99.637679	99.646967	99.625430	99.641822
347047	SP500	300	1786844700	7785.612098	7786.614951	7784.579916	7785.290041
347048	DOW	300	1786844700	53729.410102	53738.932533	53725.207972	53733.756445
349395	DXY	300	1786848600	99.638267	99.646647	99.623818	99.634472
349755	DXY	300	1786849200	99.641961	99.648384	99.626993	99.634353
349933	SP500	300	1786849500	7787.116911	7787.349321	7783.992896	7785.240379
349934	DOW	300	1786849500	53731.485831	53740.226309	53723.935037	53735.914278
347227	SP500	300	1786845000	7785.210962	7787.496516	7784.220944	7785.287354
347228	DOW	300	1786845000	53735.851332	53747.370449	53723.880368	53735.597526
347229	DXY	300	1786845000	99.635268	99.649282	99.625797	99.632558
349935	DXY	300	1786849500	99.631934	99.644168	99.626029	99.632388
347767	SP500	300	1786845900	7785.856927	7786.842006	7784.333487	7786.315582
347768	DOW	300	1786845900	53730.264332	53741.840325	53721.211809	53735.384364
347769	DXY	300	1786845900	99.635991	99.647459	99.626033	99.639687
349033	SP500	300	1786848000	7785.648734	7786.493879	7783.862365	7786.403242
349034	DOW	300	1786848000	53727.850875	53741.166679	53722.674396	53738.116686
349035	DXY	300	1786848000	99.636091	99.646058	99.627961	99.641668
348493	SP500	300	1786847100	7785.929761	7787.153284	7784.117432	7785.929398
348494	DOW	300	1786847100	53730.878067	53742.759985	53721.041619	53734.489482
348495	DXY	300	1786847100	99.637207	99.648874	99.623906	99.631377
348310	SP500	300	1786846800	7786.244407	7786.984337	7784.415948	7785.994653
348311	DOW	300	1786846800	53733.632911	53741.846063	53725.023908	53729.598029
347407	SP500	300	1786845300	7785.216309	7786.687299	7784.498850	7786.581212
347408	DOW	300	1786845300	53734.725013	53739.089177	53724.588080	53733.532272
347409	DXY	300	1786845300	99.632106	99.648416	99.625370	99.628108
348312	DXY	300	1786846800	99.638030	99.649326	99.627625	99.635137
348127	SP500	300	1786846500	7785.254368	7786.920511	7784.185162	7786.191942
348128	DOW	300	1786846500	53734.936191	53743.007157	53721.904684	53733.232185
348129	DXY	300	1786846500	99.632426	99.646203	99.627431	99.637714
351578	DOW	300	1786852200	53725.601335	53742.017771	53723.168514	53731.736612
349573	SP500	300	1786848900	7786.064715	7786.877235	7784.256499	7786.174949
349574	DOW	300	1786848900	53735.886490	53741.077317	53722.508443	53732.059756
349575	DXY	300	1786848900	99.632343	99.646221	99.627019	99.642066
348673	SP500	300	1786847400	7785.849273	7787.122107	7784.817244	7785.283324
348674	DOW	300	1786847400	53734.715406	53740.973621	53723.221411	53739.331092
348675	DXY	300	1786847400	99.630274	99.645269	99.623783	99.634229
347587	SP500	300	1786845600	7786.600019	7787.361449	7784.034531	7785.572959
347588	DOW	300	1786845600	53734.781778	53741.880329	53721.068449	53732.049719
347589	DXY	300	1786845600	99.626186	99.651986	99.624692	99.633518
347947	SP500	300	1786846200	7786.274822	7786.707242	7784.542035	7785.272938
347948	DOW	300	1786846200	53735.779533	53738.087213	53722.736995	53734.526083
347949	DXY	300	1786846200	99.640035	99.645616	99.625928	99.633972
351579	DXY	300	1786852200	99.633063	99.647833	99.628427	99.636822
351757	SP500	300	1786852500	7785.466679	7787.342809	7784.281886	7786.100988
351939	DXY	300	1786852800	99.630654	99.649346	99.626480	99.641816
350845	SP500	300	1786851000	7785.317530	7787.022009	7784.187470	7785.659791
350846	DOW	300	1786851000	53730.716264	53744.530747	53719.278084	53730.189720
350847	DXY	300	1786851000	99.636890	99.645412	99.624937	99.637579
351577	SP500	300	1786852200	7786.670122	7787.052729	7784.251530	7785.264040
348853	SP500	300	1786847700	7785.335876	7787.045992	7784.265689	7785.701122
348854	DOW	300	1786847700	53739.050342	53740.983839	53720.088144	53727.939341
348855	DXY	300	1786847700	99.632655	99.644263	99.620799	99.634682
351211	SP500	300	1786851600	7786.318011	7787.527753	7784.794026	7785.419138
351212	DOW	300	1786851600	53734.448927	53743.686604	53723.962810	53732.347186
351028	SP500	300	1786851300	7785.472051	7787.446306	7783.815184	7786.271678
351029	DOW	300	1786851300	53729.647076	53744.934076	53723.866072	53736.370029
351030	DXY	300	1786851300	99.638172	99.643422	99.618550	99.643422
351758	DOW	300	1786852500	53732.946386	53740.632832	53725.125466	53735.942072
350113	SP500	300	1786849800	7785.509690	7787.094201	7783.975428	7786.148414
350114	DOW	300	1786849800	53734.452995	53743.121722	53722.594985	53734.622849
350115	DXY	300	1786849800	99.634304	99.646729	99.625485	99.634573
349393	SP500	300	1786848600	7786.050070	7787.018672	7784.515286	7786.053920
349394	DOW	300	1786848600	53730.161119	53743.990046	53723.731688	53735.844334
349213	SP500	300	1786848300	7786.233948	7786.881852	7784.622226	7785.895821
349214	DOW	300	1786848300	53738.228512	53743.089535	53725.072497	53730.109608
349215	DXY	300	1786848300	99.639735	99.646339	99.620406	99.638299
349753	SP500	300	1786849200	7786.060059	7787.234624	7783.770877	7787.084481
349754	DOW	300	1786849200	53730.710141	53744.940486	53722.799663	53729.676786
351759	DXY	300	1786852500	99.637317	99.648446	99.624076	99.629984
350479	SP500	300	1786850400	7786.421744	7787.318556	7783.478906	7786.192117
350480	DOW	300	1786850400	53735.495210	53742.837477	53723.364493	53736.594371
350481	DXY	300	1786850400	99.634481	99.645012	99.624639	99.636025
350296	SP500	300	1786850100	7785.945622	7787.866800	7784.345280	7786.469126
350297	DOW	300	1786850100	53733.762714	53738.315406	53721.420345	53735.075523
350298	DXY	300	1786850100	99.635147	99.647116	99.626672	99.632622
351394	SP500	300	1786851900	7785.435082	7787.518475	7784.502906	7786.373593
350662	SP500	300	1786850700	7785.932314	7787.143681	7783.915099	7785.514829
350663	DOW	300	1786850700	53738.183255	53739.934051	53719.042842	53732.837726
350664	DXY	300	1786850700	99.635408	99.651626	99.627565	99.635635
351213	DXY	300	1786851600	99.644086	99.648566	99.625719	99.636435
351395	DOW	300	1786851900	53731.220240	53738.792305	53721.655758	53727.596781
351396	DXY	300	1786851900	99.637459	99.653479	99.627017	99.634673
352119	DXY	300	1786853100	99.643486	99.653489	99.629005	99.638270
351937	SP500	300	1786852800	7786.099295	7786.987363	7784.132263	7785.273179
351938	DOW	300	1786852800	53734.824361	53739.985922	53722.886685	53738.450931
352299	DXY	300	1786853400	99.637363	99.646971	99.626738	99.628869
352117	SP500	300	1786853100	7784.962968	7787.316926	7784.372832	7786.352293
352118	DOW	300	1786853100	53739.778260	53742.398766	53725.535069	53730.423500
352478	DOW	300	1786853700	53728.022212	53741.252096	53720.668073	53733.330259
352297	SP500	300	1786853400	7786.557290	7787.430131	7784.722063	7785.475649
352298	DOW	300	1786853400	53728.698498	53742.050318	53722.943378	53728.883455
352477	SP500	300	1786853700	7785.586671	7787.683625	7784.211514	7786.453205
355204	SP500	300	1786858200	7786.203772	7787.372882	7784.873912	7785.744485
355205	DOW	300	1786858200	53731.936828	53742.390160	53723.841931	53732.039016
355206	DXY	300	1786858200	99.634621	99.644973	99.621394	99.640193
357211	SP500	300	1786861500	7785.874694	7786.992827	7784.552641	7786.418653
355564	SP500	300	1786858800	7786.103805	7787.221859	7783.553037	7785.896712
355024	SP500	300	1786857900	7784.726321	7787.074325	7783.772570	7785.928814
353203	SP500	300	1786854900	7785.238280	7787.143854	7784.394412	7786.069713
353204	DOW	300	1786854900	53735.488455	53739.807068	53723.659257	53730.262751
353205	DXY	300	1786854900	99.643339	99.647850	99.621915	99.636622
352837	SP500	300	1786854300	7785.680428	7787.312003	7784.520013	7785.667538
352838	DOW	300	1786854300	53731.526529	53739.566910	53718.061360	53729.652407
352839	DXY	300	1786854300	99.639582	99.654137	99.626339	99.645104
355025	DOW	300	1786857900	53743.645546	53745.045800	53724.115127	53731.773892
354301	SP500	300	1786856700	7784.518669	7786.973392	7784.279945	7785.687975
354302	DOW	300	1786856700	53727.186879	53739.090792	53718.231789	53736.351430
354303	DXY	300	1786856700	99.639045	99.647854	99.624047	99.637531
355026	DXY	300	1786857900	99.644041	99.649110	99.623945	99.633053
355565	DOW	300	1786858800	53732.609740	53741.339552	53724.595635	53734.014618
355566	DXY	300	1786858800	99.639652	99.648924	99.625509	99.632591
355384	SP500	300	1786858500	7786.031306	7787.350919	7783.693117	7785.949973
355385	DOW	300	1786858500	53731.903376	53743.689280	53722.081955	53733.814911
355386	DXY	300	1786858500	99.639577	99.646023	99.623352	99.638876
353752	SP500	300	1786855800	7786.614412	7787.729630	7784.450734	7785.733660
353753	DOW	300	1786855800	53724.562086	53743.524920	53719.428583	53732.589172
353754	DXY	300	1786855800	99.631529	99.647471	99.623981	99.631811
353569	SP500	300	1786855500	7786.048163	7786.706875	7784.613161	7786.489489
353570	DOW	300	1786855500	53723.694388	53738.685140	53719.200343	53725.801286
353571	DXY	300	1786855500	99.637740	99.651239	99.623181	99.633609
353020	SP500	300	1786854600	7785.562121	7786.823437	7784.634836	7785.191975
353021	DOW	300	1786854600	53727.998870	53741.631153	53720.718153	53734.531993
353022	DXY	300	1786854600	99.645288	99.650487	99.626286	99.641172
352479	DXY	300	1786853700	99.626487	99.645842	99.625726	99.641548
353935	SP500	300	1786856100	7785.531552	7787.246774	7784.552554	7786.494435
353936	DOW	300	1786856100	53733.548670	53742.833794	53724.680877	53733.052632
353937	DXY	300	1786856100	99.631276	99.648175	99.619474	99.633833
357212	DOW	300	1786861500	53731.950562	53738.182934	53717.865396	53730.314960
354664	SP500	300	1786857300	7786.316339	7787.202029	7784.785410	7785.132737
352657	SP500	300	1786854000	7786.632923	7786.863930	7784.780344	7785.776572
352658	DOW	300	1786854000	53734.443314	53743.971634	53719.234430	53731.338884
352659	DXY	300	1786854000	99.642460	99.644858	99.621282	99.637108
353386	SP500	300	1786855200	7785.986995	7787.097965	7784.164704	7785.799817
353387	DOW	300	1786855200	53728.368860	53742.044524	53722.986360	53725.649812
353388	DXY	300	1786855200	99.636913	99.648580	99.625340	99.636801
354665	DOW	300	1786857300	53733.901303	53740.455404	53722.663739	53732.466914
354666	DXY	300	1786857300	99.634368	99.645151	99.625265	99.641016
357213	DXY	300	1786861500	99.644919	99.647041	99.623288	99.642906
357393	DXY	300	1786861800	99.644362	99.648307	99.628194	99.629679
357573	DXY	300	1786862100	99.627280	99.643506	99.623385	99.639836
357391	SP500	300	1786861800	7786.199208	7787.151040	7784.674992	7785.665601
354118	SP500	300	1786856400	7786.244979	7786.890938	7784.521742	7784.575637
354119	DOW	300	1786856400	53734.507653	53741.244775	53723.054196	53727.848223
354120	DXY	300	1786856400	99.633925	99.649572	99.624149	99.639006
357028	SP500	300	1786861200	7785.377227	7787.078322	7783.746860	7785.710179
354484	SP500	300	1786857000	7785.489289	7787.446894	7784.991397	7786.095407
354485	DOW	300	1786857000	53735.606260	53743.787981	53721.988262	53735.989754
354486	DXY	300	1786857000	99.639312	99.650410	99.629321	99.636464
354844	SP500	300	1786857600	7784.964867	7787.493060	7784.444250	7784.652020
354845	DOW	300	1786857600	53730.411199	53743.232026	53724.378983	53742.997422
354846	DXY	300	1786857600	99.643185	99.649995	99.625823	99.642414
356113	SP500	300	1786859700	7785.547458	7787.399540	7783.962497	7786.152838
356114	DOW	300	1786859700	53734.288092	53742.625039	53721.649369	53731.934612
356115	DXY	300	1786859700	99.640713	99.644505	99.625388	99.635413
355747	SP500	300	1786859100	7786.084236	7786.814074	7784.011133	7785.714857
355748	DOW	300	1786859100	53734.992929	53741.192052	53723.168499	53727.132819
355749	DXY	300	1786859100	99.632109	99.648255	99.627014	99.630079
356296	SP500	300	1786860000	7786.220393	7786.992351	7783.978049	7786.034025
356297	DOW	300	1786860000	53730.092410	53744.559558	53722.583163	53730.909092
356298	DXY	300	1786860000	99.636773	99.644267	99.626804	99.635389
355930	SP500	300	1786859400	7785.896807	7786.931586	7784.364507	7785.406218
355931	DOW	300	1786859400	53725.329440	53738.631579	53721.630652	53733.913593
355932	DXY	300	1786859400	99.631709	99.647529	99.623918	99.639715
356479	SP500	300	1786860300	7785.780516	7786.813302	7784.262191	7785.947968
356480	DOW	300	1786860300	53729.016603	53741.271715	53720.438111	53733.965772
356481	DXY	300	1786860300	99.637761	99.645947	99.624161	99.628388
356662	SP500	300	1786860600	7785.886342	7786.656813	7784.196602	7786.052223
356663	DOW	300	1786860600	53733.135268	53742.594790	53715.467244	53734.571293
357029	DOW	300	1786861200	53729.196622	53743.509347	53724.563166	53731.069334
357030	DXY	300	1786861200	99.639366	99.649363	99.627413	99.645574
356664	DXY	300	1786860600	99.629079	99.646883	99.627584	99.634881
356845	SP500	300	1786860900	7786.256197	7786.695951	7784.703211	7785.590989
356846	DOW	300	1786860900	53733.242083	53740.830555	53721.958042	53730.738936
356847	DXY	300	1786860900	99.634370	99.650347	99.630441	99.639159
357392	DOW	300	1786861800	53730.740925	53745.448808	53725.209477	53734.670415
357753	DXY	300	1786862400	99.640803	99.648032	99.624796	99.648032
357571	SP500	300	1786862100	7785.714590	7787.167144	7784.359720	7785.639112
357572	DOW	300	1786862100	53736.358637	53738.609092	53723.898393	53736.438893
357931	SP500	300	1786862700	7785.793038	7787.480828	7784.896380	7785.432272
357751	SP500	300	1786862400	7785.685804	7786.918841	7784.283636	7785.877543
357752	DOW	300	1786862400	53738.410572	53742.022109	53723.153496	53729.486524
360488	DOW	300	1786866900	53735.677782	53739.570940	53722.142172	53732.181440
358660	SP500	300	1786863900	7785.721927	7787.172366	7784.509206	7785.550387
358294	SP500	300	1786863300	7785.471535	7786.796915	7784.125509	7786.089744
358295	DOW	300	1786863300	53729.969095	53740.230659	53720.663857	53733.968935
358296	DXY	300	1786863300	99.631844	99.648079	99.626141	99.630619
358661	DOW	300	1786863900	53740.057059	53744.068511	53720.999024	53731.295650
358662	DXY	300	1786863900	99.638824	99.647094	99.623917	99.634472
360489	DXY	300	1786866900	99.638018	99.644756	99.626791	99.632366
360121	SP500	300	1786866300	7786.133012	7786.763791	7784.643488	7785.226630
359938	SP500	300	1786866000	7785.904974	7787.531435	7784.468453	7785.834628
359939	DOW	300	1786866000	53732.696162	53743.724653	53720.931575	53730.181751
359940	DXY	300	1786866000	99.631627	99.654032	99.625267	99.638977
360122	DOW	300	1786866300	53731.420536	53741.380139	53722.744917	53731.328161
360123	DXY	300	1786866300	99.639563	99.647719	99.624433	99.635488
360671	DOW	300	1786867200	53731.934934	53740.330462	53717.252772	53733.458043
360672	DXY	300	1786867200	99.632219	99.645172	99.625757	99.644783
359755	SP500	300	1786865700	7785.302630	7787.000658	7784.555278	7786.127608
357932	DOW	300	1786862700	53730.208122	53739.571736	53723.792798	53732.333985
357933	DXY	300	1786862700	99.649188	99.649724	99.624264	99.640047
359756	DOW	300	1786865700	53732.032527	53740.509302	53725.662252	53734.581297
359757	DXY	300	1786865700	99.628895	99.649629	99.628276	99.630925
358477	SP500	300	1786863600	7786.397987	7787.357763	7784.657713	7785.989332
358478	DOW	300	1786863600	53731.928890	53742.170958	53718.024446	53741.453553
358479	DXY	300	1786863600	99.632837	99.646767	99.621864	99.637507
359206	SP500	300	1786864800	7785.376189	7787.165418	7784.794938	7786.377077
359207	DOW	300	1786864800	53733.687537	53739.000060	53720.694609	53735.331112
359208	DXY	300	1786864800	99.639810	99.648415	99.624998	99.631246
359026	SP500	300	1786864500	7785.815022	7787.387188	7784.420679	7785.649099
359027	DOW	300	1786864500	53738.573610	53743.818115	53723.805685	53735.657331
359028	DXY	300	1786864500	99.635565	99.648039	99.625721	99.637990
358111	SP500	300	1786863000	7785.433347	7786.856955	7784.845122	7785.409626
358112	DOW	300	1786863000	53731.728374	53740.154894	53724.285007	53730.252850
358113	DXY	300	1786863000	99.638580	99.646084	99.626435	99.632625
362136	DXY	300	1786869600	99.628007	99.644979	99.624096	99.638975
362501	DOW	300	1786870200	53743.302777	53744.010655	53720.595802	53734.019358
360304	SP500	300	1786866600	7785.097792	7787.130032	7783.976074	7785.000273
358843	SP500	300	1786864200	7785.469976	7786.728845	7784.734438	7785.695225
358844	DOW	300	1786864200	53729.432129	53741.663706	53724.513533	53736.865657
358845	DXY	300	1786864200	99.634616	99.646469	99.623279	99.635256
359389	SP500	300	1786865100	7786.421471	7787.144248	7784.353831	7786.333506
359390	DOW	300	1786865100	53736.880084	53739.747523	53723.636144	53731.981201
359391	DXY	300	1786865100	99.629339	99.653656	99.623883	99.635101
360305	DOW	300	1786866600	53729.688444	53743.763662	53724.279201	53734.959576
360306	DXY	300	1786866600	99.634414	99.643272	99.626504	99.636218
361219	SP500	300	1786868100	7786.122572	7787.080370	7784.170507	7785.201522
361220	DOW	300	1786868100	53735.491702	53741.229190	53723.123281	53733.579943
361221	DXY	300	1786868100	99.636352	99.644147	99.624774	99.637918
361951	SP500	300	1786869300	7786.139631	7787.323041	7784.254113	7785.078440
361952	DOW	300	1786869300	53729.061714	53744.420038	53725.016836	53735.702381
361768	SP500	300	1786869000	7785.441356	7787.506980	7784.203354	7786.163029
360853	SP500	300	1786867500	7786.141036	7786.949565	7784.136384	7785.902380
359572	SP500	300	1786865400	7786.257503	7786.992793	7784.148326	7785.307512
359573	DOW	300	1786865400	53732.044429	53741.568997	53722.901138	53731.281331
359574	DXY	300	1786865400	99.633861	99.646622	99.625474	99.630243
360854	DOW	300	1786867500	53734.565531	53740.557854	53723.274055	53736.476514
360855	DXY	300	1786867500	99.643318	99.646347	99.619676	99.628707
361036	SP500	300	1786867800	7785.624866	7787.427462	7784.704886	7786.338346
361037	DOW	300	1786867800	53737.946500	53745.555249	53721.032295	53733.724361
361038	DXY	300	1786867800	99.629078	99.649586	99.628584	99.638016
361769	DOW	300	1786869000	53734.571548	53738.478781	53725.210642	53728.818828
361770	DXY	300	1786869000	99.639622	99.647486	99.627545	99.641903
360487	SP500	300	1786866900	7785.226958	7787.057760	7784.234760	7785.422506
360670	SP500	300	1786867200	7785.676188	7786.537840	7784.761073	7786.341336
361953	DXY	300	1786869300	99.642119	99.649062	99.625539	99.625619
361585	SP500	300	1786868700	7785.354870	7786.901525	7784.641381	7785.375162
361586	DOW	300	1786868700	53741.538727	53743.594991	53726.707784	53735.739791
361402	SP500	300	1786868400	7785.503561	7787.265657	7783.916804	7785.480292
361403	DOW	300	1786868400	53735.611059	53742.947198	53724.638392	53741.163295
361587	DXY	300	1786868700	99.631978	99.644824	99.626629	99.641766
362502	DXY	300	1786870200	99.638326	99.651250	99.627322	99.627322
362317	SP500	300	1786869900	7785.520913	7786.831726	7784.180873	7785.972016
361404	DXY	300	1786868400	99.636659	99.649965	99.622658	99.632914
362318	DOW	300	1786869900	53737.805286	53742.509286	53722.764463	53742.509286
362319	DXY	300	1786869900	99.639848	99.644323	99.626403	99.639471
362134	SP500	300	1786869600	7785.250962	7786.805019	7784.402540	7785.381312
362135	DOW	300	1786869600	53736.480089	53741.505887	53723.137742	53736.746734
362681	DOW	300	1786870500	53732.762954	53740.223179	53722.239999	53734.578129
362682	DXY	300	1786870500	99.626816	99.648866	99.624474	99.642781
362500	SP500	300	1786870200	7786.125299	7787.502648	7784.769901	7785.654481
362680	SP500	300	1786870500	7785.683288	7787.235470	7784.054739	7785.692897
362860	SP500	300	1786870800	7785.590366	7787.069601	7784.813188	7785.919909
362861	DOW	300	1786870800	53733.937164	53743.265817	53723.050050	53737.119694
362862	DXY	300	1786870800	99.645106	99.650763	99.625152	99.627559
363043	SP500	300	1786871100	7786.107716	7787.602396	7783.346135	7786.067915
363044	DOW	300	1786871100	53737.862433	53740.710058	53724.577091	53734.663308
363045	DXY	300	1786871100	99.626190	99.648789	99.626190	99.635456
363226	SP500	300	1786871400	7785.876099	7787.225602	7784.004707	7785.862389
363227	DOW	300	1786871400	53735.875732	53740.716349	53722.940912	53729.249060
363228	DXY	300	1786871400	99.634611	99.648863	99.620971	99.639605
365789	DOW	300	1786875600	53735.458708	53742.988414	53719.509973	53734.003699
365790	DXY	300	1786875600	99.640553	99.650714	99.617974	99.639172
367986	DXY	300	1786879200	99.632894	99.644569	99.624859	99.635278
365056	SP500	300	1786874400	7785.113611	7786.958331	7784.194391	7786.106166
365057	DOW	300	1786874400	53729.968956	53741.585341	53723.184730	53729.693126
365058	DXY	300	1786874400	99.634094	99.646796	99.624127	99.638095
363409	SP500	300	1786871700	7786.161697	7786.936167	7784.745652	7785.461476
363410	DOW	300	1786871700	53730.800558	53741.716645	53721.401736	53741.479022
363411	DXY	300	1786871700	99.641327	99.647523	99.621460	99.639809
367801	SP500	300	1786878900	7785.730416	7786.801644	7784.249160	7785.753765
367802	DOW	300	1786878900	53731.113328	53742.038401	53720.163300	53733.450289
367069	SP500	300	1786877700	7785.935406	7787.095168	7784.645079	7786.196794
367070	DOW	300	1786877700	53730.179764	53742.276269	53721.920939	53723.743645
367071	DXY	300	1786877700	99.641808	99.646424	99.624642	99.634405
363958	SP500	300	1786872600	7786.334790	7787.086115	7784.728696	7786.270180
363959	DOW	300	1786872600	53728.801815	53741.407584	53723.718024	53726.706746
363960	DXY	300	1786872600	99.634180	99.644402	99.625736	99.633072
367803	DXY	300	1786878900	99.631269	99.646716	99.626731	99.633571
367435	SP500	300	1786878300	7785.646143	7787.038080	7783.209784	7786.483639
367436	DOW	300	1786878300	53735.241553	53741.267804	53721.505878	53736.854031
367252	SP500	300	1786878000	7786.261778	7786.833082	7783.541547	7785.948180
365422	SP500	300	1786875000	7785.556142	7787.285128	7784.678417	7785.842557
363592	SP500	300	1786872000	7785.326605	7786.895503	7784.553757	7786.058739
363593	DOW	300	1786872000	53740.934101	53742.624219	53723.495436	53730.989896
363594	DXY	300	1786872000	99.638401	99.647706	99.628518	99.634566
365423	DOW	300	1786875000	53732.376785	53742.474361	53721.049149	53730.365225
365424	DXY	300	1786875000	99.633877	99.648725	99.622760	99.633123
364507	SP500	300	1786873500	7784.991151	7787.543382	7783.705363	7786.390017
364508	DOW	300	1786873500	53732.039744	53746.842918	53722.200686	53732.740518
364509	DXY	300	1786873500	99.627121	99.645222	99.622499	99.632493
364690	SP500	300	1786873800	7786.093404	7786.847942	7784.008301	7786.527351
364691	DOW	300	1786873800	53731.612959	53743.190629	53721.336447	53727.737531
364692	DXY	300	1786873800	99.632893	99.648751	99.624701	99.635040
364324	SP500	300	1786873200	7784.675362	7788.004171	7784.461061	7784.940422
364325	DOW	300	1786873200	53731.226466	53739.629082	53718.054060	53733.710221
364326	DXY	300	1786873200	99.639307	99.644013	99.621260	99.628911
366337	SP500	300	1786876500	7786.623886	7787.243313	7783.662147	7785.828354
366338	DOW	300	1786876500	53734.710169	53741.862255	53724.555302	53734.318482
365605	SP500	300	1786875300	7786.144380	7787.241914	7784.433779	7786.737108
365606	DOW	300	1786875300	53729.068127	53741.385816	53722.090355	53736.991083
365607	DXY	300	1786875300	99.634123	99.644530	99.626476	99.639051
363775	SP500	300	1786872300	7786.229878	7786.950929	7784.150194	7786.317105
363776	DOW	300	1786872300	53730.614591	53740.318888	53725.065070	53729.649203
363777	DXY	300	1786872300	99.632348	99.645127	99.623552	99.636100
365239	SP500	300	1786874700	7785.927550	7787.426781	7784.027798	7785.490176
365240	DOW	300	1786874700	53731.471285	53742.657858	53715.205595	53730.554007
365241	DXY	300	1786874700	99.636955	99.646245	99.623998	99.633242
364873	SP500	300	1786874100	7786.410953	7787.393986	7784.231124	7785.149291
364874	DOW	300	1786874100	53727.022541	53740.012233	53720.832577	53729.605194
364875	DXY	300	1786874100	99.637368	99.653309	99.623235	99.635794
364141	SP500	300	1786872900	7786.422726	7786.696740	7784.062086	7784.710677
364142	DOW	300	1786872900	53728.418306	53740.630188	53719.994613	53729.248377
364143	DXY	300	1786872900	99.632597	99.645581	99.623005	99.639212
366339	DXY	300	1786876500	99.634344	99.647847	99.625415	99.634001
367253	DOW	300	1786878000	53722.498133	53740.907641	53721.660110	53737.243149
367254	DXY	300	1786878000	99.636028	99.647942	99.624723	99.640265
365971	SP500	300	1786875900	7785.569940	7787.130243	7784.276737	7785.318465
365972	DOW	300	1786875900	53733.730063	53741.990782	53724.302273	53730.706569
365973	DXY	300	1786875900	99.637076	99.647993	99.625579	99.636968
366703	SP500	300	1786877100	7785.636674	7787.057413	7784.320393	7785.776807
366704	DOW	300	1786877100	53735.586435	53742.121582	53723.972049	53731.268928
365788	SP500	300	1786875600	7786.826548	7787.256057	7784.001834	7785.797727
366520	SP500	300	1786876800	7785.963604	7787.332881	7783.964780	7785.788998
366521	DOW	300	1786876800	53732.495395	53741.221524	53721.431926	53736.019792
366522	DXY	300	1786876800	99.633480	99.647720	99.626568	99.631244
366154	SP500	300	1786876200	7785.171011	7787.144152	7784.542238	7786.476196
366155	DOW	300	1786876200	53732.789156	53744.047411	53723.263348	53733.045886
366156	DXY	300	1786876200	99.638144	99.647075	99.625131	99.636469
366705	DXY	300	1786877100	99.632301	99.649607	99.628324	99.639733
367618	SP500	300	1786878600	7786.776047	7787.135815	7784.295272	7785.724046
366886	SP500	300	1786877400	7785.935962	7787.222918	7784.838372	7786.099645
366887	DOW	300	1786877400	53732.614388	53737.915178	53721.973237	53731.701442
366888	DXY	300	1786877400	99.641310	99.647886	99.626760	99.641951
367437	DXY	300	1786878300	99.637969	99.651508	99.625730	99.631085
367619	DOW	300	1786878600	53736.779863	53742.815017	53715.986342	53731.868557
367620	DXY	300	1786878600	99.629144	99.652193	99.625774	99.633258
367984	SP500	300	1786879200	7785.470665	7787.025948	7784.170583	7784.997511
367985	DOW	300	1786879200	53731.812769	53739.737393	53723.370066	53732.917764
368164	SP500	300	1786879500	7784.920001	7787.072042	7784.600525	7784.854807
368165	DOW	300	1786879500	53732.946025	53742.669300	53725.437745	53735.560535
368166	DXY	300	1786879500	99.635393	99.645366	99.627477	99.639209
368347	SP500	300	1786879800	7785.005880	7787.394120	7784.228965	7785.364475
368348	DOW	300	1786879800	53734.373376	53742.200012	53725.819225	53730.638652
368349	DXY	300	1786879800	99.636967	99.646568	99.626893	99.632965
368530	SP500	300	1786880100	7785.109246	7787.754799	7784.618367	7785.410567
368531	DOW	300	1786880100	53729.827075	53743.467046	53721.498573	53729.992374
368532	DXY	300	1786880100	99.635017	99.644985	99.624570	99.641623
368713	SP500	300	1786880400	7785.288483	7786.819336	7784.588559	7785.750300
368714	DOW	300	1786880400	53729.611232	53740.810348	53722.417031	53733.136983
373650	DXY	300	1786888500	99.631786	99.643330	99.626218	99.630856
373830	DXY	300	1786888800	99.632327	99.644323	99.624065	99.638845
372187	SP500	300	1786886100	7785.134148	7786.672858	7784.174447	7785.243671
372188	DOW	300	1786886100	53731.883945	53743.434413	53723.580992	53730.713475
372189	DXY	300	1786886100	99.645073	99.648853	99.625295	99.632010
373648	SP500	300	1786888500	7785.322897	7787.413922	7784.240609	7785.280203
371455	SP500	300	1786884900	7785.386393	7787.134177	7783.615648	7784.959792
369445	SP500	300	1786881600	7786.096196	7786.505385	7784.247594	7785.796387
369446	DOW	300	1786881600	53737.032160	53747.745058	53725.101684	53735.492216
369447	DXY	300	1786881600	99.638837	99.646817	99.624036	99.639215
370540	SP500	300	1786883400	7785.510362	7787.173150	7784.823963	7785.091518
370541	DOW	300	1786883400	53729.670125	53743.313755	53722.800627	53728.810204
370542	DXY	300	1786883400	99.639473	99.649520	99.625833	99.634280
369079	SP500	300	1786881000	7786.033279	7786.777792	7783.935450	7785.340008
369080	DOW	300	1786881000	53738.266771	53741.669503	53720.481857	53735.456678
369081	DXY	300	1786881000	99.633005	99.647713	99.624793	99.630871
371456	DOW	300	1786884900	53726.336387	53743.350978	53718.999453	53734.410017
371457	DXY	300	1786884900	99.636934	99.646066	99.623447	99.636436
371272	SP500	300	1786884600	7786.018185	7787.568126	7784.157880	7785.529393
371273	DOW	300	1786884600	53734.157576	53744.631433	53723.269885	53727.775676
371274	DXY	300	1786884600	99.634377	99.645595	99.627204	99.638039
373465	SP500	300	1786888200	7785.408559	7786.960966	7784.799018	7785.533317
373466	DOW	300	1786888200	53726.729944	53743.562663	53722.751862	53733.167023
373467	DXY	300	1786888200	99.634171	99.648155	99.623222	99.631850
369991	SP500	300	1786882500	7785.917225	7787.244764	7784.470822	7785.427010
369992	DOW	300	1786882500	53724.657862	53743.738533	53721.559379	53736.304722
369993	DXY	300	1786882500	99.636751	99.646334	99.626183	99.641737
369808	SP500	300	1786882200	7785.814900	7786.561776	7784.260385	7786.102818
369809	DOW	300	1786882200	53728.279136	53747.855788	53724.425420	53726.075155
369810	DXY	300	1786882200	99.637174	99.647727	99.626462	99.638489
370174	SP500	300	1786882800	7785.433603	7786.932294	7783.907588	7785.128464
369262	SP500	300	1786881300	7785.290759	7787.198301	7784.558888	7786.376395
369263	DOW	300	1786881300	53736.177172	53743.815025	53725.316820	53736.685726
369264	DXY	300	1786881300	99.632366	99.646358	99.625599	99.640343
368715	DXY	300	1786880400	99.643287	99.647869	99.625731	99.636868
370175	DOW	300	1786882800	53736.088505	53742.422484	53720.325664	53730.502891
370176	DXY	300	1786882800	99.641988	99.646248	99.625739	99.637952
373282	SP500	300	1786887900	7785.782717	7787.386576	7784.571723	7785.524112
371821	SP500	300	1786885500	7786.857236	7787.387329	7783.950903	7785.549548
371822	DOW	300	1786885500	53733.788897	53740.950270	53722.117412	53736.545038
371823	DXY	300	1786885500	99.634883	99.653530	99.622635	99.632696
369625	SP500	300	1786881900	7785.508513	7787.265660	7784.231309	7785.963248
369626	DOW	300	1786881900	53734.755797	53744.004039	53720.183670	53728.129208
369627	DXY	300	1786881900	99.640682	99.649867	99.627041	99.638029
368896	SP500	300	1786880700	7786.030107	7787.597256	7784.195590	7785.779380
368897	DOW	300	1786880700	53735.056280	53739.180646	53720.630318	53737.660762
368898	DXY	300	1786880700	99.637523	99.651063	99.622817	99.630638
371638	SP500	300	1786885200	7785.003553	7787.377079	7783.792735	7786.906894
370906	SP500	300	1786884000	7786.062665	7787.292418	7784.618465	7785.251714
370907	DOW	300	1786884000	53726.141475	53743.831431	53723.390132	53732.243312
370908	DXY	300	1786884000	99.638472	99.647325	99.622824	99.636936
370357	SP500	300	1786883100	7785.269249	7787.370095	7784.048288	7785.442747
370358	DOW	300	1786883100	53730.903581	53742.723381	53721.864431	53731.290879
370359	DXY	300	1786883100	99.637325	99.646895	99.626447	99.640953
371639	DOW	300	1786885200	53736.255030	53740.596555	53723.550014	53735.423401
371640	DXY	300	1786885200	99.638531	99.647543	99.622849	99.636574
370723	SP500	300	1786883700	7785.093112	7786.870547	7784.000477	7785.911772
370724	DOW	300	1786883700	53729.246696	53740.154560	53719.630687	53727.017182
370725	DXY	300	1786883700	99.635625	99.648957	99.624854	99.639889
373283	DOW	300	1786887900	53735.493311	53747.821234	53722.346609	53725.639239
373284	DXY	300	1786887900	99.638504	99.649496	99.623865	99.634237
371089	SP500	300	1786884300	7785.442922	7786.974689	7784.666004	7785.938644
371090	DOW	300	1786884300	53730.578067	53743.527313	53723.194931	53733.021970
371091	DXY	300	1786884300	99.634603	99.644663	99.625945	99.633225
372736	SP500	300	1786887000	7786.572323	7787.188160	7784.610164	7785.551500
372737	DOW	300	1786887000	53738.224912	53746.816402	53723.693954	53735.501180
372738	DXY	300	1786887000	99.635363	99.645838	99.625655	99.632563
372916	SP500	300	1786887300	7785.458788	7787.288409	7784.451618	7785.216800
372370	SP500	300	1786886400	7785.359656	7787.052609	7783.980821	7785.568535
372371	DOW	300	1786886400	53731.241158	53743.367001	53724.850233	53736.152269
372372	DXY	300	1786886400	99.630720	99.647093	99.626381	99.638966
372553	SP500	300	1786886700	7785.367238	7787.149020	7784.740763	7786.667788
372004	SP500	300	1786885800	7785.706219	7787.786170	7784.202752	7784.877911
372005	DOW	300	1786885800	53737.593010	53742.669825	53724.880949	53730.399188
372006	DXY	300	1786885800	99.632578	99.648514	99.625936	99.644290
372554	DOW	300	1786886700	53737.923233	53742.116260	53721.359417	53736.091229
372555	DXY	300	1786886700	99.636631	99.647603	99.621762	99.632876
372917	DOW	300	1786887300	53733.641214	53744.075217	53722.712022	53736.481808
372918	DXY	300	1786887300	99.634137	99.645814	99.620287	99.641528
373099	SP500	300	1786887600	7785.263700	7787.419024	7783.872472	7786.012959
373100	DOW	300	1786887600	53738.561726	53744.565303	53725.126353	53735.416352
373101	DXY	300	1786887600	99.639719	99.645943	99.623935	99.636290
373649	DOW	300	1786888500	53733.310225	53740.692024	53721.001989	53731.294684
374010	DXY	300	1786889100	99.639103	99.646533	99.626126	99.639445
373828	SP500	300	1786888800	7785.077457	7786.794753	7784.400127	7785.160211
373829	DOW	300	1786888800	53729.624096	53740.410390	53723.698908	53738.119351
374188	SP500	300	1786889400	7785.710854	7786.839990	7784.363851	7785.847644
374008	SP500	300	1786889100	7785.110387	7787.004837	7784.558840	7785.530097
374009	DOW	300	1786889100	53740.143337	53741.540781	53725.314339	53732.782280
376369	SP500	300	1786893000	7785.957383	7787.642600	7784.345033	7785.523373
376186	SP500	300	1786892700	7785.592032	7787.491871	7784.342458	7785.936239
376187	DOW	300	1786892700	53738.178609	53740.578663	53721.223453	53731.719558
376188	DXY	300	1786892700	99.643198	99.648399	99.622554	99.640511
376370	DOW	300	1786893000	53731.094263	53744.307556	53725.138357	53734.323326
376371	DXY	300	1786893000	99.641105	99.647992	99.625795	99.635251
378011	DOW	300	1786895700	53726.240114	53740.956734	53722.761694	53731.468896
378012	DXY	300	1786895700	99.630637	99.648422	99.625059	99.628147
377467	SP500	300	1786894800	7785.374967	7786.766489	7784.764580	7786.095816
377468	DOW	300	1786894800	53728.555063	53737.018641	53718.891899	53731.422023
376003	SP500	300	1786892400	7784.991108	7786.999416	7784.240845	7785.466737
376004	DOW	300	1786892400	53733.732252	53742.104362	53721.420046	53739.712542
376005	DXY	300	1786892400	99.645514	99.651852	99.623400	99.642642
377469	DXY	300	1786894800	99.642669	99.646677	99.629303	99.641596
375454	SP500	300	1786891500	7785.989688	7787.008018	7784.235402	7785.396378
375455	DOW	300	1786891500	53733.300439	53740.666612	53719.234365	53731.787032
374728	SP500	300	1786890300	7785.229842	7786.973426	7784.181900	7784.767057
374729	DOW	300	1786890300	53732.593585	53746.905770	53722.867279	53727.831954
374730	DXY	300	1786890300	99.634262	99.645420	99.625817	99.636127
375456	DXY	300	1786891500	99.639477	99.652020	99.626249	99.637398
375271	SP500	300	1786891200	7785.689547	7787.839791	7784.663044	7786.255912
374189	DOW	300	1786889400	53731.833609	53739.515507	53725.078284	53731.946283
374190	DXY	300	1786889400	99.637511	99.643427	99.626903	99.639139
375272	DOW	300	1786891200	53734.463695	53741.363986	53726.601745	53732.305132
375273	DXY	300	1786891200	99.638822	99.644551	99.624872	99.641362
375088	SP500	300	1786890900	7786.576824	7787.217096	7784.818475	7785.653154
375089	DOW	300	1786890900	53734.424694	53742.483581	53718.677105	53732.651246
375090	DXY	300	1786890900	99.630483	99.646698	99.615330	99.640897
374368	SP500	300	1786889700	7785.934660	7786.996180	7784.485890	7786.996180
374369	DOW	300	1786889700	53730.989267	53743.299813	53723.029851	53733.774653
374370	DXY	300	1786889700	99.640264	99.644302	99.626019	99.638668
378924	DXY	300	1786897200	99.626835	99.650199	99.623410	99.631419
375637	SP500	300	1786891800	7785.157692	7786.612222	7784.379159	7785.640493
375638	DOW	300	1786891800	53733.914772	53741.821064	53726.353348	53734.100099
375639	DXY	300	1786891800	99.636312	99.648185	99.626024	99.636777
376552	SP500	300	1786893300	7785.518647	7786.770313	7784.794037	7785.800495
376553	DOW	300	1786893300	53732.487708	53742.304179	53723.102866	53731.091393
376554	DXY	300	1786893300	99.637569	99.647368	99.622318	99.638695
377101	SP500	300	1786894200	7786.119883	7787.073603	7784.828328	7786.857378
374908	SP500	300	1786890600	7784.683868	7786.715675	7784.417367	7786.480250
374909	DOW	300	1786890600	53728.788210	53740.820383	53724.179670	53732.461045
374910	DXY	300	1786890600	99.636781	99.650208	99.626316	99.630816
374548	SP500	300	1786890000	7786.954415	7787.378776	7784.579094	7785.168503
374549	DOW	300	1786890000	53735.718602	53740.085887	53721.943307	53731.184745
374550	DXY	300	1786890000	99.639699	99.644574	99.626338	99.632553
377102	DOW	300	1786894200	53729.374148	53742.548103	53723.882230	53737.452023
377103	DXY	300	1786894200	99.638483	99.652681	99.622317	99.637551
377284	SP500	300	1786894500	7786.642659	7786.860133	7784.177764	7785.421146
377285	DOW	300	1786894500	53736.596510	53738.351747	53721.347640	53730.196570
377286	DXY	300	1786894500	99.638055	99.647489	99.624149	99.642263
375820	SP500	300	1786892100	7785.898998	7787.040299	7784.208134	7785.208104
375821	DOW	300	1786892100	53732.915238	53746.696532	53722.706323	53732.353681
375822	DXY	300	1786892100	99.635886	99.645663	99.620324	99.643167
378373	SP500	300	1786896300	7786.155295	7787.498997	7784.033449	7785.930650
378374	DOW	300	1786896300	53729.791838	53749.829463	53719.137730	53736.746141
378375	DXY	300	1786896300	99.639497	99.649221	99.623137	99.633308
377830	SP500	300	1786895400	7786.095844	7786.863336	7783.985798	7785.765941
377831	DOW	300	1786895400	53732.224141	53742.877789	53726.618623	53727.078414
377832	DXY	300	1786895400	99.638106	99.646155	99.623470	99.632237
377650	SP500	300	1786895100	7786.355914	7786.860017	7784.286872	7785.961066
377651	DOW	300	1786895100	53729.726290	53738.258695	53723.995881	53734.198645
376918	SP500	300	1786893900	7786.153125	7787.296477	7784.480214	7786.015133
376919	DOW	300	1786893900	53732.988851	53738.796669	53722.106671	53730.947752
376920	DXY	300	1786893900	99.640793	99.642479	99.626228	99.636947
376735	SP500	300	1786893600	7785.897075	7786.964306	7784.509502	7786.155047
376736	DOW	300	1786893600	53729.133969	53743.087260	53726.604697	53733.506845
376737	DXY	300	1786893600	99.640429	99.645773	99.623515	99.642206
377652	DXY	300	1786895100	99.643424	99.647538	99.622591	99.637085
379473	DXY	300	1786898100	99.637486	99.644949	99.623762	99.631068
378923	DOW	300	1786897200	53732.776061	53740.538664	53719.917229	53736.645267
378922	SP500	300	1786897200	7786.300086	7787.192317	7784.593740	7785.716949
378010	SP500	300	1786895700	7785.911360	7787.264439	7784.664894	7785.775818
378190	SP500	300	1786896000	7785.567804	7787.547763	7784.646000	7786.207070
378191	DOW	300	1786896000	53733.492101	53740.955191	53727.802697	53730.111767
378192	DXY	300	1786896000	99.627693	99.645428	99.624308	99.637951
378556	SP500	300	1786896600	7785.695909	7786.896612	7784.821297	7786.237515
378557	DOW	300	1786896600	53735.419471	53740.917503	53721.840445	53736.387841
378558	DXY	300	1786896600	99.632410	99.645515	99.622131	99.635438
378739	SP500	300	1786896900	7786.458502	7787.196032	7784.044769	7786.119151
378740	DOW	300	1786896900	53738.444938	53745.707449	53725.093245	53731.035830
378741	DXY	300	1786896900	99.634786	99.645767	99.624390	99.629025
379105	SP500	300	1786897500	7785.425813	7786.938491	7784.707954	7786.013766
379106	DOW	300	1786897500	53735.160131	53739.093432	53722.185429	53729.976705
379107	DXY	300	1786897500	99.631022	99.645914	99.626129	99.639653
379288	SP500	300	1786897800	7786.084283	7787.356981	7784.315118	7785.936587
379289	DOW	300	1786897800	53729.800208	53738.936204	53723.173558	53733.458952
379290	DXY	300	1786897800	99.639052	99.645233	99.625211	99.636349
379471	SP500	300	1786898100	7785.896788	7786.777824	7784.116946	7786.359126
379472	DOW	300	1786898100	53733.986996	53740.968483	53725.327989	53736.471584
383658	DXY	300	1786905000	99.639004	99.644201	99.625021	99.636791
383296	SP500	300	1786904400	7785.618092	7787.118589	7783.860694	7785.457902
383297	DOW	300	1786904400	53732.738786	53741.802214	53722.748101	53733.613395
383298	DXY	300	1786904400	99.639702	99.646977	99.628117	99.631861
383476	SP500	300	1786904700	7785.378990	7787.058667	7784.701195	7785.985071
379651	SP500	300	1786898400	7786.312612	7786.946290	7783.939968	7786.181451
379652	DOW	300	1786898400	53736.747350	53741.504983	53723.917795	53733.069317
379653	DXY	300	1786898400	99.629348	99.647867	99.623002	99.635457
383477	DOW	300	1786904700	53732.322945	53740.696931	53723.891745	53731.879532
383478	DXY	300	1786904700	99.632070	99.647883	99.625792	99.638999
380191	SP500	300	1786899300	7785.215812	7787.331194	7784.486884	7785.499222
380192	DOW	300	1786899300	53731.164392	53741.692955	53723.823477	53735.246790
380193	DXY	300	1786899300	99.637194	99.646051	99.622997	99.629687
381649	SP500	300	1786901700	7785.732592	7787.084014	7784.525579	7786.011556
381650	DOW	300	1786901700	53733.861204	53741.529676	53724.308546	53730.585518
381651	DXY	300	1786901700	99.634227	99.646825	99.623498	99.640133
382564	SP500	300	1786903200	7786.317696	7786.758217	7784.374301	7785.400611
381832	SP500	300	1786902000	7785.779510	7786.826876	7784.396418	7785.503888
380734	SP500	300	1786900200	7784.787887	7787.438534	7784.363769	7786.157179
380735	DOW	300	1786900200	53730.950236	53743.126047	53721.927489	53731.965956
379831	SP500	300	1786898700	7786.336382	7786.724886	7784.711109	7785.732316
379832	DOW	300	1786898700	53733.523353	53740.639568	53721.711613	53728.628534
379833	DXY	300	1786898700	99.635339	99.645711	99.629901	99.634257
380736	DXY	300	1786900200	99.635319	99.670020	99.627471	99.666113
380917	SP500	300	1786900500	7786.438712	7787.335390	7783.444189	7785.837409
380918	DOW	300	1786900500	53732.055202	53742.463518	53723.017814	53731.858121
380919	DXY	300	1786900500	99.666514	99.676975	99.633638	99.633638
380551	SP500	300	1786899900	7786.089226	7787.406382	7784.639496	7784.807034
380552	DOW	300	1786899900	53735.203109	53738.932167	53722.165742	53731.924988
380553	DXY	300	1786899900	99.633809	99.650757	99.623347	99.637756
381833	DOW	300	1786902000	53732.362097	53745.697919	53726.152660	53734.308149
381834	DXY	300	1786902000	99.640588	99.648756	99.626470	99.647793
381466	SP500	300	1786901400	7785.975489	7786.664809	7783.659556	7785.812496
381467	DOW	300	1786901400	53733.073699	53740.082726	53718.735348	53734.007577
381468	DXY	300	1786901400	99.639603	99.649065	99.620451	99.632696
380011	SP500	300	1786899000	7785.423376	7786.997870	7784.254682	7785.272614
380012	DOW	300	1786899000	53729.575031	53744.275403	53724.950492	53731.902676
380013	DXY	300	1786899000	99.632416	99.647516	99.624821	99.637366
381100	SP500	300	1786900800	7785.576721	7786.852083	7784.663360	7785.929488
380371	SP500	300	1786899600	7785.660037	7786.912080	7784.804710	7786.358667
380372	DOW	300	1786899600	53734.549119	53741.328630	53724.094131	53733.054385
380373	DXY	300	1786899600	99.628337	99.646966	99.623978	99.635138
381101	DOW	300	1786900800	53733.204338	53743.762252	53724.939171	53731.258099
381102	DXY	300	1786900800	99.634479	99.645682	99.624569	99.641565
382565	DOW	300	1786903200	53731.811667	53741.917176	53722.318396	53725.122642
382566	DXY	300	1786903200	99.641777	99.651321	99.628404	99.635364
382198	SP500	300	1786902600	7785.826473	7787.316689	7784.139828	7785.866429
382199	DOW	300	1786902600	53732.368824	53741.883886	53722.029915	53729.926508
382200	DXY	300	1786902600	99.627981	99.648578	99.619885	99.638467
383113	SP500	300	1786904100	7784.741539	7786.907971	7783.222627	7785.405590
382930	SP500	300	1786903800	7785.529111	7787.184674	7784.309994	7784.949541
381283	SP500	300	1786901100	7785.768058	7786.635001	7784.000346	7786.021279
381284	DOW	300	1786901100	53730.875967	53740.618708	53724.690470	53734.052686
381285	DXY	300	1786901100	99.643164	99.644944	99.626328	99.637612
382015	SP500	300	1786902300	7785.236912	7786.961063	7784.219126	7785.556795
382016	DOW	300	1786902300	53736.012947	53749.818445	53721.709758	53732.086565
382017	DXY	300	1786902300	99.649907	99.653327	99.620807	99.629892
382931	DOW	300	1786903800	53725.753250	53742.812727	53721.753869	53732.967006
382381	SP500	300	1786902900	7786.007059	7787.925003	7784.200553	7786.340922
382382	DOW	300	1786902900	53731.106999	53743.205959	53721.543731	53730.624560
382383	DXY	300	1786902900	99.639619	99.645749	99.625720	99.643934
382747	SP500	300	1786903500	7785.330347	7787.447396	7784.757189	7785.764521
382748	DOW	300	1786903500	53725.780162	53745.298797	53722.919216	53724.846999
382749	DXY	300	1786903500	99.633691	99.646494	99.620264	99.640427
382932	DXY	300	1786903800	99.640880	99.649251	99.622911	99.626072
383114	DOW	300	1786904100	53731.274044	53740.891119	53726.623738	53732.964503
383115	DXY	300	1786904100	99.626081	99.645544	99.621975	99.641498
384017	DOW	300	1786905600	53731.868312	53741.302480	53723.292224	53731.562022
384018	DXY	300	1786905600	99.639140	99.647836	99.628264	99.638001
384196	SP500	300	1786905900	7786.216131	7787.270036	7784.465198	7785.252452
383836	SP500	300	1786905300	7785.791472	7786.863011	7784.316741	7785.522081
383837	DOW	300	1786905300	53735.440979	53740.675937	53724.243137	53730.028451
384378	DXY	300	1786906200	99.642628	99.646438	99.627725	99.640557
384016	SP500	300	1786905600	7785.571676	7787.319903	7784.106275	7786.323865
383656	SP500	300	1786905000	7785.849487	7787.781209	7784.375946	7785.653020
383657	DOW	300	1786905000	53734.004163	53743.064916	53723.751896	53736.343072
383838	DXY	300	1786905300	99.635049	99.647050	99.628566	99.640844
384197	DOW	300	1786905900	53731.556072	53740.357397	53726.468904	53727.053909
384198	DXY	300	1786905900	99.636361	99.643463	99.627336	99.643360
384558	DXY	300	1786906500	99.640267	99.648151	99.622504	99.632099
384376	SP500	300	1786906200	7785.526251	7787.252955	7784.019217	7786.242677
384377	DOW	300	1786906200	53727.073408	53744.079434	53722.121369	53732.416932
384738	DXY	300	1786906800	99.633585	99.645157	99.622537	99.630255
384556	SP500	300	1786906500	7786.408160	7788.205243	7784.524247	7784.915660
384557	DOW	300	1786906500	53731.420551	53742.644842	53722.027856	53726.374761
384736	SP500	300	1786906800	7784.936542	7787.263338	7784.323464	7785.741005
384737	DOW	300	1786906800	53727.512085	53741.025466	53722.002160	53731.263462
384916	SP500	300	1786907100	7786.025357	7787.910605	7784.361133	7785.539421
384917	DOW	300	1786907100	53730.036018	53738.516328	53721.903480	53729.262759
388376	DOW	300	1786912800	53735.440800	53743.040146	53721.793068	53735.707873
388377	DXY	300	1786912800	99.636272	99.648182	99.625412	99.632928
387646	SP500	300	1786911600	7785.468615	7786.637702	7784.517343	7785.891887
387647	DOW	300	1786911600	53732.229716	53747.855011	53721.161674	53728.764042
387648	DXY	300	1786911600	99.640049	99.647617	99.622854	99.633521
387466	SP500	300	1786911300	7786.170158	7787.226953	7784.693478	7785.535483
387467	DOW	300	1786911300	53733.361642	53739.064249	53725.335588	53733.277768
385648	SP500	300	1786908300	7785.352708	7787.064109	7784.827375	7785.671237
385649	DOW	300	1786908300	53728.401675	53739.707453	53720.123882	53730.296506
385650	DXY	300	1786908300	99.640832	99.649242	99.623214	99.637509
385282	SP500	300	1786907700	7784.722474	7787.160819	7784.082410	7786.224883
385283	DOW	300	1786907700	53730.977308	53739.957748	53726.362511	53730.970209
385284	DXY	300	1786907700	99.631914	99.649867	99.626344	99.637556
386746	SP500	300	1786910100	7785.236458	7787.341066	7784.757875	7786.287944
386747	DOW	300	1786910100	53734.012327	53742.937507	53725.327368	53731.274245
386748	DXY	300	1786910100	99.639936	99.644111	99.624728	99.634140
387468	DXY	300	1786911300	99.636887	99.644239	99.627677	99.639676
389839	SP500	300	1786915200	7785.840492	7786.541870	7784.204087	7785.838532
388009	SP500	300	1786912200	7785.619849	7787.191772	7784.176458	7785.633111
388010	DOW	300	1786912200	53732.407312	53740.048869	53721.113492	53730.446270
388011	DXY	300	1786912200	99.637824	99.646071	99.626560	99.640862
387826	SP500	300	1786911900	7785.760293	7787.390492	7783.833505	7785.731802
387827	DOW	300	1786911900	53726.916859	53740.871051	53724.777298	53732.250520
386197	SP500	300	1786909200	7785.068625	7787.125356	7784.474809	7785.744712
386198	DOW	300	1786909200	53731.997332	53740.867541	53723.934427	53727.707592
386199	DXY	300	1786909200	99.633950	99.646703	99.624905	99.633068
386014	SP500	300	1786908900	7785.278611	7787.459924	7784.289925	7785.255187
386015	DOW	300	1786908900	53730.187471	53740.818670	53723.354933	53733.554609
386016	DXY	300	1786908900	99.638387	99.647386	99.624363	99.632737
385465	SP500	300	1786908000	7785.999922	7787.291975	7784.585691	7785.502502
385466	DOW	300	1786908000	53732.226278	53744.914901	53725.493859	53729.689004
385467	DXY	300	1786908000	99.638286	99.645716	99.625767	99.641825
384918	DXY	300	1786907100	99.629662	99.650751	99.628191	99.630789
387828	DXY	300	1786911900	99.631313	99.646263	99.620530	99.638921
387106	SP500	300	1786910700	7785.667339	7787.485664	7784.367858	7786.414742
386380	SP500	300	1786909500	7785.487216	7786.875644	7784.117947	7784.829645
386381	DOW	300	1786909500	53726.187937	53741.325719	53723.675157	53730.918813
386382	DXY	300	1786909500	99.631606	99.644939	99.624171	99.637479
387107	DOW	300	1786910700	53730.863643	53745.150860	53725.307953	53736.409323
385099	SP500	300	1786907400	7785.280965	7786.875513	7784.325678	7784.917312
385100	DOW	300	1786907400	53731.094584	53740.263638	53721.243426	53729.159926
385101	DXY	300	1786907400	99.631789	99.646675	99.627977	99.633410
385831	SP500	300	1786908600	7785.766581	7786.837447	7784.382001	7785.474277
385832	DOW	300	1786908600	53728.981868	53739.127276	53724.655250	53729.626546
385833	DXY	300	1786908600	99.636789	99.648944	99.625684	99.638413
387108	DXY	300	1786910700	99.640938	99.646408	99.625481	99.635773
389840	DOW	300	1786915200	53731.825605	53740.905083	53719.586506	53732.591703
389656	SP500	300	1786914900	7786.188890	7786.887568	7784.120108	7785.834351
389657	DOW	300	1786914900	53734.115644	53740.702959	53723.930795	53729.740473
386926	SP500	300	1786910400	7786.164908	7786.560860	7784.364708	7785.661809
386927	DOW	300	1786910400	53730.416004	53742.670292	53722.463766	53730.639328
386563	SP500	300	1786909800	7784.604077	7787.519930	7784.157008	7785.252972
386564	DOW	300	1786909800	53730.097046	53740.098302	53727.570735	53732.759967
386565	DXY	300	1786909800	99.635113	99.650255	99.625886	99.638559
386928	DXY	300	1786910400	99.632348	99.647462	99.627576	99.638456
387286	SP500	300	1786911000	7786.374666	7787.125305	7784.526727	7786.155420
387287	DOW	300	1786911000	53737.941689	53740.532828	53720.727296	53733.649579
387288	DXY	300	1786911000	99.636906	99.647004	99.625584	99.635834
389658	DXY	300	1786914900	99.631317	99.644021	99.627459	99.641992
389473	SP500	300	1786914600	7785.502407	7787.113815	7784.603558	7786.276207
389474	DOW	300	1786914600	53726.520997	53742.662306	53719.424880	53732.644644
389475	DXY	300	1786914600	99.635609	99.646337	99.624160	99.632546
389107	SP500	300	1786914000	7785.651526	7787.210781	7783.614952	7785.540727
388558	SP500	300	1786913100	7785.727042	7787.414178	7784.784984	7786.194879
388559	DOW	300	1786913100	53736.282126	53743.225896	53723.646989	53737.689845
388560	DXY	300	1786913100	99.634720	99.646588	99.622770	99.634160
388192	SP500	300	1786912500	7785.419518	7787.694536	7784.008581	7785.720135
388193	DOW	300	1786912500	53729.423451	53738.458834	53724.473551	53736.929196
388194	DXY	300	1786912500	99.642787	99.647742	99.619357	99.638677
388741	SP500	300	1786913400	7786.079704	7787.454251	7784.039451	7785.849678
388742	DOW	300	1786913400	53738.885169	53741.417457	53721.534666	53727.774241
388743	DXY	300	1786913400	99.633322	99.650906	99.622064	99.633572
388375	SP500	300	1786912800	7785.481488	7786.742291	7784.806522	7785.865480
388924	SP500	300	1786913700	7785.922903	7787.124621	7783.843922	7785.539282
388925	DOW	300	1786913700	53727.447234	53740.171338	53720.344612	53731.585478
388926	DXY	300	1786913700	99.631312	99.646623	99.617496	99.632984
389108	DOW	300	1786914000	53733.013112	53740.952229	53723.200790	53732.511755
389109	DXY	300	1786914000	99.632802	99.648958	99.626486	99.638276
389290	SP500	300	1786914300	7785.850491	7787.114226	7783.862796	7785.447986
389291	DOW	300	1786914300	53732.851562	53741.383286	53720.419902	53728.407128
389292	DXY	300	1786914300	99.636056	99.647351	99.624335	99.633945
389841	DXY	300	1786915200	99.641736	99.645051	99.622311	99.637807
390022	SP500	300	1786915500	7786.062795	7787.801117	7784.397551	7785.609293
390023	DOW	300	1786915500	53733.286831	53740.358554	53721.289010	53731.840783
390024	DXY	300	1786915500	99.635601	99.646038	99.623876	99.639894
390205	SP500	300	1786915800	7785.568191	7786.639097	7784.910534	7785.296074
390206	DOW	300	1786915800	53730.958339	53740.727652	53722.197161	53736.327278
390207	DXY	300	1786915800	99.638524	99.649276	99.624718	99.639012
390388	SP500	300	1786916100	7785.419770	7786.903019	7783.809043	7786.454751
390753	DXY	300	1786916700	99.636104	99.648416	99.623895	99.636108
394575	DXY	300	1786923000	99.590853	99.606490	99.580417	99.588992
393658	SP500	300	1786921500	7785.986637	7787.200669	7784.869227	7786.175150
393659	DOW	300	1786921500	53728.994149	53740.113657	53722.963623	53732.743714
393660	DXY	300	1786921500	99.601622	99.608940	99.577307	99.588947
392194	SP500	300	1786919100	7785.759913	7787.061522	7784.613422	7785.525819
392195	DOW	300	1786919100	53727.876261	53743.662203	53724.166629	53732.377027
392196	DXY	300	1786919100	99.666030	99.670016	99.641029	99.653208
392743	SP500	300	1786920000	7785.056821	7787.424806	7783.965888	7785.868589
392744	DOW	300	1786920000	53734.608199	53741.555365	53720.995223	53728.766556
391651	SP500	300	1786918200	7786.217473	7787.152468	7784.580221	7785.424209
391652	DOW	300	1786918200	53732.626564	53745.604029	53723.487852	53731.423273
391653	DXY	300	1786918200	99.633484	99.666535	99.633484	99.666535
391471	SP500	300	1786917900	7785.352537	7787.790696	7784.515514	7786.365333
391472	DOW	300	1786917900	53733.389448	53741.268960	53719.396054	53733.840429
391473	DXY	300	1786917900	99.643252	99.651808	99.626262	99.635437
390931	SP500	300	1786917000	7786.304493	7787.312835	7784.012705	7785.460176
390932	DOW	300	1786917000	53729.915965	53745.226576	53724.842612	53731.360353
390933	DXY	300	1786917000	99.634114	99.646984	99.628071	99.646984
390389	DOW	300	1786916100	53735.181205	53744.267070	53722.895694	53731.148149
390390	DXY	300	1786916100	99.637984	99.648528	99.623730	99.642018
392745	DXY	300	1786920000	99.640629	99.641301	99.616370	99.625273
391831	SP500	300	1786918500	7785.347858	7787.682200	7784.029320	7785.621823
391832	DOW	300	1786918500	53733.493087	53748.423885	53724.922851	53735.369683
391833	DXY	300	1786918500	99.668005	99.678415	99.656804	99.661096
391291	SP500	300	1786917600	7785.347529	7787.139660	7784.403281	7785.353199
391292	DOW	300	1786917600	53731.564711	53746.359941	53723.662729	53733.831263
391293	DXY	300	1786917600	99.640628	99.649410	99.625497	99.640890
390571	SP500	300	1786916400	7786.651105	7787.132735	7784.715667	7786.274213
390572	DOW	300	1786916400	53730.616053	53742.041855	53723.247467	53735.151859
390573	DXY	300	1786916400	99.640532	99.645721	99.624578	99.636463
395123	DOW	300	1786923900	53735.273662	53746.920098	53720.771015	53733.297597
394390	SP500	300	1786922700	7785.937054	7787.143366	7784.422540	7786.207655
393292	SP500	300	1786920900	7786.097836	7786.873940	7784.467725	7786.009806
393293	DOW	300	1786920900	53739.381550	53744.951057	53720.207259	53729.924668
393294	DXY	300	1786920900	99.616606	99.630055	99.603141	99.616967
393475	SP500	300	1786921200	7786.231033	7786.708713	7784.164004	7785.901111
393476	DOW	300	1786921200	53730.882123	53740.066643	53723.859133	53728.737205
393477	DXY	300	1786921200	99.618128	99.622479	99.598055	99.600999
392011	SP500	300	1786918800	7785.735272	7786.888779	7784.520208	7785.911589
392012	DOW	300	1786918800	53734.337475	53740.588002	53722.412567	53729.945896
392013	DXY	300	1786918800	99.660432	99.676652	99.654157	99.665279
391111	SP500	300	1786917300	7785.644193	7787.237197	7784.399634	7785.067598
391112	DOW	300	1786917300	53730.952510	53742.031714	53724.264576	53731.285063
391113	DXY	300	1786917300	99.647554	99.651521	99.623596	99.639845
390751	SP500	300	1786916700	7785.989022	7787.355612	7784.655922	7786.264555
390752	DOW	300	1786916700	53735.388928	53743.161847	53721.526625	53729.811191
394391	DOW	300	1786922700	53731.444988	53740.209985	53723.207066	53730.576270
394207	SP500	300	1786922400	7785.853265	7786.520452	7784.085042	7786.154314
394208	DOW	300	1786922400	53731.921468	53744.378603	53722.863259	53732.070829
394209	DXY	300	1786922400	99.582790	99.592901	99.573046	99.589114
394392	DXY	300	1786922700	99.588299	99.600934	99.579817	99.593272
392560	SP500	300	1786919700	7786.610163	7787.479564	7784.516645	7785.359802
392377	SP500	300	1786919400	7785.470373	7786.515339	7784.290217	7786.398514
392378	DOW	300	1786919400	53734.190139	53743.794568	53720.718132	53729.817914
392379	DXY	300	1786919400	99.651674	99.661812	99.629236	99.634287
392561	DOW	300	1786919700	53727.955490	53740.305483	53722.578061	53733.853455
392562	DXY	300	1786919700	99.636775	99.648267	99.630021	99.639257
392926	SP500	300	1786920300	7785.737010	7787.029030	7784.175941	7785.531548
392927	DOW	300	1786920300	53727.131710	53750.399950	53726.260458	53729.421157
392928	DXY	300	1786920300	99.626181	99.636852	99.599316	99.607053
393109	SP500	300	1786920600	7785.309486	7787.297873	7784.323965	7786.322536
394024	SP500	300	1786922100	7786.010788	7787.398575	7784.709397	7785.761874
393110	DOW	300	1786920600	53728.411666	53745.557902	53724.785193	53738.326008
393111	DXY	300	1786920600	99.607347	99.630894	99.604807	99.614548
394025	DOW	300	1786922100	53729.905118	53742.348018	53722.258371	53732.211130
393841	SP500	300	1786921800	7786.266913	7786.854121	7784.374990	7786.059466
393842	DOW	300	1786921800	53733.737648	53741.737724	53725.989501	53729.465598
393843	DXY	300	1786921800	99.588765	99.598304	99.571976	99.586275
394026	DXY	300	1786922100	99.584792	99.597721	99.575966	99.581280
395124	DXY	300	1786923900	99.588359	99.601945	99.577317	99.589567
394756	SP500	300	1786923300	7785.517736	7787.751206	7784.742688	7785.500914
394757	DOW	300	1786923300	53731.434524	53744.528929	53721.548430	53730.973733
394758	DXY	300	1786923300	99.586652	99.601517	99.577935	99.592504
394573	SP500	300	1786923000	7786.257967	7787.050231	7783.950539	7785.303863
394574	DOW	300	1786923000	53728.704994	53743.004501	53724.316824	53730.840354
395304	DXY	300	1786924200	99.590771	99.597141	99.572452	99.584671
395122	SP500	300	1786923900	7785.619354	7786.831752	7784.600760	7785.869961
394939	SP500	300	1786923600	7785.507043	7787.240635	7784.494234	7785.655400
394940	DOW	300	1786923600	53732.742961	53744.297457	53723.274815	53734.161703
394941	DXY	300	1786923600	99.592997	99.609727	99.577013	99.590725
395484	DXY	300	1786924500	99.585479	99.595435	99.568008	99.576349
395302	SP500	300	1786924200	7785.730363	7787.126915	7784.272965	7785.346843
395303	DOW	300	1786924200	53731.516513	53743.944222	53722.960749	53725.973389
395664	DXY	300	1786924800	99.574793	99.606970	99.569144	99.597165
395482	SP500	300	1786924500	7785.135879	7787.182856	7784.331433	7784.684012
395483	DOW	300	1786924500	53727.536805	53742.913847	53720.653105	53730.960384
395662	SP500	300	1786924800	7784.653868	7786.771327	7784.445833	7784.971673
395663	DOW	300	1786924800	53731.995415	53744.582074	53723.261838	53731.577486
400599	DXY	300	1786932900	99.508317	99.518979	99.496425	99.514333
400414	SP500	300	1786932600	7786.149197	7787.134153	7783.830245	7785.845047
400231	SP500	300	1786932300	7786.087538	7787.531632	7784.069984	7785.990921
400232	DOW	300	1786932300	53732.253842	53739.589187	53722.210506	53733.891175
400415	DOW	300	1786932600	53732.285702	53741.692201	53720.474472	53734.676728
400416	DXY	300	1786932600	99.516396	99.520786	99.501607	99.509539
399499	SP500	300	1786931100	7785.920632	7787.271809	7783.754981	7785.736956
397489	SP500	300	1786927800	7786.045894	7787.116263	7784.543248	7785.674670
397490	DOW	300	1786927800	53730.383161	53742.704053	53721.305669	53729.277914
397491	DXY	300	1786927800	99.534839	99.544021	99.526300	99.540801
395842	SP500	300	1786925100	7784.982459	7786.713771	7783.775039	7785.403139
395843	DOW	300	1786925100	53731.663085	53745.627285	53719.287372	53736.111286
395844	DXY	300	1786925100	99.598756	99.610052	99.583581	99.585966
399500	DOW	300	1786931100	53730.489768	53741.114246	53723.867796	53725.774822
399501	DXY	300	1786931100	99.551896	99.562260	99.532850	99.532850
400779	DXY	300	1786933200	99.512235	99.526683	99.504563	99.516326
399865	SP500	300	1786931700	7785.451866	7787.018327	7784.226542	7786.724689
399866	DOW	300	1786931700	53728.579363	53738.904622	53721.626138	53733.008400
399682	SP500	300	1786931400	7785.475711	7786.997860	7784.785272	7785.475593
399683	DOW	300	1786931400	53726.226168	53740.666214	53724.453822	53730.342152
398767	SP500	300	1786929900	7785.248890	7786.929860	7784.411185	7786.465268
396391	SP500	300	1786926000	7786.193974	7787.271047	7784.107599	7785.073570
396392	DOW	300	1786926000	53731.690279	53738.486463	53723.573411	53731.528248
396393	DXY	300	1786926000	99.551831	99.559175	99.532556	99.548468
398768	DOW	300	1786929900	53731.603471	53743.031756	53723.394120	53733.802197
397852	SP500	300	1786928400	7786.159846	7787.123342	7784.558694	7786.186503
397853	DOW	300	1786928400	53735.848201	53739.447214	53722.751380	53732.820374
397854	DXY	300	1786928400	99.539759	99.555721	99.520542	99.540674
396025	SP500	300	1786925400	7785.094748	7787.501192	7784.374049	7786.193652
396026	DOW	300	1786925400	53734.203753	53742.794816	53724.474533	53736.013773
396027	DXY	300	1786925400	99.583589	99.594448	99.549717	99.559670
398769	DXY	300	1786929900	99.526917	99.551387	99.522447	99.542671
398035	SP500	300	1786928700	7786.165874	7787.440998	7784.113747	7785.339421
398036	DOW	300	1786928700	53730.878039	53741.511731	53725.617994	53730.688076
396940	SP500	300	1786926900	7786.069236	7787.204865	7783.806155	7785.188426
396941	DOW	300	1786926900	53733.153149	53739.722306	53726.493259	53731.505187
396942	DXY	300	1786926900	99.535815	99.542848	99.516977	99.541039
397123	SP500	300	1786927200	7784.923234	7787.134157	7784.669127	7786.147456
397124	DOW	300	1786927200	53733.122632	53740.318132	53719.147950	53733.582967
397125	DXY	300	1786927200	99.541371	99.542397	99.513017	99.527333
396757	SP500	300	1786926600	7785.581363	7786.979998	7784.663407	7786.195187
396758	DOW	300	1786926600	53732.454183	53740.242986	53723.905494	53731.181205
396759	DXY	300	1786926600	99.542089	99.555093	99.529562	99.535385
398037	DXY	300	1786928700	99.538646	99.548003	99.523531	99.525461
397672	SP500	300	1786928100	7785.850535	7787.341396	7784.124886	7786.419143
397673	DOW	300	1786928100	53728.898057	53744.805731	53720.507603	53735.283798
396208	SP500	300	1786925700	7786.464865	7786.905848	7784.367208	7786.242894
396209	DOW	300	1786925700	53737.474417	53742.621056	53724.568609	53731.655788
396210	DXY	300	1786925700	99.557889	99.561434	99.539105	99.551175
397674	DXY	300	1786928100	99.538720	99.544728	99.523596	99.538058
397306	SP500	300	1786927500	7786.355270	7787.653894	7783.857301	7785.805638
397307	DOW	300	1786927500	53734.951013	53738.987457	53725.179780	53729.411260
396574	SP500	300	1786926300	7785.314163	7786.974616	7784.112424	7785.518485
396575	DOW	300	1786926300	53733.432032	53741.132970	53722.258879	53733.609710
396576	DXY	300	1786926300	99.546101	99.560047	99.528240	99.543665
397308	DXY	300	1786927500	99.527687	99.548074	99.511927	99.534058
399684	DXY	300	1786931400	99.533528	99.553322	99.519880	99.529603
398401	SP500	300	1786929300	7786.403885	7786.939099	7784.761446	7785.526409
398402	DOW	300	1786929300	53730.208016	53742.572371	53722.811295	53729.863806
398403	DXY	300	1786929300	99.530397	99.549630	99.521102	99.537916
399867	DXY	300	1786931700	99.527682	99.532483	99.507954	99.518283
399133	SP500	300	1786930500	7786.870575	7787.661518	7784.297992	7786.018044
399134	DOW	300	1786930500	53730.837571	53739.254737	53725.316449	53731.850621
398950	SP500	300	1786930200	7786.716186	7787.235958	7784.422197	7786.731645
398584	SP500	300	1786929600	7785.335404	7786.814648	7784.572734	7785.435851
398218	SP500	300	1786929000	7785.370132	7787.620505	7784.155039	7786.166249
398219	DOW	300	1786929000	53731.593482	53742.877771	53722.492999	53729.905423
398220	DXY	300	1786929000	99.527013	99.547564	99.516535	99.530823
398585	DOW	300	1786929600	53730.798778	53743.686608	53722.484039	53732.595406
398951	DOW	300	1786930200	53732.085135	53740.626106	53722.196987	53730.195225
398952	DXY	300	1786930200	99.540679	99.549662	99.502652	99.522535
398586	DXY	300	1786929600	99.536525	99.553054	99.527514	99.527514
399135	DXY	300	1786930500	99.524328	99.531817	99.502052	99.518055
400233	DXY	300	1786932300	99.513027	99.536756	99.498508	99.516388
399316	SP500	300	1786930800	7786.202267	7787.314574	7784.550617	7785.740529
399317	DOW	300	1786930800	53731.356645	53740.662282	53721.764058	53729.947847
399318	DXY	300	1786930800	99.516515	99.553965	99.515206	99.553965
400048	SP500	300	1786932000	7786.839947	7787.814623	7784.696688	7785.805313
400049	DOW	300	1786932000	53733.210819	53745.660338	53723.485615	53730.505573
400050	DXY	300	1786932000	99.518512	99.531693	99.505423	99.513216
400597	SP500	300	1786932900	7785.778770	7786.857963	7784.508030	7785.814019
400598	DOW	300	1786932900	53734.672091	53742.179387	53721.730153	53730.503292
400959	DXY	300	1786933500	99.513940	99.528532	99.491973	99.499986
400777	SP500	300	1786933200	7785.635683	7787.213326	7784.666902	7785.696429
400778	DOW	300	1786933200	53729.241217	53741.861110	53722.736209	53730.184936
401138	DOW	300	1786933800	53734.574146	53745.941564	53720.105131	53733.422010
400957	SP500	300	1786933500	7785.686226	7787.361565	7784.430644	7785.283596
400958	DOW	300	1786933500	53730.589566	53740.943999	53719.871970	53733.824568
401137	SP500	300	1786933800	7785.196120	7786.797590	7784.007139	7786.141301
404954	DOW	300	1786940100	53732.978653	53741.422611	53724.411840	53732.887615
404955	DXY	300	1786940100	99.506797	99.512690	99.483836	99.489209
404773	SP500	300	1786939800	7784.864089	7787.473955	7783.751520	7785.618507
404774	DOW	300	1786939800	53740.096802	53742.223591	53719.279803	53732.592428
404233	SP500	300	1786938900	7786.401594	7787.526666	7783.919073	7785.960049
404234	DOW	300	1786938900	53737.691318	53745.263796	53723.849961	53732.015161
403873	SP500	300	1786938300	7785.051751	7786.911563	7784.250421	7785.262796
403874	DOW	300	1786938300	53737.770212	53743.299695	53725.577355	53731.328099
403875	DXY	300	1786938300	99.535923	99.564523	99.535923	99.546910
401866	SP500	300	1786935000	7785.795635	7786.974557	7784.907174	7785.660106
401867	DOW	300	1786935000	53739.321036	53744.354189	53725.615514	53734.841014
401868	DXY	300	1786935000	99.521590	99.528210	99.504100	99.523385
401500	SP500	300	1786934400	7785.340236	7787.029912	7784.398817	7785.337630
401501	DOW	300	1786934400	53740.190846	53742.118322	53723.947751	53732.662858
401502	DXY	300	1786934400	99.500225	99.536720	99.490182	99.527673
404235	DXY	300	1786938900	99.545726	99.550436	99.528106	99.542598
403693	SP500	300	1786938000	7785.832748	7786.973773	7784.077665	7785.359265
403694	DOW	300	1786938000	53731.308017	53744.060432	53722.648518	53736.483444
402964	SP500	300	1786936800	7785.994169	7787.601727	7784.776100	7786.097525
402965	DOW	300	1786936800	53734.695921	53740.024887	53722.007297	53732.525217
402966	DXY	300	1786936800	99.539152	99.553615	99.529783	99.547457
403695	DXY	300	1786938000	99.541187	99.548891	99.527823	99.537304
404775	DXY	300	1786939800	99.521316	99.529910	99.502140	99.507463
404053	SP500	300	1786938600	7785.455301	7786.790833	7783.968775	7786.261043
404054	DOW	300	1786938600	53733.388675	53747.401751	53722.934574	53735.708156
402415	SP500	300	1786935900	7785.841309	7787.137046	7784.286227	7785.510689
402416	DOW	300	1786935900	53733.717878	53742.800635	53724.573600	53729.616968
402417	DXY	300	1786935900	99.543211	99.550044	99.520349	99.537885
402232	SP500	300	1786935600	7786.044365	7787.607478	7784.792766	7785.949915
402233	DOW	300	1786935600	53731.547607	53745.804820	53726.148081	53733.887909
402234	DXY	300	1786935600	99.529425	99.543027	99.520115	99.540865
401683	SP500	300	1786934700	7785.507289	7787.064555	7784.474606	7785.948690
401684	DOW	300	1786934700	53733.976740	53744.163886	53722.119039	53739.356190
401685	DXY	300	1786934700	99.525946	99.533058	99.510966	99.520544
401139	DXY	300	1786933800	99.501934	99.519104	99.494233	99.504712
404055	DXY	300	1786938600	99.547444	99.558683	99.530841	99.544164
402598	SP500	300	1786936200	7785.398941	7787.565650	7785.085003	7786.686612
402599	DOW	300	1786936200	53728.514297	53741.635825	53720.117646	53734.823341
402600	DXY	300	1786936200	99.536817	99.553819	99.525723	99.549590
401317	SP500	300	1786934100	7786.027978	7786.960757	7784.553029	7785.519114
401318	DOW	300	1786934100	53731.557817	53741.330529	53719.619785	53740.024137
401319	DXY	300	1786934100	99.506739	99.514440	99.491731	99.498739
402049	SP500	300	1786935300	7785.588234	7787.443962	7784.346206	7786.300845
402050	DOW	300	1786935300	53732.771654	53738.043011	53721.214577	53732.127710
402051	DXY	300	1786935300	99.524062	99.535728	99.515277	99.527849
405134	DOW	300	1786940400	53734.808891	53744.995388	53724.005518	53732.692230
405135	DXY	300	1786940400	99.486741	99.500557	99.470399	99.487317
403330	SP500	300	1786937400	7785.911663	7787.234226	7784.351981	7785.421889
403331	DOW	300	1786937400	53733.183635	53745.400541	53721.990984	53733.863780
403332	DXY	300	1786937400	99.537156	99.547193	99.525717	99.530565
402781	SP500	300	1786936500	7786.638878	7786.929484	7784.046969	7785.939434
402782	DOW	300	1786936500	53735.747978	53744.378929	53722.400827	53735.682311
402783	DXY	300	1786936500	99.550843	99.552486	99.526558	99.541463
404413	SP500	300	1786939200	7785.717993	7786.821567	7784.158234	7786.283553
404414	DOW	300	1786939200	53730.885739	53743.630971	53719.997721	53732.250418
404415	DXY	300	1786939200	99.541230	99.550571	99.524639	99.530368
403147	SP500	300	1786937100	7786.318588	7787.171920	7784.327851	7786.038338
403513	SP500	300	1786937700	7785.323175	7787.407937	7783.813167	7786.115938
403514	DOW	300	1786937700	53734.391578	53742.434243	53724.458231	53732.996213
403515	DXY	300	1786937700	99.531926	99.547441	99.525064	99.540094
403148	DOW	300	1786937100	53733.075956	53740.695463	53722.616880	53734.190181
403149	DXY	300	1786937100	99.548729	99.553836	99.524248	99.536970
404593	SP500	300	1786939500	7786.081342	7787.973204	7784.104924	7785.029786
404594	DOW	300	1786939500	53733.920187	53741.444667	53722.149060	53740.522265
404595	DXY	300	1786939500	99.529228	99.542777	99.512834	99.523260
405317	DOW	300	1786940700	53733.732465	53741.267385	53722.046049	53727.287277
405318	DXY	300	1786940700	99.487869	99.504904	99.479494	99.489658
405500	DOW	300	1786941000	53729.427963	53740.812654	53726.442224	53729.867633
405501	DXY	300	1786941000	99.489902	99.513456	99.485458	99.492674
404953	SP500	300	1786940100	7785.373013	7786.804160	7784.528982	7785.365704
405683	DOW	300	1786941300	53728.596637	53743.941166	53724.085106	53736.052918
405316	SP500	300	1786940700	7786.265744	7787.341571	7784.203404	7786.010883
405133	SP500	300	1786940400	7785.152873	7786.632047	7784.002543	7786.192426
405684	DXY	300	1786941300	99.492318	99.500024	99.477920	99.490558
405866	DOW	300	1786941600	53735.947175	53743.395608	53721.390160	53733.386956
405499	SP500	300	1786941000	7785.784400	7787.657342	7784.672142	7785.959094
406597	SP500	300	1786942800	7785.576528	7787.554024	7784.584121	7785.489120
406048	SP500	300	1786941900	7785.996968	7786.651611	7784.199952	7785.503302
405682	SP500	300	1786941300	7786.071614	7786.938139	7784.502835	7785.556546
405865	SP500	300	1786941600	7785.849103	7787.153520	7783.970539	7786.173191
405867	DXY	300	1786941600	99.488830	99.511431	99.486408	99.497273
406049	DOW	300	1786941900	53734.376389	53744.200138	53723.229292	53729.786266
406050	DXY	300	1786941900	99.496521	99.504425	99.480290	99.492502
406231	SP500	300	1786942200	7785.313184	7787.269897	7784.811913	7785.941816
406232	DOW	300	1786942200	53729.549559	53744.719054	53724.434208	53724.858029
406233	DXY	300	1786942200	99.490603	99.499708	99.474181	99.488083
406414	SP500	300	1786942500	7786.232757	7787.213664	7784.544856	7785.828061
406415	DOW	300	1786942500	53725.722349	53741.741127	53722.726507	53737.636665
406416	DXY	300	1786942500	99.487653	99.500175	99.480155	99.491601
411312	DXY	300	1786950600	99.416852	99.446869	99.414527	99.432592
410944	SP500	300	1786950000	7786.063748	7787.185388	7783.761043	7785.513619
410945	DOW	300	1786950000	53730.848541	53743.587658	53719.429224	53728.708771
410224	SP500	300	1786948800	7786.039135	7787.078082	7783.986250	7784.767641
410225	DOW	300	1786948800	53731.209771	53740.005412	53720.373609	53732.132245
410226	DXY	300	1786948800	99.452835	99.478050	99.446115	99.472660
410044	SP500	300	1786948500	7785.782959	7786.927932	7784.324747	7786.148481
408403	SP500	300	1786945800	7785.289722	7786.852559	7784.783934	7785.471960
408404	DOW	300	1786945800	53730.226748	53740.644483	53724.429284	53733.313737
408405	DXY	300	1786945800	99.485702	99.495108	99.469962	99.483657
410045	DOW	300	1786948500	53728.327144	53742.059889	53719.390112	53730.688176
407857	SP500	300	1786944900	7785.556546	7787.639921	7784.422787	7785.950643
407858	DOW	300	1786944900	53736.211285	53738.208148	53719.608963	53736.335457
407859	DXY	300	1786944900	99.485583	99.492415	99.472071	99.481276
407677	SP500	300	1786944600	7786.158613	7787.381296	7783.929190	7785.331911
407678	DOW	300	1786944600	53728.040331	53743.601387	53722.125311	53734.730919
407679	DXY	300	1786944600	99.504061	99.511445	99.476446	99.487217
407137	SP500	300	1786943700	7786.015700	7787.429950	7784.810082	7786.596623
407138	DOW	300	1786943700	53730.742325	53741.978058	53724.765687	53732.776587
407139	DXY	300	1786943700	99.506576	99.511395	99.493021	99.504129
408952	SP500	300	1786946700	7785.711909	7786.946427	7784.515439	7785.931893
406598	DOW	300	1786942800	53737.701545	53744.183422	53723.889664	53736.625961
406599	DXY	300	1786942800	99.490757	99.510773	99.485561	99.496936
408953	DOW	300	1786946700	53732.826085	53744.490799	53719.363466	53733.106343
408954	DXY	300	1786946700	99.485796	99.502557	99.471486	99.491689
408037	SP500	300	1786945200	7786.027169	7786.899440	7784.483888	7785.411298
408038	DOW	300	1786945200	53734.854570	53742.062019	53724.912165	53735.151927
408039	DXY	300	1786945200	99.479561	99.501361	99.470121	99.491941
407497	SP500	300	1786944300	7785.344659	7787.346106	7784.445429	7786.208850
407498	DOW	300	1786944300	53730.571929	53741.028323	53720.228871	53729.871647
407499	DXY	300	1786944300	99.513487	99.527076	99.487167	99.502237
406777	SP500	300	1786943100	7785.177966	7786.932377	7784.244035	7785.436973
406778	DOW	300	1786943100	53736.655332	53741.441111	53724.531188	53736.416284
406779	DXY	300	1786943100	99.497875	99.516808	99.491639	99.505121
409684	SP500	300	1786947900	7785.064488	7787.043743	7784.036691	7786.043175
409685	DOW	300	1786947900	53731.485544	53743.901175	53723.737113	53732.851881
409686	DXY	300	1786947900	99.504363	99.521404	99.488569	99.499512
409501	SP500	300	1786947600	7785.335418	7786.888968	7784.621303	7785.117390
409502	DOW	300	1786947600	53734.354040	53743.103587	53719.009553	53732.740040
409503	DXY	300	1786947600	99.496192	99.521632	99.490676	99.505487
410046	DXY	300	1786948500	99.504377	99.514754	99.450352	99.451540
408220	SP500	300	1786945500	7785.543219	7787.455845	7784.596033	7785.105390
407317	SP500	300	1786944000	7786.612323	7787.103562	7783.899061	7785.368188
407318	DOW	300	1786944000	53733.555815	53743.974456	53724.345197	53731.207270
407319	DXY	300	1786944000	99.502324	99.524341	99.490870	99.514668
406957	SP500	300	1786943400	7785.357739	7787.028558	7784.631879	7786.051859
406958	DOW	300	1786943400	53738.099020	53741.339643	53726.105806	53732.479082
406959	DXY	300	1786943400	99.502911	99.513642	99.488321	99.504166
408221	DOW	300	1786945500	53734.634473	53742.769316	53723.932509	53732.334485
408222	DXY	300	1786945500	99.493541	99.504327	99.475856	99.484370
410946	DXY	300	1786950000	99.438057	99.443694	99.418117	99.426910
410584	SP500	300	1786949400	7785.575263	7787.357417	7784.029588	7786.253096
410585	DOW	300	1786949400	53734.939326	53739.547028	53726.191166	53733.487104
410586	DXY	300	1786949400	99.456937	99.491457	99.450452	99.467186
408769	SP500	300	1786946400	7785.567139	7786.733662	7784.080897	7786.020586
408770	DOW	300	1786946400	53726.855849	53741.285661	53722.441539	53733.865998
408586	SP500	300	1786946100	7785.202174	7787.171322	7784.550578	7785.400693
408587	DOW	300	1786946100	53733.858368	53739.446843	53722.304135	53727.796953
408588	DXY	300	1786946100	99.485007	99.498377	99.466208	99.469175
408771	DXY	300	1786946400	99.471276	99.489849	99.462410	99.487677
409135	SP500	300	1786947000	7786.005412	7786.800793	7784.401390	7785.415639
409136	DOW	300	1786947000	53732.353771	53742.542396	53724.949500	53730.753427
409137	DXY	300	1786947000	99.489575	99.489990	99.462729	99.473905
409318	SP500	300	1786947300	7785.387761	7787.439877	7784.159886	7785.575764
409319	DOW	300	1786947300	53731.383117	53740.194235	53718.925718	53733.395770
409320	DXY	300	1786947300	99.471930	99.501821	99.469574	99.498660
410404	SP500	300	1786949100	7784.549753	7787.228432	7784.440131	7785.458313
410405	DOW	300	1786949100	53732.406651	53742.386207	53728.136506	53733.820766
409864	SP500	300	1786948200	7785.743518	7787.028632	7784.846944	7785.562334
409865	DOW	300	1786948200	53733.192744	53744.471175	53725.626942	53727.231328
409866	DXY	300	1786948200	99.500078	99.505986	99.484356	99.502447
410406	DXY	300	1786949100	99.473704	99.483552	99.450955	99.458466
410764	SP500	300	1786949700	7786.460250	7787.103748	7784.193058	7785.896446
410765	DOW	300	1786949700	53732.346317	53746.938266	53724.363041	53732.424062
410766	DXY	300	1786949700	99.467071	99.472469	99.430390	99.440179
411127	SP500	300	1786950300	7785.407629	7787.051691	7784.270360	7784.814555
411128	DOW	300	1786950300	53729.684272	53741.590574	53724.139400	53734.900539
411311	DOW	300	1786950600	53736.292075	53740.748591	53725.460080	53736.648644
411310	SP500	300	1786950600	7784.779503	7787.633847	7784.195621	7785.546870
411129	DXY	300	1786950300	99.429214	99.441801	99.403439	99.414761
411493	SP500	300	1786950900	7785.352626	7787.478697	7783.948216	7784.698221
411494	DOW	300	1786950900	53734.911468	53744.063086	53724.488569	53735.529892
411495	DXY	300	1786950900	99.432882	99.439749	99.403235	99.417079
411676	SP500	300	1786951200	7784.535363	7787.168819	7784.027577	7785.381943
411677	DOW	300	1786951200	53734.207299	53743.747214	53719.759687	53734.956171
411678	DXY	300	1786951200	99.417116	99.424662	99.396455	99.409488
411859	SP500	300	1786951500	7785.458833	7787.209363	7784.085178	7786.030680
411860	DOW	300	1786951500	53734.658667	53742.452039	53720.978809	53737.339410
411861	DXY	300	1786951500	99.407559	99.419953	99.367931	99.386186
416429	DOW	300	1786959000	53729.241215	53742.832932	53719.243290	53729.628092
416430	DXY	300	1786959000	99.399336	99.423248	99.394565	99.401931
416608	SP500	300	1786959300	7785.499407	7787.125973	7784.671800	7785.819150
415696	SP500	300	1786957800	7784.743321	7786.446767	7784.523216	7785.601530
415697	DOW	300	1786957800	53732.491614	53742.700695	53722.595621	53739.819901
413689	SP500	300	1786954500	7785.982820	7786.827090	7784.352171	7785.985944
413690	DOW	300	1786954500	53726.440109	53742.862462	53720.793307	53731.213412
413691	DXY	300	1786954500	99.361404	99.375973	99.353423	99.367205
412042	SP500	300	1786951800	7786.100005	7786.945278	7783.993206	7785.783948
412043	DOW	300	1786951800	53735.949113	53742.124180	53724.705258	53735.205709
412044	DXY	300	1786951800	99.386815	99.402184	99.356174	99.374057
415698	DXY	300	1786957800	99.414093	99.437522	99.404034	99.410978
416428	SP500	300	1786959000	7785.372808	7786.712399	7784.343675	7785.767999
416062	SP500	300	1786958400	7786.335106	7787.137820	7784.461340	7786.128747
414964	SP500	300	1786956600	7786.504100	7786.825947	7784.622764	7785.477718
414965	DOW	300	1786956600	53734.278692	53742.268643	53724.661810	53731.718102
414966	DXY	300	1786956600	99.336293	99.363000	99.333889	99.360054
412591	SP500	300	1786952700	7785.233510	7786.937996	7784.109546	7786.058537
412592	DOW	300	1786952700	53739.132509	53745.226607	53717.825194	53731.926495
412593	DXY	300	1786952700	99.325588	99.357973	99.322044	99.330884
416063	DOW	300	1786958400	53728.459176	53746.210210	53722.145173	53734.895344
414601	SP500	300	1786956000	7785.210667	7787.763480	7784.238745	7785.520306
412225	SP500	300	1786952100	7785.480719	7788.056068	7784.300058	7785.272911
412226	DOW	300	1786952100	53734.223810	53740.891195	53726.000098	53737.004105
412227	DXY	300	1786952100	99.373249	99.389695	99.344624	99.345254
414055	SP500	300	1786955100	7785.741230	7786.928918	7784.204613	7786.632988
414056	DOW	300	1786955100	53732.291922	53739.710723	53721.287503	53729.287673
414057	DXY	300	1786955100	99.349224	99.356270	99.334876	99.338563
413140	SP500	300	1786953600	7785.674831	7787.119788	7784.486695	7785.357734
413141	DOW	300	1786953600	53731.061309	53737.498156	53721.062660	53730.633956
413142	DXY	300	1786953600	99.351316	99.360211	99.329405	99.355434
413323	SP500	300	1786953900	7785.389936	7787.604381	7784.424981	7785.844822
413324	DOW	300	1786953900	53731.609605	53740.152425	53725.247020	53735.949209
413325	DXY	300	1786953900	99.355254	99.364953	99.342693	99.362259
412957	SP500	300	1786953300	7785.576366	7787.232927	7784.841115	7785.461610
412958	DOW	300	1786953300	53739.667675	53744.925018	53723.010728	53731.438913
412959	DXY	300	1786953300	99.316386	99.352866	99.312039	99.352866
414602	DOW	300	1786956000	53727.411132	53742.695503	53719.155334	53727.767580
414603	DXY	300	1786956000	99.294642	99.320315	99.282417	99.318052
414238	SP500	300	1786955400	7786.519603	7787.163708	7784.574112	7785.843461
414239	DOW	300	1786955400	53731.299175	53741.911596	53724.462149	53729.920391
412408	SP500	300	1786952400	7785.121534	7786.925428	7784.346845	7785.308855
412409	DOW	300	1786952400	53737.378739	53738.758166	53722.324906	53737.222890
412410	DXY	300	1786952400	99.344620	99.351896	99.301390	99.324269
414240	DXY	300	1786955400	99.337013	99.349105	99.313974	99.313974
413872	SP500	300	1786954800	7786.129796	7787.220153	7783.900152	7785.800290
413873	DOW	300	1786954800	53729.199525	53742.592975	53723.767585	53733.753744
413874	DXY	300	1786954800	99.369501	99.377777	99.333387	99.350987
413506	SP500	300	1786954200	7786.046104	7787.378581	7784.440737	7785.962149
413507	DOW	300	1786954200	53736.307743	53738.865579	53722.733034	53727.655250
412774	SP500	300	1786953000	7786.253465	7786.858516	7784.464789	7785.487499
412775	DOW	300	1786953000	53733.265580	53739.518218	53726.384778	53739.518218
412776	DXY	300	1786953000	99.330322	99.340597	99.299174	99.318114
413508	DXY	300	1786954200	99.360136	99.376794	99.342472	99.360966
415879	SP500	300	1786958100	7785.858242	7787.160582	7783.953780	7786.185236
415880	DOW	300	1786958100	53739.563493	53743.433433	53720.800443	53730.247681
415513	SP500	300	1786957500	7785.064665	7787.245602	7784.921415	7784.921415
415330	SP500	300	1786957200	7785.357035	7787.142154	7784.839604	7784.854368
415331	DOW	300	1786957200	53733.247904	53746.604889	53722.897473	53732.748252
414781	SP500	300	1786956300	7785.327605	7787.436254	7784.868482	7786.509176
414782	DOW	300	1786956300	53727.837227	53742.239119	53722.719593	53732.549615
414783	DXY	300	1786956300	99.315895	99.347294	99.312332	99.336977
414421	SP500	300	1786955700	7785.993806	7786.707035	7784.391248	7785.499398
414422	DOW	300	1786955700	53727.935591	53747.777664	53723.009855	53727.872867
414423	DXY	300	1786955700	99.312770	99.326927	99.289257	99.295269
415147	SP500	300	1786956900	7785.660319	7787.284339	7784.381859	7785.578079
415148	DOW	300	1786956900	53733.216432	53745.209845	53724.104886	53731.851356
415149	DXY	300	1786956900	99.358249	99.380601	99.347576	99.367421
415332	DXY	300	1786957200	99.365762	99.434302	99.362870	99.434302
415881	DXY	300	1786958100	99.413054	99.419045	99.397028	99.406735
416609	DOW	300	1786959300	53727.551336	53740.581998	53722.706631	53734.640575
416610	DXY	300	1786959300	99.400214	99.413586	99.389493	99.399693
415514	DOW	300	1786957500	53732.863551	53739.435603	53721.427910	53733.536463
415515	DXY	300	1786957500	99.432537	99.447383	99.411000	99.413675
416245	SP500	300	1786958700	7785.935541	7786.922683	7784.264649	7785.150205
416064	DXY	300	1786958400	99.404466	99.427724	99.401292	99.412012
416246	DOW	300	1786958700	53735.956282	53743.280672	53725.462814	53728.107449
416247	DXY	300	1786958700	99.412383	99.423472	99.384219	99.399208
416788	SP500	300	1786959600	7785.902812	7787.771397	7784.086369	7785.387673
416789	DOW	300	1786959600	53735.954907	53741.943740	53721.866703	53728.367809
416790	DXY	300	1786959600	99.401742	99.412953	99.385587	99.400933
416971	SP500	300	1786959900	7785.585112	7787.091897	7783.958129	7786.053153
416972	DOW	300	1786959900	53730.034863	53743.989158	53720.146989	53733.571792
416973	DXY	300	1786959900	99.401096	99.418809	99.393232	99.407893
417154	SP500	300	1786960200	7786.151300	7787.224297	7784.725650	7785.848773
417155	DOW	300	1786960200	53732.408146	53741.457449	53721.107785	53734.494218
417156	DXY	300	1786960200	99.407751	99.409822	99.381205	99.395721
417337	SP500	300	1786960500	7785.936798	7787.450116	7784.426837	7785.655229
417338	DOW	300	1786960500	53734.054086	53742.535672	53725.775670	53737.672049
419156	DOW	300	1786963500	53732.501548	53738.053001	53720.936975	53737.828080
419157	DXY	300	1786963500	99.444544	99.462698	99.431294	99.458322
422074	SP500	300	1786968300	7785.990449	7786.989365	7784.384277	7786.025679
422075	DOW	300	1786968300	53735.557569	53739.274160	53717.886322	53732.963245
422076	DXY	300	1786968300	99.473323	99.482234	99.452793	99.464767
420067	SP500	300	1786965000	7785.144068	7787.275823	7784.310595	7785.468158
420068	DOW	300	1786965000	53730.819990	53740.460264	53720.228809	53735.610483
420069	DXY	300	1786965000	99.473286	99.476109	99.449548	99.463108
418069	SP500	300	1786961700	7786.415278	7787.268725	7784.499908	7785.930699
418070	DOW	300	1786961700	53731.196727	53740.308283	53723.277088	53735.072429
418071	DXY	300	1786961700	99.439141	99.471353	99.434809	99.451638
417703	SP500	300	1786961100	7785.519858	7787.209801	7782.994139	7786.116139
417704	DOW	300	1786961100	53724.481207	53742.202029	53721.447470	53735.561097
417705	DXY	300	1786961100	99.409152	99.434375	99.403578	99.422255
419884	SP500	300	1786964700	7786.629826	7787.503257	7784.368538	7785.260033
419885	DOW	300	1786964700	53729.827799	53746.414742	53722.539561	53728.831843
419886	DXY	300	1786964700	99.467030	99.484000	99.456091	99.472972
422256	DXY	300	1786968600	99.466402	99.470074	99.429054	99.431934
420433	SP500	300	1786965600	7784.872359	7786.815138	7784.696403	7784.938615
420434	DOW	300	1786965600	53731.924939	53741.269731	53722.199184	53735.824018
420435	DXY	300	1786965600	99.439706	99.477041	99.437281	99.470291
419518	SP500	300	1786964100	7785.710295	7787.822722	7784.030047	7786.129624
418615	SP500	300	1786962600	7786.766458	7787.128907	7784.631680	7785.029380
418616	DOW	300	1786962600	53725.741672	53739.760854	53721.032454	53732.998752
418617	DXY	300	1786962600	99.434535	99.448935	99.426943	99.432335
418795	SP500	300	1786962900	7785.196943	7787.038700	7784.365054	7785.328746
418796	DOW	300	1786962900	53732.549903	53741.479963	53724.115141	53731.521006
418797	DXY	300	1786962900	99.430984	99.452724	99.404572	99.404572
418435	SP500	300	1786962300	7786.478662	7787.108782	7784.376861	7786.486385
418436	DOW	300	1786962300	53732.790477	53740.856807	53725.642017	53727.630596
418437	DXY	300	1786962300	99.431794	99.442136	99.422613	99.433740
417886	SP500	300	1786961400	7786.196907	7787.447335	7784.756103	7786.165010
417887	DOW	300	1786961400	53736.721209	53741.262212	53723.810695	53730.107900
417888	DXY	300	1786961400	99.424079	99.441658	99.420614	99.440173
417339	DXY	300	1786960500	99.394427	99.423017	99.383610	99.401440
419519	DOW	300	1786964100	53729.958169	53745.091388	53724.786626	53732.776157
419520	DXY	300	1786964100	99.446603	99.461831	99.439959	99.441093
422436	DXY	300	1786968900	99.430491	99.454937	99.425302	99.453109
418975	SP500	300	1786963200	7785.564598	7787.141894	7784.699553	7785.088490
418976	DOW	300	1786963200	53733.254900	53741.271529	53724.473060	53732.196424
418977	DXY	300	1786963200	99.404728	99.452672	99.402197	99.445150
417520	SP500	300	1786960800	7785.599402	7786.504202	7784.658954	7785.237082
417521	DOW	300	1786960800	53738.748627	53743.343107	53722.625432	53725.845734
417522	DXY	300	1786960800	99.402839	99.432259	99.398694	99.408843
418252	SP500	300	1786962000	7786.010711	7786.999184	7784.603614	7786.318582
418253	DOW	300	1786962000	53736.801856	53745.267824	53724.657475	53733.676015
418254	DXY	300	1786962000	99.453518	99.460376	99.419268	99.433998
419335	SP500	300	1786963800	7785.675164	7786.716709	7784.509741	7785.840285
419336	DOW	300	1786963800	53739.188376	53745.156353	53718.244359	53731.606262
419337	DXY	300	1786963800	99.458188	99.462200	99.444543	99.444548
422254	SP500	300	1786968600	7786.158744	7787.759908	7784.365488	7785.729032
421891	SP500	300	1786968000	7786.104197	7787.289251	7784.304611	7786.218353
420250	SP500	300	1786965300	7785.574656	7787.183160	7783.766027	7785.148162
420251	DOW	300	1786965300	53734.043195	53738.722281	53718.613894	53733.048087
420252	DXY	300	1786965300	99.462062	99.475647	99.433289	99.439263
419701	SP500	300	1786964400	7786.397524	7787.143374	7784.007201	7786.423628
419702	DOW	300	1786964400	53733.121310	53745.265654	53719.492640	53729.148693
419703	DXY	300	1786964400	99.443259	99.471592	99.442393	99.466623
420976	SP500	300	1786966500	7785.315941	7787.153602	7784.195471	7786.815521
419155	SP500	300	1786963500	7784.778497	7787.230579	7784.586985	7785.784217
420977	DOW	300	1786966500	53733.638692	53743.374724	53720.298347	53732.526490
420978	DXY	300	1786966500	99.482158	99.489076	99.466887	99.466926
420613	SP500	300	1786965900	7784.670682	7787.003316	7783.912474	7785.842697
420614	DOW	300	1786965900	53733.737042	53742.394114	53721.348037	53730.307028
420615	DXY	300	1786965900	99.472264	99.493995	99.454277	99.488677
421159	SP500	300	1786966800	7786.657740	7787.138539	7784.219645	7785.611405
421160	DOW	300	1786966800	53731.707153	53743.839863	53723.863854	53734.702920
421161	DXY	300	1786966800	99.467130	99.488086	99.463225	99.467454
420793	SP500	300	1786966200	7785.679093	7787.051867	7784.921907	7785.192049
420794	DOW	300	1786966200	53729.285341	53741.157272	53723.300941	53733.748011
420795	DXY	300	1786966200	99.488294	99.505651	99.474536	99.482685
421342	SP500	300	1786967100	7785.540930	7786.920581	7784.685172	7786.321453
421343	DOW	300	1786967100	53734.815271	53741.741625	53722.380803	53735.855530
421344	DXY	300	1786967100	99.468542	99.491937	99.464245	99.468329
421525	SP500	300	1786967400	7786.602046	7787.289190	7784.509868	7785.373530
421526	DOW	300	1786967400	53734.600664	53745.594798	53722.136492	53730.293096
421892	DOW	300	1786968000	53729.514015	53742.280861	53721.984805	53733.926543
421893	DXY	300	1786968000	99.504068	99.504941	99.466896	99.472531
421527	DXY	300	1786967400	99.466300	99.500073	99.463333	99.491128
421708	SP500	300	1786967700	7785.539677	7787.850735	7784.163346	7786.070817
421709	DOW	300	1786967700	53730.667030	53740.776774	53720.610889	53728.394778
421710	DXY	300	1786967700	99.491047	99.504241	99.482616	99.502224
422255	DOW	300	1786968600	53731.671833	53740.463928	53721.446837	53736.298620
422616	DXY	300	1786969200	99.454667	99.473390	99.431814	99.455090
422434	SP500	300	1786968900	7785.496105	7787.483667	7784.369041	7786.162092
422435	DOW	300	1786968900	53736.103629	53739.942379	53723.211541	53731.528463
422794	SP500	300	1786969500	7785.775876	7787.326999	7784.369415	7785.573655
422614	SP500	300	1786969200	7786.406324	7787.102507	7784.426232	7785.664787
422615	DOW	300	1786969200	53730.004992	53745.245568	53718.432739	53729.008285
423156	DXY	300	1786970100	99.455235	99.492279	99.426434	99.474756
423522	DXY	300	1786970700	99.467848	99.488546	99.460905	99.469137
425702	DOW	300	1786974300	53602.508002	53644.013519	53574.121655	53643.830331
425703	DXY	300	1786974300	99.418267	99.457353	99.406082	99.455056
424801	SP500	300	1786972800	7784.839615	7786.764922	7784.114417	7786.448908
424802	DOW	300	1786972800	53729.890568	53741.010265	53724.479702	53732.835084
424803	DXY	300	1786972800	99.410347	99.437149	99.405820	99.433965
425161	SP500	300	1786973400	7785.729183	7789.492549	7775.239943	7775.633310
425162	DOW	300	1786973400	53729.846522	53731.971131	53522.883654	53546.518942
425163	DXY	300	1786973400	99.414972	99.429413	99.403434	99.425656
425885	DOW	300	1786974600	53645.554878	53649.719860	53549.591990	53573.735695
425886	DXY	300	1786974600	99.453386	99.478897	99.435004	99.472525
424618	SP500	300	1786972500	7785.479094	7787.201538	7784.206579	7785.088461
424619	DOW	300	1786972500	53737.008156	53740.491501	53716.483998	53731.792160
424620	DXY	300	1786972500	99.431899	99.439496	99.409938	99.411749
422795	DOW	300	1786969500	53727.658915	53742.505716	53720.404904	53730.928675
422796	DXY	300	1786969500	99.456329	99.482324	99.444906	99.461897
423337	SP500	300	1786970400	7786.066501	7786.541783	7784.696475	7785.921633
423338	DOW	300	1786970400	53734.880765	53741.055600	53727.220080	53732.934376
423339	DXY	300	1786970400	99.475418	99.484441	99.446931	99.467375
424069	SP500	300	1786971600	7784.377293	7786.501290	7782.803345	7785.514402
424070	DOW	300	1786971600	53739.790030	53756.205998	53715.978989	53733.337570
424071	DXY	300	1786971600	99.464502	99.487342	99.444506	99.447584
423886	SP500	300	1786971300	7786.159366	7786.413980	7784.109792	7784.198091
423887	DOW	300	1786971300	53732.985743	53743.049632	53725.942274	53737.679049
423888	DXY	300	1786971300	99.450914	99.472870	99.436743	99.465561
422974	SP500	300	1786969800	7785.785503	7787.123263	7783.982642	7785.767825
422975	DOW	300	1786969800	53731.163003	53743.169949	53721.818018	53729.240989
422976	DXY	300	1786969800	99.460207	99.475312	99.436282	99.455629
426617	DOW	300	1786975800	53635.449377	53654.877724	53598.499346	53598.499346
426618	DXY	300	1786975800	99.439983	99.458515	99.419349	99.425161
423703	SP500	300	1786971000	7786.622705	7787.475192	7784.557398	7785.914794
423704	DOW	300	1786971000	53731.011817	53744.520816	53725.199654	53733.099211
423705	DXY	300	1786971000	99.466907	99.477586	99.445302	99.449996
427533	DXY	300	1786977300	99.399138	99.457619	99.393843	99.447542
424252	SP500	300	1786971900	7785.779768	7786.965709	7784.260780	7785.766407
424253	DOW	300	1786971900	53732.895937	53739.204157	53721.503465	53730.813297
424254	DXY	300	1786971900	99.448028	99.453855	99.419295	99.425062
426433	SP500	300	1786975500	7774.865721	7777.111986	7772.228702	7774.906321
425521	SP500	300	1786974000	7774.246647	7778.182615	7773.497811	7776.171587
425522	DOW	300	1786974000	53579.623248	53615.982466	53546.828330	53603.742190
423154	SP500	300	1786970100	7785.641244	7787.422745	7784.413349	7786.337877
423155	DOW	300	1786970100	53731.135487	53740.000569	53724.410569	53733.792788
425523	DXY	300	1786974000	99.441460	99.442790	99.409904	99.419646
425341	SP500	300	1786973700	7775.420418	7780.190409	7774.216483	7774.515613
423520	SP500	300	1786970700	7785.731681	7787.613458	7783.484384	7786.452626
423521	DOW	300	1786970700	53732.303717	53740.775359	53718.158690	53729.691002
425342	DOW	300	1786973700	53547.768431	53584.713298	53513.009141	53578.486411
425343	DXY	300	1786973700	99.424571	99.443243	99.407234	99.440783
426250	SP500	300	1786975200	7774.157856	7777.339773	7770.770575	7775.097471
426251	DOW	300	1786975200	53559.971623	53612.115147	53529.840478	53580.934607
424435	SP500	300	1786972200	7785.709026	7787.306616	7784.432629	7785.228127
424436	DOW	300	1786972200	53730.730344	53743.587914	53723.643084	53735.412530
424437	DXY	300	1786972200	99.424594	99.434985	99.415752	99.431438
426252	DXY	300	1786975200	99.462425	99.466570	99.415224	99.435240
426434	DOW	300	1786975500	53578.862848	53651.909379	53569.958694	53636.896773
426435	DXY	300	1786975500	99.430816	99.458587	99.420312	99.438832
424981	SP500	300	1786973100	7786.529050	7787.303094	7784.161277	7785.802768
424982	DOW	300	1786973100	53733.361393	53739.394881	53722.321939	53728.602572
424983	DXY	300	1786973100	99.432257	99.452018	99.404565	99.415284
426067	SP500	300	1786974900	7778.662261	7780.092776	7773.088214	7773.901404
426068	DOW	300	1786974900	53572.757751	53576.593180	53541.274608	53558.647542
426069	DXY	300	1786974900	99.471078	99.499012	99.464023	99.464023
426982	SP500	300	1786976400	7775.301924	7775.301924	7770.534845	7772.295749
425701	SP500	300	1786974300	7776.191716	7780.869976	7771.898862	7780.146641
426983	DOW	300	1786976400	53598.370112	53598.370112	53560.284058	53588.679976
426984	DXY	300	1786976400	99.423460	99.437804	99.412176	99.422283
425884	SP500	300	1786974600	7780.132291	7780.301106	7775.955258	7778.920802
427899	DXY	300	1786977900	99.453972	99.488221	99.436330	99.470888
427532	DOW	300	1786977300	53568.960850	53576.845441	53489.838471	53516.161581
427531	SP500	300	1786977300	7775.706288	7776.770284	7770.456174	7772.309260
426616	SP500	300	1786975800	7774.791015	7778.737868	7773.610330	7777.870390
426799	SP500	300	1786976100	7777.788560	7777.938149	7772.515011	7775.023966
426800	DOW	300	1786976100	53597.709724	53608.215219	53562.637000	53597.337037
426801	DXY	300	1786976100	99.426938	99.439763	99.410166	99.421851
427165	SP500	300	1786976700	7772.136006	7774.414914	7770.565104	7774.227486
427166	DOW	300	1786976700	53587.238420	53601.151954	53548.679487	53553.672902
427167	DXY	300	1786976700	99.422005	99.428431	99.395672	99.407731
427348	SP500	300	1786977000	7774.073600	7777.947223	7773.135152	7775.818648
427349	DOW	300	1786977000	53554.848407	53582.223391	53554.848407	53569.403542
427350	DXY	300	1786977000	99.407849	99.421498	99.392412	99.399429
427714	SP500	300	1786977600	7772.027747	7774.312045	7770.779671	7772.974725
427715	DOW	300	1786977600	53516.970843	53524.503886	53492.881430	53508.635557
427716	DXY	300	1786977600	99.447662	99.468351	99.432493	99.452720
428079	DXY	300	1786978200	99.469080	99.481195	99.455194	99.474688
427897	SP500	300	1786977900	7773.142116	7775.061436	7771.744117	7771.993033
427898	DOW	300	1786977900	53506.906792	53544.859253	53492.537646	53538.912930
428077	SP500	300	1786978200	7772.240370	7775.523833	7769.104832	7770.317936
428078	DOW	300	1786978200	53540.773147	53545.117372	53511.507481	53519.106621
432077	DOW	300	1786984800	53578.769191	53584.929186	53550.017465	53550.378070
432078	DXY	300	1786984800	99.499090	99.504878	99.481650	99.498546
432808	SP500	300	1786986000	7768.421282	7769.543472	7765.786998	7766.542642
431167	SP500	300	1786983300	7774.541406	7777.325027	7773.400046	7775.760746
430438	SP500	300	1786982100	7774.087356	7776.396985	7773.246002	7774.386698
428257	SP500	300	1786978500	7770.110405	7773.813554	7768.878523	7772.674272
428258	DOW	300	1786978500	53518.059330	53521.448265	53496.127965	53504.473264
428259	DXY	300	1786978500	99.477153	99.496097	99.464006	99.473547
430255	SP500	300	1786981800	7771.450982	7775.308443	7770.353890	7774.002563
428797	SP500	300	1786979400	7774.609179	7776.986752	7773.233960	7773.833795
428798	DOW	300	1786979400	53526.283245	53560.363981	53517.668307	53541.643859
428799	DXY	300	1786979400	99.503139	99.517185	99.492152	99.500378
430256	DOW	300	1786981800	53514.587804	53535.837023	53503.569062	53523.894452
430257	DXY	300	1786981800	99.516340	99.550890	99.510950	99.549438
430439	DOW	300	1786982100	53524.464524	53544.324169	53507.899910	53519.753721
430440	DXY	300	1786982100	99.551036	99.554959	99.509047	99.515393
429340	SP500	300	1786980300	7777.888292	7779.312852	7775.794253	7778.806957
429341	DOW	300	1786980300	53552.103020	53572.196259	53546.565280	53563.494977
429342	DXY	300	1786980300	99.515416	99.542882	99.505055	99.526528
428437	SP500	300	1786978800	7772.559478	7776.250000	7771.967694	7775.297970
428438	DOW	300	1786978800	53506.475080	53537.945865	53497.592995	53511.790583
428439	DXY	300	1786978800	99.474836	99.507640	99.460197	99.507640
429523	SP500	300	1786980600	7779.068403	7779.245302	7773.337109	7774.089083
429524	DOW	300	1786980600	53564.877981	53566.317697	53513.671661	53524.375983
429525	DXY	300	1786980600	99.524830	99.544806	99.517713	99.530449
429157	SP500	300	1786980000	7778.535398	7780.181100	7776.046462	7777.611671
429158	DOW	300	1786980000	53557.603430	53579.017362	53552.126543	53553.657992
429159	DXY	300	1786980000	99.525873	99.530370	99.502906	99.513032
431168	DOW	300	1786983300	53591.453460	53608.245156	53584.104898	53594.025472
430072	SP500	300	1786981500	7772.178898	7773.747082	7770.520810	7771.250654
430073	DOW	300	1786981500	53517.756772	53532.037997	53505.875378	53514.818019
430074	DXY	300	1786981500	99.528059	99.537062	99.509417	99.514468
429706	SP500	300	1786980900	7774.349423	7774.892746	7770.400000	7771.026345
428617	SP500	300	1786979100	7775.487171	7777.672603	7773.067581	7774.475888
428618	DOW	300	1786979100	53511.043137	53527.708787	53487.816511	53525.882182
428619	DXY	300	1786979100	99.509683	99.515282	99.486262	99.503010
429707	DOW	300	1786980900	53524.923867	53543.020630	53509.209714	53525.541665
428977	SP500	300	1786979700	7774.004617	7779.231558	7773.744144	7778.491979
428978	DOW	300	1786979700	53542.847954	53580.849425	53526.747297	53556.839289
428979	DXY	300	1786979700	99.500723	99.528156	99.498380	99.526769
429708	DXY	300	1786980900	99.528847	99.541845	99.510101	99.518411
431169	DXY	300	1786983300	99.515039	99.522753	99.487929	99.505121
431716	SP500	300	1786984200	7773.867404	7774.715589	7770.383997	7771.829845
430801	SP500	300	1786982700	7773.226833	7775.601084	7770.751392	7771.936772
430802	DOW	300	1786982700	53550.450855	53568.283404	53532.045962	53550.385987
430803	DXY	300	1786982700	99.497965	99.498671	99.472490	99.485029
431717	DOW	300	1786984200	53586.820857	53600.311421	53554.627885	53554.627885
431718	DXY	300	1786984200	99.493321	99.493321	99.473078	99.486329
431533	SP500	300	1786983900	7774.566677	7775.867761	7771.563601	7774.080491
430618	SP500	300	1786982400	7774.139695	7774.912403	7771.236761	7773.030172
430619	DOW	300	1786982400	53520.396535	53548.685477	53511.667303	53548.685477
430620	DXY	300	1786982400	99.513633	99.519389	99.486575	99.497003
429889	SP500	300	1786981200	7770.756925	7772.035427	7768.639161	7772.029458
429890	DOW	300	1786981200	53526.040180	53534.916807	53505.016561	53515.952899
429891	DXY	300	1786981200	99.520454	99.533918	99.497747	99.526082
431534	DOW	300	1786983900	53600.073708	53611.795957	53582.330724	53586.052076
430984	SP500	300	1786983000	7771.650961	7775.331865	7771.290691	7774.264635
430985	DOW	300	1786983000	53548.739577	53600.325037	53543.456943	53589.531544
430986	DXY	300	1786983000	99.485189	99.519098	99.475829	99.514550
431350	SP500	300	1786983600	7776.017739	7777.644835	7773.944238	7774.510856
431351	DOW	300	1786983600	53592.033606	53621.464416	53582.217284	53599.362539
431352	DXY	300	1786983600	99.503305	99.525097	99.493609	99.499236
431535	DXY	300	1786983900	99.499505	99.509758	99.478523	99.493958
432625	SP500	300	1786985700	7769.375970	7770.834502	7766.680532	7768.283983
432626	DOW	300	1786985700	53512.080017	53529.429339	53498.985985	53511.384668
432809	DOW	300	1786986000	53511.277682	53528.691143	53494.606244	53514.469118
432810	DXY	300	1786986000	99.483709	99.506673	99.479237	99.497228
431896	SP500	300	1786984500	7771.729628	7773.686738	7770.831939	7773.053416
431897	DOW	300	1786984500	53554.102625	53582.495177	53551.321094	53577.645747
431898	DXY	300	1786984500	99.488071	99.503755	99.470407	99.496890
432991	SP500	300	1786986300	7766.838261	7767.494295	7764.496820	7766.908365
432627	DXY	300	1786985700	99.477080	99.494069	99.473358	99.486095
432442	SP500	300	1786985400	7771.138055	7771.705692	7767.817404	7769.095447
432443	DOW	300	1786985400	53544.900610	53549.476439	53510.235686	53512.058475
432076	SP500	300	1786984800	7773.030229	7773.170637	7769.638315	7769.913738
432444	DXY	300	1786985400	99.480565	99.488524	99.462900	99.478191
432259	SP500	300	1786985100	7769.718861	7772.071272	7767.787048	7770.855785
432260	DOW	300	1786985100	53548.732670	53570.620748	53534.658547	53542.979926
432261	DXY	300	1786985100	99.500733	99.510824	99.466540	99.480167
432992	DOW	300	1786986300	53515.148938	53536.220415	53509.240949	53535.694170
432993	DXY	300	1786986300	99.494931	99.509360	99.483871	99.501099
433174	SP500	300	1786986600	7766.762040	7767.776876	7763.807579	7765.303084
433175	DOW	300	1786986600	53534.146110	53556.466212	53527.173786	53545.308373
433176	DXY	300	1786986600	99.500611	99.510589	99.484605	99.493774
433357	SP500	300	1786986900	7765.559385	7765.598773	7761.277551	7762.999281
433358	DOW	300	1786986900	53543.982636	53552.404172	53525.515729	53529.259396
433359	DXY	300	1786986900	99.492250	99.513549	99.488507	99.504604
433540	SP500	300	1786987200	7763.118705	7763.934704	7757.365959	7758.956071
433541	DOW	300	1786987200	53527.355609	53551.969922	53496.786763	53498.662968
438100	SP500	300	1786994700	7753.229886	7754.550000	7751.068672	7751.683755
438101	DOW	300	1786994700	53493.718158	53503.694380	53473.536698	53485.115555
437008	SP500	300	1786992900	7756.989220	7757.560516	7755.087601	7755.541147
437009	DOW	300	1786992900	53486.518102	53494.277288	53476.384853	53477.288652
437010	DXY	300	1786992900	99.637065	99.653819	99.628719	99.639995
438102	DXY	300	1786994700	99.606803	99.609399	99.573591	99.596525
437920	SP500	300	1786994400	7755.067745	7755.468014	7752.437094	7753.530924
437921	DOW	300	1786994400	53506.835491	53519.843157	53480.608357	53492.264591
437922	DXY	300	1786994400	99.627173	99.638776	99.596531	99.604497
436279	SP500	300	1786991700	7752.734952	7756.456920	7752.734952	7755.305362
434272	SP500	300	1786988400	7752.237715	7759.180710	7751.593071	7757.775794
434273	DOW	300	1786988400	53400.882826	53457.968960	53395.478103	53457.968960
434274	DXY	300	1786988400	99.532995	99.553666	99.515609	99.549476
433906	SP500	300	1786987800	7755.901215	7759.702294	7754.660979	7754.891426
433907	DOW	300	1786987800	53477.015242	53487.991536	53441.898316	53443.170235
433908	DXY	300	1786987800	99.528090	99.549830	99.519849	99.540472
435367	SP500	300	1786990200	7754.300239	7758.235195	7752.814973	7757.085754
435368	DOW	300	1786990200	53455.340096	53485.201656	53454.447131	53471.294255
435369	DXY	300	1786990200	99.586083	99.604643	99.584171	99.597393
436280	DOW	300	1786991700	53459.218639	53490.117594	53451.928219	53481.071997
436281	DXY	300	1786991700	99.610833	99.639804	99.606843	99.619422
436096	SP500	300	1786991400	7755.964796	7756.680000	7752.515968	7752.969544
436097	DOW	300	1786991400	53493.483525	53494.116293	53456.867144	53459.866458
436098	DXY	300	1786991400	99.585170	99.616612	99.583609	99.608724
434818	SP500	300	1786989300	7757.099314	7758.507665	7753.367791	7755.302332
434819	DOW	300	1786989300	53453.108706	53453.469315	53433.868189	53442.832455
434820	DXY	300	1786989300	99.580751	99.588092	99.555041	99.569264
434635	SP500	300	1786989000	7755.666253	7757.773236	7753.550529	7756.794186
434636	DOW	300	1786989000	53434.832207	53454.024008	53417.963545	53451.530101
434637	DXY	300	1786989000	99.592786	99.603386	99.566051	99.581152
437740	SP500	300	1786994100	7752.386569	7755.898265	7751.374667	7755.189182
434089	SP500	300	1786988100	7754.706814	7756.462507	7752.013349	7752.013349
434090	DOW	300	1786988100	53444.939449	53445.850455	53400.547660	53400.547660
434091	DXY	300	1786988100	99.538809	99.551402	99.522517	99.531560
433542	DXY	300	1786987200	99.504795	99.518429	99.494454	99.514407
436642	SP500	300	1786992300	7756.762422	7758.888085	7755.846694	7757.052740
436643	DOW	300	1786992300	53476.664528	53514.450823	53475.476971	53501.486329
435001	SP500	300	1786989600	7755.018860	7756.837858	7753.453707	7754.478992
435002	DOW	300	1786989600	53440.996619	53466.973237	53434.517955	53453.949702
435003	DXY	300	1786989600	99.570897	99.587195	99.566258	99.570489
436644	DXY	300	1786992300	99.641544	99.654212	99.629367	99.642937
434455	SP500	300	1786988700	7757.802668	7759.566178	7754.864769	7755.586640
434456	DOW	300	1786988700	53458.413289	53465.614811	53429.369092	53436.122279
434457	DXY	300	1786988700	99.547845	99.594479	99.546088	99.592282
433723	SP500	300	1786987500	7758.854435	7759.854399	7754.795682	7756.118323
433724	DOW	300	1786987500	53497.016143	53498.890398	53465.562157	53475.777626
433725	DXY	300	1786987500	99.516365	99.535293	99.507003	99.527427
436462	SP500	300	1786992000	7755.072865	7758.271037	7754.442373	7756.936349
435730	SP500	300	1786990800	7756.665591	7758.709293	7754.101428	7757.015561
435731	DOW	300	1786990800	53482.704969	53493.353033	53454.944627	53485.859034
435732	DXY	300	1786990800	99.597819	99.616018	99.580721	99.588809
436463	DOW	300	1786992000	53479.885673	53492.969781	53467.966158	53478.294825
435184	SP500	300	1786989900	7754.690061	7756.788781	7753.099536	7754.029517
435185	DOW	300	1786989900	53452.849601	53484.227533	53445.695986	53456.931270
435186	DXY	300	1786989900	99.571889	99.599559	99.567451	99.587889
436464	DXY	300	1786992000	99.619862	99.650300	99.617033	99.643285
435550	SP500	300	1786990500	7756.884141	7759.259939	7755.381560	7756.732650
435551	DOW	300	1786990500	53469.954450	53498.446604	53463.777819	53483.797556
435552	DXY	300	1786990500	99.599393	99.609109	99.579047	99.595811
437741	DOW	300	1786994100	53502.201716	53521.012471	53490.359849	53505.733463
437742	DXY	300	1786994100	99.628759	99.638609	99.615978	99.626253
435913	SP500	300	1786991100	7756.893753	7758.555602	7754.262205	7755.976722
435914	DOW	300	1786991100	53487.993839	53501.797004	53477.691630	53491.631911
435915	DXY	300	1786991100	99.588611	99.600155	99.580164	99.586187
438280	SP500	300	1786995000	7751.560944	7752.057288	7747.455717	7749.547190
437191	SP500	300	1786993200	7755.704924	7757.410935	7753.115438	7753.626170
437192	DOW	300	1786993200	53476.998274	53495.884659	53465.635820	53488.657530
437193	DXY	300	1786993200	99.638373	99.649089	99.613492	99.628541
437374	SP500	300	1786993500	7753.674721	7755.188406	7751.380038	7753.346720
436825	SP500	300	1786992600	7757.326815	7759.141749	7755.884756	7757.189638
436826	DOW	300	1786992600	53503.505467	53510.236673	53478.330504	53488.152164
436827	DXY	300	1786992600	99.641691	99.654924	99.624242	99.637764
437375	DOW	300	1786993500	53486.965688	53502.147427	53479.854950	53493.335114
437376	DXY	300	1786993500	99.627552	99.650315	99.622824	99.638462
438281	DOW	300	1786995000	53484.727535	53486.734871	53435.939081	53457.285025
438282	DXY	300	1786995000	99.594274	99.598661	99.579469	99.586498
437557	SP500	300	1786993800	7753.269985	7754.403622	7751.910805	7752.237974
437558	DOW	300	1786993800	53494.252345	53517.521082	53483.551895	53500.335314
437559	DXY	300	1786993800	99.640730	99.645286	99.620665	99.630333
438462	DXY	300	1786995300	99.585241	99.597107	99.568877	99.579710
438642	DXY	300	1786995600	99.578537	99.604019	99.569606	99.587742
438460	SP500	300	1786995300	7749.388572	7752.963311	7748.246511	7750.394855
438461	DOW	300	1786995300	53457.682780	53485.442356	53446.825497	53462.466069
438640	SP500	300	1786995600	7750.680846	7751.041441	7747.451101	7750.249375
438641	DOW	300	1786995600	53460.981410	53473.214009	53439.984513	53451.731886
438820	SP500	300	1786995900	7750.221689	7753.833761	7749.435570	7752.968064
438821	DOW	300	1786995900	53450.591384	53477.155847	53447.110708	53469.755711
438822	DXY	300	1786995900	99.588931	99.603379	99.567009	99.577887
439003	SP500	300	1786996200	7753.038383	7753.060010	7747.111151	7747.958943
442826	DOW	300	1787002500	53462.048337	53470.862570	53448.298531	53456.662673
439735	SP500	300	1786997400	7744.692538	7746.204913	7744.002827	7746.052643
439736	DOW	300	1786997400	53465.291438	53468.656907	53449.820360	53455.259703
439737	DXY	300	1786997400	99.585053	99.589645	99.561153	99.580360
439369	SP500	300	1786996800	7745.173682	7746.804653	7744.313122	7744.517414
439370	DOW	300	1786996800	53459.362222	53469.641792	53449.952114	53456.068681
439371	DXY	300	1786996800	99.568353	99.592978	99.566541	99.583673
442827	DXY	300	1787002500	99.582385	99.587394	99.565666	99.578504
442282	SP500	300	1787001600	7745.124262	7746.259523	7743.476427	7745.360613
442283	DOW	300	1787001600	53459.105175	53469.046788	53448.945799	53456.574140
442284	DXY	300	1787001600	99.586559	99.593203	99.569245	99.573602
441367	SP500	300	1787000100	7744.497467	7746.141651	7743.494699	7745.267106
441368	DOW	300	1787000100	53455.611213	53474.094615	53449.655363	53464.477499
440818	SP500	300	1786999200	7745.173824	7747.417580	7742.730850	7745.330824
440819	DOW	300	1786999200	53455.100208	53467.379364	53451.521758	53459.367990
440820	DXY	300	1786999200	99.594147	99.605472	99.584648	99.589984
441369	DXY	300	1787000100	99.586085	99.601549	99.582017	99.594903
440275	SP500	300	1786998300	7744.702256	7746.206443	7743.033863	7745.658119
440276	DOW	300	1786998300	53463.830826	53468.530175	53449.879743	53458.989626
440277	DXY	300	1786998300	99.598560	99.605952	99.584052	99.587425
439004	DOW	300	1786996200	53471.014528	53483.698717	53446.347994	53468.352409
439005	DXY	300	1786996200	99.575584	99.586030	99.553433	99.561251
440095	SP500	300	1786998000	7744.476197	7746.276114	7743.501769	7744.706554
440096	DOW	300	1786998000	53460.951737	53470.953068	53449.106559	53462.038271
439552	SP500	300	1786997100	7744.676058	7746.238512	7743.787028	7744.400527
439553	DOW	300	1786997100	53457.718472	53470.297724	53454.402541	53464.070749
439554	DXY	300	1786997100	99.582705	99.603035	99.576413	99.587343
440097	DXY	300	1786998000	99.588572	99.607408	99.579541	99.597572
443739	DXY	300	1787004000	99.581038	99.596872	99.559683	99.589010
440455	SP500	300	1786998600	7745.860444	7746.794437	7743.407920	7745.328897
439186	SP500	300	1786996500	7747.932467	7750.083262	7744.922962	7745.326681
439187	DOW	300	1786996500	53470.271929	53492.121819	53453.944091	53460.106189
439188	DXY	300	1786996500	99.561598	99.580871	99.557136	99.570719
440456	DOW	300	1786998600	53457.391365	53468.278250	53449.585832	53456.831791
440457	DXY	300	1786998600	99.585206	99.595878	99.573743	99.589468
441916	SP500	300	1787001000	7744.518885	7746.557982	7743.432220	7744.779261
439915	SP500	300	1786997700	7745.929407	7746.481876	7743.509450	7744.722714
439916	DOW	300	1786997700	53455.129425	53469.736983	53446.690992	53459.825675
439917	DXY	300	1786997700	99.577889	99.595344	99.570828	99.590324
441917	DOW	300	1787001000	53452.608250	53469.612036	53450.967190	53459.076402
441918	DXY	300	1787001000	99.574738	99.583382	99.547168	99.564079
442099	SP500	300	1787001300	7744.648170	7746.275654	7743.518910	7745.065432
442100	DOW	300	1787001300	53460.524444	53472.128535	53450.406777	53457.730183
442101	DXY	300	1787001300	99.564390	99.592164	99.561127	99.587623
443188	SP500	300	1787003100	7744.501325	7745.958360	7743.476964	7744.545968
443189	DOW	300	1787003100	53457.621864	53466.945573	53447.189998	53457.646581
443190	DXY	300	1787003100	99.577165	99.589319	99.564653	99.580230
440635	SP500	300	1786998900	7745.442930	7745.907561	7743.603285	7744.873261
440636	DOW	300	1786998900	53456.982895	53467.350296	53446.761932	53456.593306
440637	DXY	300	1786998900	99.588274	99.600122	99.574693	99.592141
442645	SP500	300	1787002200	7745.359383	7746.309481	7743.713099	7745.722363
442646	DOW	300	1787002200	53452.221535	53470.182737	53448.272841	53462.007350
442647	DXY	300	1787002200	99.571791	99.584403	99.557592	99.584403
442465	SP500	300	1787001900	7745.057017	7747.077345	7743.411514	7745.468769
442466	DOW	300	1787001900	53458.246469	53468.745983	53444.708514	53454.346283
441550	SP500	300	1787000400	7745.101955	7746.360629	7743.906041	7745.521377
441551	DOW	300	1787000400	53462.601744	53472.172040	53450.425641	53462.190205
441184	SP500	300	1786999800	7745.149252	7746.175747	7743.629710	7744.647939
441185	DOW	300	1786999800	53461.989593	53469.084252	53447.149225	53457.276158
441552	DXY	300	1787000400	99.595247	99.599271	99.580506	99.590148
441001	SP500	300	1786999500	7745.352658	7746.321872	7743.943824	7745.077136
441002	DOW	300	1786999500	53459.905890	53471.893533	53451.111606	53461.370278
441186	DXY	300	1786999800	99.590736	99.598735	99.578844	99.586111
441003	DXY	300	1786999500	99.589042	99.598379	99.566140	99.591551
441733	SP500	300	1787000700	7745.571904	7746.490075	7744.105942	7744.549379
441734	DOW	300	1787000700	53461.515601	53470.902936	53450.057125	53453.503928
441735	DXY	300	1787000700	99.591504	99.598335	99.572776	99.572776
442467	DXY	300	1787001900	99.571630	99.579152	99.555236	99.572780
443738	DOW	300	1787004000	53456.056458	53474.077794	53452.546812	53459.540170
443737	SP500	300	1787004000	7745.067974	7746.485040	7743.921215	7744.992384
442825	SP500	300	1787002500	7746.028049	7746.470552	7743.863178	7745.561691
443005	SP500	300	1787002800	7745.446411	7746.946551	7743.807770	7744.257254
443006	DOW	300	1787002800	53456.570515	53475.292452	53451.204943	53457.526379
443007	DXY	300	1787002800	99.578957	99.592697	99.572667	99.578025
443371	SP500	300	1787003400	7744.668174	7747.282671	7743.417090	7744.741367
443372	DOW	300	1787003400	53458.441833	53474.130059	53450.362482	53463.566700
443373	DXY	300	1787003400	99.581002	99.587896	99.568621	99.581953
443554	SP500	300	1787003700	7744.749639	7746.981044	7743.408163	7744.811847
443555	DOW	300	1787003700	53463.465561	53470.948259	53449.125198	53457.517345
443556	DXY	300	1787003700	99.580965	99.594651	99.571596	99.580348
443920	SP500	300	1787004300	7744.990236	7746.582029	7743.798154	7745.400366
443921	DOW	300	1787004300	53460.189646	53468.230051	53447.080678	53461.870582
443922	DXY	300	1787004300	99.587387	99.596134	99.572920	99.579315
444103	SP500	300	1787004600	7745.520989	7746.000730	7743.580397	7745.196413
444104	DOW	300	1787004600	53460.741835	53466.167898	53451.474070	53456.261543
444105	DXY	300	1787004600	99.578232	99.592412	99.573484	99.581234
444286	SP500	300	1787004900	7744.917968	7746.630651	7743.605983	7744.688130
444287	DOW	300	1787004900	53457.250896	53469.907160	53446.022237	53457.540907
444288	DXY	300	1787004900	99.582797	99.595189	99.572020	99.584094
448290	DXY	300	1787011500	99.542871	99.551152	99.526199	99.543520
448830	DXY	300	1787012400	99.530660	99.558904	99.527047	99.546581
446461	SP500	300	1787008500	7744.927503	7746.090085	7743.418686	7744.157373
446462	DOW	300	1787008500	53461.831512	53466.339347	53447.808699	53462.703228
446463	DXY	300	1787008500	99.578121	99.593015	99.571338	99.574090
447376	SP500	300	1787010000	7744.852463	7745.977517	7743.788632	7744.848700
444469	SP500	300	1787005200	7744.799535	7746.301922	7743.738111	7744.508345
444470	DOW	300	1787005200	53456.300883	53469.567707	53451.147095	53455.983152
444471	DXY	300	1787005200	99.583989	99.593612	99.571889	99.580225
447377	DOW	300	1787010000	53460.280902	53474.604737	53449.927932	53460.283567
446644	SP500	300	1787008800	7744.180981	7746.769415	7743.719363	7744.681259
446645	DOW	300	1787008800	53464.806027	53469.244827	53450.795344	53459.399117
446646	DXY	300	1787008800	99.572288	99.591809	99.564592	99.581952
445015	SP500	300	1787006100	7744.935239	7746.345217	7744.086710	7744.808912
445016	DOW	300	1787006100	53462.435899	53468.156079	53448.252218	53460.077664
445017	DXY	300	1787006100	99.587485	99.591424	99.566843	99.580074
445735	SP500	300	1787007300	7745.013850	7747.320263	7743.103982	7745.138579
445736	DOW	300	1787007300	53462.648660	53467.273386	53448.917187	53458.299197
445737	DXY	300	1787007300	99.581746	99.594159	99.569614	99.580432
445555	SP500	300	1787007000	7744.619475	7746.903841	7743.748393	7745.287605
445556	DOW	300	1787007000	53460.032798	53470.125772	53451.561683	53462.014843
445557	DXY	300	1787007000	99.585363	99.593071	99.565353	99.582197
444652	SP500	300	1787005500	7744.330193	7745.882923	7743.512082	7744.904485
444653	DOW	300	1787005500	53454.972608	53468.393595	53450.610516	53456.884636
444654	DXY	300	1787005500	99.582636	99.590238	99.567656	99.573550
446278	SP500	300	1787008200	7745.417086	7746.159870	7743.456261	7744.779166
446279	DOW	300	1787008200	53459.307998	53466.969264	53452.245119	53460.798584
446280	DXY	300	1787008200	99.582912	99.594351	99.570830	99.577936
445375	SP500	300	1787006700	7745.202367	7746.373979	7743.326751	7744.557805
445376	DOW	300	1787006700	53456.568192	53470.180003	53449.660405	53459.712886
445377	DXY	300	1787006700	99.585212	99.590764	99.571289	99.584206
445915	SP500	300	1787007600	7744.905581	7746.115280	7743.434117	7744.649261
445916	DOW	300	1787007600	53457.310545	53474.095081	53450.869509	53460.889734
445917	DXY	300	1787007600	99.581936	99.589438	99.568020	99.580801
447378	DXY	300	1787010000	99.575402	99.592243	99.567611	99.584175
444835	SP500	300	1787005800	7745.123135	7746.438795	7744.101860	7744.729295
444836	DOW	300	1787005800	53456.900173	53469.757720	53452.764722	53462.765816
444837	DXY	300	1787005800	99.574227	99.596323	99.570818	99.585799
445195	SP500	300	1787006400	7745.028673	7746.436788	7743.324864	7745.303612
445196	DOW	300	1787006400	53459.807646	53469.383531	53450.367387	53456.624996
445197	DXY	300	1787006400	99.582457	99.592197	99.564390	99.587319
447010	SP500	300	1787009400	7744.969658	7746.272400	7743.226590	7744.978657
447011	DOW	300	1787009400	53460.472109	53467.637829	53450.053459	53463.440392
447012	DXY	300	1787009400	99.583770	99.589788	99.570009	99.582587
448648	SP500	300	1787012100	7745.492417	7746.557469	7743.942418	7745.609049
448649	DOW	300	1787012100	53458.560128	53472.670533	53449.921688	53455.510652
448650	DXY	300	1787012100	99.534457	99.538861	99.511731	99.530447
447742	SP500	300	1787010600	7745.311509	7747.061856	7744.010649	7744.546092
446827	SP500	300	1787009100	7744.853859	7746.693514	7743.346730	7744.967197
446095	SP500	300	1787007900	7744.775383	7746.597927	7744.179932	7745.656474
446096	DOW	300	1787007900	53461.525678	53467.580587	53445.814147	53459.786598
446097	DXY	300	1787007900	99.579472	99.589991	99.569895	99.581867
446828	DOW	300	1787009100	53460.439026	53472.631374	53449.406542	53460.457704
446829	DXY	300	1787009100	99.582241	99.589085	99.567170	99.582683
447743	DOW	300	1787010600	53458.865924	53470.536238	53454.336564	53462.435098
447193	SP500	300	1787009700	7744.789780	7746.599991	7743.964971	7745.039047
447194	DOW	300	1787009700	53465.535216	53468.813851	53448.927276	53459.188342
447195	DXY	300	1787009700	99.582054	99.596409	99.568339	99.574187
447559	SP500	300	1787010300	7744.925920	7746.416512	7743.834065	7745.212152
447560	DOW	300	1787010300	53460.014003	53465.126592	53451.244227	53460.415734
447561	DXY	300	1787010300	99.586417	99.589775	99.571905	99.581367
447744	DXY	300	1787010600	99.582665	99.592027	99.571984	99.588998
447925	SP500	300	1787010900	7744.615622	7746.491451	7743.340617	7744.992355
447926	DOW	300	1787010900	53464.428322	53472.262408	53450.306973	53464.035271
447927	DXY	300	1787010900	99.589556	99.593578	99.527784	99.533963
448468	SP500	300	1787011800	7745.675341	7746.352115	7743.705163	7745.746972
448469	DOW	300	1787011800	53455.927265	53468.364447	53445.839625	53458.009442
448470	DXY	300	1787011800	99.542378	99.547647	99.519860	99.534187
448288	SP500	300	1787011500	7744.591021	7746.186330	7743.457792	7745.448121
448108	SP500	300	1787011200	7744.768362	7745.858160	7743.745978	7744.847926
448109	DOW	300	1787011200	53465.317120	53468.521141	53448.845824	53458.827009
448289	DOW	300	1787011500	53457.506138	53469.787871	53450.475849	53456.718414
448110	DXY	300	1787011200	99.532691	99.546813	99.525482	99.542469
449009	DOW	300	1787012700	53461.410804	53467.095725	53448.326033	53461.987230
448828	SP500	300	1787012400	7745.623296	7746.309161	7743.631665	7744.914807
449010	DXY	300	1787012700	99.548832	99.553650	99.532557	99.539050
448829	DOW	300	1787012400	53457.076497	53466.999678	53445.691449	53462.057686
449190	DXY	300	1787013000	99.537342	99.561333	99.537342	99.556538
449370	DXY	300	1787013300	99.557319	99.581185	99.552230	99.568550
449008	SP500	300	1787012700	7745.133141	7746.978375	7744.186674	7744.703667
449188	SP500	300	1787013000	7744.684293	7746.034911	7743.511182	7744.746007
449189	DOW	300	1787013000	53461.118382	53468.099133	53449.116411	53463.799112
449368	SP500	300	1787013300	7744.728772	7746.418735	7744.038046	7744.930182
449369	DOW	300	1787013300	53462.820466	53470.974832	53453.591790	53459.284289
449548	SP500	300	1787013600	7745.155492	7746.418386	7743.933513	7744.804859
449549	DOW	300	1787013600	53460.835320	53472.368140	53445.838157	53456.570743
449550	DXY	300	1787013600	99.569190	99.596521	99.563016	99.581167
449731	SP500	300	1787013900	7744.960585	7746.138387	7743.832681	7744.785278
449732	DOW	300	1787013900	53458.372029	53468.622172	53453.506898	53458.896533
452826	DXY	300	1787019000	99.582640	99.605657	99.569975	99.584760
452275	SP500	300	1787018100	7745.381044	7746.278447	7744.213918	7744.993904
451555	SP500	300	1787016900	7744.693309	7746.223958	7743.496864	7745.238370
451556	DOW	300	1787016900	53461.190676	53469.371057	53451.105067	53461.092579
451557	DXY	300	1787016900	99.557472	99.581470	99.541440	99.556750
450463	SP500	300	1787015100	7744.902310	7746.701390	7743.308498	7744.671281
450464	DOW	300	1787015100	53456.767485	53470.115642	53447.855313	53458.362191
450465	DXY	300	1787015100	99.567016	99.573439	99.544300	99.550533
452276	DOW	300	1787018100	53459.380593	53468.517288	53448.896084	53461.535112
452277	DXY	300	1787018100	99.556344	99.586826	99.550364	99.576254
450097	SP500	300	1787014500	7744.533887	7746.999528	7743.778065	7745.072206
450098	DOW	300	1787014500	53462.222630	53469.993497	53449.353414	53460.692753
450099	DXY	300	1787014500	99.563553	99.583217	99.555575	99.575930
453368	DOW	300	1787019900	53462.883997	53469.466040	53447.232563	53459.674420
453369	DXY	300	1787019900	99.602389	99.611921	99.586324	99.599567
452641	SP500	300	1787018700	7744.552790	7746.064919	7743.725835	7744.715463
452642	DOW	300	1787018700	53463.159352	53469.817183	53452.255031	53460.509739
452643	DXY	300	1787018700	99.568668	99.589398	99.560920	99.581297
451915	SP500	300	1787017500	7744.661708	7746.589039	7743.853137	7745.399110
451916	DOW	300	1787017500	53456.437357	53467.724170	53449.981265	53463.866276
451012	SP500	300	1787016000	7745.491839	7746.615919	7743.836655	7745.143606
451013	DOW	300	1787016000	53459.775712	53469.336027	53451.671420	53462.109312
451014	DXY	300	1787016000	99.543905	99.551049	99.513869	99.526158
451917	DXY	300	1787017500	99.549749	99.562436	99.528801	99.539806
451192	SP500	300	1787016300	7745.174931	7746.280456	7743.740327	7744.489356
450829	SP500	300	1787015700	7745.035480	7746.151467	7743.839527	7745.460127
450830	DOW	300	1787015700	53459.302630	53472.072888	53453.518655	53459.089689
450831	DXY	300	1787015700	99.565229	99.566713	99.531850	99.543252
450280	SP500	300	1787014800	7745.318036	7747.074003	7743.991573	7744.773908
450281	DOW	300	1787014800	53462.204200	53472.084165	53450.831913	53457.951993
450282	DXY	300	1787014800	99.574354	99.577845	99.550933	99.564949
449733	DXY	300	1787013900	99.582298	99.586079	99.555891	99.565108
451193	DOW	300	1787016300	53462.431434	53471.662533	53450.375037	53458.197345
451194	DXY	300	1787016300	99.523915	99.577996	99.522231	99.557151
450646	SP500	300	1787015400	7744.844200	7746.020993	7743.798123	7745.277441
450647	DOW	300	1787015400	53459.375813	53468.646955	53446.938243	53459.956901
450648	DXY	300	1787015400	99.548337	99.571952	99.543532	99.563910
449914	SP500	300	1787014200	7744.930396	7746.169013	7744.001168	7744.633250
449915	DOW	300	1787014200	53459.702400	53465.419007	53452.485188	53461.650272
449916	DXY	300	1787014200	99.562732	99.581274	99.550008	99.565150
454098	DXY	300	1787021100	99.592482	99.610938	99.585481	99.603121
452095	SP500	300	1787017800	7745.138385	7746.000369	7743.789183	7745.181570
451735	SP500	300	1787017200	7745.118476	7746.879181	7743.853618	7744.954182
451736	DOW	300	1787017200	53461.773910	53465.937874	53448.900303	53457.852340
451375	SP500	300	1787016600	7744.420016	7746.590213	7743.675849	7744.871583
451376	DOW	300	1787016600	53456.120636	53467.232829	53448.861235	53460.927710
451377	DXY	300	1787016600	99.555025	99.575632	99.540850	99.556376
451737	DXY	300	1787017200	99.558323	99.560099	99.542738	99.550777
452096	DOW	300	1787017800	53465.048096	53477.492869	53453.582437	53459.646340
452097	DXY	300	1787017800	99.540825	99.566591	99.533374	99.554104
453916	SP500	300	1787020800	7744.914311	7746.156034	7743.723553	7745.359955
453004	SP500	300	1787019300	7744.798503	7746.794347	7743.876037	7745.295670
453005	DOW	300	1787019300	53461.122729	53468.690883	53450.060896	53459.184270
453006	DXY	300	1787019300	99.586515	99.594201	99.573240	99.592681
453917	DOW	300	1787020800	53459.131892	53470.622187	53451.286425	53459.976977
453918	DXY	300	1787020800	99.588097	99.612009	99.581886	99.590545
453733	SP500	300	1787020500	7745.832301	7746.365186	7743.901769	7744.807121
453550	SP500	300	1787020200	7744.746682	7746.190911	7743.955866	7745.644882
453551	DOW	300	1787020200	53458.756779	53470.541535	53451.248782	53461.444723
453184	SP500	300	1787019600	7745.503763	7746.209738	7743.660260	7745.176196
453185	DOW	300	1787019600	53461.281875	53468.330708	53451.478718	53462.081612
453186	DXY	300	1787019600	99.590492	99.610451	99.587056	99.601516
452458	SP500	300	1787018400	7744.760664	7746.272043	7744.080824	7744.690140
452459	DOW	300	1787018400	53462.628217	53468.663068	53445.073966	53463.957076
452460	DXY	300	1787018400	99.576943	99.584604	99.552970	99.568217
453552	DXY	300	1787020200	99.597299	99.612218	99.586168	99.602373
452824	SP500	300	1787019000	7744.415977	7746.164331	7743.708405	7744.942258
452825	DOW	300	1787019000	53461.869527	53468.156714	53446.137161	53460.765002
453734	DOW	300	1787020500	53459.612590	53470.538336	53448.662461	53458.207775
453735	DXY	300	1787020500	99.601070	99.612817	99.588013	99.590019
453367	SP500	300	1787019900	7745.293161	7746.357262	7743.634010	7744.575137
454278	DXY	300	1787021400	99.601185	99.610740	99.579622	99.600507
454461	DXY	300	1787021700	99.600129	99.609126	99.573682	99.577821
454096	SP500	300	1787021100	7745.389457	7746.839742	7743.242445	7745.106486
454097	DOW	300	1787021100	53460.812563	53470.596207	53450.347654	53461.033372
454644	DXY	300	1787022000	99.579385	99.591473	99.568535	99.577468
454276	SP500	300	1787021400	7745.412942	7746.112325	7743.811751	7745.600468
454277	DOW	300	1787021400	53461.229662	53470.511870	53448.844810	53460.627242
454459	SP500	300	1787021700	7745.379870	7746.206398	7743.525500	7744.850376
454460	DOW	300	1787021700	53460.944542	53469.844735	53447.793726	53459.705413
454824	DXY	300	1787022300	99.576318	99.585925	99.555153	99.570117
454642	SP500	300	1787022000	7745.097593	7746.432480	7743.991332	7745.096896
454643	DOW	300	1787022000	53458.472650	53475.770768	53451.123027	53466.277391
454822	SP500	300	1787022300	7744.921039	7746.999703	7743.292548	7744.349203
454823	DOW	300	1787022300	53465.473344	53474.735142	53451.094936	53463.591490
455002	SP500	300	1787022600	7744.126276	7746.440190	7743.528211	7745.419234
455003	DOW	300	1787022600	53461.564377	53470.338572	53450.208760	53461.307672
455004	DXY	300	1787022600	99.569203	99.602482	99.555842	99.583489
455185	SP500	300	1787022900	7745.595431	7746.473197	7743.331159	7744.979444
457187	DOW	300	1787026200	53458.781845	53470.703366	53449.976906	53456.044136
457188	DXY	300	1787026200	99.629085	99.643199	99.613461	99.635944
455551	SP500	300	1787023500	7744.621333	7746.452843	7743.760031	7744.918675
455552	DOW	300	1787023500	53462.139604	53466.669287	53449.485429	53456.250114
455553	DXY	300	1787023500	99.588111	99.608591	99.582726	99.602454
455917	SP500	300	1787024100	7745.204228	7747.288694	7743.800476	7744.909661
455918	DOW	300	1787024100	53460.051935	53465.839807	53450.537636	53459.413303
455919	DXY	300	1787024100	99.609821	99.623162	99.595175	99.601916
457371	DXY	300	1787026500	99.635801	99.657282	99.625273	99.650174
459008	DOW	300	1787029200	53467.179149	53467.822728	53450.354517	53462.347997
459009	DXY	300	1787029200	99.632851	99.646879	99.625118	99.643506
458464	SP500	300	1787028300	7745.332857	7746.422585	7743.681825	7745.114852
458465	DOW	300	1787028300	53460.022717	53470.069849	53451.147897	53458.706698
458466	DXY	300	1787028300	99.664071	99.668415	99.642722	99.656713
457003	SP500	300	1787025900	7745.351646	7746.970326	7743.177362	7744.333767
457004	DOW	300	1787025900	53456.930888	53465.438839	53448.541606	53458.636644
457005	DXY	300	1787025900	99.634695	99.643259	99.611567	99.628082
457552	SP500	300	1787026800	7745.021403	7746.308762	7743.012047	7745.057789
457553	DOW	300	1787026800	53463.363946	53467.867427	53447.212977	53458.765745
455186	DOW	300	1787022900	53461.842282	53468.911260	53450.647788	53457.723524
455187	DXY	300	1787022900	99.582723	99.592438	99.572957	99.581372
457554	DXY	300	1787026800	99.652627	99.667820	99.640573	99.666139
456460	SP500	300	1787025000	7744.827343	7746.882293	7743.178437	7745.266861
456461	DOW	300	1787025000	53459.011609	53467.872139	53452.755669	53459.506189
456462	DXY	300	1787025000	99.624242	99.646636	99.615601	99.626571
455734	SP500	300	1787023800	7744.730493	7746.217575	7743.538088	7745.093077
455735	DOW	300	1787023800	53456.954907	53469.109272	53452.327107	53458.847828
455736	DXY	300	1787023800	99.602491	99.616283	99.588581	99.607606
456280	SP500	300	1787024700	7745.230366	7746.439715	7743.250950	7744.603440
456281	DOW	300	1787024700	53457.907601	53468.476999	53449.342949	53459.617541
456282	DXY	300	1787024700	99.621135	99.636023	99.612042	99.625837
455368	SP500	300	1787023200	7744.825267	7747.070898	7743.813621	7744.608414
455369	DOW	300	1787023200	53459.030638	53468.345449	53452.676208	53461.951087
455370	DXY	300	1787023200	99.581488	99.596178	99.567253	99.586904
456640	SP500	300	1787025300	7745.233306	7746.434300	7743.249845	7744.522806
456641	DOW	300	1787025300	53459.578943	53468.103764	53452.732004	53464.190114
456642	DXY	300	1787025300	99.624996	99.650387	99.617618	99.640142
456100	SP500	300	1787024400	7744.849486	7746.581835	7743.362250	7745.128150
456101	DOW	300	1787024400	53458.854062	53468.218153	53445.571776	53457.589307
456102	DXY	300	1787024400	99.601978	99.625261	99.594452	99.619398
459369	DXY	300	1787029800	99.656540	99.670658	99.643257	99.665410
458098	SP500	300	1787027700	7745.023470	7746.305984	7743.866502	7744.912830
458099	DOW	300	1787027700	53458.528588	53467.726302	53451.701221	53460.635863
458100	DXY	300	1787027700	99.650932	99.662243	99.633793	99.645493
458281	SP500	300	1787028000	7744.670077	7746.744324	7743.730912	7745.259032
458282	DOW	300	1787028000	53462.247707	53470.063537	53450.076165	53458.144538
458283	DXY	300	1787028000	99.646163	99.669348	99.643138	99.665640
456820	SP500	300	1787025600	7744.394066	7746.221670	7743.527770	7745.321055
456821	DOW	300	1787025600	53466.055569	53468.533689	53447.760210	53456.285463
456822	DXY	300	1787025600	99.641993	99.651838	99.630293	99.636306
458827	SP500	300	1787028900	7745.262190	7746.887687	7743.629380	7745.407790
458828	DOW	300	1787028900	53459.097722	53469.072797	53448.484156	53465.811106
458829	DXY	300	1787028900	99.645762	99.659532	99.629441	99.634024
457732	SP500	300	1787027100	7745.300493	7746.323038	7743.667660	7745.384196
457733	DOW	300	1787027100	53457.576529	53468.278402	53450.391973	53463.855719
457734	DXY	300	1787027100	99.664497	99.673094	99.654041	99.666478
457186	SP500	300	1787026200	7744.537562	7746.110202	7743.682169	7745.012722
457369	SP500	300	1787026500	7745.138222	7746.285312	7744.134440	7744.845580
457370	DOW	300	1787026500	53455.701882	53476.927722	53447.268896	53461.795268
457915	SP500	300	1787027400	7745.638318	7746.537918	7744.144150	7745.182572
457916	DOW	300	1787027400	53462.100317	53472.070705	53451.315979	53459.290080
457917	DXY	300	1787027400	99.667270	99.673990	99.642606	99.653158
458647	SP500	300	1787028600	7745.358567	7746.348627	7743.975221	7744.998046
458648	DOW	300	1787028600	53456.702359	53468.451035	53450.428861	53457.515863
458649	DXY	300	1787028600	99.654948	99.663079	99.630926	99.645252
459548	DOW	300	1787030100	53456.844325	53466.880599	53451.472208	53455.408074
459549	DXY	300	1787030100	99.667282	99.679506	99.646309	99.665952
459187	SP500	300	1787029500	7744.636293	7746.313323	7743.369066	7745.246589
459188	DOW	300	1787029500	53462.673235	53467.051792	53451.076571	53462.750629
459189	DXY	300	1787029500	99.641510	99.658608	99.625093	99.656753
459007	SP500	300	1787029200	7745.260752	7746.585841	7743.516242	7744.887163
459728	DOW	300	1787030400	53456.563704	53467.863450	53450.591387	53462.536576
459729	DXY	300	1787030400	99.667994	99.682263	99.654337	99.666803
459367	SP500	300	1787029800	7745.287391	7747.037705	7743.130560	7744.779715
459368	DOW	300	1787029800	53461.042911	53466.312576	53446.493887	53458.408100
459547	SP500	300	1787030100	7744.685796	7746.569888	7743.364341	7745.401338
459912	DXY	300	1787030700	99.667289	99.674764	99.653622	99.661765
459727	SP500	300	1787030400	7745.344159	7746.612645	7744.361269	7745.687848
459911	DOW	300	1787030700	53461.270763	53473.690372	53450.446014	53460.974849
459910	SP500	300	1787030700	7745.933998	7746.550350	7744.090806	7745.084277
460093	SP500	300	1787031000	7744.969625	7746.760603	7743.858508	7744.871889
460094	DOW	300	1787031000	53461.505401	53469.260829	53449.620797	53463.611497
460095	DXY	300	1787031000	99.662148	99.670471	99.648556	99.651804
460276	SP500	300	1787031300	7745.094394	7746.187594	7743.541204	7745.197117
460277	DOW	300	1787031300	53464.654618	53471.183088	53452.361189	53460.964492
460278	DXY	300	1787031300	99.649361	99.661601	99.634350	99.638046
460459	SP500	300	1787031600	7745.357544	7746.707181	7743.275102	7745.117840
460460	DOW	300	1787031600	53462.809661	53469.122600	53447.319220	53455.110459
460461	DXY	300	1787031600	99.637668	99.660495	99.634318	99.646706
464645	DOW	300	1787038500	53463.815014	53471.220378	53452.465583	53458.434167
463546	SP500	300	1787036700	7745.023181	7746.483783	7743.945225	7744.203327
463547	DOW	300	1787036700	53461.715668	53469.516335	53448.085347	53464.511781
463548	DXY	300	1787036700	99.679680	99.684176	99.661000	99.664073
464461	SP500	300	1787038200	7745.037224	7746.549164	7743.272258	7744.723123
464462	DOW	300	1787038200	53459.962727	53469.285613	53450.468748	53462.792216
464463	DXY	300	1787038200	99.674968	99.676805	99.638159	99.651272
464095	SP500	300	1787037600	7744.895072	7746.861901	7743.379530	7745.188559
462826	SP500	300	1787035500	7744.296492	7746.438713	7743.446817	7744.681883
462643	SP500	300	1787035200	7745.528865	7746.289626	7743.944985	7744.490296
460642	SP500	300	1787031900	7745.290529	7746.855222	7744.063513	7745.222100
460643	DOW	300	1787031900	53456.456634	53472.624483	53447.161956	53457.174059
460644	DXY	300	1787031900	99.645899	99.662580	99.639099	99.651530
462644	DOW	300	1787035200	53464.284809	53468.403527	53451.001222	53463.658464
462645	DXY	300	1787035200	99.654549	99.679175	99.641968	99.672443
461185	SP500	300	1787032800	7744.770097	7746.394077	7744.055905	7745.204959
461186	DOW	300	1787032800	53461.522693	53469.014699	53449.218117	53463.047859
461187	DXY	300	1787032800	99.642336	99.651846	99.627783	99.639734
462827	DOW	300	1787035500	53463.389182	53467.733146	53451.773701	53460.376914
462828	DXY	300	1787035500	99.671777	99.697419	99.667757	99.682709
461728	SP500	300	1787033700	7744.728815	7746.619072	7743.515228	7745.453393
461729	DOW	300	1787033700	53456.933810	53466.885393	53453.421411	53456.398567
461730	DXY	300	1787033700	99.683551	99.700495	99.673618	99.677254
460825	SP500	300	1787032200	7744.983086	7746.907564	7743.580066	7745.427948
460826	DOW	300	1787032200	53455.694985	53464.650517	53449.461279	53458.854941
460827	DXY	300	1787032200	99.652026	99.663509	99.642145	99.646301
461911	SP500	300	1787034000	7745.634018	7746.329361	7743.946765	7745.271457
461912	DOW	300	1787034000	53454.798946	53469.555278	53446.167402	53459.584834
461913	DXY	300	1787034000	99.679264	99.687662	99.651709	99.664489
461545	SP500	300	1787033400	7744.556339	7747.045174	7744.091838	7745.032871
461546	DOW	300	1787033400	53456.861868	53474.226928	53447.278418	53457.926875
461547	DXY	300	1787033400	99.641084	99.691668	99.630100	99.684506
463186	SP500	300	1787036100	7744.998531	7746.284062	7743.860422	7745.049155
462460	SP500	300	1787034900	7745.381043	7746.359454	7743.781502	7745.463800
462461	DOW	300	1787034900	53457.946327	53470.687799	53446.171081	53464.907441
462462	DXY	300	1787034900	99.664943	99.681032	99.646731	99.652167
463187	DOW	300	1787036100	53462.955680	53470.048942	53449.866785	53456.211811
463188	DXY	300	1787036100	99.668034	99.685368	99.662861	99.670206
462094	SP500	300	1787034300	7745.423302	7746.197799	7744.060897	7745.115949
461005	SP500	300	1787032500	7745.285716	7746.527417	7743.582782	7744.666150
461006	DOW	300	1787032500	53457.099096	53465.267206	53452.546031	53463.174596
461007	DXY	300	1787032500	99.648764	99.659247	99.630895	99.641567
462095	DOW	300	1787034300	53460.995384	53471.106548	53445.886463	53461.898948
461365	SP500	300	1787033100	7745.218999	7746.369980	7743.522938	7744.840571
461366	DOW	300	1787033100	53461.681138	53467.837072	53448.848078	53456.034353
461367	DXY	300	1787033100	99.637976	99.645799	99.627249	99.640211
462096	DXY	300	1787034300	99.664370	99.690114	99.659722	99.669447
463912	SP500	300	1787037300	7745.088126	7746.866422	7743.880642	7744.875613
463913	DOW	300	1787037300	53456.220841	53469.546383	53450.645270	53456.708075
463366	SP500	300	1787036400	7745.351983	7746.575572	7744.070871	7744.845883
463367	DOW	300	1787036400	53454.078825	53467.767497	53448.732231	53461.079456
463368	DXY	300	1787036400	99.669693	99.701190	99.662858	99.681353
463006	SP500	300	1787035800	7744.983360	7746.497753	7743.706153	7745.224634
463007	DOW	300	1787035800	53461.521381	53468.590116	53452.560793	53461.820882
463008	DXY	300	1787035800	99.684342	99.684342	99.664268	99.667395
463729	SP500	300	1787037000	7744.411564	7746.238741	7744.041806	7745.309704
462277	SP500	300	1787034600	7745.419400	7746.844063	7743.950922	7745.331711
463730	DOW	300	1787037000	53465.086096	53468.662271	53444.661554	53457.558193
463731	DXY	300	1787037000	99.662492	99.667435	99.631977	99.635537
462278	DOW	300	1787034600	53463.586995	53467.250713	53452.339277	53459.844641
462279	DXY	300	1787034600	99.668651	99.686720	99.660678	99.664761
463914	DXY	300	1787037300	99.635487	99.668661	99.629579	99.652768
464096	DOW	300	1787037600	53456.115577	53470.500879	53447.468769	53465.197729
464097	DXY	300	1787037600	99.650641	99.680177	99.645857	99.666985
464646	DXY	300	1787038500	99.651200	99.656873	99.627438	99.648758
465008	DOW	300	1787039100	53462.042303	53467.468179	53450.730909	53460.069761
465009	DXY	300	1787039100	99.651933	99.654086	99.617653	99.623653
464278	SP500	300	1787037900	7744.916458	7746.251219	7743.811251	7744.785746
464279	DOW	300	1787037900	53464.492038	53471.804675	53453.358047	53459.990055
464280	DXY	300	1787037900	99.667790	99.689901	99.659629	99.672624
465187	SP500	300	1787039400	7744.618641	7746.475214	7743.477406	7744.913497
465369	DXY	300	1787039700	99.631933	99.643057	99.611515	99.618111
464827	SP500	300	1787038800	7745.052885	7745.734749	7743.701161	7745.347115
465007	SP500	300	1787039100	7745.633820	7746.102252	7743.978947	7744.464674
465188	DOW	300	1787039400	53461.844660	53470.486676	53448.877274	53460.126729
464644	SP500	300	1787038500	7744.993854	7746.511019	7743.605770	7745.131805
464828	DOW	300	1787038800	53457.512788	53467.710180	53449.897614	53460.209341
464829	DXY	300	1787038800	99.649418	99.657369	99.629569	99.654267
465189	DXY	300	1787039400	99.623210	99.643412	99.615544	99.632283
465549	DXY	300	1787040000	99.619272	99.642859	99.606990	99.639499
465367	SP500	300	1787039700	7744.622624	7747.071413	7743.355862	7744.532929
465368	DOW	300	1787039700	53460.063501	53468.117478	53451.033095	53455.973788
465729	DXY	300	1787040300	99.638106	99.645340	99.622273	99.642440
465547	SP500	300	1787040000	7744.382297	7746.520122	7743.832096	7745.394585
465548	DOW	300	1787040000	53454.106634	53468.318115	53452.040286	53459.485059
465908	DOW	300	1787040600	53456.173998	53469.243389	53450.994604	53461.103469
465727	SP500	300	1787040300	7745.179600	7746.783877	7743.147729	7744.382292
465728	DOW	300	1787040300	53458.567514	53466.416514	53450.654092	53455.874211
465907	SP500	300	1787040600	7744.600965	7747.102364	7743.933719	7745.246847
469194	DXY	300	1787046000	99.618397	99.622977	99.590548	99.603567
470836	SP500	300	1787048700	7744.453586	7746.319843	7743.035694	7745.431502
470837	DOW	300	1787048700	53456.582375	53467.730001	53449.910823	53463.171350
469375	SP500	300	1787046300	7745.346879	7746.369532	7743.824378	7745.099515
469376	DOW	300	1787046300	53464.062534	53469.177664	53451.618197	53460.929723
466633	SP500	300	1787041800	7744.600506	7746.410287	7743.416347	7745.052036
466634	DOW	300	1787041800	53456.570920	53467.558686	53451.117615	53459.188254
466635	DXY	300	1787041800	99.671428	99.682934	99.657972	99.673763
466267	SP500	300	1787041200	7744.773923	7745.954270	7743.589887	7745.258279
466268	DOW	300	1787041200	53461.432128	53467.402454	53447.356054	53460.764354
466269	DXY	300	1787041200	99.661561	99.676689	99.651246	99.663578
469377	DXY	300	1787046300	99.605260	99.622766	99.598525	99.618052
468643	SP500	300	1787045100	7744.280211	7746.492205	7743.408050	7745.029558
468644	DOW	300	1787045100	53457.104201	53470.507055	53449.081651	53459.075030
468645	DXY	300	1787045100	99.641209	99.662528	99.635085	99.643404
467731	SP500	300	1787043600	7744.959758	7746.302187	7744.001388	7745.327906
467732	DOW	300	1787043600	53458.458749	53472.757174	53451.345031	53456.402956
467733	DXY	300	1787043600	99.629596	99.643072	99.620686	99.635153
468460	SP500	300	1787044800	7745.293790	7746.382233	7743.831462	7744.518044
468461	DOW	300	1787044800	53458.340172	53469.806625	53449.196320	53458.220732
468462	DXY	300	1787044800	99.636214	99.652206	99.632828	99.640105
467182	SP500	300	1787042700	7745.346560	7746.064870	7743.795055	7744.926981
467183	DOW	300	1787042700	53458.760177	53468.551142	53447.246362	53458.620400
467184	DXY	300	1787042700	99.655583	99.668524	99.642262	99.648071
466999	SP500	300	1787042400	7745.407159	7745.954983	7743.467198	7745.524922
467000	DOW	300	1787042400	53462.760713	53470.574081	53451.342947	53458.044649
467001	DXY	300	1787042400	99.663131	99.667669	99.646789	99.654530
466450	SP500	300	1787041500	7745.291279	7746.780274	7744.052940	7744.705931
466451	DOW	300	1787041500	53461.719604	53468.795527	53452.772476	53458.475089
466452	DXY	300	1787041500	99.662475	99.677960	99.654928	99.670405
465909	DXY	300	1787040600	99.643633	99.670230	99.641930	99.651875
470653	SP500	300	1787048400	7744.189234	7746.680424	7743.439481	7744.630674
469009	SP500	300	1787045700	7745.579163	7746.262553	7743.657689	7744.924616
467365	SP500	300	1787043000	7744.692680	7746.503783	7743.870806	7744.941107
467366	DOW	300	1787043000	53457.297216	53469.753708	53446.131280	53461.709085
467367	DXY	300	1787043000	99.647540	99.664387	99.631824	99.642319
466087	SP500	300	1787040900	7745.486333	7746.651623	7743.970634	7744.708074
466088	DOW	300	1787040900	53461.228644	53469.834559	53447.963205	53461.588944
466089	DXY	300	1787040900	99.654018	99.678833	99.646955	99.662749
466816	SP500	300	1787042100	7744.873700	7746.125420	7743.613656	7745.112441
466817	DOW	300	1787042100	53457.126454	53467.871334	53451.635490	53460.850217
466818	DXY	300	1787042100	99.672232	99.686518	99.659105	99.665211
469010	DOW	300	1787045700	53461.666293	53468.061036	53449.129328	53461.220595
469011	DXY	300	1787045700	99.629328	99.637138	99.607520	99.619374
468094	SP500	300	1787044200	7745.135455	7746.953259	7743.556386	7745.490734
468095	DOW	300	1787044200	53460.344347	53470.111280	53451.992051	53462.071997
468096	DXY	300	1787044200	99.625397	99.652322	99.620925	99.637651
468826	SP500	300	1787045400	7744.862168	7746.164886	7743.366141	7745.332874
467548	SP500	300	1787043300	7745.068561	7746.124321	7743.850803	7744.844568
467549	DOW	300	1787043300	53462.696142	53468.953556	53451.925525	53456.651748
467550	DXY	300	1787043300	99.641265	99.649527	99.624219	99.631039
468827	DOW	300	1787045400	53457.403926	53469.084125	53451.189329	53461.552449
467914	SP500	300	1787043900	7745.387272	7746.160360	7743.432833	7745.441519
467915	DOW	300	1787043900	53454.695131	53466.375434	53450.229657	53459.521552
467916	DXY	300	1787043900	99.636963	99.638684	99.604531	99.625104
468828	DXY	300	1787045400	99.642932	99.647515	99.620724	99.629232
470654	DOW	300	1787048400	53460.354726	53469.790140	53449.429531	53457.974242
470655	DXY	300	1787048400	99.624698	99.646186	99.617918	99.631686
468277	SP500	300	1787044500	7745.296482	7746.577774	7743.948026	7745.444737
468278	DOW	300	1787044500	53462.199587	53467.396965	53452.639957	53456.362352
468279	DXY	300	1787044500	99.637567	99.643183	99.620349	99.638324
470470	SP500	300	1787048100	7745.119393	7746.134368	7743.632071	7744.474211
470471	DOW	300	1787048100	53460.404727	53465.058026	53449.787030	53458.792762
469738	SP500	300	1787046900	7744.917502	7746.286919	7743.884919	7745.388621
469739	DOW	300	1787046900	53455.653096	53468.340557	53448.509934	53456.387265
469558	SP500	300	1787046600	7745.245850	7746.413245	7743.779115	7744.777782
469559	DOW	300	1787046600	53459.411813	53468.349468	53448.474727	53457.064749
469560	DXY	300	1787046600	99.620278	99.646933	99.600656	99.625024
469192	SP500	300	1787046000	7745.220971	7746.285455	7744.092415	7745.272579
469193	DOW	300	1787046000	53461.151123	53467.102150	53445.853320	53463.252272
469740	DXY	300	1787046900	99.623289	99.631146	99.606491	99.616531
469921	SP500	300	1787047200	7745.652052	7747.309887	7743.447444	7744.606108
469922	DOW	300	1787047200	53455.147245	53472.510385	53450.506701	53461.086306
469923	DXY	300	1787047200	99.616924	99.634318	99.602798	99.609686
470104	SP500	300	1787047500	7744.336249	7746.297702	7743.445195	7745.603203
470472	DXY	300	1787048100	99.622084	99.633328	99.609561	99.625807
470105	DOW	300	1787047500	53461.068830	53472.388570	53452.923831	53463.200407
470106	DXY	300	1787047500	99.607250	99.623203	99.589214	99.600397
470287	SP500	300	1787047800	7745.728894	7746.482917	7743.541390	7744.942301
470288	DOW	300	1787047800	53461.104887	53467.543278	53447.274715	53459.517136
470289	DXY	300	1787047800	99.600731	99.627866	99.596311	99.620079
470838	DXY	300	1787048700	99.633919	99.659167	99.626581	99.636657
471019	SP500	300	1787049000	7745.615885	7746.819141	7744.105686	7745.370944
471020	DOW	300	1787049000	53463.642986	53468.742884	53448.445590	53462.200833
471021	DXY	300	1787049000	99.635511	99.651756	99.632200	99.640277
471202	SP500	300	1787049300	7745.442063	7746.303022	7743.753237	7744.788834
471203	DOW	300	1787049300	53463.237387	53469.576147	53453.688440	53456.404078
471204	DXY	300	1787049300	99.639617	99.662223	99.624603	99.632282
471385	SP500	300	1787049600	7744.754039	7747.326099	7743.849219	7744.812865
476133	DXY	300	1787057400	99.663409	99.674182	99.641008	99.646894
473389	SP500	300	1787052900	7745.499503	7746.636135	7743.718679	7744.709006
473390	DOW	300	1787052900	53463.613130	53469.669964	53450.348430	53459.161913
473391	DXY	300	1787052900	99.655719	99.677139	99.653611	99.672870
471751	SP500	300	1787050200	7745.420980	7746.066876	7744.065858	7744.421588
471752	DOW	300	1787050200	53461.475813	53469.243329	53450.612500	53459.523476
471753	DXY	300	1787050200	99.637005	99.656166	99.629040	99.642826
475765	SP500	300	1787056800	7744.899460	7746.240407	7743.654512	7745.045607
475402	SP500	300	1787056200	7745.447673	7746.683210	7743.861342	7744.980225
474670	SP500	300	1787055000	7744.447202	7746.486962	7743.473616	7744.482859
474671	DOW	300	1787055000	53457.053540	53471.257708	53451.466502	53460.805057
474672	DXY	300	1787055000	99.639536	99.664423	99.611973	99.620785
473755	SP500	300	1787053500	7744.872801	7746.545283	7743.608703	7745.479589
473756	DOW	300	1787053500	53459.706610	53470.978868	53451.520739	53462.993284
473206	SP500	300	1787052600	7745.591008	7746.543738	7743.596305	7745.267857
473207	DOW	300	1787052600	53457.890861	53468.318172	53443.812025	53463.548282
473208	DXY	300	1787052600	99.662985	99.668571	99.650539	99.655543
473757	DXY	300	1787053500	99.671961	99.678440	99.646961	99.662753
472657	SP500	300	1787051700	7745.489278	7747.243668	7743.756883	7745.470885
472658	DOW	300	1787051700	53458.083434	53467.698645	53446.851546	53461.013831
472659	DXY	300	1787051700	99.657501	99.670092	99.642409	99.647618
472474	SP500	300	1787051400	7745.109028	7746.396771	7743.318357	7745.446547
472475	DOW	300	1787051400	53456.529489	53471.673792	53446.387679	53459.664741
472476	DXY	300	1787051400	99.642137	99.669368	99.635874	99.656932
471386	DOW	300	1787049600	53458.328544	53468.789716	53449.891183	53459.437625
471387	DXY	300	1787049600	99.631342	99.648547	99.620280	99.640259
471934	SP500	300	1787050500	7744.670338	7746.663472	7743.804595	7744.977590
471935	DOW	300	1787050500	53459.437005	53474.224506	53449.720661	53460.587997
471936	DXY	300	1787050500	99.640436	99.650955	99.625187	99.633140
472294	SP500	300	1787051100	7744.884751	7745.726245	7743.489726	7745.036182
472295	DOW	300	1787051100	53460.871554	53471.762464	53450.213031	53456.696593
472296	DXY	300	1787051100	99.648387	99.656417	99.635004	99.642748
471568	SP500	300	1787049900	7745.122530	7746.173128	7743.921126	7745.572234
471569	DOW	300	1787049900	53458.994548	53470.150978	53453.442464	53461.902609
471570	DXY	300	1787049900	99.638086	99.648756	99.623211	99.638308
475403	DOW	300	1787056200	53460.273712	53468.283201	53452.197873	53460.211789
475404	DXY	300	1787056200	99.633550	99.637431	99.606866	99.626870
472840	SP500	300	1787052000	7745.711138	7746.623664	7744.015744	7744.947490
472841	DOW	300	1787052000	53459.978496	53469.004028	53449.784714	53458.282944
472842	DXY	300	1787052000	99.646178	99.665801	99.643884	99.660974
474304	SP500	300	1787054400	7745.310617	7747.133335	7744.160924	7744.943918
474305	DOW	300	1787054400	53461.597531	53469.725163	53448.726076	53456.492815
474306	DXY	300	1787054400	99.661195	99.675237	99.649820	99.659667
474487	SP500	300	1787054700	7744.653315	7746.716594	7743.992953	7744.601268
474488	DOW	300	1787054700	53454.457055	53469.527520	53450.172184	53457.002987
474489	DXY	300	1787054700	99.657826	99.679942	99.636097	99.639698
475219	SP500	300	1787055900	7744.796045	7746.970674	7744.181211	7745.400148
472114	SP500	300	1787050800	7744.831814	7746.669878	7743.248087	7744.769515
472115	DOW	300	1787050800	53461.682469	53471.103290	53451.659739	53460.160304
472116	DXY	300	1787050800	99.632935	99.659638	99.628807	99.649736
475220	DOW	300	1787055900	53457.762219	53471.810797	53447.890370	53458.339791
473023	SP500	300	1787052300	7744.805259	7746.574112	7743.835783	7745.816407
473024	DOW	300	1787052300	53459.387018	53466.260237	53454.501465	53458.883098
473025	DXY	300	1787052300	99.661330	99.677661	99.649543	99.661229
475221	DXY	300	1787055900	99.636874	99.647038	99.626094	99.635911
475036	SP500	300	1787055600	7744.248937	7746.804683	7743.413285	7744.731318
473938	SP500	300	1787053800	7745.591925	7746.566724	7744.289744	7745.210588
473939	DOW	300	1787053800	53464.994222	53470.957240	53450.994804	53462.420884
473940	DXY	300	1787053800	99.663883	99.672895	99.647880	99.664120
474121	SP500	300	1787054100	7744.980419	7745.768684	7743.404851	7745.128667
473572	SP500	300	1787053200	7744.915796	7746.522061	7743.694688	7744.797973
473573	DOW	300	1787053200	53459.530683	53468.931300	53452.474492	53459.763573
473574	DXY	300	1787053200	99.670693	99.676776	99.652832	99.672242
474122	DOW	300	1787054100	53464.364200	53466.972960	53450.638362	53459.681769
474123	DXY	300	1787054100	99.665421	99.676493	99.649561	99.663051
475037	DOW	300	1787055600	53463.802293	53470.617485	53454.408063	53456.362945
474853	SP500	300	1787055300	7744.605023	7746.687891	7743.814638	7744.552578
474854	DOW	300	1787055300	53462.440145	53467.587163	53452.736271	53461.812705
474855	DXY	300	1787055300	99.620078	99.648101	99.616642	99.641564
475038	DXY	300	1787055600	99.643300	99.659350	99.632350	99.634574
475766	DOW	300	1787056800	53461.923290	53478.092480	53448.793171	53460.976079
475767	DXY	300	1787056800	99.648083	99.669176	99.633081	99.660163
475582	SP500	300	1787056500	7744.674178	7746.514124	7743.478708	7744.857017
475583	DOW	300	1787056500	53458.832125	53468.846787	53449.071142	53460.740367
475584	DXY	300	1787056500	99.625700	99.660039	99.617993	99.649285
475948	SP500	300	1787057100	7745.106144	7746.775064	7743.872418	7745.363566
475949	DOW	300	1787057100	53460.625847	53470.268885	53450.731430	53456.788144
476132	DOW	300	1787057400	53456.778674	53467.683855	53447.710436	53458.730418
476131	SP500	300	1787057400	7745.092562	7746.258049	7743.771899	7745.021665
475950	DXY	300	1787057100	99.659453	99.678932	99.652826	99.664957
476314	SP500	300	1787057700	7745.226567	7746.342606	7743.372353	7745.174163
476315	DOW	300	1787057700	53459.640360	53470.315493	53453.655017	53456.228023
476316	DXY	300	1787057700	99.649141	99.659153	99.632073	99.633387
476497	SP500	300	1787058000	7745.086309	7746.211990	7744.040579	7745.071673
476498	DOW	300	1787058000	53458.126936	53471.987777	53450.555540	53460.594692
476499	DXY	300	1787058000	99.633484	99.640928	99.617422	99.617422
476680	SP500	300	1787058300	7745.222900	7746.720270	7743.229406	7745.177737
476681	DOW	300	1787058300	53458.650645	53465.919522	53452.007569	53460.183093
476682	DXY	300	1787058300	99.616511	99.639892	99.605991	99.639892
480317	DOW	300	1787064300	53409.006290	53436.218084	53397.938315	53432.549025
480318	DXY	300	1787064300	99.568159	99.601390	99.566457	99.590208
478504	SP500	300	1787061300	7705.419312	7708.215226	7701.109458	7703.447520
478505	DOW	300	1787061300	53428.349133	53441.392309	53397.790000	53399.237792
478506	DXY	300	1787061300	99.600398	99.611431	99.579630	99.593305
480136	SP500	300	1787064000	7711.228853	7711.473947	7703.800000	7703.832732
476863	SP500	300	1787058600	7744.962666	7746.849723	7743.670682	7744.904302
476864	DOW	300	1787058600	53458.955797	53468.779772	53449.979696	53459.712148
476865	DXY	300	1787058600	99.639279	99.639279	99.600615	99.605665
480137	DOW	300	1787064000	53440.268974	53452.908842	53406.220000	53409.830205
479776	SP500	300	1787063400	7707.110533	7712.313777	7706.153029	7710.611969
479777	DOW	300	1787063400	53388.060469	53455.216988	53378.055363	53438.786226
479778	DXY	300	1787063400	99.544880	99.558837	99.523737	99.544035
480138	DXY	300	1787064000	99.561958	99.583232	99.554852	99.570231
477406	SP500	300	1787059500	7744.107238	7746.233238	7743.364193	7744.825864
477407	DOW	300	1787059500	53457.681761	53472.019487	53452.217660	53458.709585
477408	DXY	300	1787059500	99.600230	99.633043	99.597507	99.625695
479956	SP500	300	1787063700	7710.772426	7711.272726	7706.687715	7711.164688
479957	DOW	300	1787063700	53437.652599	53444.122407	53414.802234	53440.079920
479958	DXY	300	1787063700	99.544516	99.569722	99.532587	99.561733
477043	SP500	300	1787058900	7744.881619	7746.417986	7743.847085	7744.800393
477044	DOW	300	1787058900	53461.027292	53466.948930	53452.651678	53463.454967
477045	DXY	300	1787058900	99.605009	99.631684	99.601012	99.612967
478870	SP500	300	1787061900	7709.364478	7711.060850	7703.566949	7705.872797
478871	DOW	300	1787061900	53411.058835	53447.258617	53392.742863	53430.405970
478872	DXY	300	1787061900	99.620128	99.631414	99.590391	99.596527
477955	SP500	300	1787060400	7711.245983	7713.916797	7707.121021	7707.513574
477956	DOW	300	1787060400	53329.209416	53391.717661	53284.360473	53384.660603
477957	DXY	300	1787060400	99.640659	99.662274	99.592833	99.596826
478138	SP500	300	1787060700	7707.687061	7709.872514	7703.202421	7703.941149
478139	DOW	300	1787060700	53385.630390	53465.766474	53365.998169	53421.198709
478140	DXY	300	1787060700	99.596382	99.611574	99.554615	99.562883
477772	SP500	300	1787060100	7705.164371	7711.087432	7703.357253	7711.087432
477773	DOW	300	1787060100	53325.671138	53344.447615	53265.493919	53331.022439
477774	DXY	300	1787060100	99.624444	99.650377	99.620580	99.638913
479053	SP500	300	1787062200	7705.770587	7706.555717	7695.191323	7700.686789
479054	DOW	300	1787062200	53430.702914	53440.560156	53376.544741	53422.163486
477223	SP500	300	1787059200	7745.001472	7747.052496	7743.408003	7744.288246
477224	DOW	300	1787059200	53463.954914	53466.188955	53448.417626	53456.556228
477225	DXY	300	1787059200	99.615021	99.627116	99.599115	99.599115
479055	DXY	300	1787062200	99.595650	99.601358	99.573088	99.582993
478687	SP500	300	1787061600	7703.524748	7711.981306	7701.160000	7709.291547
478688	DOW	300	1787061600	53399.989711	53439.766603	53397.924117	53413.119963
478689	DXY	300	1787061600	99.591610	99.626018	99.581521	99.617922
478321	SP500	300	1787061000	7703.810323	7707.654084	7701.496404	7705.233280
478322	DOW	300	1787061000	53420.148254	53439.522471	53381.033603	53427.211595
477589	SP500	300	1787059800	7744.693030	7744.777070	7698.811999	7705.249633
477590	DOW	300	1787059800	53460.209046	53460.209046	53254.230647	53327.182123
477591	DXY	300	1787059800	99.628138	99.641292	99.616194	99.626012
478323	DXY	300	1787061000	99.563675	99.604515	99.561496	99.602031
479416	SP500	300	1787062800	7706.071954	7709.030000	7700.854623	7707.372529
479417	DOW	300	1787062800	53436.179048	53446.037963	53384.800198	53422.709176
479418	DXY	300	1787062800	99.558616	99.579314	99.545470	99.569784
479596	SP500	300	1787063100	7707.671843	7711.414415	7705.720544	7706.924243
479597	DOW	300	1787063100	53422.361400	53430.381088	53386.365806	53388.318210
479598	DXY	300	1787063100	99.571334	99.584910	99.528099	99.546823
479236	SP500	300	1787062500	7700.775307	7707.707826	7699.665870	7706.132341
479237	DOW	300	1787062500	53420.373559	53459.206272	53411.892409	53436.818871
479238	DXY	300	1787062500	99.581284	99.591351	99.556153	99.558502
481773	DXY	300	1787066700	99.626759	99.643664	99.608977	99.624796
481405	SP500	300	1787066100	7696.069350	7699.177149	7694.845509	7695.278549
481222	SP500	300	1787065800	7698.167199	7699.850577	7695.394436	7696.271590
481223	DOW	300	1787065800	53404.327032	53418.589352	53392.836991	53397.864546
480856	SP500	300	1787065200	7699.331342	7702.947389	7694.562693	7701.201854
480496	SP500	300	1787064600	7703.514950	7707.836906	7698.327460	7699.700927
480497	DOW	300	1787064600	53430.787909	53484.367613	53397.525019	53420.238653
480498	DXY	300	1787064600	99.591675	99.599733	99.554757	99.565851
480857	DOW	300	1787065200	53423.628508	53447.664473	53394.477228	53442.838846
480676	SP500	300	1787064900	7699.722689	7700.318515	7696.353788	7699.036711
480677	DOW	300	1787064900	53418.634097	53432.238459	53399.854633	53425.072476
480678	DXY	300	1787064900	99.564098	99.575216	99.551652	99.560510
480858	DXY	300	1787065200	99.561829	99.574904	99.530091	99.571903
480316	SP500	300	1787064300	7703.679445	7704.988625	7701.532081	7703.709835
481039	SP500	300	1787065500	7701.016010	7703.418313	7697.022135	7697.898544
481040	DOW	300	1787065500	53443.307027	53454.258738	53403.393017	53403.393017
481041	DXY	300	1787065500	99.570601	99.607807	99.558465	99.598889
481406	DOW	300	1787066100	53395.910573	53395.910573	53355.303035	53357.798556
481407	DXY	300	1787066100	99.563621	99.611000	99.548726	99.610045
481588	SP500	300	1787066400	7695.343894	7698.035962	7693.455541	7697.118745
481224	DXY	300	1787065800	99.596851	99.617363	99.561000	99.563031
481589	DOW	300	1787066400	53359.502612	53361.574779	53319.037020	53332.098383
481590	DXY	300	1787066400	99.611851	99.633757	99.596390	99.628114
481771	SP500	300	1787066700	7696.974850	7700.765877	7694.420369	7698.491868
481772	DOW	300	1787066700	53333.992689	53354.094199	53307.619657	53340.340106
481951	SP500	300	1787067000	7698.386016	7702.139990	7697.487061	7699.275538
481952	DOW	300	1787067000	53339.161578	53358.933094	53327.255460	53349.751257
481953	DXY	300	1787067000	99.624132	99.635690	99.597409	99.628297
482134	SP500	300	1787067300	7699.040518	7699.450347	7694.878088	7698.345914
482135	DOW	300	1787067300	53350.920577	53370.024095	53322.060176	53367.802308
486139	SP500	300	1787073900	7703.216122	7703.557304	7700.241438	7702.982106
484513	SP500	300	1787071200	7705.455990	7706.600177	7701.677460	7704.292931
484514	DOW	300	1787071200	53388.161179	53388.963012	53372.416696	53385.419669
484515	DXY	300	1787071200	99.605612	99.629471	99.601212	99.621554
486140	DOW	300	1787073900	53375.146577	53382.733612	53356.151824	53367.450482
486141	DXY	300	1787073900	99.647253	99.660294	99.637790	99.646440
485959	SP500	300	1787073600	7702.717556	7705.412205	7701.636760	7702.937338
485960	DOW	300	1787073600	53377.875266	53397.610688	53374.743942	53376.492837
485961	DXY	300	1787073600	99.639709	99.658538	99.638314	99.645147
482866	SP500	300	1787068500	7705.177009	7706.022577	7700.218739	7702.358375
482867	DOW	300	1787068500	53360.313134	53361.728765	53331.580077	53349.320759
482868	DXY	300	1787068500	99.623929	99.630737	99.597283	99.604032
482500	SP500	300	1787067900	7701.287971	7706.269278	7700.443009	7704.219468
482501	DOW	300	1787067900	53364.356136	53386.133118	53357.384963	53357.384963
482502	DXY	300	1787067900	99.626528	99.636979	99.603293	99.619514
485779	SP500	300	1787073300	7705.788851	7706.834533	7701.842972	7702.976452
485780	DOW	300	1787073300	53384.653640	53396.997732	53367.776188	53378.500430
483964	SP500	300	1787070300	7705.689165	7707.376111	7701.231149	7702.596582
483965	DOW	300	1787070300	53407.490256	53417.359844	53368.373977	53384.316105
483966	DXY	300	1787070300	99.594455	99.602363	99.571941	99.587958
485781	DXY	300	1787073300	99.634871	99.658507	99.626362	99.640842
485239	SP500	300	1787072400	7707.693344	7708.003070	7702.515937	7706.643685
485240	DOW	300	1787072400	53379.783057	53385.678891	53354.871997	53374.919770
484879	SP500	300	1787071800	7707.890267	7709.821446	7706.314947	7708.356622
484880	DOW	300	1787071800	53397.489463	53402.253705	53376.468937	53389.306368
484881	DXY	300	1787071800	99.613658	99.626897	99.592974	99.601515
485241	DXY	300	1787072400	99.603716	99.619889	99.596741	99.604458
483415	SP500	300	1787069400	7704.135278	7708.387083	7703.445953	7705.706180
483416	DOW	300	1787069400	53364.796403	53385.640000	53363.224139	53376.795982
483417	DXY	300	1787069400	99.616702	99.630326	99.589844	99.609674
483232	SP500	300	1787069100	7705.965121	7707.301196	7702.920003	7704.163483
483233	DOW	300	1787069100	53378.095656	53380.910000	53359.281421	53366.192927
483234	DXY	300	1787069100	99.610786	99.630496	99.596453	99.617248
482683	SP500	300	1787068200	7704.280895	7706.996247	7700.585301	7705.180613
482684	DOW	300	1787068200	53358.854534	53373.015022	53339.365936	53361.964607
482685	DXY	300	1787068200	99.619008	99.639831	99.608223	99.623876
482136	DXY	300	1787067300	99.626360	99.653200	99.615017	99.634190
484696	SP500	300	1787071500	7704.155519	7708.875558	7701.860750	7708.140260
484697	DOW	300	1787071500	53386.056789	53405.025335	53371.088881	53397.712360
483598	SP500	300	1787069700	7705.422630	7707.436150	7702.506397	7703.026523
483599	DOW	300	1787069700	53376.060142	53392.172544	53361.537568	53386.030236
483600	DXY	300	1787069700	99.612069	99.615131	99.587185	99.593104
484698	DXY	300	1787071500	99.623384	99.634451	99.604403	99.615167
482317	SP500	300	1787067600	7698.200558	7702.703854	7697.122569	7701.035422
482318	DOW	300	1787067600	53368.520191	53395.552922	53349.524620	53365.275202
482319	DXY	300	1787067600	99.636637	99.642403	99.620199	99.625076
483049	SP500	300	1787068800	7702.161541	7706.963067	7701.873763	7706.140299
483050	DOW	300	1787068800	53349.358393	53384.051476	53347.726186	53378.050042
483051	DXY	300	1787068800	99.602703	99.621299	99.590411	99.612997
484330	SP500	300	1787070900	7703.154353	7705.972217	7701.162842	7705.645458
484331	DOW	300	1787070900	53371.240993	53393.098941	53359.204215	53389.764253
484332	DXY	300	1787070900	99.572917	99.613997	99.570405	99.607674
483781	SP500	300	1787070000	7703.181740	7709.298692	7702.256598	7705.894634
483782	DOW	300	1787070000	53386.094824	53421.989967	53383.777340	53408.918641
483783	DXY	300	1787070000	99.593292	99.601607	99.577070	99.593533
485059	SP500	300	1787072100	7708.509252	7710.031395	7705.597747	7707.433037
484147	SP500	300	1787070600	7702.487262	7704.812828	7701.246023	7703.064754
484148	DOW	300	1787070600	53383.531533	53386.975174	53361.362306	53371.858170
484149	DXY	300	1787070600	99.585669	99.588307	99.568544	99.574164
485060	DOW	300	1787072100	53388.494688	53402.579957	53371.816445	53379.805862
485061	DXY	300	1787072100	99.599261	99.610606	99.582584	99.602820
486319	SP500	300	1787074200	7703.239067	7704.645298	7701.073176	7702.149336
485419	SP500	300	1787072700	7706.940279	7707.516492	7703.854607	7707.117905
485420	DOW	300	1787072700	53375.480248	53400.775693	53368.312209	53397.913660
485421	DXY	300	1787072700	99.606558	99.627934	99.600049	99.618367
486320	DOW	300	1787074200	53365.376931	53387.464168	53349.560465	53383.874971
486321	DXY	300	1787074200	99.648570	99.651600	99.627867	99.638433
485599	SP500	300	1787073000	7707.114680	7708.058819	7704.530658	7705.728900
485600	DOW	300	1787073000	53398.245760	53409.750254	53371.981288	53382.598657
485601	DXY	300	1787073000	99.618161	99.639811	99.609249	99.633177
486502	SP500	300	1787074500	7702.428573	7704.410543	7699.685731	7702.558990
486503	DOW	300	1787074500	53383.879501	53386.795306	53352.153328	53380.335699
486504	DXY	300	1787074500	99.637517	99.663577	99.633776	99.646526
486685	SP500	300	1787074800	7702.295334	7703.784281	7699.377937	7700.681072
486686	DOW	300	1787074800	53378.350967	53384.481025	53349.618045	53365.656519
486687	DXY	300	1787074800	99.647278	99.665890	99.639448	99.655466
487051	SP500	300	1787075400	7700.111686	7702.730418	7699.068622	7700.673003
487052	DOW	300	1787075400	53361.608547	53378.211339	53355.070359	53367.544068
486868	SP500	300	1787075100	7700.383623	7701.943356	7699.298820	7700.408545
486869	DOW	300	1787075100	53366.248215	53374.543293	53351.273413	53363.394911
486870	DXY	300	1787075100	99.657021	99.673942	99.641068	99.658370
487053	DXY	300	1787075400	99.656070	99.667944	99.638925	99.646683
487234	SP500	300	1787075700	7700.632477	7701.432974	7695.761615	7695.761615
487235	DOW	300	1787075700	53366.241356	53377.911035	53336.440000	53339.144885
487236	DXY	300	1787075700	99.644890	99.662929	99.637910	99.653263
487417	SP500	300	1787076000	7695.473357	7697.516878	7694.660241	7696.462438
487418	DOW	300	1787076000	53341.122230	53354.414591	53324.713991	53334.092461
487419	DXY	300	1787076000	99.652276	99.662599	99.639917	99.651356
487600	SP500	300	1787076300	7696.647402	7697.907440	7693.514808	7694.252764
490158	DXY	300	1787080500	99.662044	99.674274	99.654201	99.663436
488332	SP500	300	1787077500	7702.632408	7704.781397	7700.331018	7703.892017
487966	SP500	300	1787076900	7699.782821	7703.804979	7699.094845	7703.479694
487967	DOW	300	1787076900	53389.066987	53396.880000	53374.726470	53392.349538
487968	DXY	300	1787076900	99.664142	99.668484	99.644423	99.653091
488333	DOW	300	1787077500	53390.078368	53399.611672	53367.665803	53395.161594
488334	DXY	300	1787077500	99.647068	99.655082	99.630044	99.642572
489790	SP500	300	1787079900	7696.484074	7699.384244	7695.637657	7698.136796
489607	SP500	300	1787079600	7697.542737	7699.006511	7696.267221	7696.774676
489608	DOW	300	1787079600	53379.275754	53393.360047	53364.471842	53374.546431
489609	DXY	300	1787079600	99.670104	99.677963	99.653646	99.663077
489791	DOW	300	1787079900	53375.965088	53391.255018	53361.443627	53375.282205
489792	DXY	300	1787079900	99.662736	99.674347	99.652409	99.655717
490341	DXY	300	1787080800	99.663251	99.671520	99.627851	99.641659
489424	SP500	300	1787079300	7698.401283	7699.474804	7696.276267	7697.605733
489425	DOW	300	1787079300	53387.455606	53390.759433	53366.318498	53380.382975
489426	DXY	300	1787079300	99.668215	99.677092	99.656485	99.670539
487601	DOW	300	1787076300	53332.368364	53351.794527	53321.417003	53335.869397
487602	DXY	300	1787076300	99.648884	99.664594	99.641067	99.648148
488878	SP500	300	1787078400	7703.559048	7704.019686	7700.568473	7701.249480
488879	DOW	300	1787078400	53407.297545	53420.580116	53393.396271	53404.462757
488880	DXY	300	1787078400	99.646332	99.660173	99.635820	99.651739
488149	SP500	300	1787077200	7703.741615	7704.911477	7700.795194	7702.355350
488150	DOW	300	1787077200	53393.917994	53403.603291	53378.368858	53391.981066
488151	DXY	300	1787077200	99.652880	99.658815	99.634440	99.645361
488698	SP500	300	1787078100	7702.055316	7704.535804	7701.409177	7703.749560
488699	DOW	300	1787078100	53393.851791	53419.639146	53388.035529	53405.909099
488700	DXY	300	1787078100	99.640602	99.655139	99.627467	99.644751
487783	SP500	300	1787076600	7694.486494	7701.827298	7693.789836	7700.088836
487784	DOW	300	1787076600	53337.470664	53399.079729	53336.269400	53388.283788
487785	DXY	300	1787076600	99.649824	99.672278	99.644973	99.664145
490887	DXY	300	1787081700	99.639207	99.661403	99.631449	99.645768
491787	DXY	300	1787083200	99.641389	99.655666	99.626139	99.646489
489058	SP500	300	1787078700	7701.311764	7702.023312	7699.082294	7700.699574
489059	DOW	300	1787078700	53403.555380	53417.971540	53399.890091	53403.390529
489060	DXY	300	1787078700	99.650471	99.661607	99.641652	99.657484
488515	SP500	300	1787077800	7703.709758	7705.350361	7701.213847	7702.046956
488516	DOW	300	1787077800	53394.084643	53403.869756	53380.318070	53393.378509
488517	DXY	300	1787077800	99.644346	99.652876	99.622587	99.640885
489973	SP500	300	1787080200	7698.098589	7700.729303	7694.856094	7696.257646
489974	DOW	300	1787080200	53374.858242	53395.610284	53351.877895	53364.881478
489975	DXY	300	1787080200	99.654963	99.669207	99.646345	99.664215
491245	SP500	300	1787082300	7698.923440	7699.809150	7696.150241	7698.741020
491246	DOW	300	1787082300	53400.193545	53407.194171	53378.676345	53398.278393
491247	DXY	300	1787082300	99.637143	99.643021	99.617131	99.628167
490705	SP500	300	1787081400	7700.255350	7702.580755	7697.411488	7698.989979
490706	DOW	300	1787081400	53385.960540	53411.785462	53383.895180	53394.778917
490707	DXY	300	1787081400	99.641633	99.659035	99.628820	99.640706
490522	SP500	300	1787081100	7700.847093	7702.156724	7699.411681	7700.420018
490523	DOW	300	1787081100	53415.518449	53418.108015	53386.957288	53386.957288
489241	SP500	300	1787079000	7700.452115	7700.819162	7697.672325	7698.159074
489242	DOW	300	1787079000	53401.618335	53412.433546	53380.559014	53387.147238
489243	DXY	300	1787079000	99.658532	99.675538	99.655035	99.668798
490524	DXY	300	1787081100	99.639192	99.662964	99.630092	99.642999
491065	SP500	300	1787082000	7699.321044	7700.396731	7697.032534	7698.976314
491066	DOW	300	1787082000	53401.908508	53410.546810	53388.274650	53399.082513
491067	DXY	300	1787082000	99.645698	99.661581	99.628441	99.634792
490156	SP500	300	1787080500	7696.392323	7698.602262	7695.627497	7698.602262
490157	DOW	300	1787080500	53365.046530	53406.233794	53359.937549	53394.491826
490339	SP500	300	1787080800	7698.349896	7701.250000	7696.660197	7701.087783
490340	DOW	300	1787080800	53396.325831	53417.071262	53386.060253	53414.702191
492336	DXY	300	1787084100	99.675856	99.690661	99.669273	99.682954
491605	SP500	300	1787082900	7693.694166	7696.818407	7690.729561	7691.542701
491606	DOW	300	1787082900	53379.721419	53385.067756	53331.769183	53331.769183
491607	DXY	300	1787082900	99.623870	99.649769	99.619564	99.642760
490885	SP500	300	1787081700	7698.945428	7700.521377	7697.886655	7699.621683
490886	DOW	300	1787081700	53395.284878	53409.362423	53388.110013	53401.185322
491425	SP500	300	1787082600	7698.608445	7699.046238	7693.445747	7693.710159
491426	DOW	300	1787082600	53397.667530	53409.089475	53380.851325	53380.851325
491427	DXY	300	1787082600	99.626815	99.639766	99.610121	99.625375
491968	SP500	300	1787083500	7691.643583	7693.754204	7690.135975	7691.816172
491969	DOW	300	1787083500	53347.645942	53353.016664	53331.236838	53343.451284
491970	DXY	300	1787083500	99.644603	99.669270	99.641747	99.664807
491785	SP500	300	1787083200	7691.776577	7693.321592	7690.192341	7691.385831
491786	DOW	300	1787083200	53329.917936	53351.042672	53323.058340	53346.920654
492335	DOW	300	1787084100	53343.129890	53353.632265	53335.370445	53347.512662
492334	SP500	300	1787084100	7691.498440	7693.415172	7689.732823	7691.798460
492151	SP500	300	1787083800	7692.088841	7692.810464	7690.773784	7691.644623
492152	DOW	300	1787083800	53342.632793	53354.865142	53333.341256	53343.192506
492153	DXY	300	1787083800	99.663876	99.681806	99.653805	99.675251
492517	SP500	300	1787084400	7691.948446	7693.145763	7690.582308	7691.981353
492518	DOW	300	1787084400	53349.516082	53353.546129	53338.025003	53340.215941
492519	DXY	300	1787084400	99.681428	99.693581	99.665258	99.678358
492700	SP500	300	1787084700	7691.704337	7692.903851	7688.866266	7692.026019
492701	DOW	300	1787084700	53339.087082	53354.962529	53334.349804	53345.055935
492702	DXY	300	1787084700	99.679484	99.689225	99.663608	99.675900
492883	SP500	300	1787085000	7691.868837	7693.684557	7690.719940	7691.317067
492884	DOW	300	1787085000	53343.535056	53351.869156	53333.293793	53341.980253
492885	DXY	300	1787085000	99.675634	99.692439	99.663705	99.675396
494708	DOW	300	1787088000	53347.658845	53353.604257	53334.251366	53340.912199
494709	DXY	300	1787088000	99.653987	99.662796	99.640861	99.645527
497245	SP500	300	1787092200	7691.349280	7692.708516	7690.295855	7692.177185
496525	SP500	300	1787091000	7691.498724	7693.247937	7691.002038	7692.173465
496526	DOW	300	1787091000	53344.745456	53350.122606	53333.547929	53343.446853
496527	DXY	300	1787091000	99.647774	99.666149	99.630722	99.643566
496345	SP500	300	1787090700	7691.578073	7692.936055	7689.807778	7691.738930
496346	DOW	300	1787090700	53347.918141	53357.970582	53338.134715	53346.137226
495982	SP500	300	1787090100	7691.585886	7693.397723	7689.550411	7691.826179
493066	SP500	300	1787085300	7691.243138	7692.829513	7690.518893	7691.673458
493067	DOW	300	1787085300	53342.521709	53352.407282	53334.838684	53343.772677
493068	DXY	300	1787085300	99.673318	99.686028	99.666666	99.677774
495983	DOW	300	1787090100	53345.848461	53352.054230	53336.723136	53344.667331
495984	DXY	300	1787090100	99.648292	99.662885	99.640120	99.649321
495067	SP500	300	1787088600	7691.829881	7693.820719	7690.288147	7691.934040
495068	DOW	300	1787088600	53341.496294	53353.286517	53333.899927	53345.632597
495069	DXY	300	1787088600	99.643026	99.647585	99.626403	99.632107
493612	SP500	300	1787086200	7691.834986	7693.304110	7689.704265	7691.507961
493613	DOW	300	1787086200	53343.126426	53352.496971	53331.619943	53344.723827
493614	DXY	300	1787086200	99.673016	99.682727	99.662613	99.674731
495250	SP500	300	1787088900	7691.747461	7692.909551	7689.890252	7691.743669
495251	DOW	300	1787088900	53345.737373	53352.286255	53331.501781	53346.359452
493249	SP500	300	1787085600	7691.905949	7693.340410	7690.158137	7691.875011
493250	DOW	300	1787085600	53344.389778	53349.902525	53335.991394	53345.283124
493251	DXY	300	1787085600	99.679676	99.683096	99.660787	99.672786
495252	DXY	300	1787088900	99.631026	99.647596	99.627741	99.636600
494887	SP500	300	1787088300	7691.922637	7692.879981	7689.713981	7691.822860
494888	DOW	300	1787088300	53341.088636	53351.395799	53334.151568	53342.078142
494889	DXY	300	1787088300	99.644857	99.651528	99.632420	99.641283
494161	SP500	300	1787087100	7691.986856	7693.076291	7690.487632	7691.772646
494162	DOW	300	1787087100	53344.645072	53353.851618	53330.260447	53346.688379
494163	DXY	300	1787087100	99.661535	99.670065	99.639795	99.650456
494344	SP500	300	1787087400	7691.928602	7693.048249	7690.562976	7691.669512
494345	DOW	300	1787087400	53348.135038	53352.572084	53335.485503	53342.917987
494346	DXY	300	1787087400	99.648924	99.663170	99.628913	99.648368
493978	SP500	300	1787086800	7691.414231	7693.711021	7690.165888	7692.147520
493979	DOW	300	1787086800	53341.991108	53355.294661	53335.773689	53343.484295
493980	DXY	300	1787086800	99.675579	99.685884	99.653554	99.663997
493429	SP500	300	1787085900	7691.751839	7693.641480	7690.045343	7691.703144
493430	DOW	300	1787085900	53344.823302	53352.145020	53336.989718	53342.918411
493431	DXY	300	1787085900	99.673422	99.686449	99.653742	99.674073
496347	DXY	300	1787090700	99.656406	99.659617	99.641357	99.647304
495616	SP500	300	1787089500	7691.550233	7693.020514	7689.992095	7691.779689
494527	SP500	300	1787087700	7691.708064	7693.236594	7690.134100	7691.320954
494528	DOW	300	1787087700	53343.837200	53353.857997	53333.655264	53345.705833
494529	DXY	300	1787087700	99.648839	99.665500	99.638372	99.652946
493795	SP500	300	1787086500	7691.635421	7693.203689	7690.457616	7691.538169
493796	DOW	300	1787086500	53346.212169	53354.595851	53332.698725	53343.651042
493797	DXY	300	1787086500	99.674444	99.684908	99.663987	99.675326
495617	DOW	300	1787089500	53346.846232	53354.297817	53335.390929	53341.887669
495618	DXY	300	1787089500	99.631692	99.643173	99.619847	99.637353
496165	SP500	300	1787090400	7691.820736	7693.088087	7689.818201	7691.716380
496166	DOW	300	1787090400	53345.288286	53348.939591	53332.979337	53346.658706
496167	DXY	300	1787090400	99.649348	99.667922	99.646221	99.655965
495433	SP500	300	1787089200	7692.031628	7692.715496	7690.642754	7691.735549
495434	DOW	300	1787089200	53347.929000	53350.859144	53337.110203	53345.493936
495435	DXY	300	1787089200	99.636636	99.645795	99.626552	99.633915
495799	SP500	300	1787089800	7691.646846	7692.858217	7690.170744	7691.763939
495800	DOW	300	1787089800	53341.010667	53352.918473	53333.469867	53344.788064
494707	SP500	300	1787088000	7691.098723	7693.160264	7690.231740	7691.855000
495801	DXY	300	1787089800	99.639209	99.656145	99.623574	99.650656
497246	DOW	300	1787092200	53346.590623	53352.181695	53336.726473	53342.305646
497247	DXY	300	1787092200	99.647232	99.655270	99.634536	99.644135
497065	SP500	300	1787091900	7692.055916	7693.293428	7690.175378	7691.270717
497066	DOW	300	1787091900	53339.877268	53350.269959	53333.259161	53345.022719
497067	DXY	300	1787091900	99.642883	99.652743	99.633309	99.647556
496705	SP500	300	1787091300	7692.122878	7693.306495	7689.923942	7691.822081
496706	DOW	300	1787091300	53342.811396	53353.604122	53332.864499	53343.993339
496707	DXY	300	1787091300	99.643435	99.659566	99.639753	99.646199
496885	SP500	300	1787091600	7691.834475	7693.578828	7690.542628	7692.038746
496886	DOW	300	1787091600	53345.317723	53353.021227	53333.735766	53341.242391
496887	DXY	300	1787091600	99.645362	99.655501	99.635831	99.644256
497427	DXY	300	1787092500	99.644284	99.653098	99.634350	99.642966
497610	DXY	300	1787092800	99.640750	99.654510	99.628507	99.645209
498341	DOW	300	1787094000	53343.814070	53352.313376	53333.708311	53343.087827
497608	SP500	300	1787092800	7691.708422	7692.893257	7690.490217	7691.983561
497609	DOW	300	1787092800	53343.652383	53350.882498	53336.013769	53343.249841
497425	SP500	300	1787092500	7692.478564	7693.449858	7690.103715	7691.878419
497426	DOW	300	1787092500	53340.730458	53357.349138	53332.627876	53343.275242
497791	SP500	300	1787093100	7692.245961	7692.473938	7689.503031	7691.717792
497792	DOW	300	1787093100	53343.506759	53350.004813	53332.839713	53342.544503
497793	DXY	300	1787093100	99.645573	99.652012	99.636526	99.644865
497974	SP500	300	1787093400	7691.888649	7693.057384	7690.148463	7692.175363
497975	DOW	300	1787093400	53343.267035	53358.271980	53333.942173	53342.103219
497976	DXY	300	1787093400	99.645240	99.654940	99.636463	99.642026
498157	SP500	300	1787093700	7692.464996	7693.276665	7690.367704	7691.664638
498158	DOW	300	1787093700	53341.858070	53356.822745	53334.847551	53343.243179
498159	DXY	300	1787093700	99.643169	99.655668	99.632403	99.642229
498340	SP500	300	1787094000	7691.771534	7693.197964	7690.705687	7691.317739
503263	SP500	300	1787102100	7691.891613	7693.257497	7690.083559	7691.687102
503264	DOW	300	1787102100	53343.286764	53350.860567	53335.450345	53340.727661
499060	SP500	300	1787095200	7691.445190	7692.884108	7689.920738	7691.540802
499061	DOW	300	1787095200	53342.908644	53357.227489	53331.559443	53342.405532
499062	DXY	300	1787095200	99.646631	99.655840	99.625726	99.644958
503080	SP500	300	1787101800	7692.325712	7692.871059	7690.457031	7692.131196
503081	DOW	300	1787101800	53338.956952	53351.885102	53333.780784	53343.216514
503082	DXY	300	1787101800	99.651892	99.676444	99.649826	99.654292
498700	SP500	300	1787094600	7691.102752	7693.172917	7690.186691	7691.733580
498701	DOW	300	1787094600	53343.822073	53352.105740	53336.370793	53340.583994
498702	DXY	300	1787094600	99.641852	99.653813	99.635313	99.642418
501073	SP500	300	1787098500	7691.775657	7693.083198	7690.503202	7691.642651
500158	SP500	300	1787097000	7692.486607	7693.308966	7690.003498	7691.657397
500159	DOW	300	1787097000	53341.096211	53351.003631	53332.743231	53343.838405
500160	DXY	300	1787097000	99.648790	99.653096	99.633642	99.644977
501074	DOW	300	1787098500	53340.452807	53352.175348	53334.918726	53341.973931
501075	DXY	300	1787098500	99.609498	99.622177	99.601770	99.615264
500890	SP500	300	1787098200	7691.418674	7693.391523	7690.433884	7692.043879
500891	DOW	300	1787098200	53346.313932	53353.488490	53334.721184	53339.788426
500892	DXY	300	1787098200	99.645340	99.650450	99.606939	99.610195
499609	SP500	300	1787096100	7691.849219	7694.226350	7690.419123	7691.983791
499610	DOW	300	1787096100	53347.724387	53354.874606	53332.093075	53343.885052
499611	DXY	300	1787096100	99.646503	99.655093	99.632707	99.644525
499426	SP500	300	1787095800	7691.857545	7692.801551	7690.780669	7692.055147
499427	DOW	300	1787095800	53342.148419	53353.696254	53334.107350	53346.235395
499428	DXY	300	1787095800	99.641940	99.656757	99.632819	99.646079
498880	SP500	300	1787094900	7691.942136	7693.344782	7690.772504	7691.622354
498881	DOW	300	1787094900	53339.471127	53358.734140	53336.772101	53341.829558
498882	DXY	300	1787094900	99.641982	99.653045	99.630614	99.645871
502897	SP500	300	1787101500	7692.019948	7692.859021	7690.565096	7692.101642
502898	DOW	300	1787101500	53344.929473	53352.852561	53334.691463	53340.922230
502899	DXY	300	1787101500	99.622099	99.661259	99.618065	99.653547
499792	SP500	300	1787096400	7692.013088	7693.305440	7690.159753	7691.669150
498342	DXY	300	1787094000	99.643525	99.654578	99.634306	99.645101
499793	DOW	300	1787096400	53343.979531	53351.246377	53331.506257	53342.965067
499794	DXY	300	1787096400	99.645725	99.657315	99.637228	99.648678
499243	SP500	300	1787095500	7691.808041	7693.114225	7690.258746	7691.694664
499244	DOW	300	1787095500	53340.832112	53352.473312	53335.486071	53344.034682
499245	DXY	300	1787095500	99.644279	99.651556	99.631268	99.643567
498520	SP500	300	1787094300	7691.134665	7693.046497	7689.937747	7691.223143
498521	DOW	300	1787094300	53344.324219	53353.499904	53335.020105	53342.716390
498522	DXY	300	1787094300	99.647247	99.653191	99.628538	99.641136
501982	SP500	300	1787100000	7691.976334	7693.173435	7690.530485	7691.563730
501439	SP500	300	1787099100	7692.115953	7692.892756	7690.729260	7691.754727
501440	DOW	300	1787099100	53342.078030	53349.568610	53334.205695	53342.543492
501441	DXY	300	1787099100	99.600616	99.612285	99.584485	99.602058
501256	SP500	300	1787098800	7691.540313	7693.524987	7690.624040	7691.903195
500524	SP500	300	1787097600	7692.057778	7693.297755	7690.295589	7692.006510
500525	DOW	300	1787097600	53340.862761	53352.200561	53332.660065	53344.331575
500526	DXY	300	1787097600	99.659520	99.671905	99.647464	99.652772
499975	SP500	300	1787096700	7691.961126	7693.299602	7690.320067	7692.217896
499976	DOW	300	1787096700	53342.377390	53351.960955	53335.858276	53341.360622
499977	DXY	300	1787096700	99.646839	99.656126	99.638841	99.646413
501257	DOW	300	1787098800	53340.879016	53355.058598	53334.903569	53341.106955
501258	DXY	300	1787098800	99.614157	99.622988	99.585746	99.598349
500341	SP500	300	1787097300	7691.841885	7693.106376	7690.761692	7691.898087
500342	DOW	300	1787097300	53345.679145	53352.074023	53332.015832	53341.597066
500343	DXY	300	1787097300	99.644757	99.672790	99.644757	99.658647
500707	SP500	300	1787097900	7692.038735	7693.210192	7690.419749	7691.634517
500708	DOW	300	1787097900	53342.392974	53356.777841	53332.845762	53345.028933
500709	DXY	300	1787097900	99.653587	99.660734	99.635471	99.646581
501983	DOW	300	1787100000	53342.931257	53354.055430	53338.498060	53342.343621
501984	DXY	300	1787100000	99.619404	99.648359	99.608749	99.640457
502165	SP500	300	1787100300	7691.529819	7693.098132	7690.816483	7691.850078
502166	DOW	300	1787100300	53343.539615	53354.421975	53333.573967	53343.223237
502167	DXY	300	1787100300	99.642506	99.651571	99.624935	99.627658
501622	SP500	300	1787099400	7691.991657	7693.140568	7690.194199	7691.505932
501623	DOW	300	1787099400	53344.448928	53352.726405	53332.236532	53342.873101
501624	DXY	300	1787099400	99.604154	99.617381	99.593670	99.607294
501802	SP500	300	1787099700	7691.552906	7692.818130	7690.251194	7691.833055
502348	SP500	300	1787100600	7692.030686	7693.362287	7690.601399	7691.858955
502349	DOW	300	1787100600	53342.366037	53355.849036	53336.293757	53346.151444
502350	DXY	300	1787100600	99.628509	99.652734	99.614229	99.639515
501803	DOW	300	1787099700	53342.595826	53352.020285	53332.956568	53341.415562
501804	DXY	300	1787099700	99.605587	99.622570	99.599468	99.619222
502531	SP500	300	1787100900	7691.996982	7692.709941	7690.338567	7691.679353
502532	DOW	300	1787100900	53344.317388	53357.056684	53329.641635	53343.968322
502533	DXY	300	1787100900	99.640716	99.651770	99.629416	99.643685
502714	SP500	300	1787101200	7691.445523	7692.735137	7689.955427	7691.752311
502715	DOW	300	1787101200	53344.939449	53350.715684	53331.560843	53346.068198
502716	DXY	300	1787101200	99.641740	99.656606	99.617509	99.624540
503265	DXY	300	1787102100	99.652517	99.674011	99.647938	99.665541
503446	SP500	300	1787102400	7691.975665	7692.566744	7690.572951	7691.654615
503447	DOW	300	1787102400	53342.555964	53352.630677	53335.831659	53343.453792
503448	DXY	300	1787102400	99.666115	99.677518	99.650876	99.672500
503629	SP500	300	1787102700	7691.866390	7693.208475	7690.350083	7691.869025
503630	DOW	300	1787102700	53344.380235	53352.280012	53336.821911	53342.937589
503631	DXY	300	1787102700	99.674068	99.693997	99.667517	99.673111
503812	SP500	300	1787103000	7692.157724	7693.260608	7690.344857	7691.733361
508200	DXY	300	1787110200	99.559550	99.581621	99.553113	99.569820
507100	SP500	300	1787108400	7691.461134	7693.039007	7689.721298	7691.786357
504178	SP500	300	1787103600	7691.876593	7692.945263	7690.334018	7691.830328
504179	DOW	300	1787103600	53341.018541	53349.532687	53334.485042	53343.117576
504180	DXY	300	1787103600	99.667074	99.672180	99.645630	99.655277
504544	SP500	300	1787104200	7692.246902	7693.168554	7690.158242	7691.714303
504545	DOW	300	1787104200	53343.444053	53358.714497	53333.846091	53339.723505
504546	DXY	300	1787104200	99.641528	99.647298	99.623392	99.633800
506008	SP500	300	1787106600	7692.194346	7692.901997	7690.310313	7692.053061
505825	SP500	300	1787106300	7691.649283	7692.712156	7690.705963	7692.041105
505826	DOW	300	1787106300	53341.621642	53354.362655	53333.461549	53343.270043
505827	DXY	300	1787106300	99.612492	99.625455	99.553612	99.570299
506009	DOW	300	1787106600	53343.605953	53353.178561	53334.028506	53341.454481
506010	DXY	300	1787106600	99.571214	99.587656	99.549641	99.571121
507101	DOW	300	1787108400	53344.194576	53353.687628	53332.649600	53344.477629
507102	DXY	300	1787108400	99.553829	99.586477	99.541684	99.576592
505642	SP500	300	1787106000	7691.958182	7693.365206	7689.739496	7691.637757
505643	DOW	300	1787106000	53345.548764	53354.272697	53332.292943	53341.627380
505644	DXY	300	1787106000	99.606375	99.618849	99.594328	99.610747
503813	DOW	300	1787103000	53342.848244	53353.437918	53333.780174	53344.102620
503814	DXY	300	1787103000	99.670791	99.683779	99.658410	99.667818
507832	SP500	300	1787109600	7692.295409	7693.316515	7690.427474	7691.854582
507833	DOW	300	1787109600	53341.882498	53359.763087	53334.707342	53343.747478
504361	SP500	300	1787103900	7692.108097	7693.159704	7690.254267	7691.946926
504362	DOW	300	1787103900	53341.225447	53349.812623	53335.882626	53342.944483
504363	DXY	300	1787103900	99.653654	99.656977	99.630809	99.639986
506734	SP500	300	1787107800	7692.152072	7693.146309	7689.266510	7691.523588
506191	SP500	300	1787106900	7691.897466	7693.103484	7690.296123	7691.769860
506192	DOW	300	1787106900	53340.460476	53354.611060	53334.183643	53342.957239
505093	SP500	300	1787105100	7692.053105	7693.209348	7690.729905	7691.853331
505094	DOW	300	1787105100	53342.347244	53352.389638	53337.079097	53344.616161
505095	DXY	300	1787105100	99.641102	99.644067	99.614953	99.630356
504910	SP500	300	1787104800	7691.648029	7693.185914	7690.673028	7691.879360
503995	SP500	300	1787103300	7691.523315	7692.833202	7690.262565	7691.832237
503996	DOW	300	1787103300	53343.344440	53355.022172	53332.341267	53341.806688
503997	DXY	300	1787103300	99.669465	99.680255	99.654393	99.667485
504911	DOW	300	1787104800	53344.064401	53353.423027	53334.857535	53341.687354
504912	DXY	300	1787104800	99.643758	99.657850	99.631714	99.643580
506193	DXY	300	1787106900	99.570960	99.599678	99.560933	99.580821
505276	SP500	300	1787105400	7691.729434	7693.357815	7690.560830	7691.596327
504727	SP500	300	1787104500	7691.535503	7693.667293	7690.459120	7691.690393
504728	DOW	300	1787104500	53340.105376	53353.990430	53332.101610	53344.148096
504729	DXY	300	1787104500	99.633427	99.648808	99.620368	99.641358
505277	DOW	300	1787105400	53343.663200	53350.712263	53332.347773	53342.855535
505278	DXY	300	1787105400	99.629062	99.643647	99.619570	99.627015
506735	DOW	300	1787107800	53343.463952	53351.052297	53330.733705	53341.274301
506736	DXY	300	1787107800	99.572595	99.581831	99.550044	99.551140
506917	SP500	300	1787108100	7691.276654	7693.090454	7690.593611	7691.520382
506918	DOW	300	1787108100	53342.443874	53354.107696	53333.113059	53342.993811
506919	DXY	300	1787108100	99.549307	99.567621	99.518901	99.551676
507649	SP500	300	1787109300	7691.857080	7693.543091	7690.336269	7692.192187
507650	DOW	300	1787109300	53346.407711	53351.577309	53336.865834	53343.907582
505459	SP500	300	1787105700	7691.358737	7692.606426	7690.511396	7692.161535
505460	DOW	300	1787105700	53342.326351	53353.415297	53333.775817	53344.979020
505461	DXY	300	1787105700	99.627146	99.632153	99.602032	99.605687
507651	DXY	300	1787109300	99.561980	99.591221	99.558180	99.575558
507834	DXY	300	1787109600	99.577352	99.581564	99.550231	99.569668
507466	SP500	300	1787109000	7691.779546	7693.218033	7690.560355	7691.925125
507467	DOW	300	1787109000	53345.438025	53350.362342	53331.297900	53344.492553
506551	SP500	300	1787107500	7691.486032	7693.049771	7690.290923	7691.944064
506371	SP500	300	1787107200	7691.924210	7692.969331	7690.228022	7691.773926
506372	DOW	300	1787107200	53343.721403	53353.890678	53336.508447	53342.154496
506373	DXY	300	1787107200	99.579794	99.595889	99.561966	99.585566
506552	DOW	300	1787107500	53343.845491	53353.700234	53332.061552	53343.944256
506553	DXY	300	1787107500	99.587487	99.590726	99.556455	99.571190
507468	DXY	300	1787109000	99.573346	99.651497	99.547955	99.562322
507283	SP500	300	1787108700	7691.575873	7693.910690	7690.547492	7691.620898
507284	DOW	300	1787108700	53342.830885	53354.675443	53331.467673	53343.526144
507285	DXY	300	1787108700	99.577254	99.592134	99.568347	99.573689
508380	DXY	300	1787110500	99.570880	99.578803	99.553840	99.569560
508015	SP500	300	1787109900	7692.090954	7693.045570	7690.193431	7691.861037
508016	DOW	300	1787109900	53342.539889	53357.083397	53337.313356	53343.069201
508017	DXY	300	1787109900	99.569995	99.578681	99.551228	99.561754
508198	SP500	300	1787110200	7691.767444	7693.205729	7690.551141	7691.817612
508199	DOW	300	1787110200	53344.295113	53353.086652	53332.144531	53341.998712
508562	DOW	300	1787110800	53340.667733	53352.660428	53332.830638	53342.759635
508378	SP500	300	1787110500	7691.710744	7692.999241	7690.530968	7692.063603
508379	DOW	300	1787110500	53342.762219	53352.040237	53332.420949	53342.273940
508563	DXY	300	1787110800	99.570227	99.587554	99.556821	99.581947
508561	SP500	300	1787110800	7692.362127	7693.326901	7690.944994	7691.505055
508744	SP500	300	1787111100	7691.458594	7693.598548	7690.486166	7691.789072
508745	DOW	300	1787111100	53344.755614	53354.117486	53334.769264	53343.334464
508746	DXY	300	1787111100	99.583511	99.592543	99.567993	99.583492
508927	SP500	300	1787111400	7691.962183	7693.049854	7690.793313	7691.645911
508928	DOW	300	1787111400	53345.071301	53352.503222	53334.551713	53342.040555
508929	DXY	300	1787111400	99.581827	99.596401	99.572785	99.578854
509110	SP500	300	1787111700	7691.722936	7693.361058	7690.833512	7692.017242
509111	DOW	300	1787111700	53342.242704	53354.447501	53334.022176	53345.244312
509112	DXY	300	1787111700	99.578926	99.591460	99.569393	99.576679
513312	DXY	300	1787118600	99.539834	99.553726	99.523384	99.534868
512950	SP500	300	1787118000	7691.527808	7692.927548	7690.608270	7691.597367
512951	DOW	300	1787118000	53345.738205	53352.378444	53335.589692	53343.940802
512952	DXY	300	1787118000	99.541527	99.557672	99.533483	99.533716
510940	SP500	300	1787114700	7691.679867	7692.923366	7690.453768	7691.577458
510941	DOW	300	1787114700	53346.107210	53354.485155	53334.352106	53345.456112
510942	DXY	300	1787114700	99.558576	99.574885	99.550446	99.570885
509293	SP500	300	1787112000	7692.071941	7693.296614	7690.371537	7691.699809
509294	DOW	300	1787112000	53347.076101	53351.847715	53331.643094	53343.951991
509295	DXY	300	1787112000	99.577086	99.595363	99.559016	99.585362
513130	SP500	300	1787118300	7691.361364	7692.975719	7690.511531	7691.860700
513131	DOW	300	1787118300	53342.347067	53350.388388	53335.087467	53344.416335
513132	DXY	300	1787118300	99.531655	99.550388	99.525470	99.539672
512770	SP500	300	1787117700	7691.558614	7693.049413	7690.205449	7691.595355
512221	SP500	300	1787116800	7691.769412	7693.480211	7690.382982	7691.872906
509842	SP500	300	1787112900	7691.688574	7693.311721	7690.361521	7692.018868
509843	DOW	300	1787112900	53344.673074	53354.105169	53336.624779	53344.809032
509844	DXY	300	1787112900	99.587817	99.604492	99.576337	99.589342
512222	DOW	300	1787116800	53341.945541	53354.089623	53330.796352	53342.415541
512223	DXY	300	1787116800	99.556689	99.568008	99.540985	99.547262
509476	SP500	300	1787112300	7691.432146	7693.220530	7690.695481	7691.679318
509477	DOW	300	1787112300	53345.969920	53352.850780	53332.912496	53341.855348
509478	DXY	300	1787112300	99.585069	99.604129	99.577259	99.590321
511306	SP500	300	1787115300	7692.134418	7692.825635	7690.677776	7692.058713
511307	DOW	300	1787115300	53341.432369	53358.945162	53333.024784	53343.386687
511308	DXY	300	1787115300	99.571116	99.582313	99.554619	99.556317
510391	SP500	300	1787113800	7691.387204	7693.113287	7690.440293	7691.856680
510392	DOW	300	1787113800	53340.896886	53352.263278	53333.341707	53341.457647
510393	DXY	300	1787113800	99.568989	99.579192	99.553883	99.569940
510574	SP500	300	1787114100	7691.689459	7693.341612	7690.488339	7691.869260
510575	DOW	300	1787114100	53341.072049	53356.739481	53333.056530	53341.952694
510576	DXY	300	1787114100	99.568565	99.584039	99.561741	99.570883
510208	SP500	300	1787113500	7691.445892	7692.592409	7690.698760	7691.642323
510209	DOW	300	1787113500	53342.671331	53350.250591	53335.221132	53341.797275
510210	DXY	300	1787113500	99.573410	99.578809	99.560818	99.568370
512771	DOW	300	1787117700	53343.819841	53350.263534	53334.989703	53344.685277
511855	SP500	300	1787116200	7691.454008	7693.129103	7690.526274	7691.947863
511489	SP500	300	1787115600	7691.830871	7693.211090	7690.513292	7691.753859
511490	DOW	300	1787115600	53342.886587	53350.470320	53331.722295	53342.167686
509659	SP500	300	1787112600	7691.969876	7693.056995	7690.432619	7691.925830
509660	DOW	300	1787112600	53342.579872	53353.803394	53336.240590	53342.787370
509661	DXY	300	1787112600	99.587992	99.597113	99.574002	99.587424
511491	DXY	300	1787115600	99.554078	99.572531	99.547290	99.563471
511123	SP500	300	1787115000	7691.357277	7692.988801	7690.768009	7691.937035
511124	DOW	300	1787115000	53345.344876	53351.166616	53333.000787	53340.920522
511125	DXY	300	1787115000	99.570410	99.590978	99.566716	99.571325
510757	SP500	300	1787114400	7691.769029	7692.917679	7690.652039	7691.875985
510758	DOW	300	1787114400	53341.487791	53352.696337	53333.776083	53345.187131
510025	SP500	300	1787113200	7692.122452	7693.890355	7690.726677	7691.644006
510026	DOW	300	1787113200	53343.380690	53354.559120	53334.636319	53344.730789
510027	DXY	300	1787113200	99.588709	99.594206	99.564328	99.571872
510759	DXY	300	1787114400	99.572496	99.575381	99.540978	99.559571
511856	DOW	300	1787116200	53346.699577	53352.322621	53329.767643	53343.062063
511857	DXY	300	1787116200	99.548367	99.564076	99.534673	99.546152
512772	DXY	300	1787117700	99.541105	99.561215	99.530845	99.543332
513671	DOW	300	1787119200	53343.491563	53356.040592	53329.941506	53342.564582
513672	DXY	300	1787119200	99.533150	99.548487	99.519205	99.540443
512587	SP500	300	1787117400	7691.415170	7693.387269	7690.941749	7691.582616
512588	DOW	300	1787117400	53341.833185	53350.875414	53333.043171	53344.802921
512038	SP500	300	1787116500	7692.062921	7693.675525	7690.780818	7691.711833
512039	DOW	300	1787116500	53341.128163	53351.720922	53331.857251	53342.564834
512040	DXY	300	1787116500	99.547457	99.569540	99.540244	99.556508
511672	SP500	300	1787115900	7691.789971	7692.782139	7690.317970	7691.669034
511673	DOW	300	1787115900	53343.638637	53356.851201	53335.823499	53344.942931
511674	DXY	300	1787115900	99.564912	99.580711	99.540035	99.549041
512404	SP500	300	1787117100	7692.022317	7692.895422	7691.049542	7691.639742
512405	DOW	300	1787117100	53340.561101	53355.028588	53334.474288	53342.270785
512406	DXY	300	1787117100	99.546991	99.558634	99.525191	99.542300
512589	DXY	300	1787117400	99.540833	99.553359	99.530651	99.540900
513850	SP500	300	1787119500	7691.392760	7692.859482	7690.520947	7692.041714
513490	SP500	300	1787118900	7691.882120	7693.132007	7690.475802	7691.808795
513491	DOW	300	1787118900	53342.574658	53353.602141	53332.825480	53343.668887
514580	DOW	300	1787120700	53343.556173	53353.080130	53332.334113	53342.479246
513670	SP500	300	1787119200	7691.699963	7693.555268	7690.625436	7691.574301
513310	SP500	300	1787118600	7691.904675	7692.794135	7690.277064	7691.578632
513311	DOW	300	1787118600	53345.855537	53351.485127	53327.550313	53342.665417
513492	DXY	300	1787118900	99.536962	99.548300	99.519267	99.532968
513851	DOW	300	1787119500	53343.079149	53351.505852	53333.832245	53341.740752
513852	DXY	300	1787119500	99.539561	99.553971	99.516165	99.529529
514030	SP500	300	1787119800	7692.227456	7693.201526	7689.910591	7691.851724
514031	DOW	300	1787119800	53343.094990	53351.459631	53333.975778	53342.370387
514032	DXY	300	1787119800	99.527084	99.542569	99.513261	99.517278
514213	SP500	300	1787120100	7691.687961	7693.586222	7690.566612	7691.453484
514214	DOW	300	1787120100	53344.369405	53355.635958	53336.172241	53344.035790
514215	DXY	300	1787120100	99.518889	99.531262	99.505820	99.509873
514396	SP500	300	1787120400	7691.639113	7693.340670	7690.381828	7691.980307
514397	DOW	300	1787120400	53343.237206	53354.948210	53332.098772	53342.974577
514398	DXY	300	1787120400	99.509606	99.524089	99.501502	99.519157
514579	SP500	300	1787120700	7692.274898	7693.288171	7690.301337	7691.600950
515299	SP500	300	1787121900	7691.630785	7692.829436	7690.556575	7692.001269
515300	DOW	300	1787121900	53342.959168	53351.040051	53332.498745	53344.135048
515301	DXY	300	1787121900	99.470684	99.479867	99.458943	99.468360
518210	DOW	300	1787126700	53341.105600	53354.647228	53335.385071	53345.445012
517660	SP500	300	1787125800	7691.964491	7692.981711	7690.319854	7691.994584
517111	SP500	300	1787124900	7691.838261	7692.979675	7690.399560	7692.060648
517112	DOW	300	1787124900	53344.291429	53352.719885	53333.860837	53342.013078
517113	DXY	300	1787124900	99.480627	99.496282	99.473779	99.479810
514939	SP500	300	1787121300	7691.624975	7692.922645	7689.948135	7691.877184
514940	DOW	300	1787121300	53339.965692	53350.754619	53336.127548	53345.315665
514941	DXY	300	1787121300	99.452471	99.471696	99.447755	99.453459
517661	DOW	300	1787125800	53345.067391	53353.124393	53333.579653	53341.688909
517662	DXY	300	1787125800	99.469608	99.488363	99.452997	99.482640
515839	SP500	300	1787122800	7692.108319	7692.882491	7690.678203	7691.859780
515840	DOW	300	1787122800	53341.927294	53356.117176	53333.838906	53341.642879
515841	DXY	300	1787122800	99.468352	99.487795	99.460973	99.468345
516019	SP500	300	1787123100	7691.629133	7693.197459	7690.926309	7691.952249
516020	DOW	300	1787123100	53339.792724	53352.679373	53332.597951	53343.793585
516021	DXY	300	1787123100	99.466711	99.493687	99.464590	99.485605
515659	SP500	300	1787122500	7691.859696	7693.699620	7690.283604	7691.907824
515660	DOW	300	1787122500	53345.930655	53352.086524	53336.103491	53341.345324
515661	DXY	300	1787122500	99.472633	99.485521	99.464309	99.470312
517477	SP500	300	1787125500	7692.062607	7693.194518	7691.004346	7691.768048
516745	SP500	300	1787124300	7691.945368	7693.045198	7690.055863	7692.064506
515119	SP500	300	1787121600	7691.658398	7692.758478	7690.566875	7691.790876
515120	DOW	300	1787121600	53343.664517	53353.517743	53335.295880	53344.465567
515121	DXY	300	1787121600	99.455926	99.489856	99.441038	99.472339
516746	DOW	300	1787124300	53344.588084	53352.385211	53335.502762	53343.244579
516747	DXY	300	1787124300	99.487135	99.515100	99.485885	99.495858
517478	DOW	300	1787125500	53346.245877	53353.704299	53332.481966	53343.042152
515479	SP500	300	1787122200	7691.701517	7693.435978	7690.567045	7691.962794
514581	DXY	300	1787120700	99.516914	99.528147	99.477679	99.478827
515480	DOW	300	1787122200	53342.503786	53352.304971	53333.401356	53344.371801
515481	DXY	300	1787122200	99.470071	99.486029	99.449199	99.473415
516199	SP500	300	1787123400	7692.189070	7693.089733	7690.097306	7691.873292
516200	DOW	300	1787123400	53342.898357	53354.625444	53336.512379	53343.274512
516201	DXY	300	1787123400	99.484298	99.486928	99.458063	99.479221
514759	SP500	300	1787121000	7691.536504	7693.137826	7690.286149	7691.651226
514760	DOW	300	1787121000	53344.042542	53353.313374	53332.573233	53342.080312
514761	DXY	300	1787121000	99.479628	99.486346	99.448803	99.454904
517479	DXY	300	1787125500	99.463887	99.481296	99.448441	99.468522
516562	SP500	300	1787124000	7691.459718	7692.910834	7690.661030	7691.699219
516563	DOW	300	1787124000	53344.313677	53352.763586	53337.241045	53342.524183
516564	DXY	300	1787124000	99.477540	99.502594	99.467145	99.487996
518211	DXY	300	1787126700	99.462678	99.478487	99.451270	99.463340
516928	SP500	300	1787124600	7692.248417	7692.977555	7690.784423	7691.700826
516929	DOW	300	1787124600	53342.205216	53356.749642	53333.162996	53342.575310
516930	DXY	300	1787124600	99.495920	99.512387	99.472349	99.480569
519663	DXY	300	1787129100	99.456179	99.468768	99.440603	99.456000
516379	SP500	300	1787123700	7691.980027	7692.935224	7690.176616	7691.760000
516380	DOW	300	1787123700	53342.872166	53350.946279	53337.664354	53343.400000
516381	DXY	300	1787123700	99.476756	99.490496	99.457638	99.478000
519478	SP500	300	1787128800	7691.788270	7693.059270	7690.030615	7691.760000
519479	DOW	300	1787128800	53344.923801	53358.097680	53334.504127	53343.400000
519295	SP500	300	1787128500	7691.750406	7693.740960	7690.318770	7691.711587
519296	DOW	300	1787128500	53341.551108	53351.975250	53334.572642	53344.147362
519297	DXY	300	1787128500	99.433746	99.465032	99.424603	99.453237
518749	SP500	300	1787127600	7691.686736	7693.170768	7690.350547	7692.023577
518750	DOW	300	1787127600	53343.372705	53350.807744	53334.674171	53345.387419
517843	SP500	300	1787126100	7691.723029	7692.951502	7690.417631	7691.760000
517844	DOW	300	1787126100	53341.211550	53349.959985	53332.821998	53343.400000
517845	DXY	300	1787126100	99.484119	99.492741	99.466863	99.484000
518751	DXY	300	1787127600	99.434864	99.435781	99.395259	99.407593
518569	SP500	300	1787127300	7691.733197	7693.052997	7690.337848	7691.537061
518570	DOW	300	1787127300	53343.862573	53352.823419	53332.981108	53341.307356
517294	SP500	300	1787125200	7691.859769	7692.374577	7690.546869	7691.973213
517295	DOW	300	1787125200	53342.027983	53354.551480	53337.276248	53345.187227
517296	DXY	300	1787125200	99.480909	99.485882	99.464000	99.464277
518571	DXY	300	1787127300	99.456642	99.464209	99.420938	99.432846
518026	SP500	300	1787126400	7691.920813	7693.555163	7690.483929	7691.702539
518027	DOW	300	1787126400	53344.147385	53353.820651	53335.320614	53343.167712
518028	DXY	300	1787126400	99.481513	99.495948	99.453856	99.461666
518389	SP500	300	1787127000	7691.978960	7693.419118	7690.462088	7691.973372
518209	SP500	300	1787126700	7691.837100	7692.922982	7690.002162	7691.741442
518390	DOW	300	1787127000	53347.291093	53351.248867	53331.702327	53344.338873
518391	DXY	300	1787127000	99.461237	99.478766	99.447610	99.458055
519112	SP500	300	1787128200	7691.604531	7692.814175	7689.552878	7691.898377
519113	DOW	300	1787128200	53343.088496	53357.992393	53336.541661	53342.670793
519114	DXY	300	1787128200	99.404152	99.445128	99.398064	99.434727
518929	SP500	300	1787127900	7692.070413	7692.637150	7689.555221	7691.769333
518930	DOW	300	1787127900	53344.462677	53351.859870	53335.806452	53341.647474
518931	DXY	300	1787127900	99.406823	99.410606	99.387533	99.404635
519480	DXY	300	1787128800	99.453851	99.476450	99.435705	99.455000
519843	DXY	300	1787129400	99.454869	99.460157	99.415137	99.425128
519661	SP500	300	1787129100	7691.657081	7692.969130	7690.191784	7691.760000
519662	DOW	300	1787129100	53342.431751	53352.716860	53333.144807	53343.400000
520021	SP500	300	1787129700	7691.763306	7693.142306	7690.727664	7692.067015
519841	SP500	300	1787129400	7691.500494	7693.145392	7690.221549	7691.638046
519842	DOW	300	1787129400	53343.111717	53350.895585	53333.603438	53344.029738
524226	DXY	300	1787136600	99.365397	99.369384	99.346962	99.359000
520750	SP500	300	1787130900	7691.938304	7693.524515	7690.398661	7691.570022
520384	SP500	300	1787130300	7691.724574	7693.100211	7690.261330	7691.645273
520385	DOW	300	1787130300	53344.440994	53353.890589	53334.207705	53342.732328
520386	DXY	300	1787130300	99.441207	99.472434	99.432983	99.458437
520751	DOW	300	1787130900	53342.261349	53349.844959	53334.550742	53343.674832
520752	DXY	300	1787130900	99.437358	99.458275	99.433750	99.455295
522214	SP500	300	1787133300	7692.128847	7692.642064	7690.880320	7691.914874
522215	DOW	300	1787133300	53344.422302	53355.206273	53336.813000	53343.657887
522216	DXY	300	1787133300	99.407618	99.424770	99.387889	99.394796
522031	SP500	300	1787133000	7691.412542	7693.111849	7690.362660	7691.915167
522032	DOW	300	1787133000	53343.036685	53351.610080	53335.421576	53344.037995
522033	DXY	300	1787133000	99.417179	99.427354	99.402008	99.407251
523309	SP500	300	1787135100	7691.812677	7692.987110	7690.079254	7691.965165
523310	DOW	300	1787135100	53346.198956	53354.371239	53332.641708	53344.579860
523311	DXY	300	1787135100	99.367515	99.384413	99.356740	99.356740
521848	SP500	300	1787132700	7691.609275	7693.121943	7690.342458	7691.618936
520022	DOW	300	1787129700	53344.285572	53351.361588	53333.542015	53342.464775
520023	DXY	300	1787129700	99.423382	99.434786	99.410211	99.421597
521849	DOW	300	1787132700	53346.272201	53354.254779	53330.700432	53343.639103
521850	DXY	300	1787132700	99.407001	99.423218	99.396563	99.418566
522397	SP500	300	1787133600	7691.757104	7693.426876	7690.772922	7691.760000
520567	SP500	300	1787130600	7691.661960	7692.815005	7690.677493	7691.671834
520568	DOW	300	1787130600	53342.044192	53352.412526	53335.329006	53341.519063
520569	DXY	300	1787130600	99.457018	99.485283	99.434277	99.439603
522398	DOW	300	1787133600	53345.315569	53356.819804	53334.169952	53343.400000
522399	DXY	300	1787133600	99.397185	99.406632	99.380571	99.396000
521299	SP500	300	1787131800	7691.791652	7693.358153	7690.599863	7691.760000
521300	DOW	300	1787131800	53342.103173	53351.796022	53333.893486	53343.400000
521301	DXY	300	1787131800	99.442769	99.449314	99.411998	99.413000
521116	SP500	300	1787131500	7691.731802	7693.002573	7690.716604	7691.760000
520201	SP500	300	1787130000	7691.829022	7693.235211	7690.426404	7691.579421
520202	DOW	300	1787130000	53343.271235	53353.870002	53333.857516	53344.365290
520203	DXY	300	1787130000	99.422771	99.445132	99.417915	99.439705
521117	DOW	300	1787131500	53341.194377	53348.133583	53332.575210	53343.400000
521118	DXY	300	1787131500	99.448441	99.465449	99.439524	99.444000
520933	SP500	300	1787131200	7691.270705	7693.206923	7690.608129	7691.799998
520934	DOW	300	1787131200	53343.248956	53355.873677	53333.672705	53343.054236
520935	DXY	300	1787131200	99.455042	99.460195	99.438010	99.448989
524775	DXY	300	1787137500	99.385826	99.404622	99.384312	99.394835
524041	SP500	300	1787136300	7691.555414	7693.146205	7690.137425	7691.760000
522943	SP500	300	1787134500	7691.604621	7692.690869	7690.382518	7692.062813
521482	SP500	300	1787132100	7691.950729	7693.171812	7690.408120	7691.760000
521483	DOW	300	1787132100	53344.382722	53351.423847	53333.888576	53343.400000
521484	DXY	300	1787132100	99.415352	99.438438	99.409034	99.420000
522944	DOW	300	1787134500	53345.396948	53354.514183	53334.589345	53342.511757
522945	DXY	300	1787134500	99.395264	99.408576	99.383897	99.392301
523126	SP500	300	1787134800	7691.788231	7692.955324	7689.998283	7691.951140
523127	DOW	300	1787134800	53341.260177	53354.415637	53333.879865	53345.147377
523128	DXY	300	1787134800	99.394437	99.401392	99.362359	99.368836
524042	DOW	300	1787136300	53344.667401	53353.102310	53333.803488	53343.400000
523858	SP500	300	1787136000	7691.416336	7693.684867	7690.028709	7691.760000
523859	DOW	300	1787136000	53342.403444	53353.586914	53335.216027	53343.400000
523860	DXY	300	1787136000	99.366277	99.382211	99.352644	99.366000
521665	SP500	300	1787132400	7691.858192	7693.592367	7689.717662	7691.711868
521666	DOW	300	1787132400	53344.446617	53350.116586	53337.443124	53344.769083
521667	DXY	300	1787132400	99.419269	99.427239	99.399104	99.407789
524043	DXY	300	1787136300	99.365047	99.377860	99.352138	99.367000
522577	SP500	300	1787133900	7691.549650	7693.240730	7689.997603	7691.760000
522578	DOW	300	1787133900	53342.743686	53353.429768	53335.594413	53343.400000
522579	DXY	300	1787133900	99.396630	99.406965	99.385857	99.394000
522760	SP500	300	1787134200	7691.993012	7692.928912	7690.786220	7691.760000
522761	DOW	300	1787134200	53341.300822	53350.444923	53332.850252	53343.400000
522762	DXY	300	1787134200	99.394121	99.412002	99.383601	99.397000
523675	SP500	300	1787135700	7692.207156	7693.680748	7690.244780	7691.721552
523492	SP500	300	1787135400	7691.989632	7693.196426	7690.007582	7692.013824
523493	DOW	300	1787135400	53343.786601	53349.788888	53330.632833	53344.919277
523494	DXY	300	1787135400	99.358359	99.372483	99.343862	99.359279
523676	DOW	300	1787135700	53346.145077	53352.987252	53334.742227	53342.907463
523677	DXY	300	1787135700	99.360960	99.380994	99.354733	99.364162
525324	DXY	300	1787138400	99.426061	99.435312	99.399600	99.407000
524407	SP500	300	1787136900	7691.674856	7693.582752	7690.308801	7691.760000
524408	DOW	300	1787136900	53341.487248	53356.046622	53334.178716	53343.400000
524409	DXY	300	1787136900	99.359145	99.367068	99.339694	99.360000
524224	SP500	300	1787136600	7691.917911	7692.709472	7690.567104	7691.760000
524225	DOW	300	1787136600	53343.801813	53352.485375	53334.864185	53343.400000
524774	DOW	300	1787137500	53342.050251	53353.946025	53333.321101	53343.557718
524773	SP500	300	1787137500	7691.922220	7693.051238	7690.499154	7691.700456
524590	SP500	300	1787137200	7691.465032	7693.290911	7690.305680	7691.760000
524591	DOW	300	1787137200	53341.903429	53351.180002	53333.744885	53343.400000
524592	DXY	300	1787137200	99.360503	99.392323	99.357189	99.387000
524956	SP500	300	1787137800	7691.707963	7693.806214	7690.574635	7692.007755
524957	DOW	300	1787137800	53342.022191	53352.793730	53333.441673	53344.050286
524958	DXY	300	1787137800	99.396632	99.401637	99.371368	99.399111
525139	SP500	300	1787138100	7691.750495	7693.051918	7689.583576	7691.640052
525140	DOW	300	1787138100	53344.820546	53353.076048	53327.998467	53342.540739
525141	DXY	300	1787138100	99.399488	99.431003	99.391159	99.424142
525322	SP500	300	1787138400	7691.816078	7692.701900	7689.985467	7691.760000
525323	DOW	300	1787138400	53343.639362	53351.866113	53334.850078	53343.400000
530061	DXY	300	1787146200	99.018256	99.035530	98.998108	99.029000
529699	SP500	300	1787145600	7692.311692	7692.700067	7690.269583	7691.760000
529700	DOW	300	1787145600	53345.530547	53351.820749	53335.730795	53343.400000
529150	SP500	300	1787144700	7691.650955	7693.025594	7690.129122	7691.760000
529151	DOW	300	1787144700	53344.977753	53352.201491	53332.476712	53343.400000
529152	DXY	300	1787144700	99.098182	99.143995	99.080509	99.139000
525502	SP500	300	1787138700	7691.786416	7692.899602	7690.393714	7691.760000
525503	DOW	300	1787138700	53342.272973	53351.503274	53333.384736	53343.400000
525504	DXY	300	1787138700	99.407932	99.418217	99.399470	99.407000
529701	DXY	300	1787145600	99.044321	99.049223	99.004476	99.018000
529516	SP500	300	1787145300	7692.222833	7693.174237	7690.393239	7692.038457
526042	SP500	300	1787139600	7691.531511	7692.679221	7690.565038	7691.760000
526043	DOW	300	1787139600	53341.434421	53353.027472	53331.864440	53343.400000
526044	DXY	300	1787139600	99.414099	99.424805	99.400802	99.406000
528418	SP500	300	1787143500	7691.983051	7692.702760	7689.983944	7691.760000
527503	SP500	300	1787142000	7691.908508	7692.825298	7690.392133	7691.760000
527504	DOW	300	1787142000	53344.840096	53354.661980	53333.522776	53343.400000
527505	DXY	300	1787142000	99.402544	99.422057	99.396302	99.405000
528419	DOW	300	1787143500	53343.916631	53351.049016	53329.579908	53343.400000
527686	SP500	300	1787142300	7691.638058	7693.799252	7690.409963	7691.980247
527687	DOW	300	1787142300	53342.468635	53351.485353	53331.251775	53344.626724
527688	DXY	300	1787142300	99.404964	99.412344	99.378926	99.383412
525682	SP500	300	1787139000	7692.038236	7693.446578	7690.348381	7691.760000
525683	DOW	300	1787139000	53344.543401	53350.841962	53334.115978	53343.400000
525684	DXY	300	1787139000	99.408373	99.423678	99.391588	99.404000
526588	SP500	300	1787140500	7691.889566	7693.458939	7690.437839	7691.659402
526589	DOW	300	1787140500	53343.601278	53354.313774	53335.824974	53343.116939
526590	DXY	300	1787140500	99.443940	99.446923	99.401919	99.413323
526771	SP500	300	1787140800	7691.957542	7692.713898	7690.145593	7691.760000
526772	DOW	300	1787140800	53341.966518	53359.331185	53337.632545	53343.400000
526773	DXY	300	1787140800	99.415023	99.432728	99.401408	99.413000
526405	SP500	300	1787140200	7692.048765	7693.135808	7690.498374	7691.970447
526406	DOW	300	1787140200	53343.297399	53354.413503	53335.188828	53341.674676
526407	DXY	300	1787140200	99.430819	99.459500	99.419756	99.444083
527320	SP500	300	1787141700	7691.695770	7692.877171	7690.685172	7691.760000
527321	DOW	300	1787141700	53344.656556	53353.153446	53334.734845	53343.400000
527322	DXY	300	1787141700	99.416710	99.421538	99.390742	99.405000
525862	SP500	300	1787139300	7691.982531	7692.824712	7689.631874	7691.760000
525863	DOW	300	1787139300	53345.035961	53351.273423	53334.690150	53343.400000
525864	DXY	300	1787139300	99.403674	99.421896	99.386132	99.412000
526954	SP500	300	1787141100	7692.067052	7693.128749	7689.823069	7691.760000
526955	DOW	300	1787141100	53342.057540	53350.079131	53334.173489	53343.400000
526222	SP500	300	1787139900	7691.944275	7692.980112	7689.988972	7691.760000
526223	DOW	300	1787139900	53342.986322	53349.976491	53330.329920	53343.400000
526224	DXY	300	1787139900	99.406292	99.444963	99.396334	99.432000
526956	DXY	300	1787141100	99.411111	99.434890	99.400052	99.424000
528420	DXY	300	1787143500	99.268587	99.292910	99.152394	99.186000
529517	DOW	300	1787145300	53342.721196	53352.553917	53330.443940	53345.297892
528052	SP500	300	1787142900	7691.755536	7692.361907	7690.282582	7691.760000
528053	DOW	300	1787142900	53345.872994	53352.329612	53332.980502	53343.400000
528054	DXY	300	1787142900	99.365957	99.396703	99.359583	99.386000
529518	DXY	300	1787145300	99.088019	99.103245	99.043000	99.043568
529333	SP500	300	1787145000	7692.042388	7692.933884	7690.045243	7691.918076
528967	SP500	300	1787144400	7692.014173	7693.176117	7690.414501	7691.760000
528784	SP500	300	1787144100	7691.613915	7693.340811	7690.808235	7691.760000
527869	SP500	300	1787142600	7691.880702	7693.506865	7690.867582	7691.909118
527870	DOW	300	1787142600	53345.208906	53351.921224	53331.595963	53344.191815
527871	DXY	300	1787142600	99.384513	99.393464	99.355217	99.366755
527137	SP500	300	1787141400	7691.454960	7692.951105	7690.342356	7691.760000
527138	DOW	300	1787141400	53343.140230	53352.720253	53337.316764	53343.400000
527139	DXY	300	1787141400	99.425482	99.436597	99.400723	99.419000
528785	DOW	300	1787144100	53344.365644	53350.857427	53335.524174	53343.400000
528235	SP500	300	1787143200	7691.747169	7693.471532	7690.589507	7691.760000
528236	DOW	300	1787143200	53344.387146	53354.245280	53334.180715	53343.400000
528237	DXY	300	1787143200	99.385744	99.395415	99.269000	99.269000
528601	SP500	300	1787143800	7691.843613	7693.378514	7690.474408	7691.760000
528602	DOW	300	1787143800	53342.433682	53351.126956	53335.786858	53343.400000
528603	DXY	300	1787143800	99.184908	99.238217	99.174280	99.186000
528786	DXY	300	1787144100	99.186278	99.206996	99.115727	99.119000
528968	DOW	300	1787144400	53345.150927	53352.172945	53336.265426	53343.400000
528969	DXY	300	1787144400	99.119075	99.168364	99.089508	99.098000
529334	DOW	300	1787145000	53344.098589	53354.599023	53335.119178	53343.944352
529335	DXY	300	1787145000	99.139131	99.142007	99.083000	99.087117
529879	SP500	300	1787145900	7692.003122	7693.798677	7690.055853	7691.760000
530241	DXY	300	1787146500	99.029141	99.059326	98.989000	98.989000
530059	SP500	300	1787146200	7691.965316	7726.215415	7691.597049	7720.150000
529880	DOW	300	1787145900	53342.514253	53349.848797	53332.509952	53343.400000
529881	DXY	300	1787145900	99.019012	99.048147	99.005309	99.017000
530060	DOW	300	1787146200	53344.030723	53580.495684	53342.182020	53440.280000
530421	DXY	300	1787146800	98.990019	98.993195	98.944553	98.969000
530239	SP500	300	1787146500	7720.115916	7721.813354	7715.060000	7715.060000
530240	DOW	300	1787146500	53442.199365	53474.979604	53407.145872	53449.690000
530601	DXY	300	1787147100	98.968890	99.029240	98.963000	98.963000
530419	SP500	300	1787146800	7714.940806	7722.660760	7711.306060	7720.620000
530420	DOW	300	1787146800	53448.012666	53485.006884	53408.506592	53469.600000
530780	DOW	300	1787147400	53430.477485	53568.760000	53424.553492	53567.973004
530599	SP500	300	1787147100	7720.705377	7725.545096	7704.080000	7704.080000
530600	DOW	300	1787147100	53470.441017	53533.071902	53429.100000	53429.100000
530779	SP500	300	1787147400	7703.857224	7715.850000	7700.153508	7715.781599
533882	DOW	300	1787152500	53655.692803	53668.986350	53596.285489	53599.595566
533883	DXY	300	1787152500	98.918614	98.928142	98.893016	98.922049
533332	SP500	300	1787151600	7741.500000	7743.673466	7738.839425	7742.881800
533333	DOW	300	1787151600	53676.210000	53704.041672	53656.087708	53695.872274
532600	SP500	300	1787150400	7730.330000	7732.266168	7727.489412	7729.590968
532601	DOW	300	1787150400	53649.510000	53678.402449	53632.523855	53657.788044
532602	DXY	300	1787150400	98.841000	98.841536	98.802071	98.834796
531505	SP500	300	1787148600	7717.417165	7717.791444	7707.910000	7707.910000
531506	DOW	300	1787148600	53606.127078	53621.451196	53565.980057	53567.430000
531507	DXY	300	1787148600	98.944818	98.974551	98.922177	98.933000
531139	SP500	300	1787148000	7719.754114	7719.943159	7714.927055	7716.050000
531140	DOW	300	1787148000	53588.645083	53631.998662	53576.082621	53586.240000
531141	DXY	300	1787148000	98.982722	99.010180	98.947477	98.949000
533334	DXY	300	1787151600	98.875000	98.923696	98.868371	98.909458
533698	SP500	300	1787152200	7735.340000	7739.410891	7734.693190	7736.398546
533699	DOW	300	1787152200	53641.150000	53673.732616	53635.065217	53654.695557
533700	DXY	300	1787152200	98.905000	98.939950	98.898291	98.916641
535163	DOW	300	1787154600	53497.390000	53515.097601	53481.510000	53485.282129
535164	DXY	300	1787154600	98.886000	98.916674	98.877846	98.890583
534979	SP500	300	1787154300	7724.980000	7728.629677	7723.624293	7725.022898
534980	DOW	300	1787154300	53505.540000	53525.391702	53485.396002	53513.402919
532054	SP500	300	1787149500	7715.557790	7719.910000	7710.423659	7719.822406
532055	DOW	300	1787149500	53616.589492	53634.983965	53592.501808	53606.993645
532056	DXY	300	1787149500	98.881760	98.885061	98.850370	98.869253
534613	SP500	300	1787153700	7727.550000	7728.913249	7724.916678	7726.867692
531871	SP500	300	1787149200	7716.548851	7721.718044	7713.029751	7715.610000
531872	DOW	300	1787149200	53625.298003	53653.677852	53601.713634	53617.950000
531873	DXY	300	1787149200	98.928137	98.933626	98.857189	98.881000
531322	SP500	300	1787148300	7715.874786	7720.081269	7714.001241	7717.130000
531323	DOW	300	1787148300	53588.356492	53607.720000	53556.323404	53607.720000
531324	DXY	300	1787148300	98.947936	98.969105	98.924445	98.947000
530781	DXY	300	1787147400	98.962308	99.010738	98.951735	98.964860
534614	DOW	300	1787153700	53543.390000	53561.272289	53524.596071	53530.288064
534615	DXY	300	1787153700	98.960000	98.972497	98.929340	98.946333
532237	SP500	300	1787149800	7719.965736	7722.914163	7717.213252	7720.850000
532238	DOW	300	1787149800	53606.156198	53633.963793	53580.699345	53625.340000
532239	DXY	300	1787149800	98.871197	98.904000	98.851794	98.888000
532966	SP500	300	1787151000	7726.650000	7734.582334	7726.524667	7733.280835
530959	SP500	300	1787147700	7715.988496	7723.672765	7714.359546	7719.780000
530960	DOW	300	1787147700	53566.270118	53618.307815	53543.092383	53587.030000
530961	DXY	300	1787147700	98.962785	98.988417	98.945106	98.983000
531688	SP500	300	1787148900	7708.076281	7721.100960	7707.645999	7716.810000
531689	DOW	300	1787148900	53569.531726	53644.097065	53552.883871	53623.170000
531690	DXY	300	1787148900	98.931993	98.945939	98.917064	98.929000
532967	DOW	300	1787151000	53607.500000	53634.621953	53598.066281	53598.066281
532968	DXY	300	1787151000	98.770000	98.808072	98.768671	98.786340
534064	SP500	300	1787152800	7734.710000	7735.786031	7731.778637	7732.981520
534065	DOW	300	1787152800	53591.390000	53599.815500	53577.398070	53585.659946
532420	SP500	300	1787150100	7720.667801	7732.259075	7719.613791	7728.849673
532421	DOW	300	1787150100	53627.374918	53671.812048	53619.475130	53651.679381
532422	DXY	300	1787150100	98.887172	98.887172	98.838229	98.848042
534066	DXY	300	1787152800	98.925000	98.949170	98.888608	98.897172
532783	SP500	300	1787150700	7729.950000	7731.919893	7727.023856	7728.204561
532784	DOW	300	1787150700	53650.510000	53671.988294	53610.960000	53614.935583
532785	DXY	300	1787150700	98.827000	98.837078	98.769679	98.772543
533149	SP500	300	1787151300	7733.790000	7742.288851	7732.799504	7739.478360
533150	DOW	300	1787151300	53603.900000	53686.116779	53596.063987	53672.155690
533151	DXY	300	1787151300	98.793000	98.884140	98.792073	98.878827
534981	DXY	300	1787154300	98.908000	98.921510	98.874235	98.887434
534247	SP500	300	1787153100	7731.910000	7731.957865	7728.317472	7729.979110
534248	DOW	300	1787153100	53571.780000	53577.901462	53537.574452	53550.315435
533515	SP500	300	1787151900	7741.220000	7742.959983	7735.398770	7736.120379
533516	DOW	300	1787151900	53698.330000	53711.711028	53653.850184	53654.220356
533517	DXY	300	1787151900	98.913000	98.924328	98.882721	98.900242
534249	DXY	300	1787153100	98.902000	98.925103	98.883385	98.922593
534796	SP500	300	1787154000	7725.360000	7725.515857	7720.376706	7724.228637
534430	SP500	300	1787153400	7730.320000	7731.647108	7726.649593	7726.649593
533881	SP500	300	1787152500	7736.470538	7738.854203	7732.943992	7733.240650
534431	DOW	300	1787153400	53545.100000	53561.317581	53532.074799	53538.058499
534432	DXY	300	1787153400	98.919000	98.967238	98.908896	98.954291
534797	DOW	300	1787154000	53531.740000	53538.605981	53479.504042	53498.799771
534798	DXY	300	1787154000	98.941000	98.946972	98.908521	98.910277
535346	DOW	300	1787154900	53485.980000	53507.170186	53476.379180	53501.921836
535347	DXY	300	1787154900	98.878000	98.912033	98.869462	98.897009
535529	DOW	300	1787155200	53494.230000	53531.376141	53483.966885	53523.857365
535713	DXY	300	1787155500	98.932000	98.947540	98.915868	98.919085
535162	SP500	300	1787154600	7724.820000	7725.226225	7720.788624	7721.031857
535345	SP500	300	1787154900	7721.480000	7726.659572	7720.542503	7724.286291
535528	SP500	300	1787155200	7726.130000	7732.977550	7724.859726	7731.864325
535530	DXY	300	1787155200	98.898000	98.938024	98.896901	98.930054
535711	SP500	300	1787155500	7732.740000	7735.907827	7732.016861	7734.457476
535712	DOW	300	1787155500	53528.060000	53548.488956	53515.260000	53530.423639
535891	SP500	300	1787155800	7735.470000	7737.295306	7734.025936	7735.414541
535892	DOW	300	1787155800	53540.960000	53573.285727	53537.991176	53567.118320
535893	DXY	300	1787155800	98.914000	98.918874	98.888447	98.895869
536074	SP500	300	1787156100	7735.620000	7739.978055	7733.895611	7737.410978
536075	DOW	300	1787156100	53560.000000	53591.840570	53544.595403	53557.594859
536076	DXY	300	1787156100	98.890000	98.912629	98.872948	98.881126
536257	SP500	300	1787156400	7738.030000	7738.831366	7733.330858	7733.633756
536623	SP500	300	1787157000	7727.487709	7727.866243	7723.662090	7726.314417
536624	DOW	300	1787157000	53488.788517	53490.807857	53460.668851	53476.130343
536625	DXY	300	1787157000	98.891315	98.891315	98.856492	98.862071
536990	DOW	300	1787157600	53480.800000	53488.163948	53440.258722	53455.474584
536991	DXY	300	1787157600	98.878000	98.890427	98.847607	98.851102
539919	DXY	300	1787162400	98.950000	98.966228	98.937331	98.954680
538636	SP500	300	1787160300	7712.780000	7716.356137	7711.785944	7715.939710
538637	DOW	300	1787160300	53440.820000	53481.949270	53434.648216	53462.978029
538638	DXY	300	1787160300	98.904000	98.930390	98.903000	98.917902
540648	DXY	300	1787163600	98.878000	98.883229	98.846944	98.871069
539185	SP500	300	1787161200	7712.230000	7718.059045	7711.626795	7716.582498
539186	DOW	300	1787161200	53443.170000	53475.095360	53434.426916	53451.032554
538087	SP500	300	1787159400	7715.833032	7720.336605	7714.547949	7718.939942
538088	DOW	300	1787159400	53417.668973	53463.826737	53412.739797	53456.244084
538089	DXY	300	1787159400	98.865053	98.876648	98.834747	98.875120
539187	DXY	300	1787161200	98.920000	98.945842	98.905255	98.930923
536258	DOW	300	1787156400	53556.150000	53563.036097	53529.094864	53537.852049
536259	DXY	300	1787156400	98.867000	98.880622	98.846412	98.854606
539368	SP500	300	1787161500	7716.810735	7718.524650	7714.477661	7717.092826
537538	SP500	300	1787158500	7718.520000	7718.666749	7715.321346	7718.363739
537539	DOW	300	1787158500	53437.140000	53443.135581	53411.224837	53431.201572
537540	DXY	300	1787158500	98.867000	98.875441	98.843333	98.861789
536806	SP500	300	1787157300	7726.253314	7726.968027	7722.171168	7726.248834
536807	DOW	300	1787157300	53478.078809	53490.427735	53454.936254	53481.605146
536808	DXY	300	1787157300	98.863033	98.888421	98.847863	98.885018
537355	SP500	300	1787158200	7721.650000	7722.179499	7717.288392	7719.336638
537356	DOW	300	1787158200	53458.460000	53466.216225	53423.994618	53442.664288
537357	DXY	300	1787158200	98.868000	98.877286	98.852315	98.868101
536440	SP500	300	1787156700	7733.460000	7734.478569	7726.996489	7727.195149
536441	DOW	300	1787156700	53532.480000	53542.548798	53488.936448	53490.677985
536442	DXY	300	1787156700	98.860000	98.890948	98.846552	98.890948
539369	DOW	300	1787161500	53450.681947	53474.501687	53445.076197	53445.076197
539370	DXY	300	1787161500	98.931062	98.955146	98.923583	98.949871
537721	SP500	300	1787158800	7717.050000	7720.228784	7715.773288	7717.074902
537722	DOW	300	1787158800	53423.570000	53452.208696	53419.828270	53450.741555
537723	DXY	300	1787158800	98.864000	98.866904	98.838600	98.850383
537172	SP500	300	1787157900	7723.920000	7724.428499	7720.761602	7720.761602
537173	DOW	300	1787157900	53454.390000	53472.840738	53439.426292	53457.013284
537174	DXY	300	1787157900	98.857000	98.881099	98.855173	98.859518
540280	SP500	300	1787163000	7709.870000	7717.165739	7708.738293	7713.994700
540281	DOW	300	1787163000	53441.720000	53481.378146	53432.315414	53466.853174
540282	DXY	300	1787163000	98.964000	98.969771	98.885000	98.890708
539734	SP500	300	1787162100	7716.210000	7716.552966	7713.319241	7714.971000
539735	DOW	300	1787162100	53455.840000	53466.408794	53436.501313	53449.307015
539736	DXY	300	1787162100	98.942000	98.954023	98.929107	98.947434
539002	SP500	300	1787160900	7712.420000	7714.786225	7711.791392	7714.231157
538819	SP500	300	1787160600	7715.320000	7716.024436	7710.639450	7712.422491
538820	DOW	300	1787160600	53466.250000	53474.085765	53443.560651	53463.205636
538821	DXY	300	1787160600	98.914000	98.927050	98.901125	98.915243
536989	SP500	300	1787157600	7724.610000	7725.531278	7722.038435	7724.545798
537904	SP500	300	1787159100	7718.420000	7721.863886	7714.381871	7716.116263
537905	DOW	300	1787159100	53441.720000	53461.379142	53414.302706	53418.625815
537906	DXY	300	1787159100	98.847000	98.873982	98.832465	98.864654
539003	DOW	300	1787160900	53464.710000	53471.356834	53438.137337	53450.980144
539004	DXY	300	1787160900	98.913000	98.942583	98.910406	98.920475
538453	SP500	300	1787160000	7714.440000	7714.983760	7709.853587	7712.739319
538454	DOW	300	1787160000	53438.490000	53446.301045	53415.786898	53433.658891
538455	DXY	300	1787160000	98.887000	98.918461	98.878633	98.903502
538270	SP500	300	1787159700	7718.954913	7719.961084	7714.339756	7714.981234
538271	DOW	300	1787159700	53455.530306	53460.577928	53432.374093	53440.645108
538272	DXY	300	1787159700	98.873114	98.914837	98.865928	98.897576
540097	SP500	300	1787162700	7720.610000	7721.797031	7709.587582	7711.346225
540098	DOW	300	1787162700	53487.080000	53492.371190	53422.483705	53443.666271
540099	DXY	300	1787162700	98.958000	98.979328	98.951239	98.969149
539551	SP500	300	1787161800	7716.975671	7718.952122	7714.547690	7717.506216
539552	DOW	300	1787161800	53445.182874	53478.090992	53445.182874	53464.966926
539553	DXY	300	1787161800	98.950962	98.955913	98.917332	98.942156
539917	SP500	300	1787162400	7715.220000	7724.636101	7714.456695	7722.653097
539918	DOW	300	1787162400	53455.190000	53504.887954	53445.423038	53497.627688
540463	SP500	300	1787163300	7713.500000	7714.546523	7709.951409	7714.286938
540464	DOW	300	1787163300	53466.730000	53482.285850	53443.068512	53472.351527
540465	DXY	300	1787163300	98.895000	98.900728	98.868296	98.890693
540831	DXY	300	1787163900	98.872000	98.899984	98.866377	98.875143
540646	SP500	300	1787163600	7712.930000	7714.563857	7710.416422	7710.507587
540647	DOW	300	1787163600	53467.310000	53487.604756	53450.556741	53461.659415
541012	SP500	300	1787164200	7715.387712	7720.089936	7715.264082	7719.118522
541014	DXY	300	1787164200	98.876691	98.931244	98.876691	98.928964
540829	SP500	300	1787163900	7712.490000	7716.123695	7711.909188	7715.650308
540830	DOW	300	1787163900	53463.890000	53480.937900	53451.097727	53476.714288
541563	DXY	300	1787165100	98.894000	98.900202	98.856428	98.866910
541013	DOW	300	1787164200	53475.580039	53499.911848	53470.357819	53487.693834
541195	SP500	300	1787164500	7718.980005	7719.881773	7715.657937	7717.810195
541196	DOW	300	1787164500	53489.783239	53493.931274	53469.988697	53479.332727
541197	DXY	300	1787164500	98.929968	98.952912	98.925435	98.936623
541378	SP500	300	1787164800	7717.658712	7720.522548	7716.892615	7718.264697
541379	DOW	300	1787164800	53478.119592	53493.627704	53460.908435	53468.377344
541380	DXY	300	1787164800	98.934866	98.941389	98.892208	98.898235
541561	SP500	300	1787165100	7717.520000	7718.313098	7715.204756	7716.136824
541562	DOW	300	1787165100	53462.970000	53473.558629	53447.308564	53464.170929
546304	SP500	300	1787172900	7707.980000	7709.478050	7706.743309	7708.119535
545215	SP500	300	1787171100	7707.599193	7709.141011	7706.530041	7708.044717
545216	DOW	300	1787171100	53465.419218	53469.633003	53450.795151	53467.624305
545217	DXY	300	1787171100	98.802704	98.826566	98.801245	98.824069
544669	SP500	300	1787170200	7707.980000	7709.039407	7706.503931	7707.597986
544670	DOW	300	1787170200	53463.050000	53472.674118	53452.160459	53462.944363
544671	DXY	300	1787170200	98.797000	98.802033	98.781643	98.785036
541741	SP500	300	1787165400	7717.650000	7719.223826	7714.155411	7716.424769
541742	DOW	300	1787165400	53468.040000	53481.009433	53445.839939	53452.751926
541743	DXY	300	1787165400	98.864000	98.864635	98.825997	98.835291
543754	SP500	300	1787168700	7709.650000	7710.439712	7705.210000	7707.115049
543755	DOW	300	1787168700	53441.700000	53466.325930	53434.534019	53446.796667
543756	DXY	300	1787168700	98.795000	98.843675	98.790362	98.834519
542290	SP500	300	1787166300	7715.490000	7719.172777	7713.233330	7719.062552
542291	DOW	300	1787166300	53436.010000	53465.517505	53425.677448	53463.491050
542292	DXY	300	1787166300	98.826000	98.837683	98.805134	98.837683
543937	SP500	300	1787169000	7706.956142	7707.620000	7702.100527	7706.202469
543938	DOW	300	1787169000	53448.330985	53456.802882	53422.443443	53449.716355
543939	DXY	300	1787169000	98.835033	98.835033	98.812382	98.825628
543571	SP500	300	1787168400	7711.210000	7713.886493	7708.454679	7710.509382
543572	DOW	300	1787168400	53445.150000	53462.542957	53437.058533	53438.712578
543573	DXY	300	1787168400	98.793000	98.806385	98.778445	98.792169
541924	SP500	300	1787165700	7716.450000	7717.805078	7713.964213	7715.374176
541925	DOW	300	1787165700	53444.640000	53451.404266	53427.748274	53432.699969
541926	DXY	300	1787165700	98.845000	98.851479	98.827651	98.831151
542839	SP500	300	1787167200	7718.887596	7720.140744	7716.193551	7719.012902
542840	DOW	300	1787167200	53473.532900	53488.719331	53448.624968	53488.682290
542841	DXY	300	1787167200	98.817981	98.836076	98.806186	98.829570
543022	SP500	300	1787167500	7719.256186	7720.313188	7715.511480	7715.859914
543023	DOW	300	1787167500	53486.697391	53487.968768	53457.813674	53463.568142
543024	DXY	300	1787167500	98.831154	98.835698	98.803965	98.815940
542656	SP500	300	1787166900	7717.449157	7719.954207	7715.369751	7718.905980
542657	DOW	300	1787166900	53472.131014	53472.291044	53443.634792	53472.291044
542658	DXY	300	1787166900	98.850847	98.868743	98.808978	98.815581
543205	SP500	300	1787167800	7716.140000	7723.574986	7715.526865	7723.574986
543206	DOW	300	1787167800	53458.620000	53528.937705	53458.620000	53498.956588
543207	DXY	300	1787167800	98.815000	98.833452	98.800236	98.817606
542107	SP500	300	1787166000	7714.570000	7718.042268	7713.686353	7715.231243
542108	DOW	300	1787166000	53437.370000	53453.918801	53415.088467	53430.576112
542109	DXY	300	1787166000	98.829000	98.850984	98.815673	98.820792
545035	SP500	300	1787170800	7707.980000	7709.017705	7706.482364	7707.599091
542473	SP500	300	1787166600	7718.670000	7720.551620	7716.515988	7717.165639
542474	DOW	300	1787166600	53460.660000	53483.463845	53456.871061	53473.746919
542475	DXY	300	1787166600	98.833000	98.852437	98.822331	98.851146
545036	DOW	300	1787170800	53463.050000	53471.478183	53455.897369	53465.987762
545037	DXY	300	1787170800	98.795000	98.820568	98.789104	98.803148
544303	SP500	300	1787169600	7705.577551	7709.856471	7705.577551	7709.457284
544304	DOW	300	1787169600	53431.062741	53483.565110	53431.062741	53466.918087
544305	DXY	300	1787169600	98.823096	98.843094	98.792852	98.805665
544852	SP500	300	1787170500	7707.980000	7709.635333	7706.559557	7708.240931
544853	DOW	300	1787170500	53463.050000	53473.974512	53454.556439	53461.080179
544120	SP500	300	1787169300	7706.179730	7709.180000	7701.465326	7705.382320
544121	DOW	300	1787169300	53449.931886	53458.800000	53410.424402	53431.778878
544122	DXY	300	1787169300	98.826297	98.844226	98.820295	98.824896
543388	SP500	300	1787168100	7721.280000	7721.728680	7711.829404	7713.208080
543389	DOW	300	1787168100	53508.760000	53515.125988	53440.978198	53449.200845
543390	DXY	300	1787168100	98.815000	98.830552	98.781135	98.788018
544486	SP500	300	1787169900	7708.040000	7709.453351	7706.760830	7708.591698
544487	DOW	300	1787169900	53463.050000	53473.707041	53455.845234	53461.761668
544488	DXY	300	1787169900	98.802000	98.813961	98.777757	98.788328
544854	DXY	300	1787170500	98.791000	98.808528	98.786076	98.804416
546121	SP500	300	1787172600	7708.604864	7709.246252	7706.450192	7708.090542
546122	DOW	300	1787172600	53460.783471	53475.168701	53449.242417	53469.925049
546305	DOW	300	1787172900	53463.050000	53475.260219	53445.955606	53463.994338
546306	DXY	300	1787172900	98.790000	98.806460	98.779189	98.799103
545755	SP500	300	1787172000	7708.755541	7709.975148	7706.421263	7707.726959
545756	DOW	300	1787172000	53464.452348	53468.466321	53449.289922	53460.388614
545395	SP500	300	1787171400	7708.011902	7709.121486	7706.367069	7707.338582
545396	DOW	300	1787171400	53467.605770	53475.848166	53450.663890	53464.763977
545397	DXY	300	1787171400	98.822341	98.823551	98.799170	98.811252
545757	DXY	300	1787172000	98.820530	98.826741	98.798000	98.798055
545575	SP500	300	1787171700	7707.214512	7709.485191	7706.675983	7708.678190
545576	DOW	300	1787171700	53463.253168	53473.713804	53452.823324	53463.998384
545577	DXY	300	1787171700	98.811703	98.829292	98.799577	98.822852
545938	SP500	300	1787172300	7708.034112	7709.305348	7706.181187	7708.677136
546487	SP500	300	1787173200	7707.980000	7709.260725	7706.284581	7707.049395
546123	DXY	300	1787172600	98.794764	98.806011	98.779469	98.786094
545939	DOW	300	1787172300	53462.202736	53472.193053	53453.999497	53461.823004
545940	DXY	300	1787172300	98.796731	98.815145	98.790274	98.796215
546488	DOW	300	1787173200	53463.050000	53470.871591	53451.048091	53464.560813
546489	DXY	300	1787173200	98.785000	98.796831	98.778396	98.778721
546670	SP500	300	1787173500	7707.980000	7709.130199	7706.462031	7707.300818
546671	DOW	300	1787173500	53463.050000	53470.011749	53454.958836	53462.580188
546672	DXY	300	1787173500	98.789000	98.805355	98.781173	98.791208
546853	SP500	300	1787173800	7707.980000	7709.040246	7706.915911	7707.589084
546854	DOW	300	1787173800	53463.050000	53475.008663	53452.086808	53460.135561
546855	DXY	300	1787173800	98.797000	98.810304	98.781689	98.790288
547036	SP500	300	1787174100	7707.451149	7709.061876	7707.073064	7707.765343
547037	DOW	300	1787174100	53458.039992	53474.661222	53448.834725	53454.856532
548861	DOW	300	1787177100	53462.105723	53470.678051	53449.998762	53461.019628
548862	DXY	300	1787177100	98.780185	98.805218	98.774093	98.791537
551231	DOW	300	1787181000	53458.278782	53473.411520	53450.687488	53463.430667
551232	DXY	300	1787181000	98.765761	98.780978	98.757932	98.766023
549775	SP500	300	1787178600	7708.232530	7709.098955	7706.490127	7708.211064
549776	DOW	300	1787178600	53477.990450	53477.990450	53453.085131	53454.201565
549777	DXY	300	1787178600	98.769668	98.778541	98.758166	98.773723
547768	SP500	300	1787175300	7708.705282	7709.576266	7706.652948	7708.409699
547769	DOW	300	1787175300	53468.662962	53471.814937	53452.971501	53465.261674
547770	DXY	300	1787175300	98.794473	98.808726	98.785453	98.791749
549592	SP500	300	1787178300	7707.980000	7709.491277	7706.673885	7708.266296
547402	SP500	300	1787174700	7707.340429	7709.311481	7706.629998	7707.535429
547403	DOW	300	1787174700	53467.063149	53477.188435	53451.754922	53465.443362
547404	DXY	300	1787174700	98.802184	98.807768	98.788243	98.794679
549593	DOW	300	1787178300	53463.050000	53476.693990	53450.820050	53476.693990
549594	DXY	300	1787178300	98.768000	98.777553	98.750007	98.770725
548311	SP500	300	1787176200	7707.980000	7709.269145	7706.592710	7709.037499
548312	DOW	300	1787176200	53463.050000	53474.661133	53456.107573	53460.368138
548313	DXY	300	1787176200	98.801000	98.810266	98.789543	98.804980
548494	SP500	300	1787176500	7708.789655	7709.412520	7706.531688	7706.531688
548495	DOW	300	1787176500	53461.317052	53474.314253	53454.668737	53459.694815
548496	DXY	300	1787176500	98.804887	98.804887	98.785822	98.789626
548128	SP500	300	1787175900	7707.980000	7709.414621	7706.112725	7708.738962
548129	DOW	300	1787175900	53463.050000	53473.773989	53453.440543	53462.786482
548130	DXY	300	1787175900	98.798000	98.811430	98.787187	98.806730
551050	SP500	300	1787180700	7707.955653	7709.180205	7706.896569	7708.087037
551051	DOW	300	1787180700	53465.005921	53473.990717	53452.003146	53460.030095
551052	DXY	300	1787180700	98.764091	98.780088	98.756786	98.764411
550870	SP500	300	1787180400	7708.137932	7709.182349	7706.578181	7707.941050
550141	SP500	300	1787179200	7707.889751	7709.113161	7706.342954	7707.615503
550142	DOW	300	1787179200	53468.871109	53469.723528	53451.054347	53462.491977
547585	SP500	300	1787175000	7707.803585	7709.212916	7706.440989	7708.470494
547586	DOW	300	1787175000	53465.549154	53474.170897	53458.201122	53469.770254
547587	DXY	300	1787175000	98.792239	98.810128	98.788358	98.796329
547038	DXY	300	1787174100	98.790707	98.812897	98.783006	98.789774
550143	DXY	300	1787179200	98.770243	98.775584	98.760167	98.766969
549226	SP500	300	1787177700	7709.801838	7709.801838	7707.017446	7708.406192
549227	DOW	300	1787177700	53467.306073	53470.222460	53455.958217	53463.070055
549228	DXY	300	1787177700	98.762767	98.780267	98.760751	98.767454
547948	SP500	300	1787175600	7708.201502	7709.679912	7706.899803	7708.583887
547949	DOW	300	1787175600	53467.043718	53468.984375	53454.164882	53465.729338
547950	DXY	300	1787175600	98.793866	98.814151	98.788777	98.798120
547219	SP500	300	1787174400	7707.936326	7709.307968	7706.705806	7707.274472
547220	DOW	300	1787174400	53454.127506	53470.245591	53449.849288	53465.814501
547221	DXY	300	1787174400	98.788272	98.814395	98.785244	98.804256
548677	SP500	300	1787176800	7706.223805	7709.798629	7706.223805	7707.633703
548678	DOW	300	1787176800	53458.969559	53471.296647	53454.956760	53461.036641
548679	DXY	300	1787176800	98.788419	98.809105	98.777793	98.781469
549043	SP500	300	1787177400	7708.292845	7709.529372	7706.734556	7709.529372
549044	DOW	300	1787177400	53461.856202	53471.170586	53454.817993	53465.774361
549045	DXY	300	1787177400	98.793237	98.800643	98.761189	98.764019
549958	SP500	300	1787178900	7708.316686	7708.991717	7706.056463	7708.018165
549959	DOW	300	1787178900	53453.843289	53472.190668	53453.843289	53467.034336
549960	DXY	300	1787178900	98.775884	98.778372	98.758150	98.769135
549409	SP500	300	1787178000	7708.534635	7709.290792	7706.170889	7707.383668
549410	DOW	300	1787178000	53464.917455	53471.831189	53451.137232	53461.180278
549411	DXY	300	1787178000	98.766971	98.779329	98.758005	98.758350
550871	DOW	300	1787180400	53466.648002	53475.690138	53453.425734	53463.487970
550872	DXY	300	1787180400	98.766851	98.777940	98.754519	98.765870
548860	SP500	300	1787177100	7707.603035	7709.765741	7706.517960	7708.049779
550687	SP500	300	1787180100	7707.703282	7708.778373	7706.941660	7707.839055
550688	DOW	300	1787180100	53464.675531	53471.515075	53452.116898	53466.563737
550689	DXY	300	1787180100	98.771055	98.778898	98.756317	98.768304
550324	SP500	300	1787179500	7707.429165	7709.293173	7706.436062	7707.720718
550325	DOW	300	1787179500	53460.916638	53469.537696	53453.012001	53457.453168
550326	DXY	300	1787179500	98.768527	98.777610	98.751834	98.775645
550507	SP500	300	1787179800	7707.909113	7709.470543	7706.683762	7707.930001
550508	DOW	300	1787179800	53458.804237	53471.243597	53454.732363	53463.163222
550509	DXY	300	1787179800	98.774206	98.779144	98.758583	98.770910
551411	DOW	300	1787181300	53464.905058	53472.474112	53453.080405	53464.319714
551412	DXY	300	1787181300	98.766324	98.780654	98.757645	98.767057
551594	DOW	300	1787181600	53463.409870	53472.562517	53454.232728	53462.922140
551230	SP500	300	1787181000	7707.991585	7709.121762	7706.536580	7707.767571
551595	DXY	300	1787181600	98.768542	98.784638	98.759415	98.769830
551777	DOW	300	1787181900	53461.908235	53474.028778	53453.561370	53462.256511
551410	SP500	300	1787181300	7707.778839	7709.409971	7706.603646	7707.909032
551959	SP500	300	1787182200	7708.073756	7709.107431	7706.485167	7707.924692
551593	SP500	300	1787181600	7708.066173	7709.181314	7706.740031	7707.700512
551776	SP500	300	1787181900	7707.682124	7709.310600	7706.703814	7707.878267
551778	DXY	300	1787181900	98.772100	98.775323	98.757722	98.767823
551960	DOW	300	1787182200	53462.639927	53472.216841	53453.798776	53460.262452
551961	DXY	300	1787182200	98.768445	98.777063	98.758395	98.767297
552142	SP500	300	1787182500	7707.998567	7710.037933	7706.540973	7708.325514
552143	DOW	300	1787182500	53462.281331	53471.667396	53457.182029	53464.765643
552144	DXY	300	1787182500	98.768261	98.778826	98.752438	98.771611
552325	SP500	300	1787182800	7708.616819	7709.108575	7706.437995	7707.957060
552326	DOW	300	1787182800	53464.177534	53473.455590	53453.243179	53460.852829
552327	DXY	300	1787182800	98.772289	98.784078	98.756518	98.764975
552508	SP500	300	1787183100	7707.972361	7709.483532	7706.825469	7707.809044
554155	SP500	300	1787185800	7707.873826	7709.147405	7705.825773	7707.687088
554156	DOW	300	1787185800	53464.100147	53472.680310	53445.132263	53462.002671
554157	DXY	300	1787185800	98.801613	98.843792	98.796940	98.833670
552874	SP500	300	1787183700	7707.558448	7709.397131	7706.978666	7707.745720
552875	DOW	300	1787183700	53459.703666	53472.258595	53450.987856	53464.639053
552876	DXY	300	1787183700	98.769821	98.845683	98.766633	98.832800
553240	SP500	300	1787184300	7708.400609	7709.444886	7706.872933	7707.853055
553241	DOW	300	1787184300	53460.598658	53471.912270	53454.494706	53463.792629
553242	DXY	300	1787184300	98.832014	98.849392	98.825277	98.828283
557262	DXY	300	1787190900	98.823656	98.857262	98.816140	98.853481
555067	SP500	300	1787187300	7708.052189	7709.467632	7706.628874	7707.992846
555068	DOW	300	1787187300	53463.510367	53477.331448	53455.945686	53462.634345
555069	DXY	300	1787187300	98.839375	98.860414	98.830697	98.850495
554704	SP500	300	1787186700	7707.934059	7709.274516	7706.379870	7707.834923
554521	SP500	300	1787186400	7708.314062	7709.488761	7706.059531	7708.120069
554522	DOW	300	1787186400	53463.583352	53473.156617	53453.852654	53464.992537
554523	DXY	300	1787186400	98.832435	98.838252	98.804295	98.823598
554705	DOW	300	1787186700	53464.987579	53469.443634	53454.848368	53463.382878
554706	DXY	300	1787186700	98.825476	98.837591	98.809995	98.829061
552509	DOW	300	1787183100	53458.860967	53472.268732	53454.656180	53461.054000
552510	DXY	300	1787183100	98.765331	98.780780	98.758361	98.770000
555250	SP500	300	1787187600	7708.200398	7709.151810	7707.131533	7708.112605
555251	DOW	300	1787187600	53463.657900	53472.813112	53454.386630	53461.431702
555252	DXY	300	1787187600	98.850443	98.869950	98.843563	98.851529
553057	SP500	300	1787184000	7707.871228	7709.040724	7706.458989	7708.158629
553058	DOW	300	1787184000	53465.968664	53474.287372	53454.246447	53461.818095
553059	DXY	300	1787184000	98.834508	98.846638	98.817407	98.830282
554338	SP500	300	1787186100	7707.979070	7709.700728	7706.671513	7708.265762
554339	DOW	300	1787186100	53462.571983	53474.867016	53454.963192	53465.137643
554340	DXY	300	1787186100	98.834468	98.846546	98.824433	98.831112
553789	SP500	300	1787185200	7708.529001	7709.910270	7706.482838	7708.213821
553790	DOW	300	1787185200	53464.947702	53472.323334	53453.456977	53462.901473
553791	DXY	300	1787185200	98.837049	98.845827	98.810984	98.817515
552691	SP500	300	1787183400	7708.063085	7709.858125	7706.270675	7707.685811
552692	DOW	300	1787183400	53461.292493	53469.886472	53452.339049	53461.215752
552693	DXY	300	1787183400	98.769423	98.778796	98.759253	98.770323
553606	SP500	300	1787184900	7707.808245	7709.079745	7706.473138	7708.228144
553607	DOW	300	1787184900	53464.908670	53472.918673	53454.341983	53464.316164
553608	DXY	300	1787184900	98.787521	98.837527	98.783612	98.835536
553423	SP500	300	1787184600	7707.738223	7709.510134	7706.238187	7707.845121
553424	DOW	300	1787184600	53465.159157	53469.685858	53451.713665	53464.009957
553425	DXY	300	1787184600	98.828099	98.828476	98.776111	98.788605
556894	SP500	300	1787190300	7708.018385	7709.314820	7706.937319	7707.842845
556531	SP500	300	1787189700	7708.335520	7709.882163	7706.752453	7708.176080
556532	DOW	300	1787189700	53465.404484	53473.126358	53452.343072	53460.983888
553972	SP500	300	1787185500	7708.202308	7709.507146	7706.673538	7708.037623
553973	DOW	300	1787185500	53461.654191	53471.211618	53452.945982	53462.198876
553974	DXY	300	1787185500	98.817672	98.831356	98.783850	98.802710
554887	SP500	300	1787187000	7707.670104	7709.875121	7706.504292	7708.306616
554888	DOW	300	1787187000	53462.054487	53474.132954	53453.150337	53463.651760
554889	DXY	300	1787187000	98.829328	98.846417	98.819958	98.837994
556533	DXY	300	1787189700	98.813477	98.832943	98.798810	98.807226
555799	SP500	300	1787188500	7707.754811	7709.003269	7706.734254	7708.151876
555800	DOW	300	1787188500	53461.347358	53472.318724	53450.362817	53462.864093
555801	DXY	300	1787188500	98.881968	98.897461	98.868198	98.870956
556348	SP500	300	1787189400	7708.000946	7709.241909	7706.212675	7708.178396
556349	DOW	300	1787189400	53461.583554	53472.717412	53453.408993	53463.437382
556350	DXY	300	1787189400	98.835979	98.841071	98.814970	98.814970
555433	SP500	300	1787187900	7707.984647	7709.284169	7706.495920	7707.808369
555434	DOW	300	1787187900	53460.082678	53477.712247	53452.884334	53463.305300
555435	DXY	300	1787187900	98.851029	98.855814	98.828229	98.844477
555616	SP500	300	1787188200	7707.797537	7709.949541	7706.575564	7707.707496
555617	DOW	300	1787188200	53463.895291	53471.638623	53453.015923	53460.913982
555618	DXY	300	1787188200	98.846914	98.883435	98.842723	98.880131
556895	DOW	300	1787190300	53460.890701	53472.735250	53452.256492	53461.633791
556896	DXY	300	1787190300	98.806211	98.810000	98.787865	98.804508
556165	SP500	300	1787189100	7708.121826	7709.050255	7706.854307	7707.893294
556166	DOW	300	1787189100	53465.220136	53474.174131	53452.201160	53461.015990
555982	SP500	300	1787188800	7707.846288	7709.110098	7706.624584	7708.006652
555983	DOW	300	1787188800	53461.745732	53476.573434	53454.895881	53464.703018
556167	DXY	300	1787189100	98.863164	98.872399	98.836000	98.837523
556711	SP500	300	1787190000	7708.210949	7709.221384	7706.787561	7707.833955
555984	DXY	300	1787188800	98.870090	98.894999	98.858884	98.864778
556712	DOW	300	1787190000	53461.130177	53472.980943	53450.073503	53462.483064
556713	DXY	300	1787190000	98.805974	98.832092	98.783314	98.804291
557077	SP500	300	1787190600	7707.985855	7708.965577	7706.516836	7707.729033
557078	DOW	300	1787190600	53461.918961	53472.154569	53452.752025	53463.439930
557261	DOW	300	1787190900	53462.454355	53472.937360	53452.332276	53466.122571
557260	SP500	300	1787190900	7707.814130	7708.854609	7707.095186	7708.055218
557079	DXY	300	1787190600	98.804741	98.826122	98.798376	98.826122
557443	SP500	300	1787191200	7707.774610	7709.578101	7707.017747	7707.950363
557444	DOW	300	1787191200	53467.906978	53474.945335	53455.222951	53461.117734
557445	DXY	300	1787191200	98.852088	98.863875	98.841316	98.854895
557626	SP500	300	1787191500	7707.989685	7709.195870	7706.527868	7708.154971
557627	DOW	300	1787191500	53459.780514	53472.260261	53450.173664	53461.900972
557628	DXY	300	1787191500	98.856960	98.861222	98.831053	98.837696
557809	SP500	300	1787191800	7707.892873	7709.377393	7706.567028	7708.285014
557810	DOW	300	1787191800	53461.464226	53470.050480	53455.597287	53464.872396
557811	DXY	300	1787191800	98.836100	98.845328	98.780000	98.798786
557992	SP500	300	1787192100	7708.395049	7709.310960	7706.390102	7707.724423
557993	DOW	300	1787192100	53463.262991	53469.069237	53455.294106	53463.036877
557994	DXY	300	1787192100	98.799733	98.822000	98.778132	98.821614
558541	SP500	300	1787193000	7707.876400	7709.530110	7705.907528	7708.160737
558542	DOW	300	1787193000	53464.028094	53477.745698	53451.828399	53464.263391
558543	DXY	300	1787193000	98.849954	98.873243	98.829824	98.844354
558175	SP500	300	1787192400	7707.491714	7709.645551	7706.850128	7708.225692
558176	DOW	300	1787192400	53463.801410	53476.852579	53451.445924	53464.944160
558177	DXY	300	1787192400	98.821464	98.840320	98.814289	98.828303
559090	SP500	300	1787193900	7707.825321	7709.252017	7706.709276	7707.825399
559091	DOW	300	1787193900	53465.330868	53470.912249	53453.781034	53465.031632
559092	DXY	300	1787193900	98.842362	98.859256	98.826797	98.835620
559273	SP500	300	1787194200	7707.747100	7709.067228	7706.346750	7708.176045
559274	DOW	300	1787194200	53466.554660	53476.177989	53450.852145	53464.022759
559275	DXY	300	1787194200	98.833690	98.848916	98.806337	98.834462
558907	SP500	300	1787193600	7707.901850	7709.895188	7706.637601	7707.958771
558908	DOW	300	1787193600	53463.454851	53472.927105	53452.796475	53464.804609
558909	DXY	300	1787193600	98.841040	98.846948	98.830760	98.839909
558358	SP500	300	1787192700	7708.369336	7709.327493	7706.631170	7708.097881
558359	DOW	300	1787192700	53465.818477	53472.458866	53453.280722	53464.768380
558360	DXY	300	1787192700	98.826732	98.855999	98.824627	98.852187
559456	SP500	300	1787194500	7708.295560	7709.314552	7707.078021	7707.727629
559457	DOW	300	1787194500	53463.638863	53470.902747	53452.919147	53460.039674
559458	DXY	300	1787194500	98.835189	98.853379	98.820203	98.847228
558724	SP500	300	1787193300	7707.904993	7709.390061	7707.082311	7708.186625
558725	DOW	300	1787193300	53465.782426	53471.140673	53451.837266	53463.561781
558726	DXY	300	1787193300	98.842345	98.849864	98.830903	98.842709
\.


--
-- Data for Name: inquiries; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.inquiries (id, user_id, title, content, reply, status, replied_by, replied_at, is_reply_read, created_at) FROM stdin;
11	91d27d59-645a-40d4-ae60-f2109c29d5dd	입금계좌 안내 요청	입금계좌 정보를 안내해 주세요.	안녕하세요 RD index 거래소 입니다.\n\n문의하신 거래소 전용입금계좌 안내드립니다.\n\n매 입금 시 불편하시더라도 입금 전 항시 계좌 발급 부탁드립니다\n\n▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒ \n\n은행명 : 우리은행\n\n계좌번호 : 724-247638-02-001\n\n예금주 : 주식회사 RD / 사내이사 엄태기\n\n▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒\n\n안내 받으신 계좌로 입금을 먼저 하신 후 입금신청 바랍니다.\n\n저희 RD index 거래소를 이용해주셔서 감사드립니다.	answered	f4a21243-eb2a-498e-bd25-46b1f19640cf	2026-08-13 06:46:46.056	t	2026-08-13 06:46:28.858725
7	e50051bc-006a-43f5-88d8-a08f020b08be	입금계좌 안내 요청	입금계좌 정보를 안내해 주세요.	안녕하세요 RD index 거래소 입니다.\n\n문의하신 거래소 전용입금계좌 안내드립니다.\n\n매 입금 시 불편하시더라도 입금 전 항시 계좌 발급 부탁드립니다\n\n▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒ \n\n은행명 : 우리은행\n\n계좌번호 : 724-247638-02-001\n\n예금주 : 주식회사 RD / 사내이사 엄태기\n\n▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒\n\n안내 받으신 계좌로 입금을 먼저 하신 후 입금신청 바랍니다.\n\n저희 RD index 거래소를 이용해주셔서 감사드립니다.	answered	f4a21243-eb2a-498e-bd25-46b1f19640cf	2026-08-12 08:48:37.556	t	2026-08-12 08:48:29.148473
10	0c668b3d-7007-4164-bd7b-16b7521832d5	입금계좌 안내 요청	입금계좌 정보를 안내해 주세요.	안녕하세요 RD index 거래소 입니다.\n\n문의하신 거래소 전용입금계좌 안내드립니다.\n\n매 입금 시 불편하시더라도 입금 전 항시 계좌 발급 부탁드립니다\n\n▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒ \n\n은행명 : 우리은행\n\n계좌번호 : 724-247638-02-001\n\n예금주 : 주식회사 RD / 사내이사 엄태기\n\n▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒\n\n안내 받으신 계좌로 입금을 먼저 하신 후 입금신청 바랍니다.\n\n저희 RD index 거래소를 이용해주셔서 감사드립니다.	answered	f4a21243-eb2a-498e-bd25-46b1f19640cf	2026-08-13 04:02:47.57	t	2026-08-13 04:02:39.340631
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
1	c84ca9f9-1efe-4ff4-a37d-ff9c3237b279	111	45.67.97.163	Mozilla/5.0 (Linux; Android 15; Pixel 9) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Mobile Safari/537.36	2026-08-10 00:57:51.317132
93	c84ca9f9-1efe-4ff4-a37d-ff9c3237b279	111	138.199.39.138	Mozilla/5.0 (Linux; Android 13; SM-G981B) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Mobile Safari/537.36	2026-08-10 01:31:46.451739
94	b74441c4-1858-43f0-afdc-fbfec02ce9d5	qwer123	45.67.97.163	Mozilla/5.0 (Linux; Android 15; Pixel 9) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Mobile Safari/537.36	2026-08-10 01:32:15.790852
95	691e57e6-502e-447d-ae4e-aa275486ee4c	demo	146.70.201.249	Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:153.0) Gecko/20100101 Firefox/153.0	2026-08-11 05:05:45.192692
96	c84ca9f9-1efe-4ff4-a37d-ff9c3237b279	111	45.67.97.145	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36	2026-08-11 05:06:49.648622
97	e50051bc-006a-43f5-88d8-a08f020b08be	sus769	115.138.247.32	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/151.0.0.0 Safari/537.36 Edg/151.0.0.0	2026-08-11 08:41:02.027325
98	c7e79594-f2d6-4e77-9b0c-aa76152c99b4	goldmoon97	125.182.229.203	Mozilla/5.0 (Linux; Android 16; SM-S938N Build/BP4A.251205.006; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/151.0.7922.83 Mobile Safari/537.36 KAKAOTALK/26.6.3 (INAPP)	2026-08-12 00:37:23.974236
99	e50051bc-006a-43f5-88d8-a08f020b08be	sus769	115.138.247.32	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/151.0.0.0 Safari/537.36 Edg/151.0.0.0	2026-08-12 01:03:05.22254
100	e50051bc-006a-43f5-88d8-a08f020b08be	sus769	115.138.247.32	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/151.0.0.0 Safari/537.36 Edg/151.0.0.0	2026-08-12 01:22:38.018828
101	5b3baca7-faec-4eae-b258-09eda7c3fade	self571	211.37.24.214	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/151.0.0.0 Safari/537.36	2026-08-12 05:01:40.011872
102	e50051bc-006a-43f5-88d8-a08f020b08be	sus769	115.138.247.32	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/151.0.0.0 Safari/537.36 Edg/151.0.0.0	2026-08-12 08:59:48.331923
103	5a42c2f5-b8d9-440c-aa5d-4c35670cd3f6	kmg	219.241.217.126	Mozilla/5.0 (Linux; Android 16; SM-A256N Build/BP4A.251205.006; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/150.0.7871.183 Mobile Safari/537.36 KAKAOTALK/26.6.3 (INAPP)	2026-08-12 11:05:17.23704
104	e50051bc-006a-43f5-88d8-a08f020b08be	sus769	115.138.247.32	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/151.0.0.0 Safari/537.36 Edg/151.0.0.0	2026-08-13 01:02:15.419776
105	0c668b3d-7007-4164-bd7b-16b7521832d5	odh0803	117.111.12.146	Mozilla/5.0 (Linux; Android 14; SM-A235N Build/UP1A.231005.007; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/150.0.7871.181 Mobile Safari/537.36 KAKAOTALK/26.7.0 (INAPP)	2026-08-13 01:49:47.982239
106	91d27d59-645a-40d4-ae60-f2109c29d5dd	kys3442 	118.235.73.80	Mozilla/5.0 (Linux; Android 16; SM-S928N Build/BP4A.251205.006; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/150.0.7871.181 Mobile Safari/537.36 KAKAOTALK/26.7.0 (INAPP)	2026-08-13 06:40:42.361082
107	e50051bc-006a-43f5-88d8-a08f020b08be	sus769	211.36.153.20	Mozilla/5.0 (Linux; Android 16; SM-A166L Build/BP2A.250605.031.A3; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/150.0.7871.181 Mobile Safari/537.36 KAKAOTALK/25.9.2 (INAPP)	2026-08-14 01:11:01.567481
108	bcac8549-04e1-4907-b9cc-062a4fc62f12	lyh8496	59.1.101.182	Mozilla/5.0 (iPhone; CPU iPhone OS 18_7 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Mobile/15E148 Safari/604.1 KAKAOTALK/26.6.5 (INAPP)	2026-08-14 01:34:06.065126
109	e50051bc-006a-43f5-88d8-a08f020b08be	sus769	115.138.247.32	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/151.0.0.0 Safari/537.36 Edg/151.0.0.0	2026-08-14 02:17:42.453481
110	bcac8549-04e1-4907-b9cc-062a4fc62f12	lyh8496	146.70.201.223	Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:153.0) Gecko/20100101 Firefox/153.0	2026-08-14 06:10:01.908089
111	c84ca9f9-1efe-4ff4-a37d-ff9c3237b279	111	45.67.97.18	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36	2026-08-14 06:15:18.262444
112	0c668b3d-7007-4164-bd7b-16b7521832d5	odh0803	117.111.12.132	Mozilla/5.0 (Linux; Android 14; SM-A235N Build/UP1A.231005.007; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/150.0.7871.181 Mobile Safari/537.36 KAKAOTALK/26.7.0 (INAPP)	2026-08-14 06:18:38.266893
113	b74441c4-1858-43f0-afdc-fbfec02ce9d5	qwer123	45.67.97.163	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36	2026-08-14 06:19:39.754604
114	c84ca9f9-1efe-4ff4-a37d-ff9c3237b279	111	138.199.39.138	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36	2026-08-14 06:20:11.5639
115	91d27d59-645a-40d4-ae60-f2109c29d5dd	kys3442 	118.235.13.101	Mozilla/5.0 (Linux; Android 16; SM-S928N Build/BP4A.251205.006; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/150.0.7871.181 Mobile Safari/537.36 KAKAOTALK/26.7.1 (INAPP)	2026-08-14 06:49:31.869086
116	e50051bc-006a-43f5-88d8-a08f020b08be	sus769	115.138.247.32	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/151.0.0.0 Safari/537.36 Edg/151.0.0.0	2026-08-14 07:12:05.62112
117	a2507d2e-6260-4732-b4b4-6252676ec3ce	zmkm4050	117.111.8.201	Mozilla/5.0 (Linux; Android 16; SM-F966N Build/BP4A.251205.006; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/150.0.7871.181 Mobile Safari/537.36 KAKAOTALK/26.6.3 (INAPP)	2026-08-14 07:25:13.687251
118	b74441c4-1858-43f0-afdc-fbfec02ce9d5	qwer123	45.67.97.77	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36	2026-08-14 07:25:18.502318
119	e50051bc-006a-43f5-88d8-a08f020b08be	sus769	115.138.247.32	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/151.0.0.0 Safari/537.36 Edg/151.0.0.0	2026-08-14 23:28:07.1924
120	e50051bc-006a-43f5-88d8-a08f020b08be	sus769	115.138.247.32	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/151.0.0.0 Safari/537.36 Edg/151.0.0.0	2026-08-18 00:50:24.152699
121	c84ca9f9-1efe-4ff4-a37d-ff9c3237b279	111	45.67.97.61	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36	2026-08-19 01:33:27.908329
122	97b36905-f052-4d86-90cf-30a4ed8252b2	y018240	115.139.46.37	Mozilla/5.0 (Linux; Android 15; SM-F926N Build/AP3A.240905.015.A2; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/150.0.7871.181 Mobile Safari/537.36 KAKAOTALK/26.7.1 (INAPP)	2026-08-19 04:13:40.453459
123	e50051bc-006a-43f5-88d8-a08f020b08be	sus769	115.138.247.32	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/151.0.0.0 Safari/537.36 Edg/151.0.0.0	2026-08-19 06:47:15.133258
124	770c2e29-60bc-4019-a913-36e31b40df99	purplelyr	106.101.200.191	Mozilla/5.0 (Linux; Android 16; SM-F766N Build/BP4A.251205.006; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/150.0.7871.181 Mobile Safari/537.36 KAKAOTALK/26.7.1 (INAPP)	2026-08-19 07:12:27.987714
125	e50051bc-006a-43f5-88d8-a08f020b08be	sus769	115.138.247.32	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/151.0.0.0 Safari/537.36 Edg/151.0.0.0	2026-08-19 07:17:56.834718
126	e50051bc-006a-43f5-88d8-a08f020b08be	sus769	115.138.247.32	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/151.0.0.0 Safari/537.36 Edg/151.0.0.0	2026-08-20 01:35:28.608035
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
1	f4a21243-eb2a-498e-bd25-46b1f19640cf	c84ca9f9-1efe-4ff4-a37d-ff9c3237b279	거래소 도메인 변경 안내	기존 RD 거래소는 해외 기반 거래소로서 국내 서비스 확대 및 한국거래소와의 제휴에 따라 KDI INDEX KOREA(케이디아이 인덱스 코리아)​로 변경되었습니다.\n\n사전에 공지드린 내용과 같이 서비스 이전에 따라 기존 RD 도메인은 더 이상 접속되지 않습니다.\n\n앞으로는 새롭게 변경된 KDI INDEX KOREA 공식 도메인을 통해 접속해 주시기 바랍니다.\n\n기존 이용 고객님의 서비스 이용 정보는 이전 절차에 따라 적용되며, 접속과 이용에 불편이 있으신 경우 고객센터로 문의해 주시면 확인 후 안내드리겠습니다.\n\n[변경 안내]\n\n기존 명칭 : RD-INDEX \n변경 명칭 : KDI-INDEX KOREA\n\n신규 도메인 : KDI-index.com\n\n사전에 안내드린 변경 사항이오니 착오 없으시길 바라며 변경 사항은 금일 15시부터 적용 예정입니다.\n\n앞으로는 반드시 변경된 공식 도메인을 이용해 주시기 바랍니다.\n\n감사합니다.	t	2026-08-14 05:06:34.589146	f
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
271	SP500	300	122	display_down	2026-08-10	2026-08-10 01:09:41.010824
272	SP500	300	163	display_up	2026-08-10	2026-08-10 04:05:41.654767
273	SP500	300	164	display_up	2026-08-10	2026-08-10 04:05:43.789374
274	SP500	300	165	display_down	2026-08-10	2026-08-10 04:05:46.225598
277	SP500	300	195	display_down	2026-08-10	2026-08-10 06:12:03.650938
278	SP500	300	194	display_down	2026-08-10	2026-08-10 06:12:35.276739
13	SP500	300	115	display_down	2026-08-10	2026-08-10 00:31:16.674893
14	SP500	300	116	display_down	2026-08-10	2026-08-10 00:31:34.425197
279	SP500	300	193	display_up	2026-08-10	2026-08-10 06:12:37.337753
280	SP500	300	127	display_down	2026-08-11	2026-08-11 01:00:05.256804
282	SP500	300	128	display_up	2026-08-11	2026-08-11 01:00:12.495768
283	SP500	300	129	display_down	2026-08-11	2026-08-11 01:00:14.698931
286	SP500	300	131	display_down	2026-08-11	2026-08-11 01:32:17.612156
287	SP500	300	132	display_down	2026-08-11	2026-08-11 01:32:19.90235
288	SP500	300	193	display_up	2026-08-11	2026-08-11 06:28:32.983912
289	SP500	300	194	display_up	2026-08-11	2026-08-11 06:28:36.257418
290	SP500	300	195	display_up	2026-08-11	2026-08-11 06:28:38.959589
291	SP500	300	127	display_up	2026-08-12	2026-08-12 00:56:11.818396
292	SP500	300	128	display_down	2026-08-12	2026-08-12 00:56:15.144428
293	SP500	300	129	display_up	2026-08-12	2026-08-12 00:56:18.473859
294	SP500	300	193	display_down	2026-08-12	2026-08-12 06:23:00.228928
295	SP500	300	194	display_down	2026-08-12	2026-08-12 06:23:03.772951
296	SP500	300	195	display_up	2026-08-12	2026-08-12 06:23:06.081943
297	SP500	300	219	display_down	2026-08-12	2026-08-12 09:11:49.891877
298	SP500	300	127	display_up	2026-08-13	2026-08-13 00:53:45.097229
299	SP500	300	128	display_up	2026-08-13	2026-08-13 00:53:48.244076
36	SP500	300	127	display_up	2026-08-10	2026-08-10 00:41:04.937447
300	SP500	300	129	display_down	2026-08-13	2026-08-13 00:53:50.657595
301	SP500	300	162	display_down	2026-08-13	2026-08-13 04:25:53.19476
39	SP500	300	128	display_up	2026-08-10	2026-08-10 00:41:23.876396
303	SP500	300	194	display_up	2026-08-13	2026-08-13 06:38:30.587301
304	SP500	300	195	display_up	2026-08-13	2026-08-13 06:38:33.210759
305	SP500	300	193	display_up	2026-08-13	2026-08-13 07:00:21.032389
306	SP500	300	127	display_down	2026-08-14	2026-08-14 00:46:59.432721
307	SP500	300	128	display_up	2026-08-14	2026-08-14 00:47:01.190651
308	SP500	300	129	display_down	2026-08-14	2026-08-14 00:51:20.133516
309	SP500	300	187	display_down	2026-08-14	2026-08-14 06:19:35.942896
52	SP500	300	129	display_down	2026-08-10	2026-08-10 00:41:46.716895
53	SP500	300	121	display_up	2026-08-10	2026-08-10 00:56:46.660423
310	SP500	300	188	display_down	2026-08-14	2026-08-14 06:19:38.401399
311	SP500	300	189	display_up	2026-08-14	2026-08-14 06:19:41.116561
313	SP500	300	194	display_down	2026-08-14	2026-08-14 06:43:58.991747
314	SP500	300	195	display_down	2026-08-14	2026-08-14 06:44:01.128586
315	SP500	300	193	display_down	2026-08-14	2026-08-14 07:03:59.877499
316	SP500	300	121	display_down	2026-08-18	2026-08-18 00:45:35.933699
317	SP500	300	122	display_down	2026-08-18	2026-08-18 00:45:38.550448
318	SP500	300	123	display_up	2026-08-18	2026-08-18 00:45:41.820082
319	SP500	300	127	display_up	2026-08-18	2026-08-18 01:13:15.570201
320	SP500	300	128	display_down	2026-08-18	2026-08-18 01:13:17.814015
321	SP500	300	129	display_up	2026-08-18	2026-08-18 01:13:19.528168
322	SP500	300	167	display_down	2026-08-18	2026-08-18 04:47:36.428265
323	SP500	300	168	display_up	2026-08-18	2026-08-18 04:47:38.598685
325	SP500	300	194	display_down	2026-08-18	2026-08-18 06:50:20.792515
326	SP500	300	195	display_down	2026-08-18	2026-08-18 06:50:23.281686
327	SP500	300	193	display_down	2026-08-18	2026-08-18 07:04:08.667278
328	SP500	300	121	display_down	2026-08-19	2026-08-19 00:44:07.267061
329	SP500	300	122	display_up	2026-08-19	2026-08-19 00:44:09.379363
330	SP500	300	123	display_up	2026-08-19	2026-08-19 00:44:11.445336
331	SP500	300	127	display_down	2026-08-19	2026-08-19 01:26:40.755886
332	SP500	300	128	display_down	2026-08-19	2026-08-19 01:26:43.595815
333	SP500	300	129	display_up	2026-08-19	2026-08-19 01:26:47.103522
334	SP500	300	193	display_up	2026-08-19	2026-08-19 06:24:48.460742
335	SP500	300	194	display_down	2026-08-19	2026-08-19 06:24:51.089711
336	SP500	300	195	display_down	2026-08-19	2026-08-19 06:24:53.495659
337	SP500	300	122	display_down	2026-08-20	2026-08-20 00:11:40.587956
338	SP500	300	123	display_down	2026-08-20	2026-08-20 00:11:42.761116
339	SP500	300	124	display_up	2026-08-20	2026-08-20 00:11:46.098676
340	SP500	300	127	display_up	2026-08-20	2026-08-20 00:52:51.141413
341	SP500	300	128	display_down	2026-08-20	2026-08-20 00:52:54.599529
342	SP500	300	129	display_down	2026-08-20	2026-08-20 00:52:57.532284
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
telegram_bot_token	8977987510:AAHpQxr-7lBTvISNFkrtqtxfKCNYdCnBYto	2026-08-14 07:27:56.159
telegram_notification_chat_id	-5385189374	2026-08-14 07:27:56.166
\.


--
-- Data for Name: transaction_requests; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.transaction_requests (id, user_id, type, amount, status, bank_name, account_holder, account_number, sender_name, admin_note, processed_by, processed_at, created_at) FROM stdin;
48	680bfe1a-2a6d-4661-8111-c86c439f1598	deposit	3000000	approved	\N	\N	\N	박덕준	\N	4207899b-f5e9-4393-9c14-0ad0db005748	2026-07-27 02:12:18.258	2026-07-27 02:10:11.461202
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
47	74852c63-bd9c-4a75-b98a-14f2ad7393c7	deposit	4510000	approved	\N	\N	\N	김윤구	\N	4207899b-f5e9-4393-9c14-0ad0db005748	2026-07-24 05:16:10.782	2026-07-24 05:16:07.821417
46	74852c63-bd9c-4a75-b98a-14f2ad7393c7	withdrawal	4510000	approved	\N	\N	\N	\N	\N	4207899b-f5e9-4393-9c14-0ad0db005748	2026-07-24 05:22:33.441	2026-07-24 05:15:18.638484
53	3007b845-7394-4cb1-81d7-7a5289591da2	deposit	5000000	approved	\N	\N	\N	오재명	\N	4207899b-f5e9-4393-9c14-0ad0db005748	2026-07-28 00:30:36.978	2026-07-28 00:30:23.258859
57	3007b845-7394-4cb1-81d7-7a5289591da2	deposit	5000000	approved	\N	\N	\N	오재명	\N	4207899b-f5e9-4393-9c14-0ad0db005748	2026-07-29 00:13:09.512	2026-07-29 00:12:58.972257
66	3007b845-7394-4cb1-81d7-7a5289591da2	withdrawal	1000000	approved	\N	\N	\N	\N	\N	4207899b-f5e9-4393-9c14-0ad0db005748	2026-07-30 07:47:55.564	2026-07-30 07:44:11.265012
69	3007b845-7394-4cb1-81d7-7a5289591da2	deposit	5000000	approved	\N	\N	\N	오재명	\N	4207899b-f5e9-4393-9c14-0ad0db005748	2026-08-03 01:59:13.036	2026-08-03 01:58:52.3125
72	3007b845-7394-4cb1-81d7-7a5289591da2	deposit	5000000	approved	\N	\N	\N	오재명	\N	4207899b-f5e9-4393-9c14-0ad0db005748	2026-08-04 00:35:34.471	2026-08-04 00:35:25.674544
74	e50051bc-006a-43f5-88d8-a08f020b08be	deposit	5000000	rejected	\N	\N	\N	정태룡	\N	f4a21243-eb2a-498e-bd25-46b1f19640cf	2026-08-12 08:43:02.304	2026-08-12 08:23:47.87715
75	e50051bc-006a-43f5-88d8-a08f020b08be	deposit	5000000	approved	\N	\N	\N	정태룡	\N	f4a21243-eb2a-498e-bd25-46b1f19640cf	2026-08-12 09:07:50.421	2026-08-12 09:07:11.167443
76	e50051bc-006a-43f5-88d8-a08f020b08be	withdrawal	47500	approved	\N	\N	\N	\N	\N	f4a21243-eb2a-498e-bd25-46b1f19640cf	2026-08-12 09:52:06.45	2026-08-12 09:19:35.140774
77	e50051bc-006a-43f5-88d8-a08f020b08be	withdrawal	142500	approved	\N	\N	\N	\N	\N	f4a21243-eb2a-498e-bd25-46b1f19640cf	2026-08-13 01:45:13.538	2026-08-13 01:40:26.35004
78	0c668b3d-7007-4164-bd7b-16b7521832d5	deposit	3000000	rejected	\N	\N	\N	오덕형	\N	f4a21243-eb2a-498e-bd25-46b1f19640cf	2026-08-13 04:15:46.2	2026-08-13 04:01:06.557588
79	0c668b3d-7007-4164-bd7b-16b7521832d5	deposit	3000000	approved	\N	\N	\N	오덕형	\N	f4a21243-eb2a-498e-bd25-46b1f19640cf	2026-08-13 04:21:25.287	2026-08-13 04:14:44.184356
80	0c668b3d-7007-4164-bd7b-16b7521832d5	withdrawal	47500	approved	\N	\N	\N	\N	\N	f4a21243-eb2a-498e-bd25-46b1f19640cf	2026-08-13 05:08:21.076	2026-08-13 04:56:52.777448
81	91d27d59-645a-40d4-ae60-f2109c29d5dd	deposit	2000000	approved	\N	\N	\N	김영삼	\N	f4a21243-eb2a-498e-bd25-46b1f19640cf	2026-08-13 06:56:16.283	2026-08-13 06:56:10.039813
82	91d27d59-645a-40d4-ae60-f2109c29d5dd	withdrawal	28500	approved	\N	\N	\N	\N	\N	f4a21243-eb2a-498e-bd25-46b1f19640cf	2026-08-13 07:16:39.362	2026-08-13 07:14:40.143647
83	0c668b3d-7007-4164-bd7b-16b7521832d5	deposit	13000000	approved	\N	\N	\N	오덕형	\N	f4a21243-eb2a-498e-bd25-46b1f19640cf	2026-08-14 05:08:19.341	2026-08-14 05:08:00.638426
84	91d27d59-645a-40d4-ae60-f2109c29d5dd	withdrawal	190000	approved	\N	\N	\N	\N	\N	f4a21243-eb2a-498e-bd25-46b1f19640cf	2026-08-18 01:07:35.88	2026-08-15 14:17:19.906551
85	91d27d59-645a-40d4-ae60-f2109c29d5dd	deposit	40000000	approved	\N	\N	\N	김영삼	\N	f4a21243-eb2a-498e-bd25-46b1f19640cf	2026-08-18 05:18:09.005	2026-08-18 05:18:01.864993
86	91d27d59-645a-40d4-ae60-f2109c29d5dd	deposit	10000000	approved	\N	\N	\N	김영삼	\N	f4a21243-eb2a-498e-bd25-46b1f19640cf	2026-08-18 06:20:58.211	2026-08-18 06:20:22.630802
87	91d27d59-645a-40d4-ae60-f2109c29d5dd	deposit	40000000	approved	\N	\N	\N	김영삼	\N	f4a21243-eb2a-498e-bd25-46b1f19640cf	2026-08-19 02:29:27.178	2026-08-19 02:29:14.48591
\.


--
-- Data for Name: user_sessions; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.user_sessions (sid, sess, expire) FROM stdin;
1-ifnUCwr3NMQqARZC2HlULzuH2cGnyh	{"cookie":{"originalMaxAge":604800000,"expires":"2026-08-25T00:50:24.155Z","secure":true,"httpOnly":true,"path":"/","sameSite":"none"},"userId":"e50051bc-006a-43f5-88d8-a08f020b08be"}	2026-08-25 10:02:53
ICn3kF0C_MVWkhHMuYyjwLb7_R1nfIat	{"cookie":{"originalMaxAge":604800000,"expires":"2026-08-21T07:12:05.624Z","secure":true,"httpOnly":true,"path":"/","sameSite":"none"},"userId":"e50051bc-006a-43f5-88d8-a08f020b08be"}	2026-08-21 15:05:41
3gbWk3HhK9DNzxXnfE9nxJRjY6yo7VJB	{"cookie":{"originalMaxAge":604800000,"expires":"2026-08-21T23:28:07.196Z","secure":true,"httpOnly":true,"path":"/","sameSite":"none"},"userId":"e50051bc-006a-43f5-88d8-a08f020b08be"}	2026-08-23 01:40:26
5O5O9m5-NSRt0tEgGMzzhBspNlnRI3XY	{"cookie":{"originalMaxAge":604800000,"expires":"2026-08-26T07:12:27.991Z","secure":true,"httpOnly":true,"path":"/","sameSite":"none"},"userId":"770c2e29-60bc-4019-a913-36e31b40df99"}	2026-08-26 07:14:30
fmiqoNzFEvXknChISfEswQ4YPTOk3v0p	{"cookie":{"originalMaxAge":604800000,"expires":"2026-08-26T07:17:56.838Z","secure":true,"httpOnly":true,"path":"/","sameSite":"none"},"userId":"e50051bc-006a-43f5-88d8-a08f020b08be"}	2026-08-26 08:28:10
Z8IuIVpJIRUaZZL9szDrR-fn3W3FNB8F	{"cookie":{"originalMaxAge":604800000,"expires":"2026-08-26T06:47:15.137Z","secure":true,"httpOnly":true,"path":"/","sameSite":"none"},"userId":"e50051bc-006a-43f5-88d8-a08f020b08be"}	2026-08-26 07:11:05
u_v8oXpGzafJleFX7yNF4SOP6rs28EEv	{"cookie":{"originalMaxAge":604800000,"expires":"2026-08-18T05:05:45.196Z","secure":true,"httpOnly":true,"path":"/","sameSite":"none"},"adminUserId":"f4a21243-eb2a-498e-bd25-46b1f19640cf","userId":"691e57e6-502e-447d-ae4e-aa275486ee4c"}	2026-08-21 06:10:52
Le4JcRoiuM0hRofjxUCq-wbcOz8UP1gu	{"cookie":{"originalMaxAge":604800000,"expires":"2026-08-21T01:11:01.570Z","secure":true,"httpOnly":true,"path":"/","sameSite":"none"},"userId":"e50051bc-006a-43f5-88d8-a08f020b08be"}	2026-08-21 01:40:56
WtVuYC5j-1_Q7YDb4Z9sLCBVxYDnGNkm	{"cookie":{"originalMaxAge":604800000,"expires":"2026-08-27T01:35:28.611Z","secure":true,"httpOnly":true,"path":"/","sameSite":"none"},"userId":"e50051bc-006a-43f5-88d8-a08f020b08be"}	2026-08-27 03:00:00
GoDIsBqkmFJVlDbCZAXvhDn5jMIMLLux	{"cookie":{"originalMaxAge":604800000,"expires":"2026-08-21T06:17:58.877Z","secure":true,"httpOnly":true,"path":"/","sameSite":"none"},"adminUserId":"f4a21243-eb2a-498e-bd25-46b1f19640cf"}	2026-08-21 07:29:00
otyvMu0yJofK-bZUVHeexFqZcOx4K6EF	{"cookie":{"originalMaxAge":604800000,"expires":"2026-08-21T07:25:13.692Z","secure":true,"httpOnly":true,"path":"/","sameSite":"none"},"userId":"a2507d2e-6260-4732-b4b4-6252676ec3ce"}	2026-08-21 07:25:33
dSObWTokwTsvVMO5pSpmaDLFONgHhmr4	{"cookie":{"originalMaxAge":604800000,"expires":"2026-08-26T04:13:40.457Z","secure":true,"httpOnly":true,"path":"/","sameSite":"none"},"userId":"97b36905-f052-4d86-90cf-30a4ed8252b2"}	2026-08-26 04:19:04
e6rSfHDc4Z25qjBgOm_AZA5VmpW0wyVl	{"cookie":{"originalMaxAge":604800000,"expires":"2026-08-21T01:34:06.067Z","secure":true,"httpOnly":true,"path":"/","sameSite":"none"},"userId":"bcac8549-04e1-4907-b9cc-062a4fc62f12"}	2026-08-21 01:38:14
mR3BLmLRKL47RYLsUncl46Lq0dMjXyBa	{"cookie":{"originalMaxAge":604800000,"expires":"2026-08-17T01:33:00.175Z","secure":true,"httpOnly":true,"path":"/","sameSite":"none"},"userId":"c84ca9f9-1efe-4ff4-a37d-ff9c3237b279","adminUserId":"f4a21243-eb2a-498e-bd25-46b1f19640cf"}	2026-08-21 06:23:41
vF3jgI66AMKQHKQylNwYd-ohj11C_tnr	{"cookie":{"originalMaxAge":604800000,"expires":"2026-08-21T02:17:42.456Z","secure":true,"httpOnly":true,"path":"/","sameSite":"none"},"userId":"e50051bc-006a-43f5-88d8-a08f020b08be"}	2026-08-21 06:19:41
WUt_tE98--iSNjs0PySVAzrC0lQvCxC0	{"cookie":{"originalMaxAge":604800000,"expires":"2026-08-21T06:18:38.270Z","secure":true,"httpOnly":true,"path":"/","sameSite":"none"},"userId":"0c668b3d-7007-4164-bd7b-16b7521832d5"}	2026-08-27 02:48:11
LCAph-B6Wg-73rURDJHWvIVjXaby7yWY	{"cookie":{"originalMaxAge":604800000,"expires":"2026-08-21T06:20:04.214Z","secure":true,"httpOnly":true,"path":"/","sameSite":"none"},"userId":"b74441c4-1858-43f0-afdc-fbfec02ce9d5","adminUserId":"f4a21243-eb2a-498e-bd25-46b1f19640cf"}	2026-08-21 07:24:53
dI8mZTUBPc342I-4wfBJYd_x1dkrZkBo	{"cookie":{"originalMaxAge":604800000,"expires":"2026-08-21T07:25:34.163Z","secure":true,"httpOnly":true,"path":"/","sameSite":"none"},"userId":"b74441c4-1858-43f0-afdc-fbfec02ce9d5","adminUserId":"f4a21243-eb2a-498e-bd25-46b1f19640cf"}	2026-08-27 02:59:43
V_7KmjRCBv71yfsY6ytGENyx5S75wldw	{"cookie":{"originalMaxAge":604800000,"expires":"2026-08-20T01:02:15.423Z","secure":true,"httpOnly":true,"path":"/","sameSite":"none"},"userId":"e50051bc-006a-43f5-88d8-a08f020b08be"}	2026-08-20 08:08:11
4MNE7XEseAWs6C46NcEZlKCliJRBFw_s	{"cookie":{"originalMaxAge":604800000,"expires":"2026-08-26T05:18:51.991Z","secure":true,"httpOnly":true,"path":"/","sameSite":"none"},"userId":"c84ca9f9-1efe-4ff4-a37d-ff9c3237b279","adminUserId":"f4a21243-eb2a-498e-bd25-46b1f19640cf"}	2026-08-27 02:59:45
2F5vMBJoNrui1dxQY6LaK8pjRWb2livy	{"cookie":{"originalMaxAge":604800000,"expires":"2026-08-17T01:03:13.416Z","secure":true,"httpOnly":true,"path":"/","sameSite":"none"},"adminUserId":"f4a21243-eb2a-498e-bd25-46b1f19640cf"}	2026-08-21 06:20:04
r3FjjeKK5_HPREaiVqkcsMbNoWVKPC1W	{"cookie":{"originalMaxAge":604800000,"expires":"2026-08-21T06:15:18.265Z","secure":true,"httpOnly":true,"path":"/","sameSite":"none"},"userId":"c84ca9f9-1efe-4ff4-a37d-ff9c3237b279"}	2026-08-27 02:59:12
Kj0s-LShOELPTF0vM1QV7ku20SXhmG_3	{"cookie":{"originalMaxAge":604800000,"expires":"2026-08-20T06:40:42.364Z","secure":true,"httpOnly":true,"path":"/","sameSite":"none"},"userId":"91d27d59-645a-40d4-ae60-f2109c29d5dd"}	2026-08-21 01:43:28
nES7L65dzBBbRVA9sz6QFp2aDNgxXObL	{"cookie":{"originalMaxAge":604800000,"expires":"2026-08-18T05:06:49.652Z","secure":true,"httpOnly":true,"path":"/","sameSite":"none"},"userId":"c84ca9f9-1efe-4ff4-a37d-ff9c3237b279"}	2026-08-21 06:38:25
lxQBpr4a54f4SJBpYDi86G02jqW1j5eN	{"cookie":{"originalMaxAge":604800000,"expires":"2026-08-20T01:49:47.985Z","secure":true,"httpOnly":true,"path":"/","sameSite":"none"},"userId":"0c668b3d-7007-4164-bd7b-16b7521832d5"}	2026-08-21 05:08:37
J30ZA3D55WKRWkMApS9LwwmlDdblPU-z	{"cookie":{"originalMaxAge":604800000,"expires":"2026-08-17T01:32:15.794Z","secure":true,"httpOnly":true,"path":"/","sameSite":"none"},"adminUserId":"f4a21243-eb2a-498e-bd25-46b1f19640cf","userId":"b74441c4-1858-43f0-afdc-fbfec02ce9d5"}	2026-08-21 06:20:22
PadQIRqafKRcBYP6hGA84hVFKRn4wj-q	{"cookie":{"originalMaxAge":604800000,"expires":"2026-08-21T06:20:20.238Z","secure":true,"httpOnly":true,"path":"/","sameSite":"none"},"adminUserId":"f4a21243-eb2a-498e-bd25-46b1f19640cf"}	2026-08-27 01:42:40
XgjyjcfolqKAODvm8avYYlAJUFUEvjk7	{"cookie":{"originalMaxAge":604800000,"expires":"2026-08-21T06:49:31.872Z","secure":true,"httpOnly":true,"path":"/","sameSite":"none"},"userId":"91d27d59-645a-40d4-ae60-f2109c29d5dd"}	2026-08-27 01:41:21
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.users (id, username, password, name, phone, bank_name, account_holder, account_number, balance, total_deposit, total_withdrawal, total_bet, total_win, role, grade, is_active, last_login_at, created_at, approval_status, birth_date, resident_number, region, branch_code, affiliate_id, last_login_ip, auto_bet_enabled, auto_bet_multiplier, is_betting_blocked, forced_bet_direction, max_execution_enabled, pending_balance_adjustment, always_pending_enabled, telegram_notify_enabled) FROM stdin;
76a18cd5-62f2-4abd-9ce7-5397c05da8bd	lauom88	lr1762rd//	이원재	1098070079	KB국민은행	이원재	117210953111	0	0	0	0	0	user	브론즈	t	2026-07-08 01:31:51.995	2026-07-08 01:28:11.740038	approved	630307	\N	\N	\N	\N	119.198.125.82	f	10	f	\N	t	0	f	f
680bfe1a-2a6d-4661-8111-c86c439f1598	fffsur	d2706j-2706	박덕준	1032252706	우리은행	박덕준	1002541937465 	0	3000000	0	0	0	user	브론즈	t	2026-07-24 06:43:02.228	2026-07-24 01:44:31.845979	approved	690326	\N	\N	\N	877fbaaa-35aa-4dc8-a141-2b7d2acc2cbf	211.36.146.246	f	10	f	\N	t	0	f	f
74852c63-bd9c-4a75-b98a-14f2ad7393c7	phcj	iapplecj9*	김윤구	1099921232	새마을금고	김윤구	4543100010311	0	19510000	4510000	0	0	user	브론즈	f	2026-07-27 01:36:48.872	2026-07-10 04:08:02.844156	approved	680510	\N	\N	\N	\N	211.235.64.54	f	10	f	\N	t	0	f	f
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
f501ab5b-27c7-4682-8924-692946bf5e28	겨울비	480155	모경화	1044655505	신한은행	모경화	110391479600	0	0	0	0	0	user	브론즈	t	2026-07-30 02:57:45.749	2026-07-29 05:07:29.343464	approved	710501	\N	\N	\N	\N	118.235.91.144	f	10	f	\N	t	0	f	f
13e0933f-cea5-4749-8f0b-181658ee5e2b	hyeri0806	yun99240806@	윤혜리	1099428433	NH농협은행	윤혜리	3521201250393	0	0	0	0	0	user	브론즈	t	2026-08-03 02:24:21.955	2026-07-27 01:09:34.889107	approved	790926	\N	\N	\N	877fbaaa-35aa-4dc8-a141-2b7d2acc2cbf	194.114.136.62	f	10	f	\N	t	0	f	f
3007b845-7394-4cb1-81d7-7a5289591da2	ojm1199	119900	오재명 	1052346078	KB국민은행	오재명 	57860101012342	0	29850000	1000000	0	0	user	브론즈	t	2026-08-06 01:56:36.896	2026-07-22 06:53:05.991256	approved	490610	\N	\N	\N	877fbaaa-35aa-4dc8-a141-2b7d2acc2cbf	211.104.178.184	f	0	f	\N	t	0	f	f
4439d992-3b0d-43a1-becd-8ef186b3d934	jongbae109	qkrwhdqo0.	박종배	1076746560	토스뱅크	박종배	100195670933	0	0	0	0	0	user	브론즈	t	2026-08-05 03:32:22.967	2026-08-05 03:31:51.595828	approved	910228	\N	\N	\N	877fbaaa-35aa-4dc8-a141-2b7d2acc2cbf	223.39.83.57	f	10	f	\N	t	0	f	f
12b73c7f-9f06-4e98-9617-07cb693c2f4f	senskim81	Paul292513-	김성용	1027936800	IBK기업은행	김성용	1027936800	0	0	0	0	0	user	브론즈	t	2026-08-05 04:54:46.429	2026-08-05 04:38:09.364242	approved	811021	\N	\N	\N	877fbaaa-35aa-4dc8-a141-2b7d2acc2cbf	118.235.11.169	f	10	f	\N	t	0	f	f
330907d4-43f2-4aac-9c9c-6388705995fa	Kmg	m22313607	기미경 	1062690064	NH농협은행	기미경 	3120095269431	0	0	0	0	0	user	브론즈	t	\N	2026-08-05 05:06:57.824591	approved	720250	\N	\N	\N	\N	\N	f	10	f	\N	t	0	f	f
f86800a3-aa14-4f70-877a-0749225b5f5f	ojm5959	119900	오재명 	1052346078	KB국민은행	오재명 	57860101012342	0	0	0	0	0	user	브론즈	t	\N	2026-08-06 01:42:31.384787	approved	490610	\N	\N	\N	\N	\N	f	10	f	\N	t	0	f	f
2bbf726e-9087-4160-87df-2f5910473c7d	Ojm5959 	119900	오재명 	1052346078	KB국민은행	오재명 	57860101012342	0	0	0	0	0	user	브론즈	t	\N	2026-08-06 01:45:53.178859	approved	490610	\N	\N	\N	\N	\N	f	10	f	\N	t	0	f	f
691e57e6-502e-447d-ae4e-aa275486ee4c	demo	demo123	데모 사용자	\N	\N	\N	\N	10000000	0	0	0	0	user	브론즈	t	2026-08-11 05:05:45.186	2026-08-09 11:19:58.013411	approved	\N	\N	\N	\N	\N	146.70.201.249	f	10	f	\N	t	0	f	f
e50051bc-006a-43f5-88d8-a08f020b08be	sus769	q!wlswnd25	정태룡	01047834082	신한은행	정태룡	24802118992	907000	5000000	190000	0	0	user	브론즈	t	2026-08-20 01:35:28.602	2026-08-11 06:44:08.870215	approved	691002	\N	\N	\N	\N	115.138.247.32	f	10	f	\N	t	0	f	f
c84ca9f9-1efe-4ff4-a37d-ff9c3237b279	111	1234	111	1011111111	신한은행	4534	4354534345	24617500	0	0	0	0	user	브론즈	t	2026-08-19 01:33:27.902	2026-07-07 00:57:38.762691	approved	111111	\N	\N	\N	\N	45.67.97.61	f	10	f	\N	t	0	f	f
b74441c4-1858-43f0-afdc-fbfec02ce9d5	qwer123	qwer123	김만복	1088888888	신한은행	김만복	999999999999999	9002500	0	0	0	0	user	브론즈	t	2026-08-14 07:25:18.494	2026-07-07 00:57:16.946059	approved	900101	\N	\N	\N	\N	45.67.97.77	f	10	f	\N	t	0	f	f
f4a21243-eb2a-498e-bd25-46b1f19640cf	admin	admin123	관리자	\N	\N	\N	\N	100000000	0	0	0	0	admin	브론즈	t	\N	2026-08-09 11:19:58.005784	approved	\N	\N	\N	\N	\N	\N	f	10	f	\N	t	0	f	f
5b3baca7-faec-4eae-b258-09eda7c3fade	self571	@dlswndcjs1	최병환	01090326609	KB국민은행	최병환	00150204250000	0	0	0	0	0	user	브론즈	t	2026-08-12 05:01:40.005	2026-08-12 02:22:02.013949	approved	621005	\N	\N	\N	\N	211.37.24.214	f	10	f	\N	t	0	f	f
c7e79594-f2d6-4e77-9b0c-aa76152c99b4	goldmoon97	bluevery97!	문현주	01027333135	KB국민은행	문현주	11790204146848	0	0	0	0	0	user	브론즈	t	2026-08-12 00:37:23.968	2026-08-12 00:37:02.014093	approved	790222	\N	\N	\N	877fbaaa-35aa-4dc8-a141-2b7d2acc2cbf	125.182.229.203	f	10	f	\N	t	0	f	f
97b36905-f052-4d86-90cf-30a4ed8252b2	y018240	@@jsb7032	용명주	01039589472	새마을금고	용명주	9003300306327	0	0	0	0	0	user	브론즈	t	2026-08-19 04:13:40.446	2026-08-19 02:34:38.173319	approved	731120	\N	\N	\N	\N	115.139.46.37	f	10	f	\N	t	0	f	f
5a42c2f5-b8d9-440c-aa5d-4c35670cd3f6	kmg	@KM22318	기미경 	01062990064	NH농협은행	기미경 	3120095269431	0	0	0	0	0	user	브론즈	t	2026-08-12 11:05:17.231	2026-08-12 11:03:09.70526	approved	720220	\N	\N	\N	\N	219.241.217.126	f	10	f	\N	t	0	f	f
91d27d59-645a-40d4-ae60-f2109c29d5dd	kys3442 	kys76071724@#	김영삼	01044763434	SC제일은행	김영삼	25020515410	108330000	92000000	218500	0	0	user	브론즈	t	2026-08-14 06:49:31.86	2026-08-13 06:37:14.771691	approved	750721	\N	\N	\N	\N	118.235.13.101	f	10	f	\N	t	0	f	f
0c668b3d-7007-4164-bd7b-16b7521832d5	odh0803	1q2w3e4r5t!	오덕형	01023177370	우리은행	오덕형	09526531802101	25832500	16000000	47500	0	0	user	브론즈	t	2026-08-14 06:18:38.26	2026-08-13 01:49:03.830235	approved	641113	\N	\N	\N	\N	117.111.12.132	f	10	f	\N	t	0	f	f
815bcba5-9ece-4e6b-8ce4-c30d74caa6ba	drewperry91	Dre!Pe3Dr1	Drew Perry	01045678901	KB국민은행	Drew Perry	12345678901234	0	0	0	0	0	user	브론즈	t	\N	2026-08-16 19:56:28.875467	rejected	890930	\N	\N	\N	\N	\N	f	10	f	\N	t	0	f	f
a2507d2e-6260-4732-b4b4-6252676ec3ce	zmkm4050	kmzm4040	이민	01039943445	NH농협은행	이민	13001656259688	0	0	0	0	0	user	브론즈	t	2026-08-14 07:25:13.667	2026-08-14 07:24:58.591395	approved	880326	\N	\N	\N	877fbaaa-35aa-4dc8-a141-2b7d2acc2cbf	117.111.8.201	f	10	f	\N	t	0	f	f
770c2e29-60bc-4019-a913-36e31b40df99	purplelyr	leerim247^^*	이영림	01076719629	KB국민은행	이영림	41940104014477	0	0	0	0	0	user	브론즈	t	2026-08-19 07:12:27.981	2026-08-19 07:11:49.713365	approved	720620	\N	\N	\N	877fbaaa-35aa-4dc8-a141-2b7d2acc2cbf	106.101.200.191	f	10	f	\N	t	0	f	f
bcac8549-04e1-4907-b9cc-062a4fc62f12	lyh8496	dydgus89!!	이정우	01029442500	신한은행	이정우	110608337439	0	0	0	0	0	user	브론즈	t	2026-08-14 06:10:01.899	2026-08-14 01:32:25.416093	approved	890405	\N	\N	\N	877fbaaa-35aa-4dc8-a141-2b7d2acc2cbf	146.70.201.223	f	10	f	\N	t	0	f	f
\.


--
-- Name: replit_database_migrations_v1_id_seq; Type: SEQUENCE SET; Schema: _system; Owner: -
--

SELECT pg_catalog.setval('_system.replit_database_migrations_v1_id_seq', 1, true);


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

SELECT pg_catalog.setval('public.announcements_id_seq', 2, false);


--
-- Name: bets_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.bets_id_seq', 483, true);


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

SELECT pg_catalog.setval('public.forex_candles_id_seq', 559635, true);


--
-- Name: inquiries_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.inquiries_id_seq', 12, false);


--
-- Name: inquiry_templates_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.inquiry_templates_id_seq', 1, false);


--
-- Name: login_history_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.login_history_id_seq', 126, true);


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

SELECT pg_catalog.setval('public.round_forced_directions_id_seq', 342, true);


--
-- Name: round_results_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.round_results_id_seq', 1, false);


--
-- Name: transaction_requests_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.transaction_requests_id_seq', 88, false);


--
-- Name: replit_database_migrations_v1 replit_database_migrations_v1_pkey; Type: CONSTRAINT; Schema: _system; Owner: -
--

ALTER TABLE ONLY _system.replit_database_migrations_v1
    ADD CONSTRAINT replit_database_migrations_v1_pkey PRIMARY KEY (id);


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
-- Name: idx_replit_database_migrations_v1_build_id; Type: INDEX; Schema: _system; Owner: -
--

CREATE UNIQUE INDEX idx_replit_database_migrations_v1_build_id ON _system.replit_database_migrations_v1 USING btree (build_id);


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

\unrestrict 6Gwb0fosnsPLZukcIC20tP1wNDHz4mv0dbHwCriDW4GImuAr6DWlFCcXrxluML8

