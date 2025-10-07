--
-- PostgreSQL database dump
--

-- Dumped from database version 14.8
-- Dumped by pg_dump version 14.8

-- Started on 2025-10-07 18:32:49

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
-- TOC entry 231 (class 1259 OID 57951)
-- Name: caja; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.caja (
    cod_caja integer NOT NULL,
    fecha_i character varying(12),
    hora_i character varying(12),
    fecha_c character varying(12),
    hora_c character varying(12),
    bs_saldoi numeric(12,2),
    ps_saldoi numeric(12,2),
    bs_egreso numeric(12,2),
    ps_egreso numeric(12,2),
    bs_ingreso numeric(12,2),
    ps_ingreso numeric(12,2),
    banca_ingreso numeric(12,2),
    bs_saldo_pre numeric(12,2),
    ps_saldo_pre numeric(12,2),
    bs_insumo numeric(12,2),
    bs_bruto numeric(12,2),
    bs_saldo_final numeric(12,2),
    bs_descuento numeric(12,2),
    estado integer,
    ci_usuario_i integer,
    ci_usuario_c integer,
    bs_iva numeric(12,2),
    tipo_cambio numeric(15,5)
);


ALTER TABLE public.caja OWNER TO postgres;

--
-- TOC entry 233 (class 1259 OID 57985)
-- Name: caja_ajuste; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.caja_ajuste (
    cod_ajuste integer NOT NULL,
    fecha character varying(10),
    hora character varying(10),
    bs_saldo_pre numeric(12,2),
    ps_saldo_pre numeric(12,2),
    bs_ajuste numeric(12,2),
    ps_ajuste numeric(12,2),
    bs_saldo numeric(12,2),
    ps_saldo numeric(12,2),
    tipo integer,
    descripcion character varying(255),
    ci_usuario integer,
    cod_caja integer
);


ALTER TABLE public.caja_ajuste OWNER TO postgres;

--
-- TOC entry 232 (class 1259 OID 57984)
-- Name: caja_ajuste_cod_ajuste_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.caja_ajuste_cod_ajuste_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.caja_ajuste_cod_ajuste_seq OWNER TO postgres;

--
-- TOC entry 3497 (class 0 OID 0)
-- Dependencies: 232
-- Name: caja_ajuste_cod_ajuste_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.caja_ajuste_cod_ajuste_seq OWNED BY public.caja_ajuste.cod_ajuste;


--
-- TOC entry 229 (class 1259 OID 57949)
-- Name: caja_cod_caja_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.caja_cod_caja_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.caja_cod_caja_seq OWNER TO postgres;

--
-- TOC entry 230 (class 1259 OID 57950)
-- Name: caja_cod_caja_seq1; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.caja_cod_caja_seq1
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.caja_cod_caja_seq1 OWNER TO postgres;

--
-- TOC entry 3498 (class 0 OID 0)
-- Dependencies: 230
-- Name: caja_cod_caja_seq1; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.caja_cod_caja_seq1 OWNED BY public.caja.cod_caja;


--
-- TOC entry 215 (class 1259 OID 32878)
-- Name: categoria; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.categoria (
    cod_categoria integer NOT NULL,
    nombre character varying(155) NOT NULL
);


ALTER TABLE public.categoria OWNER TO postgres;

--
-- TOC entry 214 (class 1259 OID 32833)
-- Name: cliente; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.cliente (
    cod_cliente integer NOT NULL,
    nombre character varying(25) NOT NULL,
    documento integer NOT NULL,
    correo character varying(50),
    celular numeric,
    estado integer,
    identificacion numeric NOT NULL
);


ALTER TABLE public.cliente OWNER TO postgres;

--
-- TOC entry 239 (class 1259 OID 66284)
-- Name: cliente_cod_cliente_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.cliente_cod_cliente_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.cliente_cod_cliente_seq OWNER TO postgres;

--
-- TOC entry 3499 (class 0 OID 0)
-- Dependencies: 239
-- Name: cliente_cod_cliente_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.cliente_cod_cliente_seq OWNED BY public.cliente.cod_cliente;


--
-- TOC entry 219 (class 1259 OID 32954)
-- Name: complemento; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.complemento (
    cod_complemento integer NOT NULL,
    nombre character varying(155) NOT NULL,
    descripcion character varying(255),
    estado integer
);


ALTER TABLE public.complemento OWNER TO postgres;

--
-- TOC entry 228 (class 1259 OID 57859)
-- Name: complemento_opcion; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.complemento_opcion (
    cod_complemento integer NOT NULL,
    cod_opcion integer NOT NULL
);


ALTER TABLE public.complemento_opcion OWNER TO postgres;

--
-- TOC entry 224 (class 1259 OID 33152)
-- Name: detalle_movimiento_insumo; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.detalle_movimiento_insumo (
    lote numeric,
    cod_mov integer,
    cod_insumo integer,
    precio numeric(12,2),
    precio_unidad numeric(12,2),
    cantidad numeric(12,2),
    existencia numeric(12,2),
    cantidad_nueva numeric(12,2),
    cod_detalle_insumo integer NOT NULL
);


ALTER TABLE public.detalle_movimiento_insumo OWNER TO postgres;

--
-- TOC entry 237 (class 1259 OID 58064)
-- Name: detalle_opcion; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.detalle_opcion (
    cod_item integer,
    cod_opcion integer,
    cantidad_op numeric
);


ALTER TABLE public.detalle_opcion OWNER TO postgres;

--
-- TOC entry 226 (class 1259 OID 33195)
-- Name: detalle_venta; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.detalle_venta (
    cod_item integer NOT NULL,
    cod_venta integer,
    cantidad_item numeric,
    cod_producto integer,
    item_llevar boolean
);


ALTER TABLE public.detalle_venta OWNER TO postgres;

--
-- TOC entry 238 (class 1259 OID 66270)
-- Name: detalle_venta_cod_item_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.detalle_venta_cod_item_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.detalle_venta_cod_item_seq OWNER TO postgres;

--
-- TOC entry 3500 (class 0 OID 0)
-- Dependencies: 238
-- Name: detalle_venta_cod_item_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.detalle_venta_cod_item_seq OWNED BY public.detalle_venta.cod_item;


--
-- TOC entry 218 (class 1259 OID 32918)
-- Name: insumo; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.insumo (
    cod_insumo integer NOT NULL,
    nombre character varying(100) NOT NULL,
    medida integer,
    descripcion character varying(255),
    existencia numeric(10,2),
    estado integer,
    minimo numeric(10,2)
);


ALTER TABLE public.insumo OWNER TO postgres;

--
-- TOC entry 222 (class 1259 OID 33018)
-- Name: insumo_opcion; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.insumo_opcion (
    cod_insumo integer,
    cod_opcion integer,
    cantidad numeric(6,4) NOT NULL
);


ALTER TABLE public.insumo_opcion OWNER TO postgres;

--
-- TOC entry 227 (class 1259 OID 57834)
-- Name: insumo_producto; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.insumo_producto (
    cod_insumo integer,
    cantidad numeric(6,4) NOT NULL,
    cod_producto integer NOT NULL
);


ALTER TABLE public.insumo_producto OWNER TO postgres;

--
-- TOC entry 234 (class 1259 OID 58012)
-- Name: insumo_producto_cod_producto_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.insumo_producto_cod_producto_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.insumo_producto_cod_producto_seq OWNER TO postgres;

--
-- TOC entry 3501 (class 0 OID 0)
-- Dependencies: 234
-- Name: insumo_producto_cod_producto_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.insumo_producto_cod_producto_seq OWNED BY public.insumo_producto.cod_producto;


--
-- TOC entry 223 (class 1259 OID 33132)
-- Name: movimiento_insumo; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.movimiento_insumo (
    cod_mov integer NOT NULL,
    movimiento integer,
    precio numeric(12,2),
    ps_precio numeric(12,2),
    tipo_cambio numeric(15,5),
    descripcion character varying(255),
    fecha character varying(15),
    hora character varying(10),
    ci_usuario integer,
    origen integer,
    cod_venta integer
);


ALTER TABLE public.movimiento_insumo OWNER TO postgres;

--
-- TOC entry 221 (class 1259 OID 33008)
-- Name: opcion; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.opcion (
    cod_opcion integer NOT NULL,
    nombre character varying(155) NOT NULL,
    descripcion character varying(255),
    estado integer
);


ALTER TABLE public.opcion OWNER TO postgres;

--
-- TOC entry 217 (class 1259 OID 32903)
-- Name: producto; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.producto (
    cod_producto integer NOT NULL,
    nombre character varying(155) NOT NULL,
    precio numeric,
    producto_unico integer,
    estado integer,
    cod_categoria integer,
    cod_subcategoria integer,
    cocina boolean
);


ALTER TABLE public.producto OWNER TO postgres;

--
-- TOC entry 220 (class 1259 OID 32959)
-- Name: producto_complemento; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.producto_complemento (
    cod_producto integer NOT NULL,
    cod_complemento integer NOT NULL
);


ALTER TABLE public.producto_complemento OWNER TO postgres;

--
-- TOC entry 212 (class 1259 OID 32812)
-- Name: roles; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.roles (
    cod_rol integer NOT NULL,
    rol character varying(30),
    enlace character varying(30)
);


ALTER TABLE public.roles OWNER TO postgres;

--
-- TOC entry 211 (class 1259 OID 32811)
-- Name: roles_cod_rol_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.roles_cod_rol_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.roles_cod_rol_seq OWNER TO postgres;

--
-- TOC entry 3502 (class 0 OID 0)
-- Dependencies: 211
-- Name: roles_cod_rol_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.roles_cod_rol_seq OWNED BY public.roles.cod_rol;


--
-- TOC entry 213 (class 1259 OID 32818)
-- Name: roles_usuarios; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.roles_usuarios (
    ci_usuario integer NOT NULL,
    cod_rol integer NOT NULL
);


ALTER TABLE public.roles_usuarios OWNER TO postgres;

--
-- TOC entry 216 (class 1259 OID 32893)
-- Name: subcategoria; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.subcategoria (
    cod_subcategoria integer NOT NULL,
    nombre character varying(155) NOT NULL,
    cod_categoria integer
);


ALTER TABLE public.subcategoria OWNER TO postgres;

--
-- TOC entry 210 (class 1259 OID 32805)
-- Name: usuario; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.usuario (
    ci_usuario integer NOT NULL,
    nom_usu character varying(15) NOT NULL,
    ap_usu character varying(15),
    clave text,
    reset_expires timestamp with time zone,
    reset_token text,
    cargo integer
);


ALTER TABLE public.usuario OWNER TO postgres;

--
-- TOC entry 209 (class 1259 OID 32804)
-- Name: usuario_ci_usuario_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.usuario_ci_usuario_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.usuario_ci_usuario_seq OWNER TO postgres;

--
-- TOC entry 3503 (class 0 OID 0)
-- Dependencies: 209
-- Name: usuario_ci_usuario_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.usuario_ci_usuario_seq OWNED BY public.usuario.ci_usuario;


--
-- TOC entry 225 (class 1259 OID 33180)
-- Name: venta; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.venta (
    cod_venta integer NOT NULL,
    cod_caja integer,
    ticket integer,
    mesa integer,
    hora character varying(10),
    descripcion character varying(255),
    estado integer,
    ci_usuario integer,
    cod_cliente integer,
    bs_total numeric(12,2),
    bs_pagado numeric(12,2),
    bs_cambio numeric(12,2),
    ps_total numeric(12,2),
    ps_pagado numeric(12,2),
    ps_cambio numeric(12,2),
    estado_documento integer,
    venta_llevar boolean,
    bs_descuento numeric(12,2),
    bs_banca_pagado numeric(12,2),
    ps_descuento numeric(12,2),
    fecha character varying(15),
    estado_transaccion integer
);


ALTER TABLE public.venta OWNER TO postgres;

--
-- TOC entry 235 (class 1259 OID 58027)
-- Name: venta_cod_venta_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.venta_cod_venta_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.venta_cod_venta_seq OWNER TO postgres;

--
-- TOC entry 3504 (class 0 OID 0)
-- Dependencies: 235
-- Name: venta_cod_venta_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.venta_cod_venta_seq OWNED BY public.venta.cod_venta;


--
-- TOC entry 236 (class 1259 OID 58054)
-- Name: venta_ticket_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.venta_ticket_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.venta_ticket_seq OWNER TO postgres;

--
-- TOC entry 3505 (class 0 OID 0)
-- Dependencies: 236
-- Name: venta_ticket_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.venta_ticket_seq OWNED BY public.venta.ticket;


--
-- TOC entry 3260 (class 2604 OID 57954)
-- Name: caja cod_caja; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.caja ALTER COLUMN cod_caja SET DEFAULT nextval('public.caja_cod_caja_seq1'::regclass);


--
-- TOC entry 3261 (class 2604 OID 57988)
-- Name: caja_ajuste cod_ajuste; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.caja_ajuste ALTER COLUMN cod_ajuste SET DEFAULT nextval('public.caja_ajuste_cod_ajuste_seq'::regclass);


--
-- TOC entry 3255 (class 2604 OID 66285)
-- Name: cliente cod_cliente; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cliente ALTER COLUMN cod_cliente SET DEFAULT nextval('public.cliente_cod_cliente_seq'::regclass);


--
-- TOC entry 3258 (class 2604 OID 66271)
-- Name: detalle_venta cod_item; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.detalle_venta ALTER COLUMN cod_item SET DEFAULT nextval('public.detalle_venta_cod_item_seq'::regclass);


--
-- TOC entry 3259 (class 2604 OID 58013)
-- Name: insumo_producto cod_producto; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.insumo_producto ALTER COLUMN cod_producto SET DEFAULT nextval('public.insumo_producto_cod_producto_seq'::regclass);


--
-- TOC entry 3254 (class 2604 OID 32815)
-- Name: roles cod_rol; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.roles ALTER COLUMN cod_rol SET DEFAULT nextval('public.roles_cod_rol_seq'::regclass);


--
-- TOC entry 3253 (class 2604 OID 32808)
-- Name: usuario ci_usuario; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuario ALTER COLUMN ci_usuario SET DEFAULT nextval('public.usuario_ci_usuario_seq'::regclass);


--
-- TOC entry 3256 (class 2604 OID 58028)
-- Name: venta cod_venta; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.venta ALTER COLUMN cod_venta SET DEFAULT nextval('public.venta_cod_venta_seq'::regclass);


--
-- TOC entry 3257 (class 2604 OID 58055)
-- Name: venta ticket; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.venta ALTER COLUMN ticket SET DEFAULT nextval('public.venta_ticket_seq'::regclass);


--
-- TOC entry 3483 (class 0 OID 57951)
-- Dependencies: 231
-- Data for Name: caja; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.caja (cod_caja, fecha_i, hora_i, fecha_c, hora_c, bs_saldoi, ps_saldoi, bs_egreso, ps_egreso, bs_ingreso, ps_ingreso, banca_ingreso, bs_saldo_pre, ps_saldo_pre, bs_insumo, bs_bruto, bs_saldo_final, bs_descuento, estado, ci_usuario_i, ci_usuario_c, bs_iva, tipo_cambio) FROM stdin;
33	30/09/2024	20:24	03/10/2024	14:14	100.00	1000.00	149.00	2000.00	480.00	5000.00	0.00	431.00	4000.00	39.00	312.00	411.30	10.00	1	8540205	8540205	2.60	0.00670
38	27/11/2024	14:07	03/12/2024	23:12	200.00	\N	90.00	0.00	175.00	0.00	0.00	385.00	1000.00	NaN	NaN	NaN	0.00	1	8540205	8540205	2.60	0.01000
57	27/05/2025	23:23	21/08/2025	10:24	100.00	1000.00	67.00	4000.00	370.00	14000.00	125.00	403.00	11000.00	264.40	303.60	303.60	0.00	1	8540205	8540205	30.68	0.01400
39	05/12/2024	20:17	05/12/2024	20:26	500.00	\N	0.00	0.00	20.00	0.00	0.00	520.00	0.00	10.00	10.00	510.00	0.00	1	8540205	8540205	0.00	0.01000
52	08/02/2025	12:00	11/02/2025	10:20	100.00	1000.00	30.00	0.00	521.00	0.00	0.00	591.00	1000.00	153.80	337.20	337.20	0.00	1	8540205	8540205	0.00	0.09000
61	12/09/2025	11:04	15/09/2025	16:24	200.00	10000.00	102.00	1600.00	561.00	31000.00	175.00	659.00	39400.00	513.95	414.05	414.05	0.00	1	8540205	8540205	0.00	0.01000
55	12/02/2025	22:07	01/05/2025	20:10	100.00	1000.00	5.00	550.00	120.00	4500.00	0.00	215.00	4950.00	46.50	104.50	104.50	0.00	1	8540205	8540205	0.00	0.00900
60	09/09/2025	11:41	09/09/2025	18:44	800.00	10000.00	120.00	0.00	340.00	20000.00	40.00	1020.00	30000.00	189.00	231.00	228.40	0.00	1	8540205	8540205	2.60	0.00800
62	15/09/2025	16:38	07/10/2025	18:26	300.00	10000.00	398.00	7900.00	1900.00	50000.00	225.00	1802.00	52100.00	1158.62	989.38	989.38	0.00	1	8540205	1234567	0.00	0.01000
49	15/12/2024	23:11	15/12/2024	23:33	200.00	3000.00	160.00	200.00	1250.00	13000.00	293.00	200.00	5000.00	701.10	809.90	789.90	20.00	1	8540205	8540205	0.00	0.01000
34	03/10/2024	22:50	11/11/2024	16:47	100.00	1000.00	342.00	0.00	1010.00	0.00	0.00	768.00	1000.00	82.00	586.00	680.35	0.00	1	8540205	8540205	12.35	0.00670
53	11/02/2025	10:20	12/02/2025	18:05	100.00	1000.00	57.00	950.00	636.00	28000.00	0.00	679.00	28050.00	390.20	431.80	431.80	0.00	1	8540205	8540205	0.00	0.00900
48	14/12/2024	22:06	14/12/2024	22:33	500.00	3500.00	253.00	0.00	1460.00	10250.00	213.00	200.00	3000.00	712.55	807.45	797.45	10.00	1	8540205	8540205	0.00	0.00980
59	08/09/2025	11:41	09/09/2025	11:39	100.00	1000.00	100.00	5000.00	270.00	10000.00	40.00	270.00	6000.00	125.55	134.45	118.85	0.00	1	8540205	8540205	15.60	0.01000
58	04/09/2025	15:19	06/09/2025	18:54	500.00	1000.00	38.00	2000.00	454.00	110000.00	0.00	916.00	109000.00	701.25	-177.25	-177.25	0.00	1	123456	123456	0.00	0.00100
35	12/11/2024	18:27	12/11/2024	19:59	100.00	1000.00	154.00	1550.00	685.00	15000.00	0.00	631.00	14450.00	80.00	462.00	555.65	0.00	1	8540205	8540205	7.15	0.00080
36	12/11/2024	19:59	12/11/2024	19:59	200.00	2000.00	0.00	0.00	0.00	0.00	0.00	200.00	2000.00	0.00	0.00	201.60	0.00	1	8540205	8540205	0.00	0.00080
54	12/02/2025	19:24	12/02/2025	22:06	100.00	1000.00	0.00	0.00	20.00	0.00	0.00	120.00	1000.00	8.20	11.80	120.80	0.00	1	8540205	8540205	0.00	0.00900
46	12/12/2024	19:49	12/12/2024	23:26	1000.00	2500.00	239.00	1200.00	2985.00	14000.00	280.00	200.00	0.00	1289.25	1864.75	1819.42	1.00	1	8540205	8540205	44.33	0.01000
56	02/05/2025	11:00	27/05/2025	23:18	100.00	0.00	212.00	750.00	670.00	30000.00	210.00	558.00	29250.00	442.00	490.00	490.00	0.00	1	8540205	8540205	29.90	0.00900
44	10/12/2024	18:21	11/12/2024	10:27	300.00	10000.00	4.00	400.00	532.00	8000.00	0.00	828.00	17600.00	3.00	601.00	601.00	0.00	1	8540205	8540205	0.00	0.01000
37	12/11/2024	19:59	25/11/2024	23:54	100.00	1500.00	118.00	0.00	505.00	0.00	0.00	487.00	1500.00	45.00	342.00	452.05	0.00	1	8540205	8540205	0.00	0.00670
41	09/12/2024	20:25	09/12/2024	22:07	300.00	5000.00	420.00	3800.00	3073.00	53000.00	100.00	100.00	4000.00	1374.35	1870.65	1857.91	0.00	1	8540205	8540205	12.74	0.01000
40	05/12/2024	20:26	09/12/2024	20:19	100.00	0.00	333.00	2000.00	1966.00	242000.00	123.00	1733.00	240000.00	856.75	1139.25	1238.25	1.00	1	8540205	8540205	0.00	0.00100
50	16/12/2024	07:39	29/12/2024	14:49	200.00	5000.00	161.00	7600.00	2285.00	104800.00	925.00	2324.00	102200.00	1771.57	2249.43	2276.73	0.00	1	8540205	8540205	27.30	0.01000
51	15/01/2025	13:57	08/02/2025	08:59	100.00	1000.00	0.00	0.00	0.00	0.00	0.00	100.00	1000.00	0.00	0.00	0.00	0.00	1	8540205	8540205	0.00	0.00800
47	13/12/2024	10:17	13/12/2024	23:22	200.00	5000.00	368.00	700.00	20923.00	1047000.00	145.00	20755.00	1051300.00	21505.00	9658.00	8320.50	5.00	1	8540205	8540205	1332.50	0.01000
45	11/12/2024	10:27	12/12/2024	19:48	100.00	1000.00	353.00	500.00	4477.00	32000.00	0.00	1000.00	2500.00	1745.60	2693.40	2693.40	0.00	1	8540205	8540205	0.00	0.01000
\.


--
-- TOC entry 3485 (class 0 OID 57985)
-- Dependencies: 233
-- Data for Name: caja_ajuste; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.caja_ajuste (cod_ajuste, fecha, hora, bs_saldo_pre, ps_saldo_pre, bs_ajuste, ps_ajuste, bs_saldo, ps_saldo, tipo, descripcion, ci_usuario, cod_caja) FROM stdin;
24	09/10/2024	23:03	281.00	1000.00	100.00	1500.00	381.00	2500.00	1	Se ingreso saldo para aumentar el cambio en la caja	8540205	34
25	09/10/2024	23:03	381.00	2500.00	100.00	0.00	281.00	2500.00	2	Se saco 100 bs de caja para pagar unos servicios del local	8540205	34
26	12/11/2024	18:29	191.00	1000.00	0.00	1550.00	191.00	2550.00	1	Ajuste de caja por falta de cambio para completar la venta	8540205	35
27	27/11/2024	17:43	285.00	0.00	100.00	1000.00	385.00	1000.00	1	ajuste de caja	8540205	38
28	05/12/2024	20:18	500.00	\N	0.00	2000.00	500.00	2000.00	1	Entrada de pesos Argentinos	8540205	39
29	09/12/2024	14:38	360.00	0.00	0.00	1000.00	360.00	1000.00	1	Ajuste de caja por falta de cambio para completar la venta	8540205	40
30	09/12/2024	21:50	2953.00	54200.00	2853.00	50200.00	100.00	4000.00	2	Cierre de caja y retire de dinero	8540205	41
31	10/12/2024	18:25	700.00	10000.00	500.00	5000.00	200.00	5000.00	2	Cierre de caja y salida de saldo Bs y Ps	8540205	44
32	12/12/2024	19:47	4224.00	32500.00	3224.00	30000.00	1000.00	2500.00	2	Salida de dinero por caja llena	8540205	45
33	12/12/2024	23:19	3746.00	15300.00	3546.00	15300.00	200.00	0.00	2	Retiro por cierre de caja	8540205	46
34	14/12/2024	22:33	1707.00	13750.00	1507.00	10750.00	200.00	3000.00	2	Retiro de dinero por cierre de caja	8540205	48
35	15/12/2024	23:30	1290.00	15800.00	1090.00	10800.00	2380.00	26600.00	1	Retiro de dinero por cierre de caja	8540205	49
36	15/12/2024	23:32	2380.00	26600.00	2180.00	21600.00	200.00	5000.00	2	El ultimo ajuste se cometio en error ya que era salida en vez de entrada 	8540205	49
37	16/12/2024	10:38	2304.00	100200.00	2004.00	90200.00	300.00	10000.00	2	Salida de dinero por caja llena	8540205	50
38	04/09/2025	15:24	580.00	1000.00	0.00	2000.00	580.00	3000.00	1	Ajuste de caja por falta de cambio para completar la venta	123456	58
39	09/09/2025	11:06	270.00	1000.00	0.00	5000.00	270.00	6000.00	1	Ajuste de caja por falta de cambio para completar la venta	8540205	59
40	09/09/2025	11:26	270.00	6000.00	500.00	7000.00	770.00	13000.00	1	Aporte de caja para disponibilidad de cambio	8540205	59
41	15/09/2025	17:55	1792.00	51100.00	100.00	40000.00	1692.00	11100.00	2	Salida de efectivo por acumulación de caja	8540205	62
42	15/09/2025	17:57	1692.00	11100.00	1000.00	3100.00	692.00	8000.00	2	Salida de efectivo por acumulación de caja	8540205	62
43	15/09/2025	18:19	692.00	8000.00	30.00	0.00	662.00	8000.00	2	Para compra de Bolsas plásticas	8540205	62
\.


--
-- TOC entry 3467 (class 0 OID 32878)
-- Dependencies: 215
-- Data for Name: categoria; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.categoria (cod_categoria, nombre) FROM stdin;
1	Pollo
2	Bebidas
3	Guarniciones
4	Hamburguesas
5	Lomitos
6	Cocteles
7	Vinos
8	Postres
9	Asados
\.


--
-- TOC entry 3466 (class 0 OID 32833)
-- Dependencies: 214
-- Data for Name: cliente; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.cliente (cod_cliente, nombre, documento, correo, celular, estado, identificacion) FROM stdin;
2	Fabrizio Jordan	1	fabrizioariasmarca@gmail.com	67940579	0	8540205
3	S/N	5		\N	0	99002
4	Natalia Torrez	2	nataliatorres123@gmail.com	67985214	0	781456
5	Isabel Lopez	1	isabellopez@gmail.com	67425687	0	954878
8	Abel Aguilar	2	abelaguilar@gmail.com	68147895	0	4889961
9	Liliana Ortiz	1	lilianaortiz879@gmail.com	75895421	0	54478912
11	Arturo Mercedes	1	arturomercedes@gmail.com	78945321	0	564984
12	Maria Vidaurre	2	mariavidaurre@gmail.com	78948588	0	4889952236
13	Jose Camacho	2	josecamacho@gmail.com	67894588	0	12244898
14	Shirley Ojeda	1	shirleyojeda@gmail.com	68548911	0	48895655
15	Diego Aguilar	2	diegoaguilar@gmail.com	68855155	0	155668499
16	Raul Mamani	1	raulmamani@gmail.com	64985215	0	457891
17	Benjamin Rodrigues	1	benjaminrodri@gmail.com	77445684	0	658912
18	Leonel Reyes	2	leonelreyes@gmail.com	64589763	0	655884568
19	Gimena Ortega	1	gimenaortega@gmail.com	76458895	0	695841
20	Evelin Silvestre	2	evelinsilvestre@gmail.com	68954561	0	488612045
21	Mariana Daza	1	marianadaza@gmail.com	77859941	0	7548566
22	Natalia Ajalla	2	nataliaajalla@gmail.com	67950584	0	655481235
23	Nicol Benites	1	nicolbenites@gmail.com	71123509	0	1222654
6	Silvana Quispe	1	silvanaquispe@gmail.com	67940168	0	12548984534
7	Maria Camacho	1	mariacamacho@gmail.com	71243522	0	7845686
24	Franco Condori	1	francocondori@gmail.com	65480589	0	1223548
25	Abigail Quispe	1	abigailquispe@gmail.com	64895222	0	78945589
26	Lucas Aguirre	2	lucasaguirre@gmail.com	67474842	0	21654654
27	Lucero Torrez	1	lucerotorrez@gmail.com	68194824	0	5489421
28	Marcelo Catari	2	marcelocatari@gmail.com	68484941	0	9469845
29	Moises Choque	2	moiseschoque@gmail.com	78455619	0	68489498
30	Marco Soruco	1	marcosoruco@gmail.com	68415433	0	68498498
31	Carlos llanos	1	carlosllanos@gmail.com	69554122	0	5558941
32	Matias	1	matias@gmai.com	6754333	0	22433
\.


--
-- TOC entry 3471 (class 0 OID 32954)
-- Dependencies: 219
-- Data for Name: complemento; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.complemento (cod_complemento, nombre, descripcion, estado) FROM stdin;
2	Presas 1/4	Presas 1/4 de pollo	0
1	Guarnición	Guarnicion de pollo	0
3	Presas Simple	Presas porción simple	0
4	Guarción Entero	Guarnición para el pollo Entero	0
5	Guarnición 1/2 Pollo	Guarnición Medio Pollo	0
6	Guarniciones Asado	Guarniciones Asado	0
7	Acompañamiento hamburguesa	Acompañamiento hamburguesa	0
\.


--
-- TOC entry 3480 (class 0 OID 57859)
-- Dependencies: 228
-- Data for Name: complemento_opcion; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.complemento_opcion (cod_complemento, cod_opcion) FROM stdin;
2	4
2	5
1	1
1	2
1	8
3	7
3	6
6	9
6	10
7	11
7	12
\.


--
-- TOC entry 3476 (class 0 OID 33152)
-- Dependencies: 224
-- Data for Name: detalle_movimiento_insumo; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.detalle_movimiento_insumo (lote, cod_mov, cod_insumo, precio, precio_unidad, cantidad, existencia, cantidad_nueva, cod_detalle_insumo) FROM stdin;
3	3	3	3000.00	10.00	300.00	8.60	300.00	3
2	41	2	5.00	\N	0.50	48.80	48.80	48
26	26	26	1200.00	12.00	100.00	8.00	100.00	26
21	41	21	4.00	\N	1.00	99.00	99.00	49
1	47	1	3.00	\N	0.20	94.00	94.00	68
1	42	1	11.25	\N	0.75	96.95	96.95	50
3	50	3	13.00	\N	1.30	286.00	286.00	80
3	42	3	15.00	\N	1.50	294.20	294.20	51
1	1	1	1500.00	15.00	100.00	5.75	100.00	1
25	42	25	15.00	\N	1.00	99.00	99.00	52
2	47	2	2.00	\N	0.20	47.20	47.20	69
1	43	1	12.00	\N	0.80	96.15	96.15	53
11	11	11	800.00	8.00	100.00	34.00	100.00	11
3	43	3	18.00	\N	1.80	292.40	292.40	54
3	47	3	3.00	\N	0.30	288.80	288.80	70
2	43	2	2.00	\N	0.20	48.60	48.60	55
24	24	24	1200.00	12.00	100.00	-1.00	100.00	24
31	43	31	15.00	\N	1.00	99.00	99.00	56
2	50	2	2.00	\N	0.20	46.50	46.50	81
32	32	32	1000.00	20.00	50.00	12.00	50.00	32
1	52	1	6.00	\N	0.40	91.50	91.50	86
1	54	1	6.75	\N	0.45	90.05	90.05	95
4	4	4	200.00	2.00	100.00	24.00	100.00	4
15	15	15	800.00	8.00	100.00	43.00	100.00	15
17	17	17	900.00	9.00	100.00	6.00	100.00	17
5	5	5	400.00	4.00	100.00	11.00	100.00	5
8	8	8	200.00	2.00	100.00	22.00	100.00	8
13	13	13	200.00	2.00	100.00	26.00	100.00	13
30	30	30	1100.00	11.00	100.00	30.00	100.00	30
4	47	4	2.00	\N	1.00	99.00	99.00	71
1	44	1	15.00	\N	1.00	95.15	95.15	57
1	53	1	15.00	\N	1.00	90.50	90.50	90
29	29	29	1800.00	18.00	100.00	9.00	100.00	29
7	50	7	10.00	\N	1.00	99.00	99.00	82
1	48	1	11.25	\N	0.75	93.25	93.25	72
21	21	21	400.00	4.00	100.00	11.00	100.00	21
9	9	9	400.00	4.00	100.00	8.00	100.00	9
3	52	3	8.00	\N	0.80	284.20	284.20	87
27	27	27	1200.00	12.00	100.00	4.00	100.00	27
2	48	2	5.00	\N	0.50	46.70	46.70	73
33	33	33	990.00	19.80	50.00	15.00	50.00	33
1	51	1	7.50	\N	0.50	91.90	91.90	83
2	2	2	500.00	10.00	50.00	3.40	50.00	2
3	48	3	10.00	\N	1.00	287.80	287.80	74
2	54	2	5.00	\N	0.50	45.30	45.30	96
37	37	35	540.00	18.00	30.00	-8.00	30.00	35
20	20	20	200.00	2.00	100.00	28.00	100.00	20
10	10	10	1000.00	10.00	100.00	8.00	100.00	10
3	44	3	5.00	\N	0.50	291.90	291.90	58
28	28	28	1200.00	12.00	100.00	4.00	100.00	28
29	44	29	18.00	\N	1.00	99.00	99.00	59
16	16	16	1000.00	10.00	100.00	15.00	100.00	16
2	44	2	5.00	\N	0.50	48.10	48.10	60
2	53	2	5.00	\N	0.50	45.80	45.80	91
31	31	31	1500.00	15.00	100.00	-3.00	100.00	31
1	45	1	14.25	\N	0.95	94.20	94.20	61
22	22	22	800.00	8.00	100.00	39.00	100.00	22
24	48	24	12.00	\N	1.00	99.00	99.00	75
1	38	1	6.00	\N	0.40	99.60	99.60	36
3	45	3	18.00	\N	1.80	290.10	290.10	62
3	38	3	8.00	\N	0.80	299.20	299.20	37
6	6	6	800.00	8.00	100.00	47.00	100.00	6
2	38	2	2.00	\N	0.20	49.80	49.80	38
34	34	34	400.00	10.00	40.00	4.00	40.00	34
6	38	6	8.00	\N	1.00	99.00	99.00	39
17	45	17	9.00	\N	1.00	99.00	99.00	63
1	39	1	9.75	\N	0.65	98.95	98.95	40
18	18	18	900.00	9.00	100.00	3.00	100.00	18
2	39	2	5.00	\N	0.50	49.30	49.30	41
1	49	1	3.75	\N	0.25	93.00	93.00	76
3	39	3	10.00	\N	1.00	298.20	298.20	42
25	25	25	1500.00	15.00	100.00	8.00	100.00	25
18	39	18	9.00	\N	1.00	99.00	99.00	43
2	52	2	2.00	\N	0.20	46.30	46.30	88
1	40	1	12.00	\N	0.80	98.15	98.15	44
3	49	3	5.00	\N	0.50	287.30	287.30	77
3	40	3	20.00	\N	2.00	296.20	296.20	45
23	23	23	1000.00	10.00	100.00	9.00	100.00	23
1	41	1	6.75	\N	0.45	97.70	97.70	46
5	49	5	4.00	\N	1.00	99.00	99.00	78
3	41	3	5.00	\N	0.50	295.70	295.70	47
2	45	2	2.00	\N	0.20	47.90	47.90	64
1	50	1	9.00	\N	0.60	92.40	92.40	79
3	51	3	10.00	\N	1.00	285.00	285.00	84
3	46	3	10.00	\N	1.00	289.10	289.10	65
2	46	2	5.00	\N	0.50	47.40	47.40	66
27	46	27	12.00	\N	1.00	99.00	99.00	67
8	51	8	4.00	\N	2.00	98.00	98.00	85
19	52	19	9.00	\N	1.00	99.00	99.00	89
3	53	3	15.00	\N	1.50	282.70	282.70	92
32	53	32	20.00	\N	1.00	49.00	49.00	93
26	53	26	12.00	\N	1.00	99.00	99.00	94
3	54	3	5.00	\N	0.50	282.20	282.20	97
14	54	14	2.00	\N	1.00	99.00	99.00	98
2	56	2	2.00	\N	0.20	45.10	45.10	99
3	56	3	3.00	\N	0.30	281.90	281.90	100
16	56	16	10.00	\N	1.00	99.00	99.00	101
1	57	1	12.00	\N	0.80	89.25	89.25	102
3	57	3	20.00	\N	2.00	279.90	279.90	103
37	57	35	36.00	\N	2.00	28.00	28.00	104
7	57	7	10.00	\N	1.00	98.00	98.00	105
1	58	1	19.50	\N	1.30	87.95	87.95	106
3	58	3	28.00	\N	2.80	277.10	277.10	107
2	58	2	2.00	\N	0.20	44.90	44.90	108
29	58	29	18.00	\N	1.00	98.00	98.00	109
1	59	1	30.00	\N	2.00	85.95	85.95	110
3	59	3	35.00	\N	3.50	273.60	273.60	111
2	59	2	10.00	\N	1.00	43.90	43.90	112
18	59	18	18.00	\N	2.00	97.00	97.00	113
23	59	23	10.00	\N	1.00	99.00	99.00	114
1	60	1	9.00	\N	0.60	85.35	85.35	115
3	60	3	11.00	\N	1.10	272.50	272.50	116
2	60	2	4.00	\N	0.40	43.50	43.50	117
34	60	34	30.00	\N	3.00	37.00	37.00	118
1	61	1	9.00	\N	0.60	84.75	84.75	119
2	61	2	5.00	\N	0.50	43.00	43.00	120
3	61	3	10.00	\N	1.00	271.50	271.50	121
30	61	30	11.00	\N	1.00	99.00	99.00	122
1	62	1	7.50	\N	0.50	84.25	84.25	123
3	62	3	10.00	\N	1.00	270.50	270.50	124
4	62	4	2.00	\N	1.00	98.00	98.00	125
8	62	8	2.00	\N	1.00	97.00	97.00	126
1	64	1	12.00	\N	0.80	83.45	83.45	127
2	64	2	5.00	\N	0.50	42.50	42.50	128
3	64	3	15.00	\N	1.50	269.00	269.00	129
33	64	33	39.60	\N	2.00	48.00	48.00	130
26	64	26	12.00	\N	1.00	98.00	98.00	131
1	65	1	6.00	\N	0.40	83.05	83.05	132
3	65	3	8.00	\N	0.80	268.20	268.20	133
2	65	2	2.00	\N	0.20	42.30	42.30	134
10	65	10	10.00	\N	1.00	99.00	99.00	135
1	66	1	11.25	\N	0.75	82.30	82.30	136
3	66	3	11.00	\N	1.10	267.10	267.10	137
2	66	2	4.00	\N	0.40	41.90	41.90	138
11	66	11	8.00	\N	1.00	99.00	99.00	139
13	66	13	2.00	\N	1.00	99.00	99.00	140
1	67	1	9.00	\N	0.60	81.70	81.70	141
3	67	3	13.00	\N	1.30	265.80	265.80	142
2	67	2	2.00	\N	0.20	41.70	41.70	143
28	67	28	12.00	\N	1.00	99.00	99.00	144
1	68	1	12.00	\N	0.80	80.90	80.90	145
3	68	3	20.00	\N	2.00	263.80	263.80	146
15	68	15	8.00	\N	1.00	99.00	99.00	147
1	69	1	7.50	\N	0.50	80.40	80.40	148
3	69	3	10.00	\N	1.00	262.80	262.80	149
22	69	22	8.00	\N	1.00	99.00	99.00	150
1	70	1	18.00	\N	1.20	79.20	79.20	151
3	70	3	8.00	\N	0.80	262.00	262.00	152
31	70	31	15.00	\N	1.00	98.00	98.00	153
6	70	6	8.00	\N	1.00	98.00	98.00	154
2	70	2	2.00	\N	0.20	41.50	41.50	155
1	71	1	18.75	\N	1.25	77.95	77.95	156
3	71	3	21.00	\N	2.10	259.90	259.90	157
2	71	2	4.00	\N	0.40	41.10	41.10	158
25	71	25	15.00	\N	1.00	98.00	98.00	159
1	72	1	9.00	\N	0.60	77.35	77.35	160
3	72	3	15.00	\N	1.50	258.40	258.40	161
32	72	32	20.00	\N	1.00	48.00	48.00	162
1	73	1	13.50	\N	0.90	76.45	76.45	163
2	73	2	5.00	\N	0.50	40.60	40.60	164
3	73	3	15.00	\N	1.50	256.90	256.90	165
5	73	5	4.00	\N	1.00	98.00	98.00	166
14	73	14	2.00	\N	1.00	98.00	98.00	167
1	74	1	9.75	\N	0.65	75.80	75.80	168
3	74	3	15.00	\N	1.50	255.40	255.40	169
18	74	18	9.00	\N	1.00	96.00	96.00	170
1	75	1	15.00	\N	1.00	74.80	74.80	171
3	75	3	18.00	\N	1.80	253.60	253.60	172
2	75	2	2.00	\N	0.20	40.40	40.40	173
17	75	17	9.00	\N	1.00	98.00	98.00	174
1	76	1	6.00	\N	0.40	74.40	74.40	175
3	76	3	10.00	\N	1.00	252.60	252.60	176
5	76	5	4.00	\N	1.00	97.00	97.00	177
1	77	1	9.00	\N	0.60	73.80	73.80	178
3	77	3	20.00	\N	2.00	250.60	250.60	179
28	77	28	12.00	\N	1.00	98.00	98.00	180
1	78	1	17.25	\N	1.15	72.65	72.65	181
2	78	2	5.00	\N	0.50	39.90	39.90	182
3	78	3	20.00	\N	2.00	248.60	248.60	183
23	78	23	10.00	\N	1.00	98.00	98.00	184
1	79	1	12.00	\N	0.80	71.85	71.85	185
3	79	3	20.00	\N	2.00	246.60	246.60	186
24	79	24	12.00	\N	1.00	98.00	98.00	187
1	80	1	14.25	\N	0.95	70.90	70.90	188
3	80	3	18.00	\N	1.80	244.80	244.80	189
2	80	2	2.00	\N	0.20	39.70	39.70	190
19	80	19	9.00	\N	1.00	98.00	98.00	191
1	81	1	11.25	\N	0.75	70.15	70.15	192
3	81	3	13.00	\N	1.30	243.50	243.50	193
2	81	2	2.00	\N	0.20	39.50	39.50	194
30	81	30	11.00	\N	1.00	98.00	98.00	195
1	82	1	11.25	\N	0.75	69.40	69.40	196
3	82	3	15.00	\N	1.50	242.00	242.00	197
18	82	18	9.00	\N	1.00	95.00	95.00	198
1	83	1	7.50	\N	0.50	68.90	68.90	199
2	83	2	4.00	\N	0.40	39.10	39.10	200
3	83	3	6.00	\N	0.60	241.40	241.40	201
5	83	5	4.00	\N	1.00	96.00	96.00	202
1	84	1	18.00	\N	1.20	67.70	67.70	203
3	84	3	30.00	\N	3.00	238.40	238.40	204
1	85	1	9.00	\N	0.60	67.10	67.10	205
2	85	2	5.00	\N	0.50	38.60	38.60	206
3	85	3	10.00	\N	1.00	237.40	237.40	207
18	85	18	9.00	\N	1.00	94.00	94.00	208
1	86	1	15.00	\N	1.00	66.10	66.10	209
3	86	3	23.00	\N	2.30	235.10	235.10	210
2	86	2	2.00	\N	0.20	38.40	38.40	211
1	87	1	11.25	\N	0.75	65.35	65.35	212
3	87	3	15.00	\N	1.50	233.60	233.60	213
29	87	29	18.00	\N	1.00	97.00	97.00	214
1	88	1	9.00	\N	0.60	64.75	64.75	215
3	88	3	11.00	\N	1.10	232.50	232.50	216
2	88	2	4.00	\N	0.40	38.00	38.00	217
26	88	26	12.00	\N	1.00	97.00	97.00	218
1	89	1	15.00	\N	1.00	63.75	63.75	219
2	89	2	7.00	\N	0.70	37.30	37.30	220
3	89	3	13.00	\N	1.30	231.20	231.20	221
10	89	10	10.00	\N	1.00	98.00	98.00	222
1	90	1	12.00	\N	0.80	62.95	62.95	223
3	90	3	16.00	\N	1.60	229.60	229.60	224
2	90	2	4.00	\N	0.40	36.90	36.90	225
27	90	27	12.00	\N	1.00	98.00	98.00	226
1	91	1	15.00	\N	1.00	61.95	61.95	227
3	91	3	10.00	\N	1.00	228.60	228.60	228
29	91	29	18.00	\N	1.00	96.00	96.00	229
2	91	2	15.00	\N	1.50	35.40	35.40	230
1	92	1	11.25	\N	0.75	61.20	61.20	231
3	92	3	13.00	\N	1.30	227.30	227.30	232
2	92	2	2.00	\N	0.20	35.20	35.20	233
27	92	27	12.00	\N	1.00	97.00	97.00	234
1	93	1	16.50	\N	1.10	60.10	60.10	235
3	93	3	21.00	\N	2.10	225.20	225.20	236
2	93	2	4.00	\N	0.40	34.80	34.80	237
28	93	28	12.00	\N	1.00	97.00	97.00	238
1	94	1	9.00	\N	0.60	59.50	59.50	239
3	94	3	11.00	\N	1.10	224.10	224.10	240
2	94	2	4.00	\N	0.40	34.40	34.40	241
14	94	14	2.00	\N	1.00	97.00	97.00	242
1	95	1	12.00	\N	0.80	58.70	58.70	243
2	95	2	5.00	\N	0.50	33.90	33.90	244
3	95	3	10.00	\N	1.00	223.10	223.10	245
24	95	24	12.00	\N	1.00	97.00	97.00	246
1	96	1	60.00	\N	4.00	54.70	54.70	247
1	97	1	7.50	\N	0.50	54.20	54.20	248
3	97	3	10.00	\N	1.00	222.10	222.10	249
21	97	21	4.00	\N	1.00	98.00	98.00	250
1	98	1	10.50	\N	0.70	53.50	53.50	251
2	98	2	6.00	\N	0.60	33.30	33.30	252
3	98	3	9.00	\N	0.90	221.20	221.20	253
8	98	8	4.00	\N	2.00	95.00	95.00	254
1	100	1	6.00	\N	0.40	53.10	53.10	256
3	100	3	8.00	\N	0.80	220.40	220.40	257
2	100	2	2.00	\N	0.20	33.10	33.10	258
1	109	1	75.00	\N	5.00	47.90	47.90	265
3	109	3	115.00	\N	11.50	208.90	208.90	266
39	103	36	5.00	5.00	1.00	-1.00	1.00	261
1	101	1	3.00	\N	0.20	52.90	52.90	260
39	104	36	10.00	\N	2.00	-1.00	-1.00	262
2	109	2	10.00	\N	1.00	32.10	32.10	267
18	109	18	9.00	\N	1.00	93.00	93.00	268
17	109	17	9.00	\N	1.00	97.00	97.00	269
19	109	19	9.00	\N	1.00	97.00	97.00	270
7	109	7	10.00	\N	1.00	97.00	97.00	271
42	107	36	60.00	6.00	10.00	8.00	9.00	263
42	108	36	12.00	0.00	2.00	8.00	7.00	264
1	110	1	30.00	\N	2.00	45.90	45.90	272
3	110	3	40.00	\N	4.00	204.90	204.90	273
14	14	14	200.00	2.00	100.00	5.00	100.00	14
7	110	7	20.00	\N	2.00	95.00	95.00	274
32	110	32	60.00	\N	3.00	45.00	45.00	275
1	111	1	9.00	\N	0.60	45.30	45.30	276
3	111	3	11.00	\N	1.10	203.80	203.80	277
2	111	2	4.00	\N	0.40	31.70	31.70	278
24	111	24	12.00	\N	1.00	96.00	96.00	279
1	112	1	37.50	\N	2.50	42.80	42.80	280
3	112	3	50.00	\N	5.00	198.80	198.80	281
29	113	29	18.00	\N	1.00	95.00	95.00	282
25	113	25	15.00	\N	1.00	97.00	97.00	283
1	114	1	9.00	\N	0.60	42.20	42.20	284
3	114	3	15.00	\N	1.50	197.30	197.30	285
26	114	26	12.00	\N	1.00	96.00	96.00	286
1	115	1	15.00	\N	1.00	41.20	41.20	287
3	115	3	16.00	\N	1.60	195.70	195.70	288
2	115	2	4.00	\N	0.40	31.30	31.30	289
1	116	1	9.00	\N	0.60	40.60	40.60	290
3	116	3	11.00	\N	1.10	194.60	194.60	291
2	116	2	4.00	\N	0.40	30.90	30.90	292
7	7	7	1000.00	10.00	100.00	8.00	100.00	7
19	116	19	9.00	\N	1.00	96.00	96.00	293
1	117	1	23.25	\N	1.55	39.05	39.05	294
3	117	3	31.00	\N	3.10	191.50	191.50	295
2	117	2	4.00	\N	0.40	30.50	30.50	296
1	118	1	30.00	\N	2.00	37.05	37.05	297
3	118	3	8.00	\N	0.80	190.70	190.70	298
2	118	2	2.00	\N	0.20	30.30	30.30	299
32	118	32	20.00	\N	1.00	44.00	44.00	300
33	118	33	39.60	\N	2.00	46.00	46.00	301
7	118	7	10.00	\N	1.00	94.00	94.00	302
1	119	1	26.25	\N	1.75	35.30	35.30	303
2	119	2	16.00	\N	1.60	28.70	28.70	304
3	119	3	24.00	\N	2.40	188.30	188.30	305
25	119	25	15.00	\N	1.00	96.00	96.00	306
1	120	1	9.00	\N	0.60	34.70	34.70	307
3	120	3	13.00	\N	1.30	187.00	187.00	308
2	120	2	2.00	\N	0.20	28.50	28.50	309
30	120	30	22.00	\N	2.00	96.00	96.00	310
1	121	1	15.00	\N	1.00	33.70	33.70	311
3	121	3	25.00	\N	2.50	184.50	184.50	312
31	121	31	30.00	\N	2.00	96.00	96.00	313
1	122	1	21.00	\N	1.40	32.30	32.30	314
3	122	3	28.00	\N	2.80	181.70	181.70	315
2	122	2	2.00	\N	0.20	28.30	28.30	316
16	122	16	10.00	\N	1.00	98.00	98.00	317
1	123	1	30.00	\N	2.00	30.30	30.30	318
3	123	3	10.00	\N	1.00	180.70	180.70	319
24	123	24	12.00	\N	1.00	95.00	95.00	320
29	123	29	18.00	\N	1.00	94.00	94.00	321
1	124	1	37.50	\N	2.50	27.80	27.80	322
2	124	2	15.00	\N	1.50	26.80	26.80	323
3	124	3	35.00	\N	3.50	177.20	177.20	324
1	125	1	9.00	\N	0.60	27.20	27.20	325
2	125	2	5.00	\N	0.50	26.30	26.30	326
3	125	3	5.00	\N	0.50	176.70	176.70	327
26	125	26	12.00	\N	1.00	95.00	95.00	328
1	126	1	17.25	\N	1.15	26.05	26.05	329
3	126	3	16.00	\N	1.60	175.10	175.10	330
2	126	2	9.00	\N	0.90	25.40	25.40	331
18	126	18	9.00	\N	1.00	92.00	92.00	332
3	127	3	8.00	\N	0.80	174.30	174.30	333
2	127	2	12.00	\N	1.20	24.20	24.20	334
29	127	29	18.00	\N	1.00	93.00	93.00	335
23	127	23	10.00	\N	1.00	97.00	97.00	336
1	128	1	18.75	\N	1.25	24.80	24.80	337
3	128	3	21.00	\N	2.10	172.20	172.20	338
2	128	2	4.00	\N	0.40	23.80	23.80	339
31	128	31	30.00	\N	2.00	94.00	94.00	340
1	129	1	11.25	\N	0.75	24.05	24.05	341
3	129	3	15.00	\N	1.50	170.70	170.70	342
25	129	25	15.00	\N	1.00	95.00	95.00	343
1	130	1	11.25	\N	0.75	23.30	23.30	344
3	130	3	15.00	\N	1.50	169.20	169.20	345
26	130	26	12.00	\N	1.00	94.00	94.00	346
1	131	1	16.50	\N	1.10	22.20	22.20	347
3	131	3	23.00	\N	2.30	166.90	166.90	348
2	131	2	2.00	\N	0.20	23.60	23.60	349
27	131	27	12.00	\N	1.00	96.00	96.00	350
30	131	30	11.00	\N	1.00	95.00	95.00	351
1	132	1	7.50	\N	0.50	21.70	21.70	352
2	132	2	5.00	\N	0.50	23.10	23.10	353
3	132	3	5.00	\N	0.50	166.40	166.40	354
11	132	11	8.00	\N	1.00	98.00	98.00	355
1	133	1	9.00	\N	0.60	21.10	21.10	356
3	133	3	13.00	\N	1.30	165.10	165.10	357
2	133	2	2.00	\N	0.20	22.90	22.90	358
17	133	17	9.00	\N	1.00	96.00	96.00	359
1	134	1	18.00	\N	1.20	19.90	19.90	360
3	134	3	26.00	\N	2.60	162.50	162.50	361
2	134	2	4.00	\N	0.40	22.50	22.50	362
18	134	18	9.00	\N	1.00	91.00	91.00	363
17	134	17	9.00	\N	1.00	95.00	95.00	364
1	135	1	15.00	\N	1.00	18.90	18.90	365
3	135	3	5.00	\N	0.50	162.00	162.00	366
24	135	24	12.00	\N	1.00	94.00	94.00	367
1	136	1	45.00	\N	3.00	15.90	15.90	368
3	136	3	63.00	\N	6.30	155.70	155.70	369
2	136	2	12.00	\N	1.20	21.30	21.30	370
31	136	31	45.00	\N	3.00	91.00	91.00	371
17	136	17	18.00	\N	2.00	93.00	93.00	372
1	137	1	14.25	\N	0.95	14.95	14.95	373
3	137	3	20.00	\N	2.00	153.70	153.70	374
19	137	19	9.00	\N	1.00	95.00	95.00	375
1	138	1	15.75	\N	1.05	13.90	13.90	376
2	138	2	8.00	\N	0.80	20.50	20.50	377
3	138	3	17.00	\N	1.70	152.00	152.00	378
25	138	25	15.00	\N	1.00	94.00	94.00	379
1	139	1	9.00	\N	0.60	13.30	13.30	380
3	139	3	13.00	\N	1.30	150.70	150.70	381
2	139	2	2.00	\N	0.20	20.30	20.30	382
15	139	15	8.00	\N	1.00	98.00	98.00	383
1	140	1	18.75	\N	1.25	12.05	12.05	384
3	140	3	25.00	\N	2.50	148.20	148.20	385
32	140	32	20.00	\N	1.00	43.00	43.00	386
33	140	33	19.80	\N	1.00	45.00	45.00	387
1	141	1	15.00	\N	1.00	11.05	11.05	388
3	141	3	20.00	\N	2.00	146.20	146.20	389
11	141	11	8.00	\N	1.00	97.00	97.00	390
6	141	6	8.00	\N	1.00	97.00	97.00	391
1	142	1	13.50	\N	0.90	10.15	10.15	392
3	142	3	18.00	\N	1.80	144.40	144.40	393
2	142	2	2.00	\N	0.20	20.10	20.10	394
27	142	27	12.00	\N	1.00	95.00	95.00	395
1	143	1	60.00	\N	4.00	6.15	6.15	396
3	143	3	34.00	\N	3.40	141.00	141.00	397
2	143	2	6.00	\N	0.60	19.50	19.50	398
18	143	18	18.00	\N	2.00	89.00	89.00	399
17	143	17	9.00	\N	1.00	92.00	92.00	400
1	144	1	6.00	\N	0.40	5.75	5.75	401
3	144	3	10.00	\N	1.00	140.00	140.00	402
4	144	4	4.00	\N	2.00	96.00	96.00	403
3	166	3	10.00	\N	1.00	110.50	110.50	478
43	146	1	20.00	\N	1.25	8.75	14.50	405
2	146	2	25.00	\N	2.50	17.00	17.00	406
3	146	3	25.00	\N	2.50	137.50	137.50	407
23	146	23	10.00	\N	1.00	96.00	96.00	408
44	163	1	8.00	\N	0.50	18.35	20.55	465
43	147	1	41.60	\N	2.60	6.15	11.90	409
3	147	3	52.00	\N	5.20	132.30	132.30	410
2	147	2	8.00	\N	0.80	16.20	16.20	411
29	147	29	18.00	\N	1.00	92.00	92.00	412
2	163	2	4.00	\N	0.40	10.60	10.60	466
43	148	1	16.00	\N	1.00	5.15	10.90	413
2	148	2	5.00	\N	0.50	15.70	15.70	414
3	148	3	15.00	\N	1.50	130.80	130.80	415
25	148	25	15.00	\N	1.00	93.00	93.00	416
3	163	3	6.00	\N	0.60	115.40	115.40	467
43	149	1	21.60	\N	1.35	3.80	9.55	417
3	149	3	24.00	\N	2.40	128.40	128.40	418
2	149	2	6.00	\N	0.60	15.10	15.10	419
31	149	31	15.00	\N	1.00	90.00	90.00	420
30	149	30	11.00	\N	1.00	94.00	94.00	421
22	163	22	8.00	\N	1.00	97.00	97.00	468
43	150	1	12.80	\N	0.80	3.00	8.75	422
3	150	3	14.00	\N	1.40	127.00	127.00	423
2	150	2	11.00	\N	1.10	14.00	14.00	424
28	150	28	12.00	\N	1.00	96.00	96.00	425
10	166	10	10.00	\N	1.00	97.00	97.00	479
43	151	1	24.00	\N	1.50	1.50	7.25	426
3	151	3	20.00	\N	2.00	125.00	125.00	427
24	151	24	12.00	\N	1.00	93.00	93.00	428
44	164	1	16.00	\N	1.00	17.35	19.55	469
43	152	1	8.00	\N	0.50	1.00	6.75	429
2	152	2	5.00	\N	0.50	13.50	13.50	430
3	152	3	5.00	\N	0.50	124.50	124.50	431
11	152	11	8.00	\N	1.00	96.00	96.00	432
3	164	3	21.00	\N	2.10	113.30	113.30	470
43	153	1	9.60	\N	0.60	0.40	6.15	433
3	153	3	13.00	\N	1.30	123.20	123.20	434
2	153	2	2.00	\N	0.20	13.30	13.30	435
7	153	7	10.00	\N	1.00	93.00	93.00	436
2	164	2	4.00	\N	0.40	10.20	10.20	471
43	154	1	8.00	\N	0.50	-0.10	5.65	437
3	154	3	10.00	\N	1.00	122.20	122.20	438
4	154	4	4.00	\N	2.00	94.00	94.00	439
23	164	23	10.00	\N	1.00	95.00	95.00	472
43	155	1	4.00	\N	0.25	-0.35	5.40	440
3	155	3	5.00	\N	0.50	121.70	121.70	441
8	155	8	2.00	\N	1.00	94.00	94.00	442
3	167	3	11.00	\N	1.10	109.40	109.40	481
43	156	1	13.60	\N	0.85	-1.20	4.55	443
3	156	3	16.00	\N	1.60	120.10	120.10	444
2	156	2	4.00	\N	0.40	12.90	12.90	445
24	156	24	12.00	\N	1.00	92.00	92.00	446
44	165	1	13.60	\N	0.85	16.50	18.70	473
43	157	1	16.00	\N	1.00	-2.20	3.55	447
2	157	2	5.00	\N	0.50	12.40	12.40	448
37	157	35	54.00	\N	3.00	25.00	25.00	449
43	145	1	160.00	16.00	10.00	-3.55	15.75	404
43	158	1	21.60	\N	1.35	-3.55	2.20	450
2	158	2	12.00	\N	1.20	11.20	11.20	451
3	158	3	18.00	\N	1.80	118.30	118.30	452
28	158	28	12.00	\N	1.00	95.00	95.00	453
2	165	2	7.00	\N	0.70	9.50	9.50	474
44	160	1	6.40	\N	0.40	19.60	21.80	455
3	160	3	10.00	\N	1.00	117.30	117.30	456
9	160	9	4.00	\N	1.00	99.00	99.00	457
3	165	3	18.00	\N	1.80	111.50	111.50	475
44	161	1	4.00	\N	0.25	19.35	21.55	458
3	161	3	5.00	\N	0.50	116.80	116.80	459
20	161	20	2.00	\N	1.00	99.00	99.00	460
44	159	1	320.00	16.00	20.00	-2.40	22.20	454
44	162	1	8.00	\N	0.50	18.85	21.05	461
3	162	3	8.00	\N	0.80	116.00	116.00	462
2	162	2	2.00	\N	0.20	11.00	11.00	463
22	162	22	8.00	\N	1.00	98.00	98.00	464
29	165	29	18.00	\N	1.00	91.00	91.00	476
44	166	1	6.40	\N	0.40	16.10	18.30	477
44	167	1	12.00	\N	0.75	15.35	17.55	480
2	167	2	4.00	\N	0.40	9.10	9.10	482
22	167	22	8.00	\N	1.00	96.00	96.00	483
44	168	1	16.00	\N	1.00	14.35	16.55	484
3	168	3	5.00	\N	0.50	108.90	108.90	485
32	168	32	40.00	\N	2.00	41.00	41.00	486
2	168	2	10.00	\N	1.00	8.10	8.10	487
44	169	1	6.40	\N	0.40	13.95	16.15	488
3	169	3	10.00	\N	1.00	107.90	107.90	489
18	169	18	9.00	\N	1.00	88.00	88.00	490
44	170	1	22.40	\N	1.40	12.55	14.75	491
3	170	3	29.00	\N	2.90	105.00	105.00	492
2	170	2	6.00	\N	0.60	7.50	7.50	493
7	170	7	10.00	\N	1.00	92.00	92.00	494
10	170	10	10.00	\N	1.00	96.00	96.00	495
44	171	1	8.00	\N	0.50	12.05	14.25	496
3	171	3	10.00	\N	1.00	104.00	104.00	497
44	172	1	9.60	\N	0.60	11.45	13.65	498
2	172	2	10.00	\N	1.00	6.50	6.50	499
3	172	3	5.00	\N	0.50	103.50	103.50	500
10	172	10	10.00	\N	1.00	95.00	95.00	501
44	173	1	24.00	\N	1.50	9.95	12.15	502
3	173	3	24.00	\N	2.40	101.10	101.10	503
2	173	2	6.00	\N	0.60	5.90	5.90	504
37	173	35	54.00	\N	3.00	22.00	22.00	505
44	174	1	16.00	\N	1.00	8.95	11.15	506
3	174	3	5.00	\N	0.50	100.60	100.60	507
29	174	29	18.00	\N	1.00	90.00	90.00	508
44	175	1	16.00	\N	1.00	7.95	10.15	509
3	175	3	23.00	\N	2.30	98.30	98.30	510
2	175	2	2.00	\N	0.20	5.70	5.70	511
27	175	27	24.00	\N	2.00	93.00	93.00	512
44	176	1	20.80	\N	1.30	6.65	8.85	513
3	176	3	23.00	\N	2.30	96.00	96.00	514
2	176	2	7.00	\N	0.70	5.00	5.00	515
31	176	31	15.00	\N	1.00	89.00	89.00	516
44	177	1	12.00	\N	0.75	5.90	8.10	517
3	177	3	13.00	\N	1.30	94.70	94.70	518
2	177	2	2.00	\N	0.20	4.80	4.80	519
7	177	7	10.00	\N	1.00	91.00	91.00	520
44	178	1	12.80	\N	0.80	5.10	7.30	521
3	178	3	14.00	\N	1.40	93.30	93.30	522
2	178	2	6.00	\N	0.60	4.20	4.20	523
29	178	29	18.00	\N	1.00	89.00	89.00	524
44	179	1	9.60	\N	0.60	4.50	6.70	525
2	179	2	6.00	\N	0.60	3.60	3.60	526
3	179	3	9.00	\N	0.90	92.40	92.40	527
28	179	28	12.00	\N	1.00	94.00	94.00	528
3	180	3	13.00	\N	1.30	91.10	91.10	529
2	180	2	2.00	\N	0.20	3.40	3.40	530
30	180	30	22.00	\N	2.00	92.00	92.00	531
44	181	1	12.80	\N	0.80	3.70	5.90	532
3	181	3	20.00	\N	2.00	89.10	89.10	533
22	181	22	24.00	\N	3.00	93.00	93.00	534
44	182	1	12.00	\N	0.75	2.95	5.15	535
3	182	3	15.00	\N	1.50	87.60	87.60	536
44	183	1	20.80	\N	1.30	1.65	3.85	537
3	183	3	30.00	\N	3.00	84.60	84.60	538
18	183	18	9.00	\N	1.00	87.00	87.00	539
44	184	1	12.80	\N	0.80	0.85	3.05	540
3	184	3	20.00	\N	2.00	82.60	82.60	541
26	184	26	12.00	\N	1.00	93.00	93.00	542
44	185	1	32.00	\N	2.00	-1.15	1.05	543
3	185	3	50.00	\N	5.00	77.60	77.60	544
44	186	1	20.00	\N	1.25	-2.40	-0.20	545
3	186	3	40.00	\N	4.00	73.60	73.60	546
24	186	24	12.00	\N	1.00	91.00	91.00	547
11	188	11	400.00	\N	50.00	46.00	46.00	549
6	188	6	400.00	\N	50.00	47.00	47.00	550
15	188	15	400.00	\N	50.00	48.00	48.00	551
22	188	22	400.00	\N	50.00	43.00	43.00	552
30	188	30	550.00	\N	50.00	42.00	42.00	553
4	189	4	140.00	\N	70.00	24.00	24.00	554
8	189	8	140.00	\N	70.00	24.00	24.00	555
13	189	13	140.00	\N	70.00	29.00	29.00	556
20	189	20	140.00	\N	70.00	29.00	29.00	557
5	190	5	340.00	\N	85.00	11.00	11.00	558
9	190	9	340.00	\N	85.00	14.00	14.00	559
14	190	14	170.00	\N	85.00	12.00	12.00	560
21	190	21	340.00	\N	85.00	13.00	13.00	561
26	191	26	1020.00	\N	85.00	8.00	8.00	562
27	191	27	1020.00	\N	85.00	8.00	8.00	563
28	191	28	1020.00	\N	85.00	9.00	9.00	564
7	192	7	830.00	\N	83.00	8.00	8.00	565
10	192	10	840.00	\N	84.00	11.00	11.00	566
16	192	16	820.00	\N	82.00	16.00	16.00	567
18	192	18	720.00	\N	80.00	7.00	7.00	568
17	192	17	747.00	\N	83.00	9.00	9.00	569
19	192	19	720.00	\N	80.00	15.00	15.00	570
23	192	23	820.00	\N	82.00	13.00	13.00	571
31	192	31	1230.00	\N	82.00	7.00	7.00	572
3	193	3	500.00	\N	50.00	23.60	23.60	573
3	194	3	150.00	\N	15.00	8.60	8.60	574
29	195	29	1440.00	\N	80.00	9.00	9.00	575
25	195	25	1200.00	\N	80.00	13.00	13.00	576
24	195	24	1020.00	\N	85.00	6.00	6.00	577
31	195	31	150.00	\N	10.00	-3.00	-3.00	578
32	196	32	580.00	\N	29.00	12.00	12.00	579
33	196	33	594.00	\N	30.00	15.00	15.00	580
37	196	35	540.00	\N	30.00	-8.00	-8.00	581
34	196	34	320.00	\N	32.00	5.00	5.00	582
49	198	35	486.00	18.00	27.00	27.00	19.00	586
54	200	6	63.00	7.00	9.00	0.00	56.00	591
52	200	4	36.00	2.00	18.00	11.00	42.00	589
53	200	5	36.00	4.00	9.00	7.00	20.00	590
48	198	32	240.00	20.00	12.00	3.00	24.00	585
50	198	33	480.00	17.78	27.00	26.00	42.00	587
51	199	31	540.00	15.00	36.00	35.00	33.00	588
19	19	19	900.00	9.00	100.00	10.00	100.00	19
45	201	1	10.20	\N	0.60	29.40	29.20	595
46	201	2	5.00	\N	0.50	14.50	17.90	596
47	201	3	15.00	\N	1.00	19.00	27.60	597
27	201	27	12.00	\N	1.00	7.00	7.00	598
11	221	11	8.00	\N	1.00	43.00	43.00	664
45	202	1	11.90	\N	0.70	28.70	28.50	599
46	215	2	5.00	\N	0.50	9.60	13.00	644
47	202	3	16.50	\N	1.10	17.90	26.50	600
10	215	10	10.00	\N	1.00	10.00	10.00	645
46	202	2	4.00	\N	0.40	14.10	17.50	601
45	187	1	510.00	17.00	30.00	6.05	29.80	548
56	202	26	10.00	\N	1.00	26.00	34.00	602
57	200	29	405.00	15.00	27.00	18.00	36.00	594
47	203	3	15.00	\N	1.00	16.90	25.50	603
25	203	25	15.00	\N	1.00	12.00	12.00	604
47	215	3	7.50	\N	0.50	6.40	15.00	646
45	204	1	13.60	\N	0.80	27.90	27.70	605
45	222	1	10.20	\N	0.60	18.25	18.05	665
47	204	3	27.00	\N	1.80	15.10	23.70	606
45	216	1	6.80	\N	0.40	21.55	21.35	647
46	204	2	2.00	\N	0.20	13.90	17.30	607
48	204	32	40.00	\N	2.00	10.00	22.00	608
46	224	2	5.00	\N	0.50	8.10	11.50	672
45	205	1	3.40	\N	0.20	27.70	27.50	609
47	216	3	15.00	\N	1.00	5.40	14.00	648
46	205	2	2.00	\N	0.20	13.70	17.10	610
54	216	6	7.00	\N	1.00	8.00	55.00	649
47	205	3	4.50	\N	0.30	14.80	23.40	611
11	205	11	8.00	\N	1.00	45.00	45.00	612
47	222	3	15.00	\N	1.00	1.40	10.00	666
45	206	1	17.00	\N	1.00	26.70	26.50	613
45	217	1	8.50	\N	0.50	21.05	20.85	650
46	206	2	2.00	\N	0.20	13.50	16.90	614
53	222	5	4.00	\N	1.00	8.00	19.00	667
47	206	3	4.50	\N	0.30	14.50	23.10	615
46	217	2	5.00	\N	0.50	9.10	12.50	651
45	207	1	17.00	\N	1.00	25.70	25.50	616
55	200	7	324.00	12.00	27.00	22.00	35.00	592
47	207	3	31.50	\N	2.10	12.40	21.00	617
47	217	3	7.50	\N	0.50	4.90	13.50	652
46	207	2	4.00	\N	0.40	13.10	16.50	618
45	226	1	17.00	\N	1.00	15.60	15.40	679
55	207	7	12.00	\N	1.00	26.00	34.00	619
21	217	21	4.00	\N	1.00	12.00	12.00	653
45	208	1	17.85	\N	1.05	24.65	24.45	620
45	223	1	11.05	\N	0.65	17.60	17.40	668
46	208	2	5.00	\N	0.50	12.60	16.00	621
45	218	1	8.50	\N	0.50	20.55	20.35	654
47	208	3	30.00	\N	2.00	10.40	19.00	622
28	208	28	12.00	\N	1.00	8.00	8.00	623
46	225	2	5.00	\N	0.50	7.60	11.00	676
45	209	1	6.80	\N	0.40	24.25	24.05	624
47	218	3	15.00	\N	1.00	3.90	12.50	655
46	209	2	5.00	\N	0.50	12.10	15.50	625
11	218	11	8.00	\N	1.00	44.00	44.00	656
47	209	3	7.50	\N	0.50	9.90	18.50	626
13	209	13	4.00	\N	2.00	27.00	27.00	627
47	223	3	15.00	\N	1.00	0.40	9.00	669
45	210	1	6.80	\N	0.40	23.85	23.65	628
45	219	1	17.00	\N	1.00	19.55	19.35	657
47	210	3	15.00	\N	1.00	8.90	17.50	629
22	210	22	8.00	\N	1.00	42.00	42.00	630
45	228	1	17.00	\N	1.00	13.80	13.60	685
45	211	1	12.75	\N	0.75	23.10	22.90	631
47	219	3	7.50	\N	0.50	3.40	12.00	658
46	211	2	5.00	\N	0.50	11.60	15.00	632
17	219	17	9.00	\N	1.00	8.00	8.00	659
47	211	3	15.00	\N	1.00	7.90	16.50	633
30	211	30	11.00	\N	1.00	41.00	41.00	634
47	224	3	7.50	\N	0.50	-0.10	8.50	673
45	212	1	7.65	\N	0.45	22.65	22.45	635
45	220	1	3.40	\N	0.20	19.35	19.15	660
46	212	2	10.00	\N	1.00	10.60	14.00	636
9	212	9	4.00	\N	1.00	13.00	13.00	637
47	197	3	300.00	15.00	20.00	-15.90	28.60	584
45	213	1	3.40	\N	0.20	22.45	22.25	638
54	223	6	7.00	\N	1.00	7.00	54.00	670
46	213	2	5.00	\N	0.50	10.10	13.50	639
52	213	4	2.00	\N	1.00	17.00	41.00	640
47	226	3	7.50	\N	0.50	-1.10	7.50	680
45	214	1	8.50	\N	0.50	21.95	21.75	641
45	224	1	8.50	\N	0.50	17.10	16.90	671
47	214	3	15.00	\N	1.00	6.90	15.50	642
30	214	30	11.00	\N	1.00	40.00	40.00	643
46	220	2	5.00	\N	0.50	8.60	12.00	661
11	224	11	8.00	\N	1.00	42.00	42.00	674
45	221	1	8.50	\N	0.50	18.85	18.65	662
45	227	1	13.60	\N	0.80	14.80	14.60	682
47	221	3	15.00	\N	1.00	2.40	11.00	663
45	225	1	8.50	\N	0.50	16.60	16.40	675
47	225	3	7.50	\N	0.50	-0.60	8.00	677
56	200	26	270.00	10.00	27.00	23.00	35.00	593
55	225	7	12.00	\N	1.00	25.00	33.00	678
57	226	29	15.00	\N	1.00	26.00	35.00	681
47	227	3	30.00	\N	2.00	-3.10	5.50	683
24	227	24	12.00	\N	1.00	5.00	5.00	684
47	228	3	30.00	\N	2.00	-5.10	3.50	686
48	228	32	40.00	\N	2.00	8.00	20.00	687
45	229	1	10.20	\N	0.60	13.20	13.00	688
47	229	3	19.50	\N	1.30	-6.40	2.20	689
46	229	2	2.00	\N	0.20	7.40	10.80	690
24	229	24	12.00	\N	1.00	4.00	4.00	691
45	230	1	17.00	\N	1.00	12.20	12.00	692
47	230	3	37.50	\N	2.50	-8.90	-0.30	693
57	250	29	30.00	\N	2.00	23.00	32.00	745
60	250	2	10.00	\N	1.00	12.90	22.70	746
60	255	2	5.00	\N	0.50	10.60	20.40	761
45	231	1	17.00	\N	1.00	11.20	11.00	694
47	231	3	7.50	\N	0.50	-9.40	-0.80	695
57	231	29	15.00	\N	1.00	25.00	34.00	696
45	232	1	8.50	\N	0.50	10.70	10.50	697
47	232	3	15.00	\N	1.00	-10.40	-1.80	698
54	232	6	7.00	\N	1.00	6.00	53.00	699
45	233	1	3.40	\N	0.20	10.50	10.30	700
59	251	1	11.90	\N	0.70	19.95	25.80	747
46	233	2	5.00	\N	0.50	6.90	10.30	701
45	234	1	8.50	\N	0.50	10.00	9.80	702
46	197	2	150.00	10.00	15.00	6.40	18.40	583
46	234	2	5.00	\N	0.50	6.40	9.80	703
47	234	3	7.50	\N	0.50	-10.90	-2.30	704
45	235	1	17.00	\N	1.00	9.00	8.80	705
47	235	3	7.50	\N	0.50	-11.40	-2.80	706
24	235	24	12.00	\N	1.00	3.00	3.00	707
45	236	1	10.20	\N	0.60	8.40	8.20	708
47	236	3	22.50	\N	1.50	-12.90	-4.30	709
56	236	26	10.00	\N	1.00	25.00	33.00	710
45	237	1	12.75	\N	0.75	7.65	7.45	711
47	237	3	22.50	\N	1.50	-14.40	-5.80	712
11	237	11	8.00	\N	1.00	41.00	41.00	713
45	238	1	17.00	\N	1.00	6.65	6.45	714
25	238	25	15.00	\N	1.00	11.00	11.00	715
45	239	1	10.20	\N	0.60	6.05	5.85	716
47	239	3	22.50	\N	1.50	-15.90	-7.30	717
56	239	26	10.00	\N	1.00	24.00	32.00	718
11	257	11	8.00	\N	1.00	39.00	39.00	769
59	243	1	15.30	\N	0.90	24.10	29.95	722
60	251	2	7.00	\N	0.70	12.20	22.00	748
58	243	3	30.00	\N	2.00	28.00	20.70	723
18	243	18	9.00	\N	1.00	6.00	6.00	724
58	255	3	15.00	\N	1.00	16.90	9.60	762
59	244	1	6.80	\N	0.40	23.70	29.55	725
58	251	3	12.00	\N	0.80	21.30	14.00	749
58	244	3	7.50	\N	0.50	27.50	20.20	726
8	244	8	2.00	\N	1.00	23.00	23.00	727
11	251	11	8.00	\N	1.00	40.00	40.00	750
59	245	1	17.00	\N	1.00	22.70	28.55	728
52	255	4	6.00	\N	3.00	12.00	36.00	763
58	245	3	7.50	\N	0.50	27.00	19.70	729
59	252	1	13.60	\N	0.80	19.15	25.00	751
59	246	1	8.50	\N	0.50	22.20	28.05	730
60	258	2	2.00	\N	0.20	9.90	19.70	772
58	246	3	15.00	\N	1.00	26.00	18.70	731
30	246	30	11.00	\N	1.00	39.00	39.00	732
58	252	3	34.50	\N	2.30	19.00	11.70	752
59	247	1	8.50	\N	0.50	21.70	27.55	733
59	256	1	25.50	\N	1.50	16.35	22.20	764
60	247	2	4.00	\N	0.40	14.60	24.40	734
60	252	2	2.00	\N	0.20	12.00	21.80	753
58	247	3	9.00	\N	0.60	25.40	18.10	735
14	247	14	2.00	\N	1.00	11.00	11.00	736
19	252	19	9.00	\N	1.00	14.00	14.00	754
59	248	1	11.05	\N	0.65	21.05	26.90	737
59	241	1	425.00	17.00	25.00	-5.85	30.85	720
58	248	3	12.00	\N	0.80	24.60	17.30	738
58	256	3	45.00	\N	3.00	13.90	6.60	765
60	248	2	7.00	\N	0.70	13.90	23.70	739
55	248	7	12.00	\N	1.00	24.00	32.00	740
50	256	33	17.78	\N	1.00	26.00	41.00	766
59	249	1	6.80	\N	0.40	20.65	26.50	741
54	256	6	7.00	\N	1.00	5.00	52.00	767
58	249	3	15.00	\N	1.00	23.60	16.30	742
52	249	4	4.00	\N	2.00	15.00	39.00	743
58	259	3	15.00	\N	1.00	12.60	5.30	774
58	250	3	22.50	\N	1.50	22.10	14.80	744
58	253	3	7.50	\N	0.50	18.50	11.20	755
9	253	9	4.00	\N	1.00	12.00	12.00	756
59	261	1	13.60	\N	0.80	12.60	18.45	779
59	254	1	6.80	\N	0.40	18.75	24.60	757
60	257	2	5.00	\N	0.50	10.10	19.90	770
60	254	2	9.00	\N	0.90	11.10	20.90	758
58	254	3	9.00	\N	0.60	17.90	10.60	759
59	258	1	3.40	\N	0.20	14.80	20.65	771
59	255	1	15.30	\N	0.90	17.85	23.70	760
59	257	1	22.95	\N	1.35	15.00	20.85	768
59	260	1	6.80	\N	0.40	13.40	19.25	777
58	258	3	4.50	\N	0.30	13.60	6.30	773
59	259	1	17.00	\N	1.00	13.80	19.65	775
57	259	29	15.00	\N	1.00	22.00	31.00	776
58	240	3	450.00	15.00	30.00	-55.00	22.70	719
58	260	3	15.00	\N	1.00	11.60	4.30	778
58	261	3	30.00	\N	2.00	9.60	2.30	780
11	261	11	8.00	\N	1.00	38.00	38.00	781
24	261	24	12.00	\N	1.00	2.00	2.00	782
59	262	1	12.75	\N	0.75	11.85	17.70	783
58	262	3	19.50	\N	1.30	8.30	1.00	784
60	262	2	2.00	\N	0.20	9.70	19.50	785
23	262	23	10.00	\N	1.00	12.00	12.00	786
59	263	1	11.90	\N	0.70	11.15	17.00	787
58	263	3	22.50	\N	1.50	6.80	-0.50	788
59	264	1	16.15	\N	0.95	10.20	16.05	789
58	264	3	19.50	\N	1.30	5.50	-1.80	790
60	264	2	7.00	\N	0.70	9.00	18.80	791
19	264	19	9.00	\N	1.00	13.00	13.00	792
58	265	3	22.50	\N	1.50	4.00	-3.30	793
59	265	1	8.50	\N	0.50	9.70	15.55	794
60	265	2	5.00	\N	0.50	8.50	18.30	795
59	266	1	7.65	\N	0.45	9.25	15.10	796
60	266	2	7.00	\N	0.70	7.80	17.60	797
58	266	3	4.50	\N	0.30	3.70	-3.60	798
14	266	14	2.00	\N	1.00	10.00	10.00	799
59	267	1	4.25	\N	0.25	9.00	14.85	800
58	267	3	7.50	\N	0.50	3.20	-4.10	801
61	286	37	5.84	\N	1.00	18.00	18.00	858
60	267	2	5.00	\N	0.50	7.30	17.10	802
52	267	4	2.00	\N	1.00	11.00	35.00	803
59	268	1	11.90	\N	0.70	8.30	14.15	804
58	286	3	3.00	\N	0.20	-23.50	-30.80	859
60	268	2	9.00	\N	0.90	6.40	16.20	805
58	268	3	9.00	\N	0.60	2.60	-4.70	806
28	268	28	12.00	\N	1.00	7.00	7.00	807
59	269	1	11.90	\N	0.70	7.60	13.45	808
58	269	3	16.50	\N	1.10	1.50	-5.80	809
54	286	6	7.00	\N	1.00	4.00	51.00	860
60	269	2	4.00	\N	0.40	6.00	15.80	810
59	270	1	17.00	\N	1.00	6.60	12.45	811
58	270	3	27.00	\N	1.80	-0.30	-7.60	812
60	270	2	2.00	\N	0.20	5.80	15.60	813
28	270	28	12.00	\N	1.00	6.00	6.00	814
59	271	1	20.40	\N	1.20	5.40	11.25	815
58	271	3	45.00	\N	3.00	-3.30	-10.60	816
30	271	30	22.00	\N	2.00	37.00	37.00	817
59	272	1	34.00	\N	2.00	3.40	9.25	818
58	272	3	30.00	\N	2.00	-5.30	-12.60	819
57	272	29	15.00	\N	1.00	21.00	30.00	820
14	290	14	2.00	\N	1.00	7.00	7.00	870
60	272	2	5.00	\N	0.50	5.30	15.10	821
59	273	1	10.20	\N	0.60	2.80	8.65	822
58	273	3	15.00	\N	1.00	-6.30	-13.60	823
59	274	1	10.20	\N	0.60	2.20	8.05	824
58	274	3	22.50	\N	1.50	-7.80	-15.10	825
17	274	17	9.00	\N	1.00	7.00	7.00	826
59	275	1	36.55	\N	2.15	0.05	5.90	827
58	275	3	81.00	\N	5.40	-13.20	-20.50	828
62	288	1	14.40	\N	0.90	19.10	19.10	862
60	275	2	16.00	\N	1.60	3.70	13.50	829
58	276	3	7.50	\N	0.50	-13.70	-21.00	830
14	276	14	2.00	\N	1.00	9.00	9.00	831
59	277	1	15.30	\N	0.90	-0.85	5.00	832
58	277	3	22.50	\N	1.50	-15.20	-22.50	833
16	290	16	10.00	\N	1.00	15.00	15.00	871
60	277	2	5.00	\N	0.50	3.20	13.00	834
30	277	30	11.00	\N	1.00	36.00	36.00	835
59	278	1	10.20	\N	0.60	-1.45	4.40	836
63	288	2	15.00	\N	1.50	8.50	20.60	863
60	278	2	5.00	\N	0.50	2.70	12.50	837
58	278	3	15.00	\N	1.00	-16.20	-23.50	838
14	278	14	2.00	\N	1.00	8.00	8.00	839
59	279	1	7.65	\N	0.45	-1.90	3.95	840
58	279	3	15.00	\N	1.00	-17.20	-24.50	841
15	279	15	8.00	\N	1.00	47.00	47.00	842
59	280	1	17.85	\N	1.05	-2.95	2.90	843
58	288	3	7.50	\N	0.50	-24.00	-31.30	864
60	280	2	2.00	\N	0.20	2.50	12.30	844
58	280	3	34.50	\N	2.30	-19.50	-26.80	845
59	281	1	17.00	\N	1.00	-3.95	1.90	846
60	242	2	150.00	10.00	15.00	2.30	24.80	721
60	281	2	2.00	\N	0.20	2.30	12.10	847
58	281	3	4.50	\N	0.30	-19.80	-27.10	848
59	282	1	11.05	\N	0.65	-4.60	1.25	849
58	282	3	7.50	\N	0.50	-20.30	-27.60	850
19	282	19	9.00	\N	1.00	12.00	12.00	851
59	283	1	21.25	\N	1.25	-5.85	0.00	852
58	283	3	45.00	\N	3.00	-23.30	-30.60	853
25	283	25	15.00	\N	1.00	10.00	10.00	854
15	288	15	8.00	\N	1.00	46.00	46.00	865
61	284	37	111.00	5.84	19.00	17.80	19.00	855
62	289	1	16.00	\N	1.00	18.10	18.10	866
62	292	1	28.80	\N	1.80	15.40	15.40	875
63	289	2	2.00	\N	0.20	8.30	20.40	867
58	289	3	12.00	\N	0.80	-24.80	-32.10	868
23	289	23	20.00	\N	2.00	10.00	10.00	869
64	287	38	56.00	7.00	8.00	7.95	8.00	861
62	291	1	14.40	\N	0.90	17.20	17.20	872
63	291	2	10.00	\N	1.00	7.30	19.40	873
58	291	3	22.50	\N	1.50	-26.30	-33.60	874
63	292	2	25.00	\N	2.50	4.80	16.90	876
58	292	3	37.50	\N	2.50	-28.80	-36.10	877
54	292	6	7.00	\N	1.00	3.00	50.00	878
55	292	7	12.00	\N	1.00	23.00	31.00	879
48	292	32	20.00	\N	1.00	7.00	19.00	880
62	294	1	20.80	\N	1.30	13.20	13.20	885
63	294	2	15.00	\N	1.50	2.30	14.40	886
58	294	3	22.50	\N	1.50	-31.30	-38.60	887
10	294	10	10.00	\N	1.00	9.00	9.00	888
62	295	1	16.80	\N	1.05	12.15	12.15	889
63	295	2	5.00	\N	0.50	1.80	13.90	890
58	295	3	37.50	\N	2.50	-33.80	-41.10	891
24	295	24	12.00	\N	1.00	1.00	1.00	892
62	296	1	16.00	\N	1.00	11.15	11.15	893
58	296	3	7.50	\N	0.50	-34.30	-41.60	894
62	297	1	7.20	\N	0.45	10.70	10.70	895
63	297	2	5.00	\N	0.50	1.30	13.40	896
58	297	3	7.50	\N	0.50	-34.80	-42.10	897
9	297	9	4.00	\N	1.00	11.00	11.00	898
62	298	1	18.40	\N	1.15	10.45	10.45	899
58	298	3	34.50	\N	2.30	-36.10	-43.40	900
63	298	2	2.00	\N	0.20	2.10	14.20	901
10	298	10	10.00	\N	1.00	8.00	8.00	902
62	299	1	3.20	\N	0.20	10.25	10.25	903
63	299	2	5.00	\N	0.50	1.60	13.70	904
24	311	24	12.00	\N	1.00	0.00	0.00	960
63	305	2	7.00	\N	0.70	-1.10	11.00	917
58	305	3	19.50	\N	1.30	-38.90	-46.20	918
62	300	1	3.20	\N	0.20	10.05	10.05	905
28	305	28	12.00	\N	1.00	5.00	5.00	919
63	300	2	5.00	\N	0.50	1.10	13.20	906
63	313	2	17.00	\N	1.70	-6.50	5.60	947
62	306	1	14.40	\N	0.90	6.25	6.25	920
58	313	3	12.00	\N	0.80	-53.00	-60.30	948
63	306	2	10.00	\N	1.00	-2.10	10.00	921
58	306	3	30.00	\N	2.00	-40.90	-48.20	922
25	306	25	15.00	\N	1.00	9.00	9.00	923
11	313	11	16.00	\N	2.00	36.00	36.00	949
62	307	1	18.40	\N	1.15	5.10	5.10	924
58	307	3	34.50	\N	2.30	-43.20	-50.50	925
63	307	2	2.00	\N	0.20	-2.30	9.80	926
62	314	1	9.60	\N	0.60	-1.85	-1.85	950
62	308	1	16.00	\N	1.00	4.10	4.10	927
62	301	1	7.20	\N	0.45	9.60	9.60	907
19	308	19	9.00	\N	1.00	11.00	11.00	928
63	301	2	10.00	\N	1.00	0.10	12.20	908
23	308	23	10.00	\N	1.00	9.00	9.00	929
58	308	3	15.00	\N	1.00	-44.20	-51.50	930
68	319	39	500.00	5.00	100.00	90.00	100.00	963
62	309	1	22.40	\N	1.40	2.70	2.70	931
58	309	3	52.50	\N	3.50	-47.70	-55.00	932
57	309	29	15.00	\N	1.00	20.00	29.00	933
48	309	32	40.00	\N	2.00	5.00	17.00	934
63	314	2	15.00	\N	1.50	-8.00	4.10	951
62	302	1	6.40	\N	0.40	9.20	9.20	909
58	314	3	15.00	\N	1.00	-54.00	-61.30	952
63	302	2	5.00	\N	0.50	-0.40	11.70	910
58	302	3	7.50	\N	0.50	-36.60	-43.90	911
27	314	27	12.00	\N	1.00	6.00	6.00	953
62	303	1	10.40	\N	0.65	8.55	8.55	912
58	315	3	15.00	\N	1.00	-55.00	-62.30	954
62	304	1	6.40	\N	0.40	8.15	8.15	913
58	304	3	15.00	\N	1.00	-37.60	-44.90	914
30	304	30	11.00	\N	1.00	35.00	35.00	915
48	315	32	20.00	\N	1.00	4.00	16.00	955
62	305	1	16.00	\N	1.00	7.15	7.15	916
54	315	6	7.00	\N	1.00	2.00	49.00	956
68	320	39	50.00	0.00	10.00	90.00	90.00	964
62	310	1	14.40	\N	0.90	1.80	1.80	935
62	285	1	320.00	16.00	20.00	-1.85	20.00	856
63	310	2	5.00	\N	0.50	-2.80	9.30	936
58	310	3	22.50	\N	1.50	-49.20	-56.50	937
18	310	18	9.00	\N	1.00	5.00	5.00	938
62	311	1	14.40	\N	0.90	-1.85	-1.85	957
62	312	1	17.60	\N	1.10	-0.20	-0.20	943
63	312	2	10.00	\N	1.00	-4.80	7.30	944
58	312	3	22.50	\N	1.50	-52.20	-59.50	945
62	313	1	16.80	\N	1.05	-1.25	-1.25	946
63	311	2	10.00	\N	1.00	-8.00	4.10	958
58	311	3	22.50	\N	1.50	-55.00	-62.30	959
70	322	40	100.00	5.00	20.00	20.00	20.00	965
73	365	3	1.80	\N	0.30	109.00	109.30	1080
66	323	1	31.50	\N	0.70	49.30	47.45	966
66	325	1	9.00	\N	0.20	48.25	46.40	974
63	323	2	10.00	\N	1.00	-9.00	3.10	967
65	323	3	30.00	\N	0.50	199.50	137.20	968
11	323	11	8.00	\N	1.00	35.00	35.00	969
66	324	1	38.25	\N	0.85	48.45	46.60	970
66	326	1	11.25	\N	0.25	48.00	46.15	977
65	324	3	138.00	\N	2.30	197.20	134.90	971
74	365	2	2.00	\N	0.20	99.20	98.00	1081
63	324	2	2.00	\N	0.20	-9.20	2.90	972
27	324	27	12.00	\N	1.00	5.00	5.00	973
65	325	3	30.00	\N	0.50	196.70	134.40	975
8	325	8	2.00	\N	1.00	22.00	22.00	976
27	365	27	12.00	\N	1.00	4.00	4.00	1082
65	326	3	30.00	\N	0.50	196.20	133.90	978
53	326	5	4.00	\N	1.00	7.00	18.00	979
66	327	1	18.00	\N	0.40	47.60	45.75	980
65	327	3	60.00	\N	1.00	195.20	132.90	981
22	327	22	8.00	\N	1.00	41.00	41.00	982
66	328	1	45.00	\N	1.00	46.60	44.75	983
65	328	3	30.00	\N	0.50	194.70	132.40	984
66	329	1	9.00	\N	0.20	46.40	44.55	985
63	329	2	2.00	\N	0.20	-9.40	2.70	986
65	329	3	18.00	\N	0.30	194.40	132.10	987
14	329	14	2.00	\N	1.00	6.00	6.00	988
66	330	1	20.25	\N	0.45	45.95	44.10	989
66	349	1	40.50	\N	0.90	36.25	34.40	1032
65	330	3	48.00	\N	0.80	193.60	131.30	990
63	330	2	2.00	\N	0.20	-9.60	2.50	991
9	330	9	4.00	\N	1.00	10.00	10.00	992
15	355	15	8.00	\N	1.00	44.00	44.00	1055
66	331	1	18.00	\N	0.40	45.55	43.70	993
73	349	3	10.80	\N	1.80	120.70	121.00	1033
65	331	3	48.00	\N	0.80	192.80	130.50	994
63	331	2	2.00	\N	0.20	-9.80	2.30	995
30	331	30	11.00	\N	1.00	34.00	34.00	996
66	356	1	36.00	\N	0.80	32.85	31.00	1056
65	334	3	7812.00	0.00	130.20	62.30	0.00	1001
65	316	3	12000.00	60.00	200.00	62.60	137.70	961
66	336	1	9.00	\N	0.20	45.35	43.50	1003
73	336	3	3.00	\N	0.50	129.70	130.00	1004
66	337	1	27.00	\N	0.60	44.75	42.90	1005
63	337	2	5.00	\N	0.50	-10.30	1.80	1006
66	338	1	11.25	\N	0.25	44.50	42.65	1007
63	349	2	2.00	\N	0.20	-12.30	-0.20	1034
73	338	3	3.00	\N	0.50	129.20	129.50	1008
30	338	30	11.00	\N	1.00	33.00	33.00	1009
66	339	1	22.50	\N	0.50	44.00	42.15	1010
66	350	1	27.00	\N	0.60	35.65	33.80	1035
73	339	3	4.80	\N	0.80	128.40	128.70	1011
63	339	2	2.00	\N	0.20	-10.50	1.60	1012
66	340	1	18.00	\N	0.40	43.60	41.75	1013
73	340	3	6.00	\N	1.00	127.40	127.70	1014
73	350	3	6.60	\N	1.10	119.60	119.90	1036
73	341	3	3.00	\N	0.50	126.90	127.20	1015
73	356	3	15.00	\N	2.50	113.20	113.50	1057
63	350	2	4.00	\N	0.40	-12.70	-0.60	1037
66	342	1	9.00	\N	0.20	43.40	41.55	1016
66	351	1	18.00	\N	0.40	35.25	33.40	1038
28	356	28	12.00	\N	1.00	4.00	4.00	1058
66	343	1	135.00	\N	3.00	40.40	38.55	1017
66	344	1	45.00	\N	1.00	39.40	37.55	1018
66	345	1	9.00	\N	0.20	39.20	37.35	1019
73	351	3	4.80	\N	0.80	118.80	119.10	1039
73	345	3	3.00	\N	0.50	126.40	126.70	1020
15	345	15	8.00	\N	1.00	45.00	45.00	1021
66	346	1	47.25	\N	1.05	38.15	36.30	1022
73	346	3	15.60	\N	2.60	123.80	124.10	1023
63	351	2	2.00	\N	0.20	-12.90	-0.80	1040
63	346	2	4.00	\N	0.40	-10.90	1.20	1024
18	346	18	9.00	\N	1.00	4.00	4.00	1025
66	347	1	45.00	\N	1.00	37.15	35.30	1026
17	351	17	9.00	\N	1.00	6.00	6.00	1041
73	347	3	3.00	\N	0.50	123.30	123.60	1027
48	347	32	20.00	\N	1.00	3.00	15.00	1028
66	360	1	18.00	\N	0.40	32.45	30.60	1065
73	348	3	4.80	\N	0.80	122.50	122.80	1029
63	348	2	12.00	\N	1.20	-12.10	0.00	1030
30	348	30	22.00	\N	2.00	31.00	31.00	1031
66	352	1	11.25	\N	0.25	35.00	33.15	1042
73	352	3	3.00	\N	0.50	118.30	118.60	1043
9	352	9	4.00	\N	1.00	9.00	9.00	1044
66	353	1	33.75	\N	0.75	34.25	32.40	1045
66	362	1	45.00	\N	1.00	31.00	29.15	1072
73	353	3	9.00	\N	1.50	116.80	117.10	1046
57	353	29	15.00	\N	1.00	19.00	28.00	1047
66	354	1	9.00	\N	0.20	34.05	32.20	1048
73	354	3	1.80	\N	0.30	116.50	116.80	1049
54	360	6	7.00	\N	1.00	1.00	48.00	1068
63	354	2	2.00	\N	0.20	-13.10	-1.00	1050
20	354	20	2.00	\N	1.00	28.00	28.00	1051
66	355	1	18.00	\N	0.40	33.65	31.80	1052
66	363	1	33.75	\N	0.75	30.25	28.40	1074
73	355	3	4.80	\N	0.80	115.70	116.00	1053
63	285	2	100.00	10.00	10.00	-13.30	22.10	857
63	355	2	2.00	\N	0.20	-13.30	-1.20	1054
73	360	3	4.80	\N	0.80	112.40	112.70	1066
66	364	1	9.00	\N	0.20	30.05	28.20	1077
74	360	2	2.00	\N	0.20	99.80	98.60	1067
66	361	1	20.25	\N	0.45	32.00	30.15	1069
73	361	3	6.00	\N	1.00	111.40	111.70	1070
22	361	22	8.00	\N	1.00	40.00	40.00	1071
73	362	3	3.00	\N	0.50	110.90	111.20	1073
71	332	41	100.00	2.00	50.00	49.00	50.00	997
73	363	3	6.60	\N	1.10	109.80	110.10	1075
66	366	1	18.00	\N	0.40	29.65	27.80	1083
74	363	2	4.00	\N	0.40	99.40	98.20	1076
73	364	3	3.00	\N	0.50	109.30	109.60	1078
13	364	13	2.00	\N	1.00	26.00	26.00	1079
66	317	1	2250.00	45.00	50.00	17.15	48.15	962
73	366	3	4.80	\N	0.80	108.20	108.50	1084
74	366	2	2.00	\N	0.20	99.00	97.80	1085
30	366	30	11.00	\N	1.00	30.00	30.00	1086
66	367	1	38.25	\N	0.85	28.80	26.95	1087
55	385	7	12.00	\N	1.00	22.00	30.00	1144
73	367	3	10.80	\N	1.80	106.40	106.70	1088
66	386	1	18.00	\N	0.40	18.45	16.60	1145
74	367	2	7.00	\N	0.70	98.30	97.10	1089
18	367	18	9.00	\N	1.00	3.00	3.00	1090
66	368	1	18.00	\N	0.40	28.40	26.55	1091
64	389	38	0.35	\N	0.05	7.95	7.95	1159
73	368	3	6.00	\N	1.00	105.40	105.70	1092
66	369	1	11.25	\N	0.25	28.15	26.30	1093
73	386	3	4.80	\N	0.80	86.60	86.90	1146
73	369	3	3.00	\N	0.50	104.90	105.20	1094
9	369	9	4.00	\N	1.00	8.00	8.00	1095
66	370	1	18.00	\N	0.40	27.75	25.90	1096
73	335	3	781.00	6.00	130.20	84.10	130.20	1002
73	370	3	6.00	\N	1.00	103.90	104.20	1097
15	370	15	8.00	\N	1.00	43.00	43.00	1098
66	371	1	33.75	\N	0.75	27.00	25.15	1099
74	386	2	2.00	\N	0.20	92.10	90.90	1147
73	371	3	7.80	\N	1.30	102.60	102.90	1100
14	386	14	2.00	\N	1.00	5.00	5.00	1148
74	371	2	2.00	\N	0.20	98.10	96.90	1101
66	372	1	18.00	\N	0.40	26.60	24.75	1102
66	387	1	29.25	\N	0.65	17.80	15.95	1149
74	372	2	7.00	\N	0.70	97.40	96.20	1103
73	389	3	1.20	\N	0.20	84.10	84.40	1160
73	372	3	1.80	\N	0.30	102.30	102.60	1104
19	372	19	9.00	\N	1.00	10.00	10.00	1105
66	373	1	22.50	\N	0.50	26.10	24.25	1106
74	387	2	5.00	\N	0.50	91.60	90.40	1150
73	373	3	9.00	\N	1.50	100.80	101.10	1107
34	373	34	10.00	\N	1.00	4.00	4.00	1108
66	374	1	20.25	\N	0.45	25.65	23.80	1109
74	374	2	5.00	\N	0.50	96.90	95.70	1110
73	387	3	6.00	\N	1.00	85.60	85.90	1151
73	374	3	3.00	\N	0.50	100.30	100.60	1111
66	375	1	9.00	\N	0.20	25.45	23.60	1112
56	387	26	10.00	\N	1.00	23.00	31.00	1152
73	375	3	3.00	\N	0.50	99.80	100.10	1113
66	376	1	33.75	\N	0.75	24.70	22.85	1114
66	388	1	29.25	\N	0.65	17.15	15.30	1153
73	376	3	9.00	\N	1.50	98.30	98.60	1115
54	376	6	7.00	\N	1.00	0.00	47.00	1116
73	377	3	6.00	\N	1.00	97.30	97.60	1117
25	377	25	15.00	\N	1.00	8.00	8.00	1118
73	388	3	7.80	\N	1.30	84.30	84.60	1154
73	378	3	6.00	\N	1.00	96.30	96.60	1119
74	359	2	1000.00	10.00	100.00	91.40	98.80	1064
74	378	2	15.00	\N	1.50	95.40	94.20	1120
57	378	29	15.00	\N	1.00	18.00	27.00	1121
66	379	1	45.00	\N	1.00	23.70	21.85	1122
74	388	2	2.00	\N	0.20	91.40	90.20	1155
73	379	3	13.80	\N	2.30	94.00	94.30	1123
21	388	21	4.00	\N	1.00	11.00	11.00	1156
74	379	2	2.00	\N	0.20	95.20	94.00	1124
66	380	1	18.00	\N	0.40	23.30	21.45	1125
73	380	3	6.00	\N	1.00	93.00	93.30	1126
11	380	11	8.00	\N	1.00	34.00	34.00	1127
66	381	1	45.00	\N	1.00	22.30	20.45	1128
73	381	3	3.00	\N	0.50	92.50	92.80	1129
24	381	24	12.00	\N	1.00	-1.00	-1.00	1130
66	382	1	40.50	\N	0.90	21.40	19.55	1131
74	382	2	12.00	\N	1.20	94.00	92.80	1132
73	382	3	7.80	\N	1.30	91.20	91.50	1133
51	382	31	15.00	\N	1.00	35.00	32.00	1134
66	383	1	51.75	\N	1.15	20.25	18.40	1135
74	383	2	12.00	\N	1.20	92.80	91.60	1136
73	383	3	13.80	\N	2.30	88.90	89.20	1137
66	384	1	18.00	\N	0.40	19.85	18.00	1138
74	384	2	5.00	\N	0.50	92.30	91.10	1139
73	384	3	3.00	\N	0.50	88.40	88.70	1140
22	384	22	8.00	\N	1.00	39.00	39.00	1141
66	385	1	45.00	\N	1.00	18.85	17.00	1142
73	385	3	6.00	\N	1.00	87.40	87.70	1143
71	389	41	2.00	\N	1.00	49.00	49.00	1157
61	389	37	1.17	\N	0.20	17.80	17.80	1158
\.


--
-- TOC entry 3489 (class 0 OID 58064)
-- Dependencies: 237
-- Data for Name: detalle_opcion; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.detalle_opcion (cod_item, cod_opcion, cantidad_op) FROM stdin;
191	6	1
191	1	1
192	4	1
192	5	1
192	1	1
192	2	1
195	1	1
195	6	1
196	4	1
196	5	1
196	2	2
198	2	1
200	2	1
200	6	2
200	7	1
201	4	1
201	2	1
204	6	2
204	7	2
205	1	1
205	2	1
205	6	1
205	7	1
208	1	1
210	1	1
210	6	1
227	6	1
227	7	1
227	2	1
230	4	1
230	2	1
231	6	1
231	2	1
232	4	2
232	5	1
232	2	2
166	1	1
166	6	1
167	5	1
167	2	1
168	7	1
170	6	1
172	2	1
172	6	2
172	7	1
173	2	1
175	1	1
175	2	1
175	6	1
175	7	1
176	4	1
176	1	1
177	4	1
177	2	1
183	1	1
183	2	1
183	6	1
183	7	1
237	7	1
238	4	1
238	2	1
242	2	1
244	6	2
244	7	2
244	1	1
244	2	1
246	7	1
246	2	1
247	6	1
247	7	1
247	1	1
247	2	1
248	4	1
248	5	1
248	1	1
248	2	1
251	6	1
251	1	1
252	6	1
252	1	1
253	5	1
253	2	1
257	6	2
257	7	1
257	2	3
260	4	2
261	6	1
261	7	1
261	2	2
262	5	1
262	2	1
268	6	2
268	7	1
268	1	1
268	2	1
271	1	1
271	2	1
271	6	1
271	7	1
280	1	1
280	4	1
282	6	1
282	1	1
200	\N	2
204	\N	4
227	\N	1
232	\N	1
168	\N	1
170	\N	1
172	\N	2
237	\N	1
244	\N	2
247	\N	1
260	\N	2
268	\N	1
299	2	1
299	8	1
299	7	1
299	6	1
301	4	1
301	1	1
302	2	2
302	7	1
302	6	1
304	2	4
304	7	2
304	6	2
305	5	1
305	2	1
306	1	1
306	6	1
310	2	3
310	4	3
312	2	3
312	8	1
312	7	1
312	6	3
314	2	1
317	4	2
317	5	1
317	2	3
319	8	1
319	7	1
322	2	1
326	8	1
326	7	1
328	4	1
328	5	2
328	1	1
328	2	2
330	5	1
330	2	1
332	2	2
332	8	1
332	7	1
332	6	2
334	4	1
334	5	1
334	2	2
336	2	1
336	8	1
336	7	1
336	6	1
338	4	4
338	1	1
338	2	3
341	1	1
341	7	1
342	4	1
342	2	1
344	8	1
349	2	4
349	7	3
349	6	1
352	2	4
352	7	2
352	6	2
353	4	2
353	2	1
353	8	1
355	2	5
355	7	2
355	6	3
356	4	3
356	5	1
356	1	2
356	2	2
359	2	1
359	8	2
359	7	2
359	6	1
361	1	1
361	2	2
361	7	2
361	6	1
363	4	1
363	5	1
363	2	2
367	1	1
367	2	3
367	7	3
367	6	1
370	2	1
370	8	1
370	7	2
372	4	1
372	5	2
372	2	1
372	8	2
375	2	2
375	8	1
375	7	3
377	2	4
377	7	2
377	6	2
379	4	1
379	5	1
379	2	2
381	2	1
384	8	1
384	7	1
385	4	3
385	5	2
385	2	3
385	8	2
387	2	3
387	7	2
387	6	1
389	1	1
389	2	1
389	7	2
390	4	2
390	2	2
393	2	2
393	7	2
394	5	1
394	2	1
396	2	3
396	8	1
396	7	3
396	6	2
398	2	2
398	6	2
400	2	3
400	7	2
400	6	1
403	1	1
403	2	1
403	7	1
403	6	1
404	4	2
404	5	1
404	2	3
406	2	4
406	7	2
406	6	2
408	4	2
408	5	1
408	2	2
408	8	1
409	2	1
409	7	1
411	4	1
411	5	2
411	2	2
411	8	1
413	4	3
413	2	3
415	4	2
415	8	2
417	2	6
417	7	2
417	6	4
418	1	1
418	2	2
418	7	3
420	2	3
420	7	2
420	6	1
421	2	1
421	8	1
421	6	2
422	4	2
422	5	1
422	2	3
424	2	1
424	8	2
424	7	3
426	4	4
426	1	1
426	2	2
426	8	1
428	2	2
428	8	2
428	7	3
428	6	1
430	2	1
434	4	3
434	2	2
434	8	1
436	2	1
436	8	2
436	7	2
436	6	1
437	4	1
437	5	1
437	2	2
439	2	1
439	8	2
439	7	1
439	6	2
443	1	1
443	2	2
443	7	3
450	4	2
450	2	2
452	4	1
452	5	1
452	8	2
453	8	1
453	6	1
455	2	1
455	8	1
455	7	1
455	6	1
499	4	10
499	5	10
499	2	15
499	8	5
505	4	5
505	5	3
505	2	8
508	2	1
508	8	2
508	7	1
508	6	2
510	4	5
510	5	5
510	2	10
514	2	3
514	7	3
516	4	2
516	5	2
516	2	2
516	8	2
517	2	1
517	8	2
517	6	3
519	4	1
519	5	2
519	2	2
519	8	1
520	2	3
520	8	1
520	7	2
520	6	2
521	2	1
521	8	1
525	1	2
525	2	1
525	7	1
525	6	2
526	4	1
526	5	2
526	2	1
526	8	2
527	2	1
527	8	1
527	6	2
529	2	2
529	8	1
529	7	1
529	6	1
531	2	5
531	7	3
531	6	2
533	4	4
533	2	4
534	2	1
534	8	1
534	7	1
534	6	1
536	2	2
539	4	4
539	5	6
539	1	1
539	2	4
539	8	5
540	1	1
540	2	1
540	7	1
540	6	2
542	4	3
542	2	1
542	8	2
543	1	1
543	2	1
543	7	1
543	6	1
545	2	1
545	8	1
549	4	2
549	5	3
549	2	3
549	8	2
551	4	1
551	5	2
551	2	3
553	5	3
553	2	3
555	2	2
555	8	1
555	7	1
555	6	2
556	4	1
556	5	1
556	2	2
559	4	1
559	5	1
559	1	1
559	2	1
561	2	2
561	8	1
561	7	2
561	6	1
563	2	4
563	8	2
563	7	3
563	6	3
566	2	1
568	2	9
568	8	6
568	7	7
568	6	8
571	4	3
571	2	3
572	2	1
572	7	1
574	8	4
574	7	1
574	6	3
575	4	1
575	2	1
577	2	2
577	8	1
577	7	1
577	6	2
582	4	2
582	5	3
582	2	5
588	4	2
588	2	2
589	2	1
589	8	1
589	7	2
591	4	1
591	5	3
591	2	4
594	2	1
594	8	3
602	2	2
602	7	2
604	4	2
604	5	3
604	1	5
607	2	5
607	7	2
607	6	3
608	4	1
608	5	3
608	2	3
608	8	1
609	8	3
609	7	1
609	6	2
611	4	4
611	1	1
611	2	3
613	4	1
613	5	2
613	2	3
614	8	3
614	7	1
614	6	2
617	2	1
617	8	3
617	7	3
617	6	1
620	2	1
621	4	1
621	5	1
621	2	2
624	4	1
624	5	1
624	1	1
624	2	1
626	2	2
626	8	1
626	7	1
626	6	2
628	4	1
628	5	1
628	2	2
632	4	1
632	2	1
634	2	1
634	8	2
634	7	1
634	6	2
635	5	1
635	2	1
637	1	1
639	1	1
639	2	1
639	8	1
639	7	1
639	6	1
640	4	1
640	5	2
640	1	1
640	2	2
642	2	2
642	7	2
644	4	1
644	2	1
646	5	2
646	2	1
646	8	1
648	4	2
648	8	2
650	2	3
650	8	2
650	7	3
650	6	2
652	1	1
652	2	1
652	7	2
653	4	1
653	2	1
654	8	1
654	6	1
657	2	2
657	7	2
659	4	2
659	5	1
659	2	1
659	8	2
661	2	1
664	2	2
664	7	1
664	6	1
666	2	4
666	8	3
666	7	3
666	6	4
669	4	2
669	2	2
670	1	2
670	2	1
670	7	1
670	6	2
672	4	5
672	5	1
672	2	3
672	8	3
674	2	1
676	2	4
676	8	1
676	7	3
676	6	2
678	2	3
678	8	1
678	7	3
678	6	1
679	4	1
679	5	1
679	1	1
679	2	1
681	5	3
681	2	2
681	8	1
683	2	1
683	8	3
683	7	1
683	6	3
685	8	3
685	6	3
687	2	1
687	8	1
690	2	4
690	7	1
690	6	3
692	5	3
692	2	3
693	2	4
693	7	1
693	6	3
694	4	1
694	5	1
694	2	2
696	2	4
696	6	4
698	2	10
698	7	6
698	6	4
699	4	3
699	5	2
699	2	5
746	1	1
746	2	2
746	7	3
748	5	2
748	2	1
748	8	1
749	8	1
749	6	1
751	2	2
753	2	3
753	8	1
753	6	4
755	8	1
755	6	1
757	8	1
758	2	3
758	8	2
758	7	3
758	6	2
760	1	1
760	2	3
760	7	3
760	6	1
761	5	1
761	2	1
763	1	1
763	2	1
763	7	1
763	6	1
765	2	2
765	7	1
765	6	1
767	4	1
767	5	1
767	1	1
767	2	2
769	4	1
769	1	1
770	1	1
770	7	1
772	1	1
772	7	1
774	5	2
774	2	2
776	1	1
779	2	2
779	7	2
781	4	2
781	1	1
781	2	1
783	5	2
783	2	2
785	2	1
787	1	1
787	7	1
788	4	2
788	2	2
790	2	2
790	7	3
792	4	1
792	2	1
793	2	1
793	7	1
795	4	1
795	5	1
795	1	1
795	2	1
797	5	2
797	1	1
797	2	1
799	2	1
801	2	4
801	7	1
801	6	3
803	5	4
803	2	4
805	2	2
805	8	1
805	7	2
805	6	1
807	2	5
807	7	2
807	6	3
810	8	1
814	2	1
816	5	2
816	2	2
818	1	1
818	7	1
819	4	1
819	5	1
819	1	1
819	2	1
820	2	1
822	2	3
822	7	3
824	5	3
824	2	3
828	2	3
828	7	3
830	2	2
830	7	1
830	6	1
831	4	2
831	2	2
833	2	1
833	7	1
835	2	1
836	4	1
836	5	1
836	2	2
838	4	1
838	5	1
838	8	2
840	2	1
840	8	1
840	6	2
841	5	1
841	1	1
843	2	2
843	7	2
845	2	3
848	4	1
848	5	1
848	1	1
848	2	1
849	8	1
851	2	3
851	8	1
854	2	1
856	8	2
859	4	1
859	5	1
859	1	1
859	2	1
860	2	1
860	7	1
862	4	4
862	5	2
862	2	6
865	7	3
866	4	1
866	5	2
869	8	1
869	6	1
870	2	1
871	2	1
873	2	2
873	7	1
873	6	1
874	2	4
874	7	2
874	6	2
877	4	3
877	2	2
877	8	1
879	4	1
879	5	1
879	2	2
880	2	1
880	7	1
881	2	1
881	7	1
882	4	1
882	5	2
882	1	1
882	2	1
882	8	1
884	2	1
885	5	2
885	2	2
887	1	1
888	8	1
890	5	1
890	2	1
893	4	2
893	1	1
893	8	1
894	8	1
894	7	1
896	2	1
896	6	1
897	4	1
897	5	1
897	8	2
898	4	1
898	5	3
898	2	3
898	8	1
900	2	6
900	7	2
900	6	4
902	2	2
907	2	2
907	6	2
908	2	3
908	7	1
908	6	2
910	4	2
910	5	1
910	2	3
911	2	4
911	8	3
911	7	4
911	6	3
914	2	1
916	2	2
916	7	2
917	1	1
917	2	1
919	1	1
919	2	2
921	2	1
921	7	1
922	5	1
922	2	1
924	4	1
924	8	1
925	2	4
925	7	2
925	6	2
926	8	1
927	7	1
927	6	1
928	5	1
928	2	1
935	9	1
937	2	5
937	7	3
937	6	2
938	4	1
938	2	1
940	1	1
940	2	1
940	7	1
940	6	1
941	4	2
941	1	2
943	8	1
944	2	1
949	1	1
949	2	1
949	7	1
949	6	1
950	4	1
950	5	1
950	1	1
950	2	1
952	1	1
952	2	1
952	7	1
952	6	1
953	4	1
953	5	1
953	1	1
953	2	1
954	1	1
954	2	1
954	7	1
954	6	1
955	4	1
955	5	1
955	1	1
955	2	1
964	1	1
964	2	1
964	7	1
964	6	1
965	4	1
965	5	1
965	1	1
965	2	1
966	1	1
966	2	1
966	7	1
966	6	1
968	1	1
968	2	3
968	7	2
968	6	2
969	5	1
969	2	1
972	2	1
973	1	1
973	7	1
974	5	1
974	2	1
978	1	2
978	2	1
978	7	1
978	6	1
979	4	1
979	5	1
979	1	1
979	2	1
981	1	1
981	7	1
982	4	1
982	1	1
983	2	1
983	8	1
983	7	1
983	6	1
984	4	1
984	5	2
984	2	3
992	1	1
992	7	1
997	1	1
997	7	1
1004	1	1
1004	7	1
1005	4	1
1005	1	1
1010	1	1
1010	2	1
1010	7	1
1010	6	1
1013	2	2
1013	7	1
1013	6	1
1015	4	1
1015	5	2
1015	1	1
1015	2	1
1015	8	1
1016	4	1
1016	2	1
1018	1	1
1018	2	1
1018	7	1
1018	6	1
1019	4	2
1019	2	2
1023	2	1
1023	8	1
1023	7	2
1024	4	3
1024	2	3
1030	2	7
1030	7	2
1030	6	5
1037	1	1
1037	7	1
1037	6	1
1038	5	2
1038	2	2
1045	1	2
1045	2	1
1045	7	2
1045	6	1
1046	4	1
1046	5	1
1046	2	2
1047	1	3
1047	7	3
1048	5	1
1048	2	1
1049	8	1
1049	6	1
1051	2	1
1054	1	1
1054	2	2
1054	7	3
1057	2	2
1060	1	1
1060	2	1
1060	7	2
1061	4	1
1061	5	1
1061	1	1
1061	2	1
1064	1	1
1064	7	1
1065	4	1
1065	5	1
1065	1	1
1065	2	1
1067	2	2
1067	8	1
1067	7	1
1067	6	2
1068	4	1
1068	2	1
1071	2	1
1071	6	1
1073	5	1
1073	2	1
1075	2	2
1075	6	2
1077	2	1
1078	8	1
1078	7	1
1080	5	1
1080	2	1
1081	8	1
1081	7	1
1085	2	1
1085	8	1
1085	7	1
1085	6	1
1088	2	1
1088	7	1
1089	1	1
1089	7	1
1089	6	2
1090	4	1
1090	2	1
1092	4	1
1092	5	1
1092	2	1
1092	8	1
1093	2	2
1093	7	1
1093	6	1
1095	2	1
1100	8	1
1100	7	1
1102	8	1
1102	6	1
1120	2	1
1120	7	1
1122	2	2
1122	8	2
1122	7	1
1122	6	3
1123	4	1
1123	2	1
1126	2	1
1128	2	1
1128	8	1
1131	2	1
1131	8	1
1131	6	2
1132	5	2
1132	2	2
1133	2	1
1133	8	2
1133	7	1
1133	6	2
1134	2	1
1134	8	1
1134	7	2
1136	4	1
1136	2	1
1138	4	2
1138	5	1
1138	2	3
1140	8	1
1140	6	1
1142	2	1
1142	8	1
1142	7	1
1142	6	1
1144	2	4
1144	7	2
1144	6	2
1150	2	1
1150	8	1
1150	7	1
1150	6	1
1152	2	1
1152	7	1
1153	4	1
1153	2	1
1155	2	1
1156	4	1
1156	5	2
1156	2	1
1156	8	2
1157	2	1
1157	7	1
1159	8	1
1161	2	1
1161	8	1
1161	6	2
1163	2	2
1163	8	1
1163	7	1
1163	6	2
1164	4	1
1164	2	1
1167	2	2
1167	6	2
1168	4	1
1168	2	1
1170	2	2
1170	7	1
1170	6	1
1172	4	2
1172	5	1
1172	2	2
1172	8	1
1173	1	1
1173	8	1
1173	7	2
1175	4	1
1175	5	1
1175	2	2
1178	1	1
1178	7	1
1179	5	1
1179	2	1
1180	2	1
1180	6	1
1181	4	3
1181	2	3
1183	2	2
1185	2	2
1188	2	4
1188	8	1
1188	7	3
1188	6	2
1189	2	2
1189	6	2
1191	2	1
1193	1	1
1193	2	1
1193	7	2
1194	4	2
1194	2	1
1194	8	1
1197	1	1
1197	2	1
1197	7	1
1197	6	1
1198	4	3
1198	2	2
1198	8	1
1201	1	1
1201	2	1
1201	7	2
1203	2	1
1206	2	1
1206	8	1
1206	7	1
1206	6	1
1208	4	1
1208	1	1
1209	2	1
1209	6	1
1211	1	1
1211	2	1
1211	7	1
1211	6	1
1212	5	1
1212	2	1
1214	2	1
1214	8	1
1214	7	2
1215	5	1
1215	2	1
1218	11	1
\.


--
-- TOC entry 3478 (class 0 OID 33195)
-- Dependencies: 226
-- Data for Name: detalle_venta; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.detalle_venta (cod_item, cod_venta, cantidad_item, cod_producto, item_llevar) FROM stdin;
166	72	1	3	f
167	72	1	4	f
168	72	1	3	t
169	72	1	12	f
170	73	1	3	f
171	73	1	2	f
172	74	3	3	f
173	75	1	5	f
174	75	1	14	f
175	76	2	3	f
176	76	1	4	f
177	76	1	4	t
178	76	2	10	f
179	76	1	7	f
180	76	1	8	f
182	77	1	3	f
183	78	2	3	f
184	78	1	1	f
185	78	1	1	f
186	78	1	3	f
191	79	1	3	f
192	79	3	4	t
193	80	1	3	f
194	81	1	3	f
195	82	1	3	f
196	82	3	4	f
197	82	1	1	f
198	83	1	5	f
199	83	1	14	f
200	84	3	3	f
201	84	1	4	t
202	84	1	11	f
203	84	1	7	f
204	85	4	3	f
205	86	2	3	f
206	86	1	9	f
207	86	1	8	f
208	87	1	6	f
209	87	1	14	f
210	88	1	3	f
218	90	1	3	f
219	90	1	4	f
222	91	1	3	f
224	93	1	3	f
227	96	2	3	f
228	96	1	2	f
229	96	1	1	f
230	97	1	4	f
231	97	1	3	f
232	98	3	4	f
233	98	1	12	f
237	99	1	3	f
238	99	1	4	f
239	99	1	10	f
242	100	1	5	f
243	100	1	12	f
244	101	4	3	f
245	101	1	14	f
246	101	1	3	t
247	102	3	3	f
248	102	2	4	f
249	102	1	14	f
250	102	1	7	f
251	102	1	3	t
252	103	1	3	f
253	103	1	4	f
254	103	1	11	f
257	105	3	3	f
258	105	1	12	f
259	105	1	7	f
260	106	2	4	f
261	107	2	3	f
262	107	1	4	t
263	107	1	10	f
264	108	1	5	f
265	108	1	14	f
266	108	1	8	f
267	108	1	7	f
268	109	3	3	f
269	109	3	1	f
271	110	2	3	f
280	114	1	4	f
282	115	1	3	f
283	116	1	3	f
286	119	1	1	f
287	120	1	3	f
288	121	1	11	f
289	122	1	3	f
299	129	2	3	f
300	129	1	11	f
301	130	1	4	f
302	130	2	3	f
303	130	1	23	f
304	131	4	3	f
305	132	1	4	f
306	132	1	3	f
307	132	1	27	f
310	133	3	4	f
311	133	1	31	f
312	134	4	3	f
313	134	1	33	f
314	135	1	5	f
315	135	1	22	f
316	135	1	8	f
317	136	3	4	f
318	136	1	24	f
319	136	1	3	t
322	138	1	6	f
323	138	1	8	f
324	138	1	7	f
325	138	1	19	f
326	139	1	3	f
327	139	1	1	f
328	140	3	4	f
329	140	1	30	f
330	141	1	4	f
331	141	1	9	f
332	142	3	3	f
333	142	1	12	f
334	143	2	4	f
335	143	2	2	f
336	144	2	3	f
337	144	1	25	f
338	145	4	4	f
339	145	1	34	f
340	145	1	18	f
341	146	1	3	f
342	146	1	4	f
343	146	1	16	f
344	147	1	6	f
345	147	1	21	f
349	148	4	3	f
350	148	2	36	f
351	148	1	12	f
352	149	4	3	f
353	149	2	4	f
354	149	1	22	f
355	150	5	3	f
356	150	4	4	f
357	150	2	23	f
358	150	1	29	f
359	151	3	3	f
360	151	3	37	f
361	152	3	3	f
362	152	1	32	f
363	153	2	4	f
364	153	1	1	f
365	153	1	2	f
366	154	1	6	f
367	155	4	3	f
368	155	2	35	f
369	155	1	18	f
370	156	2	3	f
371	156	1	14	f
372	157	3	4	f
373	157	1	10	f
374	157	1	15	f
375	158	3	3	f
376	158	1	20	f
377	159	4	3	f
378	159	1	17	f
379	160	2	4	f
380	160	1	28	f
381	161	1	5	f
382	161	1	33	f
383	161	1	11	f
384	161	1	3	t
385	162	5	4	f
386	162	1	31	f
387	163	3	3	f
388	163	1	34	f
389	164	2	3	f
390	164	2	4	f
391	164	1	9	f
392	164	1	16	f
393	165	2	3	f
394	165	1	4	f
395	165	1	23	f
396	166	5	3	f
397	166	1	24	f
398	167	2	3	f
399	167	1	9	f
400	168	3	3	f
401	168	1	20	f
402	168	1	7	f
403	169	2	3	f
404	169	3	4	f
405	169	1	29	f
406	170	4	3	f
407	170	1	30	f
408	171	3	4	f
409	171	1	3	f
410	171	1	25	f
411	172	3	4	f
412	172	1	32	f
413	173	3	4	f
414	173	1	23	f
415	174	2	4	f
416	174	1	9	f
417	175	6	3	f
418	176	3	3	f
419	176	1	23	f
420	177	3	3	f
421	177	2	3	t
422	178	3	4	f
423	178	1	22	f
424	179	3	3	f
425	179	1	18	f
426	180	4	4	f
427	180	1	14	f
428	181	4	3	f
429	181	1	19	f
430	182	1	5	f
431	182	1	22	f
432	182	1	7	f
433	182	3	8	f
434	183	3	4	f
435	183	1	19	f
436	184	3	3	f
437	184	2	4	f
438	184	1	20	f
439	185	3	3	f
440	185	1	16	f
443	186	4	3	f
444	186	1	30	f
449	189	20	3	f
450	190	2	4	f
451	190	1	27	f
452	191	2	4	f
453	191	1	3	t
454	191	2	2	f
455	192	2	3	f
456	192	2	38	f
468	204	1	3	f
495	231	2	38	f
499	235	20	4	f
500	235	1	23	f
501	235	1	24	f
502	235	1	25	f
503	235	1	12	f
504	235	5	7	f
505	236	8	4	f
506	236	2	12	f
507	236	3	34	f
508	237	3	3	f
509	237	1	30	f
510	238	10	4	f
511	239	3	6	f
512	239	1	22	f
513	239	1	31	f
514	240	3	3	f
515	240	1	18	f
516	241	4	4	f
517	242	3	3	f
518	242	1	25	f
519	243	3	4	f
520	243	4	3	f
521	244	2	5	f
522	244	1	34	f
523	244	2	35	f
524	244	1	12	f
525	245	3	3	f
526	245	3	4	f
527	245	2	3	t
528	245	1	31	f
529	246	3	3	f
530	246	2	32	f
531	247	5	3	f
532	247	2	33	f
533	248	4	4	f
534	248	2	3	f
535	248	1	21	f
536	249	2	5	f
537	249	1	30	f
538	249	1	22	f
539	250	10	4	f
540	251	3	3	f
541	251	1	18	f
542	252	3	4	f
543	252	2	3	f
544	252	1	23	f
545	253	2	6	f
546	253	1	22	f
547	253	1	29	f
548	253	2	8	f
549	254	5	4	f
550	254	2	33	f
551	255	3	4	f
552	255	1	31	f
553	256	3	4	f
554	256	1	18	f
555	257	3	3	f
556	257	2	4	f
557	257	1	19	f
558	257	1	32	f
559	258	2	4	f
560	258	1	10	f
561	259	3	3	f
562	259	1	24	f
563	260	6	3	f
564	260	1	23	f
565	260	1	24	f
566	261	1	5	f
567	261	1	30	f
568	262	15	3	f
569	262	3	33	f
570	262	2	24	f
571	263	3	4	f
572	263	1	3	f
573	263	1	25	f
574	264	4	3	f
575	264	1	4	f
576	264	1	31	f
577	265	3	3	f
578	265	1	17	f
582	266	5	4	f
583	266	1	34	f
584	266	1	35	f
588	268	2	4	f
589	268	2	3	f
590	268	1	19	f
591	267	4	4	f
592	267	1	10	f
593	267	1	11	f
594	269	4	5	f
595	269	2	23	f
596	269	1	24	f
597	269	4	7	f
602	271	2	3	f
603	271	2	1	f
604	272	5	4	f
605	272	5	7	f
606	272	1	29	f
607	273	5	3	f
608	273	4	4	f
609	273	3	3	t
610	273	1	22	f
611	274	4	4	f
612	274	1	31	f
613	275	3	4	f
614	275	3	3	f
615	275	1	33	f
616	275	1	32	f
617	276	4	3	f
618	276	1	20	f
619	276	1	8	f
620	277	1	5	f
621	277	2	4	t
622	277	1	7	f
623	277	1	30	f
624	278	2	4	f
625	278	1	10	f
626	279	3	3	f
627	279	1	12	f
628	280	2	4	f
629	280	2	1	f
632	281	1	4	f
633	281	1	2	f
634	282	3	3	f
635	282	1	4	f
636	282	1	30	f
637	283	1	5	f
638	283	3	36	f
639	284	3	3	f
640	284	3	4	f
641	284	1	20	f
642	285	2	3	f
643	285	1	13	f
644	286	1	4	f
645	286	1	26	f
646	287	2	4	f
647	287	1	28	f
648	288	2	4	f
649	288	1	28	f
650	289	5	3	f
651	289	1	29	f
652	290	2	3	f
653	290	1	4	f
654	290	1	3	t
655	290	1	22	f
656	290	1	7	f
657	291	2	3	f
658	291	1	14	f
659	292	3	4	f
660	292	1	28	f
661	293	1	5	f
662	293	2	34	f
663	293	2	8	f
664	294	2	3	f
665	294	1	23	f
666	295	7	3	f
667	295	1	12	f
668	295	1	14	f
669	296	2	4	f
670	297	3	3	f
671	297	1	14	f
672	298	6	4	f
673	298	3	36	f
674	299	1	5	f
675	299	1	22	f
676	300	5	3	f
677	300	2	19	f
678	301	4	3	f
679	301	2	4	t
680	301	1	33	f
681	302	3	4	f
682	302	1	12	f
683	303	4	3	f
684	303	1	22	f
685	304	3	3	f
686	304	1	20	f
687	305	2	6	f
688	305	2	32	f
689	305	1	7	f
690	306	4	3	f
691	306	3	28	f
692	307	3	4	f
693	308	4	3	f
694	308	2	4	t
695	308	1	23	f
696	309	4	3	f
697	309	1	18	f
698	310	10	3	f
699	311	5	4	f
700	311	1	30	f
701	311	3	7	f
702	312	50	10	f
703	312	50	11	f
704	312	50	17	f
705	312	50	28	f
706	312	50	32	f
707	313	70	1	f
708	313	70	2	f
709	313	70	15	f
710	313	70	26	f
711	314	85	9	f
712	314	85	13	f
713	314	85	16	f
714	314	85	27	f
715	315	85	18	f
716	315	85	19	f
717	315	85	20	f
726	316	83	12	f
727	316	84	14	f
728	316	82	21	f
729	316	80	23	f
730	316	83	24	f
731	316	80	25	f
732	316	82	29	f
733	316	82	33	f
736	319	100	7	f
737	320	30	7	f
738	321	80	22	f
739	321	80	31	f
740	321	85	30	f
741	321	10	33	f
742	322	29	34	f
743	322	30	35	f
744	322	30	36	f
745	322	32	37	f
746	323	3	3	f
747	323	1	19	f
748	324	2	4	f
749	324	1	3	f
750	324	1	18	f
751	325	2	6	f
752	325	1	31	f
753	326	4	3	f
754	326	2	34	f
755	327	1	3	f
756	327	1	10	f
757	328	1	5	f
758	329	5	3	f
759	329	1	12	f
760	330	4	3	f
761	330	1	4	f
762	330	1	20	f
763	331	2	3	f
764	331	2	15	f
765	332	2	3	f
766	332	1	28	f
767	333	3	4	f
768	333	1	32	f
769	334	1	4	f
770	334	1	3	f
771	334	1	13	f
772	335	1	3	f
773	335	1	1	f
774	336	2	4	f
775	336	1	32	f
776	337	1	6	f
777	337	1	14	f
778	337	1	7	f
779	338	2	3	f
780	338	1	11	f
781	339	2	4	f
782	339	1	27	f
783	340	2	4	f
784	340	1	10	f
785	341	1	5	f
786	341	1	24	f
787	342	1	3	f
788	343	2	4	f
789	343	1	10	f
790	344	3	3	f
791	344	1	9	f
792	345	1	4	f
793	345	2	3	f
794	345	1	11	f
795	346	2	4	f
796	346	1	10	f
797	347	2	4	f
798	347	1	12	f
799	348	1	5	f
800	348	1	22	f
801	349	4	3	f
802	349	1	30	f
803	350	4	4	f
804	350	2	34	f
805	351	3	3	f
806	351	1	30	f
807	352	5	3	f
810	353	1	5	f
811	353	1	33	f
814	355	1	5	f
815	355	1	22	f
816	356	2	4	f
817	356	1	11	f
818	357	1	3	f
819	358	2	4	f
820	359	1	5	f
821	359	1	30	f
822	360	3	3	f
823	360	1	18	f
824	361	3	4	f
825	361	1	10	f
826	362	1	5	f
827	362	1	31	f
828	363	3	3	f
829	363	1	18	f
830	364	2	3	f
831	364	2	4	f
832	364	1	23	f
833	365	2	3	f
834	365	1	2	f
835	366	1	5	f
836	367	2	4	f
837	367	1	32	f
838	368	2	4	f
839	368	1	16	f
840	369	2	3	f
841	369	1	4	f
842	369	1	12	f
843	370	2	3	f
844	370	2	1	f
845	371	3	6	f
846	371	2	22	f
847	371	2	8	f
848	372	2	4	f
849	372	1	3	f
850	372	1	10	f
851	373	4	3	f
852	373	1	25	f
853	373	1	7	f
854	374	1	6	f
855	374	1	13	f
856	375	2	3	f
857	375	1	8	f
858	376	1	3	f
859	376	2	4	f
860	376	1	3	f
861	376	3	1	f
862	377	6	4	f
863	377	1	35	f
864	377	1	11	f
865	378	3	3	f
866	378	3	4	f
867	378	1	10	f
868	378	1	8	f
869	379	1	3	f
870	380	1	6	f
871	380	1	5	f
872	380	1	22	f
873	381	2	3	f
874	382	4	3	f
875	382	1	10	f
876	382	1	30	f
877	383	3	4	f
878	383	1	29	f
879	384	2	4	f
880	384	1	3	f
881	385	1	3	f
882	385	3	4	f
883	385	1	25	f
884	386	1	6	f
885	386	2	4	f
886	386	1	8	f
887	387	1	4	f
888	387	1	3	f
889	387	1	16	f
890	388	1	4	f
891	388	1	8	f
892	388	1	1	f
893	389	2	4	f
894	389	1	3	f
895	389	1	20	f
896	390	1	3	f
897	390	2	4	f
898	391	4	4	f
899	391	1	20	f
900	392	6	3	f
901	392	2	32	f
902	393	2	5	f
903	393	1	22	f
904	393	2	7	f
905	393	1	8	f
906	394	1	3	f
907	394	2	3	t
908	395	3	3	f
909	395	1	24	f
910	396	3	4	f
911	396	7	3	f
912	396	2	8	f
913	396	2	7	f
914	397	1	6	f
915	397	1	16	f
916	398	2	3	f
917	398	2	4	f
918	398	1	32	f
919	399	3	3	f
920	399	1	16	f
921	400	1	3	f
922	400	1	4	f
923	400	1	17	f
924	401	1	4	f
925	401	4	3	f
926	402	1	5	f
927	403	2	3	f
928	403	1	4	f
929	403	1	25	f
935	405	1	39	f
936	405	1	11	f
937	404	5	3	f
938	404	1	4	f
939	404	1	31	f
940	406	2	3	f
941	406	2	4	f
942	406	1	17	f
943	407	1	5	f
944	407	1	6	f
945	407	2	29	f
946	408	3	40	f
947	408	1	16	f
948	408	1	21	f
949	409	2	3	f
950	409	2	4	f
951	409	1	7	f
952	410	2	3	f
953	410	2	4	f
954	410	2	3	t
955	410	2	4	t
956	410	1	7	f
957	410	1	8	f
958	410	1	11	f
959	410	1	12	f
960	410	1	34	f
964	412	2	3	f
965	412	2	4	f
966	412	2	3	t
967	412	1	14	f
968	413	4	3	f
969	413	1	4	t
970	413	1	30	f
971	413	1	7	f
972	414	1	5	f
973	415	1	3	f
974	415	1	4	f
975	415	1	13	f
978	417	3	3	f
979	417	2	4	f
980	417	1	10	f
981	416	1	3	f
982	416	2	4	f
983	418	2	3	f
984	418	3	4	f
985	418	1	14	f
992	419	1	3	f
997	420	1	3	f
1004	421	1	3	f
1005	421	1	4	t
1010	423	2	3	f
1011	424	2	3	f
1012	424	1	4	f
1013	425	2	3	f
1014	425	1	32	f
1015	426	3	4	f
1016	426	1	4	t
1017	426	1	20	f
1018	427	2	3	f
1019	427	2	4	f
1020	427	1	7	f
1021	427	1	8	f
1022	427	1	31	f
1023	428	2	3	f
1024	428	3	4	f
1025	429	1	5	f
1026	429	1	6	f
1027	429	1	25	f
1028	429	1	29	f
1029	429	2	7	f
1030	430	7	3	f
1031	430	1	22	f
1032	430	2	34	f
1037	431	2	3	f
1038	431	2	4	f
1039	431	1	7	f
1040	431	1	23	f
1045	433	3	3	f
1046	433	2	4	f
1047	434	3	3	f
1048	434	1	4	f
1049	434	1	3	t
1050	434	2	10	f
1051	435	1	5	f
1052	435	1	7	f
1053	435	1	31	f
1054	436	3	3	f
1055	436	2	8	f
1056	436	1	19	f
1057	437	2	6	f
1058	437	1	34	f
1059	437	1	11	f
1060	432	2	3	f
1061	432	2	4	f
1062	432	1	30	f
1063	432	1	7	f
1064	438	1	3	f
1065	438	2	4	f
1066	438	1	10	f
1067	439	3	3	f
1068	439	1	4	t
1069	439	1	19	f
1070	439	1	7	f
1071	440	1	3	f
1072	440	1	2	f
1073	441	1	4	f
1074	441	1	9	f
1075	442	2	3	f
1076	442	1	28	f
1077	443	1	5	f
1078	444	1	3	f
1079	444	1	16	f
1080	445	1	4	f
1081	445	1	3	f
1082	445	1	13	f
1085	446	2	3	f
1086	446	1	32	f
1088	448	1	3	f
1089	449	3	3	f
1090	450	1	4	f
1091	450	1	32	f
1092	451	2	4	f
1093	452	2	3	f
1095	453	1	6	f
1097	454	1	3	f
1100	455	1	3	f
1102	456	1	3	f
1109	459	1	3	f
1111	460	1	3	f
1113	461	1	3	f
1115	462	1	3	f
1117	463	1	3	f
1118	464	3	5	f
1119	465	1	5	f
1120	466	1	3	f
1121	466	1	17	f
1122	467	4	3	f
1123	467	1	4	t
1124	467	1	23	f
1125	467	1	7	f
1126	468	1	5	f
1127	468	1	34	f
1128	469	2	6	f
1129	469	2	32	f
1130	469	2	8	f
1131	470	2	3	f
1132	470	2	4	f
1133	471	3	3	f
1134	472	2	3	f
1135	472	1	24	f
1136	473	1	4	f
1137	473	1	13	f
1138	474	3	4	f
1139	474	1	22	f
1140	475	1	3	f
1141	475	1	26	f
1142	476	2	3	f
1143	476	1	17	f
1144	477	4	3	f
1145	477	1	7	f
1146	477	1	20	f
1150	480	2	3	f
1151	480	1	11	f
1152	481	1	3	f
1153	481	1	4	f
1154	481	1	28	f
1155	482	1	5	f
1156	483	3	4	f
1157	484	1	3	f
1158	484	1	15	f
1159	485	1	6	f
1160	485	1	19	f
1161	486	2	3	f
1162	486	1	32	f
1163	487	3	3	f
1164	487	1	4	t
1165	487	1	23	f
1166	487	1	8	f
1167	488	2	3	f
1168	489	1	4	f
1169	489	1	13	f
1170	490	2	3	f
1171	490	1	17	f
1172	491	3	4	f
1173	492	2	3	f
1174	492	1	25	f
1175	493	2	4	f
1176	493	1	37	f
1177	493	1	7	f
1178	494	1	3	f
1179	494	1	4	f
1180	495	1	3	f
1181	496	3	4	f
1182	496	1	11	f
1183	497	2	6	f
1184	497	1	31	f
1185	498	2	6	f
1186	498	3	8	f
1187	498	1	22	f
1188	499	5	3	f
1189	500	2	3	f
1190	500	1	10	f
1191	501	1	5	f
1192	501	1	30	f
1193	502	2	3	f
1194	502	2	4	t
1195	502	1	8	f
1196	502	1	33	f
1197	503	2	3	f
1198	503	3	4	f
1199	503	1	7	f
1200	503	1	8	f
1201	504	2	3	f
1202	504	1	28	f
1203	505	1	5	f
1204	505	1	7	f
1205	505	1	12	f
1206	506	2	3	f
1207	506	1	16	f
1208	507	1	4	f
1209	507	1	3	f
1210	507	1	10	f
1211	508	2	3	f
1212	508	1	4	f
1213	508	1	18	f
1214	509	2	3	f
1215	509	1	4	t
1216	509	1	27	f
1218	511	1	42	f
\.


--
-- TOC entry 3470 (class 0 OID 32918)
-- Dependencies: 218
-- Data for Name: insumo; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.insumo (cod_insumo, nombre, medida, descripcion, existencia, estado, minimo) FROM stdin;
11	Fanta 1Lt	1	Fanta de 1 Litro	34.00	0	10.00
33	Huari 1Lt	1	Huari de 1 Litro	41.00	0	10.00
6	Coca 1lt	1	Coca cola de 1 litro	47.00	0	1.00
24	Salvietti 2.5 Lt	1	Salvietti de 2.5 Litros	-1.00	0	10.00
25	Salvietti 3Lt	1	Salvietti de 3 Litros	8.00	0	10.00
35	Quilmes 1Lt	1	Quilmes de 1 Litro	19.00	0	10.00
16	Sprite 2Lt	1	Sprite de 2 Litros	15.00	0	10.00
29	Coca 3Lt	1	Coca cola de 3 Litros	27.00	0	10.00
8	Fanta personal	1	Fanta personal	22.00	0	10.00
5	Coca 600ml	1	Coca Cola de 600 mililitros	18.00	0	10.00
31	Jugo del Valle 2Lt	1	Juego del valle de 2 Litros	32.00	0	10.00
36	pepsi	1	pepsi	7.00	1	10.00
32	Paceña 1Lt	1	Paceña de 1 Litro	15.00	0	10.00
13	Sprite personal	1	Sprite personal	26.00	0	10.00
27	Fanta 1.5 Lt	1	Fanta de 1.5 Litros	4.00	0	10.00
22	Salvietti 1 Lt	1	Salvietti de 1 Litro	39.00	0	10.00
7	Coca 2lt	1	Coca cola de 2litros	30.00	0	10.00
30	Jugo del valle 1Lt	1	Jugo del Valle de 1 Litro	30.00	0	10.00
18	Simba Manzana 2Lt	1	Simba manzana de 2 Litros	3.00	0	10.00
14	Sprite 600ml	1	Sprite de 600 mililitros	5.00	0	10.00
17	Simba Piña 2lt	1	Simba sabor Piña de 2 Litros	6.00	0	10.00
9	Fanta 600ml	1	Fanta de 1 litro	8.00	0	10.00
26	Coca 1.5 Lt	1	Coca cola de 1.5 Litros	31.00	0	10.00
15	Sprite 1lt	1	Sprite de 1 Litro	43.00	0	10.00
2	Arroz Siglo de Oro	2	Arroz Siglo de Oro 1kg/bolsa 	90.20	0	10.00
21	Sallvietti 600ml	1	Salvietti de 600 mililitros	11.00	0	10.00
23	Salvietti 2Lt	1	Salvietti de 2 Litros	9.00	0	10.00
37	Carne 	2	Carne por kilogramo	17.80	0	10.00
19	Simba durazno 2Lt	1	Simba durazno de 2 Litros	10.00	0	10.00
20	Salvietti Personal	1	Salvietti personal	28.00	0	10.00
38	QUESO	2	Queso cheddar	7.95	0	5.00
3	Papa	2	Bolsa de papa 30kg/bolsa	84.40	0	10.00
34	Huari personal	1	Huari personal	4.00	0	10.00
10	Fanta 2lt	1	Fanta de 2 litros	8.00	0	10.00
28	Sprite 1.5 Lt	1	Sprite de 1.5 Litros	4.00	0	10.00
1	Pollo	1	Pollos Enteros	15.30	0	10.00
41	Pan de hamburguesa	1	Pan para hamburguesa	49.00	0	10.00
4	Coca personal	1	Coca Cola Personal	35.00	0	10.00
39	Agua Cascada 2lt	1	Agua Cascada de 2tl	90.00	0	5.00
40	Yuca	2	Yuca por Kilogramo	20.00	0	1.00
\.


--
-- TOC entry 3474 (class 0 OID 33018)
-- Dependencies: 222
-- Data for Name: insumo_opcion; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.insumo_opcion (cod_insumo, cod_opcion, cantidad) FROM stdin;
2	1	0.5000
2	10	0.4000
40	12	0.2000
3	9	0.2000
3	8	0.3000
2	8	0.2000
3	2	0.5000
3	11	0.2000
\.


--
-- TOC entry 3479 (class 0 OID 57834)
-- Dependencies: 227
-- Data for Name: insumo_producto; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.insumo_producto (cod_insumo, cantidad, cod_producto) FROM stdin;
32	1.0000	34
33	1.0000	35
35	1.0000	36
34	1.0000	37
1	1.0000	5
2	0.5000	8
3	0.5000	7
36	1.0000	38
1	0.2000	3
1	0.2500	4
37	1.0000	39
4	1.0000	1
41	1.0000	42
37	0.2000	42
38	0.0500	42
8	1.0000	2
13	1.0000	15
5	1.0000	9
9	1.0000	13
14	1.0000	16
11	1.0000	10
6	1.0000	11
15	1.0000	17
26	1.0000	18
27	1.0000	19
28	1.0000	20
7	1.0000	12
10	1.0000	14
16	1.0000	21
29	1.0000	22
18	1.0000	23
17	1.0000	24
19	1.0000	25
20	1.0000	26
21	1.0000	27
22	1.0000	28
23	1.0000	29
24	1.0000	30
25	1.0000	31
30	1.0000	32
31	1.0000	33
\.


--
-- TOC entry 3475 (class 0 OID 33132)
-- Dependencies: 223
-- Data for Name: movimiento_insumo; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.movimiento_insumo (cod_mov, movimiento, precio, ps_precio, tipo_cambio, descripcion, fecha, hora, ci_usuario, origen, cod_venta) FROM stdin;
14	1	0.00	0.00	\N	Compra de Sprite de personal a EMBOL	08/12/2024	17:30	8540205	0	\N
15	1	0.00	0.00	\N	Compra de sprite de 1Lt a EMBOL	08/12/2024	17:32	8540205	0	\N
16	1	0.00	0.00	\N	Compra de Sprite de 2Lt a EMBOL	08/12/2024	17:33	8540205	0	\N
17	1	900.00	0.00	\N	Compra de Simba piña de 2Lt a EMBOL	08/12/2024	17:37	8540205	0	\N
18	1	0.00	0.00	\N	Compra de Simba manzana de 2Lt a EMBOL	08/12/2024	17:39	8540205	0	\N
19	1	0.00	0.00	\N	Compra de simba durazno de 2Lt a EMBOL	08/12/2024	17:40	8540205	0	\N
20	1	0.00	0.00	\N	Compra de Salvietti personal a EMBOL	08/12/2024	17:42	8540205	0	\N
21	1	0.00	0.00	\N	Compra de Salvietti de 600ml a EMBOL	08/12/2024	17:45	8540205	0	\N
22	1	0.00	0.00	\N	Compra de Salvietti de 1 Lt a EMBOL	08/12/2024	17:46	8540205	0	\N
23	1	0.00	0.00	\N	Compra de Salvietti de 2Lt a EMBOL	08/12/2024	17:47	8540205	0	\N
24	1	0.00	0.00	\N	Compra de Salvietti de 2.5 Lt a EMBOL	08/12/2024	17:50	8540205	0	\N
25	1	0.00	0.00	\N	Compra de Salvietti de 3Lt a EMBOL	08/12/2024	17:52	8540205	0	\N
26	1	0.00	0.00	\N	Compra de Coca Cola de 1.5Lt a EMBOL	08/12/2024	17:53	8540205	0	\N
27	1	0.00	0.00	\N	Compra de fanta de 1.5Lt a EMBOL	08/12/2024	17:53	8540205	0	\N
28	1	0.00	0.00	\N	Compra de Sprite de 1.5Lt a EMBOL	08/12/2024	17:56	8540205	0	\N
29	1	0.00	0.00	\N	Compra de Coca cola de 3Lt a EMBOL	08/12/2024	17:58	8540205	0	\N
30	1	1100.00	0.00	\N	Compra de Jugo del valle de 1Lt a El Valle	08/12/2024	18:01	8540205	0	\N
31	1	0.00	0.00	\N	Compra jugo del valle de 2Lt a El Valle	08/12/2024	18:02	8540205	0	\N
32	1	0.00	0.00	\N	Compra de Paceña de 1 Litro a CBN	08/12/2024	18:04	8540205	0	\N
33	1	0.00	0.00	\N	Compra de Huari de 1Lt a Huari	08/12/2024	18:05	8540205	0	\N
34	1	0.00	0.00	\N	Compra de Huari personal a HUARI	08/12/2024	18:06	8540205	0	\N
40	2	32.00	0.00	\N	Venta Regular (131)	09/12/2024	14:30	8540205	1	131
7	1	1000.00	0.00	\N	Compra de coca cola de 2lt a EMBOL	07/12/2024	20:23	8540205	0	\N
41	2	20.75	0.00	\N	Venta Regular (132)	09/12/2024	14:31	8540205	1	132
42	2	41.25	0.00	\N	Venta Regular (133)	09/12/2024	14:38	8540205	1	133
43	2	47.00	0.00	\N	Venta Regular (134)	09/12/2024	14:55	8540205	1	134
37	1	0.00	0.00	0.01000	Compra de Quilmes de 1Lt	08/12/2024	18:54	8540205	0	\N
8	1	0.00	0.00	\N	Compra de fanta personal a EMBOL	07/12/2024	20:26	8540205	0	\N
9	1	0.00	0.00	\N	Compra de fanta de 1Lt a EMBOL	07/12/2024	20:26	8540205	0	\N
10	1	0.00	0.00	\N	Compra de fanta de 2Lt a EMBOL	07/12/2024	20:27	8540205	0	\N
44	2	43.00	0.00	\N	Venta Regular (135)	09/12/2024	15:00	8540205	1	135
11	1	0.00	0.00	\N	Compra de fanta de 1Lt a EMBOL	07/12/2024	20:28	8540205	0	\N
12	1	0.00	0.00	\N	Compra de fanta 2lt a EMBOL	08/12/2024	17:27	8540205	0	\N
13	1	200.00	0.00	\N	Compra de fanta de 2Lt a EMBOL	08/12/2024	17:29	8540205	0	\N
45	2	43.25	0.00	\N	Venta Regular (136)	09/12/2024	15:08	8540205	1	136
38	2	24.00	0.00	\N	Venta Regular (129)	09/12/2024	14:26	8540205	1	129
39	2	33.75	0.00	\N	Venta Regular (130)	09/12/2024	14:28	8540205	1	130
46	2	27.00	0.00	\N	Venta Regular (138)	09/12/2024	15:31	8540205	1	138
1	1	0.00	0.00	\N	Compra de pollo Tarijeño 	07/12/2024	20:10	8540205	0	\N
2	1	0.00	0.00	\N	Compra de Arroz de Juan Mendez	07/12/2024	20:15	8540205	0	\N
3	1	0.00	0.00	\N	Compra de Arroz a Julia Zambrana	07/12/2024	20:16	8540205	0	\N
4	1	0.00	0.00	\N	Compra de Coca Cola personal a EMBOL	07/12/2024	20:20	8540205	0	\N
5	1	0.00	0.00	\N	Compra de Coca cola de 600ml a EMBOL	07/12/2024	20:20	8540205	0	\N
6	1	0.00	0.00	\N	Compra de coca cola de 1lt a EMBOL	07/12/2024	20:22	8540205	0	\N
47	2	10.00	0.00	\N	Venta Regular (139)	09/12/2024	15:49	8540205	1	139
48	2	38.25	0.00	\N	Venta Regular (140)	09/12/2024	15:52	8540205	1	140
49	2	12.75	0.00	\N	Venta Regular (141)	09/12/2024	16:11	8540205	1	141
50	2	34.00	0.00	\N	Venta Regular (142)	09/12/2024	16:12	8540205	1	142
51	2	21.50	0.00	\N	Venta Regular (143)	09/12/2024	16:29	8540205	1	143
52	2	25.00	0.00	\N	Venta Regular (144)	09/12/2024	16:30	8540205	1	144
53	2	67.00	0.00	\N	Venta Regular (145)	09/12/2024	16:32	8540205	1	145
54	2	18.75	0.00	\N	Venta Regular (146)	09/12/2024	19:08	8540205	1	146
55	2	1000.00	0.00	\N	Eliminacion de insumo	09/12/2024	19:12	8540205	0	\N
56	2	15.00	0.00	\N	Venta Regular (147)	09/12/2024	19:13	8540205	1	147
57	2	78.00	0.00	\N	Venta Regular (148)	09/12/2024	19:20	8540205	1	148
58	2	67.50	0.00	\N	Venta Regular (149)	09/12/2024	20:03	8540205	1	149
59	2	103.00	0.00	\N	Venta Regular (150)	09/12/2024	20:14	8540205	1	150
60	2	54.00	0.00	\N	Venta Regular (151)	09/12/2024	20:18	8540205	1	151
61	2	35.00	0.00	\N	Venta Regular (152)	09/12/2024	20:27	8540205	1	152
62	2	21.50	0.00	\N	Venta Regular (153)	09/12/2024	20:33	8540205	1	153
63	2	0.00	0.00	\N	Venta Regular (154)	09/12/2024	20:34	8540205	1	154
64	2	83.60	0.00	\N	Venta Regular (155)	09/12/2024	20:35	8540205	1	155
65	2	26.00	0.00	\N	Venta Regular (156)	09/12/2024	20:39	8540205	1	156
66	2	36.25	0.00	\N	Venta Regular (157)	09/12/2024	20:41	8540205	1	157
67	2	36.00	0.00	\N	Venta Regular (158)	09/12/2024	20:43	8540205	1	158
68	2	40.00	0.00	\N	Venta Regular (159)	09/12/2024	20:46	8540205	1	159
69	2	25.50	0.00	\N	Venta Regular (160)	09/12/2024	20:47	8540205	1	160
70	2	51.00	0.00	\N	Venta Regular (161)	09/12/2024	20:57	8540205	1	161
71	2	58.75	0.00	\N	Venta Regular (162)	09/12/2024	21:01	8540205	1	162
72	2	44.00	0.00	\N	Venta Regular (163)	09/12/2024	21:04	8540205	1	163
73	2	39.50	0.00	\N	Venta Regular (164)	09/12/2024	21:05	8540205	1	164
74	2	33.75	0.00	\N	Venta Regular (165)	09/12/2024	21:06	8540205	1	165
75	2	44.00	0.00	\N	Venta Regular (166)	09/12/2024	21:07	8540205	1	166
76	2	20.00	0.00	\N	Venta Regular (167)	09/12/2024	21:09	8540205	1	167
77	2	41.00	0.00	\N	Venta Regular (168)	09/12/2024	21:10	8540205	1	168
78	2	52.25	0.00	\N	Venta Regular (169)	09/12/2024	21:19	8540205	1	169
79	2	44.00	0.00	\N	Venta Regular (170)	09/12/2024	21:19	8540205	1	170
80	2	43.25	0.00	\N	Venta Regular (171)	09/12/2024	21:20	8540205	1	171
81	2	37.25	0.00	\N	Venta Regular (172)	09/12/2024	21:21	8540205	1	172
82	2	35.25	0.00	\N	Venta Regular (173)	09/12/2024	21:22	8540205	1	173
83	2	21.50	0.00	\N	Venta Regular (174)	09/12/2024	21:22	8540205	1	174
84	2	48.00	0.00	\N	Venta Regular (175)	09/12/2024	21:23	8540205	1	175
85	2	33.00	0.00	\N	Venta Regular (176)	09/12/2024	21:24	8540205	1	176
86	2	40.00	0.00	\N	Venta Regular (177)	09/12/2024	21:25	8540205	1	177
87	2	44.25	0.00	\N	Venta Regular (178)	09/12/2024	21:30	8540205	1	178
88	2	36.00	0.00	\N	Venta Regular (179)	09/12/2024	21:30	8540205	1	179
89	2	45.00	0.00	\N	Venta Regular (180)	09/12/2024	21:32	8540205	1	180
90	2	44.00	0.00	\N	Venta Regular (181)	09/12/2024	21:33	8540205	1	181
91	2	58.00	0.00	\N	Venta Regular (182)	09/12/2024	21:34	8540205	1	182
92	2	38.25	0.00	\N	Venta Regular (183)	09/12/2024	21:37	8540205	1	183
93	2	53.50	0.00	\N	Venta Regular (184)	09/12/2024	21:39	8540205	1	184
94	2	26.00	0.00	\N	Venta Regular (185)	09/12/2024	21:40	8540205	1	185
95	2	39.00	0.00	\N	Venta Regular (186)	09/12/2024	21:45	8540205	1	186
125	2	31.00	0.00	\N	Venta Regular (251)	12/12/2024	19:26	8540205	1	251
107	1	60.00	0.00	\N	Compra pepsi	11/12/2024	10:55	8540205	0	\N
108	3	12.00	0.00	\N	Se rompio 2 botellas de pepsi	11/12/2024	10:57	8540205	0	\N
96	2	60.00	0.00	\N	Venta Regular (189)	10/12/2024	18:23	8540205	1	189
97	2	21.50	0.00	\N	Venta Regular (190)	10/12/2024	18:41	1111	1	190
98	2	29.50	0.00	\N	Venta Regular (191)	10/12/2024	18:53	1111	1	191
99	1	0.00	0.00	\N	Compra de 2 Maltines	10/12/2024	18:58	8540205	0	\N
100	2	26.00	0.00	\N	Venta Regular (192)	10/12/2024	18:59	8540205	1	192
109	2	237.00	0.00	\N	Venta Regular (235)	12/12/2024	19:05	8540205	1	235
110	2	150.00	0.00	\N	Venta Regular (236)	12/12/2024	19:07	8540205	1	236
111	2	36.00	0.00	\N	Venta Regular (237)	12/12/2024	19:08	8540205	1	237
101	2	3.00	0.00	\N	Venta Regular (204)	10/12/2024	21:15	8540205	1	204
112	2	87.50	0.00	\N	Venta Regular (238)	12/12/2024	19:09	8540205	1	238
113	2	33.00	0.00	\N	Venta Regular (239)	12/12/2024	19:09	8540205	1	239
114	2	36.00	0.00	\N	Venta Regular (240)	12/12/2024	19:10	8540205	1	240
115	2	35.00	0.00	\N	Venta Regular (241)	12/12/2024	19:10	8540205	1	241
116	2	33.00	0.00	\N	Venta Regular (242)	12/12/2024	19:11	8540205	1	242
117	2	58.25	0.00	\N	Venta Regular (243)	12/12/2024	19:11	8540205	1	243
103	1	0.00	0.00	\N	compra	10/12/2024	23:24	8540205	0	\N
118	2	109.60	0.00	\N	Venta Regular (244)	12/12/2024	19:12	8540205	1	244
119	2	81.25	0.00	\N	Venta Regular (245)	12/12/2024	19:13	8540205	1	245
120	2	46.00	0.00	\N	Venta Regular (246)	12/12/2024	19:16	8540205	1	246
121	2	70.00	0.00	\N	Venta Regular (247)	12/12/2024	19:18	8540205	1	247
122	2	61.00	0.00	\N	Venta Regular (248)	12/12/2024	19:23	8540205	1	248
123	2	70.00	0.00	\N	Venta Regular (249)	12/12/2024	19:23	8540205	1	249
124	2	87.50	0.00	\N	Venta Regular (250)	12/12/2024	19:24	8540205	1	250
126	2	51.25	0.00	\N	Venta Regular (252)	12/12/2024	19:28	8540205	1	252
127	2	48.00	0.00	\N	Venta Regular (253)	12/12/2024	19:29	8540205	1	253
128	2	73.75	0.00	\N	Venta Regular (254)	12/12/2024	19:30	8540205	1	254
129	2	41.25	0.00	\N	Venta Regular (255)	12/12/2024	19:31	8540205	1	255
130	2	38.25	0.00	\N	Venta Regular (256)	12/12/2024	19:33	8540205	1	256
131	2	64.50	0.00	\N	Venta Regular (257)	12/12/2024	19:41	8540205	1	257
104	2	10.00	0.00	\N	Venta Regular (231)	11/12/2024	10:39	8540205	1	231
132	2	25.50	0.00	\N	Venta Regular (258)	12/12/2024	19:42	8540205	1	258
133	2	33.00	0.00	\N	Venta Regular (259)	12/12/2024	19:43	8540205	1	259
134	2	66.00	0.00	\N	Venta Regular (260)	12/12/2024	19:45	8540205	1	260
135	2	32.00	0.00	\N	Venta Regular (261)	12/12/2024	19:45	8540205	1	261
136	2	183.00	0.00	\N	Venta Regular (262)	12/12/2024	19:50	8540205	1	262
137	2	43.25	0.00	\N	Venta Regular (263)	12/12/2024	19:52	8540205	1	263
138	2	55.75	0.00	\N	Venta Regular (264)	12/12/2024	19:53	8540205	1	264
139	2	32.00	0.00	\N	Venta Regular (265)	12/12/2024	19:55	8540205	1	265
140	2	83.55	0.00	\N	Venta Regular (266)	12/12/2024	19:56	8540205	1	266
141	2	51.00	0.00	\N	Venta Regular (267)	12/12/2024	20:18	8540205	1	267
142	2	45.50	0.00	\N	Venta Regular (268)	12/12/2024	20:19	8540205	1	268
143	2	127.00	0.00	\N	Venta Regular (269)	12/12/2024	20:21	8540205	1	269
144	2	20.00	0.00	\N	Venta Regular (271)	12/12/2024	20:22	8540205	1	271
145	1	160.00	0.00	\N	Compra de Pollo Cochabambino de Pollos Ayelen	12/12/2024	20:26	8540205	0	\N
146	2	80.00	0.00	\N	Venta Regular (272)	12/12/2024	20:28	8540205	1	272
147	2	119.60	0.00	\N	Venta Regular (273)	12/12/2024	20:29	8540205	1	273
148	2	51.00	0.00	\N	Venta Regular (274)	12/12/2024	23:02	8540205	1	274
149	2	77.60	0.00	\N	Venta Regular (275)	12/12/2024	23:03	8540205	1	275
150	2	49.80	0.00	\N	Venta Regular (276)	12/12/2024	23:04	8540205	1	276
151	2	56.00	0.00	\N	Venta Regular (277)	12/12/2024	23:05	8540205	1	277
152	2	26.00	0.00	\N	Venta Regular (278)	12/12/2024	23:06	8540205	1	278
153	2	34.60	0.00	\N	Venta Regular (279)	12/12/2024	23:06	8540205	1	279
154	2	22.00	0.00	\N	Venta Regular (280)	12/12/2024	23:14	8540205	1	280
155	2	11.00	0.00	\N	Venta Regular (281)	12/12/2024	23:15	8540205	1	281
156	2	45.60	0.00	\N	Venta Regular (282)	12/12/2024	23:16	8540205	1	282
157	2	75.00	0.00	\N	Venta Regular (283)	12/12/2024	23:16	8540205	1	283
158	2	63.60	0.00	\N	Venta Regular (284)	13/12/2024	10:17	8540205	1	284
159	1	320.00	0.00	\N	Compra de pollo de Avícola Andaluz	13/12/2024	10:19	8540205	0	\N
160	2	20.40	0.00	\N	Venta Regular (285)	13/12/2024	10:19	8540205	1	285
161	2	11.00	0.00	\N	Venta Regular (286)	13/12/2024	10:21	8540205	1	286
162	2	26.00	0.00	\N	Venta Regular (287)	13/12/2024	10:21	8540205	1	287
163	2	26.00	0.00	\N	Venta Regular (288)	13/12/2024	10:22	8540205	1	288
164	2	51.00	0.00	\N	Venta Regular (289)	13/12/2024	10:22	8540205	1	289
165	2	56.60	0.00	\N	Venta Regular (290)	13/12/2024	11:27	8540205	1	290
166	2	26.40	0.00	\N	Venta Regular (291)	13/12/2024	11:27	8540205	1	291
167	2	35.00	0.00	\N	Venta Regular (292)	13/12/2024	11:27	8540205	1	292
168	2	71.00	0.00	\N	Venta Regular (293)	13/12/2024	11:28	8540205	1	293
169	2	25.40	0.00	\N	Venta Regular (294)	13/12/2024	11:28	8540205	1	294
170	2	77.40	0.00	\N	Venta Regular (295)	13/12/2024	11:28	8540205	1	295
171	2	18.00	0.00	\N	Venta Regular (296)	13/12/2024	11:29	8540205	1	296
172	2	34.60	0.00	\N	Venta Regular (297)	13/12/2024	22:48	8540205	1	297
173	2	108.00	0.00	\N	Venta Regular (298)	13/12/2024	22:49	8540205	1	298
174	2	39.00	0.00	\N	Venta Regular (299)	13/12/2024	22:49	8540205	1	299
175	2	65.00	0.00	\N	Venta Regular (300)	13/12/2024	22:50	8540205	1	300
176	2	65.80	0.00	\N	Venta Regular (301)	13/12/2024	22:51	8540205	1	301
177	2	37.00	0.00	\N	Venta Regular (302)	13/12/2024	22:51	8540205	1	302
178	2	50.80	0.00	\N	Venta Regular (303)	13/12/2024	22:52	8540205	1	303
179	2	36.60	0.00	\N	Venta Regular (304)	13/12/2024	22:53	8540205	1	304
180	2	37.00	0.00	\N	Venta Regular (305)	13/12/2024	22:53	8540205	1	305
181	2	56.80	0.00	\N	Venta Regular (306)	13/12/2024	22:54	8540205	1	306
182	2	27.00	0.00	\N	Venta Regular (307)	13/12/2024	22:55	8540205	1	307
183	2	59.80	0.00	\N	Venta Regular (308)	13/12/2024	22:55	8540205	1	308
184	2	44.80	0.00	\N	Venta Regular (309)	13/12/2024	22:57	8540205	1	309
185	2	82.00	0.00	\N	Venta Regular (310)	13/12/2024	22:58	8540205	1	310
186	2	72.00	0.00	\N	Venta Regular (311)	13/12/2024	22:59	8540205	1	311
187	1	510.00	0.00	\N	Compra de Pollo de Andaluz	13/12/2024	23:00	8540205	0	\N
188	2	2150.00	0.00	\N	Venta Regular (312)	13/12/2024	23:03	8540205	1	312
189	2	560.00	0.00	\N	Venta Regular (313)	13/12/2024	23:05	8540205	1	313
190	2	1190.00	0.00	\N	Venta Regular (314)	13/12/2024	23:07	8540205	1	314
191	2	3060.00	0.00	\N	Venta Regular (315)	13/12/2024	23:09	8540205	1	315
192	2	6727.00	0.00	\N	Venta Regular (316)	13/12/2024	23:11	8540205	1	316
201	2	42.20	0.00	\N	Venta Regular (323)	14/12/2024	22:06	8540205	1	323
193	2	500.00	0.00	\N	Venta Regular (319)	13/12/2024	23:15	8540205	1	319
194	2	150.00	0.00	\N	Venta Regular (320)	13/12/2024	23:15	8540205	1	320
195	2	3810.00	0.00	\N	Venta Regular (321)	13/12/2024	23:19	8540205	1	321
196	2	2034.00	0.00	\N	Venta Regular (322)	13/12/2024	23:20	8540205	1	322
197	1	450.00	0.00	\N	Compra de Arroz y Papa	14/12/2024	21:57	8540205	0	\N
198	1	1206.00	0.00	\N	Compra de Cervezas	14/12/2024	22:00	8540205	0	\N
199	1	540.00	0.00	\N	Copra jugo del valle de 2lt	14/12/2024	22:01	8540205	0	\N
200	1	1134.00	0.00	\N	Compra de coca cola a EMBOL	14/12/2024	22:05	8540205	0	\N
202	2	42.40	0.00	\N	Venta Regular (324)	14/12/2024	22:11	8540205	1	324
203	2	30.00	0.00	\N	Venta Regular (325)	14/12/2024	22:12	8540205	1	325
204	2	82.60	0.00	\N	Venta Regular (326)	14/12/2024	22:13	8540205	1	326
205	2	17.90	0.00	\N	Venta Regular (327)	14/12/2024	22:13	8540205	1	327
206	2	23.50	0.00	\N	Venta Regular (328)	14/12/2024	22:14	8540205	1	328
207	2	64.50	0.00	\N	Venta Regular (329)	14/12/2024	22:15	8540205	1	329
208	2	64.85	0.00	\N	Venta Regular (330)	14/12/2024	22:24	8540205	1	330
209	2	23.30	0.00	\N	Venta Regular (331)	14/12/2024	22:25	8540205	1	331
210	2	29.80	0.00	\N	Venta Regular (332)	14/12/2024	22:25	8540205	1	332
211	2	43.75	0.00	\N	Venta Regular (333)	14/12/2024	22:26	8540205	1	333
212	2	21.65	0.00	\N	Venta Regular (334)	14/12/2024	22:27	8540205	1	334
213	2	10.40	0.00	\N	Venta Regular (335)	14/12/2024	22:27	8540205	1	335
214	2	34.50	0.00	\N	Venta Regular (336)	14/12/2024	22:27	8540205	1	336
215	2	22.50	0.00	\N	Venta Regular (337)	14/12/2024	22:27	8540205	1	337
216	2	28.80	0.00	\N	Venta Regular (338)	14/12/2024	22:28	8540205	1	338
217	2	25.00	0.00	\N	Venta Regular (339)	14/12/2024	22:28	8540205	1	339
218	2	31.50	0.00	\N	Venta Regular (340)	14/12/2024	22:28	8540205	1	340
219	2	33.50	0.00	\N	Venta Regular (341)	14/12/2024	22:29	8540205	1	341
220	2	8.40	0.00	\N	Venta Regular (342)	14/12/2024	22:31	8540205	1	342
221	2	31.50	0.00	\N	Venta Regular (343)	14/12/2024	22:32	8540205	1	343
222	2	29.20	0.00	\N	Venta Regular (344)	15/12/2024	23:11	8540205	1	344
223	2	33.05	0.00	\N	Venta Regular (345)	15/12/2024	23:11	8540205	1	345
224	2	29.00	0.00	\N	Venta Regular (346)	15/12/2024	23:12	8540205	1	346
225	2	33.00	0.00	\N	Venta Regular (347)	15/12/2024	23:12	8540205	1	347
226	2	39.50	0.00	\N	Venta Regular (348)	15/12/2024	23:12	8540205	1	348
227	2	55.60	0.00	\N	Venta Regular (349)	15/12/2024	23:12	8540205	1	349
228	2	87.00	0.00	\N	Venta Regular (350)	15/12/2024	23:13	8540205	1	350
229	2	43.70	0.00	\N	Venta Regular (351)	15/12/2024	23:13	8540205	1	351
230	2	54.50	0.00	\N	Venta Regular (352)	15/12/2024	23:13	8540205	1	352
256	2	95.28	0.00	\N	Venta Regular (377)	16/12/2024	08:10	8540205	1	377
231	2	39.50	0.00	\N	Venta Regular (355)	15/12/2024	23:25	8540205	1	355
232	2	30.50	0.00	\N	Venta Regular (356)	15/12/2024	23:25	8540205	1	356
233	2	8.40	0.00	\N	Venta Regular (357)	15/12/2024	23:26	8540205	1	357
234	2	21.00	0.00	\N	Venta Regular (358)	15/12/2024	23:26	8540205	1	358
235	2	36.50	0.00	\N	Venta Regular (359)	15/12/2024	23:27	8540205	1	359
236	2	42.70	0.00	\N	Venta Regular (360)	15/12/2024	23:27	8540205	1	360
237	2	43.25	0.00	\N	Venta Regular (361)	15/12/2024	23:27	8540205	1	361
238	2	32.00	0.00	\N	Venta Regular (362)	15/12/2024	23:27	8540205	1	362
239	2	42.70	0.00	\N	Venta Regular (363)	15/12/2024	23:28	8540205	1	363
240	1	450.00	0.00	\N	Compra de papa	15/12/2024	23:34	8540205	0	\N
241	1	425.00	0.00	\N	Compra de Pollo de Avicola Andaluz	15/12/2024	23:35	8540205	0	\N
242	1	150.00	0.00	\N	Compra de Arroz	15/12/2024	23:36	8540205	0	\N
243	2	54.30	0.00	\N	Venta Regular (364)	16/12/2024	07:39	8540205	1	364
244	2	16.30	0.00	\N	Venta Regular (365)	16/12/2024	07:52	8540205	1	365
245	2	24.50	0.00	\N	Venta Regular (366)	16/12/2024	07:53	8540205	1	366
246	2	34.50	0.00	\N	Venta Regular (367)	16/12/2024	07:53	8540205	1	367
247	2	23.50	0.00	\N	Venta Regular (368)	16/12/2024	07:53	8540205	1	368
248	2	42.05	0.00	\N	Venta Regular (369)	16/12/2024	07:55	8540205	1	369
249	2	25.80	0.00	\N	Venta Regular (370)	16/12/2024	07:58	8540205	1	370
250	2	62.50	0.00	\N	Venta Regular (371)	16/12/2024	08:00	8540205	1	371
251	2	38.90	0.00	\N	Venta Regular (372)	16/12/2024	08:02	8540205	1	372
252	2	59.10	0.00	\N	Venta Regular (373)	16/12/2024	08:04	8540205	1	373
253	2	11.50	0.00	\N	Venta Regular (374)	16/12/2024	08:05	8540205	1	374
254	2	24.80	0.00	\N	Venta Regular (375)	16/12/2024	08:07	8540205	1	375
255	2	41.30	0.00	\N	Venta Regular (376)	16/12/2024	08:08	8540205	1	376
257	2	35.95	0.00	\N	Venta Regular (378)	16/12/2024	08:11	8540205	1	378
258	2	9.90	0.00	\N	Venta Regular (379)	16/12/2024	08:12	8540205	1	379
259	2	47.00	0.00	\N	Venta Regular (380)	16/12/2024	08:13	8540205	1	380
260	2	21.80	0.00	\N	Venta Regular (381)	16/12/2024	08:14	8540205	1	381
261	2	63.60	0.00	\N	Venta Regular (382)	16/12/2024	08:15	8540205	1	382
262	2	44.25	0.00	\N	Venta Regular (383)	16/12/2024	08:16	8540205	1	383
263	2	34.40	0.00	\N	Venta Regular (384)	16/12/2024	08:16	8540205	1	384
264	2	51.65	0.00	\N	Venta Regular (385)	16/12/2024	08:18	8540205	1	385
265	2	36.00	0.00	\N	Venta Regular (386)	16/12/2024	08:18	8540205	1	386
266	2	21.15	0.00	\N	Venta Regular (387)	16/12/2024	08:21	8540205	1	387
267	2	18.75	0.00	\N	Venta Regular (388)	16/12/2024	08:22	8540205	1	388
268	2	41.90	0.00	\N	Venta Regular (389)	16/12/2024	08:23	8540205	1	389
269	2	32.40	0.00	\N	Venta Regular (390)	16/12/2024	08:24	8540205	1	390
270	2	58.00	0.00	\N	Venta Regular (391)	16/12/2024	08:25	8540205	1	391
271	2	87.40	0.00	\N	Venta Regular (392)	16/12/2024	08:27	8540205	1	392
272	2	84.00	0.00	\N	Venta Regular (393)	16/12/2024	08:28	8540205	1	393
273	2	25.20	0.00	\N	Venta Regular (394)	16/12/2024	08:30	8540205	1	394
274	2	41.70	0.00	\N	Venta Regular (395)	16/12/2024	08:31	8540205	1	395
275	2	133.55	0.00	\N	Venta Regular (396)	16/12/2024	08:33	8540205	1	396
276	2	9.50	0.00	\N	Venta Regular (397)	16/12/2024	08:33	8540205	1	397
277	2	53.80	0.00	\N	Venta Regular (398)	16/12/2024	08:34	8540205	1	398
278	2	32.20	0.00	\N	Venta Regular (399)	16/12/2024	08:38	8540205	1	399
279	2	30.65	0.00	\N	Venta Regular (400)	16/12/2024	08:39	8540205	1	400
280	2	54.35	0.00	\N	Venta Regular (401)	16/12/2024	08:42	8540205	1	401
281	2	23.50	0.00	\N	Venta Regular (402)	16/12/2024	08:42	8540205	1	402
282	2	27.55	0.00	\N	Venta Regular (403)	16/12/2024	08:44	8540205	1	403
283	2	81.25	0.00	\N	Venta Regular (404)	16/12/2024	08:46	8540205	1	404
284	1	111.00	0.00	0.01000	Compra de carne argentina	16/12/2024	10:25	8540205	0	\N
285	1	420.00	0.00	\N	Compra de Pollo de Avicola Andaluz	16/12/2024	10:28	8540205	0	\N
286	2	15.84	0.00	\N	Venta Regular (405)	16/12/2024	10:42	8540205	1	405
287	1	0.00	0.00	\N	Compra de Queso Inicial	08/02/2025	10:58	8540205	0	\N
288	2	44.90	0.00	\N	Venta Regular (406)	10/02/2025	22:05	8540205	1	406
289	2	50.00	0.00	\N	Venta Regular (407)	10/02/2025	22:06	8540205	1	407
290	2	12.00	0.00	\N	Venta Regular (408)	10/02/2025	22:06	8540205	1	408
291	2	46.90	0.00	\N	Venta Regular (409)	10/02/2025	22:07	8540205	1	409
292	2	130.30	0.00	\N	Venta Regular (410)	11/02/2025	10:22	8540205	1	410
294	2	68.30	0.00	\N	Venta Regular (412)	11/02/2025	10:23	8540205	1	412
295	2	71.30	0.00	\N	Venta Regular (413)	11/02/2025	10:31	8540205	1	413
296	2	23.50	0.00	\N	Venta Regular (414)	11/02/2025	10:31	8540205	1	414
297	2	23.70	0.00	\N	Venta Regular (415)	11/02/2025	10:43	8540205	1	415
298	2	64.90	0.00	\N	Venta Regular (418)	12/02/2025	11:05	8540205	1	418
299	2	8.20	0.00	\N	Venta Regular (419)	12/02/2025	18:01	8540205	1	419
325	2	41.00	0.00	\N	Venta Regular (440)	04/09/2025	15:26	123456	1	440
300	2	8.20	0.00	\N	Venta Regular (420)	12/02/2025	19:24	8540205	1	420
326	2	45.25	0.00	\N	Venta Regular (441)	04/09/2025	15:26	123456	1	441
327	2	86.00	0.00	\N	Venta Regular (442)	04/09/2025	15:27	123456	1	442
301	2	17.20	0.00	\N	Venta Regular (421)	12/02/2025	22:08	8540205	1	421
328	2	75.00	0.00	\N	Venta Regular (443)	04/09/2025	15:27	123456	1	443
302	2	18.90	0.00	\N	Venta Regular (423)	13/02/2025	11:22	8540205	1	423
303	2	10.40	0.00	\N	Venta Regular (424)	13/02/2025	14:52	8540205	1	424
304	2	32.40	0.00	\N	Venta Regular (425)	02/05/2025	11:01	8540205	1	425
305	2	54.50	0.00	\N	Venta Regular (426)	02/05/2025	11:11	8540205	1	426
306	2	69.40	0.00	\N	Venta Regular (427)	02/05/2025	11:16	8540205	1	427
307	2	54.90	0.00	\N	Venta Regular (428)	02/05/2025	11:17	8540205	1	428
308	2	50.00	0.00	\N	Venta Regular (429)	02/05/2025	11:21	8540205	1	429
309	2	129.90	0.00	\N	Venta Regular (430)	02/05/2025	11:23	8540205	1	430
310	2	50.90	0.00	\N	Venta Regular (431)	02/05/2025	16:44	8540205	1	431
329	2	31.00	0.00	\N	Venta Regular (444)	04/09/2025	15:29	123456	1	444
312	2	50.10	0.00	\N	Venta Regular (433)	27/05/2025	23:24	8540205	1	433
313	2	61.80	0.00	\N	Venta Regular (434)	27/05/2025	23:25	8540205	1	434
314	2	51.60	0.00	\N	Venta Regular (436)	27/05/2025	23:26	8540205	1	436
315	2	42.00	0.00	\N	Venta Regular (437)	27/05/2025	23:28	8540205	1	437
311	2	58.90	0.00	\N	Venta Regular (432)	27/05/2025	23:23	8540205	1	432
316	1	12000.00	0.00	\N	papa por bolsas	22/08/2025	10:31	8540205	0	\N
317	1	2250.00	0.00	\N	Pollo de Pio Rico - Cochabamba	22/08/2025	10:32	8540205	0	\N
319	1	0.00	0.00	\N	Entrada inicial de agua cascada de 2lt	25/08/2025	11:41	8540205	0	\N
320	2	50.00	0.00	\N	Se presto 10 unidades al restaurante Golden	25/08/2025	11:44	8540205	0	\N
330	2	74.25	0.00	\N	Venta Regular (445)	04/09/2025	15:30	123456	1	445
322	1	0.00	0.00	\N	Entrada inicial de yuca	29/08/2025	11:10	8540205	0	\N
323	2	79.50	0.00	\N	Venta Regular (438)	04/09/2025	15:22	123456	1	438
324	2	190.25	0.00	\N	Venta Regular (439)	04/09/2025	15:24	123456	1	439
331	2	79.00	0.00	\N	Venta Regular (446)	04/09/2025	15:35	123456	1	446
332	1	0.00	0.00	\N	Entrada inicial de pan para hamburguesa	06/09/2025	18:00	123456	0	\N
348	2	38.80	0.00	\N	Venta Regular (469)	12/09/2025	11:16	8540205	1	469
334	2	7812.00	0.00	\N	Salida de papa para modificacion por error de total 12000	08/09/2025	11:48	8540205	0	\N
335	1	781.00	0.00	\N	Entra de papa con el precio modificado a 1200	08/09/2025	11:50	8540205	0	\N
336	2	12.00	0.00	\N	Venta Regular (448)	08/09/2025	11:52	8540205	1	448
337	2	32.00	0.00	\N	Venta Regular (449)	09/09/2025	11:04	8540205	1	449
338	2	25.25	0.00	\N	Venta Regular (450)	09/09/2025	11:04	8540205	1	450
339	2	29.30	0.00	\N	Venta Regular (451)	09/09/2025	11:05	8540205	1	451
340	2	24.00	0.00	\N	Venta Regular (452)	09/09/2025	11:05	8540205	1	452
341	2	3.00	0.00	\N	Venta Regular (453)	09/09/2025	11:06	8540205	1	453
349	2	53.30	0.00	\N	Venta Regular (470)	12/09/2025	11:18	8540205	1	470
342	2	9.00	0.00	\N	Venta Regular (462)	09/09/2025	18:35	8540205	1	462
350	2	37.60	0.00	\N	Venta Regular (471)	12/09/2025	11:19	8540205	1	471
343	2	135.00	0.00	\N	Venta Regular (464)	09/09/2025	18:44	8540205	1	464
344	2	45.00	0.00	\N	Venta Regular (465)	09/09/2025	18:44	8540205	1	465
351	2	33.80	0.00	\N	Venta Regular (472)	12/09/2025	11:24	8540205	1	472
345	2	20.00	0.00	\N	Venta Regular (466)	12/09/2025	11:08	8540205	1	466
346	2	75.85	0.00	\N	Venta Regular (467)	12/09/2025	11:09	8540205	1	467
347	2	68.00	0.00	\N	Venta Regular (468)	12/09/2025	11:15	8540205	1	468
352	2	18.25	0.00	\N	Venta Regular (473)	12/09/2025	11:26	8540205	1	473
353	2	57.75	0.00	\N	Venta Regular (474)	12/09/2025	11:26	8540205	1	474
354	2	14.80	0.00	\N	Venta Regular (475)	12/09/2025	11:29	8540205	1	475
355	2	32.80	0.00	\N	Venta Regular (476)	12/09/2025	11:29	8540205	1	476
356	2	63.00	0.00	\N	Venta Regular (477)	12/09/2025	11:30	8540205	1	477
360	2	31.80	0.00	\N	Venta Regular (480)	15/09/2025	16:38	8540205	1	480
359	1	1000.00	0.00	\N	Arroz Siglo de Oro por bolsa	12/09/2025	11:35	123456	0	\N
361	2	34.25	0.00	\N	Venta Regular (481)	15/09/2025	16:39	8540205	1	481
362	2	48.00	0.00	\N	Venta Regular (482)	15/09/2025	16:40	8540205	1	482
363	2	44.35	0.00	\N	Venta Regular (483)	15/09/2025	16:40	8540205	1	483
364	2	14.00	0.00	\N	Venta Regular (484)	15/09/2025	16:41	8540205	1	484
365	2	15.80	0.00	\N	Venta Regular (485)	15/09/2025	16:41	8540205	1	485
366	2	35.80	0.00	\N	Venta Regular (486)	15/09/2025	16:42	8540205	1	486
367	2	65.05	0.00	\N	Venta Regular (487)	15/09/2025	16:43	8540205	1	487
368	2	24.00	0.00	\N	Venta Regular (488)	15/09/2025	16:43	8540205	1	488
369	2	18.25	0.00	\N	Venta Regular (489)	15/09/2025	16:44	8540205	1	489
370	2	32.00	0.00	\N	Venta Regular (490)	15/09/2025	16:51	8540205	1	490
371	2	43.55	0.00	\N	Venta Regular (491)	15/09/2025	16:51	8540205	1	491
372	2	35.80	0.00	\N	Venta Regular (492)	15/09/2025	16:52	8540205	1	492
373	2	41.50	0.00	\N	Venta Regular (493)	15/09/2025	16:53	8540205	1	493
374	2	28.25	0.00	\N	Venta Regular (494)	15/09/2025	16:55	8540205	1	494
375	2	12.00	0.00	\N	Venta Regular (495)	15/09/2025	16:55	8540205	1	495
376	2	49.75	0.00	\N	Venta Regular (496)	15/09/2025	16:55	8540205	1	496
377	2	21.00	0.00	\N	Venta Regular (497)	15/09/2025	16:55	8540205	1	497
378	2	36.00	0.00	\N	Venta Regular (498)	15/09/2025	16:56	8540205	1	498
379	2	60.80	0.00	\N	Venta Regular (499)	15/09/2025	16:56	8540205	1	499
380	2	32.00	0.00	\N	Venta Regular (500)	15/09/2025	16:57	8540205	1	500
381	2	60.00	0.00	\N	Venta Regular (501)	15/09/2025	16:57	8540205	1	501
382	2	75.30	0.00	\N	Venta Regular (502)	15/09/2025	17:00	8540205	1	502
383	2	77.55	0.00	\N	Venta Regular (503)	15/09/2025	17:01	8540205	1	503
384	2	34.00	0.00	\N	Venta Regular (504)	15/09/2025	17:01	8540205	1	504
385	2	63.00	0.00	\N	Venta Regular (505)	15/09/2025	17:02	8540205	1	505
386	2	26.80	0.00	\N	Venta Regular (506)	15/09/2025	17:05	8540205	1	506
387	2	50.25	0.00	\N	Venta Regular (508)	15/09/2025	17:07	8540205	1	508
388	2	43.05	0.00	\N	Venta Regular (509)	15/09/2025	17:12	8540205	1	509
389	2	4.72	0.00	\N	Venta Regular (511)	15/09/2025	23:16	123456	1	511
\.


--
-- TOC entry 3473 (class 0 OID 33008)
-- Dependencies: 221
-- Data for Name: opcion; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.opcion (cod_opcion, nombre, descripcion, estado) FROM stdin;
7	Pierna	Porción simple de pierna	0
6	Ala	Porción simple de Ala	0
5	Pierna	1/4 de Pierna	0
4	Ala	1/4 de Ala	0
1	Puro Arroz	Porción de puro Arroz de 500 gramos	0
10	Arroz	Arroz para el asado	0
12	Yuca frita	Yuca frita de hamburguesa de 200gr	0
9	Papa 	Papa asado	0
8	Arroz y papa	Porcion de Arroz(200gr) y papa(300gr)	0
2	Pura papa	Porción pura papa 500 gramos	0
11	Papa frita	Papa frita de hamburguesa de 200gr	0
\.


--
-- TOC entry 3469 (class 0 OID 32903)
-- Dependencies: 217
-- Data for Name: producto; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.producto (cod_producto, nombre, precio, producto_unico, estado, cod_categoria, cod_subcategoria, cocina) FROM stdin;
2	Fanta Personal	3	0	0	2	4	f
15	Sprite personal	3	0	0	2	4	f
9	Coca Mediana	6	0	0	2	5	f
13	Fanta Mediana	6	0	0	2	5	f
16	Sprite mediana	6	0	0	2	5	f
10	Fanta 1lt	10	0	0	2	6	f
11	Coca 1lt	10	0	0	2	6	f
17	Sprite 1Lt	10	0	0	2	6	f
18	Coca 1.5Lt	13	0	0	2	7	f
19	Fanta 1.5Lt	13	0	0	2	7	f
20	Sprite 1.5Lt	13	0	0	2	7	f
12	Coca 2lt	15	0	0	2	8	f
14	Fanta 2lt	15	0	0	2	8	f
21	Sprite 2Lt	15	0	0	2	8	f
22	Coca 3Lt	20	0	0	2	10	f
23	Simba Manzana 2Lt	15	0	0	2	8	f
24	Simba Piña 2Lt	15	0	0	2	8	f
25	Simba durazno 2Lt	15	0	0	2	8	f
26	Salvietti personal	3	0	0	2	4	f
27	Salvietti mediana	6	0	0	2	5	f
28	Salvietti 1Lt	10	0	0	2	6	f
29	Salvietti 2Lt	15	0	0	2	8	f
30	Salvietti 2.5 Lt	18	0	0	2	9	f
31	Salvietti 3Lt	20	0	0	2	10	f
32	Valle 1Lt	15	0	0	2	6	f
33	Valle 2Lt	20	0	0	2	8	f
34	Paceña 1Lt	25	0	0	2	11	f
35	Huari 1Lt	25	0	0	2	11	f
36	Quilmes 1Lt	25	0	0	2	11	f
37	Huari personal	15	0	0	2	11	f
5	Pollo Entero	100	1	0	1	\N	t
6	1/2 Pollo	50	1	0	1	\N	t
8	Porción de Arroz	3	1	0	3	\N	t
7	Porción de Papa	10	1	0	3	\N	t
38	Pepsi personal	6	0	0	2	4	f
3	Pollo de 20	20	1	0	1	\N	t
4	Pollo de 25	25	1	0	1	\N	t
39	Asado	55	1	0	9	\N	f
40	Pollo de 30	30	1	0	1	\N	t
1	Coca Per	5	0	1	2	4	f
41	Jugo 3lt	30	0	0	2	10	f
42	Hamburguesa Americana	20	1	0	4	\N	t
\.


--
-- TOC entry 3472 (class 0 OID 32959)
-- Dependencies: 220
-- Data for Name: producto_complemento; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.producto_complemento (cod_producto, cod_complemento) FROM stdin;
5	1
6	1
3	3
3	1
4	2
4	1
39	6
42	7
\.


--
-- TOC entry 3464 (class 0 OID 32812)
-- Dependencies: 212
-- Data for Name: roles; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.roles (cod_rol, rol, enlace) FROM stdin;
1	Usuario	usuario
2	Producto	producto
3	Venta	venta
4	Caja	caja
5	Cocina	cocina
7	Cliente	cliente
6	Inventario	inventario
8	Reporte Ventas	reporte-ventas
\.


--
-- TOC entry 3465 (class 0 OID 32818)
-- Dependencies: 213
-- Data for Name: roles_usuarios; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.roles_usuarios (ci_usuario, cod_rol) FROM stdin;
1111	2
1111	3
1111	4
1111	5
1111	6
1111	8
9090	5
123456	2
123456	3
123456	4
123456	6
1234567	1
1234567	2
1234567	3
1234567	4
1234567	5
1234567	6
1234567	7
1234567	8
\.


--
-- TOC entry 3468 (class 0 OID 32893)
-- Dependencies: 216
-- Data for Name: subcategoria; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.subcategoria (cod_subcategoria, nombre, cod_categoria) FROM stdin;
4	Personales	2
5	Medianas	2
6	1 Litro	2
7	1 Litro 1/2	2
8	2 Litros	2
10	3 Litros	2
9	2 Litros 1/2	2
11	Cervezas	2
12	Jugos 	2
\.


--
-- TOC entry 3462 (class 0 OID 32805)
-- Dependencies: 210
-- Data for Name: usuario; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.usuario (ci_usuario, nom_usu, ap_usu, clave, reset_expires, reset_token, cargo) FROM stdin;
1010	Carlos	Castro	$2a$08$qSKWIfbOa3OdiP299hnUL.fXX92IJyx52Ewlmq/yO0DV03iTmx/LG	2025-09-03 15:49:43.022+00	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MTAxMCwiaWF0IjoxNzU2OTEwOTgzLCJleHAiOjE3NTY5MTQ1ODN9.4OVAw352NDX1XqZC0b4WXzcLjgeYiaWq6Byso9GV1wE	1
2222	Ayelen	Colodro	$2a$08$TtTflJWo8x52f/lChI8UXen9aoS4AQrl1gQtQCal6c5CIdlr5Aly.	\N	\N	1
3333	Maria	Saucedo	$2a$08$./V3ASIuxQ0mfGfSOIQA6.UbZQE.nqd/8fecBuIsLmHAuSH2PNenK	\N	\N	1
4444	Camila	Arenas	$2a$08$VSdLUhQrrlrX3QenX.Fhhe6iO.lDcrik92Vwcb6Dtnwfi.T3XNyb6	\N	\N	1
5555	Marcelo	Morales	$2a$08$7qh7DfOaVhQxqzX6Z6Tna.Dmed9VXoVr2X/LQouuYYKZjvmdJIP8.	\N	\N	1
6666	Moises	Lopez	$2a$08$FUeZkJ94cwB4OLptcS8ptO8VOvLrr6QboeKO/j2YQAgLRl81gmggy	\N	\N	1
7777	Liliana	Rivera	$2a$08$q7YxfgGnluW6oA8dvroz1uP5mDXeVWppnEID2hHrzH.tnlZ6ZdeBm	\N	\N	1
2020	Nelson	Quispe	$2a$08$HCiCo5al0hUGP8zYn1Nd6.9EwbwgfPYEZ3yPJ99a4kbAA5QNCmDCe	\N	\N	1
9999	Nayeli	Aguilar	$2a$08$M0Q7COqp01GBmKBgmj9Z2.CanFekl0PiRJYB1ovdZuXsK46e/Gsjq	\N	\N	1
47755	Pedro	Aries	$2a$08$f5Icb/YZPcwhFtqRP.Ao0OQpyiSt6HP7EY8l95223.MmVdPwtYPT2	\N	\N	1
84894	aaa	aaa	$2a$08$e4r7SyDhOq509gwVi9QMr.SLckqJdTbX/RTirDdWP/WTm0qDdcKUu	\N	\N	1
8540205	Fabrizio	Arias	$2a$08$dzryrUXf3j7fXeY/3s3KxOa0oRYN7ceR4jGUbAI.KJWW.wc5ctQrG	\N	\N	0
123456	usuario1	usuario1	$2a$08$wUaETY4kJz0.T9m1dmAoz.lpsRp3gZgnbCYKlDjFbZD9bhlvwn2t.	\N	\N	1
1234567	Admin	Admin	$2a$08$Iro3KgdkGOUvsKW9.gthle3macnewv8o5VzDgReDcYVOCircZm6xi	\N	\N	0
1111	Pedro	Mamani	$2a$08$6qXe0DaE2/0XN0aej8lxie6/xvLSVY63tQ2169EfDB64IlYqn585G	\N	\N	1
9090	Jose	Ramos	$2a$08$Zp3X8Q5xQemiJqgWozjrc.qKWgcSKIlxCkVJb7XrJiumkfU8U3lHi	2025-05-02 01:10:00.98+00	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6OTA5MCwiaWF0IjoxNzQ2MTQ0NjAwLCJleHAiOjE3NDYxNDgyMDB9.NxZD3Z6aJev2ehxNCugc6JCky4eTPstczfZvb9VmQ8A	2
\.


--
-- TOC entry 3477 (class 0 OID 33180)
-- Dependencies: 225
-- Data for Name: venta; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.venta (cod_venta, cod_caja, ticket, mesa, hora, descripcion, estado, ci_usuario, cod_cliente, bs_total, bs_pagado, bs_cambio, ps_total, ps_pagado, ps_cambio, estado_documento, venta_llevar, bs_descuento, bs_banca_pagado, ps_descuento, fecha, estado_transaccion) FROM stdin;
79	34	1	\N	22:08		0	8540205	3	95.00	100.00	5.00	14200.00	\N	0.00	1	f	\N	\N	\N	08/10/2024	2
80	34	2	\N	23:22		0	8540205	\N	20.00	100.00	80.00	3000.00	\N	0.00	0	f	\N	\N	\N	08/10/2024	2
85	34	5	\N	10:40	Pedido para Maria	0	8540205	\N	80.00	100.00	20.00	11950.00	\N	0.00	0	t	\N	\N	\N	10/10/2024	2
86	34	6	20	10:43		0	8540205	\N	49.00	50.00	1.00	7350.00	\N	0.00	0	f	\N	\N	\N	10/10/2024	2
87	34	7	4	10:43		0	8540205	\N	65.00	\N	0.00	9750.00	\N	0.00	0	f	\N	\N	\N	10/10/2024	1
81	34	1	12	10:37		2	8540205	\N	20.00	40.00	20.00	3000.00	\N	0.00	0	f	\N	\N	\N	10/10/2024	2
83	34	3	6	10:38		1	8540205	\N	115.00	120.00	5.00	17200.00	\N	0.00	0	f	\N	\N	\N	10/10/2024	2
115	38	3	\N	17:35		0	8540205	3	20.00	50.00	30.00	2000.00	\N	0.00	1	f	\N	\N	\N	27/11/2024	2
82	34	2	5	10:38		2	8540205	\N	98.00	100.00	2.00	14650.00	\N	0.00	0	f	\N	\N	\N	10/10/2024	2
84	34	4	15	10:39		0	8540205	\N	105.00	200.00	95.00	15700.00	\N	0.00	0	f	\N	\N	\N	10/10/2024	2
88	34	1	12	11:11		0	8540205	\N	20.00	100.00	80.00	3000.00	\N	0.00	0	f	\N	\N	\N	12/10/2024	2
130	40	2	3	14:28		2	8540205	\N	80.00	100.00	20.00	80000.00	\N	0.00	0	f	\N	\N	\N	09/12/2024	2
110	38	1	\N	14:16		2	8540205	\N	40.00	100.00	60.00	4000.00	\N	0.00	0	f	\N	\N	\N	27/11/2024	2
116	38	1	\N	19:54		0	8540205	\N	20.00	\N	0.00	2000.00	\N	0.00	0	f	\N	\N	\N	01/12/2024	1
90	34	2	\N	15:59		0	8540205	3	45.00	50.00	5.00	6750.00	\N	0.00	2	f	\N	\N	\N	09/11/2024	2
91	34	3	\N	16:45		0	8540205	3	20.00	20.00	0.00	3000.00	\N	0.00	2	f	\N	\N	\N	09/11/2024	2
93	34	4	\N	16:51		0	8540205	\N	20.00	\N	0.00	3000.00	\N	0.00	0	f	\N	\N	\N	09/11/2024	1
96	35	1	12	18:28		0	8540205	\N	46.00	100.00	54.00	6900.00	\N	0.00	0	f	\N	\N	\N	12/11/2024	2
97	35	2	1	18:29		0	8540205	\N	45.00	50.00	5.00	6750.00	\N	0.00	0	f	\N	\N	\N	12/11/2024	2
98	35	3	6	18:29		0	8540205	\N	90.00	\N	0.00	13450.00	15000.00	1550.00	0	f	\N	\N	\N	12/11/2024	2
99	35	4	15	18:31		0	8540205	3	55.00	100.00	45.00	8250.00	\N	0.00	1	f	\N	\N	\N	12/11/2024	2
100	35	5	17	18:34		0	8540205	\N	115.00	120.00	5.00	17200.00	\N	0.00	0	f	\N	\N	\N	12/11/2024	2
101	35	6	4	18:37		0	8540205	\N	115.00	115.00	0.00	17200.00	\N	0.00	0	f	\N	\N	\N	12/11/2024	2
75	33	4	19	17:01		0	8540205	\N	115.00	200.00	85.00	17200.00	\N	0.00	0	f	\N	\N	\N	01/10/2024	2
76	33	5	6	17:08		0	8540205	\N	123.00	130.00	7.00	18400.00	\N	0.00	0	f	\N	\N	\N	01/10/2024	2
102	35	7	\N	18:52		0	8540205	\N	155.00	200.00	45.00	23150.00	\N	0.00	0	f	\N	\N	\N	12/11/2024	2
103	37	1	10	00:07		0	8540205	\N	55.00	100.00	45.00	8250.00	\N	0.00	0	f	\N	\N	\N	22/11/2024	2
105	37	2	7	00:09		0	8540205	\N	85.00	85.00	0.00	12700.00	\N	0.00	0	f	\N	\N	\N	22/11/2024	2
106	37	3	\N	00:09	Para Marcos	0	8540205	\N	50.00	50.00	0.00	7500.00	\N	0.00	0	t	\N	\N	\N	22/11/2024	2
72	33	1	8	15:11		2	8540205	\N	80.00	100.00	30.00	11950.00	\N	0.00	0	f	10.00	\N	\N	01/10/2024	2
73	33	2	4	15:20		2	8540205	\N	23.00	50.00	27.00	3450.00	\N	0.00	0	f	\N	\N	\N	01/10/2024	2
107	37	4	4	00:10		0	8540205	\N	75.00	\N	0.00	11200.00	\N	0.00	0	f	\N	\N	\N	22/11/2024	1
108	37	5	9	00:11		0	8540205	\N	128.00	200.00	72.00	19150.00	\N	0.00	0	f	\N	\N	\N	22/11/2024	2
74	33	3	7	16:52	Para Liliana	1	8540205	\N	60.00	\N	0.00	9000.00	\N	0.00	0	t	\N	\N	\N	01/10/2024	1
77	33	1	\N	18:54		0	8540205	\N	20.00	\N	0.00	3000.00	5000.00	2000.00	1	f	\N	\N	\N	02/10/2024	2
78	34	1	\N	23:19		0	8540205	\N	66.00	100.00	34.00	9900.00	\N	0.00	0	f	\N	\N	\N	03/10/2024	2
119	38	2	\N	20:05		0	8540205	\N	3.00	\N	0.00	300.00	\N	0.00	0	f	\N	\N	\N	01/12/2024	1
109	37	6	18	00:12		0	8540205	\N	69.00	70.00	1.00	10300.00	\N	0.00	0	f	\N	\N	\N	22/11/2024	2
134	40	6	1	14:55		2	8540205	\N	100.00	100.00	0.00	100000.00	\N	0.00	0	f	\N	\N	\N	09/12/2024	2
120	38	3	\N	20:09		0	8540205	\N	20.00	\N	0.00	2000.00	\N	0.00	0	f	\N	\N	\N	01/12/2024	1
121	38	4	\N	20:10		0	8540205	\N	10.00	\N	0.00	1000.00	\N	0.00	0	f	\N	\N	\N	01/12/2024	1
122	39	1	\N	20:19		0	8540205	\N	20.00	20.00	0.00	2000.00	\N	0.00	0	f	\N	\N	\N	05/12/2024	2
114	38	2	\N	15:16	Para Lore	0	8540205	\N	25.00	25.00	0.00	2500.00	\N	0.00	0	t	\N	\N	\N	27/11/2024	2
135	40	7	16	15:00		2	8540205	\N	123.00	\N	0.00	123000.00	\N	0.00	0	f	\N	123.00	\N	09/12/2024	2
139	40	10	10	15:49		2	8540205	\N	23.00	10.00	0.00	23000.00	14000.00	1000.00	0	f	\N	\N	\N	09/12/2024	2
129	40	1	2	14:26		2	8540205	\N	50.00	50.00	0.00	50000.00	\N	0.00	0	f	\N	\N	\N	09/12/2024	2
131	40	3	\N	14:30	Santiago Perez	2	8540205	\N	80.00	80.00	0.00	80000.00	\N	0.00	0	t	\N	\N	\N	09/12/2024	2
147	40	18	5	19:13		0	8540205	\N	65.00	100.00	35.00	65000.00	\N	0.00	0	f	\N	\N	\N	09/12/2024	2
140	40	11	17	15:52		2	8540205	\N	93.00	100.00	7.00	93000.00	\N	0.00	0	f	\N	\N	\N	09/12/2024	2
143	40	14	9	16:29		2	8540205	\N	56.00	\N	0.00	56000.00	56000.00	0.00	0	f	\N	\N	\N	09/12/2024	2
144	40	15	20	16:30		2	8540205	\N	55.00	100.00	45.00	55000.00	\N	0.00	0	f	\N	\N	\N	09/12/2024	2
148	40	19	12	19:20		0	8540205	\N	145.00	150.00	5.00	145000.00	\N	0.00	0	f	\N	\N	\N	09/12/2024	2
132	40	4	6	14:31		2	8540205	\N	51.00	50.00	0.00	51000.00	\N	0.00	0	f	1.00	\N	\N	09/12/2024	2
133	40	5	8	14:38		2	8540205	\N	95.00	\N	0.00	95000.00	96000.00	1000.00	0	f	\N	\N	\N	09/12/2024	2
136	40	8	17	15:08		2	8540205	\N	110.00	150.00	40.00	110000.00	\N	0.00	0	f	\N	\N	\N	09/12/2024	2
138	40	9	5	15:31		2	8540205	\N	76.00	\N	0.00	76000.00	76000.00	0.00	0	f	\N	\N	\N	09/12/2024	2
141	40	12	6	16:11		2	8540205	\N	31.00	40.00	9.00	31000.00	\N	0.00	0	f	\N	\N	\N	09/12/2024	2
142	40	13	5	16:12		2	8540205	\N	75.00	80.00	5.00	75000.00	\N	0.00	0	f	\N	\N	\N	09/12/2024	2
145	40	16	11	16:32		1	8540205	\N	138.00	200.00	62.00	138000.00	\N	0.00	0	f	\N	\N	\N	09/12/2024	2
146	40	17	3	19:08		1	8540205	\N	51.00	101.00	50.00	51000.00	\N	0.00	0	f	\N	\N	\N	09/12/2024	2
149	40	20	7	20:03		0	8540205	\N	150.00	200.00	50.00	150000.00	\N	0.00	0	f	\N	\N	\N	09/12/2024	2
150	40	21	9	20:14		0	8540205	\N	245.00	250.00	5.00	245000.00	\N	0.00	0	f	\N	\N	\N	09/12/2024	2
151	40	22	19	20:18		0	8540205	\N	105.00	105.00	0.00	105000.00	\N	0.00	0	f	\N	\N	\N	09/12/2024	2
153	41	24	18	20:33		2	8540205	\N	56.00	\N	0.00	5600.00	6000.00	400.00	0	f	\N	\N	\N	09/12/2024	2
154	41	25	\N	20:34	Marcelo L.	2	8540205	\N	50.00	50.00	0.00	5000.00	\N	0.00	0	t	\N	\N	\N	09/12/2024	2
155	41	26	8	20:35		2	8540205	\N	143.00	200.00	57.00	14300.00	\N	0.00	0	f	\N	\N	\N	09/12/2024	2
156	41	27	10	20:39		2	8540205	\N	55.00	100.00	45.00	5500.00	\N	0.00	0	f	\N	\N	\N	09/12/2024	2
157	41	28	5	20:41		2	8540205	\N	88.00	100.00	12.00	8800.00	\N	0.00	0	f	\N	\N	\N	09/12/2024	2
152	41	23	1	20:27		2	8540205	\N	75.00	100.00	25.00	7500.00	\N	0.00	0	f	\N	\N	\N	09/12/2024	2
158	41	29	4	20:43		2	8540205	\N	73.00	73.00	0.00	7300.00	\N	0.00	0	f	\N	\N	\N	09/12/2024	2
159	41	30	2	20:46		2	8540205	\N	90.00	100.00	10.00	9000.00	\N	0.00	0	f	\N	\N	\N	09/12/2024	2
160	41	31	1	20:47		2	8540205	\N	60.00	\N	0.00	6000.00	6000.00	0.00	0	f	\N	\N	\N	09/12/2024	2
161	41	32	16	20:57		2	8540205	\N	150.00	\N	0.00	15000.00	15000.00	0.00	0	f	\N	\N	\N	09/12/2024	2
162	41	33	11	21:01		2	8540205	\N	145.00	150.00	5.00	14500.00	\N	0.00	0	f	\N	\N	\N	09/12/2024	2
163	41	34	6	21:04		2	8540205	\N	85.00	100.00	15.00	8500.00	\N	0.00	0	f	\N	\N	\N	09/12/2024	2
164	41	35	12	21:05		2	8540205	\N	102.00	\N	0.00	10200.00	11000.00	800.00	0	f	\N	\N	\N	09/12/2024	2
165	41	36	3	21:06		2	8540205	\N	80.00	80.00	0.00	8000.00	\N	0.00	0	f	\N	\N	\N	09/12/2024	2
166	41	37	1	21:07		2	8540205	\N	115.00	120.00	5.00	11500.00	\N	0.00	0	f	\N	\N	\N	09/12/2024	2
167	41	38	6	21:09		2	8540205	\N	46.00	\N	0.00	4600.00	5000.00	400.00	0	f	\N	\N	\N	09/12/2024	2
168	41	39	4	21:10		2	8540205	\N	83.00	100.00	17.00	8300.00	\N	0.00	0	f	\N	\N	\N	09/12/2024	2
169	41	40	13	21:19		2	8540205	\N	130.00	150.00	20.00	13000.00	\N	0.00	0	f	\N	\N	\N	09/12/2024	2
170	41	41	20	21:19		2	8540205	\N	98.00	100.00	2.00	9800.00	\N	0.00	0	f	\N	\N	\N	09/12/2024	2
189	44	1	3	18:23		0	8540205	\N	400.00	400.00	0.00	40000.00	\N	0.00	0	f	\N	\N	\N	10/12/2024	2
171	41	42	9	21:20		2	8540205	\N	110.00	150.00	40.00	11000.00	\N	0.00	0	f	\N	\N	\N	09/12/2024	2
172	41	43	1	21:21		2	8540205	\N	90.00	100.00	10.00	9000.00	\N	0.00	0	f	\N	\N	\N	09/12/2024	2
173	41	44	3	21:22		2	8540205	\N	90.00	90.00	0.00	9000.00	\N	0.00	0	f	\N	\N	\N	09/12/2024	2
174	41	45	12	21:22		2	8540205	\N	56.00	100.00	44.00	5600.00	\N	0.00	0	f	\N	\N	\N	09/12/2024	2
175	41	46	\N	21:23	Marco Z.	2	8540205	\N	120.00	120.00	0.00	12000.00	\N	0.00	0	t	\N	\N	\N	09/12/2024	2
176	41	47	2	21:24		2	8540205	\N	75.00	\N	0.00	7500.00	8000.00	500.00	0	f	\N	\N	\N	09/12/2024	2
177	41	48	6	21:25		2	8540205	\N	100.00	\N	0.00	10000.00	\N	0.00	0	f	\N	100.00	\N	09/12/2024	2
178	41	49	15	21:30		2	8540205	\N	95.00	100.00	5.00	9500.00	\N	0.00	0	f	\N	\N	\N	09/12/2024	2
179	41	50	14	21:30		2	8540205	\N	73.00	70.00	10.00	7300.00	2000.00	1700.00	0	f	\N	\N	\N	09/12/2024	2
190	44	2	1	18:41		0	1111	\N	56.00	60.00	4.00	5600.00	\N	0.00	0	f	\N	\N	\N	10/12/2024	2
180	41	51	5	21:32		2	8540205	\N	115.00	120.00	5.00	11500.00	\N	0.00	0	f	\N	\N	\N	09/12/2024	2
181	41	52	8	21:33		2	8540205	\N	93.00	100.00	7.00	9300.00	\N	0.00	0	f	\N	\N	\N	09/12/2024	2
182	41	53	9	21:34		2	8540205	\N	139.00	200.00	61.00	13900.00	\N	0.00	0	f	\N	\N	\N	09/12/2024	2
183	41	54	5	21:37		2	8540205	\N	88.00	100.00	12.00	8800.00	\N	0.00	0	f	\N	\N	\N	09/12/2024	2
184	41	55	17	21:39		2	8540205	\N	123.00	130.00	7.00	12300.00	\N	0.00	0	f	\N	\N	\N	09/12/2024	2
185	41	56	7	21:40		2	8540205	\N	66.00	70.00	4.00	6600.00	\N	0.00	0	f	\N	\N	\N	09/12/2024	2
186	41	57	1	21:45		2	8540205	3	98.00	100.00	2.00	9800.00	\N	0.00	1	f	\N	\N	\N	09/12/2024	2
191	44	3	6	18:53		0	1111	\N	76.00	\N	0.00	7600.00	8000.00	400.00	0	f	\N	\N	\N	10/12/2024	2
192	44	4	16	18:59		0	8540205	\N	52.00	52.00	0.00	5200.00	\N	0.00	0	f	\N	\N	\N	10/12/2024	2
204	44	5	\N	21:15		0	8540205	\N	20.00	20.00	0.00	2000.00	\N	0.00	0	f	\N	\N	\N	10/12/2024	2
231	45	1	\N	10:39		0	8540205	\N	12.00	12.00	0.00	1200.00	\N	0.00	0	f	\N	\N	\N	11/12/2024	2
235	45	1	9	19:05	Para la mesa grande del centro	2	8540205	\N	610.00	610.00	0.00	61000.00	\N	0.00	0	f	\N	\N	\N	12/12/2024	2
236	45	2	16	19:07		2	8540205	\N	305.00	310.00	5.00	30500.00	\N	0.00	0	f	\N	\N	\N	12/12/2024	2
237	45	3	1	19:08		2	8540205	\N	78.00	100.00	22.00	7800.00	\N	0.00	0	f	\N	\N	\N	12/12/2024	2
238	45	4	\N	19:09	Maria Zambrana	2	8540205	\N	250.00	300.00	50.00	25000.00	\N	0.00	0	t	\N	\N	\N	12/12/2024	2
239	45	5	4	19:09		2	8540205	\N	190.00	200.00	10.00	19000.00	\N	0.00	0	f	\N	\N	\N	12/12/2024	2
240	45	6	6	19:10		2	8540205	\N	73.00	100.00	27.00	7300.00	\N	0.00	0	f	\N	\N	\N	12/12/2024	2
241	45	7	5	19:10		2	8540205	\N	100.00	100.00	0.00	10000.00	\N	0.00	0	f	\N	\N	\N	12/12/2024	2
242	45	8	20	19:11		2	8540205	\N	75.00	100.00	25.00	7500.00	\N	0.00	0	f	\N	\N	\N	12/12/2024	2
243	45	9	2	19:11		2	8540205	\N	155.00	155.00	0.00	15500.00	\N	0.00	0	f	\N	\N	\N	12/12/2024	2
244	45	10	13	19:12		2	8540205	\N	290.00	300.00	10.00	29000.00	\N	0.00	0	f	\N	\N	\N	12/12/2024	2
245	45	11	7	19:13		2	8540205	\N	195.00	200.00	5.00	19500.00	\N	0.00	0	f	\N	\N	\N	12/12/2024	2
246	45	12	10	19:16		2	8540205	\N	90.00	100.00	10.00	9000.00	\N	0.00	0	f	\N	\N	\N	12/12/2024	2
247	45	13	15	19:18		2	8540205	\N	140.00	140.00	0.00	14000.00	\N	0.00	0	f	\N	\N	\N	12/12/2024	2
248	45	14	8	19:23		2	8540205	\N	155.00	160.00	5.00	15500.00	\N	0.00	0	f	\N	\N	\N	12/12/2024	2
249	45	15	17	19:23		2	8540205	\N	238.00	250.00	12.00	23800.00	\N	0.00	0	f	\N	\N	\N	12/12/2024	2
250	45	16	\N	19:24	Marco Aurelio	2	8540205	\N	250.00	300.00	50.00	25000.00	\N	0.00	0	t	\N	\N	\N	12/12/2024	2
251	45	17	11	19:26		2	8540205	\N	73.00	100.00	27.00	7300.00	\N	0.00	0	f	\N	\N	\N	12/12/2024	2
252	45	18	12	19:28		2	8540205	\N	130.00	150.00	20.00	13000.00	\N	0.00	0	f	\N	\N	\N	12/12/2024	2
253	45	19	8	19:29		2	8540205	\N	141.00	160.00	19.00	14100.00	\N	0.00	0	f	\N	\N	\N	12/12/2024	2
254	45	20	20	19:30		2	8540205	\N	165.00	\N	0.00	16500.00	17000.00	500.00	0	f	\N	\N	\N	12/12/2024	2
255	45	21	9	19:31		2	8540205	\N	95.00	100.00	5.00	9500.00	\N	0.00	0	f	\N	\N	\N	12/12/2024	2
256	45	22	6	19:33		0	8540205	\N	88.00	100.00	12.00	8800.00	\N	0.00	0	f	\N	\N	\N	12/12/2024	2
257	45	23	13	19:41		0	8540205	\N	138.00	150.00	12.00	13800.00	\N	0.00	0	f	\N	\N	\N	12/12/2024	2
258	45	24	15	19:42		0	8540205	\N	60.00	60.00	0.00	6000.00	\N	0.00	0	f	\N	\N	\N	12/12/2024	2
259	45	25	1	19:43		0	8540205	\N	75.00	100.00	25.00	7500.00	\N	0.00	0	f	\N	\N	\N	12/12/2024	2
260	45	26	3	19:45		0	8540205	\N	150.00	0.00	0.00	15000.00	15000.00	0.00	0	f	\N	\N	\N	12/12/2024	2
261	45	27	10	19:45		0	8540205	\N	118.00	120.00	2.00	11800.00	\N	0.00	0	f	\N	\N	\N	12/12/2024	2
263	46	29	1	19:52		2	8540205	\N	110.00	120.00	10.00	11000.00	\N	0.00	0	f	\N	\N	\N	12/12/2024	2
264	46	30	3	19:53		2	8540205	\N	125.00	150.00	25.00	12500.00	\N	0.00	0	f	\N	\N	\N	12/12/2024	2
298	47	15	4	22:49		2	8540205	\N	225.00	225.00	0.00	22500.00	\N	0.00	0	f	\N	\N	\N	13/12/2024	2
276	46	41	7	23:04		2	8540205	\N	96.00	100.00	4.00	9600.00	\N	0.00	0	f	\N	\N	\N	12/12/2024	2
262	46	28	17	19:50		2	8540205	\N	390.00	400.00	10.00	39000.00	\N	0.00	0	f	\N	\N	\N	12/12/2024	2
265	46	31	2	19:55		2	8540205	\N	70.00	100.00	30.00	7000.00	\N	0.00	0	f	\N	\N	\N	12/12/2024	2
266	46	32	8	19:56		2	8540205	4	175.00	200.00	25.00	17500.00	\N	0.00	1	f	\N	\N	\N	12/12/2024	2
267	46	33	4	20:18		2	8540205	6	120.00	120.00	0.00	12000.00	\N	0.00	1	f	\N	\N	\N	12/12/2024	2
268	46	34	6	20:19		2	8540205	\N	103.00	50.00	0.00	10300.00	6000.00	700.00	0	f	\N	\N	\N	12/12/2024	2
269	46	35	5	20:21		2	8540205	\N	485.00	500.00	15.00	48500.00	\N	0.00	0	f	\N	\N	\N	12/12/2024	2
271	46	36	2	20:22		2	8540205	8	46.00	45.00	0.00	4600.00	\N	0.00	1	f	1.00	\N	\N	12/12/2024	2
272	46	37	19	20:28		2	8540205	\N	190.00	200.00	10.00	19000.00	\N	0.00	0	f	\N	\N	\N	12/12/2024	2
273	46	38	12	20:29		2	8540205	\N	280.00	0.00	0.00	28000.00	\N	0.00	0	f	\N	280.00	\N	12/12/2024	2
274	46	39	11	23:02		2	8540205	\N	120.00	120.00	0.00	12000.00	\N	0.00	0	f	\N	\N	\N	12/12/2024	2
275	46	40	6	23:03		2	8540205	\N	170.00	200.00	30.00	17000.00	\N	0.00	0	f	\N	\N	\N	12/12/2024	2
277	46	42	9	23:05		2	8540205	\N	178.00	180.00	2.00	17800.00	\N	0.00	0	f	\N	\N	\N	12/12/2024	2
278	46	43	1	23:06		2	8540205	\N	60.00	60.00	0.00	6000.00	\N	0.00	0	f	\N	\N	\N	12/12/2024	2
279	46	44	16	23:06		2	8540205	\N	75.00	\N	0.00	7500.00	8000.00	500.00	0	f	\N	\N	\N	12/12/2024	2
280	46	45	10	23:14		2	8540205	\N	56.00	60.00	4.00	5600.00	\N	0.00	0	f	\N	\N	\N	12/12/2024	2
281	46	46	14	23:15		2	8540205	\N	28.00	30.00	2.00	2800.00	\N	0.00	0	f	\N	\N	\N	12/12/2024	2
282	46	47	15	23:16		2	8540205	\N	103.00	150.00	47.00	10300.00	\N	0.00	0	f	\N	\N	\N	12/12/2024	2
283	46	48	8	23:16		2	8540205	\N	175.00	200.00	25.00	17500.00	\N	0.00	0	f	\N	\N	\N	12/12/2024	2
299	47	16	16	22:49		2	8540205	\N	120.00	150.00	30.00	12000.00	\N	0.00	0	f	\N	\N	\N	13/12/2024	2
284	47	1	5	10:17		2	8540205	\N	148.00	150.00	2.00	14800.00	\N	0.00	0	f	\N	\N	\N	13/12/2024	2
285	47	2	3	10:19		2	8540205	\N	46.00	50.00	4.00	4600.00	\N	0.00	0	f	\N	\N	\N	13/12/2024	2
286	47	3	1	10:21		2	8540205	\N	28.00	28.00	0.00	2800.00	\N	0.00	0	f	\N	\N	\N	13/12/2024	2
287	47	4	2	10:21		2	8540205	\N	60.00	100.00	40.00	6000.00	\N	0.00	0	f	\N	\N	\N	13/12/2024	2
288	47	5	16	10:22		2	8540205	\N	60.00	70.00	10.00	6000.00	\N	0.00	0	f	\N	\N	\N	13/12/2024	2
289	47	6	8	10:22		2	8540205	\N	115.00	150.00	35.00	11500.00	\N	0.00	0	f	\N	\N	\N	13/12/2024	2
290	47	7	1	11:27	bien cocido	2	8540205	\N	115.00	150.00	35.00	11500.00	\N	0.00	0	f	\N	\N	\N	13/12/2024	2
291	47	8	2	11:27		2	8540205	\N	55.00	100.00	45.00	5500.00	\N	0.00	0	f	\N	\N	\N	13/12/2024	2
292	47	9	3	11:27		2	8540205	\N	85.00	100.00	15.00	8500.00	\N	0.00	0	f	\N	\N	\N	13/12/2024	2
293	47	10	6	11:28		2	8540205	\N	156.00	160.00	4.00	15600.00	\N	0.00	0	f	\N	\N	\N	13/12/2024	2
294	47	11	17	11:28		2	8540205	\N	55.00	60.00	5.00	5500.00	\N	0.00	0	f	\N	\N	\N	13/12/2024	2
295	47	12	10	11:28		2	8540205	\N	170.00	200.00	30.00	17000.00	\N	0.00	0	f	\N	\N	\N	13/12/2024	2
296	47	13	\N	11:29	Fernando Torrez	2	8540205	\N	50.00	50.00	0.00	5000.00	\N	0.00	0	t	\N	\N	\N	13/12/2024	2
297	47	14	1	22:48		2	8540205	\N	75.00	100.00	25.00	7500.00	\N	0.00	0	f	\N	\N	\N	13/12/2024	2
300	47	17	17	22:50		2	8540205	\N	126.00	130.00	4.00	12600.00	\N	0.00	0	f	\N	\N	\N	13/12/2024	2
301	47	18	20	22:51		2	8540205	\N	150.00	150.00	0.00	15000.00	\N	0.00	0	f	\N	\N	\N	13/12/2024	2
302	47	19	19	22:51		2	8540205	\N	90.00	100.00	10.00	9000.00	\N	0.00	0	f	\N	\N	\N	13/12/2024	2
303	47	20	6	22:52		2	8540205	\N	100.00	100.00	0.00	10000.00	\N	0.00	0	f	\N	\N	\N	13/12/2024	2
304	47	21	15	22:53		2	8540205	\N	73.00	100.00	27.00	7300.00	\N	0.00	0	f	\N	\N	\N	13/12/2024	2
305	47	22	8	22:53		2	8540205	\N	140.00	\N	0.00	14000.00	14000.00	0.00	0	f	\N	\N	\N	13/12/2024	2
306	47	23	3	22:54		2	8540205	\N	110.00	110.00	0.00	11000.00	\N	0.00	0	f	\N	\N	\N	13/12/2024	2
307	47	24	4	22:55		2	8540205	\N	75.00	100.00	25.00	7500.00	\N	0.00	0	f	\N	\N	\N	13/12/2024	2
308	47	25	10	22:55		2	8540205	\N	145.00	\N	0.00	14500.00	\N	0.00	0	f	\N	145.00	\N	13/12/2024	2
309	47	26	11	22:57		2	8540205	\N	93.00	100.00	7.00	9300.00	\N	0.00	0	f	\N	\N	\N	13/12/2024	2
310	47	27	\N	22:58	Lucrecia Mamani	2	8540205	\N	200.00	200.00	0.00	20000.00	\N	0.00	0	t	\N	\N	\N	13/12/2024	2
311	47	28	9	22:59		2	8540205	\N	173.00	100.00	0.00	17300.00	8000.00	700.00	0	f	\N	\N	\N	13/12/2024	2
319	47	34	\N	23:15		2	8540205	\N	1000.00	1000.00	0.00	100000.00	\N	0.00	0	f	\N	\N	\N	13/12/2024	2
312	47	29	\N	23:03	Compra en cantidad por acontecimiento en el restaurante	2	8540205	\N	2750.00	2750.00	0.00	275000.00	\N	0.00	0	f	\N	\N	\N	13/12/2024	2
313	47	30	\N	23:05	Compra por acontecimiento	2	8540205	\N	840.00	850.00	10.00	84000.00	\N	0.00	0	f	\N	\N	\N	13/12/2024	2
314	47	31	\N	23:07	Compra de medianas por acontecimiento	2	8540205	\N	2040.00	2040.00	0.00	204000.00	\N	0.00	0	f	\N	\N	\N	13/12/2024	2
315	47	32	\N	23:09	Compra por acontecimiento	2	8540205	\N	3315.00	3320.00	5.00	331500.00	\N	0.00	0	f	\N	\N	\N	13/12/2024	2
316	47	33	\N	23:11		2	8540205	28	10250.00	\N	0.00	1025000.00	1025000.00	0.00	1	f	\N	\N	\N	13/12/2024	2
320	47	35	\N	23:15		2	8540205	\N	300.00	300.00	0.00	30000.00	\N	0.00	0	f	\N	\N	\N	13/12/2024	2
321	47	36	\N	23:19		2	8540205	\N	4930.00	4930.00	0.00	493000.00	\N	0.00	0	f	\N	\N	\N	13/12/2024	2
322	47	37	\N	23:20		2	8540205	\N	2705.00	2700.00	0.00	270500.00	\N	0.00	0	f	5.00	\N	\N	13/12/2024	2
323	48	1	2	22:06		2	8540205	\N	73.00	100.00	27.00	7450.00	\N	0.00	0	f	\N	\N	\N	14/12/2024	2
324	48	2	4	22:11		2	8540205	\N	83.00	90.00	7.00	8500.00	\N	0.00	0	f	\N	\N	\N	14/12/2024	2
325	48	3	5	22:12		2	8540205	\N	120.00	200.00	80.00	12250.00	\N	0.00	0	f	\N	\N	\N	14/12/2024	2
326	48	4	8	22:13		2	8540205	\N	130.00	150.00	20.00	13300.00	\N	0.00	0	f	\N	\N	\N	14/12/2024	2
327	48	5	10	22:13		2	8540205	\N	30.00	30.00	0.00	3100.00	\N	0.00	0	f	\N	\N	\N	14/12/2024	2
328	48	6	\N	22:14	Luis Aguirre	2	8540205	\N	100.00	\N	0.00	10250.00	10250.00	0.00	0	t	\N	\N	\N	14/12/2024	2
329	48	7	9	22:15		0	8540205	\N	115.00	\N	0.00	11750.00	\N	0.00	0	f	\N	115.00	\N	14/12/2024	2
330	48	8	9	22:24		0	8540205	\N	118.00	20.00	0.00	12050.00	\N	0.00	0	f	\N	98.00	\N	14/12/2024	2
331	48	9	16	22:25		0	8540205	\N	46.00	50.00	4.00	4700.00	\N	0.00	0	f	\N	\N	\N	14/12/2024	2
332	48	10	20	22:25		0	8540205	\N	50.00	40.00	0.00	5150.00	\N	0.00	0	f	10.00	\N	\N	14/12/2024	2
333	48	11	6	22:26		0	8540205	\N	90.00	100.00	10.00	9200.00	\N	0.00	0	f	\N	\N	\N	14/12/2024	2
334	48	12	5	22:27		0	8540205	\N	51.00	60.00	9.00	5250.00	\N	0.00	0	f	\N	\N	\N	14/12/2024	2
335	48	13	\N	22:27		0	8540205	\N	23.00	30.00	7.00	2350.00	\N	0.00	0	f	\N	\N	\N	14/12/2024	2
336	48	14	3	22:27		0	8540205	\N	65.00	70.00	5.00	6650.00	\N	0.00	0	f	\N	\N	\N	14/12/2024	2
337	48	15	9	22:27		0	8540205	\N	75.00	100.00	25.00	7700.00	\N	0.00	0	f	\N	\N	\N	14/12/2024	2
338	48	16	8	22:28		0	8540205	\N	50.00	50.00	0.00	5150.00	\N	0.00	0	f	\N	\N	\N	14/12/2024	2
339	48	17	15	22:28		0	8540205	\N	56.00	70.00	14.00	5750.00	\N	0.00	0	f	\N	\N	\N	14/12/2024	2
340	48	18	7	22:28		0	8540205	\N	60.00	60.00	0.00	6150.00	\N	0.00	0	f	\N	\N	\N	14/12/2024	2
341	48	19	1	22:29		0	8540205	\N	115.00	120.00	5.00	11750.00	\N	0.00	0	f	\N	\N	\N	14/12/2024	2
342	48	20	12	22:31		0	8540205	\N	20.00	20.00	0.00	2050.00	\N	0.00	0	f	\N	\N	\N	14/12/2024	2
343	48	21	\N	22:32		0	8540205	\N	60.00	100.00	40.00	6150.00	\N	0.00	0	f	\N	\N	\N	14/12/2024	2
344	49	1	\N	23:11		0	8540205	\N	66.00	100.00	34.00	6600.00	\N	0.00	0	f	\N	\N	\N	15/12/2024	2
345	49	2	2	23:11		0	8540205	\N	75.00	80.00	5.00	7500.00	\N	0.00	0	f	\N	\N	\N	15/12/2024	2
346	49	3	\N	23:12		0	8540205	\N	60.00	100.00	40.00	6000.00	\N	0.00	0	f	\N	\N	\N	15/12/2024	2
347	49	4	\N	23:12		0	8540205	\N	65.00	100.00	35.00	6500.00	\N	0.00	0	f	\N	\N	\N	15/12/2024	2
348	49	5	\N	23:12		0	8540205	\N	120.00	120.00	0.00	12000.00	\N	0.00	0	f	\N	\N	\N	15/12/2024	2
349	49	6	\N	23:12		0	8540205	\N	98.00	100.00	2.00	9800.00	\N	0.00	0	f	\N	\N	\N	15/12/2024	2
350	49	7	\N	23:13		0	8540205	\N	150.00	150.00	0.00	15000.00	\N	0.00	0	f	\N	\N	\N	15/12/2024	2
351	49	8	\N	23:13		0	8540205	\N	78.00	\N	0.00	7800.00	8000.00	200.00	0	f	\N	\N	\N	15/12/2024	2
352	49	9	\N	23:13	Lucas M.	0	8540205	\N	100.00	\N	0.00	10000.00	\N	0.00	0	t	\N	100.00	\N	15/12/2024	2
353	49	10	\N	23:14		0	8540205	7	120.00	150.00	30.00	12000.00	\N	0.00	2	f	\N	0.00	\N	15/12/2024	2
355	49	11	1	23:25		0	8540205	\N	120.00	110.00	0.00	12000.00	\N	0.00	0	f	10.00	\N	\N	15/12/2024	2
356	49	12	4	23:25		0	8540205	\N	60.00	\N	0.00	6000.00	5000.00	0.00	0	f	\N	\N	1000.00	15/12/2024	2
357	49	13	10	23:26		0	8540205	\N	20.00	20.00	0.00	2000.00	\N	0.00	0	f	\N	\N	\N	15/12/2024	2
358	49	14	\N	23:26		0	8540205	\N	50.00	50.00	0.00	5000.00	\N	0.00	0	f	\N	\N	\N	15/12/2024	2
359	49	15	\N	23:27		0	8540205	\N	118.00	120.00	2.00	11800.00	\N	0.00	0	f	\N	\N	\N	15/12/2024	2
360	49	16	\N	23:27		0	8540205	\N	73.00	100.00	27.00	7300.00	\N	0.00	0	f	\N	\N	\N	15/12/2024	2
361	49	17	20	23:27		0	8540205	\N	85.00	100.00	15.00	8500.00	\N	0.00	0	f	\N	\N	\N	15/12/2024	2
362	49	18	\N	23:27		0	8540205	\N	120.00	\N	0.00	12000.00	\N	0.00	0	f	\N	120.00	\N	15/12/2024	2
363	49	19	8	23:28		0	8540205	\N	73.00	\N	0.00	7300.00	\N	0.00	0	f	\N	73.00	\N	15/12/2024	2
371	50	8	6	08:00		2	8540205	\N	196.00	90.00	4.00	19600.00	11000.00	0.00	0	f	\N	\N	\N	16/12/2024	2
375	50	12	8	08:07		2	8540205	\N	43.00	40.00	0.00	4300.00	300.00	0.00	0	f	\N	\N	\N	16/12/2024	2
376	50	13	4	08:08		2	8540205	\N	99.00	100.00	1.00	9900.00	\N	0.00	0	f	\N	\N	\N	16/12/2024	2
377	50	14	1	08:10		2	8540205	\N	185.00	100.00	0.00	18500.00	8500.00	0.00	0	f	\N	\N	\N	16/12/2024	2
388	50	25	0	08:22		2	8540205	\N	31.00	\N	0.00	3100.00	5000.00	1900.00	0	f	\N	\N	\N	16/12/2024	2
393	50	30	6	08:28		2	8540205	\N	243.00	260.00	27.00	24300.00	1000.00	0.00	0	f	\N	\N	\N	16/12/2024	2
397	50	34	0	08:33		0	8540205	\N	56.00	50.00	0.00	5600.00	\N	0.00	0	f	\N	6.00	\N	16/12/2024	2
398	50	35	10	08:34		0	8540205	\N	105.00	\N	0.00	10500.00	\N	0.00	0	f	\N	105.00	\N	16/12/2024	2
364	50	1	2	07:39		2	8540205	\N	105.00	105.00	0.00	10500.00	\N	0.00	0	f	\N	\N	\N	16/12/2024	2
365	50	2	10	07:52		2	8540205	\N	43.00	50.00	7.00	4300.00	\N	0.00	0	f	\N	\N	\N	16/12/2024	2
366	50	3	\N	07:53	jose	2	8540205	\N	100.00	\N	0.00	10000.00	10000.00	0.00	0	t	\N	\N	\N	16/12/2024	2
367	50	4	15	07:53		2	8540205	\N	65.00	\N	0.00	6500.00	\N	0.00	0	f	\N	65.00	\N	16/12/2024	2
368	50	5	3	07:53		2	8540205	\N	56.00	60.00	4.00	5600.00	\N	0.00	0	f	\N	\N	\N	16/12/2024	2
369	50	6	20	07:55		2	8540205	\N	80.00	40.00	0.00	8000.00	3000.00	0.00	0	f	\N	10.00	\N	16/12/2024	2
370	50	7	9	07:58		2	8540205	\N	46.00	\N	0.00	4600.00	\N	0.00	0	f	\N	46.00	\N	16/12/2024	2
372	50	9	\N	08:02		2	8540205	\N	80.00	100.00	20.00	8000.00	\N	0.00	0	f	\N	\N	\N	16/12/2024	2
373	50	10	16	08:04		2	8540205	\N	105.00	\N	0.00	10500.00	\N	0.00	0	f	\N	105.00	\N	16/12/2024	2
374	50	11	12	08:05		2	8540205	\N	56.00	\N	0.00	5600.00	5600.00	0.00	0	f	\N	\N	\N	16/12/2024	2
378	50	15	1	08:11		2	8540205	\N	148.00	\N	0.00	14800.00	20000.00	5200.00	0	t	\N	\N	\N	16/12/2024	2
379	50	16	\N	08:12		2	8540205	\N	20.00	20.00	0.00	2000.00	\N	0.00	0	t	\N	\N	\N	16/12/2024	2
380	50	17	19	08:13		2	8540205	\N	170.00	\N	0.00	17000.00	\N	0.00	0	f	\N	170.00	\N	16/12/2024	2
381	50	18	4	08:14		2	8540205	\N	40.00	50.00	10.00	4000.00	\N	0.00	0	f	\N	\N	\N	16/12/2024	2
382	50	19	8	08:15		2	8540205	\N	108.00	4.00	0.00	10800.00	10400.00	0.00	0	f	\N	\N	\N	16/12/2024	2
383	50	20	17	08:16		2	8540205	\N	90.00	100.00	10.00	9000.00	\N	0.00	0	f	\N	\N	\N	16/12/2024	2
384	50	21	\N	08:16		2	8540205	\N	70.00	70.00	0.00	7000.00	\N	0.00	0	t	\N	\N	\N	16/12/2024	2
385	50	22	18	08:18		2	8540205	\N	110.00	100.00	0.00	11000.00	1000.00	0.00	0	f	\N	\N	\N	16/12/2024	2
386	50	23	\N	08:18		2	8540205	\N	103.00	110.00	7.00	10300.00	\N	0.00	0	t	\N	\N	\N	16/12/2024	2
387	50	24	7	08:21		2	8540205	\N	51.00	51.00	0.00	5100.00	\N	0.00	0	f	\N	\N	\N	16/12/2024	2
389	50	26	1	08:23		2	8540205	\N	83.00	50.00	17.00	8300.00	5000.00	0.00	0	f	\N	\N	\N	16/12/2024	2
391	50	28	9	08:25		2	8540205	\N	113.00	100.00	0.00	11300.00	\N	0.00	0	f	\N	13.00	\N	16/12/2024	2
392	50	29	12	08:27		2	8540205	\N	150.00	60.00	0.00	15000.00	6000.00	0.00	0	f	\N	30.00	\N	16/12/2024	2
390	50	27	6	08:24		2	8540205	\N	70.00	\N	0.00	7000.00	\N	0.00	0	f	\N	70.00	\N	16/12/2024	2
399	50	36	5	08:38		0	8540205	\N	66.00	100.00	34.00	6600.00	\N	0.00	0	f	\N	\N	\N	16/12/2024	2
400	50	37	3	08:39		0	8540205	\N	55.00	50.00	0.00	5500.00	\N	0.00	0	f	\N	5.00	\N	16/12/2024	2
401	50	38	16	08:42		0	8540205	\N	105.00	5.00	0.00	10500.00	10000.00	0.00	0	f	\N	\N	\N	16/12/2024	2
402	50	39	\N	08:42		0	8540205	\N	100.00	100.00	0.00	10000.00	\N	0.00	0	t	\N	\N	\N	16/12/2024	2
395	50	32	9	08:31		1	8540205	\N	75.00	\N	0.00	7500.00	\N	0.00	0	f	\N	75.00	\N	16/12/2024	2
396	50	33	\N	08:33		1	8540205	\N	241.00	50.00	0.00	24100.00	\N	0.00	0	t	\N	200.00	\N	16/12/2024	2
403	50	40	20	08:44		0	8540205	\N	80.00	100.00	20.00	8000.00	\N	0.00	0	f	\N	\N	\N	16/12/2024	2
405	50	42	10	10:42		0	8540205	3	65.00	20.00	0.00	6500.00	2000.00	0.00	1	f	\N	25.00	\N	16/12/2024	2
394	50	31	\N	08:30		2	8540205	\N	60.00	50.00	0.00	6000.00	1000.00	0.00	0	t	\N	\N	\N	16/12/2024	2
404	50	41	8	08:46		0	8540205	32	145.00	100.00	0.00	14500.00	5000.00	500.00	1	f	\N	\N	\N	16/12/2024	2
406	52	1	2	22:05		0	8540205	\N	100.00	100.00	0.00	1150.00	\N	0.00	0	f	\N	\N	\N	10/02/2025	2
407	52	2	4	22:06		0	8540205	\N	180.00	200.00	20.00	2000.00	\N	0.00	0	f	\N	\N	\N	10/02/2025	2
408	52	3	6	22:06		0	8540205	\N	111.00	121.00	10.00	1250.00	\N	0.00	0	f	\N	\N	\N	10/02/2025	2
409	52	4	10	22:07		0	8540205	\N	100.00	100.00	0.00	1150.00	\N	0.00	0	f	\N	\N	\N	10/02/2025	2
410	53	1	13	10:22		0	8540205	\N	243.00	\N	0.00	27050.00	28000.00	950.00	0	f	\N	\N	\N	11/02/2025	2
412	53	3	4	10:23		0	8540205	\N	145.00	200.00	55.00	16150.00	\N	0.00	0	f	\N	\N	\N	11/02/2025	2
413	53	4	6	10:31		0	8540205	\N	133.00	135.00	2.00	14800.00	\N	0.00	0	f	\N	\N	\N	11/02/2025	2
414	53	5	2	10:31	Para Marcos	0	8540205	\N	100.00	100.00	0.00	11150.00	\N	0.00	0	t	\N	\N	\N	11/02/2025	2
415	53	6	8	10:43		0	8540205	\N	51.00	51.00	0.00	5700.00	\N	0.00	0	f	\N	\N	\N	11/02/2025	2
417	53	8	10	15:16		0	8540205	\N	120.00	\N	0.00	13350.00	\N	0.00	0	f	\N	\N	\N	11/02/2025	1
416	53	7	\N	11:07		0	8540205	\N	70.00	100.00	30.00	7800.00	\N	0.00	0	f	\N	\N	\N	11/02/2025	1
418	53	1	3	11:05		0	8540205	\N	130.00	130.00	0.00	14450.00	\N	0.00	0	f	\N	\N	\N	12/02/2025	2
434	57	3	10	23:25		1	8540205	\N	125.00	\N	0.00	8950.00	\N	0.00	0	f	\N	125.00	\N	27/05/2025	2
435	57	4	2	23:25		1	8540205	\N	130.00	\N	0.00	9300.00	\N	0.00	0	f	\N	\N	\N	27/05/2025	1
419	53	2	\N	18:01		0	8540205	\N	20.00	20.00	0.00	2250.00	\N	0.00	0	f	\N	\N	\N	12/02/2025	2
436	57	5	5	23:26		1	8540205	\N	79.00	50.00	0.00	5650.00	6000.00	3900.00	0	f	\N	\N	\N	27/05/2025	2
437	57	6	12	23:28		1	8540205	\N	135.00	200.00	65.00	9650.00	\N	0.00	0	f	\N	\N	\N	27/05/2025	2
420	54	3	2	19:24		0	8540205	\N	20.00	20.00	0.00	2250.00	\N	0.00	0	f	\N	\N	\N	12/02/2025	2
438	58	1	3	15:22		0	123456	\N	80.00	100.00	20.00	80000.00	\N	0.00	0	f	\N	\N	\N	04/09/2025	2
439	58	2	10	15:24	Bien cocido	0	123456	\N	108.00	\N	0.00	108000.00	110000.00	2000.00	0	f	\N	\N	\N	04/09/2025	2
440	58	3	8	15:26		0	123456	\N	23.00	23.00	0.00	23000.00	\N	0.00	0	f	\N	\N	\N	04/09/2025	2
421	55	4	1	22:08		0	8540205	\N	45.00	50.00	5.00	5000.00	\N	0.00	0	f	\N	\N	\N	12/02/2025	2
441	58	4	\N	15:26		0	123456	\N	31.00	40.00	9.00	31000.00	\N	0.00	0	f	\N	\N	\N	04/09/2025	2
442	58	5	1	15:27		0	123456	\N	50.00	50.00	0.00	50000.00	\N	0.00	0	f	\N	\N	\N	04/09/2025	2
423	55	1	\N	11:22		0	8540205	\N	40.00	20.00	0.00	4450.00	2500.00	250.00	0	f	\N	\N	\N	13/02/2025	2
424	55	2	\N	14:52		0	8540205	\N	65.00	50.00	0.00	7250.00	2000.00	300.00	0	f	\N	\N	\N	13/02/2025	2
431	56	7	7	16:44		0	8540205	3	115.00	200.00	85.00	12800.00	\N	0.00	1	f	\N	\N	\N	02/05/2025	2
425	56	1	3	11:01		1	8540205	\N	55.00	100.00	45.00	6150.00	\N	0.00	0	f	\N	\N	\N	02/05/2025	2
426	56	2	10	11:11		1	8540205	\N	113.00	50.00	0.00	12600.00	7000.00	0.00	0	f	\N	\N	\N	02/05/2025	2
427	56	3	20	11:16		1	8540205	\N	123.00	200.00	77.00	13700.00	0.00	0.00	0	f	\N	\N	\N	02/05/2025	2
428	56	4	\N	11:17	para Lucrecia	1	8540205	\N	115.00	120.00	5.00	12800.00	\N	0.00	0	t	\N	\N	\N	02/05/2025	2
429	56	5	5	11:21		1	8540205	\N	200.00	0.00	0.00	22250.00	23000.00	750.00	0	f	\N	\N	\N	02/05/2025	2
430	56	6	6	11:23		1	8540205	\N	210.00	\N	0.00	23350.00	\N	0.00	0	f	\N	210.00	\N	02/05/2025	2
443	58	6	\N	15:27	para Lucrecia	0	123456	\N	100.00	100.00	0.00	100000.00	\N	0.00	0	t	\N	\N	\N	04/09/2025	2
444	58	7	9	15:29		0	123456	\N	26.00	30.00	4.00	26000.00	\N	0.00	0	f	\N	\N	\N	04/09/2025	2
432	57	1	4	23:23		1	8540205	3	118.00	120.00	2.00	8450.00	\N	0.00	1	f	\N	\N	\N	27/05/2025	2
433	57	2	\N	23:24	Para Tomas	1	8540205	\N	110.00	\N	0.00	7900.00	8000.00	100.00	0	t	\N	\N	\N	27/05/2025	2
445	58	8	3	15:30		0	123456	\N	51.00	51.00	0.00	51000.00	\N	0.00	0	f	\N	\N	\N	04/09/2025	2
446	58	9	2	15:35		0	123456	\N	55.00	60.00	5.00	55000.00	\N	0.00	0	f	\N	\N	\N	04/09/2025	2
448	59	1	\N	11:52		0	8540205	\N	20.00	20.00	0.00	2000.00	\N	0.00	0	t	\N	\N	\N	08/09/2025	2
449	59	1	\N	11:04		0	8540205	\N	60.00	100.00	40.00	6000.00	\N	0.00	0	f	\N	\N	\N	09/09/2025	2
450	59	2	\N	11:04		0	8540205	\N	40.00	50.00	10.00	4000.00	\N	0.00	0	f	\N	\N	\N	09/09/2025	2
451	59	3	\N	11:05		0	8540205	\N	50.00	100.00	50.00	5000.00	\N	0.00	0	f	\N	\N	\N	09/09/2025	2
452	59	4	\N	11:05		0	8540205	\N	40.00	\N	0.00	4000.00	\N	0.00	0	f	\N	40.00	\N	09/09/2025	2
453	59	5	\N	11:06		0	8540205	5	50.00	\N	0.00	5000.00	10000.00	5000.00	1	f	\N	\N	\N	09/09/2025	2
465	60	15	\N	18:44		0	8540205	\N	100.00	220.00	120.00	12500.00	\N	0.00	0	f	\N	\N	\N	09/09/2025	2
454	59	6	\N	11:30		0	8540205	3	20.00	20.00	0.00	2000.00	\N	0.00	2	f	\N	\N	\N	09/09/2025	2
456	60	8	\N	15:29		0	8540205	9	20.00	20.00	0.00	2500.00	\N	0.00	2	f	\N	\N	\N	09/09/2025	2
455	60	7	2	11:42		0	8540205	7	20.00	20.00	0.00	2500.00	\N	0.00	2	f	\N	\N	\N	09/09/2025	2
461	60	11	\N	18:09		0	8540205	3	20.00	20.00	0.00	2500.00	\N	0.00	2	f	\N	\N	\N	09/09/2025	2
459	60	9	\N	17:05		0	8540205	2	20.00	20.00	0.00	2500.00	\N	0.00	2	f	\N	\N	\N	09/09/2025	2
460	60	10	\N	17:26		0	8540205	3	20.00	20.00	0.00	2500.00	\N	0.00	2	f	\N	\N	\N	09/09/2025	2
462	60	12	\N	18:35		0	8540205	4	20.00	20.00	0.00	2500.00	\N	0.00	1	f	\N	\N	\N	09/09/2025	2
466	61	1	4	11:08		0	8540205	\N	30.00	100.00	70.00	3000.00	\N	0.00	0	f	\N	\N	\N	12/09/2025	2
463	60	13	\N	18:36		0	8540205	2	20.00	20.00	0.00	2500.00	\N	0.00	2	f	\N	\N	\N	09/09/2025	2
464	60	14	\N	18:44		0	8540205	\N	300.00	100.00	0.00	37500.00	20000.00	0.00	0	f	\N	40.00	\N	09/09/2025	2
467	61	2	7	11:09		0	8540205	\N	130.00	\N	0.00	13000.00	13000.00	0.00	0	f	\N	\N	\N	12/09/2025	2
468	61	3	1	11:15		0	8540205	\N	125.00	\N	0.00	12500.00	\N	0.00	0	f	\N	125.00	\N	12/09/2025	2
469	61	4	\N	11:16		0	8540205	\N	136.00	\N	0.00	13600.00	15000.00	1400.00	0	f	\N	\N	\N	12/09/2025	2
470	61	5	\N	11:18	Para Marco	0	8540205	\N	90.00	100.00	10.00	9000.00	\N	0.00	0	t	\N	\N	\N	12/09/2025	2
471	61	6	5	11:19		0	8540205	\N	60.00	60.00	0.00	6000.00	\N	0.00	0	f	\N	\N	\N	12/09/2025	2
472	61	7	2	11:24		0	8540205	\N	55.00	50.00	0.00	5500.00	500.00	0.00	0	f	\N	\N	\N	12/09/2025	2
473	61	8	4	11:26		0	8540205	\N	31.00	41.00	10.00	3100.00	\N	0.00	0	f	\N	\N	\N	12/09/2025	2
474	61	9	11	11:26		0	8540205	\N	95.00	100.00	5.00	9500.00	\N	0.00	0	f	\N	\N	\N	12/09/2025	2
475	61	10	12	11:29		0	8540205	\N	23.00	\N	0.00	2300.00	2500.00	200.00	0	f	\N	\N	\N	12/09/2025	2
476	61	11	6	11:29		0	8540205	\N	50.00	\N	0.00	5000.00	\N	0.00	0	f	\N	50.00	\N	12/09/2025	2
477	61	12	\N	11:30		0	8540205	\N	103.00	110.00	7.00	10300.00	\N	0.00	0	f	\N	\N	\N	12/09/2025	2
480	62	1	2	16:38		2	8540205	\N	50.00	100.00	50.00	5000.00	\N	0.00	0	f	\N	\N	\N	15/09/2025	2
481	62	2	3	16:39		2	8540205	\N	55.00	\N	0.00	5500.00	6000.00	500.00	0	f	\N	\N	\N	15/09/2025	2
482	62	3	\N	16:40	Para Liliana	2	8540205	\N	100.00	50.00	0.00	10000.00	\N	0.00	0	t	\N	50.00	\N	15/09/2025	2
483	62	4	7	16:40		2	8540205	\N	75.00	100.00	25.00	7500.00	\N	0.00	0	f	\N	\N	\N	15/09/2025	2
484	62	5	5	16:41		2	8540205	\N	23.00	50.00	27.00	2300.00	\N	0.00	0	f	\N	\N	\N	15/09/2025	2
485	62	6	10	16:41		2	8540205	\N	63.00	\N	0.00	6300.00	10000.00	3700.00	0	f	\N	\N	\N	15/09/2025	2
486	62	7	8	16:42		2	8540205	\N	55.00	55.00	0.00	5500.00	\N	0.00	0	f	\N	\N	\N	15/09/2025	2
487	62	8	12	16:43		2	8540205	\N	103.00	103.00	0.00	10300.00	\N	0.00	0	f	\N	\N	\N	15/09/2025	2
488	62	9	5	16:43		2	8540205	\N	40.00	50.00	10.00	4000.00	\N	0.00	0	f	\N	\N	\N	15/09/2025	2
489	62	10	18	16:44		2	8540205	\N	31.00	31.00	0.00	3100.00	\N	0.00	0	f	\N	\N	\N	15/09/2025	2
490	62	11	1	16:51		2	8540205	\N	50.00	20.00	0.00	5000.00	3000.00	0.00	0	f	\N	\N	\N	15/09/2025	2
491	62	12	\N	16:51	Para Rocio	2	8540205	\N	75.00	\N	0.00	7500.00	\N	0.00	0	t	\N	75.00	\N	15/09/2025	2
492	62	13	16	16:52		2	8540205	\N	55.00	70.00	15.00	5500.00	\N	0.00	0	f	\N	0.00	\N	15/09/2025	2
493	62	14	\N	16:53		2	8540205	\N	75.00	\N	0.00	7500.00	10000.00	2500.00	0	f	\N	\N	\N	15/09/2025	2
500	62	21	6	16:57		0	8540205	\N	50.00	\N	0.00	5000.00	5000.00	0.00	0	f	\N	\N	\N	15/09/2025	2
501	62	22	2	16:57		0	8540205	\N	118.00	120.00	2.00	11800.00	\N	0.00	0	f	\N	\N	\N	15/09/2025	2
494	62	15	20	16:55		1	8540205	\N	45.00	100.00	55.00	4500.00	\N	0.00	0	f	\N	\N	\N	15/09/2025	2
495	62	16	5	16:55		1	8540205	\N	20.00	20.00	0.00	2000.00	\N	0.00	0	f	\N	\N	\N	15/09/2025	2
496	62	17	\N	16:55		1	8540205	\N	85.00	100.00	15.00	8500.00	\N	0.00	0	f	\N	\N	\N	15/09/2025	2
497	62	18	\N	16:55		1	8540205	\N	120.00	120.00	0.00	12000.00	\N	0.00	0	f	\N	\N	\N	15/09/2025	2
498	62	19	17	16:56		1	8540205	\N	129.00	200.00	71.00	12900.00	\N	0.00	0	f	\N	\N	\N	15/09/2025	2
499	62	20	\N	16:56	Para Lucas	1	8540205	\N	100.00	\N	0.00	10000.00	\N	0.00	0	t	\N	100.00	\N	15/09/2025	2
502	62	23	10	17:00		0	8540205	\N	113.00	100.00	0.00	11300.00	1500.00	200.00	0	f	\N	\N	\N	15/09/2025	2
503	62	24	\N	17:01	Para Fernando	0	8540205	\N	128.00	200.00	72.00	12800.00	0.00	0.00	0	t	\N	\N	\N	15/09/2025	2
504	62	25	13	17:01		0	8540205	\N	50.00	50.00	0.00	5000.00	\N	0.00	0	f	\N	\N	\N	15/09/2025	2
505	62	26	1	17:02		0	8540205	\N	125.00	\N	0.00	12500.00	12500.00	0.00	0	f	\N	\N	\N	15/09/2025	2
506	62	27	19	17:05		0	8540205	\N	46.00	50.00	4.00	4600.00	\N	0.00	0	f	\N	\N	\N	15/09/2025	2
507	62	28	17	17:06		0	8540205	\N	55.00	\N	0.00	5500.00	\N	0.00	0	f	\N	\N	\N	15/09/2025	1
508	62	29	6	17:07		0	8540205	\N	78.00	100.00	22.00	7800.00	\N	0.00	0	f	\N	\N	\N	15/09/2025	2
509	62	30	4	17:12		0	8540205	\N	71.00	101.00	30.00	7100.00	\N	0.00	0	f	\N	\N	\N	15/09/2025	2
511	62	31	\N	23:16		0	123456	\N	20.00	10.00	0.00	2000.00	2000.00	1000.00	0	f	\N	\N	\N	15/09/2025	2
\.


--
-- TOC entry 3506 (class 0 OID 0)
-- Dependencies: 232
-- Name: caja_ajuste_cod_ajuste_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.caja_ajuste_cod_ajuste_seq', 43, true);


--
-- TOC entry 3507 (class 0 OID 0)
-- Dependencies: 229
-- Name: caja_cod_caja_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.caja_cod_caja_seq', 1, false);


--
-- TOC entry 3508 (class 0 OID 0)
-- Dependencies: 230
-- Name: caja_cod_caja_seq1; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.caja_cod_caja_seq1', 62, true);


--
-- TOC entry 3509 (class 0 OID 0)
-- Dependencies: 239
-- Name: cliente_cod_cliente_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.cliente_cod_cliente_seq', 32, true);


--
-- TOC entry 3510 (class 0 OID 0)
-- Dependencies: 238
-- Name: detalle_venta_cod_item_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.detalle_venta_cod_item_seq', 1218, true);


--
-- TOC entry 3511 (class 0 OID 0)
-- Dependencies: 234
-- Name: insumo_producto_cod_producto_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.insumo_producto_cod_producto_seq', 2, true);


--
-- TOC entry 3512 (class 0 OID 0)
-- Dependencies: 211
-- Name: roles_cod_rol_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.roles_cod_rol_seq', 1, false);


--
-- TOC entry 3513 (class 0 OID 0)
-- Dependencies: 209
-- Name: usuario_ci_usuario_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.usuario_ci_usuario_seq', 1, false);


--
-- TOC entry 3514 (class 0 OID 0)
-- Dependencies: 235
-- Name: venta_cod_venta_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.venta_cod_venta_seq', 511, true);


--
-- TOC entry 3515 (class 0 OID 0)
-- Dependencies: 236
-- Name: venta_ticket_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.venta_ticket_seq', 1, true);


--
-- TOC entry 3293 (class 2606 OID 57990)
-- Name: caja_ajuste caja_ajuste_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.caja_ajuste
    ADD CONSTRAINT caja_ajuste_pkey PRIMARY KEY (cod_ajuste);


--
-- TOC entry 3291 (class 2606 OID 57961)
-- Name: caja caja_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.caja
    ADD CONSTRAINT caja_pkey PRIMARY KEY (cod_caja);


--
-- TOC entry 3271 (class 2606 OID 32882)
-- Name: categoria categoria_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.categoria
    ADD CONSTRAINT categoria_pkey PRIMARY KEY (cod_categoria);


--
-- TOC entry 3269 (class 2606 OID 32839)
-- Name: cliente cliente_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cliente
    ADD CONSTRAINT cliente_pkey PRIMARY KEY (cod_cliente);


--
-- TOC entry 3279 (class 2606 OID 32958)
-- Name: complemento complemento_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.complemento
    ADD CONSTRAINT complemento_pkey PRIMARY KEY (cod_complemento);


--
-- TOC entry 3285 (class 2606 OID 41435)
-- Name: detalle_movimiento_insumo detalle_movimiento_insumo_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.detalle_movimiento_insumo
    ADD CONSTRAINT detalle_movimiento_insumo_pkey PRIMARY KEY (cod_detalle_insumo);


--
-- TOC entry 3289 (class 2606 OID 33199)
-- Name: detalle_venta detalle_venta_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.detalle_venta
    ADD CONSTRAINT detalle_venta_pkey PRIMARY KEY (cod_item);


--
-- TOC entry 3277 (class 2606 OID 32922)
-- Name: insumo insumo_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.insumo
    ADD CONSTRAINT insumo_pkey PRIMARY KEY (cod_insumo);


--
-- TOC entry 3283 (class 2606 OID 33136)
-- Name: movimiento_insumo movimiento_insumo_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movimiento_insumo
    ADD CONSTRAINT movimiento_insumo_pkey PRIMARY KEY (cod_mov);


--
-- TOC entry 3281 (class 2606 OID 33012)
-- Name: opcion opcion_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.opcion
    ADD CONSTRAINT opcion_pkey PRIMARY KEY (cod_opcion);


--
-- TOC entry 3275 (class 2606 OID 32907)
-- Name: producto producto_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.producto
    ADD CONSTRAINT producto_pkey PRIMARY KEY (cod_producto);


--
-- TOC entry 3265 (class 2606 OID 32817)
-- Name: roles roles_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_pkey PRIMARY KEY (cod_rol);


--
-- TOC entry 3267 (class 2606 OID 32822)
-- Name: roles_usuarios roles_usuarios_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.roles_usuarios
    ADD CONSTRAINT roles_usuarios_pkey PRIMARY KEY (ci_usuario, cod_rol);


--
-- TOC entry 3273 (class 2606 OID 32897)
-- Name: subcategoria subcategoria_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.subcategoria
    ADD CONSTRAINT subcategoria_pkey PRIMARY KEY (cod_subcategoria);


--
-- TOC entry 3263 (class 2606 OID 32810)
-- Name: usuario usuario_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT usuario_pkey PRIMARY KEY (ci_usuario);


--
-- TOC entry 3287 (class 2606 OID 33184)
-- Name: venta venta_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.venta
    ADD CONSTRAINT venta_pkey PRIMARY KEY (cod_venta);


--
-- TOC entry 3316 (class 2606 OID 58003)
-- Name: caja caja_ci_usuario_c_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.caja
    ADD CONSTRAINT caja_ci_usuario_c_fkey FOREIGN KEY (ci_usuario_c) REFERENCES public.usuario(ci_usuario);


--
-- TOC entry 3317 (class 2606 OID 57955)
-- Name: caja caja_ci_usuario_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.caja
    ADD CONSTRAINT caja_ci_usuario_fkey FOREIGN KEY (ci_usuario_i) REFERENCES public.usuario(ci_usuario);


--
-- TOC entry 3314 (class 2606 OID 83047)
-- Name: complemento_opcion complemento_opcion_cod_complemento_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.complemento_opcion
    ADD CONSTRAINT complemento_opcion_cod_complemento_fkey FOREIGN KEY (cod_complemento) REFERENCES public.complemento(cod_complemento) ON DELETE CASCADE;


--
-- TOC entry 3315 (class 2606 OID 83052)
-- Name: complemento_opcion complemento_opcion_cod_opcion_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.complemento_opcion
    ADD CONSTRAINT complemento_opcion_cod_opcion_fkey FOREIGN KEY (cod_opcion) REFERENCES public.opcion(cod_opcion) ON DELETE CASCADE;


--
-- TOC entry 3306 (class 2606 OID 83022)
-- Name: detalle_movimiento_insumo detalle_movimiento_insumo_cod_insumo_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.detalle_movimiento_insumo
    ADD CONSTRAINT detalle_movimiento_insumo_cod_insumo_fkey FOREIGN KEY (cod_insumo) REFERENCES public.insumo(cod_insumo) ON DELETE CASCADE;


--
-- TOC entry 3305 (class 2606 OID 33155)
-- Name: detalle_movimiento_insumo detalle_movimiento_insumo_cod_mov_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.detalle_movimiento_insumo
    ADD CONSTRAINT detalle_movimiento_insumo_cod_mov_fkey FOREIGN KEY (cod_mov) REFERENCES public.movimiento_insumo(cod_mov);


--
-- TOC entry 3320 (class 2606 OID 58072)
-- Name: detalle_opcion detalle_opcion_cod_item_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.detalle_opcion
    ADD CONSTRAINT detalle_opcion_cod_item_fkey FOREIGN KEY (cod_item) REFERENCES public.detalle_venta(cod_item) ON DELETE SET NULL;


--
-- TOC entry 3321 (class 2606 OID 58067)
-- Name: detalle_opcion detalle_opcion_cod_opcion_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.detalle_opcion
    ADD CONSTRAINT detalle_opcion_cod_opcion_fkey FOREIGN KEY (cod_opcion) REFERENCES public.opcion(cod_opcion) ON DELETE SET NULL;


--
-- TOC entry 3310 (class 2606 OID 58029)
-- Name: detalle_venta detalle_venta_cod_producto_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.detalle_venta
    ADD CONSTRAINT detalle_venta_cod_producto_fkey FOREIGN KEY (cod_producto) REFERENCES public.producto(cod_producto) ON DELETE SET NULL;


--
-- TOC entry 3311 (class 2606 OID 33205)
-- Name: detalle_venta detalle_venta_cod_venta_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.detalle_venta
    ADD CONSTRAINT detalle_venta_cod_venta_fkey FOREIGN KEY (cod_venta) REFERENCES public.venta(cod_venta);


--
-- TOC entry 3318 (class 2606 OID 57996)
-- Name: caja_ajuste fk_ci_usuario; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.caja_ajuste
    ADD CONSTRAINT fk_ci_usuario FOREIGN KEY (ci_usuario) REFERENCES public.usuario(ci_usuario) ON DELETE SET NULL;


--
-- TOC entry 3319 (class 2606 OID 57991)
-- Name: caja_ajuste fk_cod_caja; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.caja_ajuste
    ADD CONSTRAINT fk_cod_caja FOREIGN KEY (cod_caja) REFERENCES public.caja(cod_caja);


--
-- TOC entry 3297 (class 2606 OID 57824)
-- Name: producto fk_cod_categoria; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.producto
    ADD CONSTRAINT fk_cod_categoria FOREIGN KEY (cod_categoria) REFERENCES public.categoria(cod_categoria) ON DELETE SET NULL;


--
-- TOC entry 3298 (class 2606 OID 57829)
-- Name: producto fk_cod_subcategoria; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.producto
    ADD CONSTRAINT fk_cod_subcategoria FOREIGN KEY (cod_subcategoria) REFERENCES public.subcategoria(cod_subcategoria) ON DELETE SET NULL;


--
-- TOC entry 3302 (class 2606 OID 83012)
-- Name: insumo_opcion insumo_opcion_cod_insumo_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.insumo_opcion
    ADD CONSTRAINT insumo_opcion_cod_insumo_fkey FOREIGN KEY (cod_insumo) REFERENCES public.insumo(cod_insumo) ON DELETE CASCADE;


--
-- TOC entry 3301 (class 2606 OID 83007)
-- Name: insumo_opcion insumo_opcion_cod_opcion_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.insumo_opcion
    ADD CONSTRAINT insumo_opcion_cod_opcion_fkey FOREIGN KEY (cod_opcion) REFERENCES public.opcion(cod_opcion) ON DELETE SET NULL;


--
-- TOC entry 3312 (class 2606 OID 83027)
-- Name: insumo_producto insumo_producto_cod_insumo_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.insumo_producto
    ADD CONSTRAINT insumo_producto_cod_insumo_fkey FOREIGN KEY (cod_insumo) REFERENCES public.insumo(cod_insumo) ON DELETE CASCADE;


--
-- TOC entry 3313 (class 2606 OID 83032)
-- Name: insumo_producto insumo_producto_cod_producto_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.insumo_producto
    ADD CONSTRAINT insumo_producto_cod_producto_fkey FOREIGN KEY (cod_producto) REFERENCES public.producto(cod_producto) ON DELETE CASCADE;


--
-- TOC entry 3303 (class 2606 OID 33147)
-- Name: movimiento_insumo movimiento_insumo_ci_usuario_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movimiento_insumo
    ADD CONSTRAINT movimiento_insumo_ci_usuario_fkey FOREIGN KEY (ci_usuario) REFERENCES public.usuario(ci_usuario);


--
-- TOC entry 3304 (class 2606 OID 66277)
-- Name: movimiento_insumo movimiento_insumo_cod_venta_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movimiento_insumo
    ADD CONSTRAINT movimiento_insumo_cod_venta_fkey FOREIGN KEY (cod_venta) REFERENCES public.venta(cod_venta);


--
-- TOC entry 3299 (class 2606 OID 83037)
-- Name: producto_complemento producto_complemento_cod_complemento_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.producto_complemento
    ADD CONSTRAINT producto_complemento_cod_complemento_fkey FOREIGN KEY (cod_complemento) REFERENCES public.complemento(cod_complemento) ON DELETE CASCADE;


--
-- TOC entry 3300 (class 2606 OID 83042)
-- Name: producto_complemento producto_complemento_cod_producto_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.producto_complemento
    ADD CONSTRAINT producto_complemento_cod_producto_fkey FOREIGN KEY (cod_producto) REFERENCES public.producto(cod_producto) ON DELETE CASCADE;


--
-- TOC entry 3294 (class 2606 OID 32823)
-- Name: roles_usuarios roles_usuarios_ci_usuario_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.roles_usuarios
    ADD CONSTRAINT roles_usuarios_ci_usuario_fkey FOREIGN KEY (ci_usuario) REFERENCES public.usuario(ci_usuario);


--
-- TOC entry 3295 (class 2606 OID 32828)
-- Name: roles_usuarios roles_usuarios_cod_rol_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.roles_usuarios
    ADD CONSTRAINT roles_usuarios_cod_rol_fkey FOREIGN KEY (cod_rol) REFERENCES public.roles(cod_rol);


--
-- TOC entry 3296 (class 2606 OID 32898)
-- Name: subcategoria subcategoria_cod_categoria_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.subcategoria
    ADD CONSTRAINT subcategoria_cod_categoria_fkey FOREIGN KEY (cod_categoria) REFERENCES public.categoria(cod_categoria);


--
-- TOC entry 3307 (class 2606 OID 33190)
-- Name: venta venta_ci_usuario_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.venta
    ADD CONSTRAINT venta_ci_usuario_fkey FOREIGN KEY (ci_usuario) REFERENCES public.usuario(ci_usuario);


--
-- TOC entry 3308 (class 2606 OID 57962)
-- Name: venta venta_cod_caja_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.venta
    ADD CONSTRAINT venta_cod_caja_fkey FOREIGN KEY (cod_caja) REFERENCES public.caja(cod_caja);


--
-- TOC entry 3309 (class 2606 OID 58056)
-- Name: venta venta_cod_cliente_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.venta
    ADD CONSTRAINT venta_cod_cliente_fkey FOREIGN KEY (cod_cliente) REFERENCES public.cliente(cod_cliente) ON DELETE SET NULL;


-- Completed on 2025-10-07 18:32:50

--
-- PostgreSQL database dump complete
--

