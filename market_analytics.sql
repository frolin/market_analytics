--
-- PostgreSQL database dump
--

-- Dumped from database version 14.1 (Debian 14.1-1.pgdg110+1)
-- Dumped by pg_dump version 14.1 (Debian 14.1-1.pgdg110+1)

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

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: ar_internal_metadata; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.ar_internal_metadata (
    key character varying NOT NULL,
    value character varying,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.ar_internal_metadata OWNER TO postgres;

--
-- Name: audits; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.audits (
    id bigint NOT NULL,
    auditable_id integer,
    auditable_type character varying,
    associated_id integer,
    associated_type character varying,
    user_id integer,
    user_type character varying,
    username character varying,
    action character varying,
    audited_changes text,
    version integer DEFAULT 0,
    comment character varying,
    remote_address character varying,
    request_uuid character varying,
    created_at timestamp(6) without time zone
);


ALTER TABLE public.audits OWNER TO postgres;

--
-- Name: audits_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.audits_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.audits_id_seq OWNER TO postgres;

--
-- Name: audits_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.audits_id_seq OWNED BY public.audits.id;


--
-- Name: campaigns; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.campaigns (
    id bigint NOT NULL,
    name character varying,
    number character varying,
    slug character varying,
    market_id bigint NOT NULL,
    data jsonb,
    token character varying,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.campaigns OWNER TO postgres;

--
-- Name: campaigns_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.campaigns_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.campaigns_id_seq OWNER TO postgres;

--
-- Name: campaigns_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.campaigns_id_seq OWNED BY public.campaigns.id;


--
-- Name: categories; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.categories (
    id bigint NOT NULL,
    name character varying,
    slug character varying,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.categories OWNER TO postgres;

--
-- Name: categories_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.categories_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.categories_id_seq OWNER TO postgres;

--
-- Name: categories_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.categories_id_seq OWNED BY public.categories.id;


--
-- Name: friendly_id_slugs; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.friendly_id_slugs (
    id bigint NOT NULL,
    slug character varying NOT NULL,
    sluggable_id integer NOT NULL,
    sluggable_type character varying(50),
    scope character varying,
    created_at timestamp(6) without time zone
);


ALTER TABLE public.friendly_id_slugs OWNER TO postgres;

--
-- Name: friendly_id_slugs_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.friendly_id_slugs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.friendly_id_slugs_id_seq OWNER TO postgres;

--
-- Name: friendly_id_slugs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.friendly_id_slugs_id_seq OWNED BY public.friendly_id_slugs.id;


--
-- Name: imports; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.imports (
    id bigint NOT NULL,
    campaign_id bigint NOT NULL,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.imports OWNER TO postgres;

--
-- Name: imports_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.imports_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.imports_id_seq OWNER TO postgres;

--
-- Name: imports_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.imports_id_seq OWNED BY public.imports.id;


--
-- Name: keyword_results; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.keyword_results (
    id bigint NOT NULL,
    keyword_id bigint NOT NULL,
    data jsonb,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.keyword_results OWNER TO postgres;

--
-- Name: keyword_results_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.keyword_results_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.keyword_results_id_seq OWNER TO postgres;

--
-- Name: keyword_results_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.keyword_results_id_seq OWNED BY public.keyword_results.id;


--
-- Name: keywords; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.keywords (
    id bigint NOT NULL,
    name character varying,
    slug character varying,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.keywords OWNER TO postgres;

--
-- Name: keywords_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.keywords_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.keywords_id_seq OWNER TO postgres;

--
-- Name: keywords_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.keywords_id_seq OWNED BY public.keywords.id;


--
-- Name: markets; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.markets (
    id bigint NOT NULL,
    name character varying,
    slug character varying,
    data jsonb,
    user_id bigint NOT NULL,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.markets OWNER TO postgres;

--
-- Name: markets_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.markets_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.markets_id_seq OWNER TO postgres;

--
-- Name: markets_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.markets_id_seq OWNED BY public.markets.id;


--
-- Name: notifications; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.notifications (
    id bigint NOT NULL,
    recipient_type character varying NOT NULL,
    recipient_id bigint NOT NULL,
    type character varying NOT NULL,
    params jsonb,
    read_at timestamp(6) without time zone,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.notifications OWNER TO postgres;

--
-- Name: notifications_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.notifications_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.notifications_id_seq OWNER TO postgres;

--
-- Name: notifications_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.notifications_id_seq OWNED BY public.notifications.id;


--
-- Name: order_costs; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.order_costs (
    id bigint NOT NULL,
    data jsonb,
    date timestamp(6) without time zone,
    order_id bigint NOT NULL,
    import_id bigint NOT NULL,
    campaign_id bigint NOT NULL,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.order_costs OWNER TO postgres;

--
-- Name: order_costs_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.order_costs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.order_costs_id_seq OWNER TO postgres;

--
-- Name: order_costs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.order_costs_id_seq OWNED BY public.order_costs.id;


--
-- Name: order_products; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.order_products (
    id bigint NOT NULL,
    product_id bigint NOT NULL,
    order_id bigint NOT NULL,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL,
    campaign_id bigint NOT NULL
);


ALTER TABLE public.order_products OWNER TO postgres;

--
-- Name: order_products_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.order_products_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.order_products_id_seq OWNER TO postgres;

--
-- Name: order_products_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.order_products_id_seq OWNED BY public.order_products.id;


--
-- Name: orders; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.orders (
    id bigint NOT NULL,
    api_data jsonb,
    excel_data jsonb,
    date timestamp(6) without time zone,
    import_id bigint NOT NULL,
    campaign_id bigint NOT NULL,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.orders OWNER TO postgres;

--
-- Name: orders_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.orders_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.orders_id_seq OWNER TO postgres;

--
-- Name: orders_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.orders_id_seq OWNED BY public.orders.id;


--
-- Name: photos; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.photos (
    id bigint NOT NULL,
    image_data jsonb,
    product_id bigint NOT NULL,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.photos OWNER TO postgres;

--
-- Name: photos_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.photos_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.photos_id_seq OWNER TO postgres;

--
-- Name: photos_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.photos_id_seq OWNED BY public.photos.id;


--
-- Name: product_categories; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.product_categories (
    id bigint NOT NULL,
    product_id bigint NOT NULL,
    category_id bigint NOT NULL,
    "position" integer,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.product_categories OWNER TO postgres;

--
-- Name: product_categories_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.product_categories_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.product_categories_id_seq OWNER TO postgres;

--
-- Name: product_categories_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.product_categories_id_seq OWNED BY public.product_categories.id;


--
-- Name: product_keywords; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.product_keywords (
    id bigint NOT NULL,
    product_id bigint NOT NULL,
    keyword_id bigint NOT NULL,
    "position" integer,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.product_keywords OWNER TO postgres;

--
-- Name: product_keywords_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.product_keywords_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.product_keywords_id_seq OWNER TO postgres;

--
-- Name: product_keywords_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.product_keywords_id_seq OWNED BY public.product_keywords.id;


--
-- Name: products; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.products (
    id bigint NOT NULL,
    name character varying,
    data jsonb,
    sku character varying,
    barcode character varying,
    offer_id bigint,
    content jsonb DEFAULT '{}'::jsonb,
    properties jsonb DEFAULT '{}'::jsonb,
    parameters jsonb DEFAULT '{}'::jsonb,
    image_data jsonb,
    jsonb jsonb,
    campaign_id bigint,
    import_id bigint,
    user_id bigint NOT NULL,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL,
    cost jsonb DEFAULT '{}'::jsonb,
    price numeric(8,2),
    purchase_price numeric(8,2)
);


ALTER TABLE public.products OWNER TO postgres;

--
-- Name: products_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.products_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.products_id_seq OWNER TO postgres;

--
-- Name: products_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.products_id_seq OWNED BY public.products.id;


--
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.schema_migrations (
    version character varying NOT NULL
);


ALTER TABLE public.schema_migrations OWNER TO postgres;

--
-- Name: sells; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.sells (
    id bigint NOT NULL,
    order_id bigint NOT NULL,
    date date,
    api_data jsonb DEFAULT '{}'::jsonb,
    excel_data jsonb DEFAULT '{}'::jsonb,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.sells OWNER TO postgres;

--
-- Name: sells_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.sells_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.sells_id_seq OWNER TO postgres;

--
-- Name: sells_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.sells_id_seq OWNED BY public.sells.id;


--
-- Name: stocks; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.stocks (
    id bigint NOT NULL,
    product_id bigint NOT NULL,
    quantity integer,
    api_data jsonb,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.stocks OWNER TO postgres;

--
-- Name: stocks_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.stocks_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.stocks_id_seq OWNER TO postgres;

--
-- Name: stocks_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.stocks_id_seq OWNED BY public.stocks.id;


--
-- Name: suply_products; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.suply_products (
    id bigint NOT NULL,
    product_id bigint NOT NULL,
    supply_id bigint NOT NULL,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.suply_products OWNER TO postgres;

--
-- Name: suply_products_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.suply_products_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.suply_products_id_seq OWNER TO postgres;

--
-- Name: suply_products_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.suply_products_id_seq OWNED BY public.suply_products.id;


--
-- Name: supplies; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.supplies (
    id bigint NOT NULL,
    name character varying,
    campaign_id bigint,
    market_id bigint,
    user_id bigint NOT NULL,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.supplies OWNER TO postgres;

--
-- Name: supplies_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.supplies_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.supplies_id_seq OWNER TO postgres;

--
-- Name: supplies_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.supplies_id_seq OWNED BY public.supplies.id;


--
-- Name: supply_costs; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.supply_costs (
    id bigint NOT NULL,
    name character varying,
    value character varying,
    operation_type character varying,
    data jsonb,
    supply_product_id bigint NOT NULL,
    type character varying,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.supply_costs OWNER TO postgres;

--
-- Name: supply_costs_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.supply_costs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.supply_costs_id_seq OWNER TO postgres;

--
-- Name: supply_costs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.supply_costs_id_seq OWNED BY public.supply_costs.id;


--
-- Name: supply_products; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.supply_products (
    id bigint NOT NULL,
    product_id bigint NOT NULL,
    supply_id bigint NOT NULL,
    count integer,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL,
    price numeric(8,2),
    purchase_price numeric(8,2)
);


ALTER TABLE public.supply_products OWNER TO postgres;

--
-- Name: supply_products_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.supply_products_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.supply_products_id_seq OWNER TO postgres;

--
-- Name: supply_products_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.supply_products_id_seq OWNED BY public.supply_products.id;


--
-- Name: user_settings; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.user_settings (
    id bigint NOT NULL,
    user_id bigint NOT NULL,
    data jsonb,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.user_settings OWNER TO postgres;

--
-- Name: user_settings_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.user_settings_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.user_settings_id_seq OWNER TO postgres;

--
-- Name: user_settings_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.user_settings_id_seq OWNED BY public.user_settings.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users (
    id bigint NOT NULL,
    email character varying DEFAULT ''::character varying NOT NULL,
    encrypted_password character varying DEFAULT ''::character varying NOT NULL,
    reset_password_token character varying,
    reset_password_sent_at timestamp(6) without time zone,
    remember_created_at timestamp(6) without time zone,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.users OWNER TO postgres;

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_id_seq OWNER TO postgres;

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- Name: audits id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.audits ALTER COLUMN id SET DEFAULT nextval('public.audits_id_seq'::regclass);


--
-- Name: campaigns id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaigns ALTER COLUMN id SET DEFAULT nextval('public.campaigns_id_seq'::regclass);


--
-- Name: categories id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.categories ALTER COLUMN id SET DEFAULT nextval('public.categories_id_seq'::regclass);


--
-- Name: friendly_id_slugs id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.friendly_id_slugs ALTER COLUMN id SET DEFAULT nextval('public.friendly_id_slugs_id_seq'::regclass);


--
-- Name: imports id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.imports ALTER COLUMN id SET DEFAULT nextval('public.imports_id_seq'::regclass);


--
-- Name: keyword_results id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.keyword_results ALTER COLUMN id SET DEFAULT nextval('public.keyword_results_id_seq'::regclass);


--
-- Name: keywords id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.keywords ALTER COLUMN id SET DEFAULT nextval('public.keywords_id_seq'::regclass);


--
-- Name: markets id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.markets ALTER COLUMN id SET DEFAULT nextval('public.markets_id_seq'::regclass);


--
-- Name: notifications id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.notifications ALTER COLUMN id SET DEFAULT nextval('public.notifications_id_seq'::regclass);


--
-- Name: order_costs id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_costs ALTER COLUMN id SET DEFAULT nextval('public.order_costs_id_seq'::regclass);


--
-- Name: order_products id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_products ALTER COLUMN id SET DEFAULT nextval('public.order_products_id_seq'::regclass);


--
-- Name: orders id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders ALTER COLUMN id SET DEFAULT nextval('public.orders_id_seq'::regclass);


--
-- Name: photos id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.photos ALTER COLUMN id SET DEFAULT nextval('public.photos_id_seq'::regclass);


--
-- Name: product_categories id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_categories ALTER COLUMN id SET DEFAULT nextval('public.product_categories_id_seq'::regclass);


--
-- Name: product_keywords id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_keywords ALTER COLUMN id SET DEFAULT nextval('public.product_keywords_id_seq'::regclass);


--
-- Name: products id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products ALTER COLUMN id SET DEFAULT nextval('public.products_id_seq'::regclass);


--
-- Name: sells id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sells ALTER COLUMN id SET DEFAULT nextval('public.sells_id_seq'::regclass);


--
-- Name: stocks id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.stocks ALTER COLUMN id SET DEFAULT nextval('public.stocks_id_seq'::regclass);


--
-- Name: suply_products id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.suply_products ALTER COLUMN id SET DEFAULT nextval('public.suply_products_id_seq'::regclass);


--
-- Name: supplies id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.supplies ALTER COLUMN id SET DEFAULT nextval('public.supplies_id_seq'::regclass);


--
-- Name: supply_costs id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.supply_costs ALTER COLUMN id SET DEFAULT nextval('public.supply_costs_id_seq'::regclass);


--
-- Name: supply_products id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.supply_products ALTER COLUMN id SET DEFAULT nextval('public.supply_products_id_seq'::regclass);


--
-- Name: user_settings id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_settings ALTER COLUMN id SET DEFAULT nextval('public.user_settings_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Data for Name: ar_internal_metadata; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.ar_internal_metadata (key, value, created_at, updated_at) FROM stdin;
environment	development	2022-05-26 19:28:08.336148	2022-05-26 19:28:08.336148
\.


--
-- Data for Name: audits; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.audits (id, auditable_id, auditable_type, associated_id, associated_type, user_id, user_type, username, action, audited_changes, version, comment, remote_address, request_uuid, created_at) FROM stdin;
\.


--
-- Data for Name: campaigns; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.campaigns (id, name, number, slug, market_id, data, token, created_at, updated_at) FROM stdin;
1	Здоровая Закупка	1	\N	11	\N	NzlmOTFmNTYtMGEwZC00Y2ZhLWE5OTUtYzU2NGY5NGQ2OGJh	2022-08-14 21:10:40.199938	2022-08-14 21:10:40.199938
\.


--
-- Data for Name: categories; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.categories (id, name, slug, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: friendly_id_slugs; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.friendly_id_slugs (id, slug, sluggable_id, sluggable_type, scope, created_at) FROM stdin;
\.


--
-- Data for Name: imports; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.imports (id, campaign_id, created_at, updated_at) FROM stdin;
26	1	2022-08-21 23:19:45.068999	2022-08-21 23:19:45.068999
27	1	2022-08-21 23:20:51.701778	2022-08-21 23:20:51.701778
31	1	2022-08-21 23:25:46.752736	2022-08-21 23:25:46.752736
32	1	2022-08-21 23:25:47.012985	2022-08-21 23:25:47.012985
33	1	2022-08-21 23:25:47.183895	2022-08-21 23:25:47.183895
34	1	2022-08-21 23:25:47.30487	2022-08-21 23:25:47.30487
35	1	2022-08-21 23:25:47.418378	2022-08-21 23:25:47.418378
36	1	2022-08-21 23:25:47.53011	2022-08-21 23:25:47.53011
37	1	2022-08-21 23:25:47.69027	2022-08-21 23:25:47.69027
38	1	2022-08-21 23:25:47.811364	2022-08-21 23:25:47.811364
39	1	2022-08-21 23:25:47.932617	2022-08-21 23:25:47.932617
40	1	2022-08-21 23:25:48.061521	2022-08-21 23:25:48.061521
41	1	2022-08-21 23:25:48.182315	2022-08-21 23:25:48.182315
42	1	2022-08-21 23:25:48.296002	2022-08-21 23:25:48.296002
43	1	2022-08-21 23:25:48.408916	2022-08-21 23:25:48.408916
44	1	2022-08-21 23:25:48.531208	2022-08-21 23:25:48.531208
45	1	2022-08-21 23:25:48.645544	2022-08-21 23:25:48.645544
46	1	2022-08-21 23:25:48.800943	2022-08-21 23:25:48.800943
47	1	2022-08-21 23:25:48.915532	2022-08-21 23:25:48.915532
48	1	2022-08-21 23:25:49.028717	2022-08-21 23:25:49.028717
49	1	2022-08-21 23:25:49.143566	2022-08-21 23:25:49.143566
50	1	2022-08-21 23:25:49.336366	2022-08-21 23:25:49.336366
51	1	2022-08-21 23:25:49.45118	2022-08-21 23:25:49.45118
52	1	2022-08-21 23:25:49.647078	2022-08-21 23:25:49.647078
53	1	2022-08-21 23:25:49.769379	2022-08-21 23:25:49.769379
54	1	2022-08-21 23:25:49.988522	2022-08-21 23:25:49.988522
55	1	2022-08-21 23:25:50.124717	2022-08-21 23:25:50.124717
56	1	2022-08-21 23:25:50.319365	2022-08-21 23:25:50.319365
57	1	2022-08-21 23:25:50.45404	2022-08-21 23:25:50.45404
58	1	2022-08-21 23:25:50.582431	2022-08-21 23:25:50.582431
59	1	2022-08-21 23:25:50.70055	2022-08-21 23:25:50.70055
60	1	2022-08-21 23:25:50.818572	2022-08-21 23:25:50.818572
61	1	2022-08-21 23:25:50.949424	2022-08-21 23:25:50.949424
62	1	2022-08-21 23:25:51.088444	2022-08-21 23:25:51.088444
63	1	2022-08-21 23:25:51.204973	2022-08-21 23:25:51.204973
64	1	2022-08-21 23:25:51.382583	2022-08-21 23:25:51.382583
65	1	2022-08-21 23:25:51.548423	2022-08-21 23:25:51.548423
66	1	2022-08-21 23:28:54.316524	2022-08-21 23:28:54.316524
67	1	2022-08-21 23:38:03.968042	2022-08-21 23:38:03.968042
68	1	2022-08-21 23:39:20.076767	2022-08-21 23:39:20.076767
69	1	2022-08-21 23:39:31.811508	2022-08-21 23:39:31.811508
70	1	2022-08-21 23:39:53.883211	2022-08-21 23:39:53.883211
71	1	2022-08-21 23:40:20.744907	2022-08-21 23:40:20.744907
72	1	2022-08-21 23:41:15.298492	2022-08-21 23:41:15.298492
73	1	2022-08-21 23:44:08.929056	2022-08-21 23:44:08.929056
74	1	2022-08-21 23:45:28.941632	2022-08-21 23:45:28.941632
75	1	2022-08-21 23:46:21.71918	2022-08-21 23:46:21.71918
76	1	2022-08-21 23:48:21.671389	2022-08-21 23:48:21.671389
77	1	2022-08-21 23:50:41.617165	2022-08-21 23:50:41.617165
78	1	2022-08-21 23:51:15.363843	2022-08-21 23:51:15.363843
79	1	2022-08-21 23:57:31.222217	2022-08-21 23:57:31.222217
80	1	2022-08-22 00:00:34.135457	2022-08-22 00:00:34.135457
81	1	2022-08-22 00:06:40.558264	2022-08-22 00:06:40.558264
82	1	2022-08-22 00:14:17.094237	2022-08-22 00:14:17.094237
83	1	2022-08-22 00:18:40.47546	2022-08-22 00:18:40.47546
84	1	2022-08-22 00:20:43.891856	2022-08-22 00:20:43.891856
85	1	2022-08-22 00:48:30.173452	2022-08-22 00:48:30.173452
86	1	2022-08-22 00:48:46.737494	2022-08-22 00:48:46.737494
87	1	2022-08-22 00:49:06.156242	2022-08-22 00:49:06.156242
88	1	2022-08-22 00:49:21.082954	2022-08-22 00:49:21.082954
89	1	2022-08-22 00:49:44.032314	2022-08-22 00:49:44.032314
90	1	2022-08-22 00:50:17.534939	2022-08-22 00:50:17.534939
91	1	2022-08-22 00:53:48.625898	2022-08-22 00:53:48.625898
92	1	2022-08-22 00:54:27.00447	2022-08-22 00:54:27.00447
93	1	2022-08-22 00:54:39.778056	2022-08-22 00:54:39.778056
94	1	2022-08-22 00:55:01.956826	2022-08-22 00:55:01.956826
95	1	2022-08-22 00:55:53.057433	2022-08-22 00:55:53.057433
96	1	2022-08-22 00:56:13.415659	2022-08-22 00:56:13.415659
97	1	2022-08-22 01:00:54.761054	2022-08-22 01:00:54.761054
98	1	2022-08-22 01:00:55.972179	2022-08-22 01:00:55.972179
99	1	2022-08-22 01:01:07.731941	2022-08-22 01:01:07.731941
100	1	2022-08-22 01:27:17.951296	2022-08-22 01:27:17.951296
101	1	2022-08-22 01:32:12.446044	2022-08-22 01:32:12.446044
102	1	2022-08-22 01:32:12.884306	2022-08-22 01:32:12.884306
103	1	2022-08-22 01:32:13.329718	2022-08-22 01:32:13.329718
104	1	2022-08-22 01:32:38.828997	2022-08-22 01:32:38.828997
105	1	2022-08-22 01:32:57.461022	2022-08-22 01:32:57.461022
106	1	2022-08-22 01:33:20.515827	2022-08-22 01:33:20.515827
107	1	2022-08-22 01:33:38.926188	2022-08-22 01:33:38.926188
108	1	2022-08-22 01:33:39.064321	2022-08-22 01:33:39.064321
109	1	2022-08-22 01:34:11.994168	2022-08-22 01:34:11.994168
110	1	2022-08-22 01:34:12.162194	2022-08-22 01:34:12.162194
111	1	2022-08-22 01:34:30.444303	2022-08-22 01:34:30.444303
112	1	2022-08-22 01:34:43.068318	2022-08-22 01:34:43.068318
113	1	2022-08-22 01:35:04.990288	2022-08-22 01:35:04.990288
114	1	2022-08-22 01:35:18.036869	2022-08-22 01:35:18.036869
115	1	2022-08-22 01:35:43.16492	2022-08-22 01:35:43.16492
116	1	2022-08-22 02:00:06.17509	2022-08-22 02:00:06.17509
117	1	2022-08-22 02:00:08.911155	2022-08-22 02:00:08.911155
118	1	2022-08-22 07:49:02.156	2022-08-22 07:49:02.156
119	1	2022-08-22 07:49:03.365822	2022-08-22 07:49:03.365822
120	1	2022-08-22 08:30:03.567661	2022-08-22 08:30:03.567661
121	1	2022-08-22 08:30:03.589959	2022-08-22 08:30:03.589959
122	1	2022-08-22 08:31:05.511093	2022-08-22 08:31:05.511093
123	1	2022-08-22 08:32:31.337452	2022-08-22 08:32:31.337452
124	1	2022-08-22 08:33:17.976071	2022-08-22 08:33:17.976071
125	1	2022-08-22 08:35:19.445989	2022-08-22 08:35:19.445989
126	1	2022-08-22 08:40:16.187541	2022-08-22 08:40:16.187541
127	1	2022-08-22 09:00:04.977964	2022-08-22 09:00:04.977964
128	1	2022-08-22 09:00:05.52507	2022-08-22 09:00:05.52507
129	1	2022-08-22 09:23:17.083501	2022-08-22 09:23:17.083501
130	1	2022-08-22 09:24:11.63641	2022-08-22 09:24:11.63641
131	1	2022-08-22 09:24:54.985986	2022-08-22 09:24:54.985986
132	1	2022-08-22 09:25:28.543842	2022-08-22 09:25:28.543842
133	1	2022-08-22 09:25:39.347064	2022-08-22 09:25:39.347064
134	1	2022-08-22 12:06:26.511307	2022-08-22 12:06:26.511307
135	1	2022-08-22 13:49:49.303586	2022-08-22 13:49:49.303586
136	1	2022-08-22 14:41:53.990203	2022-08-22 14:41:53.990203
137	1	2022-08-22 14:45:24.400715	2022-08-22 14:45:24.400715
138	1	2022-08-22 14:46:38.214504	2022-08-22 14:46:38.214504
139	1	2022-08-22 14:47:09.673128	2022-08-22 14:47:09.673128
140	1	2022-08-22 14:49:41.873714	2022-08-22 14:49:41.873714
141	1	2022-08-22 14:50:05.415746	2022-08-22 14:50:05.415746
142	1	2022-08-22 14:50:33.497979	2022-08-22 14:50:33.497979
143	1	2022-08-22 14:52:36.650357	2022-08-22 14:52:36.650357
144	1	2022-08-22 15:19:05.985309	2022-08-22 15:19:05.985309
145	1	2022-08-22 15:19:12.505306	2022-08-22 15:19:12.505306
146	1	2022-08-22 15:19:36.219218	2022-08-22 15:19:36.219218
147	1	2022-08-22 15:19:40.30617	2022-08-22 15:19:40.30617
148	1	2022-08-22 15:19:47.704446	2022-08-22 15:19:47.704446
149	1	2022-08-22 15:20:03.870615	2022-08-22 15:20:03.870615
150	1	2022-08-22 15:20:10.394263	2022-08-22 15:20:10.394263
151	1	2022-08-22 15:20:43.082901	2022-08-22 15:20:43.082901
152	1	2022-08-22 15:21:07.062978	2022-08-22 15:21:07.062978
153	1	2022-08-22 15:21:25.76338	2022-08-22 15:21:25.76338
154	1	2022-08-22 15:25:07.069242	2022-08-22 15:25:07.069242
155	1	2022-08-22 15:26:09.245454	2022-08-22 15:26:09.245454
156	1	2022-08-22 15:29:53.906962	2022-08-22 15:29:53.906962
157	1	2022-08-22 15:30:06.493664	2022-08-22 15:30:06.493664
158	1	2022-08-22 15:30:09.942799	2022-08-22 15:30:09.942799
159	1	2022-08-22 15:30:21.998851	2022-08-22 15:30:21.998851
160	1	2022-08-22 15:31:03.166697	2022-08-22 15:31:03.166697
161	1	2022-08-22 15:37:20.487299	2022-08-22 15:37:20.487299
162	1	2022-08-22 15:51:54.815377	2022-08-22 15:51:54.815377
163	1	2022-08-22 15:52:23.524466	2022-08-22 15:52:23.524466
164	1	2022-08-22 15:52:48.326963	2022-08-22 15:52:48.326963
165	1	2022-08-22 15:53:18.22958	2022-08-22 15:53:18.22958
166	1	2022-08-22 15:54:18.162627	2022-08-22 15:54:18.162627
167	1	2022-08-22 15:55:27.198414	2022-08-22 15:55:27.198414
168	1	2022-08-22 15:56:13.344834	2022-08-22 15:56:13.344834
169	1	2022-08-22 15:57:17.104	2022-08-22 15:57:17.104
170	1	2022-08-22 15:57:33.319532	2022-08-22 15:57:33.319532
171	1	2022-08-22 15:57:44.055654	2022-08-22 15:57:44.055654
172	1	2022-08-22 15:58:09.358817	2022-08-22 15:58:09.358817
173	1	2022-08-22 15:58:45.446716	2022-08-22 15:58:45.446716
174	1	2022-08-22 15:59:17.380128	2022-08-22 15:59:17.380128
175	1	2022-08-22 16:00:01.547808	2022-08-22 16:00:01.547808
176	1	2022-08-22 16:00:02.725957	2022-08-22 16:00:02.725957
177	1	2022-08-22 16:00:21.61783	2022-08-22 16:00:21.61783
178	1	2022-08-22 16:00:26.651929	2022-08-22 16:00:26.651929
179	1	2022-08-22 16:00:43.90261	2022-08-22 16:00:43.90261
180	1	2022-08-22 16:00:58.603528	2022-08-22 16:00:58.603528
181	1	2022-08-22 16:01:24.948527	2022-08-22 16:01:24.948527
182	1	2022-08-22 16:01:45.659291	2022-08-22 16:01:45.659291
183	1	2022-08-22 16:03:12.079993	2022-08-22 16:03:12.079993
184	1	2022-08-22 16:03:41.097165	2022-08-22 16:03:41.097165
185	1	2022-08-22 16:04:14.504331	2022-08-22 16:04:14.504331
186	1	2022-08-22 16:05:12.356531	2022-08-22 16:05:12.356531
187	1	2022-08-22 16:05:49.067899	2022-08-22 16:05:49.067899
188	1	2022-08-22 16:05:54.794669	2022-08-22 16:05:54.794669
189	1	2022-08-22 16:06:11.486903	2022-08-22 16:06:11.486903
190	1	2022-08-22 16:06:36.830396	2022-08-22 16:06:36.830396
191	1	2022-08-22 16:09:22.588784	2022-08-22 16:09:22.588784
192	1	2022-08-22 16:10:06.657797	2022-08-22 16:10:06.657797
193	1	2022-08-22 16:10:14.745488	2022-08-22 16:10:14.745488
194	1	2022-08-22 16:10:41.93933	2022-08-22 16:10:41.93933
195	1	2022-08-22 16:12:39.821749	2022-08-22 16:12:39.821749
196	1	2022-08-22 16:20:29.496698	2022-08-22 16:20:29.496698
197	1	2022-08-22 16:21:04.937348	2022-08-22 16:21:04.937348
198	1	2022-08-22 16:25:54.419162	2022-08-22 16:25:54.419162
199	1	2022-08-22 16:28:29.990145	2022-08-22 16:28:29.990145
200	1	2022-08-22 16:34:46.858777	2022-08-22 16:34:46.858777
201	1	2022-08-22 16:34:50.353183	2022-08-22 16:34:50.353183
202	1	2022-08-22 16:34:58.073238	2022-08-22 16:34:58.073238
203	1	2022-08-22 16:35:00.954652	2022-08-22 16:35:00.954652
204	1	2022-08-22 16:35:04.431083	2022-08-22 16:35:04.431083
205	1	2022-08-22 16:36:22.728535	2022-08-22 16:36:22.728535
206	1	2022-08-22 16:37:52.461812	2022-08-22 16:37:52.461812
207	1	2022-08-22 16:40:33.79051	2022-08-22 16:40:33.79051
208	1	2022-08-22 16:40:55.96046	2022-08-22 16:40:55.96046
209	1	2022-08-22 16:41:20.491691	2022-08-22 16:41:20.491691
210	1	2022-08-22 16:41:44.967555	2022-08-22 16:41:44.967555
211	1	2022-08-22 16:43:29.060932	2022-08-22 16:43:29.060932
212	1	2022-08-22 16:43:57.856604	2022-08-22 16:43:57.856604
213	1	2022-08-22 16:44:19.137736	2022-08-22 16:44:19.137736
214	1	2022-08-22 16:45:21.865793	2022-08-22 16:45:21.865793
215	1	2022-08-22 16:46:20.557732	2022-08-22 16:46:20.557732
216	1	2022-08-22 16:47:42.771174	2022-08-22 16:47:42.771174
217	1	2022-08-22 16:48:10.950298	2022-08-22 16:48:10.950298
218	1	2022-08-22 16:48:36.176444	2022-08-22 16:48:36.176444
219	1	2022-08-22 16:49:01.904273	2022-08-22 16:49:01.904273
220	1	2022-08-22 16:49:24.445075	2022-08-22 16:49:24.445075
221	1	2022-08-22 16:50:29.722665	2022-08-22 16:50:29.722665
222	1	2022-08-22 17:00:11.548671	2022-08-22 17:00:11.548671
223	1	2022-08-22 17:00:14.887149	2022-08-22 17:00:14.887149
224	1	2022-08-22 17:00:34.96681	2022-08-22 17:00:34.96681
225	1	2022-08-22 17:00:45.576761	2022-08-22 17:00:45.576761
226	1	2022-08-22 17:01:08.616867	2022-08-22 17:01:08.616867
227	1	2022-08-22 17:01:28.126947	2022-08-22 17:01:28.126947
228	1	2022-08-22 17:01:31.410436	2022-08-22 17:01:31.410436
229	1	2022-08-22 17:02:21.386392	2022-08-22 17:02:21.386392
230	1	2022-08-22 17:02:29.421955	2022-08-22 17:02:29.421955
231	1	2022-08-22 17:02:51.061214	2022-08-22 17:02:51.061214
232	1	2022-08-22 17:25:53.316643	2022-08-22 17:25:53.316643
233	1	2022-08-22 17:26:52.110344	2022-08-22 17:26:52.110344
234	1	2022-08-22 17:27:23.305421	2022-08-22 17:27:23.305421
235	1	2022-08-22 17:29:29.910255	2022-08-22 17:29:29.910255
236	1	2022-08-22 17:29:50.331548	2022-08-22 17:29:50.331548
237	1	2022-08-22 17:30:01.57111	2022-08-22 17:30:01.57111
238	1	2022-08-22 17:30:05.153652	2022-08-22 17:30:05.153652
239	1	2022-08-22 17:30:22.733662	2022-08-22 17:30:22.733662
240	1	2022-08-22 17:30:26.763637	2022-08-22 17:30:26.763637
241	1	2022-08-22 17:30:30.30068	2022-08-22 17:30:30.30068
242	1	2022-08-22 17:31:02.716722	2022-08-22 17:31:02.716722
243	1	2022-08-22 17:31:08.65317	2022-08-22 17:31:08.65317
244	1	2022-08-22 17:31:18.00072	2022-08-22 17:31:18.00072
245	1	2022-08-22 17:59:14.922077	2022-08-22 17:59:14.922077
246	1	2022-08-22 18:00:04.893435	2022-08-22 18:00:04.893435
247	1	2022-08-22 18:00:05.176041	2022-08-22 18:00:05.176041
248	1	2022-08-22 18:00:27.974088	2022-08-22 18:00:27.974088
249	1	2022-08-22 18:00:28.211356	2022-08-22 18:00:28.211356
250	1	2022-08-22 18:00:53.85421	2022-08-22 18:00:53.85421
251	1	2022-08-22 18:01:02.41421	2022-08-22 18:01:02.41421
252	1	2022-08-22 18:01:37.979828	2022-08-22 18:01:37.979828
253	1	2022-08-22 18:03:26.330594	2022-08-22 18:03:26.330594
254	1	2022-08-22 18:04:09.040638	2022-08-22 18:04:09.040638
255	1	2022-08-22 18:04:19.075099	2022-08-22 18:04:19.075099
256	1	2022-08-22 18:04:35.859127	2022-08-22 18:04:35.859127
257	1	2022-08-22 18:04:47.104719	2022-08-22 18:04:47.104719
258	1	2022-08-22 18:04:58.256547	2022-08-22 18:04:58.256547
259	1	2022-08-22 18:05:09.443105	2022-08-22 18:05:09.443105
260	1	2022-08-22 18:05:14.874786	2022-08-22 18:05:14.874786
261	1	2022-08-22 18:05:22.082297	2022-08-22 18:05:22.082297
262	1	2022-08-22 18:05:30.071861	2022-08-22 18:05:30.071861
263	1	2022-08-22 18:05:46.392027	2022-08-22 18:05:46.392027
264	1	2022-08-22 18:05:48.560036	2022-08-22 18:05:48.560036
265	1	2022-08-22 18:06:09.29864	2022-08-22 18:06:09.29864
266	1	2022-08-22 18:06:28.392743	2022-08-22 18:06:28.392743
267	1	2022-08-22 18:06:47.995046	2022-08-22 18:06:47.995046
268	1	2022-08-22 18:07:19.225634	2022-08-22 18:07:19.225634
269	1	2022-08-22 18:08:15.798767	2022-08-22 18:08:15.798767
270	1	2022-08-22 18:08:26.253861	2022-08-22 18:08:26.253861
271	1	2022-08-22 18:08:42.967218	2022-08-22 18:08:42.967218
272	1	2022-08-22 18:08:50.540563	2022-08-22 18:08:50.540563
273	1	2022-08-22 18:09:38.136537	2022-08-22 18:09:38.136537
274	1	2022-08-22 18:10:34.753212	2022-08-22 18:10:34.753212
275	1	2022-08-22 18:11:49.677176	2022-08-22 18:11:49.677176
276	1	2022-08-22 18:14:14.972808	2022-08-22 18:14:14.972808
277	1	2022-08-22 18:14:47.570254	2022-08-22 18:14:47.570254
278	1	2022-08-22 18:15:37.918697	2022-08-22 18:15:37.918697
279	1	2022-08-22 18:16:02.993931	2022-08-22 18:16:02.993931
280	1	2022-08-22 18:16:32.282265	2022-08-22 18:16:32.282265
281	1	2022-08-22 18:16:59.494511	2022-08-22 18:16:59.494511
282	1	2022-08-22 18:18:53.731101	2022-08-22 18:18:53.731101
283	1	2022-08-22 18:19:19.030716	2022-08-22 18:19:19.030716
284	1	2022-08-22 18:19:39.790531	2022-08-22 18:19:39.790531
285	1	2022-08-22 18:20:38.100713	2022-08-22 18:20:38.100713
286	1	2022-08-22 18:23:08.207183	2022-08-22 18:23:08.207183
287	1	2022-08-22 18:28:09.35694	2022-08-22 18:28:09.35694
288	1	2022-08-22 18:29:28.172533	2022-08-22 18:29:28.172533
289	1	2022-08-22 18:30:06.228498	2022-08-22 18:30:06.228498
290	1	2022-08-22 18:30:11.066554	2022-08-22 18:30:11.066554
291	1	2022-08-22 18:32:07.086149	2022-08-22 18:32:07.086149
292	1	2022-08-22 18:57:56.930203	2022-08-22 18:57:56.930203
293	1	2022-08-22 19:00:06.591693	2022-08-22 19:00:06.591693
294	1	2022-08-22 19:00:15.475738	2022-08-22 19:00:15.475738
295	1	2022-08-22 19:00:32.871185	2022-08-22 19:00:32.871185
296	1	2022-08-22 19:00:43.185558	2022-08-22 19:00:43.185558
297	1	2022-08-22 19:01:02.419674	2022-08-22 19:01:02.419674
298	1	2022-08-22 19:01:29.055442	2022-08-22 19:01:29.055442
299	1	2022-08-22 19:02:04.990902	2022-08-22 19:02:04.990902
300	1	2022-08-22 19:02:16.218686	2022-08-22 19:02:16.218686
301	1	2022-08-22 19:04:24.572404	2022-08-22 19:04:24.572404
302	1	2022-08-22 19:05:28.218878	2022-08-22 19:05:28.218878
303	1	2022-08-22 19:10:02.28051	2022-08-22 19:10:02.28051
304	1	2022-08-22 19:10:17.361266	2022-08-22 19:10:17.361266
305	1	2022-08-22 19:21:18.434787	2022-08-22 19:21:18.434787
306	1	2022-08-22 19:21:39.483931	2022-08-22 19:21:39.483931
307	1	2022-08-22 19:30:03.933341	2022-08-22 19:30:03.933341
308	1	2022-08-22 19:30:08.659165	2022-08-22 19:30:08.659165
309	1	2022-08-22 19:30:28.662075	2022-08-22 19:30:28.662075
310	1	2022-08-22 19:30:37.03752	2022-08-22 19:30:37.03752
311	1	2022-08-22 19:30:53.680967	2022-08-22 19:30:53.680967
312	1	2022-08-22 19:30:58.777224	2022-08-22 19:30:58.777224
313	1	2022-08-22 20:00:02.682568	2022-08-22 20:00:02.682568
314	1	2022-08-22 20:00:09.637875	2022-08-22 20:00:09.637875
315	1	2022-08-22 20:00:33.92348	2022-08-22 20:00:33.92348
316	1	2022-08-22 20:01:02.83471	2022-08-22 20:01:02.83471
317	1	2022-08-22 20:30:02.423094	2022-08-22 20:30:02.423094
318	1	2022-08-22 20:30:11.131407	2022-08-22 20:30:11.131407
319	1	2022-08-22 20:30:35.368029	2022-08-22 20:30:35.368029
320	1	2022-08-22 20:30:43.378481	2022-08-22 20:30:43.378481
321	1	2022-08-22 20:31:05.369435	2022-08-22 20:31:05.369435
322	1	2022-08-22 20:31:09.743407	2022-08-22 20:31:09.743407
323	1	2022-08-22 20:31:47.883018	2022-08-22 20:31:47.883018
324	1	2022-08-22 20:32:05.365213	2022-08-22 20:32:05.365213
325	1	2022-08-22 20:33:43.026474	2022-08-22 20:33:43.026474
326	1	2022-08-22 20:38:27.071831	2022-08-22 20:38:27.071831
327	1	2022-08-22 21:00:04.108338	2022-08-22 21:00:04.108338
328	1	2022-08-22 21:00:06.191827	2022-08-22 21:00:06.191827
329	1	2022-08-22 21:30:05.248229	2022-08-22 21:30:05.248229
330	1	2022-08-22 21:30:05.821574	2022-08-22 21:30:05.821574
331	1	2022-08-22 22:00:05.328953	2022-08-22 22:00:05.328953
332	1	2022-08-22 22:00:05.880605	2022-08-22 22:00:05.880605
333	1	2022-08-22 22:30:04.692948	2022-08-22 22:30:04.692948
334	1	2022-08-22 22:30:05.197193	2022-08-22 22:30:05.197193
335	1	2022-08-22 23:00:04.008512	2022-08-22 23:00:04.008512
336	1	2022-08-22 23:00:04.530262	2022-08-22 23:00:04.530262
337	1	2022-08-22 23:30:01.427001	2022-08-22 23:30:01.427001
338	1	2022-08-22 23:30:01.912047	2022-08-22 23:30:01.912047
339	1	2022-08-23 09:00:02.719846	2022-08-23 09:00:02.719846
340	1	2022-08-23 09:00:03.459216	2022-08-23 09:00:03.459216
341	1	2022-08-23 09:28:37.435447	2022-08-23 09:28:37.435447
342	1	2022-08-23 12:57:52.8513	2022-08-23 12:57:52.8513
343	1	2022-08-23 12:59:30.202242	2022-08-23 12:59:30.202242
344	1	2022-08-23 12:59:30.501073	2022-08-23 12:59:30.501073
345	1	2022-08-23 13:00:02.588495	2022-08-23 13:00:02.588495
346	1	2022-08-23 13:00:05.777704	2022-08-23 13:00:05.777704
347	1	2022-08-23 13:01:48.523626	2022-08-23 13:01:48.523626
348	1	2022-08-23 13:08:27.408539	2022-08-23 13:08:27.408539
349	1	2022-08-23 13:30:02.348735	2022-08-23 13:30:02.348735
350	1	2022-08-23 13:30:03.207608	2022-08-23 13:30:03.207608
351	1	2022-08-23 14:00:03.574186	2022-08-23 14:00:03.574186
352	1	2022-08-23 14:00:06.804414	2022-08-23 14:00:06.804414
353	1	2022-08-23 14:30:05.745445	2022-08-23 14:30:05.745445
354	1	2022-08-23 14:30:06.05042	2022-08-23 14:30:06.05042
355	1	2022-08-23 15:00:01.208602	2022-08-23 15:00:01.208602
356	1	2022-08-23 15:00:05.35272	2022-08-23 15:00:05.35272
357	1	2022-08-23 15:30:06.337127	2022-08-23 15:30:06.337127
358	1	2022-08-23 15:30:06.574551	2022-08-23 15:30:06.574551
359	1	2022-08-23 16:00:02.051821	2022-08-23 16:00:02.051821
360	1	2022-08-23 16:00:05.264206	2022-08-23 16:00:05.264206
361	1	2022-08-23 16:30:04.762341	2022-08-23 16:30:04.762341
362	1	2022-08-23 16:30:05.055118	2022-08-23 16:30:05.055118
363	1	2022-08-23 17:00:03.060917	2022-08-23 17:00:03.060917
364	1	2022-08-23 17:00:04.153719	2022-08-23 17:00:04.153719
365	1	2022-08-23 17:30:05.313717	2022-08-23 17:30:05.313717
366	1	2022-08-23 17:30:05.59352	2022-08-23 17:30:05.59352
367	1	2022-08-23 17:56:49.380599	2022-08-23 17:56:49.380599
368	1	2022-08-23 18:00:18.201763	2022-08-23 18:00:18.201763
369	1	2022-08-23 18:00:20.029826	2022-08-23 18:00:20.029826
370	1	2022-08-23 19:01:54.552989	2022-08-23 19:01:54.552989
371	1	2022-08-23 19:01:57.484567	2022-08-23 19:01:57.484567
372	1	2022-08-23 19:16:18.631359	2022-08-23 19:16:18.631359
373	1	2022-08-23 19:17:57.844865	2022-08-23 19:17:57.844865
374	1	2022-08-23 19:47:10.706242	2022-08-23 19:47:10.706242
375	1	2022-08-23 20:00:30.470662	2022-08-23 20:00:30.470662
376	1	2022-08-23 20:01:54.448912	2022-08-23 20:01:54.448912
377	1	2022-08-23 20:30:02.002779	2022-08-23 20:30:02.002779
378	1	2022-08-23 21:52:15.766163	2022-08-23 21:52:15.766163
379	1	2022-08-23 22:04:34.962409	2022-08-23 22:04:34.962409
380	1	2022-08-23 22:30:02.410293	2022-08-23 22:30:02.410293
381	1	2022-08-23 23:00:06.086099	2022-08-23 23:00:06.086099
382	1	2022-08-23 23:30:05.544334	2022-08-23 23:30:05.544334
383	1	2022-08-24 00:00:03.494702	2022-08-24 00:00:03.494702
384	1	2022-08-25 06:38:34.607918	2022-08-25 06:38:34.607918
385	1	2022-08-25 07:00:04.211311	2022-08-25 07:00:04.211311
386	1	2022-08-25 07:07:47.073711	2022-08-25 07:07:47.073711
387	1	2022-08-25 07:09:19.970276	2022-08-25 07:09:19.970276
388	1	2022-08-25 17:30:23.999137	2022-08-25 17:30:23.999137
389	1	2022-08-25 18:00:02.058741	2022-08-25 18:00:02.058741
390	1	2022-08-25 18:30:01.508705	2022-08-25 18:30:01.508705
391	1	2022-08-25 19:00:02.024377	2022-08-25 19:00:02.024377
392	1	2022-08-25 19:00:43.357591	2022-08-25 19:00:43.357591
393	1	2022-08-25 19:30:04.872502	2022-08-25 19:30:04.872502
394	1	2022-08-25 20:00:02.248333	2022-08-25 20:00:02.248333
395	1	2022-08-25 20:30:03.590507	2022-08-25 20:30:03.590507
396	1	2022-08-25 20:33:25.15113	2022-08-25 20:33:25.15113
397	1	2022-08-25 20:33:37.836822	2022-08-25 20:33:37.836822
398	1	2022-08-25 20:33:59.203871	2022-08-25 20:33:59.203871
399	1	2022-08-25 21:00:04.983294	2022-08-25 21:00:04.983294
400	1	2022-08-25 21:30:02.828712	2022-08-25 21:30:02.828712
401	1	2022-08-25 22:00:03.544022	2022-08-25 22:00:03.544022
402	1	2022-08-25 22:30:04.143803	2022-08-25 22:30:04.143803
403	1	2022-08-25 23:00:01.913293	2022-08-25 23:00:01.913293
404	1	2022-08-25 23:30:08.344466	2022-08-25 23:30:08.344466
405	1	2022-08-26 00:00:04.891495	2022-08-26 00:00:04.891495
406	1	2022-08-26 00:30:05.702115	2022-08-26 00:30:05.702115
407	1	2022-08-26 01:00:07.768294	2022-08-26 01:00:07.768294
408	1	2022-08-26 01:30:05.044758	2022-08-26 01:30:05.044758
409	1	2022-08-26 02:01:22.847598	2022-08-26 02:01:22.847598
410	1	2022-08-26 02:44:17.63869	2022-08-26 02:44:17.63869
411	1	2022-08-26 03:33:22.281465	2022-08-26 03:33:22.281465
412	1	2022-08-26 08:30:05.295306	2022-08-26 08:30:05.295306
413	1	2022-08-26 09:00:02.741292	2022-08-26 09:00:02.741292
414	1	2022-08-26 09:30:04.289256	2022-08-26 09:30:04.289256
415	1	2022-08-26 10:13:06.453281	2022-08-26 10:13:06.453281
416	1	2022-08-26 11:09:40.244719	2022-08-26 11:09:40.244719
417	1	2022-08-26 11:09:58.052548	2022-08-26 11:09:58.052548
418	1	2022-08-26 11:10:28.574969	2022-08-26 11:10:28.574969
419	1	2022-08-26 11:10:57.25976	2022-08-26 11:10:57.25976
420	1	2022-08-26 11:12:02.073545	2022-08-26 11:12:02.073545
421	1	2022-08-26 11:14:10.96225	2022-08-26 11:14:10.96225
422	1	2022-08-26 11:21:24.350484	2022-08-26 11:21:24.350484
423	1	2022-08-26 11:30:01.528081	2022-08-26 11:30:01.528081
424	1	2022-08-26 11:32:46.251176	2022-08-26 11:32:46.251176
425	1	2022-08-26 12:00:06.807256	2022-08-26 12:00:06.807256
426	1	2022-08-26 12:30:02.930414	2022-08-26 12:30:02.930414
427	1	2022-08-27 17:20:04.209795	2022-08-27 17:20:04.209795
428	1	2022-08-27 17:40:04.312987	2022-08-27 17:40:04.312987
429	1	2022-08-27 18:00:07.802419	2022-08-27 18:00:07.802419
430	1	2022-08-27 18:20:01.688	2022-08-27 18:20:01.688
431	1	2022-08-27 18:20:35.030328	2022-08-27 18:20:35.030328
432	1	2022-08-27 18:21:27.040964	2022-08-27 18:21:27.040964
433	1	2022-08-27 18:22:26.106509	2022-08-27 18:22:26.106509
434	1	2022-08-27 18:25:23.546517	2022-08-27 18:25:23.546517
435	1	2022-08-27 18:30:45.468658	2022-08-27 18:30:45.468658
436	1	2022-08-27 18:40:04.699365	2022-08-27 18:40:04.699365
437	1	2022-08-27 18:40:32.314235	2022-08-27 18:40:32.314235
438	1	2022-08-27 18:43:18.324894	2022-08-27 18:43:18.324894
439	1	2022-08-27 19:00:04.43842	2022-08-27 19:00:04.43842
440	1	2022-08-27 19:20:05.878105	2022-08-27 19:20:05.878105
441	1	2022-08-27 19:40:03.862151	2022-08-27 19:40:03.862151
442	1	2022-08-27 20:00:02.427222	2022-08-27 20:00:02.427222
443	1	2022-08-27 20:20:03.173061	2022-08-27 20:20:03.173061
444	1	2022-08-27 20:40:03.102398	2022-08-27 20:40:03.102398
445	1	2022-08-27 21:00:02.19282	2022-08-27 21:00:02.19282
446	1	2022-08-27 21:20:03.942131	2022-08-27 21:20:03.942131
447	1	2022-08-27 21:40:02.930062	2022-08-27 21:40:02.930062
448	1	2022-08-27 22:00:04.66733	2022-08-27 22:00:04.66733
449	1	2022-08-27 22:20:04.184806	2022-08-27 22:20:04.184806
450	1	2022-08-27 22:40:03.644444	2022-08-27 22:40:03.644444
451	1	2022-08-27 23:00:05.919384	2022-08-27 23:00:05.919384
452	1	2022-08-27 23:20:13.323988	2022-08-27 23:20:13.323988
453	1	2022-08-27 23:40:04.373637	2022-08-27 23:40:04.373637
454	1	2022-08-28 00:00:03.821785	2022-08-28 00:00:03.821785
455	1	2022-08-28 00:20:05.633408	2022-08-28 00:20:05.633408
456	1	2022-08-28 00:46:20.926942	2022-08-28 00:46:20.926942
457	1	2022-08-28 01:00:02.208844	2022-08-28 01:00:02.208844
458	1	2022-08-28 01:20:02.720492	2022-08-28 01:20:02.720492
459	1	2022-08-28 01:40:01.279582	2022-08-28 01:40:01.279582
460	1	2022-08-28 02:00:04.711548	2022-08-28 02:00:04.711548
461	1	2022-08-28 07:40:21.076914	2022-08-28 07:40:21.076914
462	1	2022-08-28 07:40:22.665449	2022-08-28 07:40:22.665449
463	1	2022-08-28 07:40:22.903056	2022-08-28 07:40:22.903056
464	1	2022-08-28 07:40:23.40434	2022-08-28 07:40:23.40434
465	1	2022-08-28 07:40:24.308452	2022-08-28 07:40:24.308452
466	1	2022-08-28 07:41:12.977414	2022-08-28 07:41:12.977414
467	1	2022-08-28 07:41:14.297084	2022-08-28 07:41:14.297084
468	1	2022-08-28 07:41:14.885263	2022-08-28 07:41:14.885263
469	1	2022-08-28 07:41:15.186375	2022-08-28 07:41:15.186375
470	1	2022-08-28 07:41:15.794359	2022-08-28 07:41:15.794359
471	1	2022-08-28 07:41:16.315325	2022-08-28 07:41:16.315325
472	1	2022-08-28 07:41:16.605031	2022-08-28 07:41:16.605031
473	1	2022-08-28 07:41:17.165446	2022-08-28 07:41:17.165446
474	1	2022-08-28 07:41:17.723121	2022-08-28 07:41:17.723121
475	1	2022-08-28 07:41:17.984044	2022-08-28 07:41:17.984044
476	1	2022-08-28 07:41:18.507635	2022-08-28 07:41:18.507635
477	1	2022-08-28 07:41:19.163015	2022-08-28 07:41:19.163015
478	1	2022-08-28 07:41:52.811863	2022-08-28 07:41:52.811863
479	1	2022-08-28 07:41:54.365868	2022-08-28 07:41:54.365868
480	1	2022-08-28 07:41:55.499731	2022-08-28 07:41:55.499731
481	1	2022-08-28 07:41:56.623528	2022-08-28 07:41:56.623528
482	1	2022-08-28 07:41:56.92844	2022-08-28 07:41:56.92844
483	1	2022-08-28 07:41:57.223019	2022-08-28 07:41:57.223019
484	1	2022-08-28 07:41:57.511597	2022-08-28 07:41:57.511597
485	1	2022-08-28 07:41:57.833622	2022-08-28 07:41:57.833622
486	1	2022-08-28 07:41:58.444221	2022-08-28 07:41:58.444221
487	1	2022-08-28 07:41:59.314152	2022-08-28 07:41:59.314152
488	1	2022-08-28 07:42:18.948224	2022-08-28 07:42:18.948224
489	1	2022-08-28 07:42:19.25396	2022-08-28 07:42:19.25396
490	1	2022-08-28 07:42:19.533741	2022-08-28 07:42:19.533741
491	1	2022-08-28 07:42:19.834551	2022-08-28 07:42:19.834551
492	1	2022-08-28 07:42:47.154177	2022-08-28 07:42:47.154177
493	1	2022-08-28 07:42:48.450478	2022-08-28 07:42:48.450478
494	1	2022-08-28 07:42:48.719985	2022-08-28 07:42:48.719985
495	1	2022-08-28 07:42:53.784055	2022-08-28 07:42:53.784055
496	1	2022-08-28 07:43:26.505103	2022-08-28 07:43:26.505103
497	1	2022-08-28 07:43:31.461295	2022-08-28 07:43:31.461295
498	1	2022-08-28 07:44:23.87216	2022-08-28 07:44:23.87216
499	1	2022-08-28 07:44:24.1617	2022-08-28 07:44:24.1617
500	1	2022-08-28 07:46:08.669109	2022-08-28 07:46:08.669109
501	1	2022-08-28 07:46:15.495897	2022-08-28 07:46:15.495897
502	1	2022-08-28 07:51:26.443876	2022-08-28 07:51:26.443876
503	1	2022-08-28 08:00:07.097368	2022-08-28 08:00:07.097368
504	1	2022-08-28 08:20:05.540674	2022-08-28 08:20:05.540674
505	1	2022-08-28 08:40:03.311254	2022-08-28 08:40:03.311254
506	1	2022-08-28 09:00:03.282857	2022-08-28 09:00:03.282857
507	1	2022-08-28 09:20:05.52996	2022-08-28 09:20:05.52996
508	1	2022-08-28 09:40:04.672196	2022-08-28 09:40:04.672196
509	1	2022-08-28 10:00:04.641266	2022-08-28 10:00:04.641266
510	1	2022-08-28 10:20:06.273813	2022-08-28 10:20:06.273813
511	1	2022-08-28 10:40:01.071463	2022-08-28 10:40:01.071463
512	1	2022-08-28 11:00:06.535866	2022-08-28 11:00:06.535866
513	1	2022-08-28 11:20:05.062043	2022-08-28 11:20:05.062043
514	1	2022-08-28 11:28:45.903462	2022-08-28 11:28:45.903462
515	1	2022-08-28 11:31:18.835787	2022-08-28 11:31:18.835787
516	1	2022-08-28 11:31:48.736847	2022-08-28 11:31:48.736847
517	1	2022-08-28 11:32:51.151945	2022-08-28 11:32:51.151945
518	1	2022-08-28 11:40:03.78765	2022-08-28 11:40:03.78765
519	1	2022-08-28 12:00:05.335177	2022-08-28 12:00:05.335177
520	1	2022-08-28 12:20:03.390683	2022-08-28 12:20:03.390683
521	1	2022-08-28 12:40:02.558161	2022-08-28 12:40:02.558161
522	1	2022-08-28 13:00:02.690219	2022-08-28 13:00:02.690219
523	1	2022-08-28 13:20:01.821093	2022-08-28 13:20:01.821093
524	1	2022-08-28 13:40:04.570915	2022-08-28 13:40:04.570915
525	1	2022-08-28 14:00:03.389614	2022-08-28 14:00:03.389614
526	1	2022-08-28 14:20:02.123521	2022-08-28 14:20:02.123521
527	1	2022-08-28 14:40:01.711949	2022-08-28 14:40:01.711949
528	1	2022-08-28 15:01:08.091953	2022-08-28 15:01:08.091953
529	1	2022-08-28 15:20:03.417878	2022-08-28 15:20:03.417878
530	1	2022-08-28 15:40:03.839235	2022-08-28 15:40:03.839235
531	1	2022-08-28 16:00:02.136693	2022-08-28 16:00:02.136693
532	1	2022-08-28 16:20:05.075072	2022-08-28 16:20:05.075072
533	1	2022-08-28 16:40:02.053044	2022-08-28 16:40:02.053044
534	1	2022-08-28 18:40:06.210595	2022-08-28 18:40:06.210595
535	1	2022-08-28 19:00:04.78231	2022-08-28 19:00:04.78231
536	1	2022-08-28 19:20:02.17954	2022-08-28 19:20:02.17954
537	1	2022-08-28 19:40:06.008346	2022-08-28 19:40:06.008346
538	1	2022-08-28 20:00:02.004093	2022-08-28 20:00:02.004093
539	1	2022-08-28 20:20:05.237449	2022-08-28 20:20:05.237449
540	1	2022-08-28 20:40:03.298585	2022-08-28 20:40:03.298585
541	1	2022-08-28 21:00:01.177848	2022-08-28 21:00:01.177848
542	1	2022-08-28 21:20:03.086042	2022-08-28 21:20:03.086042
543	1	2022-08-28 21:40:04.399475	2022-08-28 21:40:04.399475
\.


--
-- Data for Name: keyword_results; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.keyword_results (id, keyword_id, data, created_at, updated_at) FROM stdin;
1	1	{"ads": false, "position": 99, "brand_name": "SITIA", "page_number": 11, "product_name": "Масло растительное Оливковое масло нерафинированное Extra Virgin / нерафинированное / холодный отжим / первый отжим", "absolute_index": 1199}	2022-08-27 23:35:47.555609	2022-08-27 23:35:47.555609
2	1	{"ads": false, "position": 99, "brand_name": "SITIA", "page_number": 11, "product_name": "Масло растительное Оливковое масло нерафинированное Extra Virgin / нерафинированное / холодный отжим / первый отжим", "absolute_index": 1199}	2022-08-27 23:36:39.66888	2022-08-27 23:36:39.66888
3	1	{"ads": false, "url": "https://www.wildberries.ru/catalog/0/search.aspx?page=11&sort=popular&search=%D0%9E%D0%BB%D0%B8%D0%B2%D0%BA%D0%BE%D0%B2%D0%BE%D0%B5+%D0%BC%D0%B0%D1%81%D0%BB%D0%BE+extra+virgin", "position": 97, "brand_name": "SITIA", "page_number": 11, "product_name": "Масло растительное Оливковое масло нерафинированное Extra Virgin / нерафинированное / холодный отжим / первый отжим", "absolute_index": 1197}	2022-08-27 23:38:05.621798	2022-08-27 23:38:05.621798
4	1	{"ads": true, "url": "https://www.wildberries.ru/catalog/0/search.aspx?sort=popular&search=%D0%9E%D0%BB%D0%B8%D0%B2%D0%BA%D0%BE%D0%B2%D0%BE%D0%B5+%D0%BC%D0%B0%D1%81%D0%BB%D0%BE+extra+virgin", "position": 2, "brand_name": "SITIA", "page_number": 1, "product_name": "Масло растительное Оливковое масло нерафинированное Extra Virgin / нерафинированное / холодный отжим / первый отжим", "absolute_index": 3}	2022-08-27 23:41:58.981245	2022-08-27 23:41:58.981245
5	1	{"ads": false, "url": "https://www.wildberries.ru/catalog/0/search.aspx?page=11&sort=popular&search=%D0%9E%D0%BB%D0%B8%D0%B2%D0%BA%D0%BE%D0%B2%D0%BE%D0%B5+%D0%BC%D0%B0%D1%81%D0%BB%D0%BE+extra+virgin", "position": 99, "brand_name": "SITIA", "page_number": 11, "product_name": "Масло растительное Оливковое масло нерафинированное Extra Virgin / нерафинированное / холодный отжим / первый отжим", "absolute_index": 1199}	2022-08-27 23:42:07.752229	2022-08-27 23:42:07.752229
6	1	{"ads": true, "url": "https://www.wildberries.ru/catalog/0/search.aspx?sort=popular&search=%D0%9E%D0%BB%D0%B8%D0%B2%D0%BA%D0%BE%D0%B2%D0%BE%D0%B5+%D0%BC%D0%B0%D1%81%D0%BB%D0%BE+extra+virgin", "position": 2, "brand_name": "SITIA", "page_number": 1, "product_name": "Масло растительное Оливковое масло нерафинированное Extra Virgin / нерафинированное / холодный отжим / первый отжим", "absolute_index": 3}	2022-08-27 23:43:08.115185	2022-08-27 23:43:08.115185
7	1	{"ads": false, "url": "https://www.wildberries.ru/catalog/0/search.aspx?page=11&sort=popular&search=%D0%9E%D0%BB%D0%B8%D0%B2%D0%BA%D0%BE%D0%B2%D0%BE%D0%B5+%D0%BC%D0%B0%D1%81%D0%BB%D0%BE+extra+virgin", "position": 99, "brand_name": "SITIA", "page_number": 11, "product_name": "Масло растительное Оливковое масло нерафинированное Extra Virgin / нерафинированное / холодный отжим / первый отжим", "absolute_index": 1199}	2022-08-27 23:43:15.584653	2022-08-27 23:43:15.584653
8	1	{"ads": true, "url": "https://www.wildberries.ru/catalog/0/search.aspx?sort=popular&search=%D0%9E%D0%BB%D0%B8%D0%B2%D0%BA%D0%BE%D0%B2%D0%BE%D0%B5+%D0%BC%D0%B0%D1%81%D0%BB%D0%BE+extra+virgin", "position": 2, "brand_name": "SITIA", "page_number": 1, "product_name": "Масло растительное Оливковое масло нерафинированное Extra Virgin / нерафинированное / холодный отжим / первый отжим", "absolute_index": 3}	2022-08-27 23:46:22.262043	2022-08-27 23:46:22.262043
9	1	{"ads": false, "url": "https://www.wildberries.ru/catalog/0/search.aspx?page=11&sort=popular&search=%D0%9E%D0%BB%D0%B8%D0%B2%D0%BA%D0%BE%D0%B2%D0%BE%D0%B5+%D0%BC%D0%B0%D1%81%D0%BB%D0%BE+extra+virgin", "position": 99, "brand_name": "SITIA", "page_number": 11, "product_name": "Масло растительное Оливковое масло нерафинированное Extra Virgin / нерафинированное / холодный отжим / первый отжим", "absolute_index": 1199}	2022-08-27 23:46:30.470508	2022-08-27 23:46:30.470508
10	2	{"ads": false, "url": "https://www.wildberries.ru/catalog/0/search.aspx?page=5&sort=popular&search=%D0%9E%D0%BB%D0%B8%D0%B2%D0%BA%D0%BE%D0%B2%D0%BE%D0%B5+%D0%BC%D0%B0%D1%81%D0%BB%D0%BE+%D0%B3%D1%80%D0%B5%D1%87%D0%B5%D1%81%D0%BA%D0%BE%D0%B5", "position": 54, "brand_name": "SITIA", "page_number": 5, "product_name": "Масло растительное Оливковое масло нерафинированное Extra Virgin / нерафинированное / холодный отжим / первый отжим", "absolute_index": 554}	2022-08-27 23:46:39.988292	2022-08-27 23:46:39.988292
11	1	{"ads": true, "url": "https://www.wildberries.ru/catalog/0/search.aspx?sort=popular&search=%D0%9E%D0%BB%D0%B8%D0%B2%D0%BA%D0%BE%D0%B2%D0%BE%D0%B5+%D0%BC%D0%B0%D1%81%D0%BB%D0%BE+extra+virgin", "position": 2, "brand_name": "SITIA", "page_number": 1, "product_name": "Масло растительное Оливковое масло нерафинированное Extra Virgin / нерафинированное / холодный отжим / первый отжим", "absolute_index": 3}	2022-08-27 23:46:44.000364	2022-08-27 23:46:44.000364
12	1	{"ads": false, "url": "https://www.wildberries.ru/catalog/0/search.aspx?page=11&sort=popular&search=%D0%9E%D0%BB%D0%B8%D0%B2%D0%BA%D0%BE%D0%B2%D0%BE%D0%B5+%D0%BC%D0%B0%D1%81%D0%BB%D0%BE+extra+virgin", "position": 99, "brand_name": "SITIA", "page_number": 11, "product_name": "Масло растительное Оливковое масло нерафинированное Extra Virgin / нерафинированное / холодный отжим / первый отжим", "absolute_index": 1199}	2022-08-27 23:46:52.505126	2022-08-27 23:46:52.505126
13	2	{"ads": false, "url": "https://www.wildberries.ru/catalog/0/search.aspx?page=5&sort=popular&search=%D0%9E%D0%BB%D0%B8%D0%B2%D0%BA%D0%BE%D0%B2%D0%BE%D0%B5+%D0%BC%D0%B0%D1%81%D0%BB%D0%BE+%D0%B3%D1%80%D0%B5%D1%87%D0%B5%D1%81%D0%BA%D0%BE%D0%B5", "position": 54, "brand_name": "SITIA", "page_number": 5, "product_name": "Масло растительное Оливковое масло нерафинированное Extra Virgin / нерафинированное / холодный отжим / первый отжим", "absolute_index": 554}	2022-08-27 23:46:59.841776	2022-08-27 23:46:59.841776
14	1	{"ads": true, "url": "https://www.wildberries.ru/catalog/0/search.aspx?sort=popular&search=%D0%9E%D0%BB%D0%B8%D0%B2%D0%BA%D0%BE%D0%B2%D0%BE%D0%B5+%D0%BC%D0%B0%D1%81%D0%BB%D0%BE+extra+virgin", "position": 2, "brand_name": "SITIA", "page_number": 1, "product_name": "Масло растительное Оливковое масло нерафинированное Extra Virgin / нерафинированное / холодный отжим / первый отжим", "absolute_index": 3}	2022-08-27 23:51:15.789178	2022-08-27 23:51:15.789178
15	1	{"ads": false, "url": "https://www.wildberries.ru/catalog/0/search.aspx?page=11&sort=popular&search=%D0%9E%D0%BB%D0%B8%D0%B2%D0%BA%D0%BE%D0%B2%D0%BE%D0%B5+%D0%BC%D0%B0%D1%81%D0%BB%D0%BE+extra+virgin", "position": 99, "brand_name": "SITIA", "page_number": 11, "product_name": "Масло растительное Оливковое масло нерафинированное Extra Virgin / нерафинированное / холодный отжим / первый отжим", "absolute_index": 1199}	2022-08-27 23:51:24.275307	2022-08-27 23:51:24.275307
16	2	{"ads": false, "url": "https://www.wildberries.ru/catalog/0/search.aspx?page=5&sort=popular&search=%D0%9E%D0%BB%D0%B8%D0%B2%D0%BA%D0%BE%D0%B2%D0%BE%D0%B5+%D0%BC%D0%B0%D1%81%D0%BB%D0%BE+%D0%B3%D1%80%D0%B5%D1%87%D0%B5%D1%81%D0%BA%D0%BE%D0%B5", "position": 54, "brand_name": "SITIA", "page_number": 5, "product_name": "Масло растительное Оливковое масло нерафинированное Extra Virgin / нерафинированное / холодный отжим / первый отжим", "absolute_index": 554}	2022-08-27 23:52:42.183868	2022-08-27 23:52:42.183868
17	1	{"ads": true, "url": "https://www.wildberries.ru/catalog/0/search.aspx?sort=popular&search=%D0%9E%D0%BB%D0%B8%D0%B2%D0%BA%D0%BE%D0%B2%D0%BE%D0%B5+%D0%BC%D0%B0%D1%81%D0%BB%D0%BE+extra+virgin", "position": 2, "brand_name": "SITIA", "page_number": 1, "product_name": "Масло растительное Оливковое масло нерафинированное Extra Virgin / нерафинированное / холодный отжим / первый отжим", "absolute_index": 3}	2022-08-27 23:53:14.102779	2022-08-27 23:53:14.102779
18	1	{"ads": false, "url": "https://www.wildberries.ru/catalog/0/search.aspx?page=11&sort=popular&search=%D0%9E%D0%BB%D0%B8%D0%B2%D0%BA%D0%BE%D0%B2%D0%BE%D0%B5+%D0%BC%D0%B0%D1%81%D0%BB%D0%BE+extra+virgin", "position": 99, "brand_name": "SITIA", "page_number": 11, "product_name": "Масло растительное Оливковое масло нерафинированное Extra Virgin / нерафинированное / холодный отжим / первый отжим", "absolute_index": 1199}	2022-08-27 23:53:22.355853	2022-08-27 23:53:22.355853
19	1	{"ads": true, "url": "https://www.wildberries.ru/catalog/0/search.aspx?sort=popular&search=%D0%9E%D0%BB%D0%B8%D0%B2%D0%BA%D0%BE%D0%B2%D0%BE%D0%B5+%D0%BC%D0%B0%D1%81%D0%BB%D0%BE+extra+virgin", "position": 2, "brand_name": "SITIA", "page_number": 1, "product_name": "Масло растительное Оливковое масло нерафинированное Extra Virgin / нерафинированное / холодный отжим / первый отжим", "absolute_index": 3}	2022-08-27 23:55:02.081328	2022-08-27 23:55:02.081328
20	1	{"ads": false, "url": "https://www.wildberries.ru/catalog/0/search.aspx?page=11&sort=popular&search=%D0%9E%D0%BB%D0%B8%D0%B2%D0%BA%D0%BE%D0%B2%D0%BE%D0%B5+%D0%BC%D0%B0%D1%81%D0%BB%D0%BE+extra+virgin", "position": 99, "brand_name": "SITIA", "page_number": 11, "product_name": "Масло растительное Оливковое масло нерафинированное Extra Virgin / нерафинированное / холодный отжим / первый отжим", "absolute_index": 1199}	2022-08-27 23:55:10.139256	2022-08-27 23:55:10.139256
21	2	{"ads": false, "url": "https://www.wildberries.ru/catalog/0/search.aspx?page=5&sort=popular&search=%D0%9E%D0%BB%D0%B8%D0%B2%D0%BA%D0%BE%D0%B2%D0%BE%D0%B5+%D0%BC%D0%B0%D1%81%D0%BB%D0%BE+%D0%B3%D1%80%D0%B5%D1%87%D0%B5%D1%81%D0%BA%D0%BE%D0%B5", "position": 54, "brand_name": "SITIA", "page_number": 5, "product_name": "Масло растительное Оливковое масло нерафинированное Extra Virgin / нерафинированное / холодный отжим / первый отжим", "absolute_index": 554}	2022-08-27 23:55:26.738606	2022-08-27 23:55:26.738606
22	1	{"ads": true, "url": "https://www.wildberries.ru/catalog/0/search.aspx?sort=popular&search=%D0%9E%D0%BB%D0%B8%D0%B2%D0%BA%D0%BE%D0%B2%D0%BE%D0%B5+%D0%BC%D0%B0%D1%81%D0%BB%D0%BE+extra+virgin", "position": 2, "brand_name": "SITIA", "page_number": 1, "product_name": "Масло растительное Оливковое масло нерафинированное Extra Virgin / нерафинированное / холодный отжим / первый отжим", "absolute_index": 3}	2022-08-27 23:58:24.885426	2022-08-27 23:58:24.885426
23	1	{"ads": false, "url": "https://www.wildberries.ru/catalog/0/search.aspx?page=11&sort=popular&search=%D0%9E%D0%BB%D0%B8%D0%B2%D0%BA%D0%BE%D0%B2%D0%BE%D0%B5+%D0%BC%D0%B0%D1%81%D0%BB%D0%BE+extra+virgin", "position": 99, "brand_name": "SITIA", "page_number": 11, "product_name": "Масло растительное Оливковое масло нерафинированное Extra Virgin / нерафинированное / холодный отжим / первый отжим", "absolute_index": 1199}	2022-08-27 23:58:35.154782	2022-08-27 23:58:35.154782
24	2	{"ads": false, "url": "https://www.wildberries.ru/catalog/0/search.aspx?page=5&sort=popular&search=%D0%9E%D0%BB%D0%B8%D0%B2%D0%BA%D0%BE%D0%B2%D0%BE%D0%B5+%D0%BC%D0%B0%D1%81%D0%BB%D0%BE+%D0%B3%D1%80%D0%B5%D1%87%D0%B5%D1%81%D0%BA%D0%BE%D0%B5", "position": 54, "brand_name": "SITIA", "page_number": 5, "product_name": "Масло растительное Оливковое масло нерафинированное Extra Virgin / нерафинированное / холодный отжим / первый отжим", "absolute_index": 554}	2022-08-27 23:58:43.826081	2022-08-27 23:58:43.826081
25	1	{"ads": true, "url": "https://www.wildberries.ru/catalog/0/search.aspx?sort=popular&search=%D0%9E%D0%BB%D0%B8%D0%B2%D0%BA%D0%BE%D0%B2%D0%BE%D0%B5+%D0%BC%D0%B0%D1%81%D0%BB%D0%BE+extra+virgin", "position": 2, "brand_name": "SITIA", "page_number": 1, "product_name": "Масло растительное Оливковое масло нерафинированное Extra Virgin / нерафинированное / холодный отжим / первый отжим", "absolute_index": 3}	2022-08-27 23:58:49.161137	2022-08-27 23:58:49.161137
26	1	{"ads": true, "url": "https://www.wildberries.ru/catalog/0/search.aspx?page=2&sort=popular&search=%D0%9E%D0%BB%D0%B8%D0%B2%D0%BA%D0%BE%D0%B2%D0%BE%D0%B5+%D0%BC%D0%B0%D1%81%D0%BB%D0%BE+extra+virgin", "position": 2, "brand_name": "SITIA", "page_number": 2, "product_name": "Масло растительное Оливковое масло нерафинированное Extra Virgin / нерафинированное / холодный отжим / первый отжим", "absolute_index": 202}	2022-08-27 23:58:50.324894	2022-08-27 23:58:50.324894
27	2	{"ads": false, "url": "https://www.wildberries.ru/catalog/0/search.aspx?page=5&sort=popular&search=%D0%9E%D0%BB%D0%B8%D0%B2%D0%BA%D0%BE%D0%B2%D0%BE%D0%B5+%D0%BC%D0%B0%D1%81%D0%BB%D0%BE+%D0%B3%D1%80%D0%B5%D1%87%D0%B5%D1%81%D0%BA%D0%BE%D0%B5", "position": 54, "brand_name": "SITIA", "page_number": 5, "product_name": "Масло растительное Оливковое масло нерафинированное Extra Virgin / нерафинированное / холодный отжим / первый отжим", "absolute_index": 554}	2022-08-27 23:59:18.546262	2022-08-27 23:59:18.546262
28	1	{"ads": true, "url": "https://www.wildberries.ru/catalog/0/search.aspx?sort=popular&search=%D0%9E%D0%BB%D0%B8%D0%B2%D0%BA%D0%BE%D0%B2%D0%BE%D0%B5+%D0%BC%D0%B0%D1%81%D0%BB%D0%BE+extra+virgin", "position": 2, "brand_name": "SITIA", "page_number": 1, "product_name": "Масло растительное Оливковое масло нерафинированное Extra Virgin / нерафинированное / холодный отжим / первый отжим", "absolute_index": 3}	2022-08-27 23:59:23.671296	2022-08-27 23:59:23.671296
29	1	{"ads": false, "url": "https://www.wildberries.ru/catalog/0/search.aspx?page=11&sort=popular&search=%D0%9E%D0%BB%D0%B8%D0%B2%D0%BA%D0%BE%D0%B2%D0%BE%D0%B5+%D0%BC%D0%B0%D1%81%D0%BB%D0%BE+extra+virgin", "position": 99, "brand_name": "SITIA", "page_number": 11, "product_name": "Масло растительное Оливковое масло нерафинированное Extra Virgin / нерафинированное / холодный отжим / первый отжим", "absolute_index": 1199}	2022-08-27 23:59:33.823825	2022-08-27 23:59:33.823825
30	2	{"ads": false, "url": "https://www.wildberries.ru/catalog/0/search.aspx?page=5&sort=popular&search=%D0%9E%D0%BB%D0%B8%D0%B2%D0%BA%D0%BE%D0%B2%D0%BE%D0%B5+%D0%BC%D0%B0%D1%81%D0%BB%D0%BE+%D0%B3%D1%80%D0%B5%D1%87%D0%B5%D1%81%D0%BA%D0%BE%D0%B5", "position": 54, "brand_name": "SITIA", "page_number": 5, "product_name": "Масло растительное Оливковое масло нерафинированное Extra Virgin / нерафинированное / холодный отжим / первый отжим", "absolute_index": 554}	2022-08-27 23:59:43.009941	2022-08-27 23:59:43.009941
31	1	{"ads": true, "url": "https://www.wildberries.ru/catalog/0/search.aspx?sort=popular&search=%D0%9E%D0%BB%D0%B8%D0%B2%D0%BA%D0%BE%D0%B2%D0%BE%D0%B5+%D0%BC%D0%B0%D1%81%D0%BB%D0%BE+extra+virgin", "position": 2, "brand_name": "SITIA", "page_number": 1, "product_name": "Масло растительное Оливковое масло нерафинированное Extra Virgin / нерафинированное / холодный отжим / первый отжим", "absolute_index": 3}	2022-08-28 00:00:31.413535	2022-08-28 00:00:31.413535
32	1	{"ads": false, "url": "https://www.wildberries.ru/catalog/0/search.aspx?page=11&sort=popular&search=%D0%9E%D0%BB%D0%B8%D0%B2%D0%BA%D0%BE%D0%B2%D0%BE%D0%B5+%D0%BC%D0%B0%D1%81%D0%BB%D0%BE+extra+virgin", "position": 99, "brand_name": "SITIA", "page_number": 11, "product_name": "Масло растительное Оливковое масло нерафинированное Extra Virgin / нерафинированное / холодный отжим / первый отжим", "absolute_index": 1199}	2022-08-28 00:00:41.212931	2022-08-28 00:00:41.212931
33	2	{"ads": false, "url": "https://www.wildberries.ru/catalog/0/search.aspx?page=5&sort=popular&search=%D0%9E%D0%BB%D0%B8%D0%B2%D0%BA%D0%BE%D0%B2%D0%BE%D0%B5+%D0%BC%D0%B0%D1%81%D0%BB%D0%BE+%D0%B3%D1%80%D0%B5%D1%87%D0%B5%D1%81%D0%BA%D0%BE%D0%B5", "position": 54, "brand_name": "SITIA", "page_number": 5, "product_name": "Масло растительное Оливковое масло нерафинированное Extra Virgin / нерафинированное / холодный отжим / первый отжим", "absolute_index": 554}	2022-08-28 00:00:50.29375	2022-08-28 00:00:50.29375
34	1	{"ads": true, "url": "https://www.wildberries.ru/catalog/0/search.aspx?sort=popular&search=%D0%9E%D0%BB%D0%B8%D0%B2%D0%BA%D0%BE%D0%B2%D0%BE%D0%B5+%D0%BC%D0%B0%D1%81%D0%BB%D0%BE+extra+virgin", "position": 2, "brand_name": "SITIA", "page_number": 1, "product_name": "Масло растительное Оливковое масло нерафинированное Extra Virgin / нерафинированное / холодный отжим / первый отжим", "absolute_index": 3}	2022-08-28 00:01:49.443884	2022-08-28 00:01:49.443884
35	1	{"ads": false, "url": "https://www.wildberries.ru/catalog/0/search.aspx?page=11&sort=popular&search=%D0%9E%D0%BB%D0%B8%D0%B2%D0%BA%D0%BE%D0%B2%D0%BE%D0%B5+%D0%BC%D0%B0%D1%81%D0%BB%D0%BE+extra+virgin", "position": 99, "brand_name": "SITIA", "page_number": 11, "product_name": "Масло растительное Оливковое масло нерафинированное Extra Virgin / нерафинированное / холодный отжим / первый отжим", "absolute_index": 1199}	2022-08-28 00:01:59.682382	2022-08-28 00:01:59.682382
36	1	{"ads": true, "url": "https://www.wildberries.ru/catalog/0/search.aspx?sort=popular&search=%D0%9E%D0%BB%D0%B8%D0%B2%D0%BA%D0%BE%D0%B2%D0%BE%D0%B5+%D0%BC%D0%B0%D1%81%D0%BB%D0%BE+extra+virgin", "position": 2, "brand_name": "SITIA", "page_number": 1, "product_name": "Масло растительное Оливковое масло нерафинированное Extra Virgin / нерафинированное / холодный отжим / первый отжим", "absolute_index": 3}	2022-08-28 00:03:08.119022	2022-08-28 00:03:08.119022
37	2	{"ads": false, "url": "https://www.wildberries.ru/catalog/0/search.aspx?page=5&sort=popular&search=%D0%9E%D0%BB%D0%B8%D0%B2%D0%BA%D0%BE%D0%B2%D0%BE%D0%B5+%D0%BC%D0%B0%D1%81%D0%BB%D0%BE+%D0%B3%D1%80%D0%B5%D1%87%D0%B5%D1%81%D0%BA%D0%BE%D0%B5", "position": 54, "brand_name": "SITIA", "page_number": 5, "product_name": "Масло растительное Оливковое масло нерафинированное Extra Virgin / нерафинированное / холодный отжим / первый отжим", "absolute_index": 554}	2022-08-28 00:03:38.841332	2022-08-28 00:03:38.841332
38	1	{"ads": true, "url": "https://www.wildberries.ru/catalog/0/search.aspx?sort=popular&search=%D0%9E%D0%BB%D0%B8%D0%B2%D0%BA%D0%BE%D0%B2%D0%BE%D0%B5+%D0%BC%D0%B0%D1%81%D0%BB%D0%BE+extra+virgin", "position": 2, "brand_name": "SITIA", "page_number": 1, "product_name": "Масло растительное Оливковое масло нерафинированное Extra Virgin / нерафинированное / холодный отжим / первый отжим", "absolute_index": 3}	2022-08-28 00:12:56.924075	2022-08-28 00:12:56.924075
39	1	{"ads": false, "url": "https://www.wildberries.ru/catalog/0/search.aspx?page=11&sort=popular&search=%D0%9E%D0%BB%D0%B8%D0%B2%D0%BA%D0%BE%D0%B2%D0%BE%D0%B5+%D0%BC%D0%B0%D1%81%D0%BB%D0%BE+extra+virgin", "position": 99, "brand_name": "SITIA", "page_number": 11, "product_name": "Масло растительное Оливковое масло нерафинированное Extra Virgin / нерафинированное / холодный отжим / первый отжим", "absolute_index": 1199}	2022-08-28 00:13:06.853138	2022-08-28 00:13:06.853138
40	2	{"ads": false, "url": "https://www.wildberries.ru/catalog/0/search.aspx?page=5&sort=popular&search=%D0%9E%D0%BB%D0%B8%D0%B2%D0%BA%D0%BE%D0%B2%D0%BE%D0%B5+%D0%BC%D0%B0%D1%81%D0%BB%D0%BE+%D0%B3%D1%80%D0%B5%D1%87%D0%B5%D1%81%D0%BA%D0%BE%D0%B5", "position": 54, "brand_name": "SITIA", "page_number": 5, "product_name": "Масло растительное Оливковое масло нерафинированное Extra Virgin / нерафинированное / холодный отжим / первый отжим", "absolute_index": 554}	2022-08-28 00:13:15.781242	2022-08-28 00:13:15.781242
41	1	{"ads": true, "url": "https://www.wildberries.ru/catalog/0/search.aspx?sort=popular&search=%D0%9E%D0%BB%D0%B8%D0%B2%D0%BA%D0%BE%D0%B2%D0%BE%D0%B5+%D0%BC%D0%B0%D1%81%D0%BB%D0%BE+extra+virgin", "pages": [{"page": 1, "count": 5, "positions": [1, 2, 10, 14, 18]}, {"page": 2, "count": 5, "positions": [1, 2, 10, 11, 14]}], "adverts": [{"id": 32432901, "cpm": 800, "code": "", "subject": 2982, "advertId": 482115}, {"id": 66474052, "cpm": 360, "code": "", "subject": 2982, "advertId": 2415656}, {"id": 110119921, "cpm": 200, "code": "", "subject": 2982, "advertId": 2494401}, {"id": 77540641, "cpm": 161, "code": "", "subject": 2982, "advertId": 2550439}, {"id": 111054747, "cpm": 150, "code": "", "subject": 2982, "advertId": 2300540}, {"id": 72004180, "cpm": 104, "code": "", "subject": 2982, "advertId": 2228107}, {"id": 70372311, "cpm": 55, "code": "", "subject": 2982, "advertId": 2637384}], "position": 2, "brand_name": "SITIA", "page_number": 1, "product_name": "Масло растительное Оливковое масло нерафинированное Extra Virgin / нерафинированное / холодный отжим / первый отжим", "absolute_index": 3, "prioritySubjects": [2982, 382, 5140, 362, 1813]}	2022-08-28 00:47:46.397013	2022-08-28 00:47:46.397013
42	1	{"ads": true, "url": "https://www.wildberries.ru/catalog/0/search.aspx?sort=popular&search=%D0%9E%D0%BB%D0%B8%D0%B2%D0%BA%D0%BE%D0%B2%D0%BE%D0%B5+%D0%BC%D0%B0%D1%81%D0%BB%D0%BE+extra+virgin", "pages": [{"page": 1, "count": 5, "positions": [1, 2, 10, 14, 18]}, {"page": 2, "count": 5, "positions": [1, 2, 10, 11, 14]}], "adverts": [{"id": 32432901, "cpm": 800, "code": "", "subject": 2982, "advertId": 482115}, {"id": 66474052, "cpm": 360, "code": "", "subject": 2982, "advertId": 2415656}, {"id": 110119921, "cpm": 200, "code": "", "subject": 2982, "advertId": 2494401}, {"id": 77540641, "cpm": 161, "code": "", "subject": 2982, "advertId": 2550439}, {"id": 111054747, "cpm": 150, "code": "", "subject": 2982, "advertId": 2300540}, {"id": 72004180, "cpm": 104, "code": "", "subject": 2982, "advertId": 2228107}, {"id": 70372311, "cpm": 55, "code": "", "subject": 2982, "advertId": 2637384}], "position": 2, "brand_name": "SITIA", "page_number": 1, "product_name": "Масло растительное Оливковое масло нерафинированное Extra Virgin / нерафинированное / холодный отжим / первый отжим", "absolute_index": 3, "prioritySubjects": [2982, 382, 5140, 362, 1813]}	2022-08-28 00:48:03.372236	2022-08-28 00:48:03.372236
43	1	{"ads": true, "url": "https://www.wildberries.ru/catalog/0/search.aspx?sort=popular&search=%D0%9E%D0%BB%D0%B8%D0%B2%D0%BA%D0%BE%D0%B2%D0%BE%D0%B5+%D0%BC%D0%B0%D1%81%D0%BB%D0%BE+extra+virgin", "pages": [{"page": 1, "count": 5, "positions": [1, 2, 10, 14, 18]}, {"page": 2, "count": 5, "positions": [1, 2, 10, 11, 14]}], "adverts": [{"id": 32432901, "cpm": 800, "code": "", "subject": 2982, "advertId": 482115}, {"id": 66474052, "cpm": 360, "code": "", "subject": 2982, "advertId": 2415656}, {"id": 110119921, "cpm": 200, "code": "", "subject": 2982, "advertId": 2494401}, {"id": 77540641, "cpm": 161, "code": "", "subject": 2982, "advertId": 2550439}, {"id": 111054747, "cpm": 150, "code": "", "subject": 2982, "advertId": 2300540}, {"id": 72004180, "cpm": 104, "code": "", "subject": 2982, "advertId": 2228107}, {"id": 70372311, "cpm": 55, "code": "", "subject": 2982, "advertId": 2637384}], "position": 2, "brand_name": "SITIA", "page_number": 1, "product_name": "Масло растительное Оливковое масло нерафинированное Extra Virgin / нерафинированное / холодный отжим / первый отжим", "absolute_index": 3, "prioritySubjects": [2982, 382, 5140, 362, 1813]}	2022-08-28 00:48:47.691451	2022-08-28 00:48:47.691451
44	1	{"ads": false, "url": "https://www.wildberries.ru/catalog/0/search.aspx?page=11&sort=popular&search=%D0%9E%D0%BB%D0%B8%D0%B2%D0%BA%D0%BE%D0%B2%D0%BE%D0%B5+%D0%BC%D0%B0%D1%81%D0%BB%D0%BE+extra+virgin", "position": 99, "brand_name": "SITIA", "page_number": 11, "product_name": "Масло растительное Оливковое масло нерафинированное Extra Virgin / нерафинированное / холодный отжим / первый отжим", "absolute_index": 1199}	2022-08-28 00:49:05.062608	2022-08-28 00:49:05.062608
45	2	{"ads": false, "url": "https://www.wildberries.ru/catalog/0/search.aspx?page=5&sort=popular&search=%D0%9E%D0%BB%D0%B8%D0%B2%D0%BA%D0%BE%D0%B2%D0%BE%D0%B5+%D0%BC%D0%B0%D1%81%D0%BB%D0%BE+%D0%B3%D1%80%D0%B5%D1%87%D0%B5%D1%81%D0%BA%D0%BE%D0%B5", "position": 54, "brand_name": "SITIA", "page_number": 5, "product_name": "Масло растительное Оливковое масло нерафинированное Extra Virgin / нерафинированное / холодный отжим / первый отжим", "absolute_index": 554}	2022-08-28 00:49:16.462518	2022-08-28 00:49:16.462518
51	1	{"ads": false, "url": "https://www.wildberries.ru/catalog/0/search.aspx?page=13&sort=popular&search=%D0%9E%D0%BB%D0%B8%D0%B2%D0%BA%D0%BE%D0%B2%D0%BE%D0%B5+%D0%BC%D0%B0%D1%81%D0%BB%D0%BE+extra+virgin", "position": 1, "brand_name": "SITIA", "page_number": 13, "product_name": "Масло растительное Оливковое масло нерафинированное Extra Virgin / нерафинированное / холодный отжим / первый отжим", "absolute_index": 1301}	2022-08-28 07:43:10.610179	2022-08-28 07:43:10.610179
52	2	{"ads": false, "url": "https://www.wildberries.ru/catalog/0/search.aspx?page=6&sort=popular&search=%D0%9E%D0%BB%D0%B8%D0%B2%D0%BA%D0%BE%D0%B2%D0%BE%D0%B5+%D0%BC%D0%B0%D1%81%D0%BB%D0%BE+%D0%B3%D1%80%D0%B5%D1%87%D0%B5%D1%81%D0%BA%D0%BE%D0%B5", "position": 54, "brand_name": "SITIA", "page_number": 6, "product_name": "Масло растительное Оливковое масло нерафинированное Extra Virgin / нерафинированное / холодный отжим / первый отжим", "absolute_index": 654}	2022-08-28 07:43:23.057139	2022-08-28 07:43:23.057139
46	1	{"ads": true, "url": "https://www.wildberries.ru/catalog/0/search.aspx?sort=popular&search=%D0%9E%D0%BB%D0%B8%D0%B2%D0%BA%D0%BE%D0%B2%D0%BE%D0%B5+%D0%BC%D0%B0%D1%81%D0%BB%D0%BE+extra+virgin", "pages": [{"page": 1, "count": 5, "positions": [1, 2, 12, 15, 18]}, {"page": 2, "count": 5, "positions": [1, 2, 13, 16, 19]}], "adverts": [{"id": 32432901, "cpm": 800, "code": "", "subject": 2982, "advertId": 482115}, {"id": 66474048, "cpm": 360, "code": "", "subject": 2982, "advertId": 2415656}, {"id": 110119921, "cpm": 200, "code": "", "subject": 2982, "advertId": 2494401}, {"id": 77540641, "cpm": 161, "code": "", "subject": 2982, "advertId": 2550439}, {"id": 111054747, "cpm": 150, "code": "", "subject": 2982, "advertId": 2300540}, {"id": 72004180, "cpm": 104, "code": "", "subject": 2982, "advertId": 2228107}, {"id": 70372311, "cpm": 55, "code": "", "subject": 2982, "advertId": 2637384}, {"id": 117329468, "cpm": 50, "code": "", "subject": 2982, "advertId": 2702885}], "position": 12, "brand_name": "SITIA", "page_number": 1, "product_name": "Масло растительное Оливковое масло нерафинированное Extra Virgin / нерафинированное / холодный отжим / первый отжим", "absolute_index": 13, "prioritySubjects": [2982, 382, 5140, 362, 1813]}	2022-08-28 07:41:36.634115	2022-08-28 07:41:36.634115
47	1	{"ads": true, "url": "https://www.wildberries.ru/catalog/0/search.aspx?sort=popular&search=%D0%9E%D0%BB%D0%B8%D0%B2%D0%BA%D0%BE%D0%B2%D0%BE%D0%B5+%D0%BC%D0%B0%D1%81%D0%BB%D0%BE+extra+virgin", "pages": [{"page": 1, "count": 5, "positions": [1, 2, 12, 15, 18]}, {"page": 2, "count": 5, "positions": [1, 2, 13, 16, 19]}], "adverts": [{"id": 32432901, "cpm": 800, "code": "", "subject": 2982, "advertId": 482115}, {"id": 66474048, "cpm": 360, "code": "", "subject": 2982, "advertId": 2415656}, {"id": 110119921, "cpm": 200, "code": "", "subject": 2982, "advertId": 2494401}, {"id": 77540641, "cpm": 161, "code": "", "subject": 2982, "advertId": 2550439}, {"id": 111054747, "cpm": 150, "code": "", "subject": 2982, "advertId": 2300540}, {"id": 72004180, "cpm": 104, "code": "", "subject": 2982, "advertId": 2228107}, {"id": 70372311, "cpm": 55, "code": "", "subject": 2982, "advertId": 2637384}, {"id": 117329468, "cpm": 50, "code": "", "subject": 2982, "advertId": 2702885}], "position": 12, "brand_name": "SITIA", "page_number": 1, "product_name": "Масло растительное Оливковое масло нерафинированное Extra Virgin / нерафинированное / холодный отжим / первый отжим", "absolute_index": 13, "prioritySubjects": [2982, 382, 5140, 362, 1813]}	2022-08-28 07:42:05.791187	2022-08-28 07:42:05.791187
48	1	{"ads": true, "url": "https://www.wildberries.ru/catalog/0/search.aspx?sort=popular&search=%D0%9E%D0%BB%D0%B8%D0%B2%D0%BA%D0%BE%D0%B2%D0%BE%D0%B5+%D0%BC%D0%B0%D1%81%D0%BB%D0%BE+extra+virgin", "pages": [{"page": 1, "count": 5, "positions": [1, 2, 12, 15, 18]}, {"page": 2, "count": 5, "positions": [1, 2, 13, 16, 19]}], "adverts": [{"id": 32432901, "cpm": 800, "code": "", "subject": 2982, "advertId": 482115}, {"id": 66474048, "cpm": 360, "code": "", "subject": 2982, "advertId": 2415656}, {"id": 110119921, "cpm": 200, "code": "", "subject": 2982, "advertId": 2494401}, {"id": 77540641, "cpm": 161, "code": "", "subject": 2982, "advertId": 2550439}, {"id": 111054747, "cpm": 150, "code": "", "subject": 2982, "advertId": 2300540}, {"id": 72004180, "cpm": 104, "code": "", "subject": 2982, "advertId": 2228107}, {"id": 70372311, "cpm": 55, "code": "", "subject": 2982, "advertId": 2637384}, {"id": 117329468, "cpm": 50, "code": "", "subject": 2982, "advertId": 2702885}], "position": 12, "brand_name": "SITIA", "page_number": 1, "product_name": "Масло растительное Оливковое масло нерафинированное Extra Virgin / нерафинированное / холодный отжим / первый отжим", "absolute_index": 13, "prioritySubjects": [2982, 382, 5140, 362, 1813]}	2022-08-28 07:42:25.607946	2022-08-28 07:42:25.607946
49	1	{"ads": false, "url": "https://www.wildberries.ru/catalog/0/search.aspx?page=12&sort=popular&search=%D0%9E%D0%BB%D0%B8%D0%B2%D0%BA%D0%BE%D0%B2%D0%BE%D0%B5+%D0%BC%D0%B0%D1%81%D0%BB%D0%BE+extra+virgin", "position": 1, "brand_name": "SITIA", "page_number": 12, "product_name": "Масло растительное Оливковое масло нерафинированное Extra Virgin / нерафинированное / холодный отжим / первый отжим", "absolute_index": 1201}	2022-08-28 07:42:36.930699	2022-08-28 07:42:36.930699
50	1	{"ads": true, "url": "https://www.wildberries.ru/catalog/0/search.aspx?sort=popular&search=%D0%9E%D0%BB%D0%B8%D0%B2%D0%BA%D0%BE%D0%B2%D0%BE%D0%B5+%D0%BC%D0%B0%D1%81%D0%BB%D0%BE+extra+virgin", "pages": [{"page": 1, "count": 5, "positions": [1, 2, 12, 15, 18]}, {"page": 2, "count": 5, "positions": [1, 2, 13, 16, 19]}], "adverts": [{"id": 32432901, "cpm": 800, "code": "", "subject": 2982, "advertId": 482115}, {"id": 66474048, "cpm": 360, "code": "", "subject": 2982, "advertId": 2415656}, {"id": 110119921, "cpm": 200, "code": "", "subject": 2982, "advertId": 2494401}, {"id": 77540641, "cpm": 161, "code": "", "subject": 2982, "advertId": 2550439}, {"id": 111054747, "cpm": 150, "code": "", "subject": 2982, "advertId": 2300540}, {"id": 72004180, "cpm": 104, "code": "", "subject": 2982, "advertId": 2228107}, {"id": 70372311, "cpm": 55, "code": "", "subject": 2982, "advertId": 2637384}, {"id": 117329468, "cpm": 50, "code": "", "subject": 2982, "advertId": 2702885}], "position": 12, "brand_name": "SITIA", "page_number": 1, "product_name": "Масло растительное Оливковое масло нерафинированное Extra Virgin / нерафинированное / холодный отжим / первый отжим", "absolute_index": 13, "prioritySubjects": [2982, 382, 5140, 362, 1813]}	2022-08-28 07:42:58.393803	2022-08-28 07:42:58.393803
53	1	{"ads": true, "url": "https://www.wildberries.ru/catalog/0/search.aspx?sort=popular&search=%D0%9E%D0%BB%D0%B8%D0%B2%D0%BA%D0%BE%D0%B2%D0%BE%D0%B5+%D0%BC%D0%B0%D1%81%D0%BB%D0%BE+extra+virgin", "pages": [{"page": 1, "count": 5, "positions": [1, 2, 12, 15, 18]}, {"page": 2, "count": 5, "positions": [1, 2, 13, 16, 19]}], "adverts": [{"id": 32432901, "cpm": 800, "code": "", "subject": 2982, "advertId": 482115}, {"id": 66474048, "cpm": 360, "code": "", "subject": 2982, "advertId": 2415656}, {"id": 110119921, "cpm": 200, "code": "", "subject": 2982, "advertId": 2494401}, {"id": 77540641, "cpm": 161, "code": "", "subject": 2982, "advertId": 2550439}, {"id": 111054747, "cpm": 150, "code": "", "subject": 2982, "advertId": 2300540}, {"id": 72004180, "cpm": 104, "code": "", "subject": 2982, "advertId": 2228107}, {"id": 70372311, "cpm": 55, "code": "", "subject": 2982, "advertId": 2637384}, {"id": 117329468, "cpm": 50, "code": "", "subject": 2982, "advertId": 2702885}], "position": 12, "brand_name": "SITIA", "page_number": 1, "product_name": "Масло растительное Оливковое масло нерафинированное Extra Virgin / нерафинированное / холодный отжим / первый отжим", "absolute_index": 13, "prioritySubjects": [2982, 382, 5140, 362, 1813]}	2022-08-28 07:43:53.267481	2022-08-28 07:43:53.267481
54	2	{"ads": false, "url": "https://www.wildberries.ru/catalog/0/search.aspx?page=5&sort=popular&search=%D0%9E%D0%BB%D0%B8%D0%B2%D0%BA%D0%BE%D0%B2%D0%BE%D0%B5+%D0%BC%D0%B0%D1%81%D0%BB%D0%BE+%D0%B3%D1%80%D0%B5%D1%87%D0%B5%D1%81%D0%BA%D0%BE%D0%B5", "position": 54, "brand_name": "SITIA", "page_number": 5, "product_name": "Масло растительное Оливковое масло нерафинированное Extra Virgin / нерафинированное / холодный отжим / первый отжим", "absolute_index": 554}	2022-08-28 07:44:22.872442	2022-08-28 07:44:22.872442
55	1	{"ads": true, "url": "https://www.wildberries.ru/catalog/0/search.aspx?sort=popular&search=%D0%9E%D0%BB%D0%B8%D0%B2%D0%BA%D0%BE%D0%B2%D0%BE%D0%B5+%D0%BC%D0%B0%D1%81%D0%BB%D0%BE+extra+virgin", "pages": [{"page": 1, "count": 5, "positions": [1, 2, 10, 13, 17]}, {"page": 2, "count": 5, "positions": [1, 2, 11, 14, 16]}], "adverts": [{"id": 32432901, "cpm": 800, "code": "", "subject": 2982, "advertId": 482115}, {"id": 66474052, "cpm": 360, "code": "", "subject": 2982, "advertId": 2415656}, {"id": 110119921, "cpm": 200, "code": "", "subject": 2982, "advertId": 2494401}, {"id": 111054747, "cpm": 150, "code": "", "subject": 2982, "advertId": 2300540}, {"id": 72004180, "cpm": 104, "code": "", "subject": 2982, "advertId": 2228107}, {"id": 117329468, "cpm": 100, "code": "", "subject": 2982, "advertId": 2723294}, {"id": 70372311, "cpm": 55, "code": "", "subject": 2982, "advertId": 2637384}, {"id": 77540641, "cpm": 50, "code": "", "subject": 2982, "advertId": 2550439}], "position": 10, "brand_name": "SITIA", "page_number": 1, "product_name": "Масло растительное Оливковое масло нерафинированное Extra Virgin / нерафинированное / холодный отжим / первый отжим", "absolute_index": 11, "prioritySubjects": [2982, 382, 5140, 362, 1813]}	2022-08-28 11:46:55.70434	2022-08-28 11:46:55.70434
56	1	{"ads": false, "url": "https://www.wildberries.ru/catalog/0/search.aspx?page=11&sort=popular&search=%D0%9E%D0%BB%D0%B8%D0%B2%D0%BA%D0%BE%D0%B2%D0%BE%D0%B5+%D0%BC%D0%B0%D1%81%D0%BB%D0%BE+extra+virgin", "position": 97, "brand_name": "SITIA", "page_number": 11, "product_name": "Масло растительное Оливковое масло нерафинированное Extra Virgin / нерафинированное / холодный отжим / первый отжим", "absolute_index": 1197}	2022-08-28 11:47:04.967761	2022-08-28 11:47:04.967761
57	1	{"ads": true, "url": "https://www.wildberries.ru/catalog/0/search.aspx?sort=popular&search=%D0%9E%D0%BB%D0%B8%D0%B2%D0%BA%D0%BE%D0%B2%D0%BE%D0%B5+%D0%BC%D0%B0%D1%81%D0%BB%D0%BE+extra+virgin", "pages": [{"page": 1, "count": 5, "positions": [1, 2, 10, 13, 15]}, {"page": 2, "count": 5, "positions": [1, 2, 11, 14, 17]}], "adverts": [{"id": 66474052, "cpm": 360, "code": "", "subject": 2982, "advertId": 2415656}, {"id": 110119921, "cpm": 200, "code": "", "subject": 2982, "advertId": 2494401}, {"id": 111054747, "cpm": 150, "code": "", "subject": 2982, "advertId": 2300540}, {"id": 72004180, "cpm": 104, "code": "", "subject": 2982, "advertId": 2228107}, {"id": 117329468, "cpm": 100, "code": "", "subject": 2982, "advertId": 2723294}, {"id": 70372311, "cpm": 55, "code": "", "subject": 2982, "advertId": 2637384}, {"id": 77540641, "cpm": 50, "code": "", "subject": 2982, "advertId": 2550439}], "position": 1, "brand_name": "SITIA", "page_number": 1, "product_name": "Масло растительное Оливковое масло нерафинированное Extra Virgin / нерафинированное / холодный отжим / первый отжим", "absolute_index": 2, "prioritySubjects": [2982, 382, 5140, 362, 1813]}	2022-08-28 15:00:28.384842	2022-08-28 15:00:28.384842
58	1	{"ads": true, "url": "https://www.wildberries.ru/catalog/0/search.aspx?page=2&sort=popular&search=%D0%9E%D0%BB%D0%B8%D0%B2%D0%BA%D0%BE%D0%B2%D0%BE%D0%B5+%D0%BC%D0%B0%D1%81%D0%BB%D0%BE+extra+virgin", "pages": [{"page": 1, "count": 5, "positions": [1, 2, 10, 13, 15]}, {"page": 2, "count": 5, "positions": [1, 2, 11, 14, 17]}], "adverts": [{"id": 66474052, "cpm": 360, "code": "", "subject": 2982, "advertId": 2415656}, {"id": 110119921, "cpm": 200, "code": "", "subject": 2982, "advertId": 2494401}, {"id": 111054747, "cpm": 150, "code": "", "subject": 2982, "advertId": 2300540}, {"id": 72004180, "cpm": 104, "code": "", "subject": 2982, "advertId": 2228107}, {"id": 117329468, "cpm": 100, "code": "", "subject": 2982, "advertId": 2723294}, {"id": 70372311, "cpm": 55, "code": "", "subject": 2982, "advertId": 2637384}, {"id": 77540641, "cpm": 50, "code": "", "subject": 2982, "advertId": 2550439}], "position": 1, "brand_name": "SITIA", "page_number": 2, "product_name": "Масло растительное Оливковое масло нерафинированное Extra Virgin / нерафинированное / холодный отжим / первый отжим", "absolute_index": 201, "prioritySubjects": [2982, 382, 5140, 362, 1813]}	2022-08-28 15:00:29.004943	2022-08-28 15:00:29.004943
59	1	{"ads": true, "url": "https://www.wildberries.ru/catalog/0/search.aspx?page=3&sort=popular&search=%D0%9E%D0%BB%D0%B8%D0%B2%D0%BA%D0%BE%D0%B2%D0%BE%D0%B5+%D0%BC%D0%B0%D1%81%D0%BB%D0%BE+extra+virgin", "pages": [{"page": 1, "count": 5, "positions": [1, 2, 10, 13, 15]}, {"page": 2, "count": 5, "positions": [1, 2, 11, 14, 17]}], "adverts": [{"id": 66474052, "cpm": 360, "code": "", "subject": 2982, "advertId": 2415656}, {"id": 110119921, "cpm": 200, "code": "", "subject": 2982, "advertId": 2494401}, {"id": 111054747, "cpm": 150, "code": "", "subject": 2982, "advertId": 2300540}, {"id": 72004180, "cpm": 104, "code": "", "subject": 2982, "advertId": 2228107}, {"id": 117329468, "cpm": 100, "code": "", "subject": 2982, "advertId": 2723294}, {"id": 70372311, "cpm": 55, "code": "", "subject": 2982, "advertId": 2637384}, {"id": 77540641, "cpm": 50, "code": "", "subject": 2982, "advertId": 2550439}], "position": 1, "brand_name": "SITIA", "page_number": 3, "product_name": "Масло растительное Оливковое масло нерафинированное Extra Virgin / нерафинированное / холодный отжим / первый отжим", "absolute_index": 301, "prioritySubjects": [2982, 382, 5140, 362, 1813]}	2022-08-28 15:00:29.603038	2022-08-28 15:00:29.603038
60	1	{"ads": true, "url": "https://www.wildberries.ru/catalog/0/search.aspx?page=4&sort=popular&search=%D0%9E%D0%BB%D0%B8%D0%B2%D0%BA%D0%BE%D0%B2%D0%BE%D0%B5+%D0%BC%D0%B0%D1%81%D0%BB%D0%BE+extra+virgin", "pages": [{"page": 1, "count": 5, "positions": [1, 2, 10, 13, 15]}, {"page": 2, "count": 5, "positions": [1, 2, 11, 14, 17]}], "adverts": [{"id": 66474052, "cpm": 360, "code": "", "subject": 2982, "advertId": 2415656}, {"id": 110119921, "cpm": 200, "code": "", "subject": 2982, "advertId": 2494401}, {"id": 111054747, "cpm": 150, "code": "", "subject": 2982, "advertId": 2300540}, {"id": 72004180, "cpm": 104, "code": "", "subject": 2982, "advertId": 2228107}, {"id": 117329468, "cpm": 100, "code": "", "subject": 2982, "advertId": 2723294}, {"id": 70372311, "cpm": 55, "code": "", "subject": 2982, "advertId": 2637384}, {"id": 77540641, "cpm": 50, "code": "", "subject": 2982, "advertId": 2550439}], "position": 1, "brand_name": "SITIA", "page_number": 4, "product_name": "Масло растительное Оливковое масло нерафинированное Extra Virgin / нерафинированное / холодный отжим / первый отжим", "absolute_index": 401, "prioritySubjects": [2982, 382, 5140, 362, 1813]}	2022-08-28 15:00:30.201537	2022-08-28 15:00:30.201537
61	1	{"ads": true, "url": "https://www.wildberries.ru/catalog/0/search.aspx?page=5&sort=popular&search=%D0%9E%D0%BB%D0%B8%D0%B2%D0%BA%D0%BE%D0%B2%D0%BE%D0%B5+%D0%BC%D0%B0%D1%81%D0%BB%D0%BE+extra+virgin", "pages": [{"page": 1, "count": 5, "positions": [1, 2, 10, 13, 15]}, {"page": 2, "count": 5, "positions": [1, 2, 11, 14, 17]}], "adverts": [{"id": 66474052, "cpm": 360, "code": "", "subject": 2982, "advertId": 2415656}, {"id": 110119921, "cpm": 200, "code": "", "subject": 2982, "advertId": 2494401}, {"id": 111054747, "cpm": 150, "code": "", "subject": 2982, "advertId": 2300540}, {"id": 72004180, "cpm": 104, "code": "", "subject": 2982, "advertId": 2228107}, {"id": 117329468, "cpm": 100, "code": "", "subject": 2982, "advertId": 2723294}, {"id": 70372311, "cpm": 55, "code": "", "subject": 2982, "advertId": 2637384}, {"id": 77540641, "cpm": 50, "code": "", "subject": 2982, "advertId": 2550439}], "position": 1, "brand_name": "SITIA", "page_number": 5, "product_name": "Масло растительное Оливковое масло нерафинированное Extra Virgin / нерафинированное / холодный отжим / первый отжим", "absolute_index": 501, "prioritySubjects": [2982, 382, 5140, 362, 1813]}	2022-08-28 15:00:30.808279	2022-08-28 15:00:30.808279
62	1	{"ads": true, "url": "https://www.wildberries.ru/catalog/0/search.aspx?page=6&sort=popular&search=%D0%9E%D0%BB%D0%B8%D0%B2%D0%BA%D0%BE%D0%B2%D0%BE%D0%B5+%D0%BC%D0%B0%D1%81%D0%BB%D0%BE+extra+virgin", "pages": [{"page": 1, "count": 5, "positions": [1, 2, 10, 13, 15]}, {"page": 2, "count": 5, "positions": [1, 2, 11, 14, 17]}], "adverts": [{"id": 66474052, "cpm": 360, "code": "", "subject": 2982, "advertId": 2415656}, {"id": 110119921, "cpm": 200, "code": "", "subject": 2982, "advertId": 2494401}, {"id": 111054747, "cpm": 150, "code": "", "subject": 2982, "advertId": 2300540}, {"id": 72004180, "cpm": 104, "code": "", "subject": 2982, "advertId": 2228107}, {"id": 117329468, "cpm": 100, "code": "", "subject": 2982, "advertId": 2723294}, {"id": 70372311, "cpm": 55, "code": "", "subject": 2982, "advertId": 2637384}, {"id": 77540641, "cpm": 50, "code": "", "subject": 2982, "advertId": 2550439}], "position": 1, "brand_name": "SITIA", "page_number": 6, "product_name": "Масло растительное Оливковое масло нерафинированное Extra Virgin / нерафинированное / холодный отжим / первый отжим", "absolute_index": 601, "prioritySubjects": [2982, 382, 5140, 362, 1813]}	2022-08-28 15:00:31.42841	2022-08-28 15:00:31.42841
63	1	{"ads": true, "url": "https://www.wildberries.ru/catalog/0/search.aspx?page=7&sort=popular&search=%D0%9E%D0%BB%D0%B8%D0%B2%D0%BA%D0%BE%D0%B2%D0%BE%D0%B5+%D0%BC%D0%B0%D1%81%D0%BB%D0%BE+extra+virgin", "pages": [{"page": 1, "count": 5, "positions": [1, 2, 10, 13, 15]}, {"page": 2, "count": 5, "positions": [1, 2, 11, 14, 17]}], "adverts": [{"id": 66474052, "cpm": 360, "code": "", "subject": 2982, "advertId": 2415656}, {"id": 110119921, "cpm": 200, "code": "", "subject": 2982, "advertId": 2494401}, {"id": 111054747, "cpm": 150, "code": "", "subject": 2982, "advertId": 2300540}, {"id": 72004180, "cpm": 104, "code": "", "subject": 2982, "advertId": 2228107}, {"id": 117329468, "cpm": 100, "code": "", "subject": 2982, "advertId": 2723294}, {"id": 70372311, "cpm": 55, "code": "", "subject": 2982, "advertId": 2637384}, {"id": 77540641, "cpm": 50, "code": "", "subject": 2982, "advertId": 2550439}], "position": 1, "brand_name": "SITIA", "page_number": 7, "product_name": "Масло растительное Оливковое масло нерафинированное Extra Virgin / нерафинированное / холодный отжим / первый отжим", "absolute_index": 701, "prioritySubjects": [2982, 382, 5140, 362, 1813]}	2022-08-28 15:00:32.031589	2022-08-28 15:00:32.031589
64	1	{"ads": true, "url": "https://www.wildberries.ru/catalog/0/search.aspx?page=8&sort=popular&search=%D0%9E%D0%BB%D0%B8%D0%B2%D0%BA%D0%BE%D0%B2%D0%BE%D0%B5+%D0%BC%D0%B0%D1%81%D0%BB%D0%BE+extra+virgin", "pages": [{"page": 1, "count": 5, "positions": [1, 2, 10, 13, 15]}, {"page": 2, "count": 5, "positions": [1, 2, 11, 14, 17]}], "adverts": [{"id": 66474052, "cpm": 360, "code": "", "subject": 2982, "advertId": 2415656}, {"id": 110119921, "cpm": 200, "code": "", "subject": 2982, "advertId": 2494401}, {"id": 111054747, "cpm": 150, "code": "", "subject": 2982, "advertId": 2300540}, {"id": 72004180, "cpm": 104, "code": "", "subject": 2982, "advertId": 2228107}, {"id": 117329468, "cpm": 100, "code": "", "subject": 2982, "advertId": 2723294}, {"id": 70372311, "cpm": 55, "code": "", "subject": 2982, "advertId": 2637384}, {"id": 77540641, "cpm": 50, "code": "", "subject": 2982, "advertId": 2550439}], "position": 1, "brand_name": "SITIA", "page_number": 8, "product_name": "Масло растительное Оливковое масло нерафинированное Extra Virgin / нерафинированное / холодный отжим / первый отжим", "absolute_index": 801, "prioritySubjects": [2982, 382, 5140, 362, 1813]}	2022-08-28 15:00:32.686609	2022-08-28 15:00:32.686609
\.


--
-- Data for Name: keywords; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.keywords (id, name, slug, created_at, updated_at) FROM stdin;
1	Оливковое масло extra virgin	\N	2022-08-27 21:06:30.747553	2022-08-27 21:06:30.747553
2	Оливковое масло греческое	\N	2022-08-27 23:45:48.738197	2022-08-27 23:45:48.738197
\.


--
-- Data for Name: markets; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.markets (id, name, slug, data, user_id, created_at, updated_at) FROM stdin;
10	\N	yandex	\N	2	2022-07-09 10:22:04.294807	2022-07-09 10:22:04.294807
11	2	wildberries	\N	2	2022-07-09 23:38:35.230492	2022-08-14 21:10:03.080898
\.


--
-- Data for Name: notifications; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.notifications (id, recipient_type, recipient_id, type, params, read_at, created_at, updated_at) FROM stdin;
1	User	2	NewNotification	{"post": 1, "_aj_symbol_keys": ["post"]}	\N	2022-08-22 21:14:36.061496	2022-08-22 21:14:36.061496
\.


--
-- Data for Name: order_costs; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.order_costs (id, data, date, order_id, import_id, campaign_id, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: order_products; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.order_products (id, product_id, order_id, created_at, updated_at, campaign_id) FROM stdin;
1966	34	1969	2022-08-22 01:00:55.249452	2022-08-22 01:00:55.249452	1
1967	37	1970	2022-08-22 01:00:55.257792	2022-08-22 01:00:55.257792	1
1968	37	1971	2022-08-22 01:00:55.26522	2022-08-22 01:00:55.26522	1
1969	35	1972	2022-08-22 01:00:55.273171	2022-08-22 01:00:55.273171	1
1970	35	1973	2022-08-22 01:00:55.280527	2022-08-22 01:00:55.280527	1
1971	35	1974	2022-08-22 01:00:55.288112	2022-08-22 01:00:55.288112	1
1972	35	1975	2022-08-22 01:00:55.295879	2022-08-22 01:00:55.295879	1
1973	35	1976	2022-08-22 01:00:55.304119	2022-08-22 01:00:55.304119	1
1974	37	1977	2022-08-22 01:00:55.313493	2022-08-22 01:00:55.313493	1
1975	37	1978	2022-08-22 01:00:55.321604	2022-08-22 01:00:55.321604	1
1976	37	1979	2022-08-22 01:00:55.328915	2022-08-22 01:00:55.328915	1
1977	37	1980	2022-08-22 01:00:55.336499	2022-08-22 01:00:55.336499	1
1978	34	1981	2022-08-22 01:00:55.386361	2022-08-22 01:00:55.386361	1
1979	34	1982	2022-08-22 01:00:55.416658	2022-08-22 01:00:55.416658	1
1980	35	1983	2022-08-22 01:00:55.426649	2022-08-22 01:00:55.426649	1
1981	35	1984	2022-08-22 01:00:55.434335	2022-08-22 01:00:55.434335	1
1982	37	1985	2022-08-22 01:00:55.442642	2022-08-22 01:00:55.442642	1
1983	35	1986	2022-08-22 01:00:55.450404	2022-08-22 01:00:55.450404	1
1984	37	1987	2022-08-22 01:00:55.458473	2022-08-22 01:00:55.458473	1
1985	35	1988	2022-08-22 01:00:55.46642	2022-08-22 01:00:55.46642	1
1986	37	1989	2022-08-22 01:00:55.490315	2022-08-22 01:00:55.490315	1
1987	34	1990	2022-08-22 01:00:55.505053	2022-08-22 01:00:55.505053	1
1988	37	1991	2022-08-22 01:00:55.51461	2022-08-22 01:00:55.51461	1
1989	37	1992	2022-08-22 01:00:55.52351	2022-08-22 01:00:55.52351	1
1990	37	1993	2022-08-22 01:00:55.53114	2022-08-22 01:00:55.53114	1
1991	37	1994	2022-08-22 01:00:55.538709	2022-08-22 01:00:55.538709	1
1992	37	1995	2022-08-22 01:00:55.5476	2022-08-22 01:00:55.5476	1
1993	37	1996	2022-08-22 01:00:55.556007	2022-08-22 01:00:55.556007	1
1994	37	1997	2022-08-22 01:00:55.567591	2022-08-22 01:00:55.567591	1
1995	37	1998	2022-08-22 01:00:55.575502	2022-08-22 01:00:55.575502	1
1996	37	1999	2022-08-22 01:00:55.583427	2022-08-22 01:00:55.583427	1
1997	37	2000	2022-08-22 01:00:55.590948	2022-08-22 01:00:55.590948	1
1998	35	2001	2022-08-22 01:00:55.598616	2022-08-22 01:00:55.598616	1
1999	35	2002	2022-08-22 01:00:55.606511	2022-08-22 01:00:55.606511	1
2000	35	2003	2022-08-22 01:00:55.615502	2022-08-22 01:00:55.615502	1
2001	35	2004	2022-08-22 01:00:55.624482	2022-08-22 01:00:55.624482	1
2002	35	2005	2022-08-22 01:00:55.632742	2022-08-22 01:00:55.632742	1
2003	35	2006	2022-08-22 01:00:55.640305	2022-08-22 01:00:55.640305	1
2004	35	2007	2022-08-22 01:00:55.648168	2022-08-22 01:00:55.648168	1
2005	35	2008	2022-08-22 01:00:55.656834	2022-08-22 01:00:55.656834	1
2006	35	2009	2022-08-22 01:00:55.664708	2022-08-22 01:00:55.664708	1
2007	37	2010	2022-08-22 01:00:55.673399	2022-08-22 01:00:55.673399	1
2008	37	2011	2022-08-22 01:00:55.681068	2022-08-22 01:00:55.681068	1
2009	37	2012	2022-08-22 01:00:55.688794	2022-08-22 01:00:55.688794	1
2010	35	2013	2022-08-22 01:00:55.696456	2022-08-22 01:00:55.696456	1
2011	37	2014	2022-08-22 01:00:55.704133	2022-08-22 01:00:55.704133	1
2012	35	2015	2022-08-22 01:00:55.71156	2022-08-22 01:00:55.71156	1
2013	35	2016	2022-08-22 01:00:55.71911	2022-08-22 01:00:55.71911	1
2014	34	2017	2022-08-22 01:00:55.733046	2022-08-22 01:00:55.733046	1
2015	37	2018	2022-08-22 01:00:55.745011	2022-08-22 01:00:55.745011	1
2016	34	2019	2022-08-22 01:00:55.753611	2022-08-22 01:00:55.753611	1
2017	34	2020	2022-08-22 01:00:55.761341	2022-08-22 01:00:55.761341	1
2018	37	2021	2022-08-22 01:00:55.769174	2022-08-22 01:00:55.769174	1
2019	35	2022	2022-08-22 01:00:55.776837	2022-08-22 01:00:55.776837	1
2020	35	2023	2022-08-22 01:00:55.785661	2022-08-22 01:00:55.785661	1
2021	35	2024	2022-08-22 01:00:55.796499	2022-08-22 01:00:55.796499	1
2022	37	2025	2022-08-22 01:00:55.809469	2022-08-22 01:00:55.809469	1
2023	35	2026	2022-08-22 01:00:55.816603	2022-08-22 01:00:55.816603	1
2024	35	2027	2022-08-22 01:00:55.824964	2022-08-22 01:00:55.824964	1
2025	37	2028	2022-08-22 01:00:55.83243	2022-08-22 01:00:55.83243	1
2026	37	2029	2022-08-22 01:00:55.840623	2022-08-22 01:00:55.840623	1
2027	37	2030	2022-08-22 01:00:55.848467	2022-08-22 01:00:55.848467	1
2028	37	2031	2022-08-22 01:00:55.856185	2022-08-22 01:00:55.856185	1
2029	35	2032	2022-08-22 01:00:55.865079	2022-08-22 01:00:55.865079	1
2030	37	2033	2022-08-22 01:00:55.872855	2022-08-22 01:00:55.872855	1
2031	37	2034	2022-08-22 01:00:55.882985	2022-08-22 01:00:55.882985	1
2032	37	2035	2022-08-22 01:00:55.890526	2022-08-22 01:00:55.890526	1
2033	35	2036	2022-08-22 01:00:55.901251	2022-08-22 01:00:55.901251	1
2034	35	2037	2022-08-22 01:00:55.91083	2022-08-22 01:00:55.91083	1
2035	35	2038	2022-08-22 01:00:55.920353	2022-08-22 01:00:55.920353	1
2036	37	2039	2022-08-22 01:00:55.927835	2022-08-22 01:00:55.927835	1
2114	35	2117	2022-08-22 18:29:31.821067	2022-08-22 18:29:31.821067	1
2115	37	2118	2022-08-22 18:29:31.834639	2022-08-22 18:29:31.834639	1
2124	37	2127	2022-08-22 19:21:42.540933	2022-08-22 19:21:42.540933	1
2125	34	2128	2022-08-22 19:21:42.556277	2022-08-22 19:21:42.556277	1
2126	37	2129	2022-08-22 19:21:42.565559	2022-08-22 19:21:42.565559	1
2127	31	2130	2022-08-23 12:59:31.007594	2022-08-23 12:59:31.007594	1
2128	31	2131	2022-08-23 12:59:31.019414	2022-08-23 12:59:31.019414	1
2129	31	2132	2022-08-23 12:59:31.028158	2022-08-23 12:59:31.028158	1
2130	33	2133	2022-08-23 12:59:31.036794	2022-08-23 12:59:31.036794	1
2131	33	2134	2022-08-23 12:59:31.045221	2022-08-23 12:59:31.045221	1
2132	33	2135	2022-08-23 12:59:31.053307	2022-08-23 12:59:31.053307	1
2133	31	2136	2022-08-23 12:59:31.061522	2022-08-23 12:59:31.061522	1
2134	31	2137	2022-08-23 12:59:31.069653	2022-08-23 12:59:31.069653	1
2100	35	2103	2022-08-22 18:09:40.071898	2022-08-22 18:09:40.071898	1
2101	34	2104	2022-08-22 18:09:40.088203	2022-08-22 18:09:40.088203	1
2102	37	2105	2022-08-22 18:09:40.100664	2022-08-22 18:09:40.100664	1
2135	31	2138	2022-08-23 12:59:31.07794	2022-08-23 12:59:31.07794	1
2136	31	2139	2022-08-23 12:59:31.086826	2022-08-23 12:59:31.086826	1
2137	33	2140	2022-08-23 12:59:31.095019	2022-08-23 12:59:31.095019	1
2138	33	2141	2022-08-23 12:59:31.103056	2022-08-23 12:59:31.103056	1
2139	33	2142	2022-08-23 12:59:31.111278	2022-08-23 12:59:31.111278	1
2140	33	2143	2022-08-23 12:59:31.119617	2022-08-23 12:59:31.119617	1
2141	33	2144	2022-08-23 12:59:31.127962	2022-08-23 12:59:31.127962	1
2142	33	2145	2022-08-23 12:59:31.13802	2022-08-23 12:59:31.13802	1
2143	33	2146	2022-08-23 12:59:31.147343	2022-08-23 12:59:31.147343	1
2144	33	2147	2022-08-23 12:59:31.158603	2022-08-23 12:59:31.158603	1
2145	33	2148	2022-08-23 12:59:31.16681	2022-08-23 12:59:31.16681	1
2146	33	2149	2022-08-23 12:59:31.177582	2022-08-23 12:59:31.177582	1
2147	33	2150	2022-08-23 12:59:31.185976	2022-08-23 12:59:31.185976	1
2148	33	2151	2022-08-23 12:59:31.197876	2022-08-23 12:59:31.197876	1
2149	33	2152	2022-08-23 12:59:31.216543	2022-08-23 12:59:31.216543	1
2150	33	2153	2022-08-23 12:59:31.226387	2022-08-23 12:59:31.226387	1
2151	33	2154	2022-08-23 12:59:31.236028	2022-08-23 12:59:31.236028	1
2152	33	2155	2022-08-23 12:59:31.244723	2022-08-23 12:59:31.244723	1
2153	33	2156	2022-08-23 12:59:31.252821	2022-08-23 12:59:31.252821	1
2154	31	2157	2022-08-23 12:59:31.261718	2022-08-23 12:59:31.261718	1
2155	31	2158	2022-08-23 12:59:31.269862	2022-08-23 12:59:31.269862	1
2156	31	2159	2022-08-23 12:59:31.277878	2022-08-23 12:59:31.277878	1
2157	30	2160	2022-08-23 19:18:00.089817	2022-08-23 19:18:00.089817	1
2158	30	2161	2022-08-23 19:18:00.099781	2022-08-23 19:18:00.099781	1
2159	30	2162	2022-08-23 19:18:00.109009	2022-08-23 19:18:00.109009	1
2160	30	2163	2022-08-23 19:18:00.118359	2022-08-23 19:18:00.118359	1
2161	30	2164	2022-08-23 19:18:00.127738	2022-08-23 19:18:00.127738	1
2162	30	2165	2022-08-23 19:18:00.136955	2022-08-23 19:18:00.136955	1
2163	30	2166	2022-08-23 19:18:00.145836	2022-08-23 19:18:00.145836	1
2164	30	2167	2022-08-23 19:18:00.154769	2022-08-23 19:18:00.154769	1
2165	30	2168	2022-08-23 19:18:00.164215	2022-08-23 19:18:00.164215	1
2166	30	2169	2022-08-23 19:18:00.173172	2022-08-23 19:18:00.173172	1
2167	30	2170	2022-08-23 19:18:00.18194	2022-08-23 19:18:00.18194	1
2168	30	2171	2022-08-23 19:18:00.190964	2022-08-23 19:18:00.190964	1
2169	30	2172	2022-08-23 19:18:00.199731	2022-08-23 19:18:00.199731	1
2170	30	2173	2022-08-23 19:18:00.208952	2022-08-23 19:18:00.208952	1
2171	30	2174	2022-08-23 19:18:00.218145	2022-08-23 19:18:00.218145	1
2172	30	2175	2022-08-23 19:18:00.228806	2022-08-23 19:18:00.228806	1
2173	30	2176	2022-08-23 19:18:00.239672	2022-08-23 19:18:00.239672	1
2174	30	2177	2022-08-23 19:18:00.254949	2022-08-23 19:18:00.254949	1
2175	30	2178	2022-08-23 19:18:00.265562	2022-08-23 19:18:00.265562	1
2176	30	2179	2022-08-23 19:18:00.274811	2022-08-23 19:18:00.274811	1
2177	30	2180	2022-08-23 19:18:00.283973	2022-08-23 19:18:00.283973	1
2178	30	2181	2022-08-23 19:18:00.292814	2022-08-23 19:18:00.292814	1
2179	40	2182	2022-08-23 21:52:16.9616	2022-08-23 21:52:16.9616	1
2180	40	2183	2022-08-23 21:52:16.971199	2022-08-23 21:52:16.971199	1
2181	39	2184	2022-08-23 21:52:16.979703	2022-08-23 21:52:16.979703	1
2182	40	2185	2022-08-23 21:52:16.987917	2022-08-23 21:52:16.987917	1
2183	40	2186	2022-08-23 21:52:16.996377	2022-08-23 21:52:16.996377	1
2184	40	2187	2022-08-23 21:52:17.00483	2022-08-23 21:52:17.00483	1
2185	40	2188	2022-08-23 21:52:17.013156	2022-08-23 21:52:17.013156	1
2186	40	2189	2022-08-23 21:52:17.021528	2022-08-23 21:52:17.021528	1
2187	39	2190	2022-08-23 21:52:17.030159	2022-08-23 21:52:17.030159	1
2188	39	2191	2022-08-23 21:52:17.038432	2022-08-23 21:52:17.038432	1
2189	40	2192	2022-08-23 21:52:17.046293	2022-08-23 21:52:17.046293	1
2190	39	2193	2022-08-23 21:52:17.054721	2022-08-23 21:52:17.054721	1
2191	39	2194	2022-08-23 21:52:17.063101	2022-08-23 21:52:17.063101	1
2192	40	2195	2022-08-23 21:52:17.071482	2022-08-23 21:52:17.071482	1
2193	39	2196	2022-08-23 21:52:17.079743	2022-08-23 21:52:17.079743	1
2194	40	2197	2022-08-23 21:52:17.087901	2022-08-23 21:52:17.087901	1
2195	33	2198	2022-08-23 21:52:17.09625	2022-08-23 21:52:17.09625	1
2196	30	2199	2022-08-23 21:52:17.104716	2022-08-23 21:52:17.104716	1
2197	37	2200	2022-08-25 06:38:35.17654	2022-08-25 06:38:35.17654	1
2198	35	2201	2022-08-25 06:38:35.186878	2022-08-25 06:38:35.186878	1
2199	38	2202	2022-08-25 06:38:35.195299	2022-08-25 06:38:35.195299	1
2200	33	2203	2022-08-25 06:38:35.203436	2022-08-25 06:38:35.203436	1
2201	30	2204	2022-08-25 06:38:35.211568	2022-08-25 06:38:35.211568	1
2202	40	2205	2022-08-26 11:30:02.169324	2022-08-26 11:30:02.169324	1
2203	37	2206	2022-08-27 17:20:05.117951	2022-08-27 17:20:05.117951	1
2204	33	2207	2022-08-27 17:20:05.129347	2022-08-27 17:20:05.129347	1
2205	38	2208	2022-08-27 17:20:05.143537	2022-08-27 17:20:05.143537	1
2206	38	2209	2022-08-27 17:20:05.152657	2022-08-27 17:20:05.152657	1
2207	37	2210	2022-08-27 17:20:05.16106	2022-08-27 17:20:05.16106	1
2208	31	2211	2022-08-27 20:40:04.208048	2022-08-27 20:40:04.208048	1
2209	37	2212	2022-08-27 21:40:03.566074	2022-08-27 21:40:03.566074	1
2210	33	2213	2022-08-28 09:20:06.311715	2022-08-28 09:20:06.311715	1
2211	37	2214	2022-08-28 13:00:03.505526	2022-08-28 13:00:03.505526	1
2212	37	2215	2022-08-28 13:20:02.191669	2022-08-28 13:20:02.191669	1
2213	31	2216	2022-08-28 16:40:02.409647	2022-08-28 16:40:02.409647	1
\.


--
-- Data for Name: orders; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.orders (id, api_data, excel_data, date, import_id, campaign_id, created_at, updated_at) FROM stdin;
1969	{"date": "2022-07-16T03:55:31", "nmId": 111885412, "odid": 600130860668, "srid": "", "brand": "", "oblast": "Московская", "barcode": "2038421434621", "gNumber": "6598583678221735452", "sticker": "", "subject": "Масло растительное", "category": "Продукты", "incomeID": 8043602, "isCancel": false, "techSize": "0", "cancel_dt": "0001-01-01T00:00:00", "totalPrice": 1380, "warehouseName": "Коледино", "lastChangeDate": "2022-07-16T08:15:51", "discountPercent": 37, "supplierArticle": "52003624003"}	\N	2022-07-16 08:55:31	97	1	2022-08-22 01:00:55.240283	2022-08-22 01:00:55.240283
1970	{"date": "2022-07-16T03:55:20", "nmId": 111054747, "odid": 600130860602, "srid": "", "brand": "SITIA", "oblast": "Московская", "barcode": "5200119080658", "gNumber": "9390746387429365796", "sticker": "", "subject": "Масло растительное", "category": "Продукты", "incomeID": 7993537, "isCancel": false, "techSize": "0", "cancel_dt": "0001-01-01T00:00:00", "totalPrice": 2300, "warehouseName": "Электросталь", "lastChangeDate": "2022-07-16T13:57:50", "discountPercent": 43, "supplierArticle": "5200119080675200119080665"}	\N	2022-07-16 08:55:20	97	1	2022-08-22 01:00:55.255761	2022-08-22 01:00:55.255761
1971	{"date": "2022-07-16T05:41:18", "nmId": 111054747, "odid": 600130937317, "srid": "", "brand": "SITIA", "oblast": "Москва", "barcode": "5200119080658", "gNumber": "106682006915968135", "sticker": "", "subject": "Масло растительное", "category": "Продукты", "incomeID": 7993537, "isCancel": false, "techSize": "0", "cancel_dt": "0001-01-01T00:00:00", "totalPrice": 2300, "warehouseName": "Электросталь", "lastChangeDate": "2022-07-16T13:57:50", "discountPercent": 43, "supplierArticle": "5200119080675200119080665"}	\N	2022-07-16 10:41:18	97	1	2022-08-22 01:00:55.263503	2022-08-22 01:00:55.263503
1972	{"date": "2022-07-16T22:48:52", "nmId": 111885790, "odid": 600135151302, "srid": "", "brand": "", "oblast": "МСК Север", "barcode": "2038421534628", "gNumber": "7052925893322153772", "sticker": "", "subject": "Масло растительное", "category": "Продукты", "incomeID": 8043602, "isCancel": false, "techSize": "0", "cancel_dt": "0001-01-01T00:00:00", "totalPrice": 1600, "warehouseName": "Коледино", "lastChangeDate": "2022-07-17T01:44:29", "discountPercent": 43, "supplierArticle": "88571217752"}	\N	2022-07-17 03:48:52	97	1	2022-08-22 01:00:55.271271	2022-08-22 01:00:55.271271
1973	{"date": "2022-07-17T11:40:36", "nmId": 111885790, "odid": 600136844310, "srid": "", "brand": "", "oblast": "Свердловская", "barcode": "2038421534628", "gNumber": "93154200604084421839", "sticker": "", "subject": "Масло растительное", "category": "Продукты", "incomeID": 8043602, "isCancel": false, "techSize": "0", "cancel_dt": "0001-01-01T00:00:00", "totalPrice": 1600, "warehouseName": "Коледино", "lastChangeDate": "2022-07-17T17:46:10", "discountPercent": 43, "supplierArticle": "88571217752"}	\N	2022-07-17 16:40:36	97	1	2022-08-22 01:00:55.278391	2022-08-22 01:00:55.278391
1974	{"date": "2022-07-17T16:24:31", "nmId": 111885790, "odid": 600138322603, "srid": "", "brand": "", "oblast": "МСК Север", "barcode": "2038421534628", "gNumber": "94279303375705806515", "sticker": "", "subject": "Масло растительное", "category": "Продукты", "incomeID": 8043602, "isCancel": false, "techSize": "0", "cancel_dt": "0001-01-01T00:00:00", "totalPrice": 1600, "warehouseName": "Коледино", "lastChangeDate": "2022-07-17T21:14:12", "discountPercent": 43, "supplierArticle": "88571217752"}	\N	2022-07-17 21:24:31	97	1	2022-08-22 01:00:55.286304	2022-08-22 01:00:55.286304
1975	{"date": "2022-07-17T20:11:28", "nmId": 111885790, "odid": 600139407427, "srid": "", "brand": "", "oblast": "Новгородская", "barcode": "2038421534628", "gNumber": "5676042281785688336", "sticker": "", "subject": "Масло растительное", "category": "Продукты", "incomeID": 8043602, "isCancel": false, "techSize": "0", "cancel_dt": "0001-01-01T00:00:00", "totalPrice": 1600, "warehouseName": "Коледино", "lastChangeDate": "2022-07-17T23:27:48", "discountPercent": 43, "supplierArticle": "88571217752"}	\N	2022-07-18 01:11:28	97	1	2022-08-22 01:00:55.293935	2022-08-22 01:00:55.293935
1976	{"date": "2022-07-17T20:49:54", "nmId": 111885790, "odid": 600139594467, "srid": "", "brand": "", "oblast": "МСК Север", "barcode": "2038421534628", "gNumber": "6205462050418123575", "sticker": "", "subject": "Масло растительное", "category": "Продукты", "incomeID": 8043602, "isCancel": false, "techSize": "0", "cancel_dt": "0001-01-01T00:00:00", "totalPrice": 1600, "warehouseName": "Коледино", "lastChangeDate": "2022-07-17T23:27:48", "discountPercent": 43, "supplierArticle": "88571217752"}	\N	2022-07-18 01:49:54	97	1	2022-08-22 01:00:55.302311	2022-08-22 01:00:55.302311
1977	{"date": "2022-07-17T22:13:48", "nmId": 111054747, "odid": 600139999912, "srid": "", "brand": "SITIA", "oblast": "Москва", "barcode": "5200119080658", "gNumber": "3067444248557520869", "sticker": "", "subject": "Масло растительное", "category": "Продукты", "incomeID": 8090310, "isCancel": false, "techSize": "0", "cancel_dt": "0001-01-01T00:00:00", "totalPrice": 2300, "warehouseName": "Коледино", "lastChangeDate": "2022-07-18T03:34:51", "discountPercent": 43, "supplierArticle": "5200119080675200119080665"}	\N	2022-07-18 03:13:48	97	1	2022-08-22 01:00:55.311745	2022-08-22 01:00:55.311745
1978	{"date": "2022-07-18T16:22:49", "nmId": 111054747, "odid": 600143925825, "srid": "", "brand": "SITIA", "oblast": "Москва", "barcode": "5200119080658", "gNumber": "3051314166310553804", "sticker": "", "subject": "Масло растительное", "category": "Продукты", "incomeID": 8090310, "isCancel": false, "techSize": "0", "cancel_dt": "0001-01-01T00:00:00", "totalPrice": 1311, "warehouseName": "Коледино", "lastChangeDate": "2022-07-18T21:33:25", "discountPercent": 0, "supplierArticle": "5200119080675200119080665"}	\N	2022-07-18 21:22:49	97	1	2022-08-22 01:00:55.319686	2022-08-22 01:00:55.319686
1979	{"date": "2022-07-19T01:33:07", "nmId": 111054747, "odid": 204228934155, "srid": "", "brand": "SITIA", "oblast": "Московская", "barcode": "5200119080658", "gNumber": "9832178059933097934", "sticker": "", "subject": "Масло растительное", "category": "Продукты", "incomeID": 8090310, "isCancel": false, "techSize": "0", "cancel_dt": "0001-01-01T00:00:00", "totalPrice": 1311, "warehouseName": "Коледино", "lastChangeDate": "2022-07-19T08:15:24", "discountPercent": 0, "supplierArticle": "5200119080675200119080665"}	\N	2022-07-19 06:33:07	97	1	2022-08-22 01:00:55.327204	2022-08-22 01:00:55.327204
1980	{"date": "2022-07-19T01:33:51", "nmId": 111054747, "odid": 204228934259, "srid": "", "brand": "SITIA", "oblast": "", "barcode": "5200119080658", "gNumber": "8362120467514808912", "sticker": "", "subject": "Масло растительное", "category": "Продукты", "incomeID": 8090310, "isCancel": false, "techSize": "0", "cancel_dt": "0001-01-01T00:00:00", "totalPrice": 1311, "warehouseName": "Коледино", "lastChangeDate": "2022-07-19T08:34:07", "discountPercent": 0, "supplierArticle": "5200119080675200119080665"}	\N	2022-07-19 06:33:51	97	1	2022-08-22 01:00:55.334616	2022-08-22 01:00:55.334616
1981	{"date": "2022-07-19T01:12:16", "nmId": 111885412, "odid": 204228930717, "srid": "", "brand": "", "oblast": "Московская", "barcode": "2038421434621", "gNumber": "96085955034575031073", "sticker": "", "subject": "Масло растительное", "category": "Продукты", "incomeID": 8043602, "isCancel": false, "techSize": "0", "cancel_dt": "0001-01-01T00:00:00", "totalPrice": 869.4, "warehouseName": "Коледино", "lastChangeDate": "2022-07-19T10:11:17", "discountPercent": 0, "supplierArticle": "52003624003"}	\N	2022-07-19 06:12:16	97	1	2022-08-22 01:00:55.373494	2022-08-22 01:00:55.373494
1982	{"date": "2022-07-19T00:55:03", "nmId": 111885412, "odid": 204228927595, "srid": "", "brand": "", "oblast": "Московская", "barcode": "2038421434621", "gNumber": "1252179155780689164", "sticker": "", "subject": "Масло растительное", "category": "Продукты", "incomeID": 8043602, "isCancel": false, "techSize": "0", "cancel_dt": "0001-01-01T00:00:00", "totalPrice": 869.4, "warehouseName": "Коледино", "lastChangeDate": "2022-07-19T10:28:37", "discountPercent": 0, "supplierArticle": "52003624003"}	\N	2022-07-19 05:55:03	97	1	2022-08-22 01:00:55.400697	2022-08-22 01:00:55.400697
1983	{"date": "2022-07-19T09:11:08", "nmId": 111885790, "odid": 600147174600, "srid": "", "brand": "Agrilife", "oblast": "Москва", "barcode": "2038421534628", "gNumber": "7130244715504760032", "sticker": "", "subject": "Масло растительное", "category": "Продукты", "incomeID": 8043602, "isCancel": false, "techSize": "0", "cancel_dt": "0001-01-01T00:00:00", "totalPrice": 1600, "warehouseName": "Коледино", "lastChangeDate": "2022-07-19T15:53:06", "discountPercent": 43, "supplierArticle": "88571217752"}	\N	2022-07-19 14:11:08	97	1	2022-08-22 01:00:55.423544	2022-08-22 01:00:55.423544
1984	{"date": "2022-07-19T09:25:48", "nmId": 111885790, "odid": 600147253563, "srid": "", "brand": "Agrilife", "oblast": "Московская", "barcode": "2038421534628", "gNumber": "1307524848808056836", "sticker": "", "subject": "Масло растительное", "category": "Продукты", "incomeID": 8043602, "isCancel": false, "techSize": "0", "cancel_dt": "0001-01-01T00:00:00", "totalPrice": 1600, "warehouseName": "Коледино", "lastChangeDate": "2022-07-19T15:53:06", "discountPercent": 43, "supplierArticle": "88571217752"}	\N	2022-07-19 14:25:48	97	1	2022-08-22 01:00:55.432531	2022-08-22 01:00:55.432531
1985	{"date": "2022-07-19T16:03:48", "nmId": 111054747, "odid": 600149535589, "srid": "", "brand": "SITIA", "oblast": "Смоленская", "barcode": "5200119080658", "gNumber": "96631690733328468699", "sticker": "", "subject": "Масло растительное", "category": "Продукты", "incomeID": 8090310, "isCancel": false, "techSize": "0", "cancel_dt": "0001-01-01T00:00:00", "totalPrice": 2300, "warehouseName": "Коледино", "lastChangeDate": "2022-07-19T21:33:16", "discountPercent": 43, "supplierArticle": "5200119080675200119080665"}	\N	2022-07-19 21:03:48	97	1	2022-08-22 01:00:55.440456	2022-08-22 01:00:55.440456
1986	{"date": "2022-07-19T16:46:52", "nmId": 111885790, "odid": 204229367192, "srid": "", "brand": "Agrilife", "oblast": "Москва", "barcode": "2038421534628", "gNumber": "8854644238441661165", "sticker": "", "subject": "Масло растительное", "category": "Продукты", "incomeID": 8043602, "isCancel": false, "techSize": "0", "cancel_dt": "0001-01-01T00:00:00", "totalPrice": 912, "warehouseName": "Коледино", "lastChangeDate": "2022-07-20T00:48:14", "discountPercent": 0, "supplierArticle": "88571217752"}	\N	2022-07-19 21:46:52	97	1	2022-08-22 01:00:55.448515	2022-08-22 01:00:55.448515
1987	{"date": "2022-07-19T17:04:11", "nmId": 111054747, "odid": 153978775195, "srid": "", "brand": "SITIA", "oblast": "Москва", "barcode": "5200119080658", "gNumber": "91874898440249097794", "sticker": "", "subject": "Масло растительное", "category": "Продукты", "incomeID": 8090310, "isCancel": false, "techSize": "0", "cancel_dt": "0001-01-01T00:00:00", "totalPrice": 1311, "warehouseName": "Коледино", "lastChangeDate": "2022-07-20T00:52:44", "discountPercent": 0, "supplierArticle": "5200119080675200119080665"}	\N	2022-07-19 22:04:11	97	1	2022-08-22 01:00:55.456501	2022-08-22 01:00:55.456501
1988	{"date": "2022-07-19T20:12:52", "nmId": 111885790, "odid": 600150963072, "srid": "", "brand": "Agrilife", "oblast": "Санкт-Петербург", "barcode": "2038421534628", "gNumber": "97877508705221221835", "sticker": "", "subject": "Масло растительное", "category": "Продукты", "incomeID": 8043602, "isCancel": false, "techSize": "0", "cancel_dt": "0001-01-01T00:00:00", "totalPrice": 1600, "warehouseName": "Коледино", "lastChangeDate": "2022-07-20T03:33:50", "discountPercent": 43, "supplierArticle": "88571217752"}	\N	2022-07-20 01:12:52	97	1	2022-08-22 01:00:55.464364	2022-08-22 01:00:55.464364
1989	{"date": "2022-07-20T04:17:58", "nmId": 111054747, "odid": 600152630878, "srid": "", "brand": "SITIA", "oblast": "Московская", "barcode": "5200119080658", "gNumber": "97113180597304254700", "sticker": "", "subject": "Масло растительное", "category": "Продукты", "incomeID": 8090310, "isCancel": false, "techSize": "0", "cancel_dt": "0001-01-01T00:00:00", "totalPrice": 2300, "warehouseName": "Коледино", "lastChangeDate": "2022-07-20T08:15:40", "discountPercent": 43, "supplierArticle": "5200119080675200119080665"}	\N	2022-07-20 09:17:58	97	1	2022-08-22 01:00:55.484539	2022-08-22 01:00:55.484539
1990	{"date": "2022-07-20T10:06:58", "nmId": 111885412, "odid": 600153852918, "srid": "", "brand": "", "oblast": "Краснодарский", "barcode": "2038421434621", "gNumber": "95799096078630662694", "sticker": "", "subject": "Масло растительное", "category": "Продукты", "incomeID": 8043602, "isCancel": false, "techSize": "0", "cancel_dt": "0001-01-01T00:00:00", "totalPrice": 1380, "warehouseName": "Коледино", "lastChangeDate": "2022-07-20T14:54:15", "discountPercent": 37, "supplierArticle": "52003624003"}	\N	2022-07-20 15:06:58	97	1	2022-08-22 01:00:55.501971	2022-08-22 01:00:55.501971
1991	{"date": "2022-07-20T09:22:07", "nmId": 111054747, "odid": 153978935640, "srid": "", "brand": "SITIA", "oblast": "Москва", "barcode": "5200119080658", "gNumber": "2865244245494888398", "sticker": "", "subject": "Масло растительное", "category": "Продукты", "incomeID": 8090310, "isCancel": false, "techSize": "0", "cancel_dt": "0001-01-01T00:00:00", "totalPrice": 2300, "warehouseName": "Коледино", "lastChangeDate": "2022-07-20T20:37:01", "discountPercent": 43, "supplierArticle": "5200119080675200119080665"}	\N	2022-07-20 14:22:07	97	1	2022-08-22 01:00:55.512168	2022-08-22 01:00:55.512168
1992	{"date": "2022-07-20T21:53:41", "nmId": 111054747, "odid": 600158432367, "srid": "", "brand": "SITIA", "oblast": "Москва", "barcode": "5200119080658", "gNumber": "8466977207633585737", "sticker": "", "subject": "Масло растительное", "category": "Продукты", "incomeID": 8090310, "isCancel": false, "techSize": "0", "cancel_dt": "0001-01-01T00:00:00", "totalPrice": 2300, "warehouseName": "Коледино", "lastChangeDate": "2022-07-21T01:41:44", "discountPercent": 43, "supplierArticle": "5200119080675200119080665"}	\N	2022-07-21 02:53:41	97	1	2022-08-22 01:00:55.521596	2022-08-22 01:00:55.521596
1993	{"date": "2022-07-20T22:32:41", "nmId": 111054747, "odid": 600158671260, "srid": "", "brand": "SITIA", "oblast": "Московская", "barcode": "5200119080658", "gNumber": "95347281468253444661", "sticker": "", "subject": "Масло растительное", "category": "Продукты", "incomeID": 8090310, "isCancel": false, "techSize": "0", "cancel_dt": "0001-01-01T00:00:00", "totalPrice": 2300, "warehouseName": "Коледино", "lastChangeDate": "2022-07-21T01:41:44", "discountPercent": 43, "supplierArticle": "5200119080675200119080665"}	\N	2022-07-21 03:32:41	97	1	2022-08-22 01:00:55.529126	2022-08-22 01:00:55.529126
1994	{"date": "2022-07-21T11:01:27", "nmId": 111054747, "odid": 600161020081, "srid": "", "brand": "SITIA", "oblast": "Вологодская", "barcode": "5200119080658", "gNumber": "3813373160298109557", "sticker": "", "subject": "Масло растительное", "category": "Продукты", "incomeID": 8090310, "isCancel": false, "techSize": "0", "cancel_dt": "0001-01-01T00:00:00", "totalPrice": 2300, "warehouseName": "Коледино", "lastChangeDate": "2022-07-21T17:00:59", "discountPercent": 43, "supplierArticle": "5200119080675200119080665"}	\N	2022-07-21 16:01:27	97	1	2022-08-22 01:00:55.536658	2022-08-22 01:00:55.536658
1995	{"date": "2022-07-21T18:56:48", "nmId": 111054747, "odid": 153979407759, "srid": "", "brand": "SITIA", "oblast": "Ростовская", "barcode": "5200119080658", "gNumber": "97744384078011599213", "sticker": "", "subject": "Масло растительное", "category": "Продукты", "incomeID": 8090310, "isCancel": false, "techSize": "0", "cancel_dt": "0001-01-01T00:00:00", "totalPrice": 2300, "warehouseName": "Коледино", "lastChangeDate": "2022-07-22T01:21:13", "discountPercent": 43, "supplierArticle": "5200119080675200119080665"}	\N	2022-07-21 23:56:48	97	1	2022-08-22 01:00:55.545497	2022-08-22 01:00:55.545497
1996	{"date": "2022-07-21T20:51:27", "nmId": 111054747, "odid": 600164800897, "srid": "", "brand": "SITIA", "oblast": "Самарская", "barcode": "5200119080658", "gNumber": "96421026137884643653", "sticker": "", "subject": "Масло растительное", "category": "Продукты", "incomeID": 7993537, "isCancel": false, "techSize": "0", "cancel_dt": "0001-01-01T00:00:00", "totalPrice": 2300, "warehouseName": "Электросталь", "lastChangeDate": "2022-07-22T01:21:13", "discountPercent": 43, "supplierArticle": "5200119080675200119080665"}	\N	2022-07-22 01:51:27	97	1	2022-08-22 01:00:55.553837	2022-08-22 01:00:55.553837
1997	{"date": "2022-07-22T13:51:10", "nmId": 111054747, "odid": 600168907044, "srid": "", "brand": "SITIA", "oblast": "Московская", "barcode": "5200119080658", "gNumber": "1470591748726580048", "sticker": "", "subject": "Масло растительное", "category": "Продукты", "incomeID": 7993537, "isCancel": false, "techSize": "0", "cancel_dt": "0001-01-01T00:00:00", "totalPrice": 2300, "warehouseName": "Электросталь", "lastChangeDate": "2022-07-23T00:20:46", "discountPercent": 43, "supplierArticle": "5200119080675200119080665"}	\N	2022-07-22 18:51:10	97	1	2022-08-22 01:00:55.565798	2022-08-22 01:00:55.565798
1998	{"date": "2022-07-22T20:56:47", "nmId": 111054747, "odid": 600171379383, "srid": "", "brand": "SITIA", "oblast": "Санкт-Петербург", "barcode": "5200119080658", "gNumber": "91294600139323089081", "sticker": "", "subject": "Масло растительное", "category": "Продукты", "incomeID": 7993537, "isCancel": false, "techSize": "0", "cancel_dt": "0001-01-01T00:00:00", "totalPrice": 2300, "warehouseName": "Электросталь", "lastChangeDate": "2022-07-23T00:20:46", "discountPercent": 43, "supplierArticle": "5200119080675200119080665"}	\N	2022-07-23 01:56:47	97	1	2022-08-22 01:00:55.573493	2022-08-22 01:00:55.573493
1999	{"date": "2022-07-22T20:56:47", "nmId": 111054747, "odid": 600171379384, "srid": "", "brand": "SITIA", "oblast": "Санкт-Петербург", "barcode": "5200119080658", "gNumber": "91294600139323089081", "sticker": "", "subject": "Масло растительное", "category": "Продукты", "incomeID": 7993537, "isCancel": false, "techSize": "0", "cancel_dt": "0001-01-01T00:00:00", "totalPrice": 2300, "warehouseName": "Электросталь", "lastChangeDate": "2022-07-23T00:20:46", "discountPercent": 43, "supplierArticle": "5200119080675200119080665"}	\N	2022-07-23 01:56:47	97	1	2022-08-22 01:00:55.581224	2022-08-22 01:00:55.581224
2000	{"date": "2022-07-23T10:02:24", "nmId": 111054747, "odid": 600173579147, "srid": "de40ca9bc91448b4b5a42036c798b332", "brand": "SITIA", "oblast": "Ставропольский", "barcode": "5200119080658", "gNumber": "9615959115607551863", "sticker": "", "subject": "Масло растительное", "category": "Продукты", "incomeID": 7993537, "isCancel": false, "techSize": "0", "cancel_dt": "0001-01-01T00:00:00", "totalPrice": 2300, "warehouseName": "Электросталь", "lastChangeDate": "2022-07-23T13:20:33", "discountPercent": 43, "supplierArticle": "5200119080675200119080665"}	\N	2022-07-23 15:02:24	97	1	2022-08-22 01:00:55.589145	2022-08-22 01:00:55.589145
2001	{"date": "2022-07-23T16:10:51", "nmId": 111885790, "odid": 600175899486, "srid": "512dac4b47ab48baa2c55206acb0b5db", "brand": "Agrilife", "oblast": "Московская", "barcode": "2038421534628", "gNumber": "5751822588636929702", "sticker": "", "subject": "Масло растительное", "category": "Продукты", "incomeID": 8043602, "isCancel": false, "techSize": "0", "cancel_dt": "0001-01-01T00:00:00", "totalPrice": 1600, "warehouseName": "Коледино", "lastChangeDate": "2022-07-23T20:40:13", "discountPercent": 43, "supplierArticle": "88571217752"}	\N	2022-07-23 21:10:51	97	1	2022-08-22 01:00:55.59684	2022-08-22 01:00:55.59684
2002	{"date": "2022-07-24T10:25:47", "nmId": 111885790, "odid": 600179625801, "srid": "6cfaea38fa954d40a314ac89417e2fbd", "brand": "Agrilife", "oblast": "Москва", "barcode": "2038421534628", "gNumber": "4525935890234545354", "sticker": "", "subject": "Масло растительное", "category": "Продукты", "incomeID": 8043602, "isCancel": false, "techSize": "0", "cancel_dt": "0001-01-01T00:00:00", "totalPrice": 1600, "warehouseName": "Коледино", "lastChangeDate": "2022-07-24T14:00:28", "discountPercent": 43, "supplierArticle": "88571217752"}	\N	2022-07-24 15:25:47	97	1	2022-08-22 01:00:55.604413	2022-08-22 01:00:55.604413
2003	{"date": "2022-07-25T18:00:04", "nmId": 111885790, "odid": 600188279865, "srid": "3620aaab54924fc6a256c0c242333ae1", "brand": "Agrilife", "oblast": "Московская", "barcode": "2038421534628", "gNumber": "7398834585738582360", "sticker": "", "subject": "Масло растительное", "category": "Продукты", "incomeID": 8043602, "isCancel": false, "techSize": "0", "cancel_dt": "0001-01-01T00:00:00", "totalPrice": 1600, "warehouseName": "Коледино", "lastChangeDate": "2022-07-25T23:40:40", "discountPercent": 43, "supplierArticle": "88571217752"}	\N	2022-07-25 23:00:04	97	1	2022-08-22 01:00:55.613744	2022-08-22 01:00:55.613744
2004	{"date": "2022-07-26T06:17:38", "nmId": 111885790, "odid": 600190620994, "srid": "606071efeeaf4913944599a090cee1aa", "brand": "Agrilife", "oblast": "Свердловская", "barcode": "2038421534628", "gNumber": "6128164643827498750", "sticker": "", "subject": "Масло растительное", "category": "Продукты", "incomeID": 8043602, "isCancel": false, "techSize": "0", "cancel_dt": "0001-01-01T00:00:00", "totalPrice": 1600, "warehouseName": "Коледино", "lastChangeDate": "2022-07-26T12:42:02", "discountPercent": 43, "supplierArticle": "88571217752"}	\N	2022-07-26 11:17:38	97	1	2022-08-22 01:00:55.622008	2022-08-22 01:00:55.622008
2005	{"date": "2022-07-26T06:17:38", "nmId": 111885790, "odid": 600190620993, "srid": "4e14a75086ec4fee8b05ee436070003a", "brand": "Agrilife", "oblast": "Свердловская", "barcode": "2038421534628", "gNumber": "6128164643827498750", "sticker": "", "subject": "Масло растительное", "category": "Продукты", "incomeID": 8043602, "isCancel": false, "techSize": "0", "cancel_dt": "0001-01-01T00:00:00", "totalPrice": 1600, "warehouseName": "Коледино", "lastChangeDate": "2022-07-26T12:42:02", "discountPercent": 43, "supplierArticle": "88571217752"}	\N	2022-07-26 11:17:38	97	1	2022-08-22 01:00:55.630943	2022-08-22 01:00:55.630943
2006	{"date": "2022-07-26T06:23:49", "nmId": 111885790, "odid": 600190632274, "srid": "8cd42a8c7c3744f68d4ab1e9bdedf279", "brand": "Agrilife", "oblast": "Москва", "barcode": "2038421534628", "gNumber": "57178571003800884", "sticker": "", "subject": "Масло растительное", "category": "Продукты", "incomeID": 8043602, "isCancel": false, "techSize": "0", "cancel_dt": "0001-01-01T00:00:00", "totalPrice": 1600, "warehouseName": "Коледино", "lastChangeDate": "2022-07-26T12:42:02", "discountPercent": 43, "supplierArticle": "88571217752"}	\N	2022-07-26 11:23:49	97	1	2022-08-22 01:00:55.638243	2022-08-22 01:00:55.638243
2007	{"date": "2022-07-26T06:23:49", "nmId": 111885790, "odid": 600190632273, "srid": "27d7ddbd9214423b9c9ff21b00ab810d", "brand": "Agrilife", "oblast": "Москва", "barcode": "2038421534628", "gNumber": "57178571003800884", "sticker": "", "subject": "Масло растительное", "category": "Продукты", "incomeID": 8043602, "isCancel": false, "techSize": "0", "cancel_dt": "0001-01-01T00:00:00", "totalPrice": 1600, "warehouseName": "Коледино", "lastChangeDate": "2022-07-26T12:42:02", "discountPercent": 43, "supplierArticle": "88571217752"}	\N	2022-07-26 11:23:49	97	1	2022-08-22 01:00:55.646034	2022-08-22 01:00:55.646034
2008	{"date": "2022-07-26T14:14:15", "nmId": 111885790, "odid": 600193184828, "srid": "d160e247421d49adb2c889ef6065fe15", "brand": "Agrilife", "oblast": "Новосибирская", "barcode": "2038421534628", "gNumber": "1801988205184965912", "sticker": "", "subject": "Масло растительное", "category": "Продукты", "incomeID": 8043602, "isCancel": false, "techSize": "0", "cancel_dt": "0001-01-01T00:00:00", "totalPrice": 1600, "warehouseName": "Коледино", "lastChangeDate": "2022-07-26T20:24:18", "discountPercent": 43, "supplierArticle": "88571217752"}	\N	2022-07-26 19:14:15	97	1	2022-08-22 01:00:55.654974	2022-08-22 01:00:55.654974
2009	{"date": "2022-07-26T18:24:56", "nmId": 111885790, "odid": 600194621025, "srid": "8af7ebeffdbf475b8d6ed7370ebe5247", "brand": "Agrilife", "oblast": "Московская", "barcode": "2038421534628", "gNumber": "7488614434359807523", "sticker": "", "subject": "Масло растительное", "category": "Продукты", "incomeID": 8043602, "isCancel": false, "techSize": "0", "cancel_dt": "0001-01-01T00:00:00", "totalPrice": 1600, "warehouseName": "Коледино", "lastChangeDate": "2022-07-26T22:21:08", "discountPercent": 43, "supplierArticle": "88571217752"}	\N	2022-07-26 23:24:56	97	1	2022-08-22 01:00:55.662869	2022-08-22 01:00:55.662869
2010	{"date": "2022-07-26T23:20:51", "nmId": 111054747, "odid": 600196167688, "srid": "38b3710f0b92427091596393e2c446b5", "brand": "SITIA", "oblast": "Москва", "barcode": "5200119080658", "gNumber": "96151198911222724373", "sticker": "", "subject": "Масло растительное", "category": "Продукты", "incomeID": 7993537, "isCancel": false, "techSize": "0", "cancel_dt": "0001-01-01T00:00:00", "totalPrice": 2300, "warehouseName": "Электросталь", "lastChangeDate": "2022-07-27T05:12:27", "discountPercent": 43, "supplierArticle": "5200119080675200119080665"}	\N	2022-07-27 04:20:51	97	1	2022-08-22 01:00:55.67135	2022-08-22 01:00:55.67135
2011	{"date": "2022-07-26T23:20:51", "nmId": 111054747, "odid": 600196167689, "srid": "9db568d72e0643dab9ab9dce5542cd9a", "brand": "SITIA", "oblast": "Москва", "barcode": "5200119080658", "gNumber": "96151198911222724373", "sticker": "", "subject": "Масло растительное", "category": "Продукты", "incomeID": 7993537, "isCancel": false, "techSize": "0", "cancel_dt": "0001-01-01T00:00:00", "totalPrice": 2300, "warehouseName": "Электросталь", "lastChangeDate": "2022-07-27T05:12:27", "discountPercent": 43, "supplierArticle": "5200119080675200119080665"}	\N	2022-07-27 04:20:51	97	1	2022-08-22 01:00:55.679108	2022-08-22 01:00:55.679108
2012	{"date": "2022-07-27T01:57:01", "nmId": 111054747, "odid": 600196536692, "srid": "0c6aad59ca0f46aab4b2915a74b0f1ff", "brand": "SITIA", "oblast": "Москва", "barcode": "5200119080658", "gNumber": "6366956790700882173", "sticker": "", "subject": "Масло растительное", "category": "Продукты", "incomeID": 7993537, "isCancel": false, "techSize": "0", "cancel_dt": "0001-01-01T00:00:00", "totalPrice": 2300, "warehouseName": "Электросталь", "lastChangeDate": "2022-07-27T11:40:54", "discountPercent": 43, "supplierArticle": "5200119080675200119080665"}	\N	2022-07-27 06:57:01	97	1	2022-08-22 01:00:55.68701	2022-08-22 01:00:55.68701
2013	{"date": "2022-07-27T14:59:09", "nmId": 111885790, "odid": 600199663463, "srid": "49e29ebdb8db4d5d824e55ecb583bf42", "brand": "Agrilife", "oblast": "Москва", "barcode": "2038421534628", "gNumber": "94211530962406900367", "sticker": "", "subject": "Масло растительное", "category": "Продукты", "incomeID": 8043602, "isCancel": false, "techSize": "0", "cancel_dt": "0001-01-01T00:00:00", "totalPrice": 1600, "warehouseName": "Коледино", "lastChangeDate": "2022-07-27T19:20:23", "discountPercent": 43, "supplierArticle": "88571217752"}	\N	2022-07-27 19:59:09	97	1	2022-08-22 01:00:55.694622	2022-08-22 01:00:55.694622
2014	{"date": "2022-07-27T10:20:27", "nmId": 111054747, "odid": 9000137571635, "srid": "0d5b87d590534816af3264c0324c1361", "brand": "SITIA", "oblast": "Смоленская", "barcode": "5200119080658", "gNumber": "6719820780371252507", "sticker": "", "subject": "Масло растительное", "category": "Продукты", "incomeID": 0, "isCancel": true, "techSize": "0", "cancel_dt": "2022-07-27T00:00:00", "totalPrice": 2300, "warehouseName": "Электросталь", "lastChangeDate": "2022-07-28T04:32:26", "discountPercent": 43, "supplierArticle": "5200119080675200119080665"}	\N	2022-07-27 15:20:27	97	1	2022-08-22 01:00:55.702142	2022-08-22 01:00:55.702142
2015	{"date": "2022-07-27T23:52:43", "nmId": 111885790, "odid": 600202425534, "srid": "dcc6bb22824b46ddbd0ec40e3d97ce3a", "brand": "Agrilife", "oblast": "Московская", "barcode": "2038421534628", "gNumber": "4210908460183957056", "sticker": "", "subject": "Масло растительное", "category": "Продукты", "incomeID": 8043602, "isCancel": false, "techSize": "0", "cancel_dt": "0001-01-01T00:00:00", "totalPrice": 1600, "warehouseName": "Коледино", "lastChangeDate": "2022-07-28T04:59:35", "discountPercent": 40, "supplierArticle": "88571217752"}	\N	2022-07-28 04:52:43	97	1	2022-08-22 01:00:55.709551	2022-08-22 01:00:55.709551
2016	{"date": "2022-07-28T08:14:57", "nmId": 111885790, "odid": 600203242766, "srid": "64d74142883c482f90b27d5f212a4c0e", "brand": "Agrilife", "oblast": "Московская", "barcode": "2038421534628", "gNumber": "3620348430354703825", "sticker": "", "subject": "Масло растительное", "category": "Продукты", "incomeID": 8043602, "isCancel": false, "techSize": "0", "cancel_dt": "0001-01-01T00:00:00", "totalPrice": 1600, "warehouseName": "Коледино", "lastChangeDate": "2022-07-28T12:01:06", "discountPercent": 40, "supplierArticle": "88571217752"}	\N	2022-07-28 13:14:57	97	1	2022-08-22 01:00:55.717162	2022-08-22 01:00:55.717162
2017	{"date": "2022-08-02T18:35:59", "nmId": 111885412, "odid": 600235894767, "srid": "a878818ea75b49cb9802ee8029606a50", "brand": "", "oblast": "Краснодарский", "barcode": "2038421434621", "gNumber": "7242426344474603929", "sticker": "", "subject": "Масло растительное", "category": "Продукты", "incomeID": 8043602, "isCancel": false, "techSize": "0", "cancel_dt": "0001-01-01T00:00:00", "totalPrice": 1380, "warehouseName": "Коледино", "lastChangeDate": "2022-08-02T22:41:42", "discountPercent": 34, "supplierArticle": "52003624003"}	\N	2022-08-02 23:35:59	97	1	2022-08-22 01:00:55.730978	2022-08-22 01:00:55.730978
2018	{"date": "2022-08-04T18:41:46", "nmId": 111054747, "odid": 600249951180, "srid": "6197b3ccfb1c42d281111bb0446fe4c6", "brand": "SITIA", "oblast": "Челябинская", "barcode": "5200119080658", "gNumber": "95415108544644604867", "sticker": "", "subject": "Масло растительное", "category": "Продукты", "incomeID": 7993537, "isCancel": false, "techSize": "0", "cancel_dt": "0001-01-01T00:00:00", "totalPrice": 2300, "warehouseName": "Электросталь", "lastChangeDate": "2022-08-05T06:54:26", "discountPercent": 40, "supplierArticle": "5200119080675200119080665"}	\N	2022-08-04 23:41:46	97	1	2022-08-22 01:00:55.742884	2022-08-22 01:00:55.742884
2019	{"date": "2022-08-08T12:20:23", "nmId": 111885412, "odid": 600272376957, "srid": "443be8b50d3745ad98e59c95ba1cbe5f", "brand": "", "oblast": "Москва", "barcode": "2038421434621", "gNumber": "94194054761919148197", "sticker": "", "subject": "Масло растительное", "category": "Продукты", "incomeID": 8043602, "isCancel": false, "techSize": "0", "cancel_dt": "0001-01-01T00:00:00", "totalPrice": 1380, "warehouseName": "Коледино", "lastChangeDate": "2022-08-08T14:31:52", "discountPercent": 34, "supplierArticle": "52003624003"}	\N	2022-08-08 17:20:23	97	1	2022-08-22 01:00:55.751461	2022-08-22 01:00:55.751461
2020	{"date": "2022-08-08T12:47:58", "nmId": 111885412, "odid": 600272561453, "srid": "dc336a991a644c9e96323756ba2048c1", "brand": "", "oblast": "Тверская", "barcode": "2038421434621", "gNumber": "3048564789316995200", "sticker": "", "subject": "Масло растительное", "category": "Продукты", "incomeID": 8043602, "isCancel": false, "techSize": "0", "cancel_dt": "0001-01-01T00:00:00", "totalPrice": 1380, "warehouseName": "Коледино", "lastChangeDate": "2022-08-08T15:23:22", "discountPercent": 34, "supplierArticle": "52003624003"}	\N	2022-08-08 17:47:58	97	1	2022-08-22 01:00:55.759125	2022-08-22 01:00:55.759125
2021	{"date": "2022-08-08T13:31:56", "nmId": 111054747, "odid": 600272858521, "srid": "7ef304296e8c4a5a8060e9b45546d78c", "brand": "SITIA", "oblast": "Москва", "barcode": "5200119080658", "gNumber": "9933062305047903110", "sticker": "", "subject": "Масло растительное", "category": "Продукты", "incomeID": 8289487, "isCancel": false, "techSize": "0", "cancel_dt": "0001-01-01T00:00:00", "totalPrice": 2300, "warehouseName": "Электросталь", "lastChangeDate": "2022-08-08T18:46:16", "discountPercent": 40, "supplierArticle": "5200119080675200119080665"}	\N	2022-08-08 18:31:56	97	1	2022-08-22 01:00:55.767354	2022-08-22 01:00:55.767354
2022	{"date": "2022-08-08T17:37:30", "nmId": 111885790, "odid": 600274533839, "srid": "73422c4db360481a926191f9a7765f38", "brand": "Agrilife", "oblast": "Московская", "barcode": "2038421534628", "gNumber": "9383199879809143208", "sticker": "", "subject": "Масло растительное", "category": "Продукты", "incomeID": 8289487, "isCancel": false, "techSize": "0", "cancel_dt": "0001-01-01T00:00:00", "totalPrice": 1600, "warehouseName": "Электросталь", "lastChangeDate": "2022-08-09T02:44:51", "discountPercent": 35, "supplierArticle": "88571217752"}	\N	2022-08-08 22:37:30	97	1	2022-08-22 01:00:55.775046	2022-08-22 01:00:55.775046
2023	{"date": "2022-08-08T17:13:35", "nmId": 111885790, "odid": 600274374720, "srid": "75e04e150913452fa30807c5a4314231", "brand": "Agrilife", "oblast": "Нижегородская", "barcode": "2038421534628", "gNumber": "94562563846274115127", "sticker": "", "subject": "Масло растительное", "category": "Продукты", "incomeID": 8289487, "isCancel": false, "techSize": "0", "cancel_dt": "0001-01-01T00:00:00", "totalPrice": 1600, "warehouseName": "Электросталь", "lastChangeDate": "2022-08-09T03:13:22", "discountPercent": 35, "supplierArticle": "88571217752"}	\N	2022-08-08 22:13:35	97	1	2022-08-22 01:00:55.783507	2022-08-22 01:00:55.783507
2024	{"date": "2022-08-09T13:34:40", "nmId": 111885790, "odid": 600279927888, "srid": "12e2ec22b131442c94df62c0e273097a", "brand": "Agrilife", "oblast": "Саратовская", "barcode": "2038421534628", "gNumber": "112326026459124396", "sticker": "", "subject": "Масло растительное", "category": "Продукты", "incomeID": 8289487, "isCancel": false, "techSize": "0", "cancel_dt": "0001-01-01T00:00:00", "totalPrice": 1600, "warehouseName": "Электросталь", "lastChangeDate": "2022-08-09T15:55:30", "discountPercent": 35, "supplierArticle": "88571217752"}	\N	2022-08-09 18:34:40	97	1	2022-08-22 01:00:55.79421	2022-08-22 01:00:55.79421
2025	{"date": "2022-08-11T07:48:41", "nmId": 111054747, "odid": 600291639103, "srid": "20efd9b0b32d43638724de470c570a27", "brand": "SITIA", "oblast": "Ханты-Мансийский Автономный округ - Югра", "barcode": "5200119080658", "gNumber": "2797689864101004028", "sticker": "", "subject": "Масло растительное", "category": "Продукты", "incomeID": 8289487, "isCancel": false, "techSize": "0", "cancel_dt": "0001-01-01T00:00:00", "totalPrice": 2300, "warehouseName": "Электросталь", "lastChangeDate": "2022-08-11T09:29:36", "discountPercent": 30, "supplierArticle": "5200119080675200119080665"}	\N	2022-08-11 12:48:41	97	1	2022-08-22 01:00:55.807682	2022-08-22 01:00:55.807682
2026	{"date": "2022-08-11T12:53:13", "nmId": 111885790, "odid": 600293700448, "srid": "23dd77e1c4a0487fb11ff8c5b7a7b64a", "brand": "Agrilife", "oblast": "Адыгея", "barcode": "2038421534628", "gNumber": "96985023859618718223", "sticker": "", "subject": "Масло растительное", "category": "Продукты", "incomeID": 8289487, "isCancel": false, "techSize": "0", "cancel_dt": "0001-01-01T00:00:00", "totalPrice": 1600, "warehouseName": "Электросталь", "lastChangeDate": "2022-08-11T17:45:32", "discountPercent": 35, "supplierArticle": "88571217752"}	\N	2022-08-11 17:53:13	97	1	2022-08-22 01:00:55.814824	2022-08-22 01:00:55.814824
2027	{"date": "2022-08-11T20:39:10", "nmId": 111885790, "odid": 600296685319, "srid": "a9c2f88cd95c4b50a0c30c20a4d1339c", "brand": "Agrilife", "oblast": "Москва", "barcode": "2038421534628", "gNumber": "3353758124037934027", "sticker": "", "subject": "Масло растительное", "category": "Продукты", "incomeID": 8289487, "isCancel": false, "techSize": "0", "cancel_dt": "0001-01-01T00:00:00", "totalPrice": 1600, "warehouseName": "Электросталь", "lastChangeDate": "2022-08-12T01:24:33", "discountPercent": 35, "supplierArticle": "88571217752"}	\N	2022-08-12 01:39:10	97	1	2022-08-22 01:00:55.822932	2022-08-22 01:00:55.822932
2028	{"date": "2022-08-12T11:35:09", "nmId": 111054747, "odid": 9000278053533, "srid": "3144bf4e77d64ecfb1a6d917c395a6e3", "brand": "SITIA", "oblast": "Курская", "barcode": "5200119080658", "gNumber": "5528031452588134248", "sticker": "", "subject": "Масло растительное", "category": "Продукты", "incomeID": 0, "isCancel": true, "techSize": "0", "cancel_dt": "2022-08-12T00:00:00", "totalPrice": 2300, "warehouseName": "Электросталь", "lastChangeDate": "2022-08-12T13:58:22", "discountPercent": 30, "supplierArticle": "5200119080675200119080665"}	\N	2022-08-12 16:35:09	97	1	2022-08-22 01:00:55.830677	2022-08-22 01:00:55.830677
2029	{"date": "2022-08-12T11:39:14", "nmId": 111054747, "odid": 600300070142, "srid": "1dc13ac3fbb349f68f1be08f02d53ac7", "brand": "SITIA", "oblast": "", "barcode": "5200119080658", "gNumber": "3209452697745985626", "sticker": "", "subject": "Масло растительное", "category": "Продукты", "incomeID": 8289487, "isCancel": false, "techSize": "0", "cancel_dt": "0001-01-01T00:00:00", "totalPrice": 2300, "warehouseName": "Электросталь", "lastChangeDate": "2022-08-12T14:07:01", "discountPercent": 30, "supplierArticle": "5200119080675200119080665"}	\N	2022-08-12 16:39:14	97	1	2022-08-22 01:00:55.838643	2022-08-22 01:00:55.838643
2030	{"date": "2022-08-12T11:35:09", "nmId": 111054747, "odid": 9000278082157, "srid": "d8dd5af17441471c9357b32dff35bb61", "brand": "SITIA", "oblast": "Курская", "barcode": "5200119080658", "gNumber": "5528031452588134248", "sticker": "", "subject": "Масло растительное", "category": "Продукты", "incomeID": 0, "isCancel": true, "techSize": "0", "cancel_dt": "2022-08-12T00:00:00", "totalPrice": 2300, "warehouseName": "Электросталь", "lastChangeDate": "2022-08-12T14:09:31", "discountPercent": 30, "supplierArticle": "5200119080675200119080665"}	\N	2022-08-12 16:35:09	97	1	2022-08-22 01:00:55.846276	2022-08-22 01:00:55.846276
2031	{"date": "2022-08-12T11:39:14", "nmId": 111054747, "odid": 600300070143, "srid": "7b461b1071334139a620621b8d57df5a", "brand": "SITIA", "oblast": "", "barcode": "5200119080658", "gNumber": "3209452697745985626", "sticker": "", "subject": "Масло растительное", "category": "Продукты", "incomeID": 8289487, "isCancel": false, "techSize": "0", "cancel_dt": "0001-01-01T00:00:00", "totalPrice": 2300, "warehouseName": "Электросталь", "lastChangeDate": "2022-08-12T17:13:37", "discountPercent": 30, "supplierArticle": "5200119080675200119080665"}	\N	2022-08-12 16:39:14	97	1	2022-08-22 01:00:55.854306	2022-08-22 01:00:55.854306
2032	{"date": "2022-08-12T16:53:38", "nmId": 111885790, "odid": 600302206714, "srid": "3813f64f3a68478dae58cbf75a1c3858", "brand": "Agrilife", "oblast": "Краснодарский", "barcode": "2038421534628", "gNumber": "5353101156418595165", "sticker": "", "subject": "Масло растительное", "category": "Продукты", "incomeID": 8289487, "isCancel": false, "techSize": "0", "cancel_dt": "0001-01-01T00:00:00", "totalPrice": 1600, "warehouseName": "Электросталь", "lastChangeDate": "2022-08-12T21:00:51", "discountPercent": 35, "supplierArticle": "88571217752"}	\N	2022-08-12 21:53:38	97	1	2022-08-22 01:00:55.862963	2022-08-22 01:00:55.862963
2033	{"date": "2022-08-12T20:59:33", "nmId": 111054747, "odid": 600303430530, "srid": "782d1be90d7b442395a9ebfaa93624fb", "brand": "SITIA", "oblast": "Владимирская", "barcode": "5200119080658", "gNumber": "6650807452502100634", "sticker": "", "subject": "Масло растительное", "category": "Продукты", "incomeID": 8289487, "isCancel": false, "techSize": "0", "cancel_dt": "0001-01-01T00:00:00", "totalPrice": 2300, "warehouseName": "Электросталь", "lastChangeDate": "2022-08-12T22:40:39", "discountPercent": 30, "supplierArticle": "5200119080675200119080665"}	\N	2022-08-13 01:59:33	97	1	2022-08-22 01:00:55.870849	2022-08-22 01:00:55.870849
2034	{"date": "2022-08-14T12:52:17", "nmId": 111054747, "odid": 600311587117, "srid": "df0d5770b9e4416cbc7fa5336a90bf0e", "brand": "SITIA", "oblast": "Москва", "barcode": "5200119080658", "gNumber": "95651630649789905794", "sticker": "", "subject": "Масло растительное", "category": "Продукты", "incomeID": 8289487, "isCancel": false, "techSize": "0", "cancel_dt": "0001-01-01T00:00:00", "totalPrice": 2300, "warehouseName": "Электросталь", "lastChangeDate": "2022-08-14T15:01:14", "discountPercent": 30, "supplierArticle": "5200119080675200119080665"}	\N	2022-08-14 17:52:17	97	1	2022-08-22 01:00:55.880919	2022-08-22 01:00:55.880919
2035	{"date": "2022-08-14T20:37:10", "nmId": 111054747, "odid": 600314100610, "srid": "ceed1f0740d442e5b22ae2fc23ce5773", "brand": "SITIA", "oblast": "Москва", "barcode": "5200119080658", "gNumber": "98168679544435765916", "sticker": "", "subject": "Масло растительное", "category": "Продукты", "incomeID": 8289487, "isCancel": false, "techSize": "0", "cancel_dt": "0001-01-01T00:00:00", "totalPrice": 2300, "warehouseName": "Электросталь", "lastChangeDate": "2022-08-14T23:20:35", "discountPercent": 30, "supplierArticle": "5200119080675200119080665"}	\N	2022-08-15 01:37:10	97	1	2022-08-22 01:00:55.888706	2022-08-22 01:00:55.888706
2036	{"date": "2022-08-15T06:25:43", "nmId": 111885790, "odid": 600315509249, "srid": "d121e88bb9c34f73a7cec666320777b3", "brand": "Agrilife", "oblast": "Башкортостан", "barcode": "2038421534628", "gNumber": "9211078837184080794", "sticker": "", "subject": "Масло растительное", "category": "Продукты", "incomeID": 8289487, "isCancel": false, "techSize": "0", "cancel_dt": "0001-01-01T00:00:00", "totalPrice": 1600, "warehouseName": "Электросталь", "lastChangeDate": "2022-08-15T09:22:13", "discountPercent": 35, "supplierArticle": "88571217752"}	\N	2022-08-15 11:25:43	97	1	2022-08-22 01:00:55.899288	2022-08-22 01:00:55.899288
2037	{"date": "2022-08-16T05:26:28", "nmId": 111885790, "odid": 153983955876, "srid": "", "brand": "Agrilife", "oblast": "Иркутская", "barcode": "2038421534628", "gNumber": "91462214747397795886", "sticker": "", "subject": "Масло растительное", "category": "Продукты", "incomeID": 8289487, "isCancel": false, "techSize": "0", "cancel_dt": "0001-01-01T00:00:00", "totalPrice": 1600, "warehouseName": "Электросталь", "lastChangeDate": "2022-08-16T14:40:52", "discountPercent": 35, "supplierArticle": "88571217752"}	\N	2022-08-16 10:26:28	97	1	2022-08-22 01:00:55.90891	2022-08-22 01:00:55.90891
2038	{"date": "2022-08-17T20:42:13", "nmId": 111885790, "odid": 9000311916559, "srid": "49b62dcd0bdb42ffaae1c6a59d843048", "brand": "Agrilife", "oblast": "Московская", "barcode": "2038421534628", "gNumber": "4971527324323735658", "sticker": "", "subject": "Масло растительное", "category": "Продукты", "incomeID": 0, "isCancel": false, "techSize": "0", "cancel_dt": "0001-01-01T00:00:00", "totalPrice": 1600, "warehouseName": "Электросталь", "lastChangeDate": "2022-08-17T22:51:10", "discountPercent": 35, "supplierArticle": "88571217752"}	\N	2022-08-18 01:42:13	97	1	2022-08-22 01:00:55.918594	2022-08-22 01:00:55.918594
2039	{"date": "2022-08-17T20:38:58", "nmId": 111054747, "odid": 600332866615, "srid": "2433320fb3b6477780bc9270a95b984e", "brand": "SITIA", "oblast": "Московская", "barcode": "5200119080658", "gNumber": "8840177092719217170", "sticker": "", "subject": "Масло растительное", "category": "Продукты", "incomeID": 8289487, "isCancel": false, "techSize": "0", "cancel_dt": "0001-01-01T00:00:00", "totalPrice": 2300, "warehouseName": "Электросталь", "lastChangeDate": "2022-08-18T03:53:01", "discountPercent": 30, "supplierArticle": "5200119080675200119080665"}	\N	2022-08-18 01:38:58	97	1	2022-08-22 01:00:55.925843	2022-08-22 01:00:55.925843
2118	{"date": "2022-08-22T10:04:20", "nmId": 111054747, "odid": 600357547552, "srid": "2ddcfec9859b4f23846534ddbe7f92d4", "brand": "SITIA", "price": 1954, "oblast": "Московская", "barcode": "5200119080658", "gNumber": "92131128037094383875", "sticker": "", "subject": "Масло растительное", "category": "Продукты", "incomeID": 8294656, "isCancel": false, "techSize": "0", "cancel_dt": "0001-01-01T00:00:00", "totalPrice": 2300, "warehouseName": "Коледино", "lastChangeDate": "2022-08-22T13:29:52", "discountPercent": 30, "supplierArticle": "5200119080675200119080665"}	\N	2022-08-22 15:04:20	288	1	2022-08-22 18:29:31.831266	2022-08-22 18:29:31.832953
2117	{"date": "2022-08-19T19:08:12", "nmId": 111885790, "odid": 9000323513726, "srid": "4ccd24f3cd964a4e9fd4220113eb9e6b", "brand": "Agrilife", "price": 1319, "oblast": "Москва", "barcode": "2038421534628", "gNumber": "98873334033098804208", "sticker": "", "subject": "Масло растительное", "category": "Продукты", "incomeID": 8289487, "isCancel": false, "techSize": "0", "cancel_dt": "0001-01-01T00:00:00", "totalPrice": 1600, "warehouseName": "Электросталь", "lastChangeDate": "2022-08-20T01:20:37", "discountPercent": 35, "supplierArticle": "88571217752"}	\N	2022-08-20 00:08:12	288	1	2022-08-22 18:29:31.809914	2022-08-22 18:29:31.811622
2135	{"date": "2022-07-17T22:42:25", "nmId": 111345626, "odid": 600140138040, "srid": "", "brand": "KOKO", "price": 1063, "oblast": "Московская", "barcode": "2037838797626", "gNumber": "8509170295159338864", "sticker": "", "subject": "Масло растительное", "category": "Продукты", "incomeID": 8090310, "isCancel": false, "techSize": "0", "cancel_dt": "0001-01-01T00:00:00", "totalPrice": 1330, "warehouseName": "Коледино", "lastChangeDate": "2022-07-18T03:34:51", "discountPercent": 40, "supplierArticle": "5205657000631"}	\N	2022-07-17 19:42:25	344	1	2022-08-23 12:59:31.050386	2022-08-23 12:59:31.051829
2134	{"date": "2022-07-17T21:52:52", "nmId": 111345626, "odid": 600139897664, "srid": "", "brand": "KOKO", "price": 1063, "oblast": "Москва", "barcode": "2037838797626", "gNumber": "6568538446932443158", "sticker": "", "subject": "Масло растительное", "category": "Продукты", "incomeID": 8090310, "isCancel": false, "techSize": "0", "cancel_dt": "0001-01-01T00:00:00", "totalPrice": 1330, "warehouseName": "Коледино", "lastChangeDate": "2022-07-18T03:34:51", "discountPercent": 40, "supplierArticle": "5205657000631"}	\N	2022-07-17 18:52:52	344	1	2022-08-23 12:59:31.042261	2022-08-23 12:59:31.043618
2136	{"date": "2022-07-19T08:36:28", "nmId": 111345604, "odid": 600146999500, "srid": "", "brand": "SITIA", "price": 4965, "oblast": "Свердловская", "barcode": "2037838726626", "gNumber": "93561166377180680035", "sticker": "", "subject": "Масло растительное", "category": "Продукты", "incomeID": 8043602, "isCancel": false, "techSize": "0", "cancel_dt": "0001-01-01T00:00:00", "totalPrice": 6500, "warehouseName": "Коледино", "lastChangeDate": "2022-07-19T15:53:06", "discountPercent": 47, "supplierArticle": "5200102953203"}	\N	2022-07-19 05:36:28	344	1	2022-08-23 12:59:31.058592	2022-08-23 12:59:31.060023
2137	{"date": "2022-07-20T07:16:35", "nmId": 111345604, "odid": 600152933136, "srid": "", "brand": "SITIA", "price": 4965, "oblast": "Москва", "barcode": "2037838726626", "gNumber": "5320712506374638688", "sticker": "", "subject": "Масло растительное", "category": "Продукты", "incomeID": 8043602, "isCancel": false, "techSize": "0", "cancel_dt": "0001-01-01T00:00:00", "totalPrice": 6500, "warehouseName": "Коледино", "lastChangeDate": "2022-07-20T13:38:30", "discountPercent": 47, "supplierArticle": "5200102953203"}	\N	2022-07-20 04:16:35	344	1	2022-08-23 12:59:31.066738	2022-08-23 12:59:31.068062
2138	{"date": "2022-07-20T19:25:28", "nmId": 111345604, "odid": 600157533008, "srid": "", "brand": "SITIA", "price": 4965, "oblast": "Москва", "barcode": "2037838726626", "gNumber": "6263414912658138938", "sticker": "", "subject": "Масло растительное", "category": "Продукты", "incomeID": 8043602, "isCancel": false, "techSize": "0", "cancel_dt": "0001-01-01T00:00:00", "totalPrice": 6500, "warehouseName": "Коледино", "lastChangeDate": "2022-07-21T01:22:11", "discountPercent": 47, "supplierArticle": "5200102953203"}	\N	2022-07-20 16:25:28	344	1	2022-08-23 12:59:31.074798	2022-08-23 12:59:31.076142
2129	{"date": "2022-08-22T10:04:20", "nmId": 111054747, "odid": 600357547554, "srid": "ad87054ce94f4dccb875d5e635393da9", "brand": "SITIA", "price": 1954, "oblast": "Московская", "barcode": "5200119080658", "gNumber": "92131128037094383875", "sticker": "", "subject": "Масло растительное", "category": "Продукты", "incomeID": 8294656, "isCancel": false, "techSize": "0", "cancel_dt": "0001-01-01T00:00:00", "totalPrice": 2300, "warehouseName": "Коледино", "lastChangeDate": "2022-08-22T13:36:47", "discountPercent": 30, "supplierArticle": "5200119080675200119080665"}	\N	2022-08-22 15:04:20	306	1	2022-08-22 19:21:42.561972	2022-08-22 19:21:42.563536
2105	{"date": "2022-08-19T21:54:49", "nmId": 111054747, "odid": 9000324411091, "srid": "f913ecad86ca4cbf8adf33629ac10b6e", "brand": "SITIA", "price": 1954, "oblast": "Владимирская", "barcode": "5200119080658", "gNumber": "6092160748388900669", "sticker": "", "subject": "Масло растительное", "category": "Продукты", "incomeID": 0, "isCancel": false, "techSize": "0", "cancel_dt": "0001-01-01T00:00:00", "totalPrice": 2300, "warehouseName": "Электросталь", "lastChangeDate": "2022-08-20T00:22:44", "discountPercent": 30, "supplierArticle": "5200119080675200119080665"}	\N	2022-08-20 02:54:49	273	1	2022-08-22 18:09:40.09632	2022-08-22 18:09:40.09843
2127	{"date": "2022-08-22T10:04:20", "nmId": 111054747, "odid": 600357547553, "srid": "8c74fa41ad2a41b59ca5070145fbc373", "brand": "SITIA", "price": 1954, "oblast": "Московская", "barcode": "5200119080658", "gNumber": "92131128037094383875", "sticker": "", "subject": "Масло растительное", "category": "Продукты", "incomeID": 8294656, "isCancel": false, "techSize": "0", "cancel_dt": "0001-01-01T00:00:00", "totalPrice": 2300, "warehouseName": "Коледино", "lastChangeDate": "2022-08-22T13:32:50", "discountPercent": 30, "supplierArticle": "5200119080675200119080665"}	\N	2022-08-22 15:04:20	306	1	2022-08-22 19:21:42.537102	2022-08-22 19:21:42.538894
2128	{"date": "2022-08-22T10:54:07", "nmId": 111885412, "odid": 600357879301, "srid": "45d4099fe3df4e1e8b205b977bcc4c8d", "brand": "", "price": 1145, "oblast": "Краснодарский", "barcode": "2038421434621", "gNumber": "94510163255475532138", "sticker": "", "subject": "Масло растительное", "category": "Продукты", "incomeID": 8043602, "isCancel": false, "techSize": "0", "cancel_dt": "0001-01-01T00:00:00", "totalPrice": 1380, "warehouseName": "Коледино", "lastChangeDate": "2022-08-22T13:34:43", "discountPercent": 34, "supplierArticle": "52003624003"}	\N	2022-08-22 15:54:07	306	1	2022-08-22 19:21:42.552274	2022-08-22 19:21:42.554267
2130	{"date": "2022-07-16T13:17:33", "nmId": 111345604, "odid": 600132680227, "srid": "", "brand": "SITIA", "price": 4965, "oblast": "МСК Север", "barcode": "2037838726626", "gNumber": "95849983232279950061", "sticker": "", "subject": "Масло растительное", "category": "Продукты", "incomeID": 8043602, "isCancel": false, "techSize": "0", "cancel_dt": "0001-01-01T00:00:00", "totalPrice": 6500, "warehouseName": "Коледино", "lastChangeDate": "2022-07-16T16:12:34", "discountPercent": 47, "supplierArticle": "5200102953203"}	\N	2022-07-16 10:17:33	344	1	2022-08-23 12:59:30.995118	2022-08-23 12:59:30.997661
2131	{"date": "2022-07-17T20:22:25", "nmId": 111345604, "odid": 600139460403, "srid": "", "brand": "SITIA", "price": 4965, "oblast": "Москва", "barcode": "2037838726626", "gNumber": "483406354084924592", "sticker": "", "subject": "Масло растительное", "category": "Продукты", "incomeID": 8043602, "isCancel": false, "techSize": "0", "cancel_dt": "0001-01-01T00:00:00", "totalPrice": 6500, "warehouseName": "Коледино", "lastChangeDate": "2022-07-17T23:27:48", "discountPercent": 47, "supplierArticle": "5200102953203"}	\N	2022-07-17 17:22:25	344	1	2022-08-23 12:59:31.016107	2022-08-23 12:59:31.017765
2103	{"date": "2022-08-18T08:40:38", "nmId": 111885790, "odid": 600334666424, "srid": "18b3a7ad25964179aa5cffd81d62372a", "brand": "Agrilife", "price": 1319, "oblast": "Москва", "barcode": "2038421534628", "gNumber": "3481571998459535986", "sticker": "", "subject": "Масло растительное", "category": "Продукты", "incomeID": 8289487, "isCancel": false, "techSize": "0", "cancel_dt": "0001-01-01T00:00:00", "totalPrice": 1600, "warehouseName": "Электросталь", "lastChangeDate": "2022-08-18T11:29:29", "discountPercent": 35, "supplierArticle": "88571217752"}	\N	2022-08-18 13:40:38	273	1	2022-08-22 18:09:40.06491	2022-08-22 18:09:40.067122
2104	{"date": "2022-08-19T16:16:50", "nmId": 111885412, "odid": 600343236186, "srid": "1be7a2baf3254c65a78f967ec3b7b862", "brand": "", "price": 1145, "oblast": "Карачаево-Черкесская", "barcode": "2038421434621", "gNumber": "94803013153830788782", "sticker": "", "subject": "Масло растительное", "category": "Продукты", "incomeID": 8043602, "isCancel": false, "techSize": "0", "cancel_dt": "0001-01-01T00:00:00", "totalPrice": 1380, "warehouseName": "Коледино", "lastChangeDate": "2022-08-19T19:37:11", "discountPercent": 34, "supplierArticle": "52003624003"}	\N	2022-08-19 21:16:50	273	1	2022-08-22 18:09:40.084054	2022-08-22 18:09:40.086066
2132	{"date": "2022-07-17T21:24:38", "nmId": 111345604, "odid": 600139759628, "srid": "", "brand": "SITIA", "price": 4965, "oblast": "Москва", "barcode": "2037838726626", "gNumber": "7308572348206459419", "sticker": "", "subject": "Масло растительное", "category": "Продукты", "incomeID": 8043602, "isCancel": false, "techSize": "0", "cancel_dt": "0001-01-01T00:00:00", "totalPrice": 6500, "warehouseName": "Коледино", "lastChangeDate": "2022-07-18T03:34:51", "discountPercent": 47, "supplierArticle": "5200102953203"}	\N	2022-07-17 18:24:38	344	1	2022-08-23 12:59:31.024959	2022-08-23 12:59:31.026559
2133	{"date": "2022-07-17T21:52:52", "nmId": 111345626, "odid": 600139897663, "srid": "", "brand": "KOKO", "price": 1063, "oblast": "Москва", "barcode": "2037838797626", "gNumber": "6568538446932443158", "sticker": "", "subject": "Масло растительное", "category": "Продукты", "incomeID": 8090310, "isCancel": false, "techSize": "0", "cancel_dt": "0001-01-01T00:00:00", "totalPrice": 1330, "warehouseName": "Коледино", "lastChangeDate": "2022-07-18T03:34:51", "discountPercent": 40, "supplierArticle": "5205657000631"}	\N	2022-07-17 18:52:52	344	1	2022-08-23 12:59:31.03368	2022-08-23 12:59:31.035109
2139	{"date": "2022-07-21T14:20:38", "nmId": 111345604, "odid": 600162401427, "srid": "", "brand": "SITIA", "price": 4965, "oblast": "Саратовская", "barcode": "2037838726626", "gNumber": "3703647424560264279", "sticker": "", "subject": "Масло растительное", "category": "Продукты", "incomeID": 8043602, "isCancel": false, "techSize": "0", "cancel_dt": "0001-01-01T00:00:00", "totalPrice": 6500, "warehouseName": "Коледино", "lastChangeDate": "2022-07-21T19:00:53", "discountPercent": 47, "supplierArticle": "5200102953203"}	\N	2022-07-21 11:20:38	344	1	2022-08-23 12:59:31.08389	2022-08-23 12:59:31.085236
2140	{"date": "2022-07-22T11:02:43", "nmId": 111345626, "odid": 153979561610, "srid": "", "brand": "KOKO", "price": 798, "oblast": "Московская", "barcode": "2037838797626", "gNumber": "49649777041137539", "sticker": "", "subject": "Масло растительное", "category": "Продукты", "incomeID": 8090310, "isCancel": false, "techSize": "0", "cancel_dt": "0001-01-01T00:00:00", "totalPrice": 798, "warehouseName": "Коледино", "lastChangeDate": "2022-07-22T15:00:23", "discountPercent": 0, "supplierArticle": "5205657000631"}	\N	2022-07-22 08:02:43	344	1	2022-08-23 12:59:31.092104	2022-08-23 12:59:31.093555
2141	{"date": "2022-07-22T13:42:34", "nmId": 111345626, "odid": 600168843733, "srid": "", "brand": "KOKO", "price": 1063, "oblast": "Калужская", "barcode": "2037838797626", "gNumber": "91907794538854392675", "sticker": "", "subject": "Масло растительное", "category": "Продукты", "incomeID": 8090310, "isCancel": false, "techSize": "0", "cancel_dt": "0001-01-01T00:00:00", "totalPrice": 1330, "warehouseName": "Коледино", "lastChangeDate": "2022-07-22T16:40:36", "discountPercent": 40, "supplierArticle": "5205657000631"}	\N	2022-07-22 10:42:34	344	1	2022-08-23 12:59:31.100202	2022-08-23 12:59:31.101607
2142	{"date": "2022-07-22T13:42:34", "nmId": 111345626, "odid": 600168843737, "srid": "", "brand": "KOKO", "price": 1063, "oblast": "Калужская", "barcode": "2037838797626", "gNumber": "91907794538854392675", "sticker": "", "subject": "Масло растительное", "category": "Продукты", "incomeID": 8090310, "isCancel": false, "techSize": "0", "cancel_dt": "0001-01-01T00:00:00", "totalPrice": 1330, "warehouseName": "Коледино", "lastChangeDate": "2022-07-22T17:00:53", "discountPercent": 40, "supplierArticle": "5205657000631"}	\N	2022-07-22 10:42:34	344	1	2022-08-23 12:59:31.108333	2022-08-23 12:59:31.109665
2143	{"date": "2022-07-22T13:42:34", "nmId": 111345626, "odid": 600168843732, "srid": "", "brand": "KOKO", "price": 1063, "oblast": "Калужская", "barcode": "2037838797626", "gNumber": "91907794538854392675", "sticker": "", "subject": "Масло растительное", "category": "Продукты", "incomeID": 8090310, "isCancel": false, "techSize": "0", "cancel_dt": "0001-01-01T00:00:00", "totalPrice": 1330, "warehouseName": "Коледино", "lastChangeDate": "2022-07-22T17:00:53", "discountPercent": 40, "supplierArticle": "5205657000631"}	\N	2022-07-22 10:42:34	344	1	2022-08-23 12:59:31.116571	2022-08-23 12:59:31.118054
2144	{"date": "2022-07-22T13:42:34", "nmId": 111345626, "odid": 600168843731, "srid": "", "brand": "KOKO", "price": 1063, "oblast": "Калужская", "barcode": "2037838797626", "gNumber": "91907794538854392675", "sticker": "", "subject": "Масло растительное", "category": "Продукты", "incomeID": 8090310, "isCancel": false, "techSize": "0", "cancel_dt": "0001-01-01T00:00:00", "totalPrice": 1330, "warehouseName": "Коледино", "lastChangeDate": "2022-07-22T17:20:31", "discountPercent": 40, "supplierArticle": "5205657000631"}	\N	2022-07-22 10:42:34	344	1	2022-08-23 12:59:31.124881	2022-08-23 12:59:31.126418
2145	{"date": "2022-07-25T14:57:18", "nmId": 111345626, "odid": 600187156771, "srid": "05784bd001774ae09e42c1841cdb779a", "brand": "KOKO", "price": 1063, "oblast": "Москва", "barcode": "2037838797626", "gNumber": "7004640160762623242", "sticker": "", "subject": "Масло растительное", "category": "Продукты", "incomeID": 8090310, "isCancel": false, "techSize": "0", "cancel_dt": "0001-01-01T00:00:00", "totalPrice": 1330, "warehouseName": "Коледино", "lastChangeDate": "2022-07-25T18:41:46", "discountPercent": 40, "supplierArticle": "5205657000631"}	\N	2022-07-25 11:57:18	344	1	2022-08-23 12:59:31.134952	2022-08-23 12:59:31.136476
2146	{"date": "2022-07-26T13:13:11", "nmId": 111345626, "odid": 600192795074, "srid": "e914598bfa564f05a66b2e032c7dc2b3", "brand": "KOKO", "price": 1063, "oblast": "Ханты-Мансийский Автономный округ - Югра", "barcode": "2037838797626", "gNumber": "93297343375170060476", "sticker": "", "subject": "Масло растительное", "category": "Продукты", "incomeID": 8090310, "isCancel": false, "techSize": "0", "cancel_dt": "0001-01-01T00:00:00", "totalPrice": 1330, "warehouseName": "Коледино", "lastChangeDate": "2022-07-26T16:23:50", "discountPercent": 40, "supplierArticle": "5205657000631"}	\N	2022-07-26 10:13:11	344	1	2022-08-23 12:59:31.144102	2022-08-23 12:59:31.145617
2147	{"date": "2022-08-02T07:05:07", "nmId": 111345626, "odid": 600231740394, "srid": "de4b4a77a24b454d9bd86c25bcc4d48d", "brand": "KOKO", "price": 1083, "oblast": "Новосибирская", "barcode": "2037838797626", "gNumber": "94620453239065245749", "sticker": "", "subject": "Масло растительное", "category": "Продукты", "incomeID": 8090310, "isCancel": false, "techSize": "0", "cancel_dt": "0001-01-01T00:00:00", "totalPrice": 1330, "warehouseName": "Коледино", "lastChangeDate": "2022-08-02T09:54:48", "discountPercent": 37, "supplierArticle": "5205657000631"}	\N	2022-08-02 04:05:07	344	1	2022-08-23 12:59:31.155591	2022-08-23 12:59:31.157074
2148	{"date": "2022-08-04T07:00:42", "nmId": 111345626, "odid": 600245432512, "srid": "f8b1a00bad4f4802bd32987a9a4ae79b", "brand": "KOKO", "price": 1083, "oblast": "Московская", "barcode": "2037838797626", "gNumber": "278600335167961810", "sticker": "", "subject": "Масло растительное", "category": "Продукты", "incomeID": 7993537, "isCancel": false, "techSize": "0", "cancel_dt": "0001-01-01T00:00:00", "totalPrice": 1330, "warehouseName": "Электросталь", "lastChangeDate": "2022-08-04T13:20:37", "discountPercent": 37, "supplierArticle": "5205657000631"}	\N	2022-08-04 04:00:42	344	1	2022-08-23 12:59:31.163819	2022-08-23 12:59:31.165157
2149	{"date": "2022-08-04T17:20:14", "nmId": 111345626, "odid": 600249459365, "srid": "39ddfe96b040466db72a461740464efe", "brand": "KOKO", "price": 1083, "oblast": "Крым", "barcode": "2037838797626", "gNumber": "7489734020086145775", "sticker": "", "subject": "Масло растительное", "category": "Продукты", "incomeID": 8090310, "isCancel": false, "techSize": "0", "cancel_dt": "0001-01-01T00:00:00", "totalPrice": 1330, "warehouseName": "Коледино", "lastChangeDate": "2022-08-04T21:21:14", "discountPercent": 37, "supplierArticle": "5205657000631"}	\N	2022-08-04 14:20:14	344	1	2022-08-23 12:59:31.174642	2022-08-23 12:59:31.176095
2150	{"date": "2022-08-06T17:41:21", "nmId": 111345626, "odid": 600262116849, "srid": "20e643241d9649d5a018ffa35e079eca", "brand": "KOKO", "price": 1083, "oblast": "Москва", "barcode": "2037838797626", "gNumber": "93778899351181461381", "sticker": "", "subject": "Масло растительное", "category": "Продукты", "incomeID": 8090310, "isCancel": false, "techSize": "0", "cancel_dt": "0001-01-01T00:00:00", "totalPrice": 1330, "warehouseName": "Коледино", "lastChangeDate": "2022-08-06T20:40:52", "discountPercent": 37, "supplierArticle": "5205657000631"}	\N	2022-08-06 14:41:21	344	1	2022-08-23 12:59:31.18291	2022-08-23 12:59:31.184466
2151	{"date": "2022-08-10T16:59:56", "nmId": 111345626, "odid": 600288339958, "srid": "83adcac86f2e443fa1334ed042c1da5f", "brand": "KOKO", "price": 1110, "oblast": "Крым", "barcode": "2037838797626", "gNumber": "2924675626499364335", "sticker": "", "subject": "Масло растительное", "category": "Продукты", "incomeID": 8090310, "isCancel": false, "techSize": "0", "cancel_dt": "0001-01-01T00:00:00", "totalPrice": 1330, "warehouseName": "Коледино", "lastChangeDate": "2022-08-10T20:15:15", "discountPercent": 33, "supplierArticle": "5205657000631"}	\N	2022-08-10 13:59:56	344	1	2022-08-23 12:59:31.194754	2022-08-23 12:59:31.19624
2152	{"date": "2022-08-10T20:21:33", "nmId": 111345626, "odid": 9000267323357, "srid": "67bd3bcf079e4590a5974c42f4a4a1ca", "brand": "KOKO", "price": 1110, "oblast": "Крым", "barcode": "2037838797626", "gNumber": "1465555932564241733", "sticker": "", "subject": "Масло растительное", "category": "Продукты", "incomeID": 0, "isCancel": true, "techSize": "0", "cancel_dt": "2022-08-15T00:00:00", "totalPrice": 1330, "warehouseName": "Электросталь", "lastChangeDate": "2022-08-15T20:00:21", "discountPercent": 33, "supplierArticle": "5205657000631"}	\N	2022-08-10 17:21:33	344	1	2022-08-23 12:59:31.212908	2022-08-23 12:59:31.214617
2153	{"date": "2022-08-16T23:54:25", "nmId": 111345626, "odid": 9000306757625, "srid": "053a4b3f34974e55b1b52747c7129abd", "brand": "KOKO", "price": 1110, "oblast": "Краснодарский", "barcode": "2037838797626", "gNumber": "1374724776276895994", "sticker": "", "subject": "Масло растительное", "category": "Продукты", "incomeID": 0, "isCancel": false, "techSize": "0", "cancel_dt": "0001-01-01T00:00:00", "totalPrice": 1330, "warehouseName": "Электросталь", "lastChangeDate": "2022-08-17T05:54:26", "discountPercent": 33, "supplierArticle": "5205657000631"}	\N	2022-08-16 20:54:25	344	1	2022-08-23 12:59:31.222981	2022-08-23 12:59:31.224709
2154	{"date": "2022-08-18T09:25:22", "nmId": 111345626, "odid": 600334925776, "srid": "10ee033c1b734a92a3d6d10f888692fd", "brand": "KOKO", "price": 1110, "oblast": "Нижегородская", "barcode": "2037838797626", "gNumber": "2269739038842913608", "sticker": "", "subject": "Масло растительное", "category": "Продукты", "incomeID": 7993537, "isCancel": false, "techSize": "0", "cancel_dt": "0001-01-01T00:00:00", "totalPrice": 1330, "warehouseName": "Электросталь", "lastChangeDate": "2022-08-18T12:40:47", "discountPercent": 33, "supplierArticle": "5205657000631"}	\N	2022-08-18 06:25:22	344	1	2022-08-23 12:59:31.232581	2022-08-23 12:59:31.234247
2155	{"date": "2022-08-18T10:34:19", "nmId": 111345626, "odid": 600335362125, "srid": "7ca0b8958b8648eb8004346a08e26807", "brand": "KOKO", "price": 1110, "oblast": "Вологодская", "barcode": "2037838797626", "gNumber": "2908828514460181720", "sticker": "", "subject": "Масло растительное", "category": "Продукты", "incomeID": 7993537, "isCancel": false, "techSize": "0", "cancel_dt": "0001-01-01T00:00:00", "totalPrice": 1330, "warehouseName": "Электросталь", "lastChangeDate": "2022-08-18T13:32:05", "discountPercent": 33, "supplierArticle": "5205657000631"}	\N	2022-08-18 07:34:19	344	1	2022-08-23 12:59:31.241742	2022-08-23 12:59:31.243218
2156	{"date": "2022-08-18T11:54:09", "nmId": 111345626, "odid": 600335856219, "srid": "f94cf23ef296427994fc2b84115e260f", "brand": "KOKO", "price": 1110, "oblast": "Тверская", "barcode": "2037838797626", "gNumber": "92928801676206547", "sticker": "", "subject": "Масло растительное", "category": "Продукты", "incomeID": 7993537, "isCancel": false, "techSize": "0", "cancel_dt": "0001-01-01T00:00:00", "totalPrice": 1330, "warehouseName": "Электросталь", "lastChangeDate": "2022-08-18T15:41:15", "discountPercent": 33, "supplierArticle": "5205657000631"}	\N	2022-08-18 08:54:09	344	1	2022-08-23 12:59:31.249854	2022-08-23 12:59:31.251355
2157	{"date": "2022-08-19T17:28:58", "nmId": 111345604, "odid": 600343634798, "srid": "60f97ce7ce5545b89c5f2e113acd48a6", "brand": "SITIA", "price": 5521, "oblast": "Московская", "barcode": "2037838726626", "gNumber": "97581701524076279607", "sticker": "", "subject": "Масло растительное", "category": "Продукты", "incomeID": 8294656, "isCancel": false, "techSize": "0", "cancel_dt": "0001-01-01T00:00:00", "totalPrice": 6500, "warehouseName": "Коледино", "lastChangeDate": "2022-08-19T20:40:49", "discountPercent": 30, "supplierArticle": "5200102953203"}	\N	2022-08-19 14:28:58	344	1	2022-08-23 12:59:31.258698	2022-08-23 12:59:31.260192
2158	{"date": "2022-08-22T10:03:27", "nmId": 111345604, "odid": 600357541082, "srid": "9d5c18675ffb43128e6042ee5b82b3c9", "brand": "SITIA", "price": 5521, "oblast": "Московская", "barcode": "2037838726626", "gNumber": "95523389745328892880", "sticker": "", "subject": "Масло растительное", "category": "Продукты", "incomeID": 8294656, "isCancel": false, "techSize": "0", "cancel_dt": "0001-01-01T00:00:00", "totalPrice": 6500, "warehouseName": "Коледино", "lastChangeDate": "2022-08-22T13:32:23", "discountPercent": 30, "supplierArticle": "5200102953203"}	\N	2022-08-22 07:03:27	344	1	2022-08-23 12:59:31.266905	2022-08-23 12:59:31.268212
2159	{"date": "2022-08-22T10:03:27", "nmId": 111345604, "odid": 600357541083, "srid": "c46be4bd7a924eb6af054433c54321c2", "brand": "SITIA", "price": 5521, "oblast": "Московская", "barcode": "2037838726626", "gNumber": "95523389745328892880", "sticker": "", "subject": "Масло растительное", "category": "Продукты", "incomeID": 8294656, "isCancel": false, "techSize": "0", "cancel_dt": "0001-01-01T00:00:00", "totalPrice": 6500, "warehouseName": "Коледино", "lastChangeDate": "2022-08-22T13:34:09", "discountPercent": 30, "supplierArticle": "5200102953203"}	\N	2022-08-22 07:03:27	344	1	2022-08-23 12:59:31.274986	2022-08-23 12:59:31.276279
2160	{"date": "2022-07-22T14:01:23", "nmId": 110119921, "odid": 204231475522, "srid": "", "brand": "SITIA", "price": 1080, "oblast": "Московская", "barcode": "2036002208623", "gNumber": "97902835082044060927", "sticker": "", "subject": "Масло растительное", "category": "Продукты", "incomeID": 8090310, "isCancel": false, "techSize": "0", "cancel_dt": "0001-01-01T00:00:00", "totalPrice": 1080, "warehouseName": "Коледино", "lastChangeDate": "2022-07-22T19:20:47", "discountPercent": 0, "supplierArticle": "520011908066981764983278947982"}	\N	2022-07-22 11:01:23	373	1	2022-08-23 19:18:00.071556	2022-08-23 19:18:00.073732
2161	{"date": "2022-07-22T13:40:05", "nmId": 110119921, "odid": 153979614589, "srid": "", "brand": "SITIA", "price": 1080, "oblast": "Московская", "barcode": "2036002208623", "gNumber": "94380507124613008081", "sticker": "", "subject": "Масло растительное", "category": "Продукты", "incomeID": 8090310, "isCancel": false, "techSize": "0", "cancel_dt": "0001-01-01T00:00:00", "totalPrice": 1080, "warehouseName": "Коледино", "lastChangeDate": "2022-07-22T20:20:39", "discountPercent": 0, "supplierArticle": "520011908066981764983278947982"}	\N	2022-07-22 10:40:05	373	1	2022-08-23 19:18:00.096309	2022-08-23 19:18:00.09793
2162	{"date": "2022-07-24T22:40:23", "nmId": 110119921, "odid": 600183635553, "srid": "10e97b9881aa4394b2751754de9a29c6", "brand": "SITIA", "price": 1375, "oblast": "Москва", "barcode": "2036002208623", "gNumber": "3842832038737903445", "sticker": "", "subject": "Масло растительное", "category": "Продукты", "incomeID": 8090310, "isCancel": false, "techSize": "0", "cancel_dt": "0001-01-01T00:00:00", "totalPrice": 1800, "warehouseName": "Коледино", "lastChangeDate": "2022-07-25T04:05:17", "discountPercent": 47, "supplierArticle": "520011908066981764983278947982"}	\N	2022-07-24 19:40:23	373	1	2022-08-23 19:18:00.105488	2022-08-23 19:18:00.107197
2163	{"date": "2022-07-25T22:02:30", "nmId": 110119921, "odid": 600189614514, "srid": "5824bcf54bf84e7cba270dee367830ab", "brand": "SITIA", "price": 1375, "oblast": "Московская", "barcode": "2036002208623", "gNumber": "98230780198938997901", "sticker": "", "subject": "Масло растительное", "category": "Продукты", "incomeID": 8090310, "isCancel": false, "techSize": "0", "cancel_dt": "0001-01-01T00:00:00", "totalPrice": 1800, "warehouseName": "Коледино", "lastChangeDate": "2022-07-26T00:20:36", "discountPercent": 47, "supplierArticle": "520011908066981764983278947982"}	\N	2022-07-25 19:02:30	373	1	2022-08-23 19:18:00.114983	2022-08-23 19:18:00.116578
2164	{"date": "2022-07-26T20:28:22", "nmId": 110119921, "odid": 600195262454, "srid": "7a2805a0a56848699346a9d9e5bae911", "brand": "SITIA", "price": 1375, "oblast": "Москва", "barcode": "2036002208623", "gNumber": "97796355306240506537", "sticker": "", "subject": "Масло растительное", "category": "Продукты", "incomeID": 8090310, "isCancel": false, "techSize": "0", "cancel_dt": "0001-01-01T00:00:00", "totalPrice": 1800, "warehouseName": "Коледино", "lastChangeDate": "2022-07-26T22:21:08", "discountPercent": 47, "supplierArticle": "520011908066981764983278947982"}	\N	2022-07-26 17:28:22	373	1	2022-08-23 19:18:00.124296	2022-08-23 19:18:00.125778
2165	{"date": "2022-07-29T14:05:05", "nmId": 110119921, "odid": 600211295040, "srid": "054c3565d23c4eb6b561652c2881ed13", "brand": "SITIA", "price": 1375, "oblast": "Свердловская", "barcode": "2036002208623", "gNumber": "98213108167273721494", "sticker": "", "subject": "Масло растительное", "category": "Продукты", "incomeID": 8090310, "isCancel": false, "techSize": "0", "cancel_dt": "0001-01-01T00:00:00", "totalPrice": 1800, "warehouseName": "Коледино", "lastChangeDate": "2022-07-29T19:02:00", "discountPercent": 47, "supplierArticle": "520011908066981764983278947982"}	\N	2022-07-29 11:05:05	373	1	2022-08-23 19:18:00.133689	2022-08-23 19:18:00.135156
2166	{"date": "2022-07-29T13:27:47", "nmId": 110119921, "odid": 600211069297, "srid": "041ea3bf4d0047f98da2dfb352a32dbe", "brand": "SITIA", "price": 1375, "oblast": "Москва", "barcode": "2036002208623", "gNumber": "97131480165928351171", "sticker": "", "subject": "Масло растительное", "category": "Продукты", "incomeID": 8090310, "isCancel": false, "techSize": "0", "cancel_dt": "0001-01-01T00:00:00", "totalPrice": 1800, "warehouseName": "Коледино", "lastChangeDate": "2022-07-30T04:37:16", "discountPercent": 47, "supplierArticle": "520011908066981764983278947982"}	\N	2022-07-29 10:27:47	373	1	2022-08-23 19:18:00.142644	2022-08-23 19:18:00.144086
2167	{"date": "2022-07-29T14:05:58", "nmId": 110119921, "odid": 600211300189, "srid": "898b77b855644636a6b14e3db550098b", "brand": "SITIA", "price": 1375, "oblast": "Свердловская", "barcode": "2036002208623", "gNumber": "94625457262715086704", "sticker": "", "subject": "Масло растительное", "category": "Продукты", "incomeID": 8090310, "isCancel": false, "techSize": "0", "cancel_dt": "0001-01-01T00:00:00", "totalPrice": 1800, "warehouseName": "Коледино", "lastChangeDate": "2022-07-30T04:37:16", "discountPercent": 47, "supplierArticle": "520011908066981764983278947982"}	\N	2022-07-29 11:05:58	373	1	2022-08-23 19:18:00.151375	2022-08-23 19:18:00.153077
2168	{"date": "2022-07-30T15:00:58", "nmId": 110119921, "odid": 600217011310, "srid": "348530fcbe1047179cf3478c319aca61", "brand": "SITIA", "price": 1375, "oblast": "МСК Север", "barcode": "2036002208623", "gNumber": "2521380273178926992", "sticker": "", "subject": "Масло растительное", "category": "Продукты", "incomeID": 8090310, "isCancel": false, "techSize": "0", "cancel_dt": "0001-01-01T00:00:00", "totalPrice": 1800, "warehouseName": "Коледино", "lastChangeDate": "2022-07-30T19:20:54", "discountPercent": 47, "supplierArticle": "520011908066981764983278947982"}	\N	2022-07-30 12:00:58	373	1	2022-08-23 19:18:00.160833	2022-08-23 19:18:00.162494
2169	{"date": "2022-07-30T16:40:46", "nmId": 110119921, "odid": 600217519646, "srid": "72fd33e4790049459d72a7712b6481b1", "brand": "SITIA", "price": 1375, "oblast": "Московская", "barcode": "2036002208623", "gNumber": "6751682678442980826", "sticker": "", "subject": "Масло растительное", "category": "Продукты", "incomeID": 8090310, "isCancel": false, "techSize": "0", "cancel_dt": "0001-01-01T00:00:00", "totalPrice": 1800, "warehouseName": "Коледино", "lastChangeDate": "2022-07-30T19:41:24", "discountPercent": 47, "supplierArticle": "520011908066981764983278947982"}	\N	2022-07-30 13:40:46	373	1	2022-08-23 19:18:00.169748	2022-08-23 19:18:00.171409
2170	{"date": "2022-08-04T11:04:26", "nmId": 110119921, "odid": 600246838999, "srid": "0ec9a56d127a46968bbd23b0174199c5", "brand": "SITIA", "price": 1375, "oblast": "Свердловская", "barcode": "2036002208623", "gNumber": "4877411740707644551", "sticker": "", "subject": "Масло растительное", "category": "Продукты", "incomeID": 8090310, "isCancel": false, "techSize": "0", "cancel_dt": "0001-01-01T00:00:00", "totalPrice": 1800, "warehouseName": "Коледино", "lastChangeDate": "2022-08-04T13:41:49", "discountPercent": 47, "supplierArticle": "520011908066981764983278947982"}	\N	2022-08-04 08:04:26	373	1	2022-08-23 19:18:00.178746	2022-08-23 19:18:00.180206
2171	{"date": "2022-08-04T11:04:39", "nmId": 110119921, "odid": 600246840371, "srid": "30f920ffbc8e426ab5a37c67f9ef5b52", "brand": "SITIA", "price": 1375, "oblast": "Свердловская", "barcode": "2036002208623", "gNumber": "97680599298947628230", "sticker": "", "subject": "Масло растительное", "category": "Продукты", "incomeID": 7993537, "isCancel": false, "techSize": "0", "cancel_dt": "0001-01-01T00:00:00", "totalPrice": 1800, "warehouseName": "Электросталь", "lastChangeDate": "2022-08-04T15:20:34", "discountPercent": 47, "supplierArticle": "520011908066981764983278947982"}	\N	2022-08-04 08:04:39	373	1	2022-08-23 19:18:00.187614	2022-08-23 19:18:00.189245
2172	{"date": "2022-08-04T11:04:45", "nmId": 110119921, "odid": 600246841050, "srid": "ee80cb56626042168ff268a29867c013", "brand": "SITIA", "price": 1375, "oblast": "Свердловская", "barcode": "2036002208623", "gNumber": "91644939205920890044", "sticker": "", "subject": "Масло растительное", "category": "Продукты", "incomeID": 7993537, "isCancel": false, "techSize": "0", "cancel_dt": "0001-01-01T00:00:00", "totalPrice": 1800, "warehouseName": "Электросталь", "lastChangeDate": "2022-08-04T15:20:34", "discountPercent": 47, "supplierArticle": "520011908066981764983278947982"}	\N	2022-08-04 08:04:45	373	1	2022-08-23 19:18:00.196449	2022-08-23 19:18:00.198093
2173	{"date": "2022-08-04T11:04:51", "nmId": 110119921, "odid": 600246841946, "srid": "28e9a68f387247a3afe98f257b859226", "brand": "SITIA", "price": 1375, "oblast": "Свердловская", "barcode": "2036002208623", "gNumber": "94834834360587228631", "sticker": "", "subject": "Масло растительное", "category": "Продукты", "incomeID": 7993537, "isCancel": false, "techSize": "0", "cancel_dt": "0001-01-01T00:00:00", "totalPrice": 1800, "warehouseName": "Электросталь", "lastChangeDate": "2022-08-04T15:20:34", "discountPercent": 47, "supplierArticle": "520011908066981764983278947982"}	\N	2022-08-04 08:04:51	373	1	2022-08-23 19:18:00.205543	2022-08-23 19:18:00.207092
2174	{"date": "2022-08-04T11:05:07", "nmId": 110119921, "odid": 600246843714, "srid": "6e5ca07480f3436ea8eff229feaa2438", "brand": "SITIA", "price": 1375, "oblast": "Свердловская", "barcode": "2036002208623", "gNumber": "7020785428827280331", "sticker": "", "subject": "Масло растительное", "category": "Продукты", "incomeID": 7993537, "isCancel": false, "techSize": "0", "cancel_dt": "0001-01-01T00:00:00", "totalPrice": 1800, "warehouseName": "Электросталь", "lastChangeDate": "2022-08-04T15:20:34", "discountPercent": 47, "supplierArticle": "520011908066981764983278947982"}	\N	2022-08-04 08:05:07	373	1	2022-08-23 19:18:00.214647	2022-08-23 19:18:00.216195
2175	{"date": "2022-08-04T11:05:16", "nmId": 110119921, "odid": 600246844463, "srid": "bbc4ec17bad14f4d9dda37456c351433", "brand": "SITIA", "price": 1375, "oblast": "Свердловская", "barcode": "2036002208623", "gNumber": "7313207417549695515", "sticker": "", "subject": "Масло растительное", "category": "Продукты", "incomeID": 7993537, "isCancel": false, "techSize": "0", "cancel_dt": "0001-01-01T00:00:00", "totalPrice": 1800, "warehouseName": "Электросталь", "lastChangeDate": "2022-08-04T15:20:34", "discountPercent": 47, "supplierArticle": "520011908066981764983278947982"}	\N	2022-08-04 08:05:16	373	1	2022-08-23 19:18:00.225458	2022-08-23 19:18:00.226969
2176	{"date": "2022-08-09T22:21:06", "nmId": 110119921, "odid": 9000260809498, "srid": "6664d3fde2af466babec30fea5dcecf6", "brand": "SITIA", "price": 1375, "oblast": "", "barcode": "2036002208623", "gNumber": "93637413215110021358", "sticker": "", "subject": "Масло растительное", "category": "Продукты", "incomeID": 0, "isCancel": false, "techSize": "0", "cancel_dt": "0001-01-01T00:00:00", "totalPrice": 1800, "warehouseName": "Электросталь", "lastChangeDate": "2022-08-10T01:12:00", "discountPercent": 47, "supplierArticle": "520011908066981764983278947982"}	\N	2022-08-09 19:21:06	373	1	2022-08-23 19:18:00.236293	2022-08-23 19:18:00.237945
2177	{"date": "2022-08-15T11:56:38", "nmId": 110119921, "odid": 600317411158, "srid": "a0887b5ab94e4145b68153e2a7b36267", "brand": "SITIA", "price": 1375, "oblast": "Курская", "barcode": "2036002208623", "gNumber": "2581621389982070879", "sticker": "", "subject": "Масло растительное", "category": "Продукты", "incomeID": 7993537, "isCancel": false, "techSize": "0", "cancel_dt": "0001-01-01T00:00:00", "totalPrice": 1800, "warehouseName": "Электросталь", "lastChangeDate": "2022-08-15T14:18:28", "discountPercent": 47, "supplierArticle": "520011908066981764983278947982"}	\N	2022-08-15 08:56:38	373	1	2022-08-23 19:18:00.251443	2022-08-23 19:18:00.2531
2188	{"date": "2022-08-10T16:08:58", "nmId": 114788424, "odid": 600288010229, "srid": "e98d3812cfa848f79b07760b38037d57", "brand": "Just Greece", "price": 784, "oblast": "МСК Север", "barcode": "2040429296620", "gNumber": "7189520515315847663", "sticker": "", "subject": "Оливки", "category": "Продукты", "incomeID": 8289487, "isCancel": false, "techSize": "0", "cancel_dt": "0001-01-01T00:00:00", "totalPrice": 1000, "warehouseName": "Электросталь", "lastChangeDate": "2022-08-10T20:16:39", "discountPercent": 43, "supplierArticle": "zz-52091030656565209103065656"}	\N	2022-08-10 13:08:58	378	1	2022-08-23 21:52:17.010082	2022-08-23 21:52:17.011573
2178	{"date": "2022-08-17T09:25:08", "nmId": 110119921, "odid": 600329003767, "srid": "13240f1ef90b41e199cd01befe9c0e45", "brand": "SITIA", "price": 1375, "oblast": "Башкортостан", "barcode": "2036002208623", "gNumber": "7164150054632106938", "sticker": "", "subject": "Масло растительное", "category": "Продукты", "incomeID": 7993537, "isCancel": false, "techSize": "0", "cancel_dt": "0001-01-01T00:00:00", "totalPrice": 1800, "warehouseName": "Электросталь", "lastChangeDate": "2022-08-17T17:42:47", "discountPercent": 47, "supplierArticle": "520011908066981764983278947982"}	\N	2022-08-17 06:25:08	373	1	2022-08-23 19:18:00.262047	2022-08-23 19:18:00.263799
2179	{"date": "2022-08-18T22:22:40", "nmId": 110119921, "odid": 600339131295, "srid": "a651cb60765e4494bcb32b33cbc96e73", "brand": "SITIA", "price": 1375, "oblast": "Воронежская", "barcode": "2036002208623", "gNumber": "9492805936583730265", "sticker": "", "subject": "Масло растительное", "category": "Продукты", "incomeID": 7993537, "isCancel": false, "techSize": "0", "cancel_dt": "0001-01-01T00:00:00", "totalPrice": 1800, "warehouseName": "Электросталь", "lastChangeDate": "2022-08-19T05:45:45", "discountPercent": 47, "supplierArticle": "520011908066981764983278947982"}	\N	2022-08-18 19:22:40	373	1	2022-08-23 19:18:00.271229	2022-08-23 19:18:00.272649
2180	{"date": "2022-08-22T18:06:43", "nmId": 110119921, "odid": 9000340663423, "srid": "0c288f84704944b6afa8d056d5e93208", "brand": "SITIA", "price": 1375, "oblast": "Воронежская", "barcode": "2036002208623", "gNumber": "94548955565179520233", "sticker": "", "subject": "Масло растительное", "category": "Продукты", "incomeID": 7993537, "isCancel": false, "techSize": "0", "cancel_dt": "0001-01-01T00:00:00", "totalPrice": 1800, "warehouseName": "Электросталь", "lastChangeDate": "2022-08-23T01:42:28", "discountPercent": 47, "supplierArticle": "520011908066981764983278947982"}	\N	2022-08-22 15:06:43	373	1	2022-08-23 19:18:00.280743	2022-08-23 19:18:00.282191
2181	{"date": "2022-08-20T19:59:32", "nmId": 110119921, "odid": 9000329376961, "srid": "06a782fb19d245dcb52792af9199e0c9", "brand": "SITIA", "price": 1375, "oblast": "Воронежская", "barcode": "2036002208623", "gNumber": "95221909744537450269", "sticker": "", "subject": "Масло растительное", "category": "Продукты", "incomeID": 7993537, "isCancel": true, "techSize": "0", "cancel_dt": "2022-08-22T00:00:00", "totalPrice": 1800, "warehouseName": "Электросталь", "lastChangeDate": "2022-08-23T04:07:41", "discountPercent": 47, "supplierArticle": "520011908066981764983278947982"}	\N	2022-08-20 16:59:32	373	1	2022-08-23 19:18:00.289343	2022-08-23 19:18:00.290976
2182	{"date": "2022-08-08T22:37:17", "nmId": 114788424, "odid": 9000253788108, "srid": "f10ce0463d1c4f869586572c5ba1319e", "brand": "Just Greece", "price": 850, "oblast": "Москва", "barcode": "2040429296620", "gNumber": "2502510784345769573", "sticker": "", "subject": "Оливки", "category": "Продукты", "incomeID": 0, "isCancel": false, "techSize": "0", "cancel_dt": "0001-01-01T00:00:00", "totalPrice": 1000, "warehouseName": "Электросталь", "lastChangeDate": "2022-08-09T03:55:39", "discountPercent": 30, "supplierArticle": "zz-52091030656565209103065656"}	\N	2022-08-08 19:37:17	378	1	2022-08-23 21:52:16.947627	2022-08-23 21:52:16.95153
2183	{"date": "2022-08-09T17:27:47", "nmId": 114788424, "odid": 600281500747, "srid": "e2392f46618e40299e8ec840ea8e68f1", "brand": "Just Greece", "price": 784, "oblast": "Москва", "barcode": "2040429296620", "gNumber": "8969053075737540335", "sticker": "", "subject": "Оливки", "category": "Продукты", "incomeID": 8289487, "isCancel": false, "techSize": "0", "cancel_dt": "0001-01-01T00:00:00", "totalPrice": 1000, "warehouseName": "Электросталь", "lastChangeDate": "2022-08-09T19:58:29", "discountPercent": 43, "supplierArticle": "zz-52091030656565209103065656"}	\N	2022-08-09 14:27:47	378	1	2022-08-23 21:52:16.968076	2022-08-23 21:52:16.969618
2184	{"date": "2022-08-09T19:41:32", "nmId": 114788690, "odid": 600282272380, "srid": "0c4621c28ff84621bbbb895f945f471e", "brand": "Just Greece", "price": 604, "oblast": "Московская", "barcode": "2040429880621", "gNumber": "523510243069335128", "sticker": "", "subject": "Оливки", "category": "Продукты", "incomeID": 8289487, "isCancel": false, "techSize": "0", "cancel_dt": "0001-01-01T00:00:00", "totalPrice": 800, "warehouseName": "Электросталь", "lastChangeDate": "2022-08-09T23:40:53", "discountPercent": 49, "supplierArticle": "ZZ-52014098016935201409801693"}	\N	2022-08-09 16:41:32	378	1	2022-08-23 21:52:16.976535	2022-08-23 21:52:16.97814
2185	{"date": "2022-08-09T21:55:01", "nmId": 114788424, "odid": 600283086775, "srid": "23e9951daf404c6c97e426c15e0aede9", "brand": "Just Greece", "price": 784, "oblast": "Москва", "barcode": "2040429296620", "gNumber": "5156672088866856093", "sticker": "", "subject": "Оливки", "category": "Продукты", "incomeID": 8289487, "isCancel": false, "techSize": "0", "cancel_dt": "0001-01-01T00:00:00", "totalPrice": 1000, "warehouseName": "Электросталь", "lastChangeDate": "2022-08-10T04:43:31", "discountPercent": 43, "supplierArticle": "zz-52091030656565209103065656"}	\N	2022-08-09 18:55:01	378	1	2022-08-23 21:52:16.985037	2022-08-23 21:52:16.986312
2186	{"date": "2022-08-10T12:49:50", "nmId": 114788424, "odid": 600286571332, "srid": "e10ee86caa4a4f8cbb0414d330807fdb", "brand": "Just Greece", "price": 784, "oblast": "Москва", "barcode": "2040429296620", "gNumber": "96853091889723711267", "sticker": "", "subject": "Оливки", "category": "Продукты", "incomeID": 8289487, "isCancel": false, "techSize": "0", "cancel_dt": "0001-01-01T00:00:00", "totalPrice": 1000, "warehouseName": "Электросталь", "lastChangeDate": "2022-08-10T15:51:58", "discountPercent": 43, "supplierArticle": "zz-52091030656565209103065656"}	\N	2022-08-10 09:49:50	378	1	2022-08-23 21:52:16.993107	2022-08-23 21:52:16.994454
2187	{"date": "2022-08-10T15:22:47", "nmId": 114788424, "odid": 600287694549, "srid": "24c01b597b6a47e59abb5d00d12d0cb9", "brand": "Just Greece", "price": 784, "oblast": "Москва", "barcode": "2040429296620", "gNumber": "560817610178833623", "sticker": "", "subject": "Оливки", "category": "Продукты", "incomeID": 8289487, "isCancel": false, "techSize": "0", "cancel_dt": "0001-01-01T00:00:00", "totalPrice": 1000, "warehouseName": "Электросталь", "lastChangeDate": "2022-08-10T19:46:20", "discountPercent": 43, "supplierArticle": "zz-52091030656565209103065656"}	\N	2022-08-10 12:22:47	378	1	2022-08-23 21:52:17.001709	2022-08-23 21:52:17.003215
2189	{"date": "2022-08-10T16:00:33", "nmId": 114788424, "odid": 600287956788, "srid": "6a9f34455fe745dcb0686907eac40297", "brand": "Just Greece", "price": 784, "oblast": "МСК Север", "barcode": "2040429296620", "gNumber": "97893268384860183574", "sticker": "", "subject": "Оливки", "category": "Продукты", "incomeID": 8289487, "isCancel": false, "techSize": "0", "cancel_dt": "0001-01-01T00:00:00", "totalPrice": 1000, "warehouseName": "Электросталь", "lastChangeDate": "2022-08-10T21:26:47", "discountPercent": 43, "supplierArticle": "zz-52091030656565209103065656"}	\N	2022-08-10 13:00:33	378	1	2022-08-23 21:52:17.018355	2022-08-23 21:52:17.019893
2190	{"date": "2022-08-11T19:21:02", "nmId": 114788690, "odid": 600296223623, "srid": "983119bdf41b47d7b0a4d537d8c42a91", "brand": "Just Greece", "price": 604, "oblast": "Московская", "barcode": "2040429880621", "gNumber": "92904532833402757599", "sticker": "", "subject": "Оливки", "category": "Продукты", "incomeID": 8289487, "isCancel": false, "techSize": "0", "cancel_dt": "0001-01-01T00:00:00", "totalPrice": 800, "warehouseName": "Электросталь", "lastChangeDate": "2022-08-11T23:06:11", "discountPercent": 49, "supplierArticle": "ZZ-52014098016935201409801693"}	\N	2022-08-11 16:21:02	378	1	2022-08-23 21:52:17.02705	2022-08-23 21:52:17.028506
2191	{"date": "2022-08-12T03:18:23", "nmId": 114788690, "odid": 600298073494, "srid": "f974c33858f247248e7bbf56a307690e", "brand": "EcoGreece", "price": 604, "oblast": "Московская", "barcode": "2040429880621", "gNumber": "7569800195913792173", "sticker": "", "subject": "Оливки", "category": "Продукты", "incomeID": 8289487, "isCancel": false, "techSize": "0", "cancel_dt": "0001-01-01T00:00:00", "totalPrice": 800, "warehouseName": "Электросталь", "lastChangeDate": "2022-08-12T14:05:35", "discountPercent": 49, "supplierArticle": "ZZ-52014098016935201409801693"}	\N	2022-08-12 00:18:23	378	1	2022-08-23 21:52:17.035377	2022-08-23 21:52:17.036878
2192	{"date": "2022-08-12T14:45:45", "nmId": 114788424, "odid": 600301374934, "srid": "f0452c1092ab4121a33e490b4bb72da7", "brand": "Just Greece", "price": 784, "oblast": "МСК Север", "barcode": "2040429296620", "gNumber": "5446883057598028998", "sticker": "", "subject": "Оливки", "category": "Продукты", "incomeID": 8289487, "isCancel": false, "techSize": "0", "cancel_dt": "0001-01-01T00:00:00", "totalPrice": 1000, "warehouseName": "Электросталь", "lastChangeDate": "2022-08-12T20:39:12", "discountPercent": 43, "supplierArticle": "zz-52091030656565209103065656"}	\N	2022-08-12 11:45:45	378	1	2022-08-23 21:52:17.04343	2022-08-23 21:52:17.044824
2193	{"date": "2022-08-13T00:49:21", "nmId": 114788690, "odid": 600304293187, "srid": "8cf51792b36f440aaa8b45f8b88f5c2a", "brand": "EcoGreece", "price": 604, "oblast": "Московская", "barcode": "2040429880621", "gNumber": "91503207966625366519", "sticker": "", "subject": "Оливки", "category": "Продукты", "incomeID": 8289487, "isCancel": false, "techSize": "0", "cancel_dt": "0001-01-01T00:00:00", "totalPrice": 800, "warehouseName": "Электросталь", "lastChangeDate": "2022-08-13T08:02:26", "discountPercent": 49, "supplierArticle": "ZZ-52014098016935201409801693"}	\N	2022-08-12 21:49:21	378	1	2022-08-23 21:52:17.051741	2022-08-23 21:52:17.053102
2194	{"date": "2022-08-13T00:49:21", "nmId": 114788690, "odid": 600304293188, "srid": "eaa01a087bf54ad9afe8c72ba48b9e7f", "brand": "EcoGreece", "price": 604, "oblast": "Московская", "barcode": "2040429880621", "gNumber": "91503207966625366519", "sticker": "", "subject": "Оливки", "category": "Продукты", "incomeID": 8289487, "isCancel": false, "techSize": "0", "cancel_dt": "0001-01-01T00:00:00", "totalPrice": 800, "warehouseName": "Электросталь", "lastChangeDate": "2022-08-13T08:02:26", "discountPercent": 49, "supplierArticle": "ZZ-52014098016935201409801693"}	\N	2022-08-12 21:49:21	378	1	2022-08-23 21:52:17.060126	2022-08-23 21:52:17.061459
2195	{"date": "2022-08-13T16:15:29", "nmId": 114788424, "odid": 600307490341, "srid": "99788775fe0c414a8ed9369673b4db3a", "brand": "Just Greece", "price": 784, "oblast": "Московская", "barcode": "2040429296620", "gNumber": "4801633029668941286", "sticker": "", "subject": "Оливки", "category": "Продукты", "incomeID": 8289487, "isCancel": false, "techSize": "0", "cancel_dt": "0001-01-01T00:00:00", "totalPrice": 1000, "warehouseName": "Электросталь", "lastChangeDate": "2022-08-13T20:18:07", "discountPercent": 43, "supplierArticle": "zz-52091030656565209103065656"}	\N	2022-08-13 13:15:29	378	1	2022-08-23 21:52:17.068291	2022-08-23 21:52:17.069789
2196	{"date": "2022-08-15T06:32:13", "nmId": 114788690, "odid": 600315521922, "srid": "2c25176592194d78b1b4230530c3b219", "brand": "EcoGreece", "price": 604, "oblast": "Оренбургская", "barcode": "2040429880621", "gNumber": "2838272587828249899", "sticker": "", "subject": "Оливки", "category": "Продукты", "incomeID": 8289487, "isCancel": false, "techSize": "0", "cancel_dt": "0001-01-01T00:00:00", "totalPrice": 800, "warehouseName": "Электросталь", "lastChangeDate": "2022-08-15T11:00:37", "discountPercent": 49, "supplierArticle": "ZZ-52014098016935201409801693"}	\N	2022-08-15 03:32:13	378	1	2022-08-23 21:52:17.076553	2022-08-23 21:52:17.078112
2197	{"date": "2022-08-16T21:19:33", "nmId": 114788424, "odid": 600327067450, "srid": "c34bd999e53b45b0aa76febbd44c2ca7", "brand": "Just Greece", "price": 784, "oblast": "Краснодарский", "barcode": "2040429296620", "gNumber": "94658840079485091398", "sticker": "", "subject": "Оливки", "category": "Продукты", "incomeID": 8289487, "isCancel": false, "techSize": "0", "cancel_dt": "0001-01-01T00:00:00", "totalPrice": 1000, "warehouseName": "Электросталь", "lastChangeDate": "2022-08-16T23:34:07", "discountPercent": 43, "supplierArticle": "zz-52091030656565209103065656"}	\N	2022-08-16 18:19:33	378	1	2022-08-23 21:52:17.084918	2022-08-23 21:52:17.086342
2198	{"date": "2022-08-23T18:50:45", "nmId": 111345626, "odid": 600367485324, "srid": "00524dc2eac54bed84a46851c355b6d7", "brand": "KOKO", "price": 1110, "oblast": "Москва", "barcode": "2037838797626", "gNumber": "7787661661021326559", "sticker": "", "subject": "Масло растительное", "category": "Продукты", "incomeID": 7993537, "isCancel": false, "techSize": "0", "cancel_dt": "0001-01-01T00:00:00", "totalPrice": 1330, "warehouseName": "Электросталь", "lastChangeDate": "2022-08-23T22:46:48", "discountPercent": 33, "supplierArticle": "5205657000631"}	\N	2022-08-23 15:50:45	378	1	2022-08-23 21:52:17.093076	2022-08-23 21:52:17.094466
2199	{"date": "2022-08-23T23:02:45", "nmId": 110119921, "odid": 153985898797, "srid": "", "brand": "SITIA", "price": 1278.3123618090451, "oblast": "Тамбовская", "barcode": "2036002208623", "gNumber": "94157688099029042647", "sticker": "", "subject": "Масло растительное", "category": "Продукты", "incomeID": 7993537, "isCancel": false, "techSize": "0", "cancel_dt": "0001-01-01T00:00:00", "totalPrice": 1673.58, "warehouseName": "Электросталь", "lastChangeDate": "2022-08-23T23:20:33", "discountPercent": 47, "supplierArticle": "520011908066981764983278947982"}	\N	2022-08-23 20:02:45	378	1	2022-08-23 21:52:17.101713	2022-08-23 21:52:17.103125
2200	{"date": "2022-08-24T09:10:35", "nmId": 111054747, "odid": 600370299647, "srid": "34147ef0b8824594a99d4607531a0b1b", "brand": "SITIA", "price": 1954, "oblast": "Бурятия", "barcode": "5200119080658", "gNumber": "98512874342645237921", "sticker": "", "subject": "Масло растительное", "category": "Продукты", "incomeID": 8294656, "isCancel": false, "techSize": "0", "cancel_dt": "0001-01-01T00:00:00", "totalPrice": 2300, "warehouseName": "Коледино", "lastChangeDate": "2022-08-24T12:40:51", "discountPercent": 30, "supplierArticle": "5200119080675200119080665"}	\N	2022-08-24 06:10:35	384	1	2022-08-25 06:38:35.163931	2022-08-25 06:38:35.167049
2201	{"date": "2022-08-24T06:05:54", "nmId": 111885790, "odid": 9000349985410, "srid": "5a48f956ed184ce2a0d9c20d0fd5dee5", "brand": "Agrilife", "price": 2308, "oblast": "Красноярский", "barcode": "2038421534628", "gNumber": "93376590610206507613", "sticker": "", "subject": "Масло растительное", "category": "Продукты", "incomeID": 8289487, "isCancel": false, "techSize": "0", "cancel_dt": "0001-01-01T00:00:00", "totalPrice": 2800, "warehouseName": "Электросталь", "lastChangeDate": "2022-08-24T14:01:26", "discountPercent": 35, "supplierArticle": "88571217752"}	\N	2022-08-24 03:05:54	384	1	2022-08-25 06:38:35.183854	2022-08-25 06:38:35.185367
2202	{"date": "2022-08-24T14:44:09", "nmId": 117329468, "odid": 600372639811, "srid": "c48b4060e02b40acb884850258b25724", "brand": "MINERVA", "price": 1690, "oblast": "Москва", "barcode": "2041990946624", "gNumber": "98780147645993507225", "sticker": "", "subject": "Масло растительное", "category": "Продукты", "incomeID": 8294656, "isCancel": false, "techSize": "0", "cancel_dt": "0001-01-01T00:00:00", "totalPrice": 1690, "warehouseName": "Коледино", "lastChangeDate": "2022-08-24T18:52:22", "discountPercent": 0, "supplierArticle": "5201106190748"}	\N	2022-08-24 11:44:09	384	1	2022-08-25 06:38:35.192218	2022-08-25 06:38:35.193621
2203	{"date": "2022-08-24T15:22:33", "nmId": 111345626, "odid": 9000353258088, "srid": "0b73fb984353474fbf04a3d43d73abc7", "brand": "KOKO", "price": 1110, "oblast": "Москва", "barcode": "2037838797626", "gNumber": "91282181521703846161", "sticker": "", "subject": "Масло растительное", "category": "Продукты", "incomeID": 7993537, "isCancel": false, "techSize": "0", "cancel_dt": "0001-01-01T00:00:00", "totalPrice": 1330, "warehouseName": "Электросталь", "lastChangeDate": "2022-08-25T01:00:16", "discountPercent": 33, "supplierArticle": "5205657000631"}	\N	2022-08-24 12:22:33	384	1	2022-08-25 06:38:35.200443	2022-08-25 06:38:35.201929
2204	{"date": "2022-08-24T23:02:44", "nmId": 110119921, "odid": 600375473685, "srid": "d39b8db31c9046c3a4e0d83c57606251", "brand": "SITIA", "price": 1375, "oblast": "Москва", "barcode": "2036002208623", "gNumber": "92314256928604727047", "sticker": "", "subject": "Масло растительное", "category": "Продукты", "incomeID": 7993537, "isCancel": false, "techSize": "0", "cancel_dt": "0001-01-01T00:00:00", "totalPrice": 1800, "warehouseName": "МЛП-Подольск", "lastChangeDate": "2022-08-25T05:59:41", "discountPercent": 47, "supplierArticle": "520011908066981764983278947982"}	\N	2022-08-24 20:02:44	384	1	2022-08-25 06:38:35.208618	2022-08-25 06:38:35.209932
2205	{"date": "2022-08-26T06:22:55", "nmId": 114788424, "odid": 600382359061, "srid": "99ce332f49df4db6936aa76e278d6a47", "brand": "Just Greece", "price": 784, "oblast": "Тыва", "barcode": "2040429296620", "gNumber": "97562983249412760883", "sticker": "", "subject": "Оливки", "category": "Продукты", "incomeID": 8289487, "isCancel": false, "techSize": "0", "cancel_dt": "0001-01-01T00:00:00", "totalPrice": 1000, "warehouseName": "Электросталь", "lastChangeDate": "2022-08-26T13:31:39", "discountPercent": 43, "supplierArticle": "zz-52091030656565209103065656"}	\N	2022-08-26 03:22:55	423	1	2022-08-26 11:30:02.152724	2022-08-26 11:30:02.15879
2206	{"date": "2022-08-26T12:33:58", "nmId": 111054747, "odid": 600384305641, "srid": "ece3a7d2946f4625ab1a21b8b84a5cf0", "brand": "SITIA", "price": 2005, "oblast": "Московская", "barcode": "5200119080658", "gNumber": "8186698229572829711", "sticker": "", "subject": "Масло растительное", "category": "Продукты", "incomeID": 8294656, "isCancel": false, "techSize": "0", "cancel_dt": "0001-01-01T00:00:00", "totalPrice": 2360, "warehouseName": "Коледино", "lastChangeDate": "2022-08-26T15:21:45", "discountPercent": 30, "supplierArticle": "5200119080675200119080665"}	\N	2022-08-26 09:33:58	427	1	2022-08-27 17:20:05.105057	2022-08-27 17:20:05.107815
2207	{"date": "2022-08-26T11:17:18", "nmId": 111345626, "odid": 9000364554808, "srid": "dd36d03e569e4e6bacceb2a6f868cec4", "brand": "KOKO", "price": 1110, "oblast": "Калужская", "barcode": "2037838797626", "gNumber": "97150100176070922075", "sticker": "", "subject": "Масло растительное", "category": "Продукты", "incomeID": 7993537, "isCancel": false, "techSize": "0", "cancel_dt": "0001-01-01T00:00:00", "totalPrice": 1330, "warehouseName": "Электросталь", "lastChangeDate": "2022-08-26T20:45:13", "discountPercent": 33, "supplierArticle": "5205657000631"}	\N	2022-08-26 08:17:18	427	1	2022-08-27 17:20:05.125962	2022-08-27 17:20:05.127571
2208	{"date": "2022-08-25T15:21:48", "nmId": 117329468, "odid": 600379169194, "srid": "efac3820b5f44cbe98bfaed3434446ef", "brand": "MINERVA", "price": 1690, "oblast": "Москва", "barcode": "2041990946624", "gNumber": "91705919850475979664", "sticker": "", "subject": "Масло растительное", "category": "Продукты", "incomeID": 8294656, "isCancel": false, "techSize": "0", "cancel_dt": "0001-01-01T00:00:00", "totalPrice": 1690, "warehouseName": "Коледино", "lastChangeDate": "2022-08-26T21:32:10", "discountPercent": 0, "supplierArticle": "5201106190748"}	\N	2022-08-25 12:21:48	427	1	2022-08-27 17:20:05.140312	2022-08-27 17:20:05.141919
2209	{"date": "2022-08-25T14:25:22", "nmId": 117329468, "odid": 600378804477, "srid": "992d81cd042d42ee8959c1837ef11f72", "brand": "MINERVA", "price": 1690, "oblast": "Москва", "barcode": "2041990946624", "gNumber": "99194470108182261067", "sticker": "", "subject": "Масло растительное", "category": "Продукты", "incomeID": 8294656, "isCancel": false, "techSize": "0", "cancel_dt": "0001-01-01T00:00:00", "totalPrice": 1690, "warehouseName": "Коледино", "lastChangeDate": "2022-08-26T21:47:40", "discountPercent": 0, "supplierArticle": "5201106190748"}	\N	2022-08-25 11:25:22	427	1	2022-08-27 17:20:05.149321	2022-08-27 17:20:05.151147
2210	{"date": "2022-08-26T14:54:44", "nmId": 111054747, "odid": 600385186944, "srid": "430fff3719a640578b0df3e12eaab8a1", "brand": "SITIA", "price": 2005, "oblast": "Московская", "barcode": "5200119080658", "gNumber": "97482481149368145512", "sticker": "", "subject": "Масло растительное", "category": "Продукты", "incomeID": 8289487, "isCancel": false, "techSize": "0", "cancel_dt": "0001-01-01T00:00:00", "totalPrice": 2360, "warehouseName": "Электросталь", "lastChangeDate": "2022-08-26T22:02:46", "discountPercent": 30, "supplierArticle": "5200119080675200119080665"}	\N	2022-08-26 11:54:44	427	1	2022-08-27 17:20:05.158118	2022-08-27 17:20:05.159488
2211	{"date": "2022-08-27T22:33:51", "nmId": 111345604, "odid": 204277214821, "srid": "", "brand": "SITIA", "price": 5181, "oblast": "Мурманская", "barcode": "2037838726626", "gNumber": "7274271961778630854", "sticker": "", "subject": "Масло растительное", "category": "Продукты", "incomeID": 8289487, "isCancel": false, "techSize": "0", "cancel_dt": "0001-01-01T00:00:00", "totalPrice": 6100, "warehouseName": "Электросталь", "lastChangeDate": "2022-08-27T22:45:57", "discountPercent": 30, "supplierArticle": "5200102953203"}	\N	2022-08-27 19:33:51	444	1	2022-08-27 20:40:04.197575	2022-08-27 20:40:04.199271
2212	{"date": "2022-08-27T18:25:48", "nmId": 111054747, "odid": 600391944947, "srid": "0991158f569e4233bfb5410728483ea4", "brand": "SITIA", "price": 1652, "oblast": "Татарстан", "barcode": "5200119080658", "gNumber": "96086548671927266465", "sticker": "", "subject": "Масло растительное", "category": "Продукты", "incomeID": 8294656, "isCancel": false, "techSize": "0", "cancel_dt": "0001-01-01T00:00:00", "totalPrice": 1652, "warehouseName": "Коледино", "lastChangeDate": "2022-08-27T23:40:44", "discountPercent": 0, "supplierArticle": "5200119080675200119080665"}	\N	2022-08-27 15:25:48	447	1	2022-08-27 21:40:03.557121	2022-08-27 21:40:03.558953
2213	{"date": "2022-08-28T09:12:46", "nmId": 111345626, "odid": 9000375461117, "srid": "629aa0e73dd547d1869390221cec5888", "brand": "KOKO", "price": 1160, "oblast": "Томская", "barcode": "2037838797626", "gNumber": "3437122676466958955", "sticker": "", "subject": "Масло растительное", "category": "Продукты", "incomeID": 0, "isCancel": false, "techSize": "0", "cancel_dt": "0001-01-01T00:00:00", "totalPrice": 1390, "warehouseName": "Электросталь", "lastChangeDate": "2022-08-28T11:30:48", "discountPercent": 33, "supplierArticle": "5205657000631"}	\N	2022-08-28 06:12:46	507	1	2022-08-28 09:20:06.285136	2022-08-28 09:20:06.287583
2214	{"date": "2022-08-28T12:28:16", "nmId": 111054747, "odid": 9000376583095, "srid": "06e10b7547724eb5b48ba8203fa1e08d", "brand": "SITIA", "price": 2005, "oblast": "Москва", "barcode": "5200119080658", "gNumber": "92262211295981319372", "sticker": "", "subject": "Масло растительное", "category": "Продукты", "incomeID": 0, "isCancel": false, "techSize": "0", "cancel_dt": "0001-01-01T00:00:00", "totalPrice": 2360, "warehouseName": "Коледино", "lastChangeDate": "2022-08-28T14:49:56", "discountPercent": 30, "supplierArticle": "5200119080675200119080665"}	\N	2022-08-28 09:28:16	522	1	2022-08-28 13:00:03.459048	2022-08-28 13:00:03.467134
2215	{"date": "2022-08-28T12:03:59", "nmId": 111054747, "odid": 9000376430358, "srid": "26a565815f844e80b17432b5283860f0", "brand": "SITIA", "price": 2005, "oblast": "Москва", "barcode": "5200119080658", "gNumber": "8957681104655336226", "sticker": "", "subject": "Масло растительное", "category": "Продукты", "incomeID": 0, "isCancel": false, "techSize": "0", "cancel_dt": "0001-01-01T00:00:00", "totalPrice": 2360, "warehouseName": "Коледино", "lastChangeDate": "2022-08-28T14:56:28", "discountPercent": 30, "supplierArticle": "5200119080675200119080665"}	\N	2022-08-28 09:03:59	523	1	2022-08-28 13:20:02.173733	2022-08-28 13:20:02.183182
2216	{"date": "2022-08-28T15:21:44", "nmId": 111345604, "odid": 9000377653287, "srid": "9e949aa72c6b4abfa02ef8b51ec9fe39", "brand": "SITIA", "price": 5572, "oblast": "Свердловская", "barcode": "2037838726626", "gNumber": "9993771198838911898", "sticker": "", "subject": "Масло растительное", "category": "Продукты", "incomeID": 0, "isCancel": false, "techSize": "0", "cancel_dt": "0001-01-01T00:00:00", "totalPrice": 6560, "warehouseName": "Электросталь", "lastChangeDate": "2022-08-28T18:33:49", "discountPercent": 30, "supplierArticle": "5200102953203"}	\N	2022-08-28 12:21:44	533	1	2022-08-28 16:40:02.37394	2022-08-28 16:40:02.377524
\.


--
-- Data for Name: photos; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.photos (id, image_data, product_id, created_at, updated_at) FROM stdin;
14	{"id": "3e3a1147ce12188c56c845c296498ed3.jpg", "storage": "store", "metadata": {"size": 124759, "filename": "111885790-2.jpg", "mime_type": "image/jpeg"}}	35	2022-08-07 19:06:50.181811	2022-08-10 14:50:18.422978
13	{"id": "8cca67b305ba3b15f5914d3cc7df381d.jpg", "storage": "store", "metadata": {"size": 157643, "filename": "1 (1).jpg", "mime_type": "image/jpeg"}}	34	2022-08-07 19:06:49.008517	2022-08-10 14:52:02.621874
12	{"id": "d368f2d37d67c3c17b87aa4d6b047710.jpg", "storage": "store", "metadata": {"size": 169226, "filename": "1 (2).jpg", "mime_type": "image/jpeg"}}	33	2022-08-07 19:06:46.948014	2022-08-10 14:52:36.420197
10	{"id": "a1d1d28d22e0c92eb6d711f3aa6601a5", "storage": "store", "metadata": {"size": 838, "filename": "ffaker_image20220807-279-n598i", "mime_type": null}}	31	2022-08-07 19:06:43.756801	2022-08-07 19:06:43.766868
9	{"id": "9417dd2d9d133cc880ce88653db87531.jpg", "storage": "store", "metadata": {"size": 187152, "filename": "110119921-1.jpg", "mime_type": "image/jpeg"}}	30	2022-08-07 19:06:42.070228	2022-08-09 18:37:49.488745
18	{"id": "4bfdbf7e68ae81b77f0833b6d4251351.jpg", "storage": "store", "metadata": {"size": 527068, "filename": "1 (3).jpg", "mime_type": "image/jpeg"}}	37	2022-08-13 12:30:46.646585	2022-08-13 12:30:46.653434
19	\N	38	2022-08-14 18:09:09.866545	2022-08-14 18:09:09.866545
20	{"id": "a30f93e03cf2b4e8068bca0e193032d4.jpg", "storage": "store", "metadata": {"size": 1254667, "filename": "IMG_0262.jpg", "mime_type": "image/jpeg"}}	38	2022-08-14 18:09:09.868801	2022-08-14 18:09:09.873474
21	\N	39	2022-08-23 21:50:31.881631	2022-08-23 21:50:31.881631
22	{"id": "1e7d3012d4a00b9564cd194a990f86e3.jpg", "storage": "store", "metadata": {"size": 123455, "filename": "1 (4).jpg", "mime_type": "image/jpeg"}}	39	2022-08-23 21:50:31.883588	2022-08-23 21:50:31.887855
23	\N	40	2022-08-23 21:51:38.241597	2022-08-23 21:51:38.241597
24	{"id": "70827ae3e44a90122e671c93306575ad.jpg", "storage": "store", "metadata": {"size": 110903, "filename": "1 (5).jpg", "mime_type": "image/jpeg"}}	40	2022-08-23 21:51:38.243083	2022-08-23 21:51:38.253796
\.


--
-- Data for Name: product_categories; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.product_categories (id, product_id, category_id, "position", created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: product_keywords; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.product_keywords (id, product_id, keyword_id, "position", created_at, updated_at) FROM stdin;
1	30	1	\N	2022-08-27 21:06:30.800788	2022-08-27 21:06:30.800788
2	30	2	\N	2022-08-27 23:45:48.764791	2022-08-27 23:45:48.764791
\.


--
-- Data for Name: products; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.products (id, name, data, sku, barcode, offer_id, content, properties, parameters, image_data, jsonb, campaign_id, import_id, user_id, created_at, updated_at, cost, price, purchase_price) FROM stdin;
34	Хориатико	{"wb": {"sku": "111885412", "barcode": "2038421434621"}}	123	5200362400349	\N	{}	{"тара": "Железная банка", "длина": "", "объем": "500", "высота": "", "ширина": ""}	{"жиры": "", "белки": "", "углеводы": "", "энергетическая ценность": ""}	\N	\N	1	1	2	2022-08-07 19:06:49.007108	2022-08-12 15:35:42.47197	{"fulfillment": {"работа": "29", "материал": "15"}, "marketplace": {"wb": {"комиссия": "10", "логистика": "54"}, "ozon": {"комиссия": "", "логистика": ""}}}	910.00	512.00
39	EcoGreece Оливки	{"wb": {"sku": "114788690", "barcode": "2040429880621"}}		5201409801693	\N	{}	{"тара": "Железная банка", "длина": "", "объем": "500", "высота": "", "ширина": ""}	{"жиры": "", "белки": "", "углеводы": "", "энергетическая ценность": ""}	\N	\N	1	1	2	2022-08-23 21:50:31.873442	2022-08-23 21:50:31.873442	{"fulfillment": {"работа": "", "материал": ""}, "marketplace": {"wb": {"комиссия": "", "логистика": ""}, "ozon": {"комиссия": "", "логистика": ""}}}	\N	\N
33	KOKO	{"wb": {"sku": "111345626", "barcode": "2037838797626"}}		5205657000631	\N	{}	{"тара": "Пластиковая бутылка", "длина": "321", "объем": "1000", "высота": "123", "ширина": "321"}	{"жиры": "22", "белки": "11", "углеводы": "33", "энергетическая ценность": "123"}	\N	\N	1	1	2	2022-08-07 19:06:46.946332	2022-08-23 12:26:25.752101	{"fulfillment": {"работа": "39", "материал": "15"}, "marketplace": {"wb": {"комиссия": "", "логистика": ""}, "ozon": {"комиссия": "10", "логистика": "10"}}}	\N	\N
40	Just Greece Оливки	{"wb": {"sku": "114788424", "barcode": "2040429296620"}}		5209103065656	\N	{}	{"тара": "Железная банка", "длина": "", "объем": "500", "высота": "", "ширина": ""}	{"жиры": "", "белки": "", "углеводы": "", "энергетическая ценность": ""}	\N	\N	1	1	2	2022-08-23 21:51:38.238526	2022-08-23 21:51:38.238526	{"fulfillment": {"работа": "", "материал": ""}, "marketplace": {"wb": {"комиссия": "", "логистика": ""}, "ozon": {"комиссия": "", "логистика": ""}}}	\N	\N
38	Minerva	{"wb": {"sku": "117329468", "barcode": "2041990946624"}}	5201106190748	5201106190748	\N	{}	{"тара": "Железная банка", "длина": "", "объем": "750", "высота": "", "ширина": ""}	{"жиры": "", "белки": "", "углеводы": "", "энергетическая ценность": ""}	\N	\N	1	1	2	2022-08-14 18:09:09.862117	2022-08-23 12:51:24.494189	{"fulfillment": {"работа": "35", "материал": "25"}, "marketplace": {"wb": {"комиссия": "10", "логистика": "45"}, "ozon": {"комиссия": "", "логистика": ""}}}	1340.00	980.00
30	Сития 02 Николаос	{"wb": {"sku": "110119921", "barcode": "2036002208623"}}		5200119080657	\N	{}	{"тара": "Железная банка", "длина": "33", "объем": "500", "высота": "22", "ширина": "11"}	{"жиры": "", "белки": "", "углеводы": "", "энергетическая ценность": ""}	\N	\N	1	1	2	2022-08-07 19:06:42.064041	2022-08-23 19:17:38.780353	{"fulfillment": {"работа": "37", "материал": "15"}, "marketplace": {"wb": {"комиссия": "", "логистика": ""}, "ozon": {"комиссия": "", "логистика": ""}}}	\N	\N
37	SITIA GOLD Оливковое масло extra virgin	{"wb": {"sku": "111054747", "barcode": "5200119080658"}}	111054747	5200119080658	\N	{}	{"тара": "Железная банка", "длина": "", "объем": "1000", "высота": "", "ширина": ""}	{"жиры": "", "белки": "", "углеводы": "", "энергетическая ценность": ""}	\N	\N	1	1	2	2022-08-13 12:30:46.643002	2022-08-13 12:47:10.435597	{"fulfillment": {"работа": "37", "материал": "25"}, "marketplace": {"wb": {"комиссия": "10", "логистика": "59"}, "ozon": {"комиссия": "", "логистика": ""}}}	1497.00	958.00
35	Agrilife	{"wb": {"sku": "111885790", "barcode": "2038421534628"}}		8857121775285	\N	{}	{"тара": "Железная банка", "длина": "", "объем": "500", "высота": "", "ширина": ""}	{"жиры": "", "белки": "", "углеводы": "", "энергетическая ценность": ""}	\N	\N	1	1	2	2022-08-07 19:06:50.180345	2022-08-23 12:24:18.286654	{"fulfillment": {"работа": "37", "материал": "15"}, "marketplace": {"wb": {"комиссия": "", "логистика": ""}, "ozon": {"комиссия": "", "логистика": ""}}}	\N	\N
31	Сития 02 премиум голд	{"wb": {"sku": "111345604", "barcode": "2037838726626"}}		5200102951223	\N	{}	{"тара": "Железная банка", "длина": "333", "объем": "3000", "высота": "112", "ширина": "23"}	{"жиры": "", "белки": "", "углеводы": "", "энергетическая ценность": ""}	\N	\N	1	1	2	2022-08-07 19:06:43.751053	2022-08-23 12:25:35.576752	{"fulfillment": {"работа": "", "материал": ""}, "marketplace": {"wb": {"комиссия": "", "логистика": ""}, "ozon": {"комиссия": "", "логистика": ""}}}	\N	\N
\.


--
-- Data for Name: schema_migrations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.schema_migrations (version) FROM stdin;
20220529115830
20220524221736
20220629190310
20220709195138
20220809115212
20220809181145
20220524220356
20220811113333
20220811113451
20220812152812
20220812152850
20220812152945
20220812153009
20220821230100
20220822012340
20220822210637
20220823114527
20220827210410
20220526185941
20220526190225
20220529114545
20220529115641
20220529214555
20220529223502
20220629180452
20220709003336
\.


--
-- Data for Name: sells; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.sells (id, order_id, date, api_data, excel_data, created_at, updated_at) FROM stdin;
2	1972	2022-07-18	{"spp": 0, "date": "2022-07-18T10:36:31", "nmId": 111885790, "odid": 600135151302, "srid": "", "brand": "Agrilife", "forPay": 820.8, "saleID": "S3059410020", "barcode": "2038421534628", "gNumber": "7052925893322153772", "sticker": "", "subject": "Масло растительное", "IsStorno": 0, "category": "Продукты", "incomeID": 8043602, "isSupply": false, "techSize": "0", "regionName": "", "totalPrice": 1600, "countryName": "Россия", "finishedPrice": 848, "isRealization": true, "priceWithDisc": 912, "warehouseName": "Коледино", "lastChangeDate": "2022-07-18T10:45:36", "discountPercent": 43, "oblastOkrugName": "", "supplierArticle": "88571217752", "promoCodeDiscount": 0}	{}	2022-08-22 01:34:49.518219	2022-08-22 01:34:49.518219
3	1970	2022-07-18	{"spp": 0, "date": "2022-07-18T13:54:05", "nmId": 111054747, "odid": 600130860602, "srid": "", "brand": "SITIA", "forPay": 1179.9, "saleID": "S3060825656", "barcode": "5200119080658", "gNumber": "9390746387429365796", "sticker": "", "subject": "Масло растительное", "IsStorno": 0, "category": "Продукты", "incomeID": 7993537, "isSupply": false, "techSize": "0", "regionName": "Московская", "totalPrice": 2300, "countryName": "Россия", "finishedPrice": 1219, "isRealization": true, "priceWithDisc": 1311, "warehouseName": "Электросталь", "lastChangeDate": "2022-07-18T14:02:14", "discountPercent": 43, "oblastOkrugName": "Центральный федеральный округ", "supplierArticle": "5200119080675200119080665", "promoCodeDiscount": 0}	{}	2022-08-22 01:34:50.314182	2022-08-22 01:34:50.314182
5	1977	2022-07-19	{"spp": 0, "date": "2022-07-19T12:11:56", "nmId": 111054747, "odid": 600139999912, "srid": "", "brand": "SITIA", "forPay": 1179.9, "saleID": "S3065206409", "barcode": "5200119080658", "gNumber": "3067444248557520869", "sticker": "", "subject": "Масло растительное", "IsStorno": 0, "category": "Продукты", "incomeID": 8090310, "isSupply": false, "techSize": "0", "regionName": "Москва", "totalPrice": 2300, "countryName": "Россия", "finishedPrice": 1219, "isRealization": true, "priceWithDisc": 1311, "warehouseName": "Коледино", "lastChangeDate": "2022-07-19T12:11:59", "discountPercent": 43, "oblastOkrugName": "Центральный федеральный округ", "supplierArticle": "5200119080675200119080665", "promoCodeDiscount": 0}	{}	2022-08-22 01:34:51.267059	2022-08-22 01:34:51.267059
6	1971	2022-07-19	{"spp": 0, "date": "2022-07-19T18:35:47", "nmId": 111054747, "odid": 600130937317, "srid": "", "brand": "SITIA", "forPay": 1179.9, "saleID": "S3068338867", "barcode": "5200119080658", "gNumber": "106682006915968135", "sticker": "", "subject": "Масло растительное", "IsStorno": 0, "category": "Продукты", "incomeID": 7993537, "isSupply": false, "techSize": "0", "regionName": "Москва", "totalPrice": 2300, "countryName": "Россия", "finishedPrice": 1219, "isRealization": true, "priceWithDisc": 1311, "warehouseName": "Электросталь", "lastChangeDate": "2022-07-20T02:22:11", "discountPercent": 43, "oblastOkrugName": "Центральный федеральный округ", "supplierArticle": "5200119080675200119080665", "promoCodeDiscount": 0}	{}	2022-08-22 01:34:51.970121	2022-08-22 01:34:51.970121
7	1974	2022-07-20	{"spp": 0, "date": "2022-07-20T12:30:43", "nmId": 111885790, "odid": 600138322603, "srid": "", "brand": "Agrilife", "forPay": 820.8, "saleID": "S3070813639", "barcode": "2038421534628", "gNumber": "94279303375705806515", "sticker": "", "subject": "Масло растительное", "IsStorno": 0, "category": "Продукты", "incomeID": 8043602, "isSupply": false, "techSize": "0", "regionName": "", "totalPrice": 1600, "countryName": "Россия", "finishedPrice": 848, "isRealization": true, "priceWithDisc": 912, "warehouseName": "Коледино", "lastChangeDate": "2022-07-20T12:30:43", "discountPercent": 43, "oblastOkrugName": "", "supplierArticle": "88571217752", "promoCodeDiscount": 0}	{}	2022-08-22 01:34:52.556306	2022-08-22 01:34:52.556306
8	1976	2022-07-20	{"spp": 0, "date": "2022-07-20T12:30:52", "nmId": 111885790, "odid": 600139594467, "srid": "", "brand": "Agrilife", "forPay": 820.8, "saleID": "S3070815898", "barcode": "2038421534628", "gNumber": "6205462050418123575", "sticker": "", "subject": "Масло растительное", "IsStorno": 0, "category": "Продукты", "incomeID": 8043602, "isSupply": false, "techSize": "0", "regionName": "", "totalPrice": 1600, "countryName": "Россия", "finishedPrice": 848, "isRealization": true, "priceWithDisc": 912, "warehouseName": "Коледино", "lastChangeDate": "2022-07-20T12:30:52", "discountPercent": 43, "oblastOkrugName": "", "supplierArticle": "88571217752", "promoCodeDiscount": 0}	{}	2022-08-22 01:34:54.52407	2022-08-22 01:34:54.52407
9	1983	2022-07-20	{"spp": 0, "date": "2022-07-20T18:42:07", "nmId": 111885790, "odid": 600147174600, "srid": "", "brand": "Agrilife", "forPay": 820.8, "saleID": "S3073746924", "barcode": "2038421534628", "gNumber": "7130244715504760032", "sticker": "", "subject": "Масло растительное", "IsStorno": 0, "category": "Продукты", "incomeID": 8043602, "isSupply": false, "techSize": "0", "regionName": "Москва", "totalPrice": 1600, "countryName": "Россия", "finishedPrice": 848, "isRealization": true, "priceWithDisc": 912, "warehouseName": "Коледино", "lastChangeDate": "2022-07-20T18:42:11", "discountPercent": 43, "oblastOkrugName": "Центральный федеральный округ", "supplierArticle": "88571217752", "promoCodeDiscount": 0}	{}	2022-08-22 01:34:54.834884	2022-08-22 01:34:54.834884
10	1979	2022-07-20	{"spp": 0, "date": "2022-07-20T20:21:19", "nmId": 111054747, "odid": 204228934155, "srid": "", "brand": "SITIA", "forPay": 1179.9, "saleID": "S3074549229", "barcode": "5200119080658", "gNumber": "9832178059933097934", "sticker": "", "subject": "Масло растительное", "IsStorno": 0, "category": "Продукты", "incomeID": 8090310, "isSupply": false, "techSize": "0", "regionName": "Московская", "totalPrice": 2300, "countryName": "Россия", "finishedPrice": 1219, "isRealization": true, "priceWithDisc": 1311, "warehouseName": "Коледино", "lastChangeDate": "2022-07-20T20:21:22", "discountPercent": 43, "oblastOkrugName": "Центральный федеральный округ", "supplierArticle": "5200119080675200119080665", "promoCodeDiscount": 0}	{}	2022-08-22 01:34:55.110292	2022-08-22 01:34:55.110292
11	1982	2022-07-20	{"spp": 0, "date": "2022-07-20T20:34:59", "nmId": 111885412, "odid": 204228927595, "srid": "", "brand": "", "forPay": 782.46, "saleID": "S3074678242", "barcode": "2038421434621", "gNumber": "1252179155780689164", "sticker": "", "subject": "Масло растительное", "IsStorno": 0, "category": "Продукты", "incomeID": 8043602, "isSupply": false, "techSize": "0", "regionName": "Московская", "totalPrice": 1380, "countryName": "Россия", "finishedPrice": 808, "isRealization": true, "priceWithDisc": 869.4, "warehouseName": "Коледино", "lastChangeDate": "2022-07-20T20:35:02", "discountPercent": 37, "oblastOkrugName": "Центральный федеральный округ", "supplierArticle": "52003624003", "promoCodeDiscount": 0}	{}	2022-08-22 01:34:55.289439	2022-08-22 01:34:55.289439
12	1985	2022-07-21	{"spp": 0, "date": "2022-07-21T13:00:39", "nmId": 111054747, "odid": 600149535589, "srid": "", "brand": "SITIA", "forPay": 1179.9, "saleID": "S3076449642", "barcode": "5200119080658", "gNumber": "96631690733328468699", "sticker": "", "subject": "Масло растительное", "IsStorno": 0, "category": "Продукты", "incomeID": 8090310, "isSupply": false, "techSize": "0", "regionName": "Смоленская", "totalPrice": 2300, "countryName": "Россия", "finishedPrice": 1219, "isRealization": true, "priceWithDisc": 1311, "warehouseName": "Коледино", "lastChangeDate": "2022-07-21T13:15:57", "discountPercent": 43, "oblastOkrugName": "Центральный федеральный округ", "supplierArticle": "5200119080675200119080665", "promoCodeDiscount": 0}	{}	2022-08-22 01:35:45.172074	2022-08-22 01:35:45.172074
13	1978	2022-07-21	{"spp": 0, "date": "2022-07-21T14:36:51", "nmId": 111054747, "odid": 600143925825, "srid": "", "brand": "SITIA", "forPay": 1179.9, "saleID": "S3077159779", "barcode": "5200119080658", "gNumber": "3051314166310553804", "sticker": "", "subject": "Масло растительное", "IsStorno": 0, "category": "Продукты", "incomeID": 8090310, "isSupply": false, "techSize": "0", "regionName": "Москва", "totalPrice": 2300, "countryName": "Россия", "finishedPrice": 1219, "isRealization": true, "priceWithDisc": 1311, "warehouseName": "Коледино", "lastChangeDate": "2022-07-21T16:21:47", "discountPercent": 43, "oblastOkrugName": "Центральный федеральный округ", "supplierArticle": "5200119080675200119080665", "promoCodeDiscount": 0}	{}	2022-08-22 01:35:45.259448	2022-08-22 01:35:45.259448
14	1973	2022-07-21	{"spp": 0, "date": "2022-07-21T18:30:30", "nmId": 111885790, "odid": 600136844310, "srid": "", "brand": "Agrilife", "forPay": 820.8, "saleID": "S3079066155", "barcode": "2038421534628", "gNumber": "93154200604084421839", "sticker": "", "subject": "Масло растительное", "IsStorno": 0, "category": "Продукты", "incomeID": 8043602, "isSupply": false, "techSize": "0", "regionName": "Свердловская", "totalPrice": 1600, "countryName": "Россия", "finishedPrice": 848, "isRealization": true, "priceWithDisc": 912, "warehouseName": "Коледино", "lastChangeDate": "2022-07-21T18:55:55", "discountPercent": 43, "oblastOkrugName": "Уральский федеральный округ", "supplierArticle": "88571217752", "promoCodeDiscount": 0}	{}	2022-08-22 01:35:45.336526	2022-08-22 01:35:45.336526
15	1981	2022-07-21	{"spp": 0, "date": "2022-07-21T20:48:44", "nmId": 111885412, "odid": 204228930717, "srid": "", "brand": "", "forPay": 782.46, "saleID": "S3080142492", "barcode": "2038421434621", "gNumber": "96085955034575031073", "sticker": "", "subject": "Масло растительное", "IsStorno": 0, "category": "Продукты", "incomeID": 8043602, "isSupply": false, "techSize": "0", "regionName": "Московская", "totalPrice": 1380, "countryName": "Россия", "finishedPrice": 808, "isRealization": true, "priceWithDisc": 869.4, "warehouseName": "Коледино", "lastChangeDate": "2022-07-21T21:00:53", "discountPercent": 37, "oblastOkrugName": "Центральный федеральный округ", "supplierArticle": "52003624003", "promoCodeDiscount": 0}	{}	2022-08-22 01:35:45.404253	2022-08-22 01:35:45.404253
16	1984	2022-07-22	{"spp": 0, "date": "2022-07-22T12:18:55", "nmId": 111885790, "odid": 600147253563, "srid": "", "brand": "Agrilife", "forPay": 820.8, "saleID": "S3081595871", "barcode": "2038421534628", "gNumber": "1307524848808056836", "sticker": "", "subject": "Масло растительное", "IsStorno": 0, "category": "Продукты", "incomeID": 8043602, "isSupply": false, "techSize": "0", "regionName": "Московская", "totalPrice": 1600, "countryName": "Россия", "finishedPrice": 848, "isRealization": true, "priceWithDisc": 912, "warehouseName": "Коледино", "lastChangeDate": "2022-07-22T12:18:57", "discountPercent": 43, "oblastOkrugName": "Центральный федеральный округ", "supplierArticle": "88571217752", "promoCodeDiscount": 0}	{}	2022-08-22 01:35:45.480968	2022-08-22 01:35:45.480968
17	1987	2022-07-22	{"spp": 0, "date": "2022-07-22T14:40:18", "nmId": 111054747, "odid": 153978775195, "srid": "", "brand": "SITIA", "forPay": 1179.9, "saleID": "S3082704656", "barcode": "5200119080658", "gNumber": "91874898440249097794", "sticker": "", "subject": "Масло растительное", "IsStorno": 0, "category": "Продукты", "incomeID": 8090310, "isSupply": false, "techSize": "0", "regionName": "Москва", "totalPrice": 2300, "countryName": "Россия", "finishedPrice": 1219, "isRealization": true, "priceWithDisc": 1311, "warehouseName": "Коледино", "lastChangeDate": "2022-07-22T14:42:17", "discountPercent": 43, "oblastOkrugName": "Центральный федеральный округ", "supplierArticle": "5200119080675200119080665", "promoCodeDiscount": 0}	{}	2022-08-22 01:35:45.548972	2022-08-22 01:35:45.548972
18	1986	2022-07-22	{"spp": 0, "date": "2022-07-22T14:41:11", "nmId": 111885790, "odid": 204229367192, "srid": "", "brand": "Agrilife", "forPay": 820.8, "saleID": "S3082704657", "barcode": "2038421534628", "gNumber": "8854644238441661165", "sticker": "", "subject": "Масло растительное", "IsStorno": 0, "category": "Продукты", "incomeID": 8043602, "isSupply": false, "techSize": "0", "regionName": "Москва", "totalPrice": 1600, "countryName": "Россия", "finishedPrice": 848, "isRealization": true, "priceWithDisc": 912, "warehouseName": "Коледино", "lastChangeDate": "2022-07-22T14:42:17", "discountPercent": 43, "oblastOkrugName": "Центральный федеральный округ", "supplierArticle": "88571217752", "promoCodeDiscount": 0}	{}	2022-08-22 01:35:45.618219	2022-08-22 01:35:45.618219
19	1988	2022-07-22	{"spp": 0, "date": "2022-07-22T18:05:13", "nmId": 111885790, "odid": 600150963072, "srid": "", "brand": "Agrilife", "forPay": 820.8, "saleID": "S3084371872", "barcode": "2038421534628", "gNumber": "97877508705221221835", "sticker": "", "subject": "Масло растительное", "IsStorno": 0, "category": "Продукты", "incomeID": 8043602, "isSupply": false, "techSize": "0", "regionName": "Санкт-Петербург", "totalPrice": 1600, "countryName": "Россия", "finishedPrice": 848, "isRealization": true, "priceWithDisc": 912, "warehouseName": "Коледино", "lastChangeDate": "2022-07-22T18:05:15", "discountPercent": 43, "oblastOkrugName": "Северо-западный федеральный округ", "supplierArticle": "88571217752", "promoCodeDiscount": 0}	{}	2022-08-22 01:35:45.683674	2022-08-22 01:35:45.683674
20	1989	2022-07-23	{"spp": 0, "date": "2022-07-23T10:09:33", "nmId": 111054747, "odid": 600152630878, "srid": "", "brand": "SITIA", "forPay": 1179.9, "saleID": "S3086091893", "barcode": "5200119080658", "gNumber": "97113180597304254700", "sticker": "", "subject": "Масло растительное", "IsStorno": 0, "category": "Продукты", "incomeID": 8090310, "isSupply": false, "techSize": "0", "regionName": "Московская", "totalPrice": 2300, "countryName": "Россия", "finishedPrice": 1219, "isRealization": true, "priceWithDisc": 1311, "warehouseName": "Коледино", "lastChangeDate": "2022-07-23T10:09:35", "discountPercent": 43, "oblastOkrugName": "Центральный федеральный округ", "supplierArticle": "5200119080675200119080665", "promoCodeDiscount": 0}	{}	2022-08-22 01:35:45.763023	2022-08-22 01:35:45.763023
21	1995	2022-07-23	{"spp": 0, "date": "2022-07-23T13:36:18", "nmId": 111054747, "odid": 153979407759, "srid": "", "brand": "SITIA", "forPay": 1179.9, "saleID": "S3087562143", "barcode": "5200119080658", "gNumber": "97744384078011599213", "sticker": "", "subject": "Масло растительное", "IsStorno": 0, "category": "Продукты", "incomeID": 8090310, "isSupply": false, "techSize": "0", "regionName": "Ростовская", "totalPrice": 2300, "countryName": "Россия", "finishedPrice": 1219, "isRealization": true, "priceWithDisc": 1311, "warehouseName": "Коледино", "lastChangeDate": "2022-07-23T13:36:52", "discountPercent": 43, "oblastOkrugName": "Южный федеральный округ", "supplierArticle": "5200119080675200119080665", "promoCodeDiscount": 0}	{}	2022-08-22 01:35:45.829542	2022-08-22 01:35:45.829542
22	1993	2022-07-23	{"spp": 0, "date": "2022-07-23T17:40:38", "nmId": 111054747, "odid": 600158671260, "srid": "", "brand": "SITIA", "forPay": 1179.9, "saleID": "S3089087802", "barcode": "5200119080658", "gNumber": "95347281468253444661", "sticker": "", "subject": "Масло растительное", "IsStorno": 0, "category": "Продукты", "incomeID": 8090310, "isSupply": false, "techSize": "0", "regionName": "Наро-Фоминский", "totalPrice": 2300, "countryName": "Россия", "finishedPrice": 1219, "isRealization": true, "priceWithDisc": 1311, "warehouseName": "Коледино", "lastChangeDate": "2022-07-23T17:42:15", "discountPercent": 43, "oblastOkrugName": "Центральный федеральный округ", "supplierArticle": "5200119080675200119080665", "promoCodeDiscount": 0}	{}	2022-08-22 01:35:45.90598	2022-08-22 01:35:45.90598
23	1991	2022-07-23	{"spp": 0, "date": "2022-07-23T19:29:43", "nmId": 111054747, "odid": 153978935640, "srid": "", "brand": "SITIA", "forPay": 1179.9, "saleID": "S3089660041", "barcode": "5200119080658", "gNumber": "2865244245494888398", "sticker": "", "subject": "Масло растительное", "IsStorno": 0, "category": "Продукты", "incomeID": 8090310, "isSupply": false, "techSize": "0", "regionName": "Москва", "totalPrice": 2300, "countryName": "Россия", "finishedPrice": 1219, "isRealization": true, "priceWithDisc": 1311, "warehouseName": "Коледино", "lastChangeDate": "2022-07-23T19:29:45", "discountPercent": 43, "oblastOkrugName": "Центральный федеральный округ", "supplierArticle": "5200119080675200119080665", "promoCodeDiscount": 0}	{}	2022-08-22 01:35:45.971672	2022-08-22 01:35:45.971672
24	1992	2022-07-23	{"spp": 0, "date": "2022-07-23T19:52:34", "nmId": 111054747, "odid": 600158432367, "srid": "", "brand": "SITIA", "forPay": 1179.9, "saleID": "S3089773220", "barcode": "5200119080658", "gNumber": "8466977207633585737", "sticker": "", "subject": "Масло растительное", "IsStorno": 0, "category": "Продукты", "incomeID": 8090310, "isSupply": false, "techSize": "0", "regionName": "Москва", "totalPrice": 2300, "countryName": "Россия", "finishedPrice": 1219, "isRealization": true, "priceWithDisc": 1311, "warehouseName": "Коледино", "lastChangeDate": "2022-07-23T19:53:48", "discountPercent": 43, "oblastOkrugName": "Центральный федеральный округ", "supplierArticle": "5200119080675200119080665", "promoCodeDiscount": 0}	{}	2022-08-22 01:35:46.038416	2022-08-22 01:35:46.038416
25	2001	2022-07-25	{"spp": 0, "date": "2022-07-25T12:23:52", "nmId": 111885790, "odid": 600175899486, "srid": "512dac4b47ab48baa2c55206acb0b5db", "brand": "Agrilife", "forPay": 820.8, "saleID": "S3096266900", "barcode": "2038421534628", "gNumber": "5751822588636929702", "sticker": "", "subject": "Масло растительное", "IsStorno": 0, "category": "Продукты", "incomeID": 8043602, "isSupply": false, "techSize": "0", "regionName": "Ногинский", "totalPrice": 1600, "countryName": "Россия", "finishedPrice": 848, "isRealization": true, "priceWithDisc": 912, "warehouseName": "Коледино", "lastChangeDate": "2022-07-25T12:23:53", "discountPercent": 43, "oblastOkrugName": "Центральный федеральный округ", "supplierArticle": "88571217752", "promoCodeDiscount": 0}	{}	2022-08-22 01:35:46.131845	2022-08-22 01:35:46.131845
26	1997	2022-07-25	{"spp": 0, "date": "2022-07-25T16:26:04", "nmId": 111054747, "odid": 600168907044, "srid": "", "brand": "SITIA", "forPay": 1179.9, "saleID": "S3098225378", "barcode": "5200119080658", "gNumber": "1470591748726580048", "sticker": "", "subject": "Масло растительное", "IsStorno": 0, "category": "Продукты", "incomeID": 7993537, "isSupply": false, "techSize": "0", "regionName": "Ступинский", "totalPrice": 2300, "countryName": "Россия", "finishedPrice": 1219, "isRealization": true, "priceWithDisc": 1311, "warehouseName": "Электросталь", "lastChangeDate": "2022-07-25T16:27:54", "discountPercent": 43, "oblastOkrugName": "Центральный федеральный округ", "supplierArticle": "5200119080675200119080665", "promoCodeDiscount": 0}	{}	2022-08-22 01:35:46.198928	2022-08-22 01:35:46.198928
27	1994	2022-07-25	{"spp": 0, "date": "2022-07-25T18:32:43", "nmId": 111054747, "odid": 600161020081, "srid": "", "brand": "SITIA", "forPay": 1179.9, "saleID": "S3099398378", "barcode": "5200119080658", "gNumber": "3813373160298109557", "sticker": "", "subject": "Масло растительное", "IsStorno": 0, "category": "Продукты", "incomeID": 8090310, "isSupply": false, "techSize": "0", "regionName": "Вологодская", "totalPrice": 2300, "countryName": "Россия", "finishedPrice": 1219, "isRealization": true, "priceWithDisc": 1311, "warehouseName": "Коледино", "lastChangeDate": "2022-07-25T18:32:43", "discountPercent": 43, "oblastOkrugName": "Северо-западный федеральный округ", "supplierArticle": "5200119080675200119080665", "promoCodeDiscount": 0}	{}	2022-08-22 01:35:46.265069	2022-08-22 01:35:46.265069
28	1975	2022-07-25	{"spp": 0, "date": "2022-07-25T16:35:13", "nmId": 111885790, "odid": 600139407427, "srid": "", "brand": "Agrilife", "forPay": 820.8, "saleID": "S3098309038", "barcode": "2038421534628", "gNumber": "5676042281785688336", "sticker": "", "subject": "Масло растительное", "IsStorno": 0, "category": "Продукты", "incomeID": 8043602, "isSupply": false, "techSize": "0", "regionName": "Новгородская", "totalPrice": 1600, "countryName": "Россия", "finishedPrice": 848, "isRealization": true, "priceWithDisc": 912, "warehouseName": "Коледино", "lastChangeDate": "2022-07-26T02:59:38", "discountPercent": 43, "oblastOkrugName": "Северо-западный федеральный округ", "supplierArticle": "88571217752", "promoCodeDiscount": 0}	{}	2022-08-22 01:35:46.379856	2022-08-22 01:35:46.379856
29	1996	2022-07-26	{"spp": 0, "date": "2022-07-26T09:04:55", "nmId": 111054747, "odid": 600164800897, "srid": "", "brand": "SITIA", "forPay": 1179.9, "saleID": "S3100791255", "barcode": "5200119080658", "gNumber": "96421026137884643653", "sticker": "", "subject": "Масло растительное", "IsStorno": 0, "category": "Продукты", "incomeID": 7993537, "isSupply": false, "techSize": "0", "regionName": "Самарская", "totalPrice": 2300, "countryName": "Россия", "finishedPrice": 1219, "isRealization": true, "priceWithDisc": 1311, "warehouseName": "Электросталь", "lastChangeDate": "2022-07-26T09:04:56", "discountPercent": 43, "oblastOkrugName": "Приволжский федеральный округ", "supplierArticle": "5200119080675200119080665", "promoCodeDiscount": 0}	{}	2022-08-22 01:35:46.445658	2022-08-22 01:35:46.445658
30	1990	2022-07-26	{"spp": 0, "date": "2022-07-26T12:26:58", "nmId": 111885412, "odid": 600153852918, "srid": "", "brand": "", "forPay": 782.46, "saleID": "S3101876239", "barcode": "2038421434621", "gNumber": "95799096078630662694", "sticker": "", "subject": "Масло растительное", "IsStorno": 0, "category": "Продукты", "incomeID": 8043602, "isSupply": false, "techSize": "0", "regionName": "Краснодарский", "totalPrice": 1380, "countryName": "Россия", "finishedPrice": 808, "isRealization": true, "priceWithDisc": 869.4, "warehouseName": "Коледино", "lastChangeDate": "2022-07-26T12:27:00", "discountPercent": 37, "oblastOkrugName": "Южный федеральный округ", "supplierArticle": "52003624003", "promoCodeDiscount": 0}	{}	2022-08-22 01:35:46.512985	2022-08-22 01:35:46.512985
31	2000	2022-07-27	{"spp": 0, "date": "2022-07-27T10:45:53", "nmId": 111054747, "odid": 600173579147, "srid": "de40ca9bc91448b4b5a42036c798b332", "brand": "SITIA", "forPay": 1179.9, "saleID": "S3106238405", "barcode": "5200119080658", "gNumber": "9615959115607551863", "sticker": "", "subject": "Масло растительное", "IsStorno": 0, "category": "Продукты", "incomeID": 7993537, "isSupply": false, "techSize": "0", "regionName": "Петровский", "totalPrice": 2300, "countryName": "Россия", "finishedPrice": 1219, "isRealization": true, "priceWithDisc": 1311, "warehouseName": "Электросталь", "lastChangeDate": "2022-07-27T10:45:53", "discountPercent": 43, "oblastOkrugName": "Северо-кавказский федеральный округ", "supplierArticle": "5200119080675200119080665", "promoCodeDiscount": 0}	{}	2022-08-22 01:35:46.588887	2022-08-22 01:35:46.588887
32	2010	2022-07-28	{"spp": 0, "date": "2022-07-28T12:22:03", "nmId": 111054747, "odid": 600196167688, "srid": "38b3710f0b92427091596393e2c446b5", "brand": "SITIA", "forPay": 1179.9, "saleID": "S3111854164", "barcode": "5200119080658", "gNumber": "96151198911222724373", "sticker": "", "subject": "Масло растительное", "IsStorno": 0, "category": "Продукты", "incomeID": 7993537, "isSupply": false, "techSize": "0", "regionName": "Москва", "totalPrice": 2300, "countryName": "Россия", "finishedPrice": 1219, "isRealization": true, "priceWithDisc": 1311, "warehouseName": "Электросталь", "lastChangeDate": "2022-07-28T12:35:56", "discountPercent": 43, "oblastOkrugName": "Центральный федеральный округ", "supplierArticle": "5200119080675200119080665", "promoCodeDiscount": 0}	{}	2022-08-22 01:35:46.665203	2022-08-22 01:35:46.665203
33	2011	2022-07-28	{"spp": 0, "date": "2022-07-28T12:22:03", "nmId": 111054747, "odid": 600196167689, "srid": "9db568d72e0643dab9ab9dce5542cd9a", "brand": "SITIA", "forPay": 1179.9, "saleID": "S3111854165", "barcode": "5200119080658", "gNumber": "96151198911222724373", "sticker": "", "subject": "Масло растительное", "IsStorno": 0, "category": "Продукты", "incomeID": 7993537, "isSupply": false, "techSize": "0", "regionName": "Москва", "totalPrice": 2300, "countryName": "Россия", "finishedPrice": 1219, "isRealization": true, "priceWithDisc": 1311, "warehouseName": "Электросталь", "lastChangeDate": "2022-07-28T12:35:56", "discountPercent": 43, "oblastOkrugName": "Центральный федеральный округ", "supplierArticle": "5200119080675200119080665", "promoCodeDiscount": 0}	{}	2022-08-22 01:35:46.734322	2022-08-22 01:35:46.734322
34	1980	2022-07-28	{"spp": 0, "date": "2022-07-28T14:07:30", "nmId": 111054747, "odid": 204228934259, "srid": "", "brand": "SITIA", "forPay": 1179.9, "saleID": "S3112583089", "barcode": "5200119080658", "gNumber": "8362120467514808912", "sticker": "", "subject": "Масло растительное", "IsStorno": 0, "category": "Продукты", "incomeID": 8090310, "isSupply": false, "techSize": "0", "regionName": "", "totalPrice": 2300, "countryName": "Россия", "finishedPrice": 1219, "isRealization": true, "priceWithDisc": 1311, "warehouseName": "Коледино", "lastChangeDate": "2022-07-28T14:16:38", "discountPercent": 43, "oblastOkrugName": "", "supplierArticle": "5200119080675200119080665", "promoCodeDiscount": 0}	{}	2022-08-22 01:35:46.801315	2022-08-22 01:35:46.801315
35	2009	2022-07-28	{"spp": 0, "date": "2022-07-28T14:59:38", "nmId": 111885790, "odid": 600194621025, "srid": "8af7ebeffdbf475b8d6ed7370ebe5247", "brand": "Agrilife", "forPay": 820.8, "saleID": "S3112913861", "barcode": "2038421534628", "gNumber": "7488614434359807523", "sticker": "", "subject": "Масло растительное", "IsStorno": 0, "category": "Продукты", "incomeID": 8043602, "isSupply": false, "techSize": "0", "regionName": "Ступинский", "totalPrice": 1600, "countryName": "Россия", "finishedPrice": 848, "isRealization": true, "priceWithDisc": 912, "warehouseName": "Коледино", "lastChangeDate": "2022-07-28T15:16:57", "discountPercent": 43, "oblastOkrugName": "Центральный федеральный округ", "supplierArticle": "88571217752", "promoCodeDiscount": 0}	{}	2022-08-22 01:35:46.884202	2022-08-22 01:35:46.884202
36	2005	2022-07-28	{"spp": 0, "date": "2022-07-28T19:02:23", "nmId": 111885790, "odid": 600190620993, "srid": "4e14a75086ec4fee8b05ee436070003a", "brand": "Agrilife", "forPay": 820.8, "saleID": "S3114783540", "barcode": "2038421534628", "gNumber": "6128164643827498750", "sticker": "", "subject": "Масло растительное", "IsStorno": 0, "category": "Продукты", "incomeID": 8043602, "isSupply": false, "techSize": "0", "regionName": "Свердловская", "totalPrice": 1600, "countryName": "Россия", "finishedPrice": 848, "isRealization": true, "priceWithDisc": 912, "warehouseName": "Коледино", "lastChangeDate": "2022-07-28T19:53:58", "discountPercent": 43, "oblastOkrugName": "Уральский федеральный округ", "supplierArticle": "88571217752", "promoCodeDiscount": 0}	{}	2022-08-22 01:35:46.960501	2022-08-22 01:35:46.960501
37	2004	2022-07-28	{"spp": 0, "date": "2022-07-28T19:02:23", "nmId": 111885790, "odid": 600190620994, "srid": "606071efeeaf4913944599a090cee1aa", "brand": "Agrilife", "forPay": 820.8, "saleID": "S3114783541", "barcode": "2038421534628", "gNumber": "6128164643827498750", "sticker": "", "subject": "Масло растительное", "IsStorno": 0, "category": "Продукты", "incomeID": 8043602, "isSupply": false, "techSize": "0", "regionName": "Свердловская", "totalPrice": 1600, "countryName": "Россия", "finishedPrice": 848, "isRealization": true, "priceWithDisc": 912, "warehouseName": "Коледино", "lastChangeDate": "2022-07-28T19:53:58", "discountPercent": 43, "oblastOkrugName": "Уральский федеральный округ", "supplierArticle": "88571217752", "promoCodeDiscount": 0}	{}	2022-08-22 01:35:47.027869	2022-08-22 01:35:47.027869
38	2003	2022-07-28	{"spp": 0, "date": "2022-07-28T19:05:20", "nmId": 111885790, "odid": 600188279865, "srid": "3620aaab54924fc6a256c0c242333ae1", "brand": "Agrilife", "forPay": 820.8, "saleID": "S3114804710", "barcode": "2038421534628", "gNumber": "7398834585738582360", "sticker": "", "subject": "Масло растительное", "IsStorno": 0, "category": "Продукты", "incomeID": 8043602, "isSupply": false, "techSize": "0", "regionName": "Люберецкий", "totalPrice": 1600, "countryName": "Россия", "finishedPrice": 848, "isRealization": true, "priceWithDisc": 912, "warehouseName": "Коледино", "lastChangeDate": "2022-07-28T19:53:58", "discountPercent": 43, "oblastOkrugName": "Центральный федеральный округ", "supplierArticle": "88571217752", "promoCodeDiscount": 0}	{}	2022-08-22 01:35:47.094761	2022-08-22 01:35:47.094761
39	2013	2022-07-28	{"spp": 0, "date": "2022-07-28T19:26:33", "nmId": 111885790, "odid": 600199663463, "srid": "49e29ebdb8db4d5d824e55ecb583bf42", "brand": "Agrilife", "forPay": 820.8, "saleID": "S3114972195", "barcode": "2038421534628", "gNumber": "94211530962406900367", "sticker": "", "subject": "Масло растительное", "IsStorno": 0, "category": "Продукты", "incomeID": 8043602, "isSupply": false, "techSize": "0", "regionName": "Москва", "totalPrice": 1600, "countryName": "Россия", "finishedPrice": 848, "isRealization": true, "priceWithDisc": 912, "warehouseName": "Коледино", "lastChangeDate": "2022-07-28T19:53:58", "discountPercent": 43, "oblastOkrugName": "Центральный федеральный округ", "supplierArticle": "88571217752", "promoCodeDiscount": 0}	{}	2022-08-22 01:35:47.162439	2022-08-22 01:35:47.162439
40	2002	2022-07-28	{"spp": 0, "date": "2022-07-28T19:30:37", "nmId": 111885790, "odid": 600179625801, "srid": "6cfaea38fa954d40a314ac89417e2fbd", "brand": "Agrilife", "forPay": 820.8, "saleID": "S3115006292", "barcode": "2038421534628", "gNumber": "4525935890234545354", "sticker": "", "subject": "Масло растительное", "IsStorno": 0, "category": "Продукты", "incomeID": 8043602, "isSupply": false, "techSize": "0", "regionName": "Москва", "totalPrice": 1600, "countryName": "Россия", "finishedPrice": 848, "isRealization": true, "priceWithDisc": 912, "warehouseName": "Коледино", "lastChangeDate": "2022-07-28T19:53:58", "discountPercent": 43, "oblastOkrugName": "Центральный федеральный округ", "supplierArticle": "88571217752", "promoCodeDiscount": 0}	{}	2022-08-22 01:35:47.244113	2022-08-22 01:35:47.244113
41	2016	2022-07-30	{"spp": 0, "date": "2022-07-30T13:22:54", "nmId": 111885790, "odid": 600203242766, "srid": "64d74142883c482f90b27d5f212a4c0e", "brand": "Agrilife", "forPay": 864, "saleID": "S3122748656", "barcode": "2038421534628", "gNumber": "3620348430354703825", "sticker": "", "subject": "Масло растительное", "IsStorno": 0, "category": "Продукты", "incomeID": 8043602, "isSupply": false, "techSize": "0", "regionName": "Одинцовский", "totalPrice": 1600, "countryName": "Россия", "finishedPrice": 892, "isRealization": true, "priceWithDisc": 960, "warehouseName": "Коледино", "lastChangeDate": "2022-07-30T13:24:15", "discountPercent": 40, "oblastOkrugName": "Центральный федеральный округ", "supplierArticle": "88571217752", "promoCodeDiscount": 0}	{}	2022-08-22 01:35:47.340351	2022-08-22 01:35:47.340351
42	1998	2022-07-31	{"spp": 0, "date": "2022-07-31T10:44:00", "nmId": 111054747, "odid": 600171379383, "srid": "", "brand": "SITIA", "forPay": 1179.9, "saleID": "S3126005915", "barcode": "5200119080658", "gNumber": "91294600139323089081", "sticker": "", "subject": "Масло растительное", "IsStorno": 0, "category": "Продукты", "incomeID": 7993537, "isSupply": false, "techSize": "0", "regionName": "Санкт-Петербург", "totalPrice": 2300, "countryName": "Россия", "finishedPrice": 1219, "isRealization": true, "priceWithDisc": 1311, "warehouseName": "Электросталь", "lastChangeDate": "2022-07-31T10:55:16", "discountPercent": 43, "oblastOkrugName": "Северо-западный федеральный округ", "supplierArticle": "5200119080675200119080665", "promoCodeDiscount": 0}	{}	2022-08-22 01:35:47.419002	2022-08-22 01:35:47.419002
43	1999	2022-07-31	{"spp": 0, "date": "2022-07-31T10:44:00", "nmId": 111054747, "odid": 600171379384, "srid": "", "brand": "SITIA", "forPay": 1179.9, "saleID": "S3126005916", "barcode": "5200119080658", "gNumber": "91294600139323089081", "sticker": "", "subject": "Масло растительное", "IsStorno": 0, "category": "Продукты", "incomeID": 7993537, "isSupply": false, "techSize": "0", "regionName": "Санкт-Петербург", "totalPrice": 2300, "countryName": "Россия", "finishedPrice": 1219, "isRealization": true, "priceWithDisc": 1311, "warehouseName": "Электросталь", "lastChangeDate": "2022-07-31T10:55:16", "discountPercent": 43, "oblastOkrugName": "Северо-западный федеральный округ", "supplierArticle": "5200119080675200119080665", "promoCodeDiscount": 0}	{}	2022-08-22 01:35:47.486676	2022-08-22 01:35:47.486676
44	2015	2022-08-01	{"spp": 0, "date": "2022-08-01T11:43:22", "nmId": 111885790, "odid": 600202425534, "srid": "dcc6bb22824b46ddbd0ec40e3d97ce3a", "brand": "Agrilife", "forPay": 864, "saleID": "S3131301794", "barcode": "2038421534628", "gNumber": "4210908460183957056", "sticker": "", "subject": "Масло растительное", "IsStorno": 0, "category": "Продукты", "incomeID": 8043602, "isSupply": false, "techSize": "0", "regionName": "Рузский", "totalPrice": 1600, "countryName": "Россия", "finishedPrice": 892, "isRealization": true, "priceWithDisc": 960, "warehouseName": "Коледино", "lastChangeDate": "2022-08-01T19:55:24", "discountPercent": 40, "oblastOkrugName": "Центральный федеральный округ", "supplierArticle": "88571217752", "promoCodeDiscount": 0}	{}	2022-08-22 01:35:47.588097	2022-08-22 01:35:47.588097
45	2012	2022-08-01	{"spp": 0, "date": "2022-08-01T11:46:21", "nmId": 111054747, "odid": 600196536692, "srid": "0c6aad59ca0f46aab4b2915a74b0f1ff", "brand": "SITIA", "forPay": 1179.9, "saleID": "S3131345849", "barcode": "5200119080658", "gNumber": "6366956790700882173", "sticker": "", "subject": "Масло растительное", "IsStorno": 0, "category": "Продукты", "incomeID": 7993537, "isSupply": false, "techSize": "0", "regionName": "Москва", "totalPrice": 2300, "countryName": "Россия", "finishedPrice": 1219, "isRealization": true, "priceWithDisc": 1311, "warehouseName": "Электросталь", "lastChangeDate": "2022-08-01T19:55:24", "discountPercent": 43, "oblastOkrugName": "Центральный федеральный округ", "supplierArticle": "5200119080675200119080665", "promoCodeDiscount": 0}	{}	2022-08-22 01:35:47.669662	2022-08-22 01:35:47.669662
46	2008	2022-08-02	{"spp": 0, "date": "2022-08-02T09:19:57", "nmId": 111885790, "odid": 600193184828, "srid": "d160e247421d49adb2c889ef6065fe15", "brand": "Agrilife", "forPay": 820.8, "saleID": "S3136063385", "barcode": "2038421534628", "gNumber": "1801988205184965912", "sticker": "", "subject": "Масло растительное", "IsStorno": 0, "category": "Продукты", "incomeID": 8043602, "isSupply": false, "techSize": "0", "regionName": "Новосибирская", "totalPrice": 1600, "countryName": "Россия", "finishedPrice": 848, "isRealization": true, "priceWithDisc": 912, "warehouseName": "Коледино", "lastChangeDate": "2022-08-02T09:19:59", "discountPercent": 43, "oblastOkrugName": "Сибирский федеральный округ", "supplierArticle": "88571217752", "promoCodeDiscount": 0}	{}	2022-08-22 01:35:47.737541	2022-08-22 01:35:47.737541
47	2007	2022-08-05	{"spp": 0, "date": "2022-08-05T11:02:56", "nmId": 111885790, "odid": 600190632273, "srid": "27d7ddbd9214423b9c9ff21b00ab810d", "brand": "Agrilife", "forPay": 820.8, "saleID": "S3151874342", "barcode": "2038421534628", "gNumber": "57178571003800884", "sticker": "", "subject": "Масло растительное", "IsStorno": 0, "category": "Продукты", "incomeID": 8043602, "isSupply": false, "techSize": "0", "regionName": "Москва", "totalPrice": 1600, "countryName": "Россия", "finishedPrice": 848, "isRealization": true, "priceWithDisc": 912, "warehouseName": "Коледино", "lastChangeDate": "2022-08-05T11:26:50", "discountPercent": 43, "oblastOkrugName": "Центральный федеральный округ", "supplierArticle": "88571217752", "promoCodeDiscount": 0}	{}	2022-08-22 01:35:47.842879	2022-08-22 01:35:47.842879
48	2006	2022-08-05	{"spp": 0, "date": "2022-08-05T11:02:56", "nmId": 111885790, "odid": 600190632274, "srid": "8cd42a8c7c3744f68d4ab1e9bdedf279", "brand": "Agrilife", "forPay": 820.8, "saleID": "S3151881074", "barcode": "2038421534628", "gNumber": "57178571003800884", "sticker": "", "subject": "Масло растительное", "IsStorno": 0, "category": "Продукты", "incomeID": 8043602, "isSupply": false, "techSize": "0", "regionName": "Москва", "totalPrice": 1600, "countryName": "Россия", "finishedPrice": 848, "isRealization": true, "priceWithDisc": 912, "warehouseName": "Коледино", "lastChangeDate": "2022-08-05T11:26:50", "discountPercent": 43, "oblastOkrugName": "Центральный федеральный округ", "supplierArticle": "88571217752", "promoCodeDiscount": 0}	{}	2022-08-22 01:35:47.924519	2022-08-22 01:35:47.924519
49	2018	2022-08-09	{"spp": 0, "date": "2022-08-09T15:11:29", "nmId": 111054747, "odid": 600249951180, "srid": "6197b3ccfb1c42d281111bb0446fe4c6", "brand": "SITIA", "forPay": 1242, "saleID": "S3174271572", "barcode": "5200119080658", "gNumber": "95415108544644604867", "sticker": "", "subject": "Масло растительное", "IsStorno": 0, "category": "Продукты", "incomeID": 7993537, "isSupply": false, "techSize": "0", "regionName": "Челябинская", "totalPrice": 2300, "countryName": "Россия", "finishedPrice": 1283, "isRealization": true, "priceWithDisc": 1380, "warehouseName": "Электросталь", "lastChangeDate": "2022-08-09T15:13:18", "discountPercent": 40, "oblastOkrugName": "Уральский федеральный округ", "supplierArticle": "5200119080675200119080665", "promoCodeDiscount": 0}	{}	2022-08-22 01:35:48.021719	2022-08-22 01:35:48.021719
50	2021	2022-08-09	{"spp": 0, "date": "2022-08-09T17:41:04", "nmId": 111054747, "odid": 600272858521, "srid": "7ef304296e8c4a5a8060e9b45546d78c", "brand": "SITIA", "forPay": 1242, "saleID": "S3175439407", "barcode": "5200119080658", "gNumber": "9933062305047903110", "sticker": "", "subject": "Масло растительное", "IsStorno": 0, "category": "Продукты", "incomeID": 8289487, "isSupply": false, "techSize": "0", "regionName": "Москва", "totalPrice": 2300, "countryName": "Россия", "finishedPrice": 1283, "isRealization": true, "priceWithDisc": 1380, "warehouseName": "Электросталь", "lastChangeDate": "2022-08-09T17:41:07", "discountPercent": 40, "oblastOkrugName": "Центральный федеральный округ", "supplierArticle": "5200119080675200119080665", "promoCodeDiscount": 0}	{}	2022-08-22 01:35:48.089325	2022-08-22 01:35:48.089325
51	2019	2022-08-09	{"spp": 0, "date": "2022-08-09T17:55:11", "nmId": 111885412, "odid": 600272376957, "srid": "443be8b50d3745ad98e59c95ba1cbe5f", "brand": "", "forPay": 819.72, "saleID": "S3175597630", "barcode": "2038421434621", "gNumber": "94194054761919148197", "sticker": "", "subject": "Масло растительное", "IsStorno": 0, "category": "Продукты", "incomeID": 8043602, "isSupply": false, "techSize": "0", "regionName": "Москва", "totalPrice": 1380, "countryName": "Россия", "finishedPrice": 847, "isRealization": true, "priceWithDisc": 910.8, "warehouseName": "Коледино", "lastChangeDate": "2022-08-09T17:55:11", "discountPercent": 34, "oblastOkrugName": "Центральный федеральный округ", "supplierArticle": "52003624003", "promoCodeDiscount": 0}	{}	2022-08-22 01:35:48.158426	2022-08-22 01:35:48.158426
52	2020	2022-08-11	{"spp": 0, "date": "2022-08-11T10:23:50", "nmId": 111885412, "odid": 600272561453, "srid": "dc336a991a644c9e96323756ba2048c1", "brand": "", "forPay": 819.72, "saleID": "S3183216987", "barcode": "2038421434621", "gNumber": "3048564789316995200", "sticker": "", "subject": "Масло растительное", "IsStorno": 0, "category": "Продукты", "incomeID": 8043602, "isSupply": false, "techSize": "0", "regionName": "Конаковский", "totalPrice": 1380, "countryName": "Россия", "finishedPrice": 847, "isRealization": true, "priceWithDisc": 910.8, "warehouseName": "Коледино", "lastChangeDate": "2022-08-11T10:42:40", "discountPercent": 34, "oblastOkrugName": "Центральный федеральный округ", "supplierArticle": "52003624003", "promoCodeDiscount": 0}	{}	2022-08-22 01:35:48.236185	2022-08-22 01:35:48.236185
53	2023	2022-08-11	{"spp": 0, "date": "2022-08-11T11:42:36", "nmId": 111885790, "odid": 600274374720, "srid": "75e04e150913452fa30807c5a4314231", "brand": "Agrilife", "forPay": 936, "saleID": "S3183747651", "barcode": "2038421534628", "gNumber": "94562563846274115127", "sticker": "", "subject": "Масло растительное", "IsStorno": 0, "category": "Продукты", "incomeID": 8289487, "isSupply": false, "techSize": "0", "regionName": "Сергачский", "totalPrice": 1600, "countryName": "Россия", "finishedPrice": 967, "isRealization": true, "priceWithDisc": 1040, "warehouseName": "Электросталь", "lastChangeDate": "2022-08-11T11:52:56", "discountPercent": 35, "oblastOkrugName": "Приволжский федеральный округ", "supplierArticle": "88571217752", "promoCodeDiscount": 0}	{}	2022-08-22 01:35:48.304068	2022-08-22 01:35:48.304068
54	2017	2022-08-11	{"spp": 0, "date": "2022-08-11T12:11:45", "nmId": 111885412, "odid": 600235894767, "srid": "a878818ea75b49cb9802ee8029606a50", "brand": "", "forPay": 819.72, "saleID": "S3183941441", "barcode": "2038421434621", "gNumber": "7242426344474603929", "sticker": "", "subject": "Масло растительное", "IsStorno": 0, "category": "Продукты", "incomeID": 8043602, "isSupply": false, "techSize": "0", "regionName": "Краснодарский", "totalPrice": 1380, "countryName": "Россия", "finishedPrice": 847, "isRealization": true, "priceWithDisc": 910.8, "warehouseName": "Коледино", "lastChangeDate": "2022-08-11T12:45:45", "discountPercent": 34, "oblastOkrugName": "Южный федеральный округ", "supplierArticle": "52003624003", "promoCodeDiscount": 0}	{}	2022-08-22 01:35:48.372121	2022-08-22 01:35:48.372121
55	2022	2022-08-12	{"spp": 0, "date": "2022-08-12T20:49:46", "nmId": 111885790, "odid": 600274533839, "srid": "73422c4db360481a926191f9a7765f38", "brand": "Agrilife", "forPay": 936, "saleID": "S3193845408", "barcode": "2038421534628", "gNumber": "9383199879809143208", "sticker": "", "subject": "Масло растительное", "IsStorno": 0, "category": "Продукты", "incomeID": 8289487, "isSupply": false, "techSize": "0", "regionName": "Одинцовский", "totalPrice": 1600, "countryName": "Россия", "finishedPrice": 967, "isRealization": true, "priceWithDisc": 1040, "warehouseName": "Электросталь", "lastChangeDate": "2022-08-12T20:49:48", "discountPercent": 35, "oblastOkrugName": "Центральный федеральный округ", "supplierArticle": "88571217752", "promoCodeDiscount": 0}	{}	2022-08-22 01:35:48.561522	2022-08-22 01:35:48.561522
56	2027	2022-08-13	{"spp": 0, "date": "2022-08-13T20:24:35", "nmId": 111885790, "odid": 600296685319, "srid": "a9c2f88cd95c4b50a0c30c20a4d1339c", "brand": "Agrilife", "forPay": 936, "saleID": "S3198551767", "barcode": "2038421534628", "gNumber": "3353758124037934027", "sticker": "", "subject": "Масло растительное", "IsStorno": 0, "category": "Продукты", "incomeID": 8289487, "isSupply": false, "techSize": "0", "regionName": "Москва", "totalPrice": 1600, "countryName": "Россия", "finishedPrice": 967, "isRealization": true, "priceWithDisc": 1040, "warehouseName": "Электросталь", "lastChangeDate": "2022-08-13T20:26:22", "discountPercent": 35, "oblastOkrugName": "Центральный федеральный округ", "supplierArticle": "88571217752", "promoCodeDiscount": 0}	{}	2022-08-22 01:35:48.630879	2022-08-22 01:35:48.630879
57	2024	2022-08-14	{"spp": 0, "date": "2022-08-14T09:21:11", "nmId": 111885790, "odid": 600279927888, "srid": "12e2ec22b131442c94df62c0e273097a", "brand": "Agrilife", "forPay": 936, "saleID": "S3198992618", "barcode": "2038421534628", "gNumber": "112326026459124396", "sticker": "", "subject": "Масло растительное", "IsStorno": 0, "category": "Продукты", "incomeID": 8289487, "isSupply": false, "techSize": "0", "regionName": "Саратовская", "totalPrice": 1600, "countryName": "Россия", "finishedPrice": 967, "isRealization": true, "priceWithDisc": 1040, "warehouseName": "Электросталь", "lastChangeDate": "2022-08-14T09:21:14", "discountPercent": 35, "oblastOkrugName": "Приволжский федеральный округ", "supplierArticle": "88571217752", "promoCodeDiscount": 0}	{}	2022-08-22 01:35:48.698523	2022-08-22 01:35:48.698523
58	2032	2022-08-15	{"spp": 0, "date": "2022-08-15T15:12:47", "nmId": 111885790, "odid": 600302206714, "srid": "3813f64f3a68478dae58cbf75a1c3858", "brand": "Agrilife", "forPay": 936, "saleID": "S3207136782", "barcode": "2038421534628", "gNumber": "5353101156418595165", "sticker": "", "subject": "Масло растительное", "IsStorno": 0, "category": "Продукты", "incomeID": 8289487, "isSupply": false, "techSize": "0", "regionName": "Краснодарский", "totalPrice": 1600, "countryName": "Россия", "finishedPrice": 967, "isRealization": true, "priceWithDisc": 1040, "warehouseName": "Электросталь", "lastChangeDate": "2022-08-15T15:13:19", "discountPercent": 35, "oblastOkrugName": "Южный федеральный округ", "supplierArticle": "88571217752", "promoCodeDiscount": 0}	{}	2022-08-22 01:35:48.848237	2022-08-22 01:35:48.848237
59	2033	2022-08-15	{"spp": 0, "date": "2022-08-15T15:12:33", "nmId": 111054747, "odid": 600303430530, "srid": "782d1be90d7b442395a9ebfaa93624fb", "brand": "SITIA", "forPay": 1449, "saleID": "S3207149237", "barcode": "5200119080658", "gNumber": "6650807452502100634", "sticker": "", "subject": "Масло растительное", "IsStorno": 0, "category": "Продукты", "incomeID": 8289487, "isSupply": false, "techSize": "0", "regionName": "Киржачский", "totalPrice": 2300, "countryName": "Россия", "finishedPrice": 1497, "isRealization": true, "priceWithDisc": 1610, "warehouseName": "Электросталь", "lastChangeDate": "2022-08-15T15:13:51", "discountPercent": 30, "oblastOkrugName": "Центральный федеральный округ", "supplierArticle": "5200119080675200119080665", "promoCodeDiscount": 0}	{}	2022-08-22 01:35:48.916824	2022-08-22 01:35:48.916824
60	2026	2022-08-15	{"spp": 0, "date": "2022-08-15T15:53:24", "nmId": 111885790, "odid": 600293700448, "srid": "23dd77e1c4a0487fb11ff8c5b7a7b64a", "brand": "Agrilife", "forPay": 936, "saleID": "S3207490008", "barcode": "2038421534628", "gNumber": "96985023859618718223", "sticker": "", "subject": "Масло растительное", "IsStorno": 0, "category": "Продукты", "incomeID": 8289487, "isSupply": false, "techSize": "0", "regionName": "Тахтамукайский", "totalPrice": 1600, "countryName": "Россия", "finishedPrice": 967, "isRealization": true, "priceWithDisc": 1040, "warehouseName": "Электросталь", "lastChangeDate": "2022-08-15T15:53:25", "discountPercent": 35, "oblastOkrugName": "Южный федеральный округ", "supplierArticle": "88571217752", "promoCodeDiscount": 0}	{}	2022-08-22 01:35:48.986297	2022-08-22 01:35:48.986297
61	2025	2022-08-16	{"spp": 0, "date": "2022-08-16T08:33:00", "nmId": 111054747, "odid": 600291639103, "srid": "20efd9b0b32d43638724de470c570a27", "brand": "SITIA", "forPay": 1449, "saleID": "S3210644684", "barcode": "5200119080658", "gNumber": "2797689864101004028", "sticker": "", "subject": "Масло растительное", "IsStorno": 0, "category": "Продукты", "incomeID": 8289487, "isSupply": false, "techSize": "0", "regionName": "Ханты-Мансийский Автономный округ - Югра", "totalPrice": 2300, "countryName": "Россия", "finishedPrice": 1497, "isRealization": true, "priceWithDisc": 1610, "warehouseName": "Электросталь", "lastChangeDate": "2022-08-16T08:33:49", "discountPercent": 30, "oblastOkrugName": "Уральский федеральный округ", "supplierArticle": "5200119080675200119080665", "promoCodeDiscount": 0}	{}	2022-08-22 01:35:49.055345	2022-08-22 01:35:49.055345
62	2034	2022-08-16	{"spp": 0, "date": "2022-08-16T18:08:04", "nmId": 111054747, "odid": 600311587117, "srid": "df0d5770b9e4416cbc7fa5336a90bf0e", "brand": "SITIA", "forPay": 1449, "saleID": "S3214660852", "barcode": "5200119080658", "gNumber": "95651630649789905794", "sticker": "", "subject": "Масло растительное", "IsStorno": 0, "category": "Продукты", "incomeID": 8289487, "isSupply": false, "techSize": "0", "regionName": "Москва", "totalPrice": 2300, "countryName": "Россия", "finishedPrice": 1497, "isRealization": true, "priceWithDisc": 1610, "warehouseName": "Электросталь", "lastChangeDate": "2022-08-16T18:09:26", "discountPercent": 30, "oblastOkrugName": "Центральный федеральный округ", "supplierArticle": "5200119080675200119080665", "promoCodeDiscount": 0}	{}	2022-08-22 01:35:49.13301	2022-08-22 01:35:49.13301
63	2029	2022-08-17	{"spp": 0, "date": "2022-08-17T15:08:12", "nmId": 111054747, "odid": 600300070142, "srid": "1dc13ac3fbb349f68f1be08f02d53ac7", "brand": "SITIA", "forPay": 1449, "saleID": "S3218642263", "barcode": "5200119080658", "gNumber": "3209452697745985626", "sticker": "", "subject": "Масло растительное", "IsStorno": 0, "category": "Продукты", "incomeID": 8289487, "isSupply": false, "techSize": "0", "regionName": "", "totalPrice": 2300, "countryName": "Россия", "finishedPrice": 1497, "isRealization": true, "priceWithDisc": 1610, "warehouseName": "Электросталь", "lastChangeDate": "2022-08-17T15:08:33", "discountPercent": 30, "oblastOkrugName": "", "supplierArticle": "5200119080675200119080665", "promoCodeDiscount": 0}	{}	2022-08-22 01:35:49.211016	2022-08-22 01:35:49.211016
64	2031	2022-08-17	{"spp": 0, "date": "2022-08-17T15:08:12", "nmId": 111054747, "odid": 600300070143, "srid": "7b461b1071334139a620621b8d57df5a", "brand": "SITIA", "forPay": 1449, "saleID": "S3218642264", "barcode": "5200119080658", "gNumber": "3209452697745985626", "sticker": "", "subject": "Масло растительное", "IsStorno": 0, "category": "Продукты", "incomeID": 8289487, "isSupply": false, "techSize": "0", "regionName": "", "totalPrice": 2300, "countryName": "Россия", "finishedPrice": 1497, "isRealization": true, "priceWithDisc": 1610, "warehouseName": "Электросталь", "lastChangeDate": "2022-08-17T15:08:33", "discountPercent": 30, "oblastOkrugName": "", "supplierArticle": "5200119080675200119080665", "promoCodeDiscount": 0}	{}	2022-08-22 01:35:49.280843	2022-08-22 01:35:49.280843
65	2036	2022-08-17	{"spp": 0, "date": "2022-08-17T17:56:41", "nmId": 111885790, "odid": 600315509249, "srid": "d121e88bb9c34f73a7cec666320777b3", "brand": "Agrilife", "forPay": 936, "saleID": "S3220031195", "barcode": "2038421534628", "gNumber": "9211078837184080794", "sticker": "", "subject": "Масло растительное", "IsStorno": 0, "category": "Продукты", "incomeID": 8289487, "isSupply": false, "techSize": "0", "regionName": "Башкортостан", "totalPrice": 1600, "countryName": "Россия", "finishedPrice": 967, "isRealization": true, "priceWithDisc": 1040, "warehouseName": "Электросталь", "lastChangeDate": "2022-08-17T17:56:44", "discountPercent": 35, "oblastOkrugName": "Приволжский федеральный округ", "supplierArticle": "88571217752", "promoCodeDiscount": 0}	{}	2022-08-22 01:35:49.34929	2022-08-22 01:35:49.34929
67	2039	2022-08-21	{"spp": 0, "date": "2022-08-21T14:37:22", "nmId": 111054747, "odid": 600332866615, "srid": "2433320fb3b6477780bc9270a95b984e", "brand": "SITIA", "forPay": 1449, "saleID": "S3239623675", "barcode": "5200119080658", "gNumber": "8840177092719217170", "sticker": "", "subject": "Масло растительное", "IsStorno": 0, "category": "Продукты", "incomeID": 8289487, "isSupply": false, "techSize": "0", "regionName": "Московская", "totalPrice": 2300, "countryName": "Россия", "finishedPrice": 1497, "isRealization": true, "priceWithDisc": 1610, "warehouseName": "Электросталь", "lastChangeDate": "2022-08-21T14:41:33", "discountPercent": 30, "oblastOkrugName": "Центральный федеральный округ", "supplierArticle": "5200119080675200119080665", "promoCodeDiscount": 0}	{}	2022-08-22 01:35:49.596145	2022-08-22 01:35:49.596145
68	2037	2022-08-22	{"spp": 0, "date": "2022-08-22T08:44:37", "nmId": 111885790, "odid": 153983955876, "srid": "", "brand": "Agrilife", "forPay": 936, "saleID": "S3242525026", "barcode": "2038421534628", "gNumber": "91462214747397795886", "sticker": "", "subject": "Масло растительное", "IsStorno": 0, "category": "Продукты", "incomeID": 8289487, "isSupply": false, "techSize": "0", "regionName": "Иркутская", "totalPrice": 1600, "countryName": "Россия", "finishedPrice": 967, "isRealization": true, "priceWithDisc": 1040, "warehouseName": "Электросталь", "lastChangeDate": "2022-08-22T09:03:36", "discountPercent": 35, "oblastOkrugName": "Сибирский федеральный округ", "supplierArticle": "88571217752", "promoCodeDiscount": 0}	{}	2022-08-22 07:49:03.348718	2022-08-22 07:49:03.348718
69	2130	2022-07-18	{"spp": 0, "date": "2022-07-18T10:36:36", "nmId": 111345604, "odid": 600132680227, "srid": "", "brand": "SITIA", "forPay": 3100.5, "saleID": "S3059410185", "barcode": "2037838726626", "gNumber": "95849983232279950061", "sticker": "", "subject": "Масло растительное", "IsStorno": 0, "category": "Продукты", "incomeID": 8043602, "isSupply": false, "techSize": "0", "regionName": "", "totalPrice": 6500, "countryName": "Россия", "finishedPrice": 3203, "isRealization": true, "priceWithDisc": 3445, "warehouseName": "Коледино", "lastChangeDate": "2022-07-18T10:45:36", "discountPercent": 47, "oblastOkrugName": "", "supplierArticle": "5200102953203", "promoCodeDiscount": 0}	{}	2022-08-23 13:08:27.882345	2022-08-23 13:08:27.882345
70	2132	2022-07-19	{"spp": 0, "date": "2022-07-19T12:07:23", "nmId": 111345604, "odid": 600139759628, "srid": "", "brand": "SITIA", "forPay": 3100.5, "saleID": "S3065188976", "barcode": "2037838726626", "gNumber": "7308572348206459419", "sticker": "", "subject": "Масло растительное", "IsStorno": 0, "category": "Продукты", "incomeID": 8043602, "isSupply": false, "techSize": "0", "regionName": "Москва", "totalPrice": 6500, "countryName": "Россия", "finishedPrice": 3203, "isRealization": true, "priceWithDisc": 3445, "warehouseName": "Коледино", "lastChangeDate": "2022-07-19T12:07:25", "discountPercent": 47, "oblastOkrugName": "Центральный федеральный округ", "supplierArticle": "5200102953203", "promoCodeDiscount": 0}	{}	2022-08-23 13:08:27.890888	2022-08-23 13:08:27.890888
71	2131	2022-07-19	{"spp": 0, "date": "2022-07-19T12:11:56", "nmId": 111345604, "odid": 600139460403, "srid": "", "brand": "SITIA", "forPay": 3100.5, "saleID": "S3065211754", "barcode": "2037838726626", "gNumber": "483406354084924592", "sticker": "", "subject": "Масло растительное", "IsStorno": 0, "category": "Продукты", "incomeID": 8043602, "isSupply": false, "techSize": "0", "regionName": "Москва", "totalPrice": 6500, "countryName": "Россия", "finishedPrice": 3203, "isRealization": true, "priceWithDisc": 3445, "warehouseName": "Коледино", "lastChangeDate": "2022-07-19T12:11:59", "discountPercent": 47, "oblastOkrugName": "Центральный федеральный округ", "supplierArticle": "5200102953203", "promoCodeDiscount": 0}	{}	2022-08-23 13:08:27.894823	2022-08-23 13:08:27.894823
72	2133	2022-07-19	{"spp": 0, "date": "2022-07-19T12:29:27", "nmId": 111345626, "odid": 600139897663, "srid": "", "brand": "KOKO", "forPay": 718.2, "saleID": "S3065328221", "barcode": "2037838797626", "gNumber": "6568538446932443158", "sticker": "", "subject": "Масло растительное", "IsStorno": 0, "category": "Продукты", "incomeID": 8090310, "isSupply": false, "techSize": "0", "regionName": "Москва", "totalPrice": 1330, "countryName": "Россия", "finishedPrice": 742, "isRealization": true, "priceWithDisc": 798, "warehouseName": "Коледино", "lastChangeDate": "2022-07-19T12:29:28", "discountPercent": 40, "oblastOkrugName": "Центральный федеральный округ", "supplierArticle": "5205657000631", "promoCodeDiscount": 0}	{}	2022-08-23 13:08:27.898878	2022-08-23 13:08:27.898878
73	2134	2022-07-19	{"spp": 0, "date": "2022-07-19T12:29:27", "nmId": 111345626, "odid": 600139897664, "srid": "", "brand": "KOKO", "forPay": 718.2, "saleID": "S3065328222", "barcode": "2037838797626", "gNumber": "6568538446932443158", "sticker": "", "subject": "Масло растительное", "IsStorno": 0, "category": "Продукты", "incomeID": 8090310, "isSupply": false, "techSize": "0", "regionName": "Москва", "totalPrice": 1330, "countryName": "Россия", "finishedPrice": 742, "isRealization": true, "priceWithDisc": 798, "warehouseName": "Коледино", "lastChangeDate": "2022-07-19T12:29:28", "discountPercent": 40, "oblastOkrugName": "Центральный федеральный округ", "supplierArticle": "5205657000631", "promoCodeDiscount": 0}	{}	2022-08-23 13:08:27.903427	2022-08-23 13:08:27.903427
74	2136	2022-07-22	{"spp": 0, "date": "2022-07-22T11:28:11", "nmId": 111345604, "odid": 600146999500, "srid": "", "brand": "SITIA", "forPay": 3100.5, "saleID": "S3081227306", "barcode": "2037838726626", "gNumber": "93561166377180680035", "sticker": "", "subject": "Масло растительное", "IsStorno": 0, "category": "Продукты", "incomeID": 8043602, "isSupply": false, "techSize": "0", "regionName": "Свердловская", "totalPrice": 6500, "countryName": "Россия", "finishedPrice": 3203, "isRealization": true, "priceWithDisc": 3445, "warehouseName": "Коледино", "lastChangeDate": "2022-07-22T11:29:33", "discountPercent": 47, "oblastOkrugName": "Уральский федеральный округ", "supplierArticle": "5200102953203", "promoCodeDiscount": 0}	{}	2022-08-23 13:08:27.909262	2022-08-23 13:08:27.909262
75	2135	2022-07-22	{"spp": 0, "date": "2022-07-22T20:48:53", "nmId": 111345626, "odid": 600140138040, "srid": "", "brand": "KOKO", "forPay": 718.2, "saleID": "S3085550279", "barcode": "2037838797626", "gNumber": "8509170295159338864", "sticker": "", "subject": "Масло растительное", "IsStorno": 0, "category": "Продукты", "incomeID": 8090310, "isSupply": false, "techSize": "0", "regionName": "Московская", "totalPrice": 1330, "countryName": "Россия", "finishedPrice": 742, "isRealization": true, "priceWithDisc": 798, "warehouseName": "Коледино", "lastChangeDate": "2022-07-22T20:49:57", "discountPercent": 40, "oblastOkrugName": "Центральный федеральный округ", "supplierArticle": "5205657000631", "promoCodeDiscount": 0}	{}	2022-08-23 13:08:27.913454	2022-08-23 13:08:27.913454
76	2139	2022-07-23	{"spp": 0, "date": "2022-07-23T17:11:51", "nmId": 111345604, "odid": 600162401427, "srid": "", "brand": "SITIA", "forPay": 3100.5, "saleID": "S3088925583", "barcode": "2037838726626", "gNumber": "3703647424560264279", "sticker": "", "subject": "Масло растительное", "IsStorno": 0, "category": "Продукты", "incomeID": 8043602, "isSupply": false, "techSize": "0", "regionName": "Саратовская", "totalPrice": 6500, "countryName": "Россия", "finishedPrice": 3203, "isRealization": true, "priceWithDisc": 3445, "warehouseName": "Коледино", "lastChangeDate": "2022-07-23T17:13:30", "discountPercent": 47, "oblastOkrugName": "Приволжский федеральный округ", "supplierArticle": "5200102953203", "promoCodeDiscount": 0}	{}	2022-08-23 13:08:27.918011	2022-08-23 13:08:27.918011
77	2140	2022-07-24	{"spp": 0, "date": "2022-07-24T15:15:36", "nmId": 111345626, "odid": 153979561610, "srid": "", "brand": "KOKO", "forPay": 718.2, "saleID": "S3092615464", "barcode": "2037838797626", "gNumber": "49649777041137539", "sticker": "", "subject": "Масло растительное", "IsStorno": 0, "category": "Продукты", "incomeID": 8090310, "isSupply": false, "techSize": "0", "regionName": "Московская", "totalPrice": 1330, "countryName": "Россия", "finishedPrice": 742, "isRealization": true, "priceWithDisc": 798, "warehouseName": "Коледино", "lastChangeDate": "2022-07-24T15:15:37", "discountPercent": 40, "oblastOkrugName": "Центральный федеральный округ", "supplierArticle": "5205657000631", "promoCodeDiscount": 0}	{}	2022-08-23 13:08:27.922099	2022-08-23 13:08:27.922099
78	2144	2022-07-25	{"spp": 0, "date": "2022-07-25T19:07:51", "nmId": 111345626, "odid": 600168843731, "srid": "", "brand": "KOKO", "forPay": 718.2, "saleID": "S3099753019", "barcode": "2037838797626", "gNumber": "91907794538854392675", "sticker": "", "subject": "Масло растительное", "IsStorno": 0, "category": "Продукты", "incomeID": 8090310, "isSupply": false, "techSize": "0", "regionName": "Боровский", "totalPrice": 1330, "countryName": "Россия", "finishedPrice": 742, "isRealization": true, "priceWithDisc": 798, "warehouseName": "Коледино", "lastChangeDate": "2022-07-25T19:08:49", "discountPercent": 40, "oblastOkrugName": "Центральный федеральный округ", "supplierArticle": "5205657000631", "promoCodeDiscount": 0}	{}	2022-08-23 13:08:27.92656	2022-08-23 13:08:27.92656
79	2141	2022-07-25	{"spp": 0, "date": "2022-07-25T19:07:51", "nmId": 111345626, "odid": 600168843733, "srid": "", "brand": "KOKO", "forPay": 718.2, "saleID": "S3099759965", "barcode": "2037838797626", "gNumber": "91907794538854392675", "sticker": "", "subject": "Масло растительное", "IsStorno": 0, "category": "Продукты", "incomeID": 8090310, "isSupply": false, "techSize": "0", "regionName": "Боровский", "totalPrice": 1330, "countryName": "Россия", "finishedPrice": 742, "isRealization": true, "priceWithDisc": 798, "warehouseName": "Коледино", "lastChangeDate": "2022-07-25T19:08:49", "discountPercent": 40, "oblastOkrugName": "Центральный федеральный округ", "supplierArticle": "5205657000631", "promoCodeDiscount": 0}	{}	2022-08-23 13:08:27.930288	2022-08-23 13:08:27.930288
80	2142	2022-07-25	{"spp": 0, "date": "2022-07-25T19:07:51", "nmId": 111345626, "odid": 600168843737, "srid": "", "brand": "KOKO", "forPay": 718.2, "saleID": "S3099767732", "barcode": "2037838797626", "gNumber": "91907794538854392675", "sticker": "", "subject": "Масло растительное", "IsStorno": 0, "category": "Продукты", "incomeID": 8090310, "isSupply": false, "techSize": "0", "regionName": "Боровский", "totalPrice": 1330, "countryName": "Россия", "finishedPrice": 742, "isRealization": true, "priceWithDisc": 798, "warehouseName": "Коледино", "lastChangeDate": "2022-07-25T19:08:49", "discountPercent": 40, "oblastOkrugName": "Центральный федеральный округ", "supplierArticle": "5205657000631", "promoCodeDiscount": 0}	{}	2022-08-23 13:08:27.934076	2022-08-23 13:08:27.934076
81	2143	2022-07-25	{"spp": 0, "date": "2022-07-25T19:07:51", "nmId": 111345626, "odid": 600168843732, "srid": "", "brand": "KOKO", "forPay": 718.2, "saleID": "S3099775497", "barcode": "2037838797626", "gNumber": "91907794538854392675", "sticker": "", "subject": "Масло растительное", "IsStorno": 0, "category": "Продукты", "incomeID": 8090310, "isSupply": false, "techSize": "0", "regionName": "Боровский", "totalPrice": 1330, "countryName": "Россия", "finishedPrice": 742, "isRealization": true, "priceWithDisc": 798, "warehouseName": "Коледино", "lastChangeDate": "2022-07-25T19:08:49", "discountPercent": 40, "oblastOkrugName": "Центральный федеральный округ", "supplierArticle": "5205657000631", "promoCodeDiscount": 0}	{}	2022-08-23 13:08:27.937782	2022-08-23 13:08:27.937782
82	2145	2022-07-26	{"spp": 0, "date": "2022-07-26T19:34:10", "nmId": 111345626, "odid": 600187156771, "srid": "05784bd001774ae09e42c1841cdb779a", "brand": "KOKO", "forPay": 718.2, "saleID": "S3105057883", "barcode": "2037838797626", "gNumber": "7004640160762623242", "sticker": "", "subject": "Масло растительное", "IsStorno": 0, "category": "Продукты", "incomeID": 8090310, "isSupply": false, "techSize": "0", "regionName": "Москва", "totalPrice": 1330, "countryName": "Россия", "finishedPrice": 742, "isRealization": true, "priceWithDisc": 798, "warehouseName": "Коледино", "lastChangeDate": "2022-07-26T19:35:13", "discountPercent": 40, "oblastOkrugName": "Центральный федеральный округ", "supplierArticle": "5205657000631", "promoCodeDiscount": 0}	{}	2022-08-23 13:08:27.941448	2022-08-23 13:08:27.941448
83	2137	2022-07-27	{"spp": 0, "date": "2022-07-27T17:58:42", "nmId": 111345604, "odid": 600152933136, "srid": "", "brand": "SITIA", "forPay": 3100.5, "saleID": "S3109237239", "barcode": "2037838726626", "gNumber": "5320712506374638688", "sticker": "", "subject": "Масло растительное", "IsStorno": 0, "category": "Продукты", "incomeID": 8043602, "isSupply": false, "techSize": "0", "regionName": "Москва", "totalPrice": 6500, "countryName": "Россия", "finishedPrice": 3203, "isRealization": true, "priceWithDisc": 3445, "warehouseName": "Коледино", "lastChangeDate": "2022-07-27T17:59:09", "discountPercent": 47, "oblastOkrugName": "Центральный федеральный округ", "supplierArticle": "5200102953203", "promoCodeDiscount": 0}	{}	2022-08-23 13:08:27.945205	2022-08-23 13:08:27.945205
84	2146	2022-07-30	{"spp": 0, "date": "2022-07-30T15:08:08", "nmId": 111345626, "odid": 600192795074, "srid": "e914598bfa564f05a66b2e032c7dc2b3", "brand": "KOKO", "forPay": 718.2, "saleID": "S3123453521", "barcode": "2037838797626", "gNumber": "93297343375170060476", "sticker": "", "subject": "Масло растительное", "IsStorno": 0, "category": "Продукты", "incomeID": 8090310, "isSupply": false, "techSize": "0", "regionName": "Ханты-Мансийский Автономный округ - Югра", "totalPrice": 1330, "countryName": "Россия", "finishedPrice": 742, "isRealization": true, "priceWithDisc": 798, "warehouseName": "Коледино", "lastChangeDate": "2022-07-30T15:09:15", "discountPercent": 40, "oblastOkrugName": "Уральский федеральный округ", "supplierArticle": "5205657000631", "promoCodeDiscount": 0}	{}	2022-08-23 13:08:27.951236	2022-08-23 13:08:27.951236
85	2138	2022-08-02	{"spp": 0, "date": "2022-08-02T16:52:34", "nmId": 111345604, "odid": 600157533008, "srid": "", "brand": "SITIA", "forPay": 3100.5, "saleID": "S3138946077", "barcode": "2037838726626", "gNumber": "6263414912658138938", "sticker": "", "subject": "Масло растительное", "IsStorno": 0, "category": "Продукты", "incomeID": 8043602, "isSupply": false, "techSize": "0", "regionName": "Москва", "totalPrice": 6500, "countryName": "Россия", "finishedPrice": 3203, "isRealization": true, "priceWithDisc": 3445, "warehouseName": "Коледино", "lastChangeDate": "2022-08-02T16:53:42", "discountPercent": 47, "oblastOkrugName": "Центральный федеральный округ", "supplierArticle": "5200102953203", "promoCodeDiscount": 0}	{}	2022-08-23 13:08:27.956165	2022-08-23 13:08:27.956165
86	2147	2022-08-05	{"spp": 0, "date": "2022-08-05T14:26:12", "nmId": 111345626, "odid": 600231740394, "srid": "de4b4a77a24b454d9bd86c25bcc4d48d", "brand": "KOKO", "forPay": 754.11, "saleID": "S3153333856", "barcode": "2037838797626", "gNumber": "94620453239065245749", "sticker": "", "subject": "Масло растительное", "IsStorno": 0, "category": "Продукты", "incomeID": 8090310, "isSupply": false, "techSize": "0", "regionName": "Новосибирская", "totalPrice": 1330, "countryName": "Россия", "finishedPrice": 779, "isRealization": true, "priceWithDisc": 837.9, "warehouseName": "Коледино", "lastChangeDate": "2022-08-05T14:58:32", "discountPercent": 37, "oblastOkrugName": "Сибирский федеральный округ", "supplierArticle": "5205657000631", "promoCodeDiscount": 0}	{}	2022-08-23 13:08:27.960584	2022-08-23 13:08:27.960584
87	2148	2022-08-08	{"spp": 0, "date": "2022-08-08T11:08:27", "nmId": 111345626, "odid": 600245432512, "srid": "f8b1a00bad4f4802bd32987a9a4ae79b", "brand": "KOKO", "forPay": 754.11, "saleID": "S3166664785", "barcode": "2037838797626", "gNumber": "278600335167961810", "sticker": "", "subject": "Масло растительное", "IsStorno": 0, "category": "Продукты", "incomeID": 7993537, "isSupply": false, "techSize": "0", "regionName": "Сергиево-Посадский", "totalPrice": 1330, "countryName": "Россия", "finishedPrice": 779, "isRealization": true, "priceWithDisc": 837.9, "warehouseName": "Электросталь", "lastChangeDate": "2022-08-08T11:27:09", "discountPercent": 37, "oblastOkrugName": "Центральный федеральный округ", "supplierArticle": "5205657000631", "promoCodeDiscount": 0}	{}	2022-08-23 13:08:27.964216	2022-08-23 13:08:27.964216
88	2150	2022-08-08	{"spp": 0, "date": "2022-08-08T19:03:22", "nmId": 111345626, "odid": 600262116849, "srid": "20e643241d9649d5a018ffa35e079eca", "brand": "KOKO", "forPay": 754.11, "saleID": "S3170813902", "barcode": "2037838797626", "gNumber": "93778899351181461381", "sticker": "", "subject": "Масло растительное", "IsStorno": 0, "category": "Продукты", "incomeID": 8090310, "isSupply": false, "techSize": "0", "regionName": "Москва", "totalPrice": 1330, "countryName": "Россия", "finishedPrice": 779, "isRealization": true, "priceWithDisc": 837.9, "warehouseName": "Коледино", "lastChangeDate": "2022-08-09T02:02:22", "discountPercent": 37, "oblastOkrugName": "Центральный федеральный округ", "supplierArticle": "5205657000631", "promoCodeDiscount": 0}	{}	2022-08-23 13:08:27.968137	2022-08-23 13:08:27.968137
89	2149	2022-08-11	{"spp": 0, "date": "2022-08-11T18:14:11", "nmId": 111345626, "odid": 600249459365, "srid": "39ddfe96b040466db72a461740464efe", "brand": "KOKO", "forPay": 754.11, "saleID": "S3186809996", "barcode": "2037838797626", "gNumber": "7489734020086145775", "sticker": "", "subject": "Масло растительное", "IsStorno": 0, "category": "Продукты", "incomeID": 8090310, "isSupply": false, "techSize": "0", "regionName": "Ялта", "totalPrice": 1330, "countryName": "Россия", "finishedPrice": 779, "isRealization": true, "priceWithDisc": 837.9, "warehouseName": "Коледино", "lastChangeDate": "2022-08-11T19:03:49", "discountPercent": 37, "oblastOkrugName": "Крымский федеральный округ", "supplierArticle": "5205657000631", "promoCodeDiscount": 0}	{}	2022-08-23 13:08:27.972395	2022-08-23 13:08:27.972395
90	2151	2022-08-15	{"spp": 0, "date": "2022-08-15T12:13:42", "nmId": 111345626, "odid": 600288339958, "srid": "83adcac86f2e443fa1334ed042c1da5f", "brand": "KOKO", "forPay": 801.99, "saleID": "S3205561875", "barcode": "2037838797626", "gNumber": "2924675626499364335", "sticker": "", "subject": "Масло растительное", "IsStorno": 0, "category": "Продукты", "incomeID": 8090310, "isSupply": false, "techSize": "0", "regionName": "Бахчисарайский", "totalPrice": 1330, "countryName": "Россия", "finishedPrice": 828, "isRealization": true, "priceWithDisc": 891.1, "warehouseName": "Коледино", "lastChangeDate": "2022-08-15T12:13:44", "discountPercent": 33, "oblastOkrugName": "Крымский федеральный округ", "supplierArticle": "5205657000631", "promoCodeDiscount": 0}	{}	2022-08-23 13:08:27.982709	2022-08-23 13:08:27.982709
91	2103	2022-08-20	{"spp": 0, "date": "2022-08-20T11:09:14", "nmId": 111885790, "odid": 600334666424, "srid": "18b3a7ad25964179aa5cffd81d62372a", "brand": "Agrilife", "forPay": 936, "saleID": "S3233328961", "barcode": "2038421534628", "gNumber": "3481571998459535986", "sticker": "", "subject": "Масло растительное", "IsStorno": 0, "category": "Продукты", "incomeID": 8289487, "isSupply": false, "techSize": "0", "regionName": "Москва", "totalPrice": 1600, "countryName": "Россия", "finishedPrice": 1040, "isRealization": true, "priceWithDisc": 1040, "warehouseName": "Электросталь", "lastChangeDate": "2022-08-20T11:09:16", "discountPercent": 35, "oblastOkrugName": "Центральный федеральный округ", "supplierArticle": "88571217752", "promoCodeDiscount": 0}	{}	2022-08-23 13:08:27.987977	2022-08-23 13:08:27.987977
92	2157	2022-08-20	{"spp": 0, "date": "2022-08-20T16:12:03", "nmId": 111345604, "odid": 600343634798, "srid": "60f97ce7ce5545b89c5f2e113acd48a6", "brand": "SITIA", "forPay": 4095, "saleID": "S3235547904", "barcode": "2037838726626", "gNumber": "97581701524076279607", "sticker": "", "subject": "Масло растительное", "IsStorno": 0, "category": "Продукты", "incomeID": 8294656, "isSupply": false, "techSize": "0", "regionName": "Ленинский", "totalPrice": 6500, "countryName": "Россия", "finishedPrice": 4231, "isRealization": true, "priceWithDisc": 4550, "warehouseName": "Коледино", "lastChangeDate": "2022-08-20T16:12:11", "discountPercent": 30, "oblastOkrugName": "Центральный федеральный округ", "supplierArticle": "5200102953203", "promoCodeDiscount": 0}	{}	2022-08-23 13:08:27.99272	2022-08-23 13:08:27.99272
93	2155	2022-08-21	{"spp": 0, "date": "2022-08-21T11:10:46", "nmId": 111345626, "odid": 600335362125, "srid": "7ca0b8958b8648eb8004346a08e26807", "brand": "KOKO", "forPay": 801.99, "saleID": "S3237988919", "barcode": "2037838797626", "gNumber": "2908828514460181720", "sticker": "", "subject": "Масло растительное", "IsStorno": 0, "category": "Продукты", "incomeID": 7993537, "isSupply": false, "techSize": "0", "regionName": "Вологодская", "totalPrice": 1330, "countryName": "Россия", "finishedPrice": 891, "isRealization": true, "priceWithDisc": 891.1, "warehouseName": "Электросталь", "lastChangeDate": "2022-08-21T11:11:27", "discountPercent": 33, "oblastOkrugName": "Северо-западный федеральный округ", "supplierArticle": "5205657000631", "promoCodeDiscount": 0}	{}	2022-08-23 13:08:27.998489	2022-08-23 13:08:27.998489
94	2127	2022-08-23	{"spp": 0, "date": "2022-08-23T15:47:04", "nmId": 111054747, "odid": 600357547553, "srid": "8c74fa41ad2a41b59ca5070145fbc373", "brand": "SITIA", "forPay": 1449, "saleID": "S3251436951", "barcode": "5200119080658", "gNumber": "92131128037094383875", "sticker": "", "subject": "Масло растительное", "IsStorno": 0, "category": "Продукты", "incomeID": 8294656, "isSupply": false, "techSize": "0", "regionName": "Московская", "totalPrice": 2300, "countryName": "Россия", "finishedPrice": 1497, "isRealization": true, "priceWithDisc": 1610, "warehouseName": "Коледино", "lastChangeDate": "2022-08-23T17:52:24", "discountPercent": 30, "oblastOkrugName": "Центральный федеральный округ", "supplierArticle": "5200119080675200119080665", "promoCodeDiscount": 0}	{}	2022-08-23 16:00:05.231244	2022-08-23 16:00:05.231244
95	2129	2022-08-23	{"spp": 0, "date": "2022-08-23T15:47:04", "nmId": 111054747, "odid": 600357547554, "srid": "ad87054ce94f4dccb875d5e635393da9", "brand": "SITIA", "forPay": 1449, "saleID": "S3251442121", "barcode": "5200119080658", "gNumber": "92131128037094383875", "sticker": "", "subject": "Масло растительное", "IsStorno": 0, "category": "Продукты", "incomeID": 8294656, "isSupply": false, "techSize": "0", "regionName": "Московская", "totalPrice": 2300, "countryName": "Россия", "finishedPrice": 1497, "isRealization": true, "priceWithDisc": 1610, "warehouseName": "Коледино", "lastChangeDate": "2022-08-23T17:52:24", "discountPercent": 30, "oblastOkrugName": "Центральный федеральный округ", "supplierArticle": "5200119080675200119080665", "promoCodeDiscount": 0}	{}	2022-08-23 16:00:05.237432	2022-08-23 16:00:05.237432
96	2159	2022-08-23	{"spp": 0, "date": "2022-08-23T15:47:03", "nmId": 111345604, "odid": 600357541083, "srid": "c46be4bd7a924eb6af054433c54321c2", "brand": "SITIA", "forPay": 4095, "saleID": "S3251442447", "barcode": "2037838726626", "gNumber": "95523389745328892880", "sticker": "", "subject": "Масло растительное", "IsStorno": 0, "category": "Продукты", "incomeID": 8294656, "isSupply": false, "techSize": "0", "regionName": "Московская", "totalPrice": 6500, "countryName": "Россия", "finishedPrice": 4231, "isRealization": true, "priceWithDisc": 4550, "warehouseName": "Коледино", "lastChangeDate": "2022-08-23T17:52:24", "discountPercent": 30, "oblastOkrugName": "Центральный федеральный округ", "supplierArticle": "5200102953203", "promoCodeDiscount": 0}	{}	2022-08-23 16:00:05.242746	2022-08-23 16:00:05.242746
97	2158	2022-08-23	{"spp": 0, "date": "2022-08-23T15:47:03", "nmId": 111345604, "odid": 600357541082, "srid": "9d5c18675ffb43128e6042ee5b82b3c9", "brand": "SITIA", "forPay": 4095, "saleID": "S3251442912", "barcode": "2037838726626", "gNumber": "95523389745328892880", "sticker": "", "subject": "Масло растительное", "IsStorno": 0, "category": "Продукты", "incomeID": 8294656, "isSupply": false, "techSize": "0", "regionName": "Московская", "totalPrice": 6500, "countryName": "Россия", "finishedPrice": 4231, "isRealization": true, "priceWithDisc": 4550, "warehouseName": "Коледино", "lastChangeDate": "2022-08-23T17:52:24", "discountPercent": 30, "oblastOkrugName": "Центральный федеральный округ", "supplierArticle": "5200102953203", "promoCodeDiscount": 0}	{}	2022-08-23 16:00:05.247826	2022-08-23 16:00:05.247826
98	2118	2022-08-23	{"spp": 0, "date": "2022-08-23T15:47:04", "nmId": 111054747, "odid": 600357547552, "srid": "2ddcfec9859b4f23846534ddbe7f92d4", "brand": "SITIA", "forPay": 1449, "saleID": "S3251443336", "barcode": "5200119080658", "gNumber": "92131128037094383875", "sticker": "", "subject": "Масло растительное", "IsStorno": 0, "category": "Продукты", "incomeID": 8294656, "isSupply": false, "techSize": "0", "regionName": "Московская", "totalPrice": 2300, "countryName": "Россия", "finishedPrice": 1497, "isRealization": true, "priceWithDisc": 1610, "warehouseName": "Коледино", "lastChangeDate": "2022-08-23T17:52:24", "discountPercent": 30, "oblastOkrugName": "Центральный федеральный округ", "supplierArticle": "5200119080675200119080665", "promoCodeDiscount": 0}	{}	2022-08-23 16:00:05.253062	2022-08-23 16:00:05.253062
99	1969	2022-08-23	{"spp": 0, "date": "2022-08-23T10:30:21", "nmId": 111054747, "odid": 204244945272, "srid": "", "brand": "SITIA", "forPay": 1449, "saleID": "S3249110423", "barcode": "5200119080658", "gNumber": "99111746475056167464", "sticker": "", "subject": "Масло растительное", "IsStorno": 0, "category": "Продукты", "incomeID": 8294656, "isSupply": false, "techSize": "0", "regionName": "Татарстан", "totalPrice": 2300, "countryName": "Россия", "finishedPrice": 1497, "isRealization": true, "priceWithDisc": 1610, "warehouseName": "Коледино", "lastChangeDate": "2022-08-23T10:42:02", "discountPercent": 30, "oblastOkrugName": "Приволжский федеральный округ", "supplierArticle": "5200119080675200119080665", "promoCodeDiscount": 0}	{}	2022-08-23 19:47:26.0057	2022-08-23 19:47:26.0057
100	2153	2022-08-23	{"spp": 0, "date": "2022-08-23T19:54:26", "nmId": 111345626, "odid": 600327795111, "srid": "053a4b3f34974e55b1b52747c7129abd", "brand": "KOKO", "forPay": 801.99, "saleID": "S3253586197", "barcode": "2037838797626", "gNumber": "1374724776276895994", "sticker": "", "subject": "Масло растительное", "IsStorno": 0, "category": "Продукты", "incomeID": 7993537, "isSupply": false, "techSize": "0", "regionName": "Краснодарский", "totalPrice": 1330, "countryName": "Россия", "finishedPrice": 891, "isRealization": true, "priceWithDisc": 891.1, "warehouseName": "Электросталь", "lastChangeDate": "2022-08-23T20:01:52", "discountPercent": 33, "oblastOkrugName": "Южный федеральный округ", "supplierArticle": "5205657000631", "promoCodeDiscount": 0}	{}	2022-08-23 19:47:26.019931	2022-08-23 19:47:26.019931
101	2198	2022-08-25	{"spp": 0, "date": "2022-08-25T14:34:50", "nmId": 111345626, "odid": 600367485324, "srid": "00524dc2eac54bed84a46851c355b6d7", "brand": "KOKO", "forPay": 801.99, "saleID": "S3261947839", "barcode": "2037838797626", "gNumber": "7787661661021326559", "sticker": "", "subject": "Масло растительное", "IsStorno": 0, "category": "Продукты", "incomeID": 7993537, "isSupply": false, "techSize": "0", "regionName": "Москва", "totalPrice": 1330, "countryName": "Россия", "finishedPrice": 828, "isRealization": true, "priceWithDisc": 891.1, "warehouseName": "Электросталь", "lastChangeDate": "2022-08-25T14:41:44", "discountPercent": 33, "oblastOkrugName": "Центральный федеральный округ", "supplierArticle": "5205657000631", "promoCodeDiscount": 0}	{}	2022-08-25 17:30:25.104633	2022-08-25 17:30:25.104633
102	2156	2022-08-25	{"spp": 0, "date": "2022-08-25T15:38:24", "nmId": 111345626, "odid": 600335856219, "srid": "f94cf23ef296427994fc2b84115e260f", "brand": "KOKO", "forPay": 801.99, "saleID": "S3262444852", "barcode": "2037838797626", "gNumber": "92928801676206547", "sticker": "", "subject": "Масло растительное", "IsStorno": 0, "category": "Продукты", "incomeID": 7993537, "isSupply": false, "techSize": "0", "regionName": "Осташковский", "totalPrice": 1330, "countryName": "Россия", "finishedPrice": 891, "isRealization": true, "priceWithDisc": 891.1, "warehouseName": "Электросталь", "lastChangeDate": "2022-08-25T15:51:01", "discountPercent": 33, "oblastOkrugName": "Центральный федеральный округ", "supplierArticle": "5205657000631", "promoCodeDiscount": 0}	{}	2022-08-25 17:30:25.123704	2022-08-25 17:30:25.123704
103	2199	2022-08-25	{"spp": 0, "date": "2022-08-25T17:32:26", "nmId": 110119921, "odid": 153985898797, "srid": "", "brand": "SITIA", "forPay": 858.6, "saleID": "S3263450950", "barcode": "2036002208623", "gNumber": "94157688099029042647", "sticker": "", "subject": "Масло растительное", "IsStorno": 0, "category": "Продукты", "incomeID": 7993537, "isSupply": false, "techSize": "0", "regionName": "Тамбовская", "totalPrice": 1800, "countryName": "Россия", "finishedPrice": 887, "isRealization": true, "priceWithDisc": 954, "warehouseName": "Электросталь", "lastChangeDate": "2022-08-25T17:54:49", "discountPercent": 47, "oblastOkrugName": "Центральный федеральный округ", "supplierArticle": "520011908066981764983278947982", "promoCodeDiscount": 0}	{}	2022-08-25 17:30:25.132962	2022-08-25 17:30:25.132962
104	2180	2022-08-25	{"spp": 0, "date": "2022-08-25T17:57:20", "nmId": 110119921, "odid": 600360658305, "srid": "0c288f84704944b6afa8d056d5e93208", "brand": "SITIA", "forPay": 858.6, "saleID": "S3263699124", "barcode": "2036002208623", "gNumber": "94548955565179520233", "sticker": "", "subject": "Масло растительное", "IsStorno": 0, "category": "Продукты", "incomeID": 7993537, "isSupply": false, "techSize": "0", "regionName": "Новоусманский", "totalPrice": 1800, "countryName": "Россия", "finishedPrice": 887, "isRealization": true, "priceWithDisc": 954, "warehouseName": "Электросталь", "lastChangeDate": "2022-08-25T18:24:32", "discountPercent": 47, "oblastOkrugName": "Центральный федеральный округ", "supplierArticle": "520011908066981764983278947982", "promoCodeDiscount": 0}	{}	2022-08-25 17:30:25.141833	2022-08-25 17:30:25.141833
105	2202	2022-08-26	{"spp": 0, "date": "2022-08-26T14:10:49", "nmId": 117329468, "odid": 600372639811, "srid": "c48b4060e02b40acb884850258b25724", "brand": "MINERVA", "forPay": 1521, "saleID": "S3267749331", "barcode": "2041990946624", "gNumber": "98780147645993507225", "sticker": "", "subject": "Масло растительное", "IsStorno": 0, "category": "Продукты", "incomeID": 8294656, "isSupply": false, "techSize": "0", "regionName": "Москва", "totalPrice": 1750, "countryName": "Россия", "finishedPrice": 1571, "isRealization": true, "priceWithDisc": 1690, "warehouseName": "Коледино", "lastChangeDate": "2022-08-26T14:22:19", "discountPercent": 0, "oblastOkrugName": "Центральный федеральный округ", "supplierArticle": "5201106190748", "promoCodeDiscount": 0}	{}	2022-08-26 12:30:02.911511	2022-08-26 12:30:02.911511
106	2203	2022-08-26	{"spp": 0, "date": "2022-08-26T14:11:19", "nmId": 111345626, "odid": 600372887463, "srid": "0b73fb984353474fbf04a3d43d73abc7", "brand": "KOKO", "forPay": 801.99, "saleID": "S3267753618", "barcode": "2037838797626", "gNumber": "91282181521703846161", "sticker": "", "subject": "Масло растительное", "IsStorno": 0, "category": "Продукты", "incomeID": 7993537, "isSupply": false, "techSize": "0", "regionName": "Москва", "totalPrice": 1390, "countryName": "Россия", "finishedPrice": 828, "isRealization": true, "priceWithDisc": 891.1, "warehouseName": "Электросталь", "lastChangeDate": "2022-08-26T14:22:19", "discountPercent": 33, "oblastOkrugName": "Центральный федеральный округ", "supplierArticle": "5205657000631", "promoCodeDiscount": 0}	{}	2022-08-26 12:30:02.918928	2022-08-26 12:30:02.918928
107	2206	2022-08-27	{"spp": 0, "date": "2022-08-27T12:56:03", "nmId": 111054747, "odid": 600384305641, "srid": "ece3a7d2946f4625ab1a21b8b84a5cf0", "brand": "SITIA", "forPay": 1486.8, "saleID": "S3273029906", "barcode": "5200119080658", "gNumber": "8186698229572829711", "sticker": "", "subject": "Масло растительное", "IsStorno": 0, "category": "Продукты", "incomeID": 8294656, "isSupply": false, "techSize": "0", "regionName": "Люберецкий", "totalPrice": 2360, "countryName": "Россия", "finishedPrice": 1536, "isRealization": true, "priceWithDisc": 1652, "warehouseName": "Коледино", "lastChangeDate": "2022-08-27T13:23:16", "discountPercent": 30, "oblastOkrugName": "Центральный федеральный округ", "supplierArticle": "5200119080675200119080665", "promoCodeDiscount": 0}	{}	2022-08-27 17:30:07.621668	2022-08-27 17:30:07.621668
108	2209	2022-08-27	{"spp": 0, "date": "2022-08-27T18:07:01", "nmId": 117329468, "odid": 600378804477, "srid": "992d81cd042d42ee8959c1837ef11f72", "brand": "MINERVA", "forPay": 1521, "saleID": "S3275209325", "barcode": "2041990946624", "gNumber": "99194470108182261067", "sticker": "", "subject": "Масло растительное", "IsStorno": 0, "category": "Продукты", "incomeID": 8294656, "isSupply": false, "techSize": "0", "regionName": "Москва", "totalPrice": 1750, "countryName": "Россия", "finishedPrice": 1571, "isRealization": true, "priceWithDisc": 1690, "warehouseName": "Коледино", "lastChangeDate": "2022-08-27T18:56:37", "discountPercent": 0, "oblastOkrugName": "Центральный федеральный округ", "supplierArticle": "5201106190748", "promoCodeDiscount": 0}	{}	2022-08-27 17:30:07.642776	2022-08-27 17:30:07.642776
109	2208	2022-08-27	{"spp": 0, "date": "2022-08-27T18:07:11", "nmId": 117329468, "odid": 600379169194, "srid": "efac3820b5f44cbe98bfaed3434446ef", "brand": "MINERVA", "forPay": 1521, "saleID": "S3275227642", "barcode": "2041990946624", "gNumber": "91705919850475979664", "sticker": "", "subject": "Масло растительное", "IsStorno": 0, "category": "Продукты", "incomeID": 8294656, "isSupply": false, "techSize": "0", "regionName": "Москва", "totalPrice": 1750, "countryName": "Россия", "finishedPrice": 1571, "isRealization": true, "priceWithDisc": 1690, "warehouseName": "Коледино", "lastChangeDate": "2022-08-27T18:56:37", "discountPercent": 0, "oblastOkrugName": "Центральный федеральный округ", "supplierArticle": "5201106190748", "promoCodeDiscount": 0}	{}	2022-08-27 17:30:07.653832	2022-08-27 17:30:07.653832
110	2204	2022-08-27	{"spp": 0, "date": "2022-08-27T20:33:11", "nmId": 110119921, "odid": 600375473685, "srid": "d39b8db31c9046c3a4e0d83c57606251", "brand": "SITIA", "forPay": 858.6, "saleID": "S3276067657", "barcode": "2036002208623", "gNumber": "92314256928604727047", "sticker": "", "subject": "Масло растительное", "IsStorno": 0, "category": "Продукты", "incomeID": 7993537, "isSupply": false, "techSize": "0", "regionName": "Москва", "totalPrice": 1860, "countryName": "Россия", "finishedPrice": 887, "isRealization": true, "priceWithDisc": 954, "warehouseName": "МЛП-Подольск", "lastChangeDate": "2022-08-27T20:42:45", "discountPercent": 47, "oblastOkrugName": "Центральный федеральный округ", "supplierArticle": "520011908066981764983278947982", "promoCodeDiscount": 0}	{}	2022-08-27 19:00:10.449803	2022-08-27 19:00:10.449803
111	2128	2022-08-28	{"spp": 0, "date": "2022-08-28T14:50:55", "nmId": 111885412, "odid": 600357879301, "srid": "45d4099fe3df4e1e8b205b977bcc4c8d", "brand": "", "forPay": 819.72, "saleID": "S3279022398", "barcode": "2038421434621", "gNumber": "94510163255475532138", "sticker": "", "subject": "Масло растительное", "IsStorno": 0, "category": "Продукты", "incomeID": 8043602, "isSupply": false, "techSize": "0", "regionName": "Краснодарский", "totalPrice": 1440, "countryName": "Россия", "finishedPrice": 847, "isRealization": true, "priceWithDisc": 910.8, "warehouseName": "Коледино", "lastChangeDate": "2022-08-28T15:04:53", "discountPercent": 34, "oblastOkrugName": "Южный федеральный округ", "supplierArticle": "52003624003", "promoCodeDiscount": 0}	{}	2022-08-28 13:30:06.717896	2022-08-28 13:30:06.717896
\.


--
-- Data for Name: stocks; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.stocks (id, product_id, quantity, api_data, created_at, updated_at) FROM stdin;
1	37	6	{"nmId": 111054747, "Price": 2300, "brand": "SITIA", "SCCode": "Tech", "barcode": "5200119080658", "subject": "Масло растительное", "Discount": 30, "category": "Продукты", "isSupply": true, "quantity": 6, "techSize": "0", "warehouse": 1, "daysOnSite": 51, "quantityFull": 10, "inWayToClient": 4, "isRealization": false, "warehouseName": "Коледино", "lastChangeDate": "2022-08-23T05:56:56.323", "inWayFromClient": 0, "supplierArticle": "5200119080675200119080665", "quantityNotInOrders": 10}	2022-08-23 12:07:38.007231	2022-08-23 12:07:38.007231
2	37	18	{"nmId": 111054747, "Price": 2300, "brand": "SITIA", "SCCode": "Tech", "barcode": "5200119080658", "subject": "Масло растительное", "Discount": 30, "category": "Продукты", "isSupply": true, "quantity": 18, "techSize": "0", "warehouse": 15, "daysOnSite": 51, "quantityFull": 18, "inWayToClient": 0, "isRealization": false, "warehouseName": "Электросталь", "lastChangeDate": "2022-08-23T05:56:56.323", "inWayFromClient": 0, "supplierArticle": "5200119080675200119080665", "quantityNotInOrders": 18}	2022-08-23 12:07:39.546779	2022-08-23 12:07:39.546779
3	34	6	{"nmId": 111885412, "Price": 1380, "brand": "", "SCCode": "Tech", "barcode": "2038421434621", "subject": "Масло растительное", "Discount": 34, "category": "Продукты", "isSupply": true, "quantity": 6, "techSize": "0", "warehouse": 1, "daysOnSite": 45, "quantityFull": 8, "inWayToClient": 2, "isRealization": false, "warehouseName": "Коледино", "lastChangeDate": "2022-08-23T05:56:56.323", "inWayFromClient": 0, "supplierArticle": "52003624003", "quantityNotInOrders": 8}	2022-08-23 12:07:42.522481	2022-08-23 12:07:42.522481
4	35	0	{"nmId": 111885790, "Price": 2800, "brand": "Agrilife", "SCCode": "Tech", "barcode": "2038421534628", "subject": "Масло растительное", "Discount": 35, "category": "Продукты", "isSupply": true, "quantity": 0, "techSize": "0", "warehouse": 1, "daysOnSite": 45, "quantityFull": 2, "inWayToClient": 2, "isRealization": false, "warehouseName": "Коледино", "lastChangeDate": "2022-08-23T05:56:56.323", "inWayFromClient": 0, "supplierArticle": "88571217752", "quantityNotInOrders": 2}	2022-08-23 12:07:43.460291	2022-08-23 12:07:43.460291
5	35	7	{"nmId": 111885790, "Price": 2800, "brand": "Agrilife", "SCCode": "Tech", "barcode": "2038421534628", "subject": "Масло растительное", "Discount": 35, "category": "Продукты", "isSupply": true, "quantity": 7, "techSize": "0", "warehouse": 15, "daysOnSite": 45, "quantityFull": 7, "inWayToClient": 0, "isRealization": false, "warehouseName": "Электросталь", "lastChangeDate": "2022-08-23T05:56:56.323", "inWayFromClient": 0, "supplierArticle": "88571217752", "quantityNotInOrders": 7}	2022-08-23 12:07:44.613994	2022-08-23 12:07:44.613994
6	37	6	{"nmId": 111054747, "Price": 2300, "brand": "SITIA", "SCCode": "Tech", "barcode": "5200119080658", "subject": "Масло растительное", "Discount": 30, "category": "Продукты", "isSupply": true, "quantity": 6, "techSize": "0", "warehouse": 1, "daysOnSite": 51, "quantityFull": 10, "inWayToClient": 4, "isRealization": false, "warehouseName": "Коледино", "lastChangeDate": "2022-08-23T05:56:56.323", "inWayFromClient": 0, "supplierArticle": "5200119080675200119080665", "quantityNotInOrders": 10}	2022-08-23 12:19:07.331623	2022-08-23 12:19:07.331623
7	37	18	{"nmId": 111054747, "Price": 2300, "brand": "SITIA", "SCCode": "Tech", "barcode": "5200119080658", "subject": "Масло растительное", "Discount": 30, "category": "Продукты", "isSupply": true, "quantity": 18, "techSize": "0", "warehouse": 15, "daysOnSite": 51, "quantityFull": 18, "inWayToClient": 0, "isRealization": false, "warehouseName": "Электросталь", "lastChangeDate": "2022-08-23T05:56:56.323", "inWayFromClient": 0, "supplierArticle": "5200119080675200119080665", "quantityNotInOrders": 18}	2022-08-23 12:19:07.338123	2022-08-23 12:19:07.338123
8	34	6	{"nmId": 111885412, "Price": 1380, "brand": "", "SCCode": "Tech", "barcode": "2038421434621", "subject": "Масло растительное", "Discount": 34, "category": "Продукты", "isSupply": true, "quantity": 6, "techSize": "0", "warehouse": 1, "daysOnSite": 45, "quantityFull": 8, "inWayToClient": 2, "isRealization": false, "warehouseName": "Коледино", "lastChangeDate": "2022-08-23T05:56:56.323", "inWayFromClient": 0, "supplierArticle": "52003624003", "quantityNotInOrders": 8}	2022-08-23 12:19:07.343475	2022-08-23 12:19:07.343475
9	35	0	{"nmId": 111885790, "Price": 2800, "brand": "Agrilife", "SCCode": "Tech", "barcode": "2038421534628", "subject": "Масло растительное", "Discount": 35, "category": "Продукты", "isSupply": true, "quantity": 0, "techSize": "0", "warehouse": 1, "daysOnSite": 45, "quantityFull": 2, "inWayToClient": 2, "isRealization": false, "warehouseName": "Коледино", "lastChangeDate": "2022-08-23T05:56:56.323", "inWayFromClient": 0, "supplierArticle": "88571217752", "quantityNotInOrders": 2}	2022-08-23 12:19:07.346612	2022-08-23 12:19:07.346612
10	35	7	{"nmId": 111885790, "Price": 2800, "brand": "Agrilife", "SCCode": "Tech", "barcode": "2038421534628", "subject": "Масло растительное", "Discount": 35, "category": "Продукты", "isSupply": true, "quantity": 7, "techSize": "0", "warehouse": 15, "daysOnSite": 45, "quantityFull": 7, "inWayToClient": 0, "isRealization": false, "warehouseName": "Электросталь", "lastChangeDate": "2022-08-23T05:56:56.323", "inWayFromClient": 0, "supplierArticle": "88571217752", "quantityNotInOrders": 7}	2022-08-23 12:19:07.350086	2022-08-23 12:19:07.350086
11	37	6	{"nmId": 111054747, "Price": 2300, "brand": "SITIA", "SCCode": "Tech", "barcode": "5200119080658", "subject": "Масло растительное", "Discount": 30, "category": "Продукты", "isSupply": true, "quantity": 6, "techSize": "0", "warehouse": 1, "daysOnSite": 51, "quantityFull": 10, "inWayToClient": 4, "isRealization": false, "warehouseName": "Коледино", "lastChangeDate": "2022-08-23T05:56:56.323", "inWayFromClient": 0, "supplierArticle": "5200119080675200119080665", "quantityNotInOrders": 10}	2022-08-23 12:28:20.980129	2022-08-23 12:28:20.980129
12	37	18	{"nmId": 111054747, "Price": 2300, "brand": "SITIA", "SCCode": "Tech", "barcode": "5200119080658", "subject": "Масло растительное", "Discount": 30, "category": "Продукты", "isSupply": true, "quantity": 18, "techSize": "0", "warehouse": 15, "daysOnSite": 51, "quantityFull": 18, "inWayToClient": 0, "isRealization": false, "warehouseName": "Электросталь", "lastChangeDate": "2022-08-23T05:56:56.323", "inWayFromClient": 0, "supplierArticle": "5200119080675200119080665", "quantityNotInOrders": 18}	2022-08-23 12:28:20.984008	2022-08-23 12:28:20.984008
13	31	0	{"nmId": 111345604, "Price": 6500, "brand": "SITIA", "SCCode": "Tech", "barcode": "2037838726626", "subject": "Масло растительное", "Discount": 30, "category": "Продукты", "isSupply": true, "quantity": 0, "techSize": "0", "warehouse": 1, "daysOnSite": 45, "quantityFull": 3, "inWayToClient": 3, "isRealization": false, "warehouseName": "Коледино", "lastChangeDate": "2022-08-23T05:56:56.323", "inWayFromClient": 0, "supplierArticle": "5200102953203", "quantityNotInOrders": 3}	2022-08-23 12:28:20.98728	2022-08-23 12:28:20.98728
14	31	11	{"nmId": 111345604, "Price": 6500, "brand": "SITIA", "SCCode": "Tech", "barcode": "2037838726626", "subject": "Масло растительное", "Discount": 30, "category": "Продукты", "isSupply": true, "quantity": 11, "techSize": "0", "warehouse": 15, "daysOnSite": 45, "quantityFull": 11, "inWayToClient": 0, "isRealization": false, "warehouseName": "Электросталь", "lastChangeDate": "2022-08-23T05:56:56.323", "inWayFromClient": 0, "supplierArticle": "5200102953203", "quantityNotInOrders": 11}	2022-08-23 12:28:20.990986	2022-08-23 12:28:20.990986
15	33	0	{"nmId": 111345626, "Price": 1330, "brand": "KOKO", "SCCode": "Tech", "barcode": "2037838797626", "subject": "Масло растительное", "Discount": 33, "category": "Продукты", "isSupply": true, "quantity": 0, "techSize": "0", "warehouse": 1, "daysOnSite": 51, "quantityFull": 3, "inWayToClient": 3, "isRealization": false, "warehouseName": "Коледино", "lastChangeDate": "2022-08-23T05:56:56.323", "inWayFromClient": 0, "supplierArticle": "5205657000631", "quantityNotInOrders": 3}	2022-08-23 12:28:20.994383	2022-08-23 12:28:20.994383
16	33	27	{"nmId": 111345626, "Price": 1330, "brand": "KOKO", "SCCode": "Tech", "barcode": "2037838797626", "subject": "Масло растительное", "Discount": 33, "category": "Продукты", "isSupply": true, "quantity": 27, "techSize": "0", "warehouse": 15, "daysOnSite": 51, "quantityFull": 27, "inWayToClient": 0, "isRealization": false, "warehouseName": "Электросталь", "lastChangeDate": "2022-08-23T05:56:56.323", "inWayFromClient": 0, "supplierArticle": "5205657000631", "quantityNotInOrders": 27}	2022-08-23 12:28:20.997945	2022-08-23 12:28:20.997945
17	34	6	{"nmId": 111885412, "Price": 1380, "brand": "", "SCCode": "Tech", "barcode": "2038421434621", "subject": "Масло растительное", "Discount": 34, "category": "Продукты", "isSupply": true, "quantity": 6, "techSize": "0", "warehouse": 1, "daysOnSite": 45, "quantityFull": 8, "inWayToClient": 2, "isRealization": false, "warehouseName": "Коледино", "lastChangeDate": "2022-08-23T05:56:56.323", "inWayFromClient": 0, "supplierArticle": "52003624003", "quantityNotInOrders": 8}	2022-08-23 12:28:21.001582	2022-08-23 12:28:21.001582
18	35	0	{"nmId": 111885790, "Price": 2800, "brand": "Agrilife", "SCCode": "Tech", "barcode": "2038421534628", "subject": "Масло растительное", "Discount": 35, "category": "Продукты", "isSupply": true, "quantity": 0, "techSize": "0", "warehouse": 1, "daysOnSite": 45, "quantityFull": 2, "inWayToClient": 2, "isRealization": false, "warehouseName": "Коледино", "lastChangeDate": "2022-08-23T05:56:56.323", "inWayFromClient": 0, "supplierArticle": "88571217752", "quantityNotInOrders": 2}	2022-08-23 12:28:21.005523	2022-08-23 12:28:21.005523
19	35	7	{"nmId": 111885790, "Price": 2800, "brand": "Agrilife", "SCCode": "Tech", "barcode": "2038421534628", "subject": "Масло растительное", "Discount": 35, "category": "Продукты", "isSupply": true, "quantity": 7, "techSize": "0", "warehouse": 15, "daysOnSite": 45, "quantityFull": 7, "inWayToClient": 0, "isRealization": false, "warehouseName": "Электросталь", "lastChangeDate": "2022-08-23T05:56:56.323", "inWayFromClient": 0, "supplierArticle": "88571217752", "quantityNotInOrders": 7}	2022-08-23 12:28:21.00953	2022-08-23 12:28:21.00953
20	37	6	{"nmId": 111054747, "Price": 2300, "brand": "SITIA", "SCCode": "Tech", "barcode": "5200119080658", "subject": "Масло растительное", "Discount": 30, "category": "Продукты", "isSupply": true, "quantity": 6, "techSize": "0", "warehouse": 1, "daysOnSite": 51, "quantityFull": 10, "inWayToClient": 4, "isRealization": false, "warehouseName": "Коледино", "lastChangeDate": "2022-08-23T05:56:56.323", "inWayFromClient": 0, "supplierArticle": "5200119080675200119080665", "quantityNotInOrders": 10}	2022-08-23 12:35:32.42264	2022-08-23 12:35:32.42264
21	31	0	{"nmId": 111345604, "Price": 6500, "brand": "SITIA", "SCCode": "Tech", "barcode": "2037838726626", "subject": "Масло растительное", "Discount": 30, "category": "Продукты", "isSupply": true, "quantity": 0, "techSize": "0", "warehouse": 1, "daysOnSite": 45, "quantityFull": 3, "inWayToClient": 3, "isRealization": false, "warehouseName": "Коледино", "lastChangeDate": "2022-08-23T05:56:56.323", "inWayFromClient": 0, "supplierArticle": "5200102953203", "quantityNotInOrders": 3}	2022-08-23 12:35:32.430539	2022-08-23 12:35:32.430539
22	33	0	{"nmId": 111345626, "Price": 1330, "brand": "KOKO", "SCCode": "Tech", "barcode": "2037838797626", "subject": "Масло растительное", "Discount": 33, "category": "Продукты", "isSupply": true, "quantity": 0, "techSize": "0", "warehouse": 1, "daysOnSite": 51, "quantityFull": 3, "inWayToClient": 3, "isRealization": false, "warehouseName": "Коледино", "lastChangeDate": "2022-08-23T05:56:56.323", "inWayFromClient": 0, "supplierArticle": "5205657000631", "quantityNotInOrders": 3}	2022-08-23 12:35:32.434757	2022-08-23 12:35:32.434757
23	34	6	{"nmId": 111885412, "Price": 1380, "brand": "", "SCCode": "Tech", "barcode": "2038421434621", "subject": "Масло растительное", "Discount": 34, "category": "Продукты", "isSupply": true, "quantity": 6, "techSize": "0", "warehouse": 1, "daysOnSite": 45, "quantityFull": 8, "inWayToClient": 2, "isRealization": false, "warehouseName": "Коледино", "lastChangeDate": "2022-08-23T05:56:56.323", "inWayFromClient": 0, "supplierArticle": "52003624003", "quantityNotInOrders": 8}	2022-08-23 12:35:32.442642	2022-08-23 12:35:32.442642
24	35	0	{"nmId": 111885790, "Price": 2800, "brand": "Agrilife", "SCCode": "Tech", "barcode": "2038421534628", "subject": "Масло растительное", "Discount": 35, "category": "Продукты", "isSupply": true, "quantity": 0, "techSize": "0", "warehouse": 1, "daysOnSite": 45, "quantityFull": 2, "inWayToClient": 2, "isRealization": false, "warehouseName": "Коледино", "lastChangeDate": "2022-08-23T05:56:56.323", "inWayFromClient": 0, "supplierArticle": "88571217752", "quantityNotInOrders": 2}	2022-08-23 12:35:32.454843	2022-08-23 12:35:32.454843
25	37	6	{"nmId": 111054747, "Price": 2300, "brand": "SITIA", "SCCode": "Tech", "barcode": "5200119080658", "subject": "Масло растительное", "Discount": 30, "category": "Продукты", "isSupply": true, "quantity": 6, "techSize": "0", "warehouse": 1, "daysOnSite": 51, "quantityFull": 10, "inWayToClient": 4, "isRealization": false, "warehouseName": "Коледино", "lastChangeDate": "2022-08-23T05:56:56.323", "inWayFromClient": 0, "supplierArticle": "5200119080675200119080665", "quantityNotInOrders": 10}	2022-08-23 12:36:54.899065	2022-08-23 12:36:54.899065
26	31	0	{"nmId": 111345604, "Price": 6500, "brand": "SITIA", "SCCode": "Tech", "barcode": "2037838726626", "subject": "Масло растительное", "Discount": 30, "category": "Продукты", "isSupply": true, "quantity": 0, "techSize": "0", "warehouse": 1, "daysOnSite": 45, "quantityFull": 3, "inWayToClient": 3, "isRealization": false, "warehouseName": "Коледино", "lastChangeDate": "2022-08-23T05:56:56.323", "inWayFromClient": 0, "supplierArticle": "5200102953203", "quantityNotInOrders": 3}	2022-08-23 12:36:54.906076	2022-08-23 12:36:54.906076
27	33	0	{"nmId": 111345626, "Price": 1330, "brand": "KOKO", "SCCode": "Tech", "barcode": "2037838797626", "subject": "Масло растительное", "Discount": 33, "category": "Продукты", "isSupply": true, "quantity": 0, "techSize": "0", "warehouse": 1, "daysOnSite": 51, "quantityFull": 3, "inWayToClient": 3, "isRealization": false, "warehouseName": "Коледино", "lastChangeDate": "2022-08-23T05:56:56.323", "inWayFromClient": 0, "supplierArticle": "5205657000631", "quantityNotInOrders": 3}	2022-08-23 12:36:54.909887	2022-08-23 12:36:54.909887
28	34	6	{"nmId": 111885412, "Price": 1380, "brand": "", "SCCode": "Tech", "barcode": "2038421434621", "subject": "Масло растительное", "Discount": 34, "category": "Продукты", "isSupply": true, "quantity": 6, "techSize": "0", "warehouse": 1, "daysOnSite": 45, "quantityFull": 8, "inWayToClient": 2, "isRealization": false, "warehouseName": "Коледино", "lastChangeDate": "2022-08-23T05:56:56.323", "inWayFromClient": 0, "supplierArticle": "52003624003", "quantityNotInOrders": 8}	2022-08-23 12:36:54.913782	2022-08-23 12:36:54.913782
29	35	0	{"nmId": 111885790, "Price": 2800, "brand": "Agrilife", "SCCode": "Tech", "barcode": "2038421534628", "subject": "Масло растительное", "Discount": 35, "category": "Продукты", "isSupply": true, "quantity": 0, "techSize": "0", "warehouse": 1, "daysOnSite": 45, "quantityFull": 2, "inWayToClient": 2, "isRealization": false, "warehouseName": "Коледино", "lastChangeDate": "2022-08-23T05:56:56.323", "inWayFromClient": 0, "supplierArticle": "88571217752", "quantityNotInOrders": 2}	2022-08-23 12:36:54.917501	2022-08-23 12:36:54.917501
30	37	6	{"nmId": 111054747, "Price": 2300, "brand": "SITIA", "SCCode": "Tech", "barcode": "5200119080658", "subject": "Масло растительное", "Discount": 30, "category": "Продукты", "isSupply": true, "quantity": 6, "techSize": "0", "warehouse": 1, "daysOnSite": 51, "quantityFull": 10, "inWayToClient": 4, "isRealization": false, "warehouseName": "Коледино", "lastChangeDate": "2022-08-23T05:56:56.323", "inWayFromClient": 0, "supplierArticle": "5200119080675200119080665", "quantityNotInOrders": 10}	2022-08-23 12:40:16.106602	2022-08-23 12:40:16.106602
31	37	18	{"nmId": 111054747, "Price": 2300, "brand": "SITIA", "SCCode": "Tech", "barcode": "5200119080658", "subject": "Масло растительное", "Discount": 30, "category": "Продукты", "isSupply": true, "quantity": 18, "techSize": "0", "warehouse": 15, "daysOnSite": 51, "quantityFull": 18, "inWayToClient": 0, "isRealization": false, "warehouseName": "Электросталь", "lastChangeDate": "2022-08-23T05:56:56.323", "inWayFromClient": 0, "supplierArticle": "5200119080675200119080665", "quantityNotInOrders": 18}	2022-08-23 12:40:16.120692	2022-08-23 12:40:16.120692
32	31	0	{"nmId": 111345604, "Price": 6500, "brand": "SITIA", "SCCode": "Tech", "barcode": "2037838726626", "subject": "Масло растительное", "Discount": 30, "category": "Продукты", "isSupply": true, "quantity": 0, "techSize": "0", "warehouse": 1, "daysOnSite": 45, "quantityFull": 3, "inWayToClient": 3, "isRealization": false, "warehouseName": "Коледино", "lastChangeDate": "2022-08-23T05:56:56.323", "inWayFromClient": 0, "supplierArticle": "5200102953203", "quantityNotInOrders": 3}	2022-08-23 12:40:16.124314	2022-08-23 12:40:16.124314
33	31	11	{"nmId": 111345604, "Price": 6500, "brand": "SITIA", "SCCode": "Tech", "barcode": "2037838726626", "subject": "Масло растительное", "Discount": 30, "category": "Продукты", "isSupply": true, "quantity": 11, "techSize": "0", "warehouse": 15, "daysOnSite": 45, "quantityFull": 11, "inWayToClient": 0, "isRealization": false, "warehouseName": "Электросталь", "lastChangeDate": "2022-08-23T05:56:56.323", "inWayFromClient": 0, "supplierArticle": "5200102953203", "quantityNotInOrders": 11}	2022-08-23 12:40:16.127567	2022-08-23 12:40:16.127567
34	33	0	{"nmId": 111345626, "Price": 1330, "brand": "KOKO", "SCCode": "Tech", "barcode": "2037838797626", "subject": "Масло растительное", "Discount": 33, "category": "Продукты", "isSupply": true, "quantity": 0, "techSize": "0", "warehouse": 1, "daysOnSite": 51, "quantityFull": 3, "inWayToClient": 3, "isRealization": false, "warehouseName": "Коледино", "lastChangeDate": "2022-08-23T05:56:56.323", "inWayFromClient": 0, "supplierArticle": "5205657000631", "quantityNotInOrders": 3}	2022-08-23 12:40:16.131074	2022-08-23 12:40:16.131074
35	33	27	{"nmId": 111345626, "Price": 1330, "brand": "KOKO", "SCCode": "Tech", "barcode": "2037838797626", "subject": "Масло растительное", "Discount": 33, "category": "Продукты", "isSupply": true, "quantity": 27, "techSize": "0", "warehouse": 15, "daysOnSite": 51, "quantityFull": 27, "inWayToClient": 0, "isRealization": false, "warehouseName": "Электросталь", "lastChangeDate": "2022-08-23T05:56:56.323", "inWayFromClient": 0, "supplierArticle": "5205657000631", "quantityNotInOrders": 27}	2022-08-23 12:40:16.134356	2022-08-23 12:40:16.134356
36	34	6	{"nmId": 111885412, "Price": 1380, "brand": "", "SCCode": "Tech", "barcode": "2038421434621", "subject": "Масло растительное", "Discount": 34, "category": "Продукты", "isSupply": true, "quantity": 6, "techSize": "0", "warehouse": 1, "daysOnSite": 45, "quantityFull": 8, "inWayToClient": 2, "isRealization": false, "warehouseName": "Коледино", "lastChangeDate": "2022-08-23T05:56:56.323", "inWayFromClient": 0, "supplierArticle": "52003624003", "quantityNotInOrders": 8}	2022-08-23 12:40:16.137397	2022-08-23 12:40:16.137397
37	35	0	{"nmId": 111885790, "Price": 2800, "brand": "Agrilife", "SCCode": "Tech", "barcode": "2038421534628", "subject": "Масло растительное", "Discount": 35, "category": "Продукты", "isSupply": true, "quantity": 0, "techSize": "0", "warehouse": 1, "daysOnSite": 45, "quantityFull": 2, "inWayToClient": 2, "isRealization": false, "warehouseName": "Коледино", "lastChangeDate": "2022-08-23T05:56:56.323", "inWayFromClient": 0, "supplierArticle": "88571217752", "quantityNotInOrders": 2}	2022-08-23 12:40:16.140884	2022-08-23 12:40:16.140884
38	35	7	{"nmId": 111885790, "Price": 2800, "brand": "Agrilife", "SCCode": "Tech", "barcode": "2038421534628", "subject": "Масло растительное", "Discount": 35, "category": "Продукты", "isSupply": true, "quantity": 7, "techSize": "0", "warehouse": 15, "daysOnSite": 45, "quantityFull": 7, "inWayToClient": 0, "isRealization": false, "warehouseName": "Электросталь", "lastChangeDate": "2022-08-23T05:56:56.323", "inWayFromClient": 0, "supplierArticle": "88571217752", "quantityNotInOrders": 7}	2022-08-23 12:40:16.144064	2022-08-23 12:40:16.144064
39	37	6	{"nmId": 111054747, "Price": 2300, "brand": "SITIA", "SCCode": "Tech", "barcode": "5200119080658", "subject": "Масло растительное", "Discount": 30, "category": "Продукты", "isSupply": true, "quantity": 6, "techSize": "0", "warehouse": 1, "daysOnSite": 51, "quantityFull": 10, "inWayToClient": 4, "isRealization": false, "warehouseName": "Коледино", "lastChangeDate": "2022-08-23T05:56:56.323", "inWayFromClient": 0, "supplierArticle": "5200119080675200119080665", "quantityNotInOrders": 10}	2022-08-23 12:41:58.44434	2022-08-23 12:41:58.44434
40	37	18	{"nmId": 111054747, "Price": 2300, "brand": "SITIA", "SCCode": "Tech", "barcode": "5200119080658", "subject": "Масло растительное", "Discount": 30, "category": "Продукты", "isSupply": true, "quantity": 18, "techSize": "0", "warehouse": 15, "daysOnSite": 51, "quantityFull": 18, "inWayToClient": 0, "isRealization": false, "warehouseName": "Электросталь", "lastChangeDate": "2022-08-23T05:56:56.323", "inWayFromClient": 0, "supplierArticle": "5200119080675200119080665", "quantityNotInOrders": 18}	2022-08-23 12:41:58.454449	2022-08-23 12:41:58.454449
41	31	0	{"nmId": 111345604, "Price": 6500, "brand": "SITIA", "SCCode": "Tech", "barcode": "2037838726626", "subject": "Масло растительное", "Discount": 30, "category": "Продукты", "isSupply": true, "quantity": 0, "techSize": "0", "warehouse": 1, "daysOnSite": 45, "quantityFull": 3, "inWayToClient": 3, "isRealization": false, "warehouseName": "Коледино", "lastChangeDate": "2022-08-23T05:56:56.323", "inWayFromClient": 0, "supplierArticle": "5200102953203", "quantityNotInOrders": 3}	2022-08-23 12:41:58.460609	2022-08-23 12:41:58.460609
42	31	11	{"nmId": 111345604, "Price": 6500, "brand": "SITIA", "SCCode": "Tech", "barcode": "2037838726626", "subject": "Масло растительное", "Discount": 30, "category": "Продукты", "isSupply": true, "quantity": 11, "techSize": "0", "warehouse": 15, "daysOnSite": 45, "quantityFull": 11, "inWayToClient": 0, "isRealization": false, "warehouseName": "Электросталь", "lastChangeDate": "2022-08-23T05:56:56.323", "inWayFromClient": 0, "supplierArticle": "5200102953203", "quantityNotInOrders": 11}	2022-08-23 12:41:58.465826	2022-08-23 12:41:58.465826
43	33	0	{"nmId": 111345626, "Price": 1330, "brand": "KOKO", "SCCode": "Tech", "barcode": "2037838797626", "subject": "Масло растительное", "Discount": 33, "category": "Продукты", "isSupply": true, "quantity": 0, "techSize": "0", "warehouse": 1, "daysOnSite": 51, "quantityFull": 3, "inWayToClient": 3, "isRealization": false, "warehouseName": "Коледино", "lastChangeDate": "2022-08-23T05:56:56.323", "inWayFromClient": 0, "supplierArticle": "5205657000631", "quantityNotInOrders": 3}	2022-08-23 12:41:58.470251	2022-08-23 12:41:58.470251
44	33	27	{"nmId": 111345626, "Price": 1330, "brand": "KOKO", "SCCode": "Tech", "barcode": "2037838797626", "subject": "Масло растительное", "Discount": 33, "category": "Продукты", "isSupply": true, "quantity": 27, "techSize": "0", "warehouse": 15, "daysOnSite": 51, "quantityFull": 27, "inWayToClient": 0, "isRealization": false, "warehouseName": "Электросталь", "lastChangeDate": "2022-08-23T05:56:56.323", "inWayFromClient": 0, "supplierArticle": "5205657000631", "quantityNotInOrders": 27}	2022-08-23 12:41:58.474488	2022-08-23 12:41:58.474488
45	34	6	{"nmId": 111885412, "Price": 1380, "brand": "", "SCCode": "Tech", "barcode": "2038421434621", "subject": "Масло растительное", "Discount": 34, "category": "Продукты", "isSupply": true, "quantity": 6, "techSize": "0", "warehouse": 1, "daysOnSite": 45, "quantityFull": 8, "inWayToClient": 2, "isRealization": false, "warehouseName": "Коледино", "lastChangeDate": "2022-08-23T05:56:56.323", "inWayFromClient": 0, "supplierArticle": "52003624003", "quantityNotInOrders": 8}	2022-08-23 12:41:58.478347	2022-08-23 12:41:58.478347
46	35	0	{"nmId": 111885790, "Price": 2800, "brand": "Agrilife", "SCCode": "Tech", "barcode": "2038421534628", "subject": "Масло растительное", "Discount": 35, "category": "Продукты", "isSupply": true, "quantity": 0, "techSize": "0", "warehouse": 1, "daysOnSite": 45, "quantityFull": 2, "inWayToClient": 2, "isRealization": false, "warehouseName": "Коледино", "lastChangeDate": "2022-08-23T05:56:56.323", "inWayFromClient": 0, "supplierArticle": "88571217752", "quantityNotInOrders": 2}	2022-08-23 12:41:58.482042	2022-08-23 12:41:58.482042
47	35	7	{"nmId": 111885790, "Price": 2800, "brand": "Agrilife", "SCCode": "Tech", "barcode": "2038421534628", "subject": "Масло растительное", "Discount": 35, "category": "Продукты", "isSupply": true, "quantity": 7, "techSize": "0", "warehouse": 15, "daysOnSite": 45, "quantityFull": 7, "inWayToClient": 0, "isRealization": false, "warehouseName": "Электросталь", "lastChangeDate": "2022-08-23T05:56:56.323", "inWayFromClient": 0, "supplierArticle": "88571217752", "quantityNotInOrders": 7}	2022-08-23 12:41:58.485508	2022-08-23 12:41:58.485508
48	37	6	{"nmId": 111054747, "Price": 2300, "brand": "SITIA", "SCCode": "Tech", "barcode": "5200119080658", "subject": "Масло растительное", "Discount": 30, "category": "Продукты", "isSupply": true, "quantity": 6, "techSize": "0", "warehouse": 1, "daysOnSite": 51, "quantityFull": 10, "inWayToClient": 4, "isRealization": false, "warehouseName": "Коледино", "lastChangeDate": "2022-08-23T05:56:56.323", "inWayFromClient": 0, "supplierArticle": "5200119080675200119080665", "quantityNotInOrders": 10}	2022-08-23 15:44:25.379498	2022-08-23 15:44:25.379498
49	37	18	{"nmId": 111054747, "Price": 2300, "brand": "SITIA", "SCCode": "Tech", "barcode": "5200119080658", "subject": "Масло растительное", "Discount": 30, "category": "Продукты", "isSupply": true, "quantity": 18, "techSize": "0", "warehouse": 15, "daysOnSite": 51, "quantityFull": 18, "inWayToClient": 0, "isRealization": false, "warehouseName": "Электросталь", "lastChangeDate": "2022-08-23T05:56:56.323", "inWayFromClient": 0, "supplierArticle": "5200119080675200119080665", "quantityNotInOrders": 18}	2022-08-23 15:44:25.388057	2022-08-23 15:44:25.388057
50	31	0	{"nmId": 111345604, "Price": 6500, "brand": "SITIA", "SCCode": "Tech", "barcode": "2037838726626", "subject": "Масло растительное", "Discount": 30, "category": "Продукты", "isSupply": true, "quantity": 0, "techSize": "0", "warehouse": 1, "daysOnSite": 45, "quantityFull": 3, "inWayToClient": 3, "isRealization": false, "warehouseName": "Коледино", "lastChangeDate": "2022-08-23T05:56:56.323", "inWayFromClient": 0, "supplierArticle": "5200102953203", "quantityNotInOrders": 3}	2022-08-23 15:44:25.393733	2022-08-23 15:44:25.393733
51	31	11	{"nmId": 111345604, "Price": 6500, "brand": "SITIA", "SCCode": "Tech", "barcode": "2037838726626", "subject": "Масло растительное", "Discount": 30, "category": "Продукты", "isSupply": true, "quantity": 11, "techSize": "0", "warehouse": 15, "daysOnSite": 45, "quantityFull": 11, "inWayToClient": 0, "isRealization": false, "warehouseName": "Электросталь", "lastChangeDate": "2022-08-23T05:56:56.323", "inWayFromClient": 0, "supplierArticle": "5200102953203", "quantityNotInOrders": 11}	2022-08-23 15:44:25.399182	2022-08-23 15:44:25.399182
52	33	0	{"nmId": 111345626, "Price": 1330, "brand": "KOKO", "SCCode": "Tech", "barcode": "2037838797626", "subject": "Масло растительное", "Discount": 33, "category": "Продукты", "isSupply": true, "quantity": 0, "techSize": "0", "warehouse": 1, "daysOnSite": 51, "quantityFull": 3, "inWayToClient": 3, "isRealization": false, "warehouseName": "Коледино", "lastChangeDate": "2022-08-23T05:56:56.323", "inWayFromClient": 0, "supplierArticle": "5205657000631", "quantityNotInOrders": 3}	2022-08-23 15:44:25.404709	2022-08-23 15:44:25.404709
53	33	27	{"nmId": 111345626, "Price": 1330, "brand": "KOKO", "SCCode": "Tech", "barcode": "2037838797626", "subject": "Масло растительное", "Discount": 33, "category": "Продукты", "isSupply": true, "quantity": 27, "techSize": "0", "warehouse": 15, "daysOnSite": 51, "quantityFull": 27, "inWayToClient": 0, "isRealization": false, "warehouseName": "Электросталь", "lastChangeDate": "2022-08-23T05:56:56.323", "inWayFromClient": 0, "supplierArticle": "5205657000631", "quantityNotInOrders": 27}	2022-08-23 15:44:25.41313	2022-08-23 15:44:25.41313
54	34	6	{"nmId": 111885412, "Price": 1380, "brand": "", "SCCode": "Tech", "barcode": "2038421434621", "subject": "Масло растительное", "Discount": 34, "category": "Продукты", "isSupply": true, "quantity": 6, "techSize": "0", "warehouse": 1, "daysOnSite": 45, "quantityFull": 8, "inWayToClient": 2, "isRealization": false, "warehouseName": "Коледино", "lastChangeDate": "2022-08-23T05:56:56.323", "inWayFromClient": 0, "supplierArticle": "52003624003", "quantityNotInOrders": 8}	2022-08-23 15:44:25.418534	2022-08-23 15:44:25.418534
55	35	0	{"nmId": 111885790, "Price": 2800, "brand": "Agrilife", "SCCode": "Tech", "barcode": "2038421534628", "subject": "Масло растительное", "Discount": 35, "category": "Продукты", "isSupply": true, "quantity": 0, "techSize": "0", "warehouse": 1, "daysOnSite": 45, "quantityFull": 2, "inWayToClient": 2, "isRealization": false, "warehouseName": "Коледино", "lastChangeDate": "2022-08-23T05:56:56.323", "inWayFromClient": 0, "supplierArticle": "88571217752", "quantityNotInOrders": 2}	2022-08-23 15:44:25.423796	2022-08-23 15:44:25.423796
56	35	7	{"nmId": 111885790, "Price": 2800, "brand": "Agrilife", "SCCode": "Tech", "barcode": "2038421534628", "subject": "Масло растительное", "Discount": 35, "category": "Продукты", "isSupply": true, "quantity": 7, "techSize": "0", "warehouse": 15, "daysOnSite": 45, "quantityFull": 7, "inWayToClient": 0, "isRealization": false, "warehouseName": "Электросталь", "lastChangeDate": "2022-08-23T05:56:56.323", "inWayFromClient": 0, "supplierArticle": "88571217752", "quantityNotInOrders": 7}	2022-08-23 15:44:25.429222	2022-08-23 15:44:25.429222
57	37	6	{"nmId": 111054747, "Price": 2300, "brand": "SITIA", "SCCode": "Tech", "barcode": "5200119080658", "subject": "Масло растительное", "Discount": 30, "category": "Продукты", "isSupply": true, "quantity": 6, "techSize": "0", "warehouse": 1, "daysOnSite": 51, "quantityFull": 10, "inWayToClient": 4, "isRealization": false, "warehouseName": "Коледино", "lastChangeDate": "2022-08-23T05:56:56.323", "inWayFromClient": 0, "supplierArticle": "5200119080675200119080665", "quantityNotInOrders": 10}	2022-08-23 18:52:10.166869	2022-08-23 18:52:10.166869
58	37	18	{"nmId": 111054747, "Price": 2300, "brand": "SITIA", "SCCode": "Tech", "barcode": "5200119080658", "subject": "Масло растительное", "Discount": 30, "category": "Продукты", "isSupply": true, "quantity": 18, "techSize": "0", "warehouse": 15, "daysOnSite": 51, "quantityFull": 18, "inWayToClient": 0, "isRealization": false, "warehouseName": "Электросталь", "lastChangeDate": "2022-08-23T05:56:56.323", "inWayFromClient": 0, "supplierArticle": "5200119080675200119080665", "quantityNotInOrders": 18}	2022-08-23 18:52:10.171177	2022-08-23 18:52:10.171177
59	31	0	{"nmId": 111345604, "Price": 6500, "brand": "SITIA", "SCCode": "Tech", "barcode": "2037838726626", "subject": "Масло растительное", "Discount": 30, "category": "Продукты", "isSupply": true, "quantity": 0, "techSize": "0", "warehouse": 1, "daysOnSite": 45, "quantityFull": 3, "inWayToClient": 3, "isRealization": false, "warehouseName": "Коледино", "lastChangeDate": "2022-08-23T05:56:56.323", "inWayFromClient": 0, "supplierArticle": "5200102953203", "quantityNotInOrders": 3}	2022-08-23 18:52:10.174446	2022-08-23 18:52:10.174446
60	31	11	{"nmId": 111345604, "Price": 6500, "brand": "SITIA", "SCCode": "Tech", "barcode": "2037838726626", "subject": "Масло растительное", "Discount": 30, "category": "Продукты", "isSupply": true, "quantity": 11, "techSize": "0", "warehouse": 15, "daysOnSite": 45, "quantityFull": 11, "inWayToClient": 0, "isRealization": false, "warehouseName": "Электросталь", "lastChangeDate": "2022-08-23T05:56:56.323", "inWayFromClient": 0, "supplierArticle": "5200102953203", "quantityNotInOrders": 11}	2022-08-23 18:52:10.17784	2022-08-23 18:52:10.17784
61	33	0	{"nmId": 111345626, "Price": 1330, "brand": "KOKO", "SCCode": "Tech", "barcode": "2037838797626", "subject": "Масло растительное", "Discount": 33, "category": "Продукты", "isSupply": true, "quantity": 0, "techSize": "0", "warehouse": 1, "daysOnSite": 51, "quantityFull": 3, "inWayToClient": 3, "isRealization": false, "warehouseName": "Коледино", "lastChangeDate": "2022-08-23T05:56:56.323", "inWayFromClient": 0, "supplierArticle": "5205657000631", "quantityNotInOrders": 3}	2022-08-23 18:52:10.181055	2022-08-23 18:52:10.181055
62	33	27	{"nmId": 111345626, "Price": 1330, "brand": "KOKO", "SCCode": "Tech", "barcode": "2037838797626", "subject": "Масло растительное", "Discount": 33, "category": "Продукты", "isSupply": true, "quantity": 27, "techSize": "0", "warehouse": 15, "daysOnSite": 51, "quantityFull": 27, "inWayToClient": 0, "isRealization": false, "warehouseName": "Электросталь", "lastChangeDate": "2022-08-23T05:56:56.323", "inWayFromClient": 0, "supplierArticle": "5205657000631", "quantityNotInOrders": 27}	2022-08-23 18:52:10.184234	2022-08-23 18:52:10.184234
63	34	6	{"nmId": 111885412, "Price": 1380, "brand": "", "SCCode": "Tech", "barcode": "2038421434621", "subject": "Масло растительное", "Discount": 34, "category": "Продукты", "isSupply": true, "quantity": 6, "techSize": "0", "warehouse": 1, "daysOnSite": 45, "quantityFull": 8, "inWayToClient": 2, "isRealization": false, "warehouseName": "Коледино", "lastChangeDate": "2022-08-23T05:56:56.323", "inWayFromClient": 0, "supplierArticle": "52003624003", "quantityNotInOrders": 8}	2022-08-23 18:52:10.187333	2022-08-23 18:52:10.187333
64	35	0	{"nmId": 111885790, "Price": 2800, "brand": "Agrilife", "SCCode": "Tech", "barcode": "2038421534628", "subject": "Масло растительное", "Discount": 35, "category": "Продукты", "isSupply": true, "quantity": 0, "techSize": "0", "warehouse": 1, "daysOnSite": 45, "quantityFull": 2, "inWayToClient": 2, "isRealization": false, "warehouseName": "Коледино", "lastChangeDate": "2022-08-23T05:56:56.323", "inWayFromClient": 0, "supplierArticle": "88571217752", "quantityNotInOrders": 2}	2022-08-23 18:52:10.190777	2022-08-23 18:52:10.190777
65	35	7	{"nmId": 111885790, "Price": 2800, "brand": "Agrilife", "SCCode": "Tech", "barcode": "2038421534628", "subject": "Масло растительное", "Discount": 35, "category": "Продукты", "isSupply": true, "quantity": 7, "techSize": "0", "warehouse": 15, "daysOnSite": 45, "quantityFull": 7, "inWayToClient": 0, "isRealization": false, "warehouseName": "Электросталь", "lastChangeDate": "2022-08-23T05:56:56.323", "inWayFromClient": 0, "supplierArticle": "88571217752", "quantityNotInOrders": 7}	2022-08-23 18:52:10.193771	2022-08-23 18:52:10.193771
66	37	6	{"nmId": 111054747, "Price": 2300, "brand": "SITIA", "SCCode": "Tech", "barcode": "5200119080658", "subject": "Масло растительное", "Discount": 30, "category": "Продукты", "isSupply": true, "quantity": 6, "techSize": "0", "warehouse": 1, "daysOnSite": 51, "quantityFull": 10, "inWayToClient": 4, "isRealization": false, "warehouseName": "Коледино", "lastChangeDate": "2022-08-23T05:56:56.323", "inWayFromClient": 0, "supplierArticle": "5200119080675200119080665", "quantityNotInOrders": 10}	2022-08-23 18:54:27.420144	2022-08-23 18:54:27.420144
67	37	18	{"nmId": 111054747, "Price": 2300, "brand": "SITIA", "SCCode": "Tech", "barcode": "5200119080658", "subject": "Масло растительное", "Discount": 30, "category": "Продукты", "isSupply": true, "quantity": 18, "techSize": "0", "warehouse": 15, "daysOnSite": 51, "quantityFull": 18, "inWayToClient": 0, "isRealization": false, "warehouseName": "Электросталь", "lastChangeDate": "2022-08-23T05:56:56.323", "inWayFromClient": 0, "supplierArticle": "5200119080675200119080665", "quantityNotInOrders": 18}	2022-08-23 18:54:27.435265	2022-08-23 18:54:27.435265
68	31	0	{"nmId": 111345604, "Price": 6500, "brand": "SITIA", "SCCode": "Tech", "barcode": "2037838726626", "subject": "Масло растительное", "Discount": 30, "category": "Продукты", "isSupply": true, "quantity": 0, "techSize": "0", "warehouse": 1, "daysOnSite": 45, "quantityFull": 3, "inWayToClient": 3, "isRealization": false, "warehouseName": "Коледино", "lastChangeDate": "2022-08-23T05:56:56.323", "inWayFromClient": 0, "supplierArticle": "5200102953203", "quantityNotInOrders": 3}	2022-08-23 18:54:27.447341	2022-08-23 18:54:27.447341
69	31	11	{"nmId": 111345604, "Price": 6500, "brand": "SITIA", "SCCode": "Tech", "barcode": "2037838726626", "subject": "Масло растительное", "Discount": 30, "category": "Продукты", "isSupply": true, "quantity": 11, "techSize": "0", "warehouse": 15, "daysOnSite": 45, "quantityFull": 11, "inWayToClient": 0, "isRealization": false, "warehouseName": "Электросталь", "lastChangeDate": "2022-08-23T05:56:56.323", "inWayFromClient": 0, "supplierArticle": "5200102953203", "quantityNotInOrders": 11}	2022-08-23 18:54:27.454772	2022-08-23 18:54:27.454772
70	33	0	{"nmId": 111345626, "Price": 1330, "brand": "KOKO", "SCCode": "Tech", "barcode": "2037838797626", "subject": "Масло растительное", "Discount": 33, "category": "Продукты", "isSupply": true, "quantity": 0, "techSize": "0", "warehouse": 1, "daysOnSite": 51, "quantityFull": 3, "inWayToClient": 3, "isRealization": false, "warehouseName": "Коледино", "lastChangeDate": "2022-08-23T05:56:56.323", "inWayFromClient": 0, "supplierArticle": "5205657000631", "quantityNotInOrders": 3}	2022-08-23 18:54:27.4605	2022-08-23 18:54:27.4605
71	33	27	{"nmId": 111345626, "Price": 1330, "brand": "KOKO", "SCCode": "Tech", "barcode": "2037838797626", "subject": "Масло растительное", "Discount": 33, "category": "Продукты", "isSupply": true, "quantity": 27, "techSize": "0", "warehouse": 15, "daysOnSite": 51, "quantityFull": 27, "inWayToClient": 0, "isRealization": false, "warehouseName": "Электросталь", "lastChangeDate": "2022-08-23T05:56:56.323", "inWayFromClient": 0, "supplierArticle": "5205657000631", "quantityNotInOrders": 27}	2022-08-23 18:54:27.465224	2022-08-23 18:54:27.465224
72	34	6	{"nmId": 111885412, "Price": 1380, "brand": "", "SCCode": "Tech", "barcode": "2038421434621", "subject": "Масло растительное", "Discount": 34, "category": "Продукты", "isSupply": true, "quantity": 6, "techSize": "0", "warehouse": 1, "daysOnSite": 45, "quantityFull": 8, "inWayToClient": 2, "isRealization": false, "warehouseName": "Коледино", "lastChangeDate": "2022-08-23T05:56:56.323", "inWayFromClient": 0, "supplierArticle": "52003624003", "quantityNotInOrders": 8}	2022-08-23 18:54:27.469737	2022-08-23 18:54:27.469737
73	35	0	{"nmId": 111885790, "Price": 2800, "brand": "Agrilife", "SCCode": "Tech", "barcode": "2038421534628", "subject": "Масло растительное", "Discount": 35, "category": "Продукты", "isSupply": true, "quantity": 0, "techSize": "0", "warehouse": 1, "daysOnSite": 45, "quantityFull": 2, "inWayToClient": 2, "isRealization": false, "warehouseName": "Коледино", "lastChangeDate": "2022-08-23T05:56:56.323", "inWayFromClient": 0, "supplierArticle": "88571217752", "quantityNotInOrders": 2}	2022-08-23 18:54:27.474125	2022-08-23 18:54:27.474125
74	35	7	{"nmId": 111885790, "Price": 2800, "brand": "Agrilife", "SCCode": "Tech", "barcode": "2038421534628", "subject": "Масло растительное", "Discount": 35, "category": "Продукты", "isSupply": true, "quantity": 7, "techSize": "0", "warehouse": 15, "daysOnSite": 45, "quantityFull": 7, "inWayToClient": 0, "isRealization": false, "warehouseName": "Электросталь", "lastChangeDate": "2022-08-23T05:56:56.323", "inWayFromClient": 0, "supplierArticle": "88571217752", "quantityNotInOrders": 7}	2022-08-23 18:54:27.478355	2022-08-23 18:54:27.478355
75	37	6	{"nmId": 111054747, "Price": 2300, "brand": "SITIA", "SCCode": "Tech", "barcode": "5200119080658", "subject": "Масло растительное", "Discount": 30, "category": "Продукты", "isSupply": true, "quantity": 6, "techSize": "0", "warehouse": 1, "daysOnSite": 51, "quantityFull": 10, "inWayToClient": 4, "isRealization": false, "warehouseName": "Коледино", "lastChangeDate": "2022-08-23T05:56:56.323", "inWayFromClient": 0, "supplierArticle": "5200119080675200119080665", "quantityNotInOrders": 10}	2022-08-23 18:56:07.893787	2022-08-23 18:56:07.893787
76	37	18	{"nmId": 111054747, "Price": 2300, "brand": "SITIA", "SCCode": "Tech", "barcode": "5200119080658", "subject": "Масло растительное", "Discount": 30, "category": "Продукты", "isSupply": true, "quantity": 18, "techSize": "0", "warehouse": 15, "daysOnSite": 51, "quantityFull": 18, "inWayToClient": 0, "isRealization": false, "warehouseName": "Электросталь", "lastChangeDate": "2022-08-23T05:56:56.323", "inWayFromClient": 0, "supplierArticle": "5200119080675200119080665", "quantityNotInOrders": 18}	2022-08-23 18:56:07.900281	2022-08-23 18:56:07.900281
77	31	0	{"nmId": 111345604, "Price": 6500, "brand": "SITIA", "SCCode": "Tech", "barcode": "2037838726626", "subject": "Масло растительное", "Discount": 30, "category": "Продукты", "isSupply": true, "quantity": 0, "techSize": "0", "warehouse": 1, "daysOnSite": 45, "quantityFull": 3, "inWayToClient": 3, "isRealization": false, "warehouseName": "Коледино", "lastChangeDate": "2022-08-23T05:56:56.323", "inWayFromClient": 0, "supplierArticle": "5200102953203", "quantityNotInOrders": 3}	2022-08-23 18:56:07.903948	2022-08-23 18:56:07.903948
78	31	11	{"nmId": 111345604, "Price": 6500, "brand": "SITIA", "SCCode": "Tech", "barcode": "2037838726626", "subject": "Масло растительное", "Discount": 30, "category": "Продукты", "isSupply": true, "quantity": 11, "techSize": "0", "warehouse": 15, "daysOnSite": 45, "quantityFull": 11, "inWayToClient": 0, "isRealization": false, "warehouseName": "Электросталь", "lastChangeDate": "2022-08-23T05:56:56.323", "inWayFromClient": 0, "supplierArticle": "5200102953203", "quantityNotInOrders": 11}	2022-08-23 18:56:07.907452	2022-08-23 18:56:07.907452
79	33	0	{"nmId": 111345626, "Price": 1330, "brand": "KOKO", "SCCode": "Tech", "barcode": "2037838797626", "subject": "Масло растительное", "Discount": 33, "category": "Продукты", "isSupply": true, "quantity": 0, "techSize": "0", "warehouse": 1, "daysOnSite": 51, "quantityFull": 3, "inWayToClient": 3, "isRealization": false, "warehouseName": "Коледино", "lastChangeDate": "2022-08-23T05:56:56.323", "inWayFromClient": 0, "supplierArticle": "5205657000631", "quantityNotInOrders": 3}	2022-08-23 18:56:07.911074	2022-08-23 18:56:07.911074
80	33	27	{"nmId": 111345626, "Price": 1330, "brand": "KOKO", "SCCode": "Tech", "barcode": "2037838797626", "subject": "Масло растительное", "Discount": 33, "category": "Продукты", "isSupply": true, "quantity": 27, "techSize": "0", "warehouse": 15, "daysOnSite": 51, "quantityFull": 27, "inWayToClient": 0, "isRealization": false, "warehouseName": "Электросталь", "lastChangeDate": "2022-08-23T05:56:56.323", "inWayFromClient": 0, "supplierArticle": "5205657000631", "quantityNotInOrders": 27}	2022-08-23 18:56:07.914846	2022-08-23 18:56:07.914846
81	34	6	{"nmId": 111885412, "Price": 1380, "brand": "", "SCCode": "Tech", "barcode": "2038421434621", "subject": "Масло растительное", "Discount": 34, "category": "Продукты", "isSupply": true, "quantity": 6, "techSize": "0", "warehouse": 1, "daysOnSite": 45, "quantityFull": 8, "inWayToClient": 2, "isRealization": false, "warehouseName": "Коледино", "lastChangeDate": "2022-08-23T05:56:56.323", "inWayFromClient": 0, "supplierArticle": "52003624003", "quantityNotInOrders": 8}	2022-08-23 18:56:07.918633	2022-08-23 18:56:07.918633
82	35	0	{"nmId": 111885790, "Price": 2800, "brand": "Agrilife", "SCCode": "Tech", "barcode": "2038421534628", "subject": "Масло растительное", "Discount": 35, "category": "Продукты", "isSupply": true, "quantity": 0, "techSize": "0", "warehouse": 1, "daysOnSite": 45, "quantityFull": 2, "inWayToClient": 2, "isRealization": false, "warehouseName": "Коледино", "lastChangeDate": "2022-08-23T05:56:56.323", "inWayFromClient": 0, "supplierArticle": "88571217752", "quantityNotInOrders": 2}	2022-08-23 18:56:07.922442	2022-08-23 18:56:07.922442
83	35	7	{"nmId": 111885790, "Price": 2800, "brand": "Agrilife", "SCCode": "Tech", "barcode": "2038421534628", "subject": "Масло растительное", "Discount": 35, "category": "Продукты", "isSupply": true, "quantity": 7, "techSize": "0", "warehouse": 15, "daysOnSite": 45, "quantityFull": 7, "inWayToClient": 0, "isRealization": false, "warehouseName": "Электросталь", "lastChangeDate": "2022-08-23T05:56:56.323", "inWayFromClient": 0, "supplierArticle": "88571217752", "quantityNotInOrders": 7}	2022-08-23 18:56:07.926174	2022-08-23 18:56:07.926174
84	37	6	{"nmId": 111054747, "Price": 2300, "brand": "SITIA", "SCCode": "Tech", "barcode": "5200119080658", "subject": "Масло растительное", "Discount": 30, "category": "Продукты", "isSupply": true, "quantity": 6, "techSize": "0", "warehouse": 1, "daysOnSite": 51, "quantityFull": 10, "inWayToClient": 4, "isRealization": false, "warehouseName": "Коледино", "lastChangeDate": "2022-08-23T05:56:56.323", "inWayFromClient": 0, "supplierArticle": "5200119080675200119080665", "quantityNotInOrders": 10}	2022-08-23 18:58:59.197537	2022-08-23 18:58:59.197537
85	37	18	{"nmId": 111054747, "Price": 2300, "brand": "SITIA", "SCCode": "Tech", "barcode": "5200119080658", "subject": "Масло растительное", "Discount": 30, "category": "Продукты", "isSupply": true, "quantity": 18, "techSize": "0", "warehouse": 15, "daysOnSite": 51, "quantityFull": 18, "inWayToClient": 0, "isRealization": false, "warehouseName": "Электросталь", "lastChangeDate": "2022-08-23T05:56:56.323", "inWayFromClient": 0, "supplierArticle": "5200119080675200119080665", "quantityNotInOrders": 18}	2022-08-23 18:58:59.20701	2022-08-23 18:58:59.20701
86	31	0	{"nmId": 111345604, "Price": 6500, "brand": "SITIA", "SCCode": "Tech", "barcode": "2037838726626", "subject": "Масло растительное", "Discount": 30, "category": "Продукты", "isSupply": true, "quantity": 0, "techSize": "0", "warehouse": 1, "daysOnSite": 45, "quantityFull": 3, "inWayToClient": 3, "isRealization": false, "warehouseName": "Коледино", "lastChangeDate": "2022-08-23T05:56:56.323", "inWayFromClient": 0, "supplierArticle": "5200102953203", "quantityNotInOrders": 3}	2022-08-23 18:58:59.213484	2022-08-23 18:58:59.213484
87	31	11	{"nmId": 111345604, "Price": 6500, "brand": "SITIA", "SCCode": "Tech", "barcode": "2037838726626", "subject": "Масло растительное", "Discount": 30, "category": "Продукты", "isSupply": true, "quantity": 11, "techSize": "0", "warehouse": 15, "daysOnSite": 45, "quantityFull": 11, "inWayToClient": 0, "isRealization": false, "warehouseName": "Электросталь", "lastChangeDate": "2022-08-23T05:56:56.323", "inWayFromClient": 0, "supplierArticle": "5200102953203", "quantityNotInOrders": 11}	2022-08-23 18:58:59.219654	2022-08-23 18:58:59.219654
88	33	0	{"nmId": 111345626, "Price": 1330, "brand": "KOKO", "SCCode": "Tech", "barcode": "2037838797626", "subject": "Масло растительное", "Discount": 33, "category": "Продукты", "isSupply": true, "quantity": 0, "techSize": "0", "warehouse": 1, "daysOnSite": 51, "quantityFull": 3, "inWayToClient": 3, "isRealization": false, "warehouseName": "Коледино", "lastChangeDate": "2022-08-23T05:56:56.323", "inWayFromClient": 0, "supplierArticle": "5205657000631", "quantityNotInOrders": 3}	2022-08-23 18:58:59.225522	2022-08-23 18:58:59.225522
89	33	27	{"nmId": 111345626, "Price": 1330, "brand": "KOKO", "SCCode": "Tech", "barcode": "2037838797626", "subject": "Масло растительное", "Discount": 33, "category": "Продукты", "isSupply": true, "quantity": 27, "techSize": "0", "warehouse": 15, "daysOnSite": 51, "quantityFull": 27, "inWayToClient": 0, "isRealization": false, "warehouseName": "Электросталь", "lastChangeDate": "2022-08-23T05:56:56.323", "inWayFromClient": 0, "supplierArticle": "5205657000631", "quantityNotInOrders": 27}	2022-08-23 18:58:59.232644	2022-08-23 18:58:59.232644
90	34	6	{"nmId": 111885412, "Price": 1380, "brand": "", "SCCode": "Tech", "barcode": "2038421434621", "subject": "Масло растительное", "Discount": 34, "category": "Продукты", "isSupply": true, "quantity": 6, "techSize": "0", "warehouse": 1, "daysOnSite": 45, "quantityFull": 8, "inWayToClient": 2, "isRealization": false, "warehouseName": "Коледино", "lastChangeDate": "2022-08-23T05:56:56.323", "inWayFromClient": 0, "supplierArticle": "52003624003", "quantityNotInOrders": 8}	2022-08-23 18:58:59.238337	2022-08-23 18:58:59.238337
91	35	0	{"nmId": 111885790, "Price": 2800, "brand": "Agrilife", "SCCode": "Tech", "barcode": "2038421534628", "subject": "Масло растительное", "Discount": 35, "category": "Продукты", "isSupply": true, "quantity": 0, "techSize": "0", "warehouse": 1, "daysOnSite": 45, "quantityFull": 2, "inWayToClient": 2, "isRealization": false, "warehouseName": "Коледино", "lastChangeDate": "2022-08-23T05:56:56.323", "inWayFromClient": 0, "supplierArticle": "88571217752", "quantityNotInOrders": 2}	2022-08-23 18:58:59.243921	2022-08-23 18:58:59.243921
92	35	7	{"nmId": 111885790, "Price": 2800, "brand": "Agrilife", "SCCode": "Tech", "barcode": "2038421534628", "subject": "Масло растительное", "Discount": 35, "category": "Продукты", "isSupply": true, "quantity": 7, "techSize": "0", "warehouse": 15, "daysOnSite": 45, "quantityFull": 7, "inWayToClient": 0, "isRealization": false, "warehouseName": "Электросталь", "lastChangeDate": "2022-08-23T05:56:56.323", "inWayFromClient": 0, "supplierArticle": "88571217752", "quantityNotInOrders": 7}	2022-08-23 18:58:59.249241	2022-08-23 18:58:59.249241
93	30	0	{"nmId": 110119921, "Price": 1800, "brand": "SITIA", "SCCode": "Tech", "barcode": "2036002208623", "subject": "Масло растительное", "Discount": 47, "category": "Продукты", "isSupply": true, "quantity": 0, "techSize": "0", "warehouse": 1, "daysOnSite": 51, "quantityFull": 3, "inWayToClient": 3, "isRealization": false, "warehouseName": "Коледино", "lastChangeDate": "2022-08-23T05:56:56.323", "inWayFromClient": 0, "supplierArticle": "520011908066981764983278947982", "quantityNotInOrders": 3}	2022-08-23 19:47:51.85837	2022-08-23 19:47:51.85837
94	30	14	{"nmId": 110119921, "Price": 1800, "brand": "SITIA", "SCCode": "Tech", "barcode": "2036002208623", "subject": "Масло растительное", "Discount": 47, "category": "Продукты", "isSupply": true, "quantity": 14, "techSize": "0", "warehouse": 15, "daysOnSite": 51, "quantityFull": 14, "inWayToClient": 0, "isRealization": false, "warehouseName": "Электросталь", "lastChangeDate": "2022-08-23T05:56:56.323", "inWayFromClient": 0, "supplierArticle": "520011908066981764983278947982", "quantityNotInOrders": 14}	2022-08-23 19:47:51.868351	2022-08-23 19:47:51.868351
95	37	6	{"nmId": 111054747, "Price": 2300, "brand": "SITIA", "SCCode": "Tech", "barcode": "5200119080658", "subject": "Масло растительное", "Discount": 30, "category": "Продукты", "isSupply": true, "quantity": 6, "techSize": "0", "warehouse": 1, "daysOnSite": 51, "quantityFull": 10, "inWayToClient": 4, "isRealization": false, "warehouseName": "Коледино", "lastChangeDate": "2022-08-23T05:56:56.323", "inWayFromClient": 0, "supplierArticle": "5200119080675200119080665", "quantityNotInOrders": 10}	2022-08-23 19:47:51.872216	2022-08-23 19:47:51.872216
96	37	18	{"nmId": 111054747, "Price": 2300, "brand": "SITIA", "SCCode": "Tech", "barcode": "5200119080658", "subject": "Масло растительное", "Discount": 30, "category": "Продукты", "isSupply": true, "quantity": 18, "techSize": "0", "warehouse": 15, "daysOnSite": 51, "quantityFull": 18, "inWayToClient": 0, "isRealization": false, "warehouseName": "Электросталь", "lastChangeDate": "2022-08-23T05:56:56.323", "inWayFromClient": 0, "supplierArticle": "5200119080675200119080665", "quantityNotInOrders": 18}	2022-08-23 19:47:51.876059	2022-08-23 19:47:51.876059
97	31	0	{"nmId": 111345604, "Price": 6500, "brand": "SITIA", "SCCode": "Tech", "barcode": "2037838726626", "subject": "Масло растительное", "Discount": 30, "category": "Продукты", "isSupply": true, "quantity": 0, "techSize": "0", "warehouse": 1, "daysOnSite": 45, "quantityFull": 3, "inWayToClient": 3, "isRealization": false, "warehouseName": "Коледино", "lastChangeDate": "2022-08-23T05:56:56.323", "inWayFromClient": 0, "supplierArticle": "5200102953203", "quantityNotInOrders": 3}	2022-08-23 19:47:51.879724	2022-08-23 19:47:51.879724
98	31	11	{"nmId": 111345604, "Price": 6500, "brand": "SITIA", "SCCode": "Tech", "barcode": "2037838726626", "subject": "Масло растительное", "Discount": 30, "category": "Продукты", "isSupply": true, "quantity": 11, "techSize": "0", "warehouse": 15, "daysOnSite": 45, "quantityFull": 11, "inWayToClient": 0, "isRealization": false, "warehouseName": "Электросталь", "lastChangeDate": "2022-08-23T05:56:56.323", "inWayFromClient": 0, "supplierArticle": "5200102953203", "quantityNotInOrders": 11}	2022-08-23 19:47:51.883815	2022-08-23 19:47:51.883815
99	33	0	{"nmId": 111345626, "Price": 1330, "brand": "KOKO", "SCCode": "Tech", "barcode": "2037838797626", "subject": "Масло растительное", "Discount": 33, "category": "Продукты", "isSupply": true, "quantity": 0, "techSize": "0", "warehouse": 1, "daysOnSite": 51, "quantityFull": 3, "inWayToClient": 3, "isRealization": false, "warehouseName": "Коледино", "lastChangeDate": "2022-08-23T05:56:56.323", "inWayFromClient": 0, "supplierArticle": "5205657000631", "quantityNotInOrders": 3}	2022-08-23 19:47:51.887254	2022-08-23 19:47:51.887254
100	33	27	{"nmId": 111345626, "Price": 1330, "brand": "KOKO", "SCCode": "Tech", "barcode": "2037838797626", "subject": "Масло растительное", "Discount": 33, "category": "Продукты", "isSupply": true, "quantity": 27, "techSize": "0", "warehouse": 15, "daysOnSite": 51, "quantityFull": 27, "inWayToClient": 0, "isRealization": false, "warehouseName": "Электросталь", "lastChangeDate": "2022-08-23T05:56:56.323", "inWayFromClient": 0, "supplierArticle": "5205657000631", "quantityNotInOrders": 27}	2022-08-23 19:47:51.895306	2022-08-23 19:47:51.895306
101	34	6	{"nmId": 111885412, "Price": 1380, "brand": "", "SCCode": "Tech", "barcode": "2038421434621", "subject": "Масло растительное", "Discount": 34, "category": "Продукты", "isSupply": true, "quantity": 6, "techSize": "0", "warehouse": 1, "daysOnSite": 45, "quantityFull": 8, "inWayToClient": 2, "isRealization": false, "warehouseName": "Коледино", "lastChangeDate": "2022-08-23T05:56:56.323", "inWayFromClient": 0, "supplierArticle": "52003624003", "quantityNotInOrders": 8}	2022-08-23 19:47:51.904906	2022-08-23 19:47:51.904906
102	35	0	{"nmId": 111885790, "Price": 2800, "brand": "Agrilife", "SCCode": "Tech", "barcode": "2038421534628", "subject": "Масло растительное", "Discount": 35, "category": "Продукты", "isSupply": true, "quantity": 0, "techSize": "0", "warehouse": 1, "daysOnSite": 45, "quantityFull": 2, "inWayToClient": 2, "isRealization": false, "warehouseName": "Коледино", "lastChangeDate": "2022-08-23T05:56:56.323", "inWayFromClient": 0, "supplierArticle": "88571217752", "quantityNotInOrders": 2}	2022-08-23 19:47:51.910912	2022-08-23 19:47:51.910912
103	35	7	{"nmId": 111885790, "Price": 2800, "brand": "Agrilife", "SCCode": "Tech", "barcode": "2038421534628", "subject": "Масло растительное", "Discount": 35, "category": "Продукты", "isSupply": true, "quantity": 7, "techSize": "0", "warehouse": 15, "daysOnSite": 45, "quantityFull": 7, "inWayToClient": 0, "isRealization": false, "warehouseName": "Электросталь", "lastChangeDate": "2022-08-23T05:56:56.323", "inWayFromClient": 0, "supplierArticle": "88571217752", "quantityNotInOrders": 7}	2022-08-23 19:47:51.915993	2022-08-23 19:47:51.915993
104	30	0	{"nmId": 110119921, "Price": 1800, "brand": "SITIA", "SCCode": "Tech", "barcode": "2036002208623", "subject": "Масло растительное", "Discount": 47, "category": "Продукты", "isSupply": true, "quantity": 0, "techSize": "0", "warehouse": 1, "daysOnSite": 51, "quantityFull": 3, "inWayToClient": 3, "isRealization": false, "warehouseName": "Коледино", "lastChangeDate": "2022-08-23T05:56:56.323", "inWayFromClient": 0, "supplierArticle": "520011908066981764983278947982", "quantityNotInOrders": 3}	2022-08-23 22:10:09.492875	2022-08-23 22:10:09.492875
105	30	14	{"nmId": 110119921, "Price": 1800, "brand": "SITIA", "SCCode": "Tech", "barcode": "2036002208623", "subject": "Масло растительное", "Discount": 47, "category": "Продукты", "isSupply": true, "quantity": 14, "techSize": "0", "warehouse": 15, "daysOnSite": 51, "quantityFull": 14, "inWayToClient": 0, "isRealization": false, "warehouseName": "Электросталь", "lastChangeDate": "2022-08-23T05:56:56.323", "inWayFromClient": 0, "supplierArticle": "520011908066981764983278947982", "quantityNotInOrders": 14}	2022-08-23 22:10:09.497699	2022-08-23 22:10:09.497699
106	37	6	{"nmId": 111054747, "Price": 2300, "brand": "SITIA", "SCCode": "Tech", "barcode": "5200119080658", "subject": "Масло растительное", "Discount": 30, "category": "Продукты", "isSupply": true, "quantity": 6, "techSize": "0", "warehouse": 1, "daysOnSite": 51, "quantityFull": 10, "inWayToClient": 4, "isRealization": false, "warehouseName": "Коледино", "lastChangeDate": "2022-08-23T05:56:56.323", "inWayFromClient": 0, "supplierArticle": "5200119080675200119080665", "quantityNotInOrders": 10}	2022-08-23 22:10:09.50231	2022-08-23 22:10:09.50231
107	37	18	{"nmId": 111054747, "Price": 2300, "brand": "SITIA", "SCCode": "Tech", "barcode": "5200119080658", "subject": "Масло растительное", "Discount": 30, "category": "Продукты", "isSupply": true, "quantity": 18, "techSize": "0", "warehouse": 15, "daysOnSite": 51, "quantityFull": 18, "inWayToClient": 0, "isRealization": false, "warehouseName": "Электросталь", "lastChangeDate": "2022-08-23T05:56:56.323", "inWayFromClient": 0, "supplierArticle": "5200119080675200119080665", "quantityNotInOrders": 18}	2022-08-23 22:10:09.506845	2022-08-23 22:10:09.506845
108	31	0	{"nmId": 111345604, "Price": 6500, "brand": "SITIA", "SCCode": "Tech", "barcode": "2037838726626", "subject": "Масло растительное", "Discount": 30, "category": "Продукты", "isSupply": true, "quantity": 0, "techSize": "0", "warehouse": 1, "daysOnSite": 45, "quantityFull": 3, "inWayToClient": 3, "isRealization": false, "warehouseName": "Коледино", "lastChangeDate": "2022-08-23T05:56:56.323", "inWayFromClient": 0, "supplierArticle": "5200102953203", "quantityNotInOrders": 3}	2022-08-23 22:10:09.5114	2022-08-23 22:10:09.5114
109	31	11	{"nmId": 111345604, "Price": 6500, "brand": "SITIA", "SCCode": "Tech", "barcode": "2037838726626", "subject": "Масло растительное", "Discount": 30, "category": "Продукты", "isSupply": true, "quantity": 11, "techSize": "0", "warehouse": 15, "daysOnSite": 45, "quantityFull": 11, "inWayToClient": 0, "isRealization": false, "warehouseName": "Электросталь", "lastChangeDate": "2022-08-23T05:56:56.323", "inWayFromClient": 0, "supplierArticle": "5200102953203", "quantityNotInOrders": 11}	2022-08-23 22:10:09.515857	2022-08-23 22:10:09.515857
110	33	0	{"nmId": 111345626, "Price": 1330, "brand": "KOKO", "SCCode": "Tech", "barcode": "2037838797626", "subject": "Масло растительное", "Discount": 33, "category": "Продукты", "isSupply": true, "quantity": 0, "techSize": "0", "warehouse": 1, "daysOnSite": 51, "quantityFull": 3, "inWayToClient": 3, "isRealization": false, "warehouseName": "Коледино", "lastChangeDate": "2022-08-23T05:56:56.323", "inWayFromClient": 0, "supplierArticle": "5205657000631", "quantityNotInOrders": 3}	2022-08-23 22:10:09.520737	2022-08-23 22:10:09.520737
111	33	27	{"nmId": 111345626, "Price": 1330, "brand": "KOKO", "SCCode": "Tech", "barcode": "2037838797626", "subject": "Масло растительное", "Discount": 33, "category": "Продукты", "isSupply": true, "quantity": 27, "techSize": "0", "warehouse": 15, "daysOnSite": 51, "quantityFull": 27, "inWayToClient": 0, "isRealization": false, "warehouseName": "Электросталь", "lastChangeDate": "2022-08-23T05:56:56.323", "inWayFromClient": 0, "supplierArticle": "5205657000631", "quantityNotInOrders": 27}	2022-08-23 22:10:09.525072	2022-08-23 22:10:09.525072
112	34	6	{"nmId": 111885412, "Price": 1380, "brand": "", "SCCode": "Tech", "barcode": "2038421434621", "subject": "Масло растительное", "Discount": 34, "category": "Продукты", "isSupply": true, "quantity": 6, "techSize": "0", "warehouse": 1, "daysOnSite": 45, "quantityFull": 8, "inWayToClient": 2, "isRealization": false, "warehouseName": "Коледино", "lastChangeDate": "2022-08-23T05:56:56.323", "inWayFromClient": 0, "supplierArticle": "52003624003", "quantityNotInOrders": 8}	2022-08-23 22:10:09.529232	2022-08-23 22:10:09.529232
113	35	0	{"nmId": 111885790, "Price": 2800, "brand": "Agrilife", "SCCode": "Tech", "barcode": "2038421534628", "subject": "Масло растительное", "Discount": 35, "category": "Продукты", "isSupply": true, "quantity": 0, "techSize": "0", "warehouse": 1, "daysOnSite": 45, "quantityFull": 2, "inWayToClient": 2, "isRealization": false, "warehouseName": "Коледино", "lastChangeDate": "2022-08-23T05:56:56.323", "inWayFromClient": 0, "supplierArticle": "88571217752", "quantityNotInOrders": 2}	2022-08-23 22:10:09.533377	2022-08-23 22:10:09.533377
114	35	7	{"nmId": 111885790, "Price": 2800, "brand": "Agrilife", "SCCode": "Tech", "barcode": "2038421534628", "subject": "Масло растительное", "Discount": 35, "category": "Продукты", "isSupply": true, "quantity": 7, "techSize": "0", "warehouse": 15, "daysOnSite": 45, "quantityFull": 7, "inWayToClient": 0, "isRealization": false, "warehouseName": "Электросталь", "lastChangeDate": "2022-08-23T05:56:56.323", "inWayFromClient": 0, "supplierArticle": "88571217752", "quantityNotInOrders": 7}	2022-08-23 22:10:09.537408	2022-08-23 22:10:09.537408
115	40	0	{"nmId": 114788424, "Price": 1000, "brand": "Just Greece", "SCCode": "Tech", "barcode": "2040429296620", "subject": "Оливки", "Discount": 43, "category": "Продукты", "isSupply": true, "quantity": 0, "techSize": "0", "warehouse": 1, "daysOnSite": 20, "quantityFull": 1, "inWayToClient": 1, "isRealization": false, "warehouseName": "Коледино", "lastChangeDate": "2022-08-23T05:56:56.323", "inWayFromClient": 0, "supplierArticle": "zz-52091030656565209103065656", "quantityNotInOrders": 0}	2022-08-23 22:10:09.540929	2022-08-23 22:10:09.540929
116	40	1	{"nmId": 114788424, "Price": 1000, "brand": "Just Greece", "SCCode": "Tech", "barcode": "2040429296620", "subject": "Оливки", "Discount": 43, "category": "Продукты", "isSupply": true, "quantity": 1, "techSize": "0", "warehouse": 15, "daysOnSite": 20, "quantityFull": 1, "inWayToClient": 0, "isRealization": false, "warehouseName": "Электросталь", "lastChangeDate": "2022-08-23T05:56:56.323", "inWayFromClient": 0, "supplierArticle": "zz-52091030656565209103065656", "quantityNotInOrders": 1}	2022-08-23 22:10:09.544704	2022-08-23 22:10:09.544704
117	39	9	{"nmId": 114788690, "Price": 800, "brand": "EcoGreece", "SCCode": "Tech", "barcode": "2040429880621", "subject": "Оливки", "Discount": 49, "category": "Продукты", "isSupply": true, "quantity": 9, "techSize": "0", "warehouse": 15, "daysOnSite": 20, "quantityFull": 9, "inWayToClient": 0, "isRealization": false, "warehouseName": "Электросталь", "lastChangeDate": "2022-08-23T05:56:56.323", "inWayFromClient": 0, "supplierArticle": "ZZ-52014098016935201409801693", "quantityNotInOrders": 9}	2022-08-23 22:10:09.548045	2022-08-23 22:10:09.548045
118	30	0	{"nmId": 110119921, "Price": 1800, "brand": "SITIA", "SCCode": "Tech", "barcode": "2036002208623", "subject": "Масло растительное", "Discount": 47, "category": "Продукты", "isSupply": true, "quantity": 0, "techSize": "0", "warehouse": 1, "daysOnSite": 53, "quantityFull": 4, "inWayToClient": 4, "isRealization": false, "warehouseName": "Коледино", "lastChangeDate": "2022-08-25T04:59:25.76", "inWayFromClient": 0, "supplierArticle": "520011908066981764983278947982", "quantityNotInOrders": 3}	2022-08-25 06:28:31.961454	2022-08-25 06:28:31.961454
119	30	13	{"nmId": 110119921, "Price": 1800, "brand": "SITIA", "SCCode": "Tech", "barcode": "2036002208623", "subject": "Масло растительное", "Discount": 47, "category": "Продукты", "isSupply": true, "quantity": 13, "techSize": "0", "warehouse": 15, "daysOnSite": 53, "quantityFull": 13, "inWayToClient": 0, "isRealization": false, "warehouseName": "Электросталь", "lastChangeDate": "2022-08-25T04:59:25.76", "inWayFromClient": 0, "supplierArticle": "520011908066981764983278947982", "quantityNotInOrders": 13}	2022-08-25 06:28:31.9688	2022-08-25 06:28:31.9688
120	37	5	{"nmId": 111054747, "Price": 2300, "brand": "SITIA", "SCCode": "Tech", "barcode": "5200119080658", "subject": "Масло растительное", "Discount": 30, "category": "Продукты", "isSupply": true, "quantity": 5, "techSize": "0", "warehouse": 1, "daysOnSite": 53, "quantityFull": 7, "inWayToClient": 2, "isRealization": false, "warehouseName": "Коледино", "lastChangeDate": "2022-08-25T04:59:25.76", "inWayFromClient": 0, "supplierArticle": "5200119080675200119080665", "quantityNotInOrders": 7}	2022-08-25 06:28:31.972868	2022-08-25 06:28:31.972868
123	30	0	{"nmId": 110119921, "Price": 1800, "brand": "SITIA", "SCCode": "Tech", "barcode": "2036002208623", "subject": "Масло растительное", "Discount": 47, "category": "Продукты", "isSupply": true, "quantity": 0, "techSize": "0", "warehouse": 1, "daysOnSite": 53, "quantityFull": 4, "inWayToClient": 4, "isRealization": false, "warehouseName": "Коледино", "lastChangeDate": "2022-08-25T04:59:25.76", "inWayFromClient": 0, "supplierArticle": "520011908066981764983278947982", "quantityNotInOrders": 3}	2022-08-25 06:37:35.238551	2022-08-25 06:37:35.238551
124	30	13	{"nmId": 110119921, "Price": 1800, "brand": "SITIA", "SCCode": "Tech", "barcode": "2036002208623", "subject": "Масло растительное", "Discount": 47, "category": "Продукты", "isSupply": true, "quantity": 13, "techSize": "0", "warehouse": 15, "daysOnSite": 53, "quantityFull": 13, "inWayToClient": 0, "isRealization": false, "warehouseName": "Электросталь", "lastChangeDate": "2022-08-25T04:59:25.76", "inWayFromClient": 0, "supplierArticle": "520011908066981764983278947982", "quantityNotInOrders": 13}	2022-08-25 06:37:35.245863	2022-08-25 06:37:35.245863
125	37	5	{"nmId": 111054747, "Price": 2300, "brand": "SITIA", "SCCode": "Tech", "barcode": "5200119080658", "subject": "Масло растительное", "Discount": 30, "category": "Продукты", "isSupply": true, "quantity": 5, "techSize": "0", "warehouse": 1, "daysOnSite": 53, "quantityFull": 7, "inWayToClient": 2, "isRealization": false, "warehouseName": "Коледино", "lastChangeDate": "2022-08-25T04:59:25.76", "inWayFromClient": 0, "supplierArticle": "5200119080675200119080665", "quantityNotInOrders": 7}	2022-08-25 06:37:35.249951	2022-08-25 06:37:35.249951
126	37	18	{"nmId": 111054747, "Price": 2300, "brand": "SITIA", "SCCode": "Tech", "barcode": "5200119080658", "subject": "Масло растительное", "Discount": 30, "category": "Продукты", "isSupply": true, "quantity": 18, "techSize": "0", "warehouse": 15, "daysOnSite": 53, "quantityFull": 18, "inWayToClient": 0, "isRealization": false, "warehouseName": "Электросталь", "lastChangeDate": "2022-08-25T04:59:25.76", "inWayFromClient": 0, "supplierArticle": "5200119080675200119080665", "quantityNotInOrders": 18}	2022-08-25 06:37:35.259902	2022-08-25 06:37:35.259902
127	31	0	{"nmId": 111345604, "Price": 6500, "brand": "SITIA", "SCCode": "Tech", "barcode": "2037838726626", "subject": "Масло растительное", "Discount": 30, "category": "Продукты", "isSupply": true, "quantity": 0, "techSize": "0", "warehouse": 1, "daysOnSite": 47, "quantityFull": 1, "inWayToClient": 1, "isRealization": false, "warehouseName": "Коледино", "lastChangeDate": "2022-08-25T04:59:25.76", "inWayFromClient": 0, "supplierArticle": "5200102953203", "quantityNotInOrders": 1}	2022-08-25 06:37:35.263185	2022-08-25 06:37:35.263185
128	31	11	{"nmId": 111345604, "Price": 6500, "brand": "SITIA", "SCCode": "Tech", "barcode": "2037838726626", "subject": "Масло растительное", "Discount": 30, "category": "Продукты", "isSupply": true, "quantity": 11, "techSize": "0", "warehouse": 15, "daysOnSite": 47, "quantityFull": 11, "inWayToClient": 0, "isRealization": false, "warehouseName": "Электросталь", "lastChangeDate": "2022-08-25T04:59:25.76", "inWayFromClient": 0, "supplierArticle": "5200102953203", "quantityNotInOrders": 11}	2022-08-25 06:37:35.266223	2022-08-25 06:37:35.266223
129	33	0	{"nmId": 111345626, "Price": 1330, "brand": "KOKO", "SCCode": "Tech", "barcode": "2037838797626", "subject": "Масло растительное", "Discount": 33, "category": "Продукты", "isSupply": true, "quantity": 0, "techSize": "0", "warehouse": 1, "daysOnSite": 53, "quantityFull": 4, "inWayToClient": 4, "isRealization": false, "warehouseName": "Коледино", "lastChangeDate": "2022-08-25T04:59:25.76", "inWayFromClient": 0, "supplierArticle": "5205657000631", "quantityNotInOrders": 4}	2022-08-25 06:37:35.269408	2022-08-25 06:37:35.269408
130	33	25	{"nmId": 111345626, "Price": 1330, "brand": "KOKO", "SCCode": "Tech", "barcode": "2037838797626", "subject": "Масло растительное", "Discount": 33, "category": "Продукты", "isSupply": true, "quantity": 25, "techSize": "0", "warehouse": 15, "daysOnSite": 53, "quantityFull": 25, "inWayToClient": 0, "isRealization": false, "warehouseName": "Электросталь", "lastChangeDate": "2022-08-25T04:59:25.76", "inWayFromClient": 0, "supplierArticle": "5205657000631", "quantityNotInOrders": 25}	2022-08-25 06:37:35.272631	2022-08-25 06:37:35.272631
131	34	0	{"nmId": 111885412, "Price": 1380, "brand": "", "SCCode": "Tech", "barcode": "2038421434621", "subject": "Масло растительное", "Discount": 34, "category": "Продукты", "isSupply": true, "quantity": 0, "techSize": "0", "warehouse": 1, "daysOnSite": 47, "quantityFull": 8, "inWayToClient": 8, "isRealization": false, "warehouseName": "Коледино", "lastChangeDate": "2022-08-25T04:59:25.76", "inWayFromClient": 0, "supplierArticle": "52003624003", "quantityNotInOrders": 8}	2022-08-25 06:37:35.275543	2022-08-25 06:37:35.275543
132	35	0	{"nmId": 111885790, "Price": 2800, "brand": "Agrilife", "SCCode": "Tech", "barcode": "2038421534628", "subject": "Масло растительное", "Discount": 35, "category": "Продукты", "isSupply": true, "quantity": 0, "techSize": "0", "warehouse": 1, "daysOnSite": 47, "quantityFull": 3, "inWayToClient": 3, "isRealization": false, "warehouseName": "Коледино", "lastChangeDate": "2022-08-25T04:59:25.76", "inWayFromClient": 0, "supplierArticle": "88571217752", "quantityNotInOrders": 3}	2022-08-25 06:37:35.278833	2022-08-25 06:37:35.278833
133	35	6	{"nmId": 111885790, "Price": 2800, "brand": "Agrilife", "SCCode": "Tech", "barcode": "2038421534628", "subject": "Масло растительное", "Discount": 35, "category": "Продукты", "isSupply": true, "quantity": 6, "techSize": "0", "warehouse": 15, "daysOnSite": 47, "quantityFull": 6, "inWayToClient": 0, "isRealization": false, "warehouseName": "Электросталь", "lastChangeDate": "2022-08-25T04:59:25.76", "inWayFromClient": 0, "supplierArticle": "88571217752", "quantityNotInOrders": 6}	2022-08-25 06:37:35.282094	2022-08-25 06:37:35.282094
134	40	1	{"nmId": 114788424, "Price": 1000, "brand": "Just Greece", "SCCode": "Tech", "barcode": "2040429296620", "subject": "Оливки", "Discount": 43, "category": "Продукты", "isSupply": true, "quantity": 1, "techSize": "0", "warehouse": 15, "daysOnSite": 22, "quantityFull": 1, "inWayToClient": 0, "isRealization": false, "warehouseName": "Электросталь", "lastChangeDate": "2022-08-25T04:59:25.76", "inWayFromClient": 0, "supplierArticle": "zz-52091030656565209103065656", "quantityNotInOrders": 1}	2022-08-25 06:37:35.285099	2022-08-25 06:37:35.285099
135	39	9	{"nmId": 114788690, "Price": 800, "brand": "EcoGreece", "SCCode": "Tech", "barcode": "2040429880621", "subject": "Оливки", "Discount": 49, "category": "Продукты", "isSupply": true, "quantity": 9, "techSize": "0", "warehouse": 15, "daysOnSite": 22, "quantityFull": 9, "inWayToClient": 0, "isRealization": false, "warehouseName": "Электросталь", "lastChangeDate": "2022-08-25T04:59:25.76", "inWayFromClient": 0, "supplierArticle": "ZZ-52014098016935201409801693", "quantityNotInOrders": 9}	2022-08-25 06:37:35.28814	2022-08-25 06:37:35.28814
136	38	14	{"nmId": 117329468, "Price": 1690, "brand": "MINERVA", "SCCode": "Tech", "barcode": "2041990946624", "subject": "Масло растительное", "Discount": 0, "category": "Продукты", "isSupply": true, "quantity": 14, "techSize": "0", "warehouse": 1, "daysOnSite": 0, "quantityFull": 15, "inWayToClient": 1, "isRealization": false, "warehouseName": "Коледино", "lastChangeDate": "2022-08-25T04:59:25.76", "inWayFromClient": 0, "supplierArticle": "5201106190748", "quantityNotInOrders": 15}	2022-08-25 06:37:35.291373	2022-08-25 06:37:35.291373
137	40	0	{"nmId": 114788424, "Price": 1000, "brand": "Just Greece", "SCCode": "Tech", "barcode": "2040429296620", "subject": "Оливки", "Discount": 43, "category": "Продукты", "isSupply": true, "quantity": 0, "techSize": "0", "warehouse": 1, "daysOnSite": 21, "quantityFull": 0, "inWayToClient": 0, "isRealization": false, "warehouseName": "Коледино", "lastChangeDate": "2022-08-25T06:14:42.977", "inWayFromClient": 0, "supplierArticle": "zz-52091030656565209103065656", "quantityNotInOrders": 0}	2022-08-25 06:37:35.294372	2022-08-25 06:37:35.294372
138	30	0	{"nmId": 110119921, "Price": 1800, "brand": "SITIA", "SCCode": "Tech", "barcode": "2036002208623", "subject": "Масло растительное", "Discount": 47, "category": "Продукты", "isSupply": true, "quantity": 0, "techSize": "0", "warehouse": 1, "daysOnSite": 53, "quantityFull": 4, "inWayToClient": 4, "isRealization": false, "warehouseName": "Коледино", "lastChangeDate": "2022-08-25T04:59:25.76", "inWayFromClient": 0, "supplierArticle": "520011908066981764983278947982", "quantityNotInOrders": 3}	2022-08-25 17:32:10.2236	2022-08-25 17:32:10.2236
139	30	13	{"nmId": 110119921, "Price": 1800, "brand": "SITIA", "SCCode": "Tech", "barcode": "2036002208623", "subject": "Масло растительное", "Discount": 47, "category": "Продукты", "isSupply": true, "quantity": 13, "techSize": "0", "warehouse": 15, "daysOnSite": 53, "quantityFull": 13, "inWayToClient": 0, "isRealization": false, "warehouseName": "Электросталь", "lastChangeDate": "2022-08-25T04:59:25.76", "inWayFromClient": 0, "supplierArticle": "520011908066981764983278947982", "quantityNotInOrders": 13}	2022-08-25 17:32:10.229544	2022-08-25 17:32:10.229544
140	37	5	{"nmId": 111054747, "Price": 2300, "brand": "SITIA", "SCCode": "Tech", "barcode": "5200119080658", "subject": "Масло растительное", "Discount": 30, "category": "Продукты", "isSupply": true, "quantity": 5, "techSize": "0", "warehouse": 1, "daysOnSite": 53, "quantityFull": 7, "inWayToClient": 2, "isRealization": false, "warehouseName": "Коледино", "lastChangeDate": "2022-08-25T04:59:25.76", "inWayFromClient": 0, "supplierArticle": "5200119080675200119080665", "quantityNotInOrders": 7}	2022-08-25 17:32:10.233054	2022-08-25 17:32:10.233054
141	37	18	{"nmId": 111054747, "Price": 2300, "brand": "SITIA", "SCCode": "Tech", "barcode": "5200119080658", "subject": "Масло растительное", "Discount": 30, "category": "Продукты", "isSupply": true, "quantity": 18, "techSize": "0", "warehouse": 15, "daysOnSite": 53, "quantityFull": 18, "inWayToClient": 0, "isRealization": false, "warehouseName": "Электросталь", "lastChangeDate": "2022-08-25T04:59:25.76", "inWayFromClient": 0, "supplierArticle": "5200119080675200119080665", "quantityNotInOrders": 18}	2022-08-25 17:32:10.236242	2022-08-25 17:32:10.236242
142	31	0	{"nmId": 111345604, "Price": 6500, "brand": "SITIA", "SCCode": "Tech", "barcode": "2037838726626", "subject": "Масло растительное", "Discount": 30, "category": "Продукты", "isSupply": true, "quantity": 0, "techSize": "0", "warehouse": 1, "daysOnSite": 47, "quantityFull": 1, "inWayToClient": 1, "isRealization": false, "warehouseName": "Коледино", "lastChangeDate": "2022-08-25T04:59:25.76", "inWayFromClient": 0, "supplierArticle": "5200102953203", "quantityNotInOrders": 1}	2022-08-25 17:32:10.239582	2022-08-25 17:32:10.239582
143	31	11	{"nmId": 111345604, "Price": 6500, "brand": "SITIA", "SCCode": "Tech", "barcode": "2037838726626", "subject": "Масло растительное", "Discount": 30, "category": "Продукты", "isSupply": true, "quantity": 11, "techSize": "0", "warehouse": 15, "daysOnSite": 47, "quantityFull": 11, "inWayToClient": 0, "isRealization": false, "warehouseName": "Электросталь", "lastChangeDate": "2022-08-25T04:59:25.76", "inWayFromClient": 0, "supplierArticle": "5200102953203", "quantityNotInOrders": 11}	2022-08-25 17:32:10.243212	2022-08-25 17:32:10.243212
144	33	0	{"nmId": 111345626, "Price": 1330, "brand": "KOKO", "SCCode": "Tech", "barcode": "2037838797626", "subject": "Масло растительное", "Discount": 33, "category": "Продукты", "isSupply": true, "quantity": 0, "techSize": "0", "warehouse": 1, "daysOnSite": 53, "quantityFull": 4, "inWayToClient": 4, "isRealization": false, "warehouseName": "Коледино", "lastChangeDate": "2022-08-25T04:59:25.76", "inWayFromClient": 0, "supplierArticle": "5205657000631", "quantityNotInOrders": 4}	2022-08-25 17:32:10.246492	2022-08-25 17:32:10.246492
145	33	25	{"nmId": 111345626, "Price": 1330, "brand": "KOKO", "SCCode": "Tech", "barcode": "2037838797626", "subject": "Масло растительное", "Discount": 33, "category": "Продукты", "isSupply": true, "quantity": 25, "techSize": "0", "warehouse": 15, "daysOnSite": 53, "quantityFull": 25, "inWayToClient": 0, "isRealization": false, "warehouseName": "Электросталь", "lastChangeDate": "2022-08-25T04:59:25.76", "inWayFromClient": 0, "supplierArticle": "5205657000631", "quantityNotInOrders": 25}	2022-08-25 17:32:10.2496	2022-08-25 17:32:10.2496
146	34	0	{"nmId": 111885412, "Price": 1380, "brand": "", "SCCode": "Tech", "barcode": "2038421434621", "subject": "Масло растительное", "Discount": 34, "category": "Продукты", "isSupply": true, "quantity": 0, "techSize": "0", "warehouse": 1, "daysOnSite": 47, "quantityFull": 8, "inWayToClient": 8, "isRealization": false, "warehouseName": "Коледино", "lastChangeDate": "2022-08-25T04:59:25.76", "inWayFromClient": 0, "supplierArticle": "52003624003", "quantityNotInOrders": 8}	2022-08-25 17:32:10.25271	2022-08-25 17:32:10.25271
147	35	0	{"nmId": 111885790, "Price": 2800, "brand": "Agrilife", "SCCode": "Tech", "barcode": "2038421534628", "subject": "Масло растительное", "Discount": 35, "category": "Продукты", "isSupply": true, "quantity": 0, "techSize": "0", "warehouse": 1, "daysOnSite": 47, "quantityFull": 3, "inWayToClient": 3, "isRealization": false, "warehouseName": "Коледино", "lastChangeDate": "2022-08-25T04:59:25.76", "inWayFromClient": 0, "supplierArticle": "88571217752", "quantityNotInOrders": 3}	2022-08-25 17:32:10.255818	2022-08-25 17:32:10.255818
148	35	6	{"nmId": 111885790, "Price": 2800, "brand": "Agrilife", "SCCode": "Tech", "barcode": "2038421534628", "subject": "Масло растительное", "Discount": 35, "category": "Продукты", "isSupply": true, "quantity": 6, "techSize": "0", "warehouse": 15, "daysOnSite": 47, "quantityFull": 6, "inWayToClient": 0, "isRealization": false, "warehouseName": "Электросталь", "lastChangeDate": "2022-08-25T04:59:25.76", "inWayFromClient": 0, "supplierArticle": "88571217752", "quantityNotInOrders": 6}	2022-08-25 17:32:10.259446	2022-08-25 17:32:10.259446
149	40	1	{"nmId": 114788424, "Price": 1000, "brand": "Just Greece", "SCCode": "Tech", "barcode": "2040429296620", "subject": "Оливки", "Discount": 43, "category": "Продукты", "isSupply": true, "quantity": 1, "techSize": "0", "warehouse": 15, "daysOnSite": 22, "quantityFull": 1, "inWayToClient": 0, "isRealization": false, "warehouseName": "Электросталь", "lastChangeDate": "2022-08-25T04:59:25.76", "inWayFromClient": 0, "supplierArticle": "zz-52091030656565209103065656", "quantityNotInOrders": 1}	2022-08-25 17:32:10.262485	2022-08-25 17:32:10.262485
150	39	9	{"nmId": 114788690, "Price": 800, "brand": "EcoGreece", "SCCode": "Tech", "barcode": "2040429880621", "subject": "Оливки", "Discount": 49, "category": "Продукты", "isSupply": true, "quantity": 9, "techSize": "0", "warehouse": 15, "daysOnSite": 22, "quantityFull": 9, "inWayToClient": 0, "isRealization": false, "warehouseName": "Электросталь", "lastChangeDate": "2022-08-25T04:59:25.76", "inWayFromClient": 0, "supplierArticle": "ZZ-52014098016935201409801693", "quantityNotInOrders": 9}	2022-08-25 17:32:10.265306	2022-08-25 17:32:10.265306
151	38	14	{"nmId": 117329468, "Price": 1690, "brand": "MINERVA", "SCCode": "Tech", "barcode": "2041990946624", "subject": "Масло растительное", "Discount": 0, "category": "Продукты", "isSupply": true, "quantity": 14, "techSize": "0", "warehouse": 1, "daysOnSite": 0, "quantityFull": 15, "inWayToClient": 1, "isRealization": false, "warehouseName": "Коледино", "lastChangeDate": "2022-08-25T04:59:25.76", "inWayFromClient": 0, "supplierArticle": "5201106190748", "quantityNotInOrders": 15}	2022-08-25 17:32:10.26817	2022-08-25 17:32:10.26817
152	40	0	{"nmId": 114788424, "Price": 1000, "brand": "Just Greece", "SCCode": "Tech", "barcode": "2040429296620", "subject": "Оливки", "Discount": 43, "category": "Продукты", "isSupply": true, "quantity": 0, "techSize": "0", "warehouse": 1, "daysOnSite": 21, "quantityFull": 0, "inWayToClient": 0, "isRealization": false, "warehouseName": "Коледино", "lastChangeDate": "2022-08-25T06:14:42.977", "inWayFromClient": 0, "supplierArticle": "zz-52091030656565209103065656", "quantityNotInOrders": 0}	2022-08-25 17:32:10.271222	2022-08-25 17:32:10.271222
153	30	0	{"nmId": 110119921, "Price": 1800, "brand": "SITIA", "SCCode": "Tech", "barcode": "2036002208623", "subject": "Масло растительное", "Discount": 47, "category": "Продукты", "isSupply": true, "quantity": 0, "techSize": "0", "warehouse": 1, "daysOnSite": 53, "quantityFull": 4, "inWayToClient": 4, "isRealization": false, "warehouseName": "Коледино", "lastChangeDate": "2022-08-25T04:59:25.76", "inWayFromClient": 0, "supplierArticle": "520011908066981764983278947982", "quantityNotInOrders": 3}	2022-08-25 18:31:02.689953	2022-08-25 18:31:02.689953
154	30	13	{"nmId": 110119921, "Price": 1800, "brand": "SITIA", "SCCode": "Tech", "barcode": "2036002208623", "subject": "Масло растительное", "Discount": 47, "category": "Продукты", "isSupply": true, "quantity": 13, "techSize": "0", "warehouse": 15, "daysOnSite": 53, "quantityFull": 13, "inWayToClient": 0, "isRealization": false, "warehouseName": "Электросталь", "lastChangeDate": "2022-08-25T04:59:25.76", "inWayFromClient": 0, "supplierArticle": "520011908066981764983278947982", "quantityNotInOrders": 13}	2022-08-25 18:31:02.705219	2022-08-25 18:31:02.705219
155	37	5	{"nmId": 111054747, "Price": 2300, "brand": "SITIA", "SCCode": "Tech", "barcode": "5200119080658", "subject": "Масло растительное", "Discount": 30, "category": "Продукты", "isSupply": true, "quantity": 5, "techSize": "0", "warehouse": 1, "daysOnSite": 53, "quantityFull": 7, "inWayToClient": 2, "isRealization": false, "warehouseName": "Коледино", "lastChangeDate": "2022-08-25T04:59:25.76", "inWayFromClient": 0, "supplierArticle": "5200119080675200119080665", "quantityNotInOrders": 7}	2022-08-25 18:31:02.716826	2022-08-25 18:31:02.716826
156	37	18	{"nmId": 111054747, "Price": 2300, "brand": "SITIA", "SCCode": "Tech", "barcode": "5200119080658", "subject": "Масло растительное", "Discount": 30, "category": "Продукты", "isSupply": true, "quantity": 18, "techSize": "0", "warehouse": 15, "daysOnSite": 53, "quantityFull": 18, "inWayToClient": 0, "isRealization": false, "warehouseName": "Электросталь", "lastChangeDate": "2022-08-25T04:59:25.76", "inWayFromClient": 0, "supplierArticle": "5200119080675200119080665", "quantityNotInOrders": 18}	2022-08-25 18:31:02.724457	2022-08-25 18:31:02.724457
157	31	0	{"nmId": 111345604, "Price": 6500, "brand": "SITIA", "SCCode": "Tech", "barcode": "2037838726626", "subject": "Масло растительное", "Discount": 30, "category": "Продукты", "isSupply": true, "quantity": 0, "techSize": "0", "warehouse": 1, "daysOnSite": 47, "quantityFull": 1, "inWayToClient": 1, "isRealization": false, "warehouseName": "Коледино", "lastChangeDate": "2022-08-25T04:59:25.76", "inWayFromClient": 0, "supplierArticle": "5200102953203", "quantityNotInOrders": 1}	2022-08-25 18:31:02.727616	2022-08-25 18:31:02.727616
158	31	11	{"nmId": 111345604, "Price": 6500, "brand": "SITIA", "SCCode": "Tech", "barcode": "2037838726626", "subject": "Масло растительное", "Discount": 30, "category": "Продукты", "isSupply": true, "quantity": 11, "techSize": "0", "warehouse": 15, "daysOnSite": 47, "quantityFull": 11, "inWayToClient": 0, "isRealization": false, "warehouseName": "Электросталь", "lastChangeDate": "2022-08-25T04:59:25.76", "inWayFromClient": 0, "supplierArticle": "5200102953203", "quantityNotInOrders": 11}	2022-08-25 18:31:02.730672	2022-08-25 18:31:02.730672
159	33	0	{"nmId": 111345626, "Price": 1330, "brand": "KOKO", "SCCode": "Tech", "barcode": "2037838797626", "subject": "Масло растительное", "Discount": 33, "category": "Продукты", "isSupply": true, "quantity": 0, "techSize": "0", "warehouse": 1, "daysOnSite": 53, "quantityFull": 4, "inWayToClient": 4, "isRealization": false, "warehouseName": "Коледино", "lastChangeDate": "2022-08-25T04:59:25.76", "inWayFromClient": 0, "supplierArticle": "5205657000631", "quantityNotInOrders": 4}	2022-08-25 18:31:02.733926	2022-08-25 18:31:02.733926
160	33	25	{"nmId": 111345626, "Price": 1330, "brand": "KOKO", "SCCode": "Tech", "barcode": "2037838797626", "subject": "Масло растительное", "Discount": 33, "category": "Продукты", "isSupply": true, "quantity": 25, "techSize": "0", "warehouse": 15, "daysOnSite": 53, "quantityFull": 25, "inWayToClient": 0, "isRealization": false, "warehouseName": "Электросталь", "lastChangeDate": "2022-08-25T04:59:25.76", "inWayFromClient": 0, "supplierArticle": "5205657000631", "quantityNotInOrders": 25}	2022-08-25 18:31:02.737378	2022-08-25 18:31:02.737378
161	34	0	{"nmId": 111885412, "Price": 1380, "brand": "", "SCCode": "Tech", "barcode": "2038421434621", "subject": "Масло растительное", "Discount": 34, "category": "Продукты", "isSupply": true, "quantity": 0, "techSize": "0", "warehouse": 1, "daysOnSite": 47, "quantityFull": 8, "inWayToClient": 8, "isRealization": false, "warehouseName": "Коледино", "lastChangeDate": "2022-08-25T04:59:25.76", "inWayFromClient": 0, "supplierArticle": "52003624003", "quantityNotInOrders": 8}	2022-08-25 18:31:02.740351	2022-08-25 18:31:02.740351
162	35	0	{"nmId": 111885790, "Price": 2800, "brand": "Agrilife", "SCCode": "Tech", "barcode": "2038421534628", "subject": "Масло растительное", "Discount": 35, "category": "Продукты", "isSupply": true, "quantity": 0, "techSize": "0", "warehouse": 1, "daysOnSite": 47, "quantityFull": 3, "inWayToClient": 3, "isRealization": false, "warehouseName": "Коледино", "lastChangeDate": "2022-08-25T04:59:25.76", "inWayFromClient": 0, "supplierArticle": "88571217752", "quantityNotInOrders": 3}	2022-08-25 18:31:02.743256	2022-08-25 18:31:02.743256
163	35	6	{"nmId": 111885790, "Price": 2800, "brand": "Agrilife", "SCCode": "Tech", "barcode": "2038421534628", "subject": "Масло растительное", "Discount": 35, "category": "Продукты", "isSupply": true, "quantity": 6, "techSize": "0", "warehouse": 15, "daysOnSite": 47, "quantityFull": 6, "inWayToClient": 0, "isRealization": false, "warehouseName": "Электросталь", "lastChangeDate": "2022-08-25T04:59:25.76", "inWayFromClient": 0, "supplierArticle": "88571217752", "quantityNotInOrders": 6}	2022-08-25 18:31:02.746334	2022-08-25 18:31:02.746334
164	40	1	{"nmId": 114788424, "Price": 1000, "brand": "Just Greece", "SCCode": "Tech", "barcode": "2040429296620", "subject": "Оливки", "Discount": 43, "category": "Продукты", "isSupply": true, "quantity": 1, "techSize": "0", "warehouse": 15, "daysOnSite": 22, "quantityFull": 1, "inWayToClient": 0, "isRealization": false, "warehouseName": "Электросталь", "lastChangeDate": "2022-08-25T04:59:25.76", "inWayFromClient": 0, "supplierArticle": "zz-52091030656565209103065656", "quantityNotInOrders": 1}	2022-08-25 18:31:02.749476	2022-08-25 18:31:02.749476
165	39	9	{"nmId": 114788690, "Price": 800, "brand": "EcoGreece", "SCCode": "Tech", "barcode": "2040429880621", "subject": "Оливки", "Discount": 49, "category": "Продукты", "isSupply": true, "quantity": 9, "techSize": "0", "warehouse": 15, "daysOnSite": 22, "quantityFull": 9, "inWayToClient": 0, "isRealization": false, "warehouseName": "Электросталь", "lastChangeDate": "2022-08-25T04:59:25.76", "inWayFromClient": 0, "supplierArticle": "ZZ-52014098016935201409801693", "quantityNotInOrders": 9}	2022-08-25 18:31:02.752543	2022-08-25 18:31:02.752543
166	38	14	{"nmId": 117329468, "Price": 1690, "brand": "MINERVA", "SCCode": "Tech", "barcode": "2041990946624", "subject": "Масло растительное", "Discount": 0, "category": "Продукты", "isSupply": true, "quantity": 14, "techSize": "0", "warehouse": 1, "daysOnSite": 0, "quantityFull": 15, "inWayToClient": 1, "isRealization": false, "warehouseName": "Коледино", "lastChangeDate": "2022-08-25T04:59:25.76", "inWayFromClient": 0, "supplierArticle": "5201106190748", "quantityNotInOrders": 15}	2022-08-25 18:31:02.758773	2022-08-25 18:31:02.758773
167	40	0	{"nmId": 114788424, "Price": 1000, "brand": "Just Greece", "SCCode": "Tech", "barcode": "2040429296620", "subject": "Оливки", "Discount": 43, "category": "Продукты", "isSupply": true, "quantity": 0, "techSize": "0", "warehouse": 1, "daysOnSite": 21, "quantityFull": 0, "inWayToClient": 0, "isRealization": false, "warehouseName": "Коледино", "lastChangeDate": "2022-08-25T06:14:42.977", "inWayFromClient": 0, "supplierArticle": "zz-52091030656565209103065656", "quantityNotInOrders": 0}	2022-08-25 18:31:02.761749	2022-08-25 18:31:02.761749
168	30	0	{"nmId": 110119921, "Price": 1800, "brand": "SITIA", "SCCode": "Tech", "barcode": "2036002208623", "subject": "Масло растительное", "Discount": 47, "category": "Продукты", "isSupply": true, "quantity": 0, "techSize": "0", "warehouse": 1, "daysOnSite": 53, "quantityFull": 4, "inWayToClient": 4, "isRealization": false, "warehouseName": "Коледино", "lastChangeDate": "2022-08-25T04:59:25.76", "inWayFromClient": 0, "supplierArticle": "520011908066981764983278947982", "quantityNotInOrders": 3}	2022-08-25 20:27:44.900469	2022-08-25 20:27:44.900469
169	30	13	{"nmId": 110119921, "Price": 1800, "brand": "SITIA", "SCCode": "Tech", "barcode": "2036002208623", "subject": "Масло растительное", "Discount": 47, "category": "Продукты", "isSupply": true, "quantity": 13, "techSize": "0", "warehouse": 15, "daysOnSite": 53, "quantityFull": 13, "inWayToClient": 0, "isRealization": false, "warehouseName": "Электросталь", "lastChangeDate": "2022-08-25T04:59:25.76", "inWayFromClient": 0, "supplierArticle": "520011908066981764983278947982", "quantityNotInOrders": 13}	2022-08-25 20:27:44.907293	2022-08-25 20:27:44.907293
170	37	5	{"nmId": 111054747, "Price": 2300, "brand": "SITIA", "SCCode": "Tech", "barcode": "5200119080658", "subject": "Масло растительное", "Discount": 30, "category": "Продукты", "isSupply": true, "quantity": 5, "techSize": "0", "warehouse": 1, "daysOnSite": 53, "quantityFull": 7, "inWayToClient": 2, "isRealization": false, "warehouseName": "Коледино", "lastChangeDate": "2022-08-25T04:59:25.76", "inWayFromClient": 0, "supplierArticle": "5200119080675200119080665", "quantityNotInOrders": 7}	2022-08-25 20:27:44.910768	2022-08-25 20:27:44.910768
171	37	18	{"nmId": 111054747, "Price": 2300, "brand": "SITIA", "SCCode": "Tech", "barcode": "5200119080658", "subject": "Масло растительное", "Discount": 30, "category": "Продукты", "isSupply": true, "quantity": 18, "techSize": "0", "warehouse": 15, "daysOnSite": 53, "quantityFull": 18, "inWayToClient": 0, "isRealization": false, "warehouseName": "Электросталь", "lastChangeDate": "2022-08-25T04:59:25.76", "inWayFromClient": 0, "supplierArticle": "5200119080675200119080665", "quantityNotInOrders": 18}	2022-08-25 20:27:44.914031	2022-08-25 20:27:44.914031
172	31	0	{"nmId": 111345604, "Price": 6500, "brand": "SITIA", "SCCode": "Tech", "barcode": "2037838726626", "subject": "Масло растительное", "Discount": 30, "category": "Продукты", "isSupply": true, "quantity": 0, "techSize": "0", "warehouse": 1, "daysOnSite": 47, "quantityFull": 1, "inWayToClient": 1, "isRealization": false, "warehouseName": "Коледино", "lastChangeDate": "2022-08-25T04:59:25.76", "inWayFromClient": 0, "supplierArticle": "5200102953203", "quantityNotInOrders": 1}	2022-08-25 20:27:44.917382	2022-08-25 20:27:44.917382
173	31	11	{"nmId": 111345604, "Price": 6500, "brand": "SITIA", "SCCode": "Tech", "barcode": "2037838726626", "subject": "Масло растительное", "Discount": 30, "category": "Продукты", "isSupply": true, "quantity": 11, "techSize": "0", "warehouse": 15, "daysOnSite": 47, "quantityFull": 11, "inWayToClient": 0, "isRealization": false, "warehouseName": "Электросталь", "lastChangeDate": "2022-08-25T04:59:25.76", "inWayFromClient": 0, "supplierArticle": "5200102953203", "quantityNotInOrders": 11}	2022-08-25 20:27:44.926758	2022-08-25 20:27:44.926758
174	33	0	{"nmId": 111345626, "Price": 1330, "brand": "KOKO", "SCCode": "Tech", "barcode": "2037838797626", "subject": "Масло растительное", "Discount": 33, "category": "Продукты", "isSupply": true, "quantity": 0, "techSize": "0", "warehouse": 1, "daysOnSite": 53, "quantityFull": 4, "inWayToClient": 4, "isRealization": false, "warehouseName": "Коледино", "lastChangeDate": "2022-08-25T04:59:25.76", "inWayFromClient": 0, "supplierArticle": "5205657000631", "quantityNotInOrders": 4}	2022-08-25 20:27:44.935971	2022-08-25 20:27:44.935971
175	33	25	{"nmId": 111345626, "Price": 1330, "brand": "KOKO", "SCCode": "Tech", "barcode": "2037838797626", "subject": "Масло растительное", "Discount": 33, "category": "Продукты", "isSupply": true, "quantity": 25, "techSize": "0", "warehouse": 15, "daysOnSite": 53, "quantityFull": 25, "inWayToClient": 0, "isRealization": false, "warehouseName": "Электросталь", "lastChangeDate": "2022-08-25T04:59:25.76", "inWayFromClient": 0, "supplierArticle": "5205657000631", "quantityNotInOrders": 25}	2022-08-25 20:27:44.944899	2022-08-25 20:27:44.944899
176	34	0	{"nmId": 111885412, "Price": 1380, "brand": "", "SCCode": "Tech", "barcode": "2038421434621", "subject": "Масло растительное", "Discount": 34, "category": "Продукты", "isSupply": true, "quantity": 0, "techSize": "0", "warehouse": 1, "daysOnSite": 47, "quantityFull": 8, "inWayToClient": 8, "isRealization": false, "warehouseName": "Коледино", "lastChangeDate": "2022-08-25T04:59:25.76", "inWayFromClient": 0, "supplierArticle": "52003624003", "quantityNotInOrders": 8}	2022-08-25 20:27:44.95329	2022-08-25 20:27:44.95329
177	35	0	{"nmId": 111885790, "Price": 2800, "brand": "Agrilife", "SCCode": "Tech", "barcode": "2038421534628", "subject": "Масло растительное", "Discount": 35, "category": "Продукты", "isSupply": true, "quantity": 0, "techSize": "0", "warehouse": 1, "daysOnSite": 47, "quantityFull": 3, "inWayToClient": 3, "isRealization": false, "warehouseName": "Коледино", "lastChangeDate": "2022-08-25T04:59:25.76", "inWayFromClient": 0, "supplierArticle": "88571217752", "quantityNotInOrders": 3}	2022-08-25 20:27:44.961775	2022-08-25 20:27:44.961775
178	35	6	{"nmId": 111885790, "Price": 2800, "brand": "Agrilife", "SCCode": "Tech", "barcode": "2038421534628", "subject": "Масло растительное", "Discount": 35, "category": "Продукты", "isSupply": true, "quantity": 6, "techSize": "0", "warehouse": 15, "daysOnSite": 47, "quantityFull": 6, "inWayToClient": 0, "isRealization": false, "warehouseName": "Электросталь", "lastChangeDate": "2022-08-25T04:59:25.76", "inWayFromClient": 0, "supplierArticle": "88571217752", "quantityNotInOrders": 6}	2022-08-25 20:27:44.969938	2022-08-25 20:27:44.969938
179	40	1	{"nmId": 114788424, "Price": 1000, "brand": "Just Greece", "SCCode": "Tech", "barcode": "2040429296620", "subject": "Оливки", "Discount": 43, "category": "Продукты", "isSupply": true, "quantity": 1, "techSize": "0", "warehouse": 15, "daysOnSite": 22, "quantityFull": 1, "inWayToClient": 0, "isRealization": false, "warehouseName": "Электросталь", "lastChangeDate": "2022-08-25T04:59:25.76", "inWayFromClient": 0, "supplierArticle": "zz-52091030656565209103065656", "quantityNotInOrders": 1}	2022-08-25 20:27:44.978819	2022-08-25 20:27:44.978819
180	39	9	{"nmId": 114788690, "Price": 800, "brand": "EcoGreece", "SCCode": "Tech", "barcode": "2040429880621", "subject": "Оливки", "Discount": 49, "category": "Продукты", "isSupply": true, "quantity": 9, "techSize": "0", "warehouse": 15, "daysOnSite": 22, "quantityFull": 9, "inWayToClient": 0, "isRealization": false, "warehouseName": "Электросталь", "lastChangeDate": "2022-08-25T04:59:25.76", "inWayFromClient": 0, "supplierArticle": "ZZ-52014098016935201409801693", "quantityNotInOrders": 9}	2022-08-25 20:27:44.987921	2022-08-25 20:27:44.987921
181	38	14	{"nmId": 117329468, "Price": 1690, "brand": "MINERVA", "SCCode": "Tech", "barcode": "2041990946624", "subject": "Масло растительное", "Discount": 0, "category": "Продукты", "isSupply": true, "quantity": 14, "techSize": "0", "warehouse": 1, "daysOnSite": 0, "quantityFull": 15, "inWayToClient": 1, "isRealization": false, "warehouseName": "Коледино", "lastChangeDate": "2022-08-25T04:59:25.76", "inWayFromClient": 0, "supplierArticle": "5201106190748", "quantityNotInOrders": 15}	2022-08-25 20:27:44.996395	2022-08-25 20:27:44.996395
182	40	0	{"nmId": 114788424, "Price": 1000, "brand": "Just Greece", "SCCode": "Tech", "barcode": "2040429296620", "subject": "Оливки", "Discount": 43, "category": "Продукты", "isSupply": true, "quantity": 0, "techSize": "0", "warehouse": 1, "daysOnSite": 21, "quantityFull": 0, "inWayToClient": 0, "isRealization": false, "warehouseName": "Коледино", "lastChangeDate": "2022-08-25T06:14:42.977", "inWayFromClient": 0, "supplierArticle": "zz-52091030656565209103065656", "quantityNotInOrders": 0}	2022-08-25 20:27:45.015653	2022-08-25 20:27:45.015653
183	30	0	{"nmId": 110119921, "Price": 1800, "brand": "SITIA", "SCCode": "Tech", "barcode": "2036002208623", "subject": "Масло растительное", "Discount": 47, "category": "Продукты", "isSupply": true, "quantity": 0, "techSize": "0", "warehouse": 1, "daysOnSite": 53, "quantityFull": 4, "inWayToClient": 4, "isRealization": false, "warehouseName": "Коледино", "lastChangeDate": "2022-08-25T04:59:25.76", "inWayFromClient": 0, "supplierArticle": "520011908066981764983278947982", "quantityNotInOrders": 3}	2022-08-25 23:45:41.719595	2022-08-25 23:45:41.719595
184	30	13	{"nmId": 110119921, "Price": 1800, "brand": "SITIA", "SCCode": "Tech", "barcode": "2036002208623", "subject": "Масло растительное", "Discount": 47, "category": "Продукты", "isSupply": true, "quantity": 13, "techSize": "0", "warehouse": 15, "daysOnSite": 53, "quantityFull": 13, "inWayToClient": 0, "isRealization": false, "warehouseName": "Электросталь", "lastChangeDate": "2022-08-25T04:59:25.76", "inWayFromClient": 0, "supplierArticle": "520011908066981764983278947982", "quantityNotInOrders": 13}	2022-08-25 23:45:41.73391	2022-08-25 23:45:41.73391
185	37	5	{"nmId": 111054747, "Price": 2300, "brand": "SITIA", "SCCode": "Tech", "barcode": "5200119080658", "subject": "Масло растительное", "Discount": 30, "category": "Продукты", "isSupply": true, "quantity": 5, "techSize": "0", "warehouse": 1, "daysOnSite": 53, "quantityFull": 7, "inWayToClient": 2, "isRealization": false, "warehouseName": "Коледино", "lastChangeDate": "2022-08-25T04:59:25.76", "inWayFromClient": 0, "supplierArticle": "5200119080675200119080665", "quantityNotInOrders": 7}	2022-08-25 23:45:41.744853	2022-08-25 23:45:41.744853
186	37	18	{"nmId": 111054747, "Price": 2300, "brand": "SITIA", "SCCode": "Tech", "barcode": "5200119080658", "subject": "Масло растительное", "Discount": 30, "category": "Продукты", "isSupply": true, "quantity": 18, "techSize": "0", "warehouse": 15, "daysOnSite": 53, "quantityFull": 18, "inWayToClient": 0, "isRealization": false, "warehouseName": "Электросталь", "lastChangeDate": "2022-08-25T04:59:25.76", "inWayFromClient": 0, "supplierArticle": "5200119080675200119080665", "quantityNotInOrders": 18}	2022-08-25 23:45:41.756544	2022-08-25 23:45:41.756544
187	31	0	{"nmId": 111345604, "Price": 6500, "brand": "SITIA", "SCCode": "Tech", "barcode": "2037838726626", "subject": "Масло растительное", "Discount": 30, "category": "Продукты", "isSupply": true, "quantity": 0, "techSize": "0", "warehouse": 1, "daysOnSite": 47, "quantityFull": 1, "inWayToClient": 1, "isRealization": false, "warehouseName": "Коледино", "lastChangeDate": "2022-08-25T04:59:25.76", "inWayFromClient": 0, "supplierArticle": "5200102953203", "quantityNotInOrders": 1}	2022-08-25 23:45:41.768134	2022-08-25 23:45:41.768134
188	31	11	{"nmId": 111345604, "Price": 6500, "brand": "SITIA", "SCCode": "Tech", "barcode": "2037838726626", "subject": "Масло растительное", "Discount": 30, "category": "Продукты", "isSupply": true, "quantity": 11, "techSize": "0", "warehouse": 15, "daysOnSite": 47, "quantityFull": 11, "inWayToClient": 0, "isRealization": false, "warehouseName": "Электросталь", "lastChangeDate": "2022-08-25T04:59:25.76", "inWayFromClient": 0, "supplierArticle": "5200102953203", "quantityNotInOrders": 11}	2022-08-25 23:45:41.780408	2022-08-25 23:45:41.780408
189	33	0	{"nmId": 111345626, "Price": 1330, "brand": "KOKO", "SCCode": "Tech", "barcode": "2037838797626", "subject": "Масло растительное", "Discount": 33, "category": "Продукты", "isSupply": true, "quantity": 0, "techSize": "0", "warehouse": 1, "daysOnSite": 53, "quantityFull": 4, "inWayToClient": 4, "isRealization": false, "warehouseName": "Коледино", "lastChangeDate": "2022-08-25T04:59:25.76", "inWayFromClient": 0, "supplierArticle": "5205657000631", "quantityNotInOrders": 4}	2022-08-25 23:45:41.792719	2022-08-25 23:45:41.792719
190	33	25	{"nmId": 111345626, "Price": 1330, "brand": "KOKO", "SCCode": "Tech", "barcode": "2037838797626", "subject": "Масло растительное", "Discount": 33, "category": "Продукты", "isSupply": true, "quantity": 25, "techSize": "0", "warehouse": 15, "daysOnSite": 53, "quantityFull": 25, "inWayToClient": 0, "isRealization": false, "warehouseName": "Электросталь", "lastChangeDate": "2022-08-25T04:59:25.76", "inWayFromClient": 0, "supplierArticle": "5205657000631", "quantityNotInOrders": 25}	2022-08-25 23:45:41.804253	2022-08-25 23:45:41.804253
191	34	0	{"nmId": 111885412, "Price": 1380, "brand": "", "SCCode": "Tech", "barcode": "2038421434621", "subject": "Масло растительное", "Discount": 34, "category": "Продукты", "isSupply": true, "quantity": 0, "techSize": "0", "warehouse": 1, "daysOnSite": 47, "quantityFull": 8, "inWayToClient": 8, "isRealization": false, "warehouseName": "Коледино", "lastChangeDate": "2022-08-25T04:59:25.76", "inWayFromClient": 0, "supplierArticle": "52003624003", "quantityNotInOrders": 8}	2022-08-25 23:45:41.815858	2022-08-25 23:45:41.815858
192	35	0	{"nmId": 111885790, "Price": 2800, "brand": "Agrilife", "SCCode": "Tech", "barcode": "2038421534628", "subject": "Масло растительное", "Discount": 35, "category": "Продукты", "isSupply": true, "quantity": 0, "techSize": "0", "warehouse": 1, "daysOnSite": 47, "quantityFull": 3, "inWayToClient": 3, "isRealization": false, "warehouseName": "Коледино", "lastChangeDate": "2022-08-25T04:59:25.76", "inWayFromClient": 0, "supplierArticle": "88571217752", "quantityNotInOrders": 3}	2022-08-25 23:45:41.825353	2022-08-25 23:45:41.825353
193	35	6	{"nmId": 111885790, "Price": 2800, "brand": "Agrilife", "SCCode": "Tech", "barcode": "2038421534628", "subject": "Масло растительное", "Discount": 35, "category": "Продукты", "isSupply": true, "quantity": 6, "techSize": "0", "warehouse": 15, "daysOnSite": 47, "quantityFull": 6, "inWayToClient": 0, "isRealization": false, "warehouseName": "Электросталь", "lastChangeDate": "2022-08-25T04:59:25.76", "inWayFromClient": 0, "supplierArticle": "88571217752", "quantityNotInOrders": 6}	2022-08-25 23:45:41.831598	2022-08-25 23:45:41.831598
194	40	1	{"nmId": 114788424, "Price": 1000, "brand": "Just Greece", "SCCode": "Tech", "barcode": "2040429296620", "subject": "Оливки", "Discount": 43, "category": "Продукты", "isSupply": true, "quantity": 1, "techSize": "0", "warehouse": 15, "daysOnSite": 22, "quantityFull": 1, "inWayToClient": 0, "isRealization": false, "warehouseName": "Электросталь", "lastChangeDate": "2022-08-25T04:59:25.76", "inWayFromClient": 0, "supplierArticle": "zz-52091030656565209103065656", "quantityNotInOrders": 1}	2022-08-25 23:45:41.836614	2022-08-25 23:45:41.836614
195	39	9	{"nmId": 114788690, "Price": 800, "brand": "EcoGreece", "SCCode": "Tech", "barcode": "2040429880621", "subject": "Оливки", "Discount": 49, "category": "Продукты", "isSupply": true, "quantity": 9, "techSize": "0", "warehouse": 15, "daysOnSite": 22, "quantityFull": 9, "inWayToClient": 0, "isRealization": false, "warehouseName": "Электросталь", "lastChangeDate": "2022-08-25T04:59:25.76", "inWayFromClient": 0, "supplierArticle": "ZZ-52014098016935201409801693", "quantityNotInOrders": 9}	2022-08-25 23:45:41.841042	2022-08-25 23:45:41.841042
196	38	14	{"nmId": 117329468, "Price": 1690, "brand": "MINERVA", "SCCode": "Tech", "barcode": "2041990946624", "subject": "Масло растительное", "Discount": 0, "category": "Продукты", "isSupply": true, "quantity": 14, "techSize": "0", "warehouse": 1, "daysOnSite": 0, "quantityFull": 15, "inWayToClient": 1, "isRealization": false, "warehouseName": "Коледино", "lastChangeDate": "2022-08-25T04:59:25.76", "inWayFromClient": 0, "supplierArticle": "5201106190748", "quantityNotInOrders": 15}	2022-08-25 23:45:41.845158	2022-08-25 23:45:41.845158
197	40	0	{"nmId": 114788424, "Price": 1000, "brand": "Just Greece", "SCCode": "Tech", "barcode": "2040429296620", "subject": "Оливки", "Discount": 43, "category": "Продукты", "isSupply": true, "quantity": 0, "techSize": "0", "warehouse": 1, "daysOnSite": 21, "quantityFull": 0, "inWayToClient": 0, "isRealization": false, "warehouseName": "Коледино", "lastChangeDate": "2022-08-25T06:14:42.977", "inWayFromClient": 0, "supplierArticle": "zz-52091030656565209103065656", "quantityNotInOrders": 0}	2022-08-25 23:45:41.849137	2022-08-25 23:45:41.849137
198	30	0	{"nmId": 110119921, "Price": 1800, "brand": "SITIA", "SCCode": "Tech", "barcode": "2036002208623", "subject": "Масло растительное", "Discount": 47, "category": "Продукты", "isSupply": true, "quantity": 0, "techSize": "0", "warehouse": 1, "daysOnSite": 54, "quantityFull": 2, "inWayToClient": 2, "isRealization": false, "warehouseName": "Коледино", "lastChangeDate": "2022-08-26T06:36:01.933", "inWayFromClient": 0, "supplierArticle": "520011908066981764983278947982", "quantityNotInOrders": 2}	2022-08-26 08:37:23.830838	2022-08-26 08:37:23.830838
199	30	13	{"nmId": 110119921, "Price": 1800, "brand": "SITIA", "SCCode": "Tech", "barcode": "2036002208623", "subject": "Масло растительное", "Discount": 47, "category": "Продукты", "isSupply": true, "quantity": 13, "techSize": "0", "warehouse": 15, "daysOnSite": 54, "quantityFull": 13, "inWayToClient": 0, "isRealization": false, "warehouseName": "Электросталь", "lastChangeDate": "2022-08-26T06:36:01.933", "inWayFromClient": 0, "supplierArticle": "520011908066981764983278947982", "quantityNotInOrders": 13}	2022-08-26 08:37:23.836788	2022-08-26 08:37:23.836788
200	37	5	{"nmId": 111054747, "Price": 2300, "brand": "SITIA", "SCCode": "Tech", "barcode": "5200119080658", "subject": "Масло растительное", "Discount": 30, "category": "Продукты", "isSupply": true, "quantity": 5, "techSize": "0", "warehouse": 1, "daysOnSite": 54, "quantityFull": 7, "inWayToClient": 2, "isRealization": false, "warehouseName": "Коледино", "lastChangeDate": "2022-08-26T06:36:01.933", "inWayFromClient": 0, "supplierArticle": "5200119080675200119080665", "quantityNotInOrders": 7}	2022-08-26 08:37:23.840408	2022-08-26 08:37:23.840408
201	37	18	{"nmId": 111054747, "Price": 2300, "brand": "SITIA", "SCCode": "Tech", "barcode": "5200119080658", "subject": "Масло растительное", "Discount": 30, "category": "Продукты", "isSupply": true, "quantity": 18, "techSize": "0", "warehouse": 15, "daysOnSite": 54, "quantityFull": 18, "inWayToClient": 0, "isRealization": false, "warehouseName": "Электросталь", "lastChangeDate": "2022-08-26T06:36:01.933", "inWayFromClient": 0, "supplierArticle": "5200119080675200119080665", "quantityNotInOrders": 18}	2022-08-26 08:37:23.843806	2022-08-26 08:37:23.843806
202	31	0	{"nmId": 111345604, "Price": 6500, "brand": "SITIA", "SCCode": "Tech", "barcode": "2037838726626", "subject": "Масло растительное", "Discount": 30, "category": "Продукты", "isSupply": true, "quantity": 0, "techSize": "0", "warehouse": 1, "daysOnSite": 48, "quantityFull": 1, "inWayToClient": 1, "isRealization": false, "warehouseName": "Коледино", "lastChangeDate": "2022-08-26T06:36:01.933", "inWayFromClient": 0, "supplierArticle": "5200102953203", "quantityNotInOrders": 1}	2022-08-26 08:37:23.846749	2022-08-26 08:37:23.846749
203	31	11	{"nmId": 111345604, "Price": 6500, "brand": "SITIA", "SCCode": "Tech", "barcode": "2037838726626", "subject": "Масло растительное", "Discount": 30, "category": "Продукты", "isSupply": true, "quantity": 11, "techSize": "0", "warehouse": 15, "daysOnSite": 48, "quantityFull": 11, "inWayToClient": 0, "isRealization": false, "warehouseName": "Электросталь", "lastChangeDate": "2022-08-26T06:36:01.933", "inWayFromClient": 0, "supplierArticle": "5200102953203", "quantityNotInOrders": 11}	2022-08-26 08:37:23.850002	2022-08-26 08:37:23.850002
204	33	0	{"nmId": 111345626, "Price": 1330, "brand": "KOKO", "SCCode": "Tech", "barcode": "2037838797626", "subject": "Масло растительное", "Discount": 33, "category": "Продукты", "isSupply": true, "quantity": 0, "techSize": "0", "warehouse": 1, "daysOnSite": 54, "quantityFull": 1, "inWayToClient": 1, "isRealization": false, "warehouseName": "Коледино", "lastChangeDate": "2022-08-26T06:36:01.933", "inWayFromClient": 0, "supplierArticle": "5205657000631", "quantityNotInOrders": 1}	2022-08-26 08:37:23.853025	2022-08-26 08:37:23.853025
205	33	25	{"nmId": 111345626, "Price": 1330, "brand": "KOKO", "SCCode": "Tech", "barcode": "2037838797626", "subject": "Масло растительное", "Discount": 33, "category": "Продукты", "isSupply": true, "quantity": 25, "techSize": "0", "warehouse": 15, "daysOnSite": 54, "quantityFull": 25, "inWayToClient": 0, "isRealization": false, "warehouseName": "Электросталь", "lastChangeDate": "2022-08-26T06:36:01.933", "inWayFromClient": 0, "supplierArticle": "5205657000631", "quantityNotInOrders": 25}	2022-08-26 08:37:23.855973	2022-08-26 08:37:23.855973
206	34	0	{"nmId": 111885412, "Price": 1380, "brand": "", "SCCode": "Tech", "barcode": "2038421434621", "subject": "Масло растительное", "Discount": 34, "category": "Продукты", "isSupply": true, "quantity": 0, "techSize": "0", "warehouse": 1, "daysOnSite": 48, "quantityFull": 8, "inWayToClient": 8, "isRealization": false, "warehouseName": "Коледино", "lastChangeDate": "2022-08-26T06:36:01.933", "inWayFromClient": 0, "supplierArticle": "52003624003", "quantityNotInOrders": 8}	2022-08-26 08:37:23.85884	2022-08-26 08:37:23.85884
207	35	0	{"nmId": 111885790, "Price": 2800, "brand": "Agrilife", "SCCode": "Tech", "barcode": "2038421534628", "subject": "Масло растительное", "Discount": 35, "category": "Продукты", "isSupply": true, "quantity": 0, "techSize": "0", "warehouse": 1, "daysOnSite": 48, "quantityFull": 3, "inWayToClient": 3, "isRealization": false, "warehouseName": "Коледино", "lastChangeDate": "2022-08-26T06:36:01.933", "inWayFromClient": 0, "supplierArticle": "88571217752", "quantityNotInOrders": 3}	2022-08-26 08:37:23.861782	2022-08-26 08:37:23.861782
208	35	6	{"nmId": 111885790, "Price": 2800, "brand": "Agrilife", "SCCode": "Tech", "barcode": "2038421534628", "subject": "Масло растительное", "Discount": 35, "category": "Продукты", "isSupply": true, "quantity": 6, "techSize": "0", "warehouse": 15, "daysOnSite": 48, "quantityFull": 6, "inWayToClient": 0, "isRealization": false, "warehouseName": "Электросталь", "lastChangeDate": "2022-08-26T06:36:01.933", "inWayFromClient": 0, "supplierArticle": "88571217752", "quantityNotInOrders": 6}	2022-08-26 08:37:23.864809	2022-08-26 08:37:23.864809
209	40	1	{"nmId": 114788424, "Price": 1000, "brand": "Just Greece", "SCCode": "Tech", "barcode": "2040429296620", "subject": "Оливки", "Discount": 43, "category": "Продукты", "isSupply": true, "quantity": 1, "techSize": "0", "warehouse": 15, "daysOnSite": 23, "quantityFull": 1, "inWayToClient": 0, "isRealization": false, "warehouseName": "Электросталь", "lastChangeDate": "2022-08-26T06:36:01.933", "inWayFromClient": 0, "supplierArticle": "zz-52091030656565209103065656", "quantityNotInOrders": 1}	2022-08-26 08:37:23.86836	2022-08-26 08:37:23.86836
210	39	9	{"nmId": 114788690, "Price": 800, "brand": "EcoGreece", "SCCode": "Tech", "barcode": "2040429880621", "subject": "Оливки", "Discount": 49, "category": "Продукты", "isSupply": true, "quantity": 9, "techSize": "0", "warehouse": 15, "daysOnSite": 23, "quantityFull": 9, "inWayToClient": 0, "isRealization": false, "warehouseName": "Электросталь", "lastChangeDate": "2022-08-26T06:36:01.933", "inWayFromClient": 0, "supplierArticle": "ZZ-52014098016935201409801693", "quantityNotInOrders": 9}	2022-08-26 08:37:23.871825	2022-08-26 08:37:23.871825
211	38	12	{"nmId": 117329468, "Price": 1690, "brand": "MINERVA", "SCCode": "Tech", "barcode": "2041990946624", "subject": "Масло растительное", "Discount": 0, "category": "Продукты", "isSupply": true, "quantity": 12, "techSize": "0", "warehouse": 1, "daysOnSite": 0, "quantityFull": 14, "inWayToClient": 2, "isRealization": false, "warehouseName": "Коледино", "lastChangeDate": "2022-08-26T06:36:01.933", "inWayFromClient": 0, "supplierArticle": "5201106190748", "quantityNotInOrders": 14}	2022-08-26 08:37:23.87471	2022-08-26 08:37:23.87471
212	30	0	{"nmId": 110119921, "Price": 1800, "brand": "SITIA", "SCCode": "Tech", "barcode": "2036002208623", "subject": "Масло растительное", "Discount": 47, "category": "Продукты", "isSupply": true, "quantity": 0, "techSize": "0", "warehouse": 1, "daysOnSite": 54, "quantityFull": 2, "inWayToClient": 2, "isRealization": false, "warehouseName": "Коледино", "lastChangeDate": "2022-08-26T06:36:01.933", "inWayFromClient": 0, "supplierArticle": "520011908066981764983278947982", "quantityNotInOrders": 2}	2022-08-26 08:44:35.154879	2022-08-26 08:44:35.154879
213	30	13	{"nmId": 110119921, "Price": 1800, "brand": "SITIA", "SCCode": "Tech", "barcode": "2036002208623", "subject": "Масло растительное", "Discount": 47, "category": "Продукты", "isSupply": true, "quantity": 13, "techSize": "0", "warehouse": 15, "daysOnSite": 54, "quantityFull": 13, "inWayToClient": 0, "isRealization": false, "warehouseName": "Электросталь", "lastChangeDate": "2022-08-26T06:36:01.933", "inWayFromClient": 0, "supplierArticle": "520011908066981764983278947982", "quantityNotInOrders": 13}	2022-08-26 08:44:35.161881	2022-08-26 08:44:35.161881
214	37	5	{"nmId": 111054747, "Price": 2300, "brand": "SITIA", "SCCode": "Tech", "barcode": "5200119080658", "subject": "Масло растительное", "Discount": 30, "category": "Продукты", "isSupply": true, "quantity": 5, "techSize": "0", "warehouse": 1, "daysOnSite": 54, "quantityFull": 7, "inWayToClient": 2, "isRealization": false, "warehouseName": "Коледино", "lastChangeDate": "2022-08-26T06:36:01.933", "inWayFromClient": 0, "supplierArticle": "5200119080675200119080665", "quantityNotInOrders": 7}	2022-08-26 08:44:35.165961	2022-08-26 08:44:35.165961
215	37	18	{"nmId": 111054747, "Price": 2300, "brand": "SITIA", "SCCode": "Tech", "barcode": "5200119080658", "subject": "Масло растительное", "Discount": 30, "category": "Продукты", "isSupply": true, "quantity": 18, "techSize": "0", "warehouse": 15, "daysOnSite": 54, "quantityFull": 18, "inWayToClient": 0, "isRealization": false, "warehouseName": "Электросталь", "lastChangeDate": "2022-08-26T06:36:01.933", "inWayFromClient": 0, "supplierArticle": "5200119080675200119080665", "quantityNotInOrders": 18}	2022-08-26 08:44:35.170074	2022-08-26 08:44:35.170074
216	31	0	{"nmId": 111345604, "Price": 6500, "brand": "SITIA", "SCCode": "Tech", "barcode": "2037838726626", "subject": "Масло растительное", "Discount": 30, "category": "Продукты", "isSupply": true, "quantity": 0, "techSize": "0", "warehouse": 1, "daysOnSite": 48, "quantityFull": 1, "inWayToClient": 1, "isRealization": false, "warehouseName": "Коледино", "lastChangeDate": "2022-08-26T06:36:01.933", "inWayFromClient": 0, "supplierArticle": "5200102953203", "quantityNotInOrders": 1}	2022-08-26 08:44:35.177137	2022-08-26 08:44:35.177137
217	31	11	{"nmId": 111345604, "Price": 6500, "brand": "SITIA", "SCCode": "Tech", "barcode": "2037838726626", "subject": "Масло растительное", "Discount": 30, "category": "Продукты", "isSupply": true, "quantity": 11, "techSize": "0", "warehouse": 15, "daysOnSite": 48, "quantityFull": 11, "inWayToClient": 0, "isRealization": false, "warehouseName": "Электросталь", "lastChangeDate": "2022-08-26T06:36:01.933", "inWayFromClient": 0, "supplierArticle": "5200102953203", "quantityNotInOrders": 11}	2022-08-26 08:44:35.180979	2022-08-26 08:44:35.180979
218	33	0	{"nmId": 111345626, "Price": 1330, "brand": "KOKO", "SCCode": "Tech", "barcode": "2037838797626", "subject": "Масло растительное", "Discount": 33, "category": "Продукты", "isSupply": true, "quantity": 0, "techSize": "0", "warehouse": 1, "daysOnSite": 54, "quantityFull": 1, "inWayToClient": 1, "isRealization": false, "warehouseName": "Коледино", "lastChangeDate": "2022-08-26T06:36:01.933", "inWayFromClient": 0, "supplierArticle": "5205657000631", "quantityNotInOrders": 1}	2022-08-26 08:44:35.185006	2022-08-26 08:44:35.185006
219	33	25	{"nmId": 111345626, "Price": 1330, "brand": "KOKO", "SCCode": "Tech", "barcode": "2037838797626", "subject": "Масло растительное", "Discount": 33, "category": "Продукты", "isSupply": true, "quantity": 25, "techSize": "0", "warehouse": 15, "daysOnSite": 54, "quantityFull": 25, "inWayToClient": 0, "isRealization": false, "warehouseName": "Электросталь", "lastChangeDate": "2022-08-26T06:36:01.933", "inWayFromClient": 0, "supplierArticle": "5205657000631", "quantityNotInOrders": 25}	2022-08-26 08:44:35.188943	2022-08-26 08:44:35.188943
220	34	0	{"nmId": 111885412, "Price": 1380, "brand": "", "SCCode": "Tech", "barcode": "2038421434621", "subject": "Масло растительное", "Discount": 34, "category": "Продукты", "isSupply": true, "quantity": 0, "techSize": "0", "warehouse": 1, "daysOnSite": 48, "quantityFull": 8, "inWayToClient": 8, "isRealization": false, "warehouseName": "Коледино", "lastChangeDate": "2022-08-26T06:36:01.933", "inWayFromClient": 0, "supplierArticle": "52003624003", "quantityNotInOrders": 8}	2022-08-26 08:44:35.193393	2022-08-26 08:44:35.193393
221	35	0	{"nmId": 111885790, "Price": 2800, "brand": "Agrilife", "SCCode": "Tech", "barcode": "2038421534628", "subject": "Масло растительное", "Discount": 35, "category": "Продукты", "isSupply": true, "quantity": 0, "techSize": "0", "warehouse": 1, "daysOnSite": 48, "quantityFull": 3, "inWayToClient": 3, "isRealization": false, "warehouseName": "Коледино", "lastChangeDate": "2022-08-26T06:36:01.933", "inWayFromClient": 0, "supplierArticle": "88571217752", "quantityNotInOrders": 3}	2022-08-26 08:44:35.197348	2022-08-26 08:44:35.197348
222	35	6	{"nmId": 111885790, "Price": 2800, "brand": "Agrilife", "SCCode": "Tech", "barcode": "2038421534628", "subject": "Масло растительное", "Discount": 35, "category": "Продукты", "isSupply": true, "quantity": 6, "techSize": "0", "warehouse": 15, "daysOnSite": 48, "quantityFull": 6, "inWayToClient": 0, "isRealization": false, "warehouseName": "Электросталь", "lastChangeDate": "2022-08-26T06:36:01.933", "inWayFromClient": 0, "supplierArticle": "88571217752", "quantityNotInOrders": 6}	2022-08-26 08:44:35.201377	2022-08-26 08:44:35.201377
223	40	1	{"nmId": 114788424, "Price": 1000, "brand": "Just Greece", "SCCode": "Tech", "barcode": "2040429296620", "subject": "Оливки", "Discount": 43, "category": "Продукты", "isSupply": true, "quantity": 1, "techSize": "0", "warehouse": 15, "daysOnSite": 23, "quantityFull": 1, "inWayToClient": 0, "isRealization": false, "warehouseName": "Электросталь", "lastChangeDate": "2022-08-26T06:36:01.933", "inWayFromClient": 0, "supplierArticle": "zz-52091030656565209103065656", "quantityNotInOrders": 1}	2022-08-26 08:44:35.205462	2022-08-26 08:44:35.205462
224	39	9	{"nmId": 114788690, "Price": 800, "brand": "EcoGreece", "SCCode": "Tech", "barcode": "2040429880621", "subject": "Оливки", "Discount": 49, "category": "Продукты", "isSupply": true, "quantity": 9, "techSize": "0", "warehouse": 15, "daysOnSite": 23, "quantityFull": 9, "inWayToClient": 0, "isRealization": false, "warehouseName": "Электросталь", "lastChangeDate": "2022-08-26T06:36:01.933", "inWayFromClient": 0, "supplierArticle": "ZZ-52014098016935201409801693", "quantityNotInOrders": 9}	2022-08-26 08:44:35.209374	2022-08-26 08:44:35.209374
225	38	12	{"nmId": 117329468, "Price": 1690, "brand": "MINERVA", "SCCode": "Tech", "barcode": "2041990946624", "subject": "Масло растительное", "Discount": 0, "category": "Продукты", "isSupply": true, "quantity": 12, "techSize": "0", "warehouse": 1, "daysOnSite": 0, "quantityFull": 14, "inWayToClient": 2, "isRealization": false, "warehouseName": "Коледино", "lastChangeDate": "2022-08-26T06:36:01.933", "inWayFromClient": 0, "supplierArticle": "5201106190748", "quantityNotInOrders": 14}	2022-08-26 08:44:35.213534	2022-08-26 08:44:35.213534
226	30	0	{"nmId": 110119921, "Price": 1800, "brand": "SITIA", "SCCode": "Tech", "barcode": "2036002208623", "subject": "Масло растительное", "Discount": 47, "category": "Продукты", "isSupply": true, "quantity": 0, "techSize": "0", "warehouse": 1, "daysOnSite": 54, "quantityFull": 2, "inWayToClient": 2, "isRealization": false, "warehouseName": "Коледино", "lastChangeDate": "2022-08-26T06:36:01.933", "inWayFromClient": 0, "supplierArticle": "520011908066981764983278947982", "quantityNotInOrders": 2}	2022-08-26 08:44:59.598366	2022-08-26 08:44:59.598366
227	30	13	{"nmId": 110119921, "Price": 1800, "brand": "SITIA", "SCCode": "Tech", "barcode": "2036002208623", "subject": "Масло растительное", "Discount": 47, "category": "Продукты", "isSupply": true, "quantity": 13, "techSize": "0", "warehouse": 15, "daysOnSite": 54, "quantityFull": 13, "inWayToClient": 0, "isRealization": false, "warehouseName": "Электросталь", "lastChangeDate": "2022-08-26T06:36:01.933", "inWayFromClient": 0, "supplierArticle": "520011908066981764983278947982", "quantityNotInOrders": 13}	2022-08-26 08:44:59.605309	2022-08-26 08:44:59.605309
228	37	5	{"nmId": 111054747, "Price": 2300, "brand": "SITIA", "SCCode": "Tech", "barcode": "5200119080658", "subject": "Масло растительное", "Discount": 30, "category": "Продукты", "isSupply": true, "quantity": 5, "techSize": "0", "warehouse": 1, "daysOnSite": 54, "quantityFull": 7, "inWayToClient": 2, "isRealization": false, "warehouseName": "Коледино", "lastChangeDate": "2022-08-26T06:36:01.933", "inWayFromClient": 0, "supplierArticle": "5200119080675200119080665", "quantityNotInOrders": 7}	2022-08-26 08:44:59.608841	2022-08-26 08:44:59.608841
229	37	18	{"nmId": 111054747, "Price": 2300, "brand": "SITIA", "SCCode": "Tech", "barcode": "5200119080658", "subject": "Масло растительное", "Discount": 30, "category": "Продукты", "isSupply": true, "quantity": 18, "techSize": "0", "warehouse": 15, "daysOnSite": 54, "quantityFull": 18, "inWayToClient": 0, "isRealization": false, "warehouseName": "Электросталь", "lastChangeDate": "2022-08-26T06:36:01.933", "inWayFromClient": 0, "supplierArticle": "5200119080675200119080665", "quantityNotInOrders": 18}	2022-08-26 08:44:59.612462	2022-08-26 08:44:59.612462
230	31	0	{"nmId": 111345604, "Price": 6500, "brand": "SITIA", "SCCode": "Tech", "barcode": "2037838726626", "subject": "Масло растительное", "Discount": 30, "category": "Продукты", "isSupply": true, "quantity": 0, "techSize": "0", "warehouse": 1, "daysOnSite": 48, "quantityFull": 1, "inWayToClient": 1, "isRealization": false, "warehouseName": "Коледино", "lastChangeDate": "2022-08-26T06:36:01.933", "inWayFromClient": 0, "supplierArticle": "5200102953203", "quantityNotInOrders": 1}	2022-08-26 08:44:59.615743	2022-08-26 08:44:59.615743
231	31	11	{"nmId": 111345604, "Price": 6500, "brand": "SITIA", "SCCode": "Tech", "barcode": "2037838726626", "subject": "Масло растительное", "Discount": 30, "category": "Продукты", "isSupply": true, "quantity": 11, "techSize": "0", "warehouse": 15, "daysOnSite": 48, "quantityFull": 11, "inWayToClient": 0, "isRealization": false, "warehouseName": "Электросталь", "lastChangeDate": "2022-08-26T06:36:01.933", "inWayFromClient": 0, "supplierArticle": "5200102953203", "quantityNotInOrders": 11}	2022-08-26 08:44:59.619051	2022-08-26 08:44:59.619051
232	33	0	{"nmId": 111345626, "Price": 1330, "brand": "KOKO", "SCCode": "Tech", "barcode": "2037838797626", "subject": "Масло растительное", "Discount": 33, "category": "Продукты", "isSupply": true, "quantity": 0, "techSize": "0", "warehouse": 1, "daysOnSite": 54, "quantityFull": 1, "inWayToClient": 1, "isRealization": false, "warehouseName": "Коледино", "lastChangeDate": "2022-08-26T06:36:01.933", "inWayFromClient": 0, "supplierArticle": "5205657000631", "quantityNotInOrders": 1}	2022-08-26 08:44:59.622521	2022-08-26 08:44:59.622521
233	33	25	{"nmId": 111345626, "Price": 1330, "brand": "KOKO", "SCCode": "Tech", "barcode": "2037838797626", "subject": "Масло растительное", "Discount": 33, "category": "Продукты", "isSupply": true, "quantity": 25, "techSize": "0", "warehouse": 15, "daysOnSite": 54, "quantityFull": 25, "inWayToClient": 0, "isRealization": false, "warehouseName": "Электросталь", "lastChangeDate": "2022-08-26T06:36:01.933", "inWayFromClient": 0, "supplierArticle": "5205657000631", "quantityNotInOrders": 25}	2022-08-26 08:44:59.625704	2022-08-26 08:44:59.625704
234	34	0	{"nmId": 111885412, "Price": 1380, "brand": "", "SCCode": "Tech", "barcode": "2038421434621", "subject": "Масло растительное", "Discount": 34, "category": "Продукты", "isSupply": true, "quantity": 0, "techSize": "0", "warehouse": 1, "daysOnSite": 48, "quantityFull": 8, "inWayToClient": 8, "isRealization": false, "warehouseName": "Коледино", "lastChangeDate": "2022-08-26T06:36:01.933", "inWayFromClient": 0, "supplierArticle": "52003624003", "quantityNotInOrders": 8}	2022-08-26 08:44:59.629519	2022-08-26 08:44:59.629519
235	35	0	{"nmId": 111885790, "Price": 2800, "brand": "Agrilife", "SCCode": "Tech", "barcode": "2038421534628", "subject": "Масло растительное", "Discount": 35, "category": "Продукты", "isSupply": true, "quantity": 0, "techSize": "0", "warehouse": 1, "daysOnSite": 48, "quantityFull": 3, "inWayToClient": 3, "isRealization": false, "warehouseName": "Коледино", "lastChangeDate": "2022-08-26T06:36:01.933", "inWayFromClient": 0, "supplierArticle": "88571217752", "quantityNotInOrders": 3}	2022-08-26 08:44:59.63317	2022-08-26 08:44:59.63317
236	35	6	{"nmId": 111885790, "Price": 2800, "brand": "Agrilife", "SCCode": "Tech", "barcode": "2038421534628", "subject": "Масло растительное", "Discount": 35, "category": "Продукты", "isSupply": true, "quantity": 6, "techSize": "0", "warehouse": 15, "daysOnSite": 48, "quantityFull": 6, "inWayToClient": 0, "isRealization": false, "warehouseName": "Электросталь", "lastChangeDate": "2022-08-26T06:36:01.933", "inWayFromClient": 0, "supplierArticle": "88571217752", "quantityNotInOrders": 6}	2022-08-26 08:44:59.636406	2022-08-26 08:44:59.636406
237	40	1	{"nmId": 114788424, "Price": 1000, "brand": "Just Greece", "SCCode": "Tech", "barcode": "2040429296620", "subject": "Оливки", "Discount": 43, "category": "Продукты", "isSupply": true, "quantity": 1, "techSize": "0", "warehouse": 15, "daysOnSite": 23, "quantityFull": 1, "inWayToClient": 0, "isRealization": false, "warehouseName": "Электросталь", "lastChangeDate": "2022-08-26T06:36:01.933", "inWayFromClient": 0, "supplierArticle": "zz-52091030656565209103065656", "quantityNotInOrders": 1}	2022-08-26 08:44:59.639703	2022-08-26 08:44:59.639703
238	39	9	{"nmId": 114788690, "Price": 800, "brand": "EcoGreece", "SCCode": "Tech", "barcode": "2040429880621", "subject": "Оливки", "Discount": 49, "category": "Продукты", "isSupply": true, "quantity": 9, "techSize": "0", "warehouse": 15, "daysOnSite": 23, "quantityFull": 9, "inWayToClient": 0, "isRealization": false, "warehouseName": "Электросталь", "lastChangeDate": "2022-08-26T06:36:01.933", "inWayFromClient": 0, "supplierArticle": "ZZ-52014098016935201409801693", "quantityNotInOrders": 9}	2022-08-26 08:44:59.643081	2022-08-26 08:44:59.643081
239	38	12	{"nmId": 117329468, "Price": 1690, "brand": "MINERVA", "SCCode": "Tech", "barcode": "2041990946624", "subject": "Масло растительное", "Discount": 0, "category": "Продукты", "isSupply": true, "quantity": 12, "techSize": "0", "warehouse": 1, "daysOnSite": 0, "quantityFull": 14, "inWayToClient": 2, "isRealization": false, "warehouseName": "Коледино", "lastChangeDate": "2022-08-26T06:36:01.933", "inWayFromClient": 0, "supplierArticle": "5201106190748", "quantityNotInOrders": 14}	2022-08-26 08:44:59.646445	2022-08-26 08:44:59.646445
240	30	0	{"nmId": 110119921, "Price": 1800, "brand": "SITIA", "SCCode": "Tech", "barcode": "2036002208623", "subject": "Масло растительное", "Discount": 47, "category": "Продукты", "isSupply": true, "quantity": 0, "techSize": "0", "warehouse": 1, "daysOnSite": 54, "quantityFull": 2, "inWayToClient": 2, "isRealization": false, "warehouseName": "Коледино", "lastChangeDate": "2022-08-26T06:36:01.933", "inWayFromClient": 0, "supplierArticle": "520011908066981764983278947982", "quantityNotInOrders": 2}	2022-08-26 08:55:26.329875	2022-08-26 08:55:26.329875
241	30	13	{"nmId": 110119921, "Price": 1800, "brand": "SITIA", "SCCode": "Tech", "barcode": "2036002208623", "subject": "Масло растительное", "Discount": 47, "category": "Продукты", "isSupply": true, "quantity": 13, "techSize": "0", "warehouse": 15, "daysOnSite": 54, "quantityFull": 13, "inWayToClient": 0, "isRealization": false, "warehouseName": "Электросталь", "lastChangeDate": "2022-08-26T06:36:01.933", "inWayFromClient": 0, "supplierArticle": "520011908066981764983278947982", "quantityNotInOrders": 13}	2022-08-26 08:55:26.342787	2022-08-26 08:55:26.342787
242	37	5	{"nmId": 111054747, "Price": 2300, "brand": "SITIA", "SCCode": "Tech", "barcode": "5200119080658", "subject": "Масло растительное", "Discount": 30, "category": "Продукты", "isSupply": true, "quantity": 5, "techSize": "0", "warehouse": 1, "daysOnSite": 54, "quantityFull": 7, "inWayToClient": 2, "isRealization": false, "warehouseName": "Коледино", "lastChangeDate": "2022-08-26T06:36:01.933", "inWayFromClient": 0, "supplierArticle": "5200119080675200119080665", "quantityNotInOrders": 7}	2022-08-26 08:55:26.352246	2022-08-26 08:55:26.352246
243	37	18	{"nmId": 111054747, "Price": 2300, "brand": "SITIA", "SCCode": "Tech", "barcode": "5200119080658", "subject": "Масло растительное", "Discount": 30, "category": "Продукты", "isSupply": true, "quantity": 18, "techSize": "0", "warehouse": 15, "daysOnSite": 54, "quantityFull": 18, "inWayToClient": 0, "isRealization": false, "warehouseName": "Электросталь", "lastChangeDate": "2022-08-26T06:36:01.933", "inWayFromClient": 0, "supplierArticle": "5200119080675200119080665", "quantityNotInOrders": 18}	2022-08-26 08:55:26.358249	2022-08-26 08:55:26.358249
244	31	0	{"nmId": 111345604, "Price": 6500, "brand": "SITIA", "SCCode": "Tech", "barcode": "2037838726626", "subject": "Масло растительное", "Discount": 30, "category": "Продукты", "isSupply": true, "quantity": 0, "techSize": "0", "warehouse": 1, "daysOnSite": 48, "quantityFull": 1, "inWayToClient": 1, "isRealization": false, "warehouseName": "Коледино", "lastChangeDate": "2022-08-26T06:36:01.933", "inWayFromClient": 0, "supplierArticle": "5200102953203", "quantityNotInOrders": 1}	2022-08-26 08:55:26.363469	2022-08-26 08:55:26.363469
245	31	11	{"nmId": 111345604, "Price": 6500, "brand": "SITIA", "SCCode": "Tech", "barcode": "2037838726626", "subject": "Масло растительное", "Discount": 30, "category": "Продукты", "isSupply": true, "quantity": 11, "techSize": "0", "warehouse": 15, "daysOnSite": 48, "quantityFull": 11, "inWayToClient": 0, "isRealization": false, "warehouseName": "Электросталь", "lastChangeDate": "2022-08-26T06:36:01.933", "inWayFromClient": 0, "supplierArticle": "5200102953203", "quantityNotInOrders": 11}	2022-08-26 08:55:26.368541	2022-08-26 08:55:26.368541
246	33	0	{"nmId": 111345626, "Price": 1330, "brand": "KOKO", "SCCode": "Tech", "barcode": "2037838797626", "subject": "Масло растительное", "Discount": 33, "category": "Продукты", "isSupply": true, "quantity": 0, "techSize": "0", "warehouse": 1, "daysOnSite": 54, "quantityFull": 1, "inWayToClient": 1, "isRealization": false, "warehouseName": "Коледино", "lastChangeDate": "2022-08-26T06:36:01.933", "inWayFromClient": 0, "supplierArticle": "5205657000631", "quantityNotInOrders": 1}	2022-08-26 08:55:26.373013	2022-08-26 08:55:26.373013
247	33	25	{"nmId": 111345626, "Price": 1330, "brand": "KOKO", "SCCode": "Tech", "barcode": "2037838797626", "subject": "Масло растительное", "Discount": 33, "category": "Продукты", "isSupply": true, "quantity": 25, "techSize": "0", "warehouse": 15, "daysOnSite": 54, "quantityFull": 25, "inWayToClient": 0, "isRealization": false, "warehouseName": "Электросталь", "lastChangeDate": "2022-08-26T06:36:01.933", "inWayFromClient": 0, "supplierArticle": "5205657000631", "quantityNotInOrders": 25}	2022-08-26 08:55:26.377339	2022-08-26 08:55:26.377339
248	34	0	{"nmId": 111885412, "Price": 1380, "brand": "", "SCCode": "Tech", "barcode": "2038421434621", "subject": "Масло растительное", "Discount": 34, "category": "Продукты", "isSupply": true, "quantity": 0, "techSize": "0", "warehouse": 1, "daysOnSite": 48, "quantityFull": 8, "inWayToClient": 8, "isRealization": false, "warehouseName": "Коледино", "lastChangeDate": "2022-08-26T06:36:01.933", "inWayFromClient": 0, "supplierArticle": "52003624003", "quantityNotInOrders": 8}	2022-08-26 08:55:26.381844	2022-08-26 08:55:26.381844
249	35	0	{"nmId": 111885790, "Price": 2800, "brand": "Agrilife", "SCCode": "Tech", "barcode": "2038421534628", "subject": "Масло растительное", "Discount": 35, "category": "Продукты", "isSupply": true, "quantity": 0, "techSize": "0", "warehouse": 1, "daysOnSite": 48, "quantityFull": 3, "inWayToClient": 3, "isRealization": false, "warehouseName": "Коледино", "lastChangeDate": "2022-08-26T06:36:01.933", "inWayFromClient": 0, "supplierArticle": "88571217752", "quantityNotInOrders": 3}	2022-08-26 08:55:26.386278	2022-08-26 08:55:26.386278
250	35	6	{"nmId": 111885790, "Price": 2800, "brand": "Agrilife", "SCCode": "Tech", "barcode": "2038421534628", "subject": "Масло растительное", "Discount": 35, "category": "Продукты", "isSupply": true, "quantity": 6, "techSize": "0", "warehouse": 15, "daysOnSite": 48, "quantityFull": 6, "inWayToClient": 0, "isRealization": false, "warehouseName": "Электросталь", "lastChangeDate": "2022-08-26T06:36:01.933", "inWayFromClient": 0, "supplierArticle": "88571217752", "quantityNotInOrders": 6}	2022-08-26 08:55:26.390778	2022-08-26 08:55:26.390778
251	40	1	{"nmId": 114788424, "Price": 1000, "brand": "Just Greece", "SCCode": "Tech", "barcode": "2040429296620", "subject": "Оливки", "Discount": 43, "category": "Продукты", "isSupply": true, "quantity": 1, "techSize": "0", "warehouse": 15, "daysOnSite": 23, "quantityFull": 1, "inWayToClient": 0, "isRealization": false, "warehouseName": "Электросталь", "lastChangeDate": "2022-08-26T06:36:01.933", "inWayFromClient": 0, "supplierArticle": "zz-52091030656565209103065656", "quantityNotInOrders": 1}	2022-08-26 08:55:26.395248	2022-08-26 08:55:26.395248
252	39	9	{"nmId": 114788690, "Price": 800, "brand": "EcoGreece", "SCCode": "Tech", "barcode": "2040429880621", "subject": "Оливки", "Discount": 49, "category": "Продукты", "isSupply": true, "quantity": 9, "techSize": "0", "warehouse": 15, "daysOnSite": 23, "quantityFull": 9, "inWayToClient": 0, "isRealization": false, "warehouseName": "Электросталь", "lastChangeDate": "2022-08-26T06:36:01.933", "inWayFromClient": 0, "supplierArticle": "ZZ-52014098016935201409801693", "quantityNotInOrders": 9}	2022-08-26 08:55:26.399812	2022-08-26 08:55:26.399812
253	38	12	{"nmId": 117329468, "Price": 1690, "brand": "MINERVA", "SCCode": "Tech", "barcode": "2041990946624", "subject": "Масло растительное", "Discount": 0, "category": "Продукты", "isSupply": true, "quantity": 12, "techSize": "0", "warehouse": 1, "daysOnSite": 0, "quantityFull": 14, "inWayToClient": 2, "isRealization": false, "warehouseName": "Коледино", "lastChangeDate": "2022-08-26T06:36:01.933", "inWayFromClient": 0, "supplierArticle": "5201106190748", "quantityNotInOrders": 14}	2022-08-26 08:55:26.407807	2022-08-26 08:55:26.407807
254	30	0	{"nmId": 110119921, "Price": 1800, "brand": "SITIA", "SCCode": "Tech", "barcode": "2036002208623", "subject": "Масло растительное", "Discount": 47, "category": "Продукты", "isSupply": true, "quantity": 0, "techSize": "0", "warehouse": 1, "daysOnSite": 54, "quantityFull": 2, "inWayToClient": 2, "isRealization": false, "warehouseName": "Коледино", "lastChangeDate": "2022-08-26T06:36:01.933", "inWayFromClient": 0, "supplierArticle": "520011908066981764983278947982", "quantityNotInOrders": 2}	2022-08-26 08:55:42.801145	2022-08-26 08:55:42.801145
255	30	13	{"nmId": 110119921, "Price": 1800, "brand": "SITIA", "SCCode": "Tech", "barcode": "2036002208623", "subject": "Масло растительное", "Discount": 47, "category": "Продукты", "isSupply": true, "quantity": 13, "techSize": "0", "warehouse": 15, "daysOnSite": 54, "quantityFull": 13, "inWayToClient": 0, "isRealization": false, "warehouseName": "Электросталь", "lastChangeDate": "2022-08-26T06:36:01.933", "inWayFromClient": 0, "supplierArticle": "520011908066981764983278947982", "quantityNotInOrders": 13}	2022-08-26 08:55:42.811066	2022-08-26 08:55:42.811066
256	37	5	{"nmId": 111054747, "Price": 2300, "brand": "SITIA", "SCCode": "Tech", "barcode": "5200119080658", "subject": "Масло растительное", "Discount": 30, "category": "Продукты", "isSupply": true, "quantity": 5, "techSize": "0", "warehouse": 1, "daysOnSite": 54, "quantityFull": 7, "inWayToClient": 2, "isRealization": false, "warehouseName": "Коледино", "lastChangeDate": "2022-08-26T06:36:01.933", "inWayFromClient": 0, "supplierArticle": "5200119080675200119080665", "quantityNotInOrders": 7}	2022-08-26 08:55:42.817383	2022-08-26 08:55:42.817383
257	37	18	{"nmId": 111054747, "Price": 2300, "brand": "SITIA", "SCCode": "Tech", "barcode": "5200119080658", "subject": "Масло растительное", "Discount": 30, "category": "Продукты", "isSupply": true, "quantity": 18, "techSize": "0", "warehouse": 15, "daysOnSite": 54, "quantityFull": 18, "inWayToClient": 0, "isRealization": false, "warehouseName": "Электросталь", "lastChangeDate": "2022-08-26T06:36:01.933", "inWayFromClient": 0, "supplierArticle": "5200119080675200119080665", "quantityNotInOrders": 18}	2022-08-26 08:55:42.823227	2022-08-26 08:55:42.823227
258	31	0	{"nmId": 111345604, "Price": 6500, "brand": "SITIA", "SCCode": "Tech", "barcode": "2037838726626", "subject": "Масло растительное", "Discount": 30, "category": "Продукты", "isSupply": true, "quantity": 0, "techSize": "0", "warehouse": 1, "daysOnSite": 48, "quantityFull": 1, "inWayToClient": 1, "isRealization": false, "warehouseName": "Коледино", "lastChangeDate": "2022-08-26T06:36:01.933", "inWayFromClient": 0, "supplierArticle": "5200102953203", "quantityNotInOrders": 1}	2022-08-26 08:55:42.828464	2022-08-26 08:55:42.828464
259	31	11	{"nmId": 111345604, "Price": 6500, "brand": "SITIA", "SCCode": "Tech", "barcode": "2037838726626", "subject": "Масло растительное", "Discount": 30, "category": "Продукты", "isSupply": true, "quantity": 11, "techSize": "0", "warehouse": 15, "daysOnSite": 48, "quantityFull": 11, "inWayToClient": 0, "isRealization": false, "warehouseName": "Электросталь", "lastChangeDate": "2022-08-26T06:36:01.933", "inWayFromClient": 0, "supplierArticle": "5200102953203", "quantityNotInOrders": 11}	2022-08-26 08:55:42.83303	2022-08-26 08:55:42.83303
260	33	0	{"nmId": 111345626, "Price": 1330, "brand": "KOKO", "SCCode": "Tech", "barcode": "2037838797626", "subject": "Масло растительное", "Discount": 33, "category": "Продукты", "isSupply": true, "quantity": 0, "techSize": "0", "warehouse": 1, "daysOnSite": 54, "quantityFull": 1, "inWayToClient": 1, "isRealization": false, "warehouseName": "Коледино", "lastChangeDate": "2022-08-26T06:36:01.933", "inWayFromClient": 0, "supplierArticle": "5205657000631", "quantityNotInOrders": 1}	2022-08-26 08:55:42.836906	2022-08-26 08:55:42.836906
261	33	25	{"nmId": 111345626, "Price": 1330, "brand": "KOKO", "SCCode": "Tech", "barcode": "2037838797626", "subject": "Масло растительное", "Discount": 33, "category": "Продукты", "isSupply": true, "quantity": 25, "techSize": "0", "warehouse": 15, "daysOnSite": 54, "quantityFull": 25, "inWayToClient": 0, "isRealization": false, "warehouseName": "Электросталь", "lastChangeDate": "2022-08-26T06:36:01.933", "inWayFromClient": 0, "supplierArticle": "5205657000631", "quantityNotInOrders": 25}	2022-08-26 08:55:42.840417	2022-08-26 08:55:42.840417
262	34	0	{"nmId": 111885412, "Price": 1380, "brand": "", "SCCode": "Tech", "barcode": "2038421434621", "subject": "Масло растительное", "Discount": 34, "category": "Продукты", "isSupply": true, "quantity": 0, "techSize": "0", "warehouse": 1, "daysOnSite": 48, "quantityFull": 8, "inWayToClient": 8, "isRealization": false, "warehouseName": "Коледино", "lastChangeDate": "2022-08-26T06:36:01.933", "inWayFromClient": 0, "supplierArticle": "52003624003", "quantityNotInOrders": 8}	2022-08-26 08:55:42.843783	2022-08-26 08:55:42.843783
263	35	0	{"nmId": 111885790, "Price": 2800, "brand": "Agrilife", "SCCode": "Tech", "barcode": "2038421534628", "subject": "Масло растительное", "Discount": 35, "category": "Продукты", "isSupply": true, "quantity": 0, "techSize": "0", "warehouse": 1, "daysOnSite": 48, "quantityFull": 3, "inWayToClient": 3, "isRealization": false, "warehouseName": "Коледино", "lastChangeDate": "2022-08-26T06:36:01.933", "inWayFromClient": 0, "supplierArticle": "88571217752", "quantityNotInOrders": 3}	2022-08-26 08:55:42.847031	2022-08-26 08:55:42.847031
264	35	6	{"nmId": 111885790, "Price": 2800, "brand": "Agrilife", "SCCode": "Tech", "barcode": "2038421534628", "subject": "Масло растительное", "Discount": 35, "category": "Продукты", "isSupply": true, "quantity": 6, "techSize": "0", "warehouse": 15, "daysOnSite": 48, "quantityFull": 6, "inWayToClient": 0, "isRealization": false, "warehouseName": "Электросталь", "lastChangeDate": "2022-08-26T06:36:01.933", "inWayFromClient": 0, "supplierArticle": "88571217752", "quantityNotInOrders": 6}	2022-08-26 08:55:42.849973	2022-08-26 08:55:42.849973
265	40	1	{"nmId": 114788424, "Price": 1000, "brand": "Just Greece", "SCCode": "Tech", "barcode": "2040429296620", "subject": "Оливки", "Discount": 43, "category": "Продукты", "isSupply": true, "quantity": 1, "techSize": "0", "warehouse": 15, "daysOnSite": 23, "quantityFull": 1, "inWayToClient": 0, "isRealization": false, "warehouseName": "Электросталь", "lastChangeDate": "2022-08-26T06:36:01.933", "inWayFromClient": 0, "supplierArticle": "zz-52091030656565209103065656", "quantityNotInOrders": 1}	2022-08-26 08:55:42.853008	2022-08-26 08:55:42.853008
266	39	9	{"nmId": 114788690, "Price": 800, "brand": "EcoGreece", "SCCode": "Tech", "barcode": "2040429880621", "subject": "Оливки", "Discount": 49, "category": "Продукты", "isSupply": true, "quantity": 9, "techSize": "0", "warehouse": 15, "daysOnSite": 23, "quantityFull": 9, "inWayToClient": 0, "isRealization": false, "warehouseName": "Электросталь", "lastChangeDate": "2022-08-26T06:36:01.933", "inWayFromClient": 0, "supplierArticle": "ZZ-52014098016935201409801693", "quantityNotInOrders": 9}	2022-08-26 08:55:42.855782	2022-08-26 08:55:42.855782
267	38	12	{"nmId": 117329468, "Price": 1690, "brand": "MINERVA", "SCCode": "Tech", "barcode": "2041990946624", "subject": "Масло растительное", "Discount": 0, "category": "Продукты", "isSupply": true, "quantity": 12, "techSize": "0", "warehouse": 1, "daysOnSite": 0, "quantityFull": 14, "inWayToClient": 2, "isRealization": false, "warehouseName": "Коледино", "lastChangeDate": "2022-08-26T06:36:01.933", "inWayFromClient": 0, "supplierArticle": "5201106190748", "quantityNotInOrders": 14}	2022-08-26 08:55:42.858748	2022-08-26 08:55:42.858748
268	30	0	{"nmId": 110119921, "Price": 1800, "brand": "SITIA", "SCCode": "Tech", "barcode": "2036002208623", "subject": "Масло растительное", "Discount": 47, "category": "Продукты", "isSupply": true, "quantity": 0, "techSize": "0", "warehouse": 1, "daysOnSite": 54, "quantityFull": 2, "inWayToClient": 2, "isRealization": false, "warehouseName": "Коледино", "lastChangeDate": "2022-08-26T06:36:01.933", "inWayFromClient": 0, "supplierArticle": "520011908066981764983278947982", "quantityNotInOrders": 2}	2022-08-26 09:08:33.782138	2022-08-26 09:08:33.782138
269	30	13	{"nmId": 110119921, "Price": 1800, "brand": "SITIA", "SCCode": "Tech", "barcode": "2036002208623", "subject": "Масло растительное", "Discount": 47, "category": "Продукты", "isSupply": true, "quantity": 13, "techSize": "0", "warehouse": 15, "daysOnSite": 54, "quantityFull": 13, "inWayToClient": 0, "isRealization": false, "warehouseName": "Электросталь", "lastChangeDate": "2022-08-26T06:36:01.933", "inWayFromClient": 0, "supplierArticle": "520011908066981764983278947982", "quantityNotInOrders": 13}	2022-08-26 09:08:33.793436	2022-08-26 09:08:33.793436
270	37	5	{"nmId": 111054747, "Price": 2300, "brand": "SITIA", "SCCode": "Tech", "barcode": "5200119080658", "subject": "Масло растительное", "Discount": 30, "category": "Продукты", "isSupply": true, "quantity": 5, "techSize": "0", "warehouse": 1, "daysOnSite": 54, "quantityFull": 7, "inWayToClient": 2, "isRealization": false, "warehouseName": "Коледино", "lastChangeDate": "2022-08-26T06:36:01.933", "inWayFromClient": 0, "supplierArticle": "5200119080675200119080665", "quantityNotInOrders": 7}	2022-08-26 09:08:33.802717	2022-08-26 09:08:33.802717
271	37	18	{"nmId": 111054747, "Price": 2300, "brand": "SITIA", "SCCode": "Tech", "barcode": "5200119080658", "subject": "Масло растительное", "Discount": 30, "category": "Продукты", "isSupply": true, "quantity": 18, "techSize": "0", "warehouse": 15, "daysOnSite": 54, "quantityFull": 18, "inWayToClient": 0, "isRealization": false, "warehouseName": "Электросталь", "lastChangeDate": "2022-08-26T06:36:01.933", "inWayFromClient": 0, "supplierArticle": "5200119080675200119080665", "quantityNotInOrders": 18}	2022-08-26 09:08:33.809618	2022-08-26 09:08:33.809618
272	31	0	{"nmId": 111345604, "Price": 6500, "brand": "SITIA", "SCCode": "Tech", "barcode": "2037838726626", "subject": "Масло растительное", "Discount": 30, "category": "Продукты", "isSupply": true, "quantity": 0, "techSize": "0", "warehouse": 1, "daysOnSite": 48, "quantityFull": 1, "inWayToClient": 1, "isRealization": false, "warehouseName": "Коледино", "lastChangeDate": "2022-08-26T06:36:01.933", "inWayFromClient": 0, "supplierArticle": "5200102953203", "quantityNotInOrders": 1}	2022-08-26 09:08:33.815332	2022-08-26 09:08:33.815332
273	31	11	{"nmId": 111345604, "Price": 6500, "brand": "SITIA", "SCCode": "Tech", "barcode": "2037838726626", "subject": "Масло растительное", "Discount": 30, "category": "Продукты", "isSupply": true, "quantity": 11, "techSize": "0", "warehouse": 15, "daysOnSite": 48, "quantityFull": 11, "inWayToClient": 0, "isRealization": false, "warehouseName": "Электросталь", "lastChangeDate": "2022-08-26T06:36:01.933", "inWayFromClient": 0, "supplierArticle": "5200102953203", "quantityNotInOrders": 11}	2022-08-26 09:08:33.820823	2022-08-26 09:08:33.820823
274	33	0	{"nmId": 111345626, "Price": 1330, "brand": "KOKO", "SCCode": "Tech", "barcode": "2037838797626", "subject": "Масло растительное", "Discount": 33, "category": "Продукты", "isSupply": true, "quantity": 0, "techSize": "0", "warehouse": 1, "daysOnSite": 54, "quantityFull": 1, "inWayToClient": 1, "isRealization": false, "warehouseName": "Коледино", "lastChangeDate": "2022-08-26T06:36:01.933", "inWayFromClient": 0, "supplierArticle": "5205657000631", "quantityNotInOrders": 1}	2022-08-26 09:08:33.825487	2022-08-26 09:08:33.825487
275	33	25	{"nmId": 111345626, "Price": 1330, "brand": "KOKO", "SCCode": "Tech", "barcode": "2037838797626", "subject": "Масло растительное", "Discount": 33, "category": "Продукты", "isSupply": true, "quantity": 25, "techSize": "0", "warehouse": 15, "daysOnSite": 54, "quantityFull": 25, "inWayToClient": 0, "isRealization": false, "warehouseName": "Электросталь", "lastChangeDate": "2022-08-26T06:36:01.933", "inWayFromClient": 0, "supplierArticle": "5205657000631", "quantityNotInOrders": 25}	2022-08-26 09:08:33.829984	2022-08-26 09:08:33.829984
276	34	0	{"nmId": 111885412, "Price": 1380, "brand": "", "SCCode": "Tech", "barcode": "2038421434621", "subject": "Масло растительное", "Discount": 34, "category": "Продукты", "isSupply": true, "quantity": 0, "techSize": "0", "warehouse": 1, "daysOnSite": 48, "quantityFull": 8, "inWayToClient": 8, "isRealization": false, "warehouseName": "Коледино", "lastChangeDate": "2022-08-26T06:36:01.933", "inWayFromClient": 0, "supplierArticle": "52003624003", "quantityNotInOrders": 8}	2022-08-26 09:08:33.834237	2022-08-26 09:08:33.834237
277	35	0	{"nmId": 111885790, "Price": 2800, "brand": "Agrilife", "SCCode": "Tech", "barcode": "2038421534628", "subject": "Масло растительное", "Discount": 35, "category": "Продукты", "isSupply": true, "quantity": 0, "techSize": "0", "warehouse": 1, "daysOnSite": 48, "quantityFull": 3, "inWayToClient": 3, "isRealization": false, "warehouseName": "Коледино", "lastChangeDate": "2022-08-26T06:36:01.933", "inWayFromClient": 0, "supplierArticle": "88571217752", "quantityNotInOrders": 3}	2022-08-26 09:08:33.838245	2022-08-26 09:08:33.838245
278	35	6	{"nmId": 111885790, "Price": 2800, "brand": "Agrilife", "SCCode": "Tech", "barcode": "2038421534628", "subject": "Масло растительное", "Discount": 35, "category": "Продукты", "isSupply": true, "quantity": 6, "techSize": "0", "warehouse": 15, "daysOnSite": 48, "quantityFull": 6, "inWayToClient": 0, "isRealization": false, "warehouseName": "Электросталь", "lastChangeDate": "2022-08-26T06:36:01.933", "inWayFromClient": 0, "supplierArticle": "88571217752", "quantityNotInOrders": 6}	2022-08-26 09:08:33.842568	2022-08-26 09:08:33.842568
279	40	1	{"nmId": 114788424, "Price": 1000, "brand": "Just Greece", "SCCode": "Tech", "barcode": "2040429296620", "subject": "Оливки", "Discount": 43, "category": "Продукты", "isSupply": true, "quantity": 1, "techSize": "0", "warehouse": 15, "daysOnSite": 23, "quantityFull": 1, "inWayToClient": 0, "isRealization": false, "warehouseName": "Электросталь", "lastChangeDate": "2022-08-26T06:36:01.933", "inWayFromClient": 0, "supplierArticle": "zz-52091030656565209103065656", "quantityNotInOrders": 1}	2022-08-26 09:08:33.850263	2022-08-26 09:08:33.850263
280	39	9	{"nmId": 114788690, "Price": 800, "brand": "EcoGreece", "SCCode": "Tech", "barcode": "2040429880621", "subject": "Оливки", "Discount": 49, "category": "Продукты", "isSupply": true, "quantity": 9, "techSize": "0", "warehouse": 15, "daysOnSite": 23, "quantityFull": 9, "inWayToClient": 0, "isRealization": false, "warehouseName": "Электросталь", "lastChangeDate": "2022-08-26T06:36:01.933", "inWayFromClient": 0, "supplierArticle": "ZZ-52014098016935201409801693", "quantityNotInOrders": 9}	2022-08-26 09:08:33.859242	2022-08-26 09:08:33.859242
281	38	12	{"nmId": 117329468, "Price": 1690, "brand": "MINERVA", "SCCode": "Tech", "barcode": "2041990946624", "subject": "Масло растительное", "Discount": 0, "category": "Продукты", "isSupply": true, "quantity": 12, "techSize": "0", "warehouse": 1, "daysOnSite": 0, "quantityFull": 14, "inWayToClient": 2, "isRealization": false, "warehouseName": "Коледино", "lastChangeDate": "2022-08-26T06:36:01.933", "inWayFromClient": 0, "supplierArticle": "5201106190748", "quantityNotInOrders": 14}	2022-08-26 09:08:33.865944	2022-08-26 09:08:33.865944
282	30	0	{"nmId": 110119921, "Price": 1800, "brand": "SITIA", "SCCode": "Tech", "barcode": "2036002208623", "subject": "Масло растительное", "Discount": 47, "category": "Продукты", "isSupply": true, "quantity": 0, "techSize": "0", "warehouse": 1, "daysOnSite": 54, "quantityFull": 2, "inWayToClient": 2, "isRealization": false, "warehouseName": "Коледино", "lastChangeDate": "2022-08-26T06:36:01.933", "inWayFromClient": 0, "supplierArticle": "520011908066981764983278947982", "quantityNotInOrders": 2}	2022-08-26 11:10:32.766319	2022-08-26 11:10:32.766319
283	30	13	{"nmId": 110119921, "Price": 1800, "brand": "SITIA", "SCCode": "Tech", "barcode": "2036002208623", "subject": "Масло растительное", "Discount": 47, "category": "Продукты", "isSupply": true, "quantity": 13, "techSize": "0", "warehouse": 15, "daysOnSite": 54, "quantityFull": 13, "inWayToClient": 0, "isRealization": false, "warehouseName": "Электросталь", "lastChangeDate": "2022-08-26T06:36:01.933", "inWayFromClient": 0, "supplierArticle": "520011908066981764983278947982", "quantityNotInOrders": 13}	2022-08-26 11:10:32.785655	2022-08-26 11:10:32.785655
284	37	5	{"nmId": 111054747, "Price": 2300, "brand": "SITIA", "SCCode": "Tech", "barcode": "5200119080658", "subject": "Масло растительное", "Discount": 30, "category": "Продукты", "isSupply": true, "quantity": 5, "techSize": "0", "warehouse": 1, "daysOnSite": 54, "quantityFull": 7, "inWayToClient": 2, "isRealization": false, "warehouseName": "Коледино", "lastChangeDate": "2022-08-26T06:36:01.933", "inWayFromClient": 0, "supplierArticle": "5200119080675200119080665", "quantityNotInOrders": 7}	2022-08-26 11:10:32.800949	2022-08-26 11:10:32.800949
285	37	18	{"nmId": 111054747, "Price": 2300, "brand": "SITIA", "SCCode": "Tech", "barcode": "5200119080658", "subject": "Масло растительное", "Discount": 30, "category": "Продукты", "isSupply": true, "quantity": 18, "techSize": "0", "warehouse": 15, "daysOnSite": 54, "quantityFull": 18, "inWayToClient": 0, "isRealization": false, "warehouseName": "Электросталь", "lastChangeDate": "2022-08-26T06:36:01.933", "inWayFromClient": 0, "supplierArticle": "5200119080675200119080665", "quantityNotInOrders": 18}	2022-08-26 11:10:32.812369	2022-08-26 11:10:32.812369
286	31	0	{"nmId": 111345604, "Price": 6500, "brand": "SITIA", "SCCode": "Tech", "barcode": "2037838726626", "subject": "Масло растительное", "Discount": 30, "category": "Продукты", "isSupply": true, "quantity": 0, "techSize": "0", "warehouse": 1, "daysOnSite": 48, "quantityFull": 1, "inWayToClient": 1, "isRealization": false, "warehouseName": "Коледино", "lastChangeDate": "2022-08-26T06:36:01.933", "inWayFromClient": 0, "supplierArticle": "5200102953203", "quantityNotInOrders": 1}	2022-08-26 11:10:32.824972	2022-08-26 11:10:32.824972
287	31	11	{"nmId": 111345604, "Price": 6500, "brand": "SITIA", "SCCode": "Tech", "barcode": "2037838726626", "subject": "Масло растительное", "Discount": 30, "category": "Продукты", "isSupply": true, "quantity": 11, "techSize": "0", "warehouse": 15, "daysOnSite": 48, "quantityFull": 11, "inWayToClient": 0, "isRealization": false, "warehouseName": "Электросталь", "lastChangeDate": "2022-08-26T06:36:01.933", "inWayFromClient": 0, "supplierArticle": "5200102953203", "quantityNotInOrders": 11}	2022-08-26 11:10:32.835209	2022-08-26 11:10:32.835209
288	33	0	{"nmId": 111345626, "Price": 1330, "brand": "KOKO", "SCCode": "Tech", "barcode": "2037838797626", "subject": "Масло растительное", "Discount": 33, "category": "Продукты", "isSupply": true, "quantity": 0, "techSize": "0", "warehouse": 1, "daysOnSite": 54, "quantityFull": 1, "inWayToClient": 1, "isRealization": false, "warehouseName": "Коледино", "lastChangeDate": "2022-08-26T06:36:01.933", "inWayFromClient": 0, "supplierArticle": "5205657000631", "quantityNotInOrders": 1}	2022-08-26 11:10:32.84151	2022-08-26 11:10:32.84151
289	33	25	{"nmId": 111345626, "Price": 1330, "brand": "KOKO", "SCCode": "Tech", "barcode": "2037838797626", "subject": "Масло растительное", "Discount": 33, "category": "Продукты", "isSupply": true, "quantity": 25, "techSize": "0", "warehouse": 15, "daysOnSite": 54, "quantityFull": 25, "inWayToClient": 0, "isRealization": false, "warehouseName": "Электросталь", "lastChangeDate": "2022-08-26T06:36:01.933", "inWayFromClient": 0, "supplierArticle": "5205657000631", "quantityNotInOrders": 25}	2022-08-26 11:10:32.846938	2022-08-26 11:10:32.846938
290	34	0	{"nmId": 111885412, "Price": 1380, "brand": "", "SCCode": "Tech", "barcode": "2038421434621", "subject": "Масло растительное", "Discount": 34, "category": "Продукты", "isSupply": true, "quantity": 0, "techSize": "0", "warehouse": 1, "daysOnSite": 48, "quantityFull": 8, "inWayToClient": 8, "isRealization": false, "warehouseName": "Коледино", "lastChangeDate": "2022-08-26T06:36:01.933", "inWayFromClient": 0, "supplierArticle": "52003624003", "quantityNotInOrders": 8}	2022-08-26 11:10:32.851719	2022-08-26 11:10:32.851719
291	35	0	{"nmId": 111885790, "Price": 2800, "brand": "Agrilife", "SCCode": "Tech", "barcode": "2038421534628", "subject": "Масло растительное", "Discount": 35, "category": "Продукты", "isSupply": true, "quantity": 0, "techSize": "0", "warehouse": 1, "daysOnSite": 48, "quantityFull": 3, "inWayToClient": 3, "isRealization": false, "warehouseName": "Коледино", "lastChangeDate": "2022-08-26T06:36:01.933", "inWayFromClient": 0, "supplierArticle": "88571217752", "quantityNotInOrders": 3}	2022-08-26 11:10:32.855703	2022-08-26 11:10:32.855703
292	35	6	{"nmId": 111885790, "Price": 2800, "brand": "Agrilife", "SCCode": "Tech", "barcode": "2038421534628", "subject": "Масло растительное", "Discount": 35, "category": "Продукты", "isSupply": true, "quantity": 6, "techSize": "0", "warehouse": 15, "daysOnSite": 48, "quantityFull": 6, "inWayToClient": 0, "isRealization": false, "warehouseName": "Электросталь", "lastChangeDate": "2022-08-26T06:36:01.933", "inWayFromClient": 0, "supplierArticle": "88571217752", "quantityNotInOrders": 6}	2022-08-26 11:10:32.859501	2022-08-26 11:10:32.859501
293	40	1	{"nmId": 114788424, "Price": 1000, "brand": "Just Greece", "SCCode": "Tech", "barcode": "2040429296620", "subject": "Оливки", "Discount": 43, "category": "Продукты", "isSupply": true, "quantity": 1, "techSize": "0", "warehouse": 15, "daysOnSite": 23, "quantityFull": 1, "inWayToClient": 0, "isRealization": false, "warehouseName": "Электросталь", "lastChangeDate": "2022-08-26T06:36:01.933", "inWayFromClient": 0, "supplierArticle": "zz-52091030656565209103065656", "quantityNotInOrders": 1}	2022-08-26 11:10:32.86305	2022-08-26 11:10:32.86305
294	39	9	{"nmId": 114788690, "Price": 800, "brand": "EcoGreece", "SCCode": "Tech", "barcode": "2040429880621", "subject": "Оливки", "Discount": 49, "category": "Продукты", "isSupply": true, "quantity": 9, "techSize": "0", "warehouse": 15, "daysOnSite": 23, "quantityFull": 9, "inWayToClient": 0, "isRealization": false, "warehouseName": "Электросталь", "lastChangeDate": "2022-08-26T06:36:01.933", "inWayFromClient": 0, "supplierArticle": "ZZ-52014098016935201409801693", "quantityNotInOrders": 9}	2022-08-26 11:10:32.866481	2022-08-26 11:10:32.866481
295	38	12	{"nmId": 117329468, "Price": 1690, "brand": "MINERVA", "SCCode": "Tech", "barcode": "2041990946624", "subject": "Масло растительное", "Discount": 0, "category": "Продукты", "isSupply": true, "quantity": 12, "techSize": "0", "warehouse": 1, "daysOnSite": 0, "quantityFull": 14, "inWayToClient": 2, "isRealization": false, "warehouseName": "Коледино", "lastChangeDate": "2022-08-26T06:36:01.933", "inWayFromClient": 0, "supplierArticle": "5201106190748", "quantityNotInOrders": 14}	2022-08-26 11:10:32.86963	2022-08-26 11:10:32.86963
296	30	0	{"nmId": 110119921, "Price": 1860, "brand": "SITIA", "SCCode": "Tech", "barcode": "2036002208623", "subject": "Масло растительное", "Discount": 47, "category": "Продукты", "isSupply": true, "quantity": 0, "techSize": "0", "warehouse": 1, "daysOnSite": 55, "quantityFull": 2, "inWayToClient": 2, "isRealization": false, "warehouseName": "Коледино", "lastChangeDate": "2022-08-27T03:58:28.153", "inWayFromClient": 0, "supplierArticle": "520011908066981764983278947982", "quantityNotInOrders": 2}	2022-08-27 17:51:57.233031	2022-08-27 17:51:57.233031
297	30	13	{"nmId": 110119921, "Price": 1860, "brand": "SITIA", "SCCode": "Tech", "barcode": "2036002208623", "subject": "Масло растительное", "Discount": 47, "category": "Продукты", "isSupply": true, "quantity": 13, "techSize": "0", "warehouse": 15, "daysOnSite": 55, "quantityFull": 13, "inWayToClient": 0, "isRealization": false, "warehouseName": "Электросталь", "lastChangeDate": "2022-08-27T03:58:28.153", "inWayFromClient": 0, "supplierArticle": "520011908066981764983278947982", "quantityNotInOrders": 13}	2022-08-27 17:51:57.240943	2022-08-27 17:51:57.240943
298	37	4	{"nmId": 111054747, "Price": 2360, "brand": "SITIA", "SCCode": "Tech", "barcode": "5200119080658", "subject": "Масло растительное", "Discount": 30, "category": "Продукты", "isSupply": true, "quantity": 4, "techSize": "0", "warehouse": 1, "daysOnSite": 55, "quantityFull": 8, "inWayToClient": 4, "isRealization": false, "warehouseName": "Коледино", "lastChangeDate": "2022-08-27T03:58:28.153", "inWayFromClient": 0, "supplierArticle": "5200119080675200119080665", "quantityNotInOrders": 8}	2022-08-27 17:51:57.246294	2022-08-27 17:51:57.246294
299	37	17	{"nmId": 111054747, "Price": 2360, "brand": "SITIA", "SCCode": "Tech", "barcode": "5200119080658", "subject": "Масло растительное", "Discount": 30, "category": "Продукты", "isSupply": true, "quantity": 17, "techSize": "0", "warehouse": 15, "daysOnSite": 55, "quantityFull": 17, "inWayToClient": 0, "isRealization": false, "warehouseName": "Электросталь", "lastChangeDate": "2022-08-27T03:58:28.153", "inWayFromClient": 0, "supplierArticle": "5200119080675200119080665", "quantityNotInOrders": 17}	2022-08-27 17:51:57.251736	2022-08-27 17:51:57.251736
300	31	0	{"nmId": 111345604, "Price": 6560, "brand": "SITIA", "SCCode": "Tech", "barcode": "2037838726626", "subject": "Масло растительное", "Discount": 30, "category": "Продукты", "isSupply": true, "quantity": 0, "techSize": "0", "warehouse": 1, "daysOnSite": 49, "quantityFull": 1, "inWayToClient": 1, "isRealization": false, "warehouseName": "Коледино", "lastChangeDate": "2022-08-27T03:58:28.153", "inWayFromClient": 0, "supplierArticle": "5200102953203", "quantityNotInOrders": 1}	2022-08-27 17:51:57.257238	2022-08-27 17:51:57.257238
301	31	11	{"nmId": 111345604, "Price": 6560, "brand": "SITIA", "SCCode": "Tech", "barcode": "2037838726626", "subject": "Масло растительное", "Discount": 30, "category": "Продукты", "isSupply": true, "quantity": 11, "techSize": "0", "warehouse": 15, "daysOnSite": 49, "quantityFull": 11, "inWayToClient": 0, "isRealization": false, "warehouseName": "Электросталь", "lastChangeDate": "2022-08-27T03:58:28.153", "inWayFromClient": 0, "supplierArticle": "5200102953203", "quantityNotInOrders": 11}	2022-08-27 17:51:57.262618	2022-08-27 17:51:57.262618
302	33	0	{"nmId": 111345626, "Price": 1390, "brand": "KOKO", "SCCode": "Tech", "barcode": "2037838797626", "subject": "Масло растительное", "Discount": 33, "category": "Продукты", "isSupply": true, "quantity": 0, "techSize": "0", "warehouse": 1, "daysOnSite": 55, "quantityFull": 1, "inWayToClient": 1, "isRealization": false, "warehouseName": "Коледино", "lastChangeDate": "2022-08-27T03:58:28.153", "inWayFromClient": 0, "supplierArticle": "5205657000631", "quantityNotInOrders": 1}	2022-08-27 17:51:57.268374	2022-08-27 17:51:57.268374
303	33	24	{"nmId": 111345626, "Price": 1390, "brand": "KOKO", "SCCode": "Tech", "barcode": "2037838797626", "subject": "Масло растительное", "Discount": 33, "category": "Продукты", "isSupply": true, "quantity": 24, "techSize": "0", "warehouse": 15, "daysOnSite": 55, "quantityFull": 24, "inWayToClient": 0, "isRealization": false, "warehouseName": "Электросталь", "lastChangeDate": "2022-08-27T03:58:28.153", "inWayFromClient": 0, "supplierArticle": "5205657000631", "quantityNotInOrders": 24}	2022-08-27 17:51:57.273869	2022-08-27 17:51:57.273869
304	34	0	{"nmId": 111885412, "Price": 1440, "brand": "", "SCCode": "Tech", "barcode": "2038421434621", "subject": "Масло растительное", "Discount": 34, "category": "Продукты", "isSupply": true, "quantity": 0, "techSize": "0", "warehouse": 1, "daysOnSite": 49, "quantityFull": 8, "inWayToClient": 8, "isRealization": false, "warehouseName": "Коледино", "lastChangeDate": "2022-08-27T03:58:28.153", "inWayFromClient": 0, "supplierArticle": "52003624003", "quantityNotInOrders": 8}	2022-08-27 17:51:57.279491	2022-08-27 17:51:57.279491
305	35	0	{"nmId": 111885790, "Price": 2800, "brand": "Agrilife", "SCCode": "Tech", "barcode": "2038421534628", "subject": "Масло растительное", "Discount": 35, "category": "Продукты", "isSupply": true, "quantity": 0, "techSize": "0", "warehouse": 1, "daysOnSite": 49, "quantityFull": 3, "inWayToClient": 3, "isRealization": false, "warehouseName": "Коледино", "lastChangeDate": "2022-08-27T03:58:28.153", "inWayFromClient": 0, "supplierArticle": "88571217752", "quantityNotInOrders": 3}	2022-08-27 17:51:57.285318	2022-08-27 17:51:57.285318
306	35	6	{"nmId": 111885790, "Price": 2800, "brand": "Agrilife", "SCCode": "Tech", "barcode": "2038421534628", "subject": "Масло растительное", "Discount": 35, "category": "Продукты", "isSupply": true, "quantity": 6, "techSize": "0", "warehouse": 15, "daysOnSite": 49, "quantityFull": 6, "inWayToClient": 0, "isRealization": false, "warehouseName": "Электросталь", "lastChangeDate": "2022-08-27T03:58:28.153", "inWayFromClient": 0, "supplierArticle": "88571217752", "quantityNotInOrders": 6}	2022-08-27 17:51:57.290919	2022-08-27 17:51:57.290919
307	40	0	{"nmId": 114788424, "Price": 1000, "brand": "Just Greece", "SCCode": "Tech", "barcode": "2040429296620", "subject": "Оливки", "Discount": 43, "category": "Продукты", "isSupply": true, "quantity": 0, "techSize": "0", "warehouse": 1, "daysOnSite": 24, "quantityFull": 1, "inWayToClient": 1, "isRealization": false, "warehouseName": "Коледино", "lastChangeDate": "2022-08-27T03:58:28.153", "inWayFromClient": 0, "supplierArticle": "zz-52091030656565209103065656", "quantityNotInOrders": 1}	2022-08-27 17:51:57.296283	2022-08-27 17:51:57.296283
308	39	9	{"nmId": 114788690, "Price": 800, "brand": "EcoGreece", "SCCode": "Tech", "barcode": "2040429880621", "subject": "Оливки", "Discount": 49, "category": "Продукты", "isSupply": true, "quantity": 9, "techSize": "0", "warehouse": 15, "daysOnSite": 24, "quantityFull": 9, "inWayToClient": 0, "isRealization": false, "warehouseName": "Электросталь", "lastChangeDate": "2022-08-27T03:58:28.153", "inWayFromClient": 0, "supplierArticle": "ZZ-52014098016935201409801693", "quantityNotInOrders": 9}	2022-08-27 17:51:57.301723	2022-08-27 17:51:57.301723
309	38	12	{"nmId": 117329468, "Price": 1750, "brand": "MINERVA", "SCCode": "Tech", "barcode": "2041990946624", "subject": "Масло растительное", "Discount": 0, "category": "Продукты", "isSupply": true, "quantity": 12, "techSize": "0", "warehouse": 1, "daysOnSite": 0, "quantityFull": 12, "inWayToClient": 0, "isRealization": false, "warehouseName": "Коледино", "lastChangeDate": "2022-08-27T03:58:28.153", "inWayFromClient": 0, "supplierArticle": "5201106190748", "quantityNotInOrders": 12}	2022-08-27 17:51:57.306909	2022-08-27 17:51:57.306909
310	40	0	{"nmId": 114788424, "Price": 1000, "brand": "Just Greece", "SCCode": "Tech", "barcode": "2040429296620", "subject": "Оливки", "Discount": 43, "category": "Продукты", "isSupply": true, "quantity": 0, "techSize": "0", "warehouse": 15, "daysOnSite": 23, "quantityFull": 0, "inWayToClient": 0, "isRealization": false, "warehouseName": "Электросталь", "lastChangeDate": "2022-08-27T06:19:14.92", "inWayFromClient": 0, "supplierArticle": "zz-52091030656565209103065656", "quantityNotInOrders": 0}	2022-08-27 17:51:57.312452	2022-08-27 17:51:57.312452
311	30	0	{"nmId": 110119921, "Price": 1860, "brand": "SITIA", "SCCode": "Tech", "barcode": "2036002208623", "subject": "Масло растительное", "Discount": 47, "category": "Продукты", "isSupply": true, "quantity": 0, "techSize": "0", "warehouse": 1, "daysOnSite": 56, "quantityFull": 1, "inWayToClient": 1, "isRealization": false, "warehouseName": "Коледино", "lastChangeDate": "2022-08-28T04:38:15.823", "inWayFromClient": 0, "supplierArticle": "520011908066981764983278947982", "quantityNotInOrders": 1}	2022-08-28 07:48:00.13848	2022-08-28 07:48:00.13848
312	30	13	{"nmId": 110119921, "Price": 1860, "brand": "SITIA", "SCCode": "Tech", "barcode": "2036002208623", "subject": "Масло растительное", "Discount": 47, "category": "Продукты", "isSupply": true, "quantity": 13, "techSize": "0", "warehouse": 15, "daysOnSite": 56, "quantityFull": 13, "inWayToClient": 0, "isRealization": false, "warehouseName": "Электросталь", "lastChangeDate": "2022-08-28T04:38:15.823", "inWayFromClient": 0, "supplierArticle": "520011908066981764983278947982", "quantityNotInOrders": 13}	2022-08-28 07:48:00.144382	2022-08-28 07:48:00.144382
313	37	3	{"nmId": 111054747, "Price": 2360, "brand": "SITIA", "SCCode": "Tech", "barcode": "5200119080658", "subject": "Масло растительное", "Discount": 30, "category": "Продукты", "isSupply": true, "quantity": 3, "techSize": "0", "warehouse": 1, "daysOnSite": 56, "quantityFull": 6, "inWayToClient": 3, "isRealization": false, "warehouseName": "Коледино", "lastChangeDate": "2022-08-28T04:38:15.823", "inWayFromClient": 0, "supplierArticle": "5200119080675200119080665", "quantityNotInOrders": 6}	2022-08-28 07:48:00.149176	2022-08-28 07:48:00.149176
314	37	17	{"nmId": 111054747, "Price": 2360, "brand": "SITIA", "SCCode": "Tech", "barcode": "5200119080658", "subject": "Масло растительное", "Discount": 30, "category": "Продукты", "isSupply": true, "quantity": 17, "techSize": "0", "warehouse": 15, "daysOnSite": 56, "quantityFull": 17, "inWayToClient": 0, "isRealization": false, "warehouseName": "Электросталь", "lastChangeDate": "2022-08-28T04:38:15.823", "inWayFromClient": 0, "supplierArticle": "5200119080675200119080665", "quantityNotInOrders": 17}	2022-08-28 07:48:00.15358	2022-08-28 07:48:00.15358
315	31	0	{"nmId": 111345604, "Price": 6560, "brand": "SITIA", "SCCode": "Tech", "barcode": "2037838726626", "subject": "Масло растительное", "Discount": 30, "category": "Продукты", "isSupply": true, "quantity": 0, "techSize": "0", "warehouse": 1, "daysOnSite": 50, "quantityFull": 2, "inWayToClient": 2, "isRealization": false, "warehouseName": "Коледино", "lastChangeDate": "2022-08-28T04:38:15.823", "inWayFromClient": 0, "supplierArticle": "5200102953203", "quantityNotInOrders": 1}	2022-08-28 07:48:00.157703	2022-08-28 07:48:00.157703
316	31	10	{"nmId": 111345604, "Price": 6560, "brand": "SITIA", "SCCode": "Tech", "barcode": "2037838726626", "subject": "Масло растительное", "Discount": 30, "category": "Продукты", "isSupply": true, "quantity": 10, "techSize": "0", "warehouse": 15, "daysOnSite": 50, "quantityFull": 10, "inWayToClient": 0, "isRealization": false, "warehouseName": "Электросталь", "lastChangeDate": "2022-08-28T04:38:15.823", "inWayFromClient": 0, "supplierArticle": "5200102953203", "quantityNotInOrders": 10}	2022-08-28 07:48:00.162091	2022-08-28 07:48:00.162091
317	33	0	{"nmId": 111345626, "Price": 1390, "brand": "KOKO", "SCCode": "Tech", "barcode": "2037838797626", "subject": "Масло растительное", "Discount": 33, "category": "Продукты", "isSupply": true, "quantity": 0, "techSize": "0", "warehouse": 1, "daysOnSite": 56, "quantityFull": 1, "inWayToClient": 1, "isRealization": false, "warehouseName": "Коледино", "lastChangeDate": "2022-08-28T04:38:15.823", "inWayFromClient": 0, "supplierArticle": "5205657000631", "quantityNotInOrders": 1}	2022-08-28 07:48:00.166164	2022-08-28 07:48:00.166164
318	33	24	{"nmId": 111345626, "Price": 1390, "brand": "KOKO", "SCCode": "Tech", "barcode": "2037838797626", "subject": "Масло растительное", "Discount": 33, "category": "Продукты", "isSupply": true, "quantity": 24, "techSize": "0", "warehouse": 15, "daysOnSite": 56, "quantityFull": 24, "inWayToClient": 0, "isRealization": false, "warehouseName": "Электросталь", "lastChangeDate": "2022-08-28T04:38:15.823", "inWayFromClient": 0, "supplierArticle": "5205657000631", "quantityNotInOrders": 24}	2022-08-28 07:48:00.170275	2022-08-28 07:48:00.170275
319	34	0	{"nmId": 111885412, "Price": 1440, "brand": "", "SCCode": "Tech", "barcode": "2038421434621", "subject": "Масло растительное", "Discount": 34, "category": "Продукты", "isSupply": true, "quantity": 0, "techSize": "0", "warehouse": 1, "daysOnSite": 50, "quantityFull": 8, "inWayToClient": 8, "isRealization": false, "warehouseName": "Коледино", "lastChangeDate": "2022-08-28T04:38:15.823", "inWayFromClient": 0, "supplierArticle": "52003624003", "quantityNotInOrders": 8}	2022-08-28 07:48:00.174349	2022-08-28 07:48:00.174349
320	35	0	{"nmId": 111885790, "Price": 2800, "brand": "Agrilife", "SCCode": "Tech", "barcode": "2038421534628", "subject": "Масло растительное", "Discount": 35, "category": "Продукты", "isSupply": true, "quantity": 0, "techSize": "0", "warehouse": 1, "daysOnSite": 50, "quantityFull": 3, "inWayToClient": 3, "isRealization": false, "warehouseName": "Коледино", "lastChangeDate": "2022-08-28T04:38:15.823", "inWayFromClient": 0, "supplierArticle": "88571217752", "quantityNotInOrders": 3}	2022-08-28 07:48:00.181387	2022-08-28 07:48:00.181387
321	35	6	{"nmId": 111885790, "Price": 2800, "brand": "Agrilife", "SCCode": "Tech", "barcode": "2038421534628", "subject": "Масло растительное", "Discount": 35, "category": "Продукты", "isSupply": true, "quantity": 6, "techSize": "0", "warehouse": 15, "daysOnSite": 50, "quantityFull": 6, "inWayToClient": 0, "isRealization": false, "warehouseName": "Электросталь", "lastChangeDate": "2022-08-28T04:38:15.823", "inWayFromClient": 0, "supplierArticle": "88571217752", "quantityNotInOrders": 6}	2022-08-28 07:48:00.186948	2022-08-28 07:48:00.186948
322	40	0	{"nmId": 114788424, "Price": 1000, "brand": "Just Greece", "SCCode": "Tech", "barcode": "2040429296620", "subject": "Оливки", "Discount": 43, "category": "Продукты", "isSupply": true, "quantity": 0, "techSize": "0", "warehouse": 1, "daysOnSite": 25, "quantityFull": 1, "inWayToClient": 1, "isRealization": false, "warehouseName": "Коледино", "lastChangeDate": "2022-08-28T04:38:15.823", "inWayFromClient": 0, "supplierArticle": "zz-52091030656565209103065656", "quantityNotInOrders": 1}	2022-08-28 07:48:00.191248	2022-08-28 07:48:00.191248
323	39	9	{"nmId": 114788690, "Price": 800, "brand": "EcoGreece", "SCCode": "Tech", "barcode": "2040429880621", "subject": "Оливки", "Discount": 49, "category": "Продукты", "isSupply": true, "quantity": 9, "techSize": "0", "warehouse": 15, "daysOnSite": 25, "quantityFull": 9, "inWayToClient": 0, "isRealization": false, "warehouseName": "Электросталь", "lastChangeDate": "2022-08-28T04:38:15.823", "inWayFromClient": 0, "supplierArticle": "ZZ-52014098016935201409801693", "quantityNotInOrders": 9}	2022-08-28 07:48:00.195526	2022-08-28 07:48:00.195526
324	30	0	{"nmId": 110119921, "Price": 1860, "brand": "SITIA", "SCCode": "Tech", "barcode": "2036002208623", "subject": "Масло растительное", "Discount": 47, "category": "Продукты", "isSupply": true, "quantity": 0, "techSize": "0", "warehouse": 1, "daysOnSite": 56, "quantityFull": 1, "inWayToClient": 1, "isRealization": false, "warehouseName": "Коледино", "lastChangeDate": "2022-08-28T04:38:15.823", "inWayFromClient": 0, "supplierArticle": "520011908066981764983278947982", "quantityNotInOrders": 1}	2022-08-28 11:50:39.278205	2022-08-28 11:50:39.278205
325	30	13	{"nmId": 110119921, "Price": 1860, "brand": "SITIA", "SCCode": "Tech", "barcode": "2036002208623", "subject": "Масло растительное", "Discount": 47, "category": "Продукты", "isSupply": true, "quantity": 13, "techSize": "0", "warehouse": 15, "daysOnSite": 56, "quantityFull": 13, "inWayToClient": 0, "isRealization": false, "warehouseName": "Электросталь", "lastChangeDate": "2022-08-28T04:38:15.823", "inWayFromClient": 0, "supplierArticle": "520011908066981764983278947982", "quantityNotInOrders": 13}	2022-08-28 11:50:39.282636	2022-08-28 11:50:39.282636
326	37	3	{"nmId": 111054747, "Price": 2360, "brand": "SITIA", "SCCode": "Tech", "barcode": "5200119080658", "subject": "Масло растительное", "Discount": 30, "category": "Продукты", "isSupply": true, "quantity": 3, "techSize": "0", "warehouse": 1, "daysOnSite": 56, "quantityFull": 6, "inWayToClient": 3, "isRealization": false, "warehouseName": "Коледино", "lastChangeDate": "2022-08-28T04:38:15.823", "inWayFromClient": 0, "supplierArticle": "5200119080675200119080665", "quantityNotInOrders": 6}	2022-08-28 11:50:39.287588	2022-08-28 11:50:39.287588
327	37	17	{"nmId": 111054747, "Price": 2360, "brand": "SITIA", "SCCode": "Tech", "barcode": "5200119080658", "subject": "Масло растительное", "Discount": 30, "category": "Продукты", "isSupply": true, "quantity": 17, "techSize": "0", "warehouse": 15, "daysOnSite": 56, "quantityFull": 17, "inWayToClient": 0, "isRealization": false, "warehouseName": "Электросталь", "lastChangeDate": "2022-08-28T04:38:15.823", "inWayFromClient": 0, "supplierArticle": "5200119080675200119080665", "quantityNotInOrders": 17}	2022-08-28 11:50:39.292037	2022-08-28 11:50:39.292037
328	31	0	{"nmId": 111345604, "Price": 6560, "brand": "SITIA", "SCCode": "Tech", "barcode": "2037838726626", "subject": "Масло растительное", "Discount": 30, "category": "Продукты", "isSupply": true, "quantity": 0, "techSize": "0", "warehouse": 1, "daysOnSite": 50, "quantityFull": 2, "inWayToClient": 2, "isRealization": false, "warehouseName": "Коледино", "lastChangeDate": "2022-08-28T04:38:15.823", "inWayFromClient": 0, "supplierArticle": "5200102953203", "quantityNotInOrders": 1}	2022-08-28 11:50:39.29693	2022-08-28 11:50:39.29693
329	31	10	{"nmId": 111345604, "Price": 6560, "brand": "SITIA", "SCCode": "Tech", "barcode": "2037838726626", "subject": "Масло растительное", "Discount": 30, "category": "Продукты", "isSupply": true, "quantity": 10, "techSize": "0", "warehouse": 15, "daysOnSite": 50, "quantityFull": 10, "inWayToClient": 0, "isRealization": false, "warehouseName": "Электросталь", "lastChangeDate": "2022-08-28T04:38:15.823", "inWayFromClient": 0, "supplierArticle": "5200102953203", "quantityNotInOrders": 10}	2022-08-28 11:50:39.301614	2022-08-28 11:50:39.301614
330	33	0	{"nmId": 111345626, "Price": 1390, "brand": "KOKO", "SCCode": "Tech", "barcode": "2037838797626", "subject": "Масло растительное", "Discount": 33, "category": "Продукты", "isSupply": true, "quantity": 0, "techSize": "0", "warehouse": 1, "daysOnSite": 56, "quantityFull": 1, "inWayToClient": 1, "isRealization": false, "warehouseName": "Коледино", "lastChangeDate": "2022-08-28T04:38:15.823", "inWayFromClient": 0, "supplierArticle": "5205657000631", "quantityNotInOrders": 1}	2022-08-28 11:50:39.306023	2022-08-28 11:50:39.306023
331	33	24	{"nmId": 111345626, "Price": 1390, "brand": "KOKO", "SCCode": "Tech", "barcode": "2037838797626", "subject": "Масло растительное", "Discount": 33, "category": "Продукты", "isSupply": true, "quantity": 24, "techSize": "0", "warehouse": 15, "daysOnSite": 56, "quantityFull": 24, "inWayToClient": 0, "isRealization": false, "warehouseName": "Электросталь", "lastChangeDate": "2022-08-28T04:38:15.823", "inWayFromClient": 0, "supplierArticle": "5205657000631", "quantityNotInOrders": 24}	2022-08-28 11:50:39.310391	2022-08-28 11:50:39.310391
332	34	0	{"nmId": 111885412, "Price": 1440, "brand": "", "SCCode": "Tech", "barcode": "2038421434621", "subject": "Масло растительное", "Discount": 34, "category": "Продукты", "isSupply": true, "quantity": 0, "techSize": "0", "warehouse": 1, "daysOnSite": 50, "quantityFull": 8, "inWayToClient": 8, "isRealization": false, "warehouseName": "Коледино", "lastChangeDate": "2022-08-28T04:38:15.823", "inWayFromClient": 0, "supplierArticle": "52003624003", "quantityNotInOrders": 8}	2022-08-28 11:50:39.314797	2022-08-28 11:50:39.314797
333	35	0	{"nmId": 111885790, "Price": 2800, "brand": "Agrilife", "SCCode": "Tech", "barcode": "2038421534628", "subject": "Масло растительное", "Discount": 35, "category": "Продукты", "isSupply": true, "quantity": 0, "techSize": "0", "warehouse": 1, "daysOnSite": 50, "quantityFull": 3, "inWayToClient": 3, "isRealization": false, "warehouseName": "Коледино", "lastChangeDate": "2022-08-28T04:38:15.823", "inWayFromClient": 0, "supplierArticle": "88571217752", "quantityNotInOrders": 3}	2022-08-28 11:50:39.319594	2022-08-28 11:50:39.319594
334	35	6	{"nmId": 111885790, "Price": 2800, "brand": "Agrilife", "SCCode": "Tech", "barcode": "2038421534628", "subject": "Масло растительное", "Discount": 35, "category": "Продукты", "isSupply": true, "quantity": 6, "techSize": "0", "warehouse": 15, "daysOnSite": 50, "quantityFull": 6, "inWayToClient": 0, "isRealization": false, "warehouseName": "Электросталь", "lastChangeDate": "2022-08-28T04:38:15.823", "inWayFromClient": 0, "supplierArticle": "88571217752", "quantityNotInOrders": 6}	2022-08-28 11:50:39.323839	2022-08-28 11:50:39.323839
335	40	0	{"nmId": 114788424, "Price": 1000, "brand": "Just Greece", "SCCode": "Tech", "barcode": "2040429296620", "subject": "Оливки", "Discount": 43, "category": "Продукты", "isSupply": true, "quantity": 0, "techSize": "0", "warehouse": 1, "daysOnSite": 25, "quantityFull": 1, "inWayToClient": 1, "isRealization": false, "warehouseName": "Коледино", "lastChangeDate": "2022-08-28T04:38:15.823", "inWayFromClient": 0, "supplierArticle": "zz-52091030656565209103065656", "quantityNotInOrders": 1}	2022-08-28 11:50:39.328403	2022-08-28 11:50:39.328403
336	39	9	{"nmId": 114788690, "Price": 800, "brand": "EcoGreece", "SCCode": "Tech", "barcode": "2040429880621", "subject": "Оливки", "Discount": 49, "category": "Продукты", "isSupply": true, "quantity": 9, "techSize": "0", "warehouse": 15, "daysOnSite": 25, "quantityFull": 9, "inWayToClient": 0, "isRealization": false, "warehouseName": "Электросталь", "lastChangeDate": "2022-08-28T04:38:15.823", "inWayFromClient": 0, "supplierArticle": "ZZ-52014098016935201409801693", "quantityNotInOrders": 9}	2022-08-28 11:50:39.332818	2022-08-28 11:50:39.332818
337	30	0	{"nmId": 110119921, "Price": 1860, "brand": "SITIA", "SCCode": "Tech", "barcode": "2036002208623", "subject": "Масло растительное", "Discount": 47, "category": "Продукты", "isSupply": true, "quantity": 0, "techSize": "0", "warehouse": 1, "daysOnSite": 56, "quantityFull": 1, "inWayToClient": 1, "isRealization": false, "warehouseName": "Коледино", "lastChangeDate": "2022-08-28T04:38:15.823", "inWayFromClient": 0, "supplierArticle": "520011908066981764983278947982", "quantityNotInOrders": 1}	2022-08-28 16:00:05.046911	2022-08-28 16:00:05.046911
338	30	13	{"nmId": 110119921, "Price": 1860, "brand": "SITIA", "SCCode": "Tech", "barcode": "2036002208623", "subject": "Масло растительное", "Discount": 47, "category": "Продукты", "isSupply": true, "quantity": 13, "techSize": "0", "warehouse": 15, "daysOnSite": 56, "quantityFull": 13, "inWayToClient": 0, "isRealization": false, "warehouseName": "Электросталь", "lastChangeDate": "2022-08-28T04:38:15.823", "inWayFromClient": 0, "supplierArticle": "520011908066981764983278947982", "quantityNotInOrders": 13}	2022-08-28 16:00:05.066783	2022-08-28 16:00:05.066783
339	37	3	{"nmId": 111054747, "Price": 2360, "brand": "SITIA", "SCCode": "Tech", "barcode": "5200119080658", "subject": "Масло растительное", "Discount": 30, "category": "Продукты", "isSupply": true, "quantity": 3, "techSize": "0", "warehouse": 1, "daysOnSite": 56, "quantityFull": 6, "inWayToClient": 3, "isRealization": false, "warehouseName": "Коледино", "lastChangeDate": "2022-08-28T04:38:15.823", "inWayFromClient": 0, "supplierArticle": "5200119080675200119080665", "quantityNotInOrders": 6}	2022-08-28 16:00:05.090506	2022-08-28 16:00:05.090506
340	37	17	{"nmId": 111054747, "Price": 2360, "brand": "SITIA", "SCCode": "Tech", "barcode": "5200119080658", "subject": "Масло растительное", "Discount": 30, "category": "Продукты", "isSupply": true, "quantity": 17, "techSize": "0", "warehouse": 15, "daysOnSite": 56, "quantityFull": 17, "inWayToClient": 0, "isRealization": false, "warehouseName": "Электросталь", "lastChangeDate": "2022-08-28T04:38:15.823", "inWayFromClient": 0, "supplierArticle": "5200119080675200119080665", "quantityNotInOrders": 17}	2022-08-28 16:00:05.100304	2022-08-28 16:00:05.100304
341	31	0	{"nmId": 111345604, "Price": 6560, "brand": "SITIA", "SCCode": "Tech", "barcode": "2037838726626", "subject": "Масло растительное", "Discount": 30, "category": "Продукты", "isSupply": true, "quantity": 0, "techSize": "0", "warehouse": 1, "daysOnSite": 50, "quantityFull": 2, "inWayToClient": 2, "isRealization": false, "warehouseName": "Коледино", "lastChangeDate": "2022-08-28T04:38:15.823", "inWayFromClient": 0, "supplierArticle": "5200102953203", "quantityNotInOrders": 1}	2022-08-28 16:00:05.10899	2022-08-28 16:00:05.10899
342	31	10	{"nmId": 111345604, "Price": 6560, "brand": "SITIA", "SCCode": "Tech", "barcode": "2037838726626", "subject": "Масло растительное", "Discount": 30, "category": "Продукты", "isSupply": true, "quantity": 10, "techSize": "0", "warehouse": 15, "daysOnSite": 50, "quantityFull": 10, "inWayToClient": 0, "isRealization": false, "warehouseName": "Электросталь", "lastChangeDate": "2022-08-28T04:38:15.823", "inWayFromClient": 0, "supplierArticle": "5200102953203", "quantityNotInOrders": 10}	2022-08-28 16:00:05.117244	2022-08-28 16:00:05.117244
343	33	0	{"nmId": 111345626, "Price": 1390, "brand": "KOKO", "SCCode": "Tech", "barcode": "2037838797626", "subject": "Масло растительное", "Discount": 33, "category": "Продукты", "isSupply": true, "quantity": 0, "techSize": "0", "warehouse": 1, "daysOnSite": 56, "quantityFull": 1, "inWayToClient": 1, "isRealization": false, "warehouseName": "Коледино", "lastChangeDate": "2022-08-28T04:38:15.823", "inWayFromClient": 0, "supplierArticle": "5205657000631", "quantityNotInOrders": 1}	2022-08-28 16:00:05.125362	2022-08-28 16:00:05.125362
344	33	24	{"nmId": 111345626, "Price": 1390, "brand": "KOKO", "SCCode": "Tech", "barcode": "2037838797626", "subject": "Масло растительное", "Discount": 33, "category": "Продукты", "isSupply": true, "quantity": 24, "techSize": "0", "warehouse": 15, "daysOnSite": 56, "quantityFull": 24, "inWayToClient": 0, "isRealization": false, "warehouseName": "Электросталь", "lastChangeDate": "2022-08-28T04:38:15.823", "inWayFromClient": 0, "supplierArticle": "5205657000631", "quantityNotInOrders": 24}	2022-08-28 16:00:05.13315	2022-08-28 16:00:05.13315
345	34	0	{"nmId": 111885412, "Price": 1440, "brand": "", "SCCode": "Tech", "barcode": "2038421434621", "subject": "Масло растительное", "Discount": 34, "category": "Продукты", "isSupply": true, "quantity": 0, "techSize": "0", "warehouse": 1, "daysOnSite": 50, "quantityFull": 8, "inWayToClient": 8, "isRealization": false, "warehouseName": "Коледино", "lastChangeDate": "2022-08-28T04:38:15.823", "inWayFromClient": 0, "supplierArticle": "52003624003", "quantityNotInOrders": 8}	2022-08-28 16:00:05.141195	2022-08-28 16:00:05.141195
346	35	0	{"nmId": 111885790, "Price": 2800, "brand": "Agrilife", "SCCode": "Tech", "barcode": "2038421534628", "subject": "Масло растительное", "Discount": 35, "category": "Продукты", "isSupply": true, "quantity": 0, "techSize": "0", "warehouse": 1, "daysOnSite": 50, "quantityFull": 3, "inWayToClient": 3, "isRealization": false, "warehouseName": "Коледино", "lastChangeDate": "2022-08-28T04:38:15.823", "inWayFromClient": 0, "supplierArticle": "88571217752", "quantityNotInOrders": 3}	2022-08-28 16:00:05.148958	2022-08-28 16:00:05.148958
347	35	6	{"nmId": 111885790, "Price": 2800, "brand": "Agrilife", "SCCode": "Tech", "barcode": "2038421534628", "subject": "Масло растительное", "Discount": 35, "category": "Продукты", "isSupply": true, "quantity": 6, "techSize": "0", "warehouse": 15, "daysOnSite": 50, "quantityFull": 6, "inWayToClient": 0, "isRealization": false, "warehouseName": "Электросталь", "lastChangeDate": "2022-08-28T04:38:15.823", "inWayFromClient": 0, "supplierArticle": "88571217752", "quantityNotInOrders": 6}	2022-08-28 16:00:05.156666	2022-08-28 16:00:05.156666
348	40	0	{"nmId": 114788424, "Price": 1000, "brand": "Just Greece", "SCCode": "Tech", "barcode": "2040429296620", "subject": "Оливки", "Discount": 43, "category": "Продукты", "isSupply": true, "quantity": 0, "techSize": "0", "warehouse": 1, "daysOnSite": 25, "quantityFull": 1, "inWayToClient": 1, "isRealization": false, "warehouseName": "Коледино", "lastChangeDate": "2022-08-28T04:38:15.823", "inWayFromClient": 0, "supplierArticle": "zz-52091030656565209103065656", "quantityNotInOrders": 1}	2022-08-28 16:00:05.164319	2022-08-28 16:00:05.164319
349	39	9	{"nmId": 114788690, "Price": 800, "brand": "EcoGreece", "SCCode": "Tech", "barcode": "2040429880621", "subject": "Оливки", "Discount": 49, "category": "Продукты", "isSupply": true, "quantity": 9, "techSize": "0", "warehouse": 15, "daysOnSite": 25, "quantityFull": 9, "inWayToClient": 0, "isRealization": false, "warehouseName": "Электросталь", "lastChangeDate": "2022-08-28T04:38:15.823", "inWayFromClient": 0, "supplierArticle": "ZZ-52014098016935201409801693", "quantityNotInOrders": 9}	2022-08-28 16:00:05.172069	2022-08-28 16:00:05.172069
\.


--
-- Data for Name: suply_products; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.suply_products (id, product_id, supply_id, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: supplies; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.supplies (id, name, campaign_id, market_id, user_id, created_at, updated_at) FROM stdin;
47	WB-111	\N	11	2	2022-08-14 12:54:24.36306	2022-08-14 12:54:24.36306
\.


--
-- Data for Name: supply_costs; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.supply_costs (id, name, value, operation_type, data, supply_product_id, type, created_at, updated_at) FROM stdin;
141	\N	\N	\N	\N	62	SupplyCosts::Fulfillment	2022-08-14 12:54:24.373833	2022-08-14 12:54:24.373833
142	\N	\N	\N	\N	62	SupplyCosts::MarketPlace	2022-08-14 12:54:24.37661	2022-08-14 12:54:24.37661
143	\N	\N	\N	\N	62	SupplyCosts::Logistic	2022-08-14 12:54:24.379247	2022-08-14 12:54:24.379247
144	\N	\N	\N	{"работа": "39", "материал": "15"}	63	SupplyCosts::Fulfillment	2022-08-14 12:54:24.38228	2022-08-14 12:54:24.38228
145	\N	\N	\N	{"ozon": {"комиссия": "10", "логистика": "10"}, "wildberries": {"комиссия": "", "логистика": ""}}	63	SupplyCosts::MarketPlace	2022-08-14 12:54:24.385194	2022-08-14 12:54:24.385194
146	\N	\N	\N	\N	63	SupplyCosts::Logistic	2022-08-14 12:54:24.387977	2022-08-14 12:54:24.387977
147	\N	\N	\N	{"работа": "37", "материал": "15"}	64	SupplyCosts::Fulfillment	2022-08-14 12:54:24.391111	2022-08-14 12:54:24.391111
148	\N	\N	\N	{"ozon": {"комиссия": "", "логистика": ""}, "wildberries": {"комиссия": "10", "логистика": "45"}}	64	SupplyCosts::MarketPlace	2022-08-14 12:54:24.393736	2022-08-14 12:54:24.393736
149	\N	\N	\N	\N	64	SupplyCosts::Logistic	2022-08-14 12:54:24.396314	2022-08-14 12:54:24.396314
\.


--
-- Data for Name: supply_products; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.supply_products (id, product_id, supply_id, count, created_at, updated_at, price, purchase_price) FROM stdin;
62	31	47	1	2022-08-14 12:54:24.36683	2022-08-14 12:54:32.435232	\N	\N
63	33	47	2	2022-08-14 12:54:24.36892	2022-08-14 12:54:34.804128	\N	\N
64	35	47	3	2022-08-14 12:54:24.370559	2022-08-14 12:54:37.889193	\N	\N
\.


--
-- Data for Name: user_settings; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.user_settings (id, user_id, data, created_at, updated_at) FROM stdin;
1	2	{"tg_chat_id": "-795596600", "wb_stat_key": "NzlmOTFmNTYtMGEwZC00Y2ZhLWE5OTUtYzU2NGY5NGQ2OGJh", "wb_auth_token": "AvyR1RTS07GvDNKPm7AMQhJ7_tZ8fFfbwPR3q6v_391kcxV6M3qLObxPB2wxt4z7Mgo74LUpDULp5bvhtYszix7qQncRk8gnW1noyOjQf7E1cw"}	2022-08-09 12:15:49.545046	2022-08-15 10:44:38.075433
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users (id, email, encrypted_password, reset_password_token, reset_password_sent_at, remember_created_at, created_at, updated_at) FROM stdin;
2	dev@dev.ru	$2a$12$DP6iyKesbemskj.OJ9xAt.Igdq7nc0kdAiK9EwsNEknsZwlF1MWYq	\N	\N	\N	2022-07-08 22:30:22.394222	2022-07-08 22:30:22.394222
\.


--
-- Name: audits_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.audits_id_seq', 1, false);


--
-- Name: campaigns_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.campaigns_id_seq', 1, true);


--
-- Name: categories_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.categories_id_seq', 1, false);


--
-- Name: friendly_id_slugs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.friendly_id_slugs_id_seq', 1, false);


--
-- Name: imports_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.imports_id_seq', 543, true);


--
-- Name: keyword_results_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.keyword_results_id_seq', 64, true);


--
-- Name: keywords_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.keywords_id_seq', 2, true);


--
-- Name: markets_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.markets_id_seq', 11, true);


--
-- Name: notifications_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.notifications_id_seq', 1, true);


--
-- Name: order_costs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.order_costs_id_seq', 1, false);


--
-- Name: order_products_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.order_products_id_seq', 2213, true);


--
-- Name: orders_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.orders_id_seq', 2216, true);


--
-- Name: photos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.photos_id_seq', 24, true);


--
-- Name: product_categories_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.product_categories_id_seq', 1, false);


--
-- Name: product_keywords_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.product_keywords_id_seq', 2, true);


--
-- Name: products_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.products_id_seq', 40, true);


--
-- Name: sells_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.sells_id_seq', 111, true);


--
-- Name: stocks_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.stocks_id_seq', 349, true);


--
-- Name: suply_products_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.suply_products_id_seq', 1, false);


--
-- Name: supplies_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.supplies_id_seq', 47, true);


--
-- Name: supply_costs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.supply_costs_id_seq', 149, true);


--
-- Name: supply_products_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.supply_products_id_seq', 64, true);


--
-- Name: user_settings_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.user_settings_id_seq', 1, true);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.users_id_seq', 2, true);


--
-- Name: ar_internal_metadata ar_internal_metadata_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ar_internal_metadata
    ADD CONSTRAINT ar_internal_metadata_pkey PRIMARY KEY (key);


--
-- Name: audits audits_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.audits
    ADD CONSTRAINT audits_pkey PRIMARY KEY (id);


--
-- Name: campaigns campaigns_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaigns
    ADD CONSTRAINT campaigns_pkey PRIMARY KEY (id);


--
-- Name: categories categories_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.categories
    ADD CONSTRAINT categories_pkey PRIMARY KEY (id);


--
-- Name: friendly_id_slugs friendly_id_slugs_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.friendly_id_slugs
    ADD CONSTRAINT friendly_id_slugs_pkey PRIMARY KEY (id);


--
-- Name: imports imports_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.imports
    ADD CONSTRAINT imports_pkey PRIMARY KEY (id);


--
-- Name: keyword_results keyword_results_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.keyword_results
    ADD CONSTRAINT keyword_results_pkey PRIMARY KEY (id);


--
-- Name: keywords keywords_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.keywords
    ADD CONSTRAINT keywords_pkey PRIMARY KEY (id);


--
-- Name: markets markets_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.markets
    ADD CONSTRAINT markets_pkey PRIMARY KEY (id);


--
-- Name: notifications notifications_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.notifications
    ADD CONSTRAINT notifications_pkey PRIMARY KEY (id);


--
-- Name: order_costs order_costs_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_costs
    ADD CONSTRAINT order_costs_pkey PRIMARY KEY (id);


--
-- Name: order_products order_products_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_products
    ADD CONSTRAINT order_products_pkey PRIMARY KEY (id);


--
-- Name: orders orders_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_pkey PRIMARY KEY (id);


--
-- Name: photos photos_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.photos
    ADD CONSTRAINT photos_pkey PRIMARY KEY (id);


--
-- Name: product_categories product_categories_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_categories
    ADD CONSTRAINT product_categories_pkey PRIMARY KEY (id);


--
-- Name: product_keywords product_keywords_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_keywords
    ADD CONSTRAINT product_keywords_pkey PRIMARY KEY (id);


--
-- Name: products products_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products
    ADD CONSTRAINT products_pkey PRIMARY KEY (id);


--
-- Name: schema_migrations schema_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.schema_migrations
    ADD CONSTRAINT schema_migrations_pkey PRIMARY KEY (version);


--
-- Name: sells sells_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sells
    ADD CONSTRAINT sells_pkey PRIMARY KEY (id);


--
-- Name: stocks stocks_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.stocks
    ADD CONSTRAINT stocks_pkey PRIMARY KEY (id);


--
-- Name: suply_products suply_products_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.suply_products
    ADD CONSTRAINT suply_products_pkey PRIMARY KEY (id);


--
-- Name: supplies supplies_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.supplies
    ADD CONSTRAINT supplies_pkey PRIMARY KEY (id);


--
-- Name: supply_costs supply_costs_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.supply_costs
    ADD CONSTRAINT supply_costs_pkey PRIMARY KEY (id);


--
-- Name: supply_products supply_products_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.supply_products
    ADD CONSTRAINT supply_products_pkey PRIMARY KEY (id);


--
-- Name: user_settings user_settings_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_settings
    ADD CONSTRAINT user_settings_pkey PRIMARY KEY (id);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: associated_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX associated_index ON public.audits USING btree (associated_type, associated_id);


--
-- Name: auditable_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auditable_index ON public.audits USING btree (auditable_type, auditable_id, version);


--
-- Name: index_audits_on_created_at; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_audits_on_created_at ON public.audits USING btree (created_at);


--
-- Name: index_audits_on_request_uuid; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_audits_on_request_uuid ON public.audits USING btree (request_uuid);


--
-- Name: index_campaigns_on_market_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_campaigns_on_market_id ON public.campaigns USING btree (market_id);


--
-- Name: index_friendly_id_slugs_on_slug_and_sluggable_type; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_friendly_id_slugs_on_slug_and_sluggable_type ON public.friendly_id_slugs USING btree (slug, sluggable_type);


--
-- Name: index_friendly_id_slugs_on_slug_and_sluggable_type_and_scope; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX index_friendly_id_slugs_on_slug_and_sluggable_type_and_scope ON public.friendly_id_slugs USING btree (slug, sluggable_type, scope);


--
-- Name: index_friendly_id_slugs_on_sluggable_type_and_sluggable_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_friendly_id_slugs_on_sluggable_type_and_sluggable_id ON public.friendly_id_slugs USING btree (sluggable_type, sluggable_id);


--
-- Name: index_imports_on_campaign_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_imports_on_campaign_id ON public.imports USING btree (campaign_id);


--
-- Name: index_keyword_results_on_keyword_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_keyword_results_on_keyword_id ON public.keyword_results USING btree (keyword_id);


--
-- Name: index_markets_on_user_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_markets_on_user_id ON public.markets USING btree (user_id);


--
-- Name: index_notifications_on_read_at; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_notifications_on_read_at ON public.notifications USING btree (read_at);


--
-- Name: index_notifications_on_recipient; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_notifications_on_recipient ON public.notifications USING btree (recipient_type, recipient_id);


--
-- Name: index_order_costs_on_campaign_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_order_costs_on_campaign_id ON public.order_costs USING btree (campaign_id);


--
-- Name: index_order_costs_on_import_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_order_costs_on_import_id ON public.order_costs USING btree (import_id);


--
-- Name: index_order_costs_on_order_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_order_costs_on_order_id ON public.order_costs USING btree (order_id);


--
-- Name: index_order_products_on_campaign_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_order_products_on_campaign_id ON public.order_products USING btree (campaign_id);


--
-- Name: index_order_products_on_order_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_order_products_on_order_id ON public.order_products USING btree (order_id);


--
-- Name: index_order_products_on_product_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_order_products_on_product_id ON public.order_products USING btree (product_id);


--
-- Name: index_orders_on_campaign_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_orders_on_campaign_id ON public.orders USING btree (campaign_id);


--
-- Name: index_orders_on_import_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_orders_on_import_id ON public.orders USING btree (import_id);


--
-- Name: index_photos_on_product_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_photos_on_product_id ON public.photos USING btree (product_id);


--
-- Name: index_product_categories_on_category_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_product_categories_on_category_id ON public.product_categories USING btree (category_id);


--
-- Name: index_product_categories_on_product_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_product_categories_on_product_id ON public.product_categories USING btree (product_id);


--
-- Name: index_product_keywords_on_keyword_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_product_keywords_on_keyword_id ON public.product_keywords USING btree (keyword_id);


--
-- Name: index_product_keywords_on_product_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_product_keywords_on_product_id ON public.product_keywords USING btree (product_id);


--
-- Name: index_products_on_campaign_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_products_on_campaign_id ON public.products USING btree (campaign_id);


--
-- Name: index_products_on_import_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_products_on_import_id ON public.products USING btree (import_id);


--
-- Name: index_products_on_user_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_products_on_user_id ON public.products USING btree (user_id);


--
-- Name: index_sells_on_order_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_sells_on_order_id ON public.sells USING btree (order_id);


--
-- Name: index_stocks_on_product_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_stocks_on_product_id ON public.stocks USING btree (product_id);


--
-- Name: index_suply_products_on_product_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_suply_products_on_product_id ON public.suply_products USING btree (product_id);


--
-- Name: index_suply_products_on_supply_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_suply_products_on_supply_id ON public.suply_products USING btree (supply_id);


--
-- Name: index_supplies_on_campaign_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_supplies_on_campaign_id ON public.supplies USING btree (campaign_id);


--
-- Name: index_supplies_on_market_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_supplies_on_market_id ON public.supplies USING btree (market_id);


--
-- Name: index_supplies_on_user_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_supplies_on_user_id ON public.supplies USING btree (user_id);


--
-- Name: index_supply_costs_on_supply_product_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_supply_costs_on_supply_product_id ON public.supply_costs USING btree (supply_product_id);


--
-- Name: index_supply_products_on_product_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_supply_products_on_product_id ON public.supply_products USING btree (product_id);


--
-- Name: index_supply_products_on_supply_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_supply_products_on_supply_id ON public.supply_products USING btree (supply_id);


--
-- Name: index_user_settings_on_user_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_user_settings_on_user_id ON public.user_settings USING btree (user_id);


--
-- Name: index_users_on_email; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX index_users_on_email ON public.users USING btree (email);


--
-- Name: index_users_on_reset_password_token; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX index_users_on_reset_password_token ON public.users USING btree (reset_password_token);


--
-- Name: user_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX user_index ON public.audits USING btree (user_id, user_type);


--
-- Name: product_categories fk_rails_005b71ca83; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_categories
    ADD CONSTRAINT fk_rails_005b71ca83 FOREIGN KEY (category_id) REFERENCES public.categories(id);


--
-- Name: product_keywords fk_rails_08c8dfb877; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_keywords
    ADD CONSTRAINT fk_rails_08c8dfb877 FOREIGN KEY (keyword_id) REFERENCES public.keywords(id);


--
-- Name: photos fk_rails_10710add2f; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.photos
    ADD CONSTRAINT fk_rails_10710add2f FOREIGN KEY (product_id) REFERENCES public.products(id);


--
-- Name: product_keywords fk_rails_21cbf809f7; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_keywords
    ADD CONSTRAINT fk_rails_21cbf809f7 FOREIGN KEY (product_id) REFERENCES public.products(id);


--
-- Name: supply_products fk_rails_41af990240; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.supply_products
    ADD CONSTRAINT fk_rails_41af990240 FOREIGN KEY (product_id) REFERENCES public.products(id);


--
-- Name: orders fk_rails_5cdf762b9e; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT fk_rails_5cdf762b9e FOREIGN KEY (campaign_id) REFERENCES public.campaigns(id);


--
-- Name: supply_products fk_rails_773ada64e3; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.supply_products
    ADD CONSTRAINT fk_rails_773ada64e3 FOREIGN KEY (supply_id) REFERENCES public.supplies(id);


--
-- Name: campaigns fk_rails_806249ac5f; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaigns
    ADD CONSTRAINT fk_rails_806249ac5f FOREIGN KEY (market_id) REFERENCES public.markets(id);


--
-- Name: markets fk_rails_80dc18e8b5; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.markets
    ADD CONSTRAINT fk_rails_80dc18e8b5 FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- Name: order_costs fk_rails_8f324e0125; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_costs
    ADD CONSTRAINT fk_rails_8f324e0125 FOREIGN KEY (order_id) REFERENCES public.orders(id);


--
-- Name: order_costs fk_rails_902afb0ac3; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_costs
    ADD CONSTRAINT fk_rails_902afb0ac3 FOREIGN KEY (import_id) REFERENCES public.imports(id);


--
-- Name: order_products fk_rails_96c0709f78; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_products
    ADD CONSTRAINT fk_rails_96c0709f78 FOREIGN KEY (product_id) REFERENCES public.products(id);


--
-- Name: product_categories fk_rails_98a9a32a41; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_categories
    ADD CONSTRAINT fk_rails_98a9a32a41 FOREIGN KEY (product_id) REFERENCES public.products(id);


--
-- Name: supplies fk_rails_a181ea1771; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.supplies
    ADD CONSTRAINT fk_rails_a181ea1771 FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- Name: keyword_results fk_rails_a5e3768e22; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.keyword_results
    ADD CONSTRAINT fk_rails_a5e3768e22 FOREIGN KEY (keyword_id) REFERENCES public.keywords(id);


--
-- Name: sells fk_rails_aa63525832; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sells
    ADD CONSTRAINT fk_rails_aa63525832 FOREIGN KEY (order_id) REFERENCES public.orders(id);


--
-- Name: orders fk_rails_c66c7a55a3; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT fk_rails_c66c7a55a3 FOREIGN KEY (import_id) REFERENCES public.imports(id);


--
-- Name: order_costs fk_rails_cf6c8dc0c2; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_costs
    ADD CONSTRAINT fk_rails_cf6c8dc0c2 FOREIGN KEY (campaign_id) REFERENCES public.campaigns(id);


--
-- Name: stocks fk_rails_cfc800c26b; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.stocks
    ADD CONSTRAINT fk_rails_cfc800c26b FOREIGN KEY (product_id) REFERENCES public.products(id);


--
-- Name: user_settings fk_rails_d1371c6356; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_settings
    ADD CONSTRAINT fk_rails_d1371c6356 FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- Name: products fk_rails_dee2631783; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products
    ADD CONSTRAINT fk_rails_dee2631783 FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- Name: supply_costs fk_rails_e26b357a0e; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.supply_costs
    ADD CONSTRAINT fk_rails_e26b357a0e FOREIGN KEY (supply_product_id) REFERENCES public.supply_products(id);


--
-- Name: order_products fk_rails_e7754a3b4a; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_products
    ADD CONSTRAINT fk_rails_e7754a3b4a FOREIGN KEY (campaign_id) REFERENCES public.campaigns(id);


--
-- Name: order_products fk_rails_f40b8ccee4; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_products
    ADD CONSTRAINT fk_rails_f40b8ccee4 FOREIGN KEY (order_id) REFERENCES public.orders(id);


--
-- PostgreSQL database dump complete
--

