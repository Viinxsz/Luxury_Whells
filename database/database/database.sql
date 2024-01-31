--
-- PostgreSQL database dump
--

-- Dumped from database version 16.0
-- Dumped by pg_dump version 16.0

-- Started on 2023-12-11 21:34:11

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

--
-- TOC entry 5 (class 2615 OID 2200)
-- Name: public; Type: SCHEMA; Schema: -; Owner: pg_database_owner
--

CREATE SCHEMA public;


ALTER SCHEMA public OWNER TO pg_database_owner;

--
-- TOC entry 4868 (class 0 OID 0)
-- Dependencies: 5
-- Name: SCHEMA public; Type: COMMENT; Schema: -; Owner: pg_database_owner
--

COMMENT ON SCHEMA public IS 'standard public schema';


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 216 (class 1259 OID 16401)
-- Name: db_carros; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.db_carros (
    id_veiculo integer NOT NULL,
    modelo character varying(50) NOT NULL,
    marca character varying(50) NOT NULL,
    valor_dia numeric(10,2) NOT NULL,
    alugado boolean DEFAULT false,
    manutencao boolean DEFAULT false,
    disponivel boolean DEFAULT true,
    id_cliente integer
);


ALTER TABLE public.db_carros OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 16433)
-- Name: db_carros_id_veiculo_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.db_carros_id_veiculo_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.db_carros_id_veiculo_seq OWNER TO postgres;

--
-- TOC entry 4869 (class 0 OID 0)
-- Dependencies: 219
-- Name: db_carros_id_veiculo_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.db_carros_id_veiculo_seq OWNED BY public.db_carros.id_veiculo;


--
-- TOC entry 217 (class 1259 OID 16412)
-- Name: db_clientes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.db_clientes (
    id_cliente integer NOT NULL,
    nome character varying(100) NOT NULL,
    email character varying(20) NOT NULL,
    senha character varying(20) NOT NULL,
    idade integer NOT NULL,
    telefone character varying(15) NOT NULL,
    cliente  character varying(15) NOT NULL,
    CONSTRAINT db_clientes_idade_check CHECK ((idade > 0))
);


ALTER TABLE public.db_clientes OWNER TO postgres;

--
-- TOC entry 218 (class 1259 OID 16422)
-- Name: db_clientes_id_cliente_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.db_clientes_id_cliente_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.db_clientes_id_cliente_seq OWNER TO postgres;

--
-- TOC entry 4870 (class 0 OID 0)
-- Dependencies: 218
-- Name: db_clientes_id_cliente_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.db_clientes_id_cliente_seq OWNED BY public.db_clientes.id_cliente;


--
-- TOC entry 220 (class 1259 OID 16449)
-- Name: veiculoscategoria; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.veiculoscategoria (
    id_veiculo integer NOT NULL,
    categoria character varying(10) NOT NULL,
    CONSTRAINT veiculoscategoria_categoria_check CHECK (((categoria)::text = ANY ((ARRAY['diamond'::character varying, 'silver'::character varying, 'gold'::character varying])::text[])))
);


ALTER TABLE public.veiculoscategoria OWNER TO postgres;

--
-- TOC entry 4698 (class 2604 OID 16434)
-- Name: db_carros id_veiculo; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.db_carros ALTER COLUMN id_veiculo SET DEFAULT nextval('public.db_carros_id_veiculo_seq'::regclass);


--
-- TOC entry 4702 (class 2604 OID 16423)
-- Name: db_clientes id_cliente; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.db_clientes ALTER COLUMN id_cliente SET DEFAULT nextval('public.db_clientes_id_cliente_seq'::regclass);


--
-- TOC entry 4858 (class 0 OID 16401)
-- Dependencies: 216
-- Data for Name: db_carros; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.db_carros (id_veiculo, modelo, marca, valor_dia, alugado, manutencao, disponivel, id_cliente) FROM stdin;
1	Seat Arona	Seat	85.00	f	f	t	\N
2	BMW-5-series	BMW	182.00	f	f	t	\N
3	Fiat-Fiorino	Fiat	73.00	f	f	t	\N
4	Fiat-Panda	Fiat	80.00	f	f	t	\N
5	Ferrari-F8	Ferrari	754.00	f	f	t	\N
6	Ibiza	Seat	99.00	f	f	t	\N
7	Serie1	BMW	145.00	f	f	t	\N
8	Fiat-500	Fiat	95.00	f	f	t	\N
9	Fiat-Tipo	Fiat	112.00	f	f	t	\N
10	Opel-Corsa	Opel	79.00	f	f	t	\N
11	Opel-Manta	Opel	79.00	f	f	t	\N
12	Opel-Tigra	Opel	79.00	f	f	t	\N
13	Seat-Backhat	Seat	95.00	f	f	t	\N
14	Seat-Tarraco	Seat	110.00	f	f	t	\N
16	AlfaRomeo-Giulia	AlfaRomeu	157.00	f	f	t	\N
17	Fiat-Ducato	Fiat	144.00	f	f	t	\N
18	Opel-Adam	Opel	105.00	f	f	t	\N
19	Opel-Crossland	Opel	145.00	f	f	t	\N
20	Opel-Astra	Opel	117.00	f	f	t	\N
21	Volkswagen-Kombi	Volkswagen	180.00	f	f	t	\N
22	Volkswagen-Arteon	Volkswagen	185.00	f	f	t	\N
23	Stelvio_Alpha_Romeu	AlfaRomeo	185.00	f	f	t	\N
24	Opel-Mokka-e	Opel	147.00	f	f	t	\N
25	Fiat-Eletrico	Fiat	120.00	f	f	t	\N
26	Volto-xc90	Volto-xc90	188.00	f	f	t	\N
27	Volvo-ex30	Volvo	188.00	f	f	t	\N
28	Volvo-s40	Volvo	165.00	f	f	t	\N
29	Volvo-S60	Volvo	188.00	f	f	t	\N
30	Volvo-xc60	Volvo	189.00	f	f	t	\N
31	ferrari-812-GTS	Ferrari	787.00	f	f	t	\N
32	Mercedes-AMG-GT	Mercedes	432.00	f	f	t	\N
33	Mercedes-AMG-G-63	Mercedes	455.00	f	f	t	\N
34	Mercedes-AMG-CLA-45	Mercedes	389.00	f	f	t	\N
35	MERCEDES-BENZ-Caetano-star	Mercedes	402.00	f	f	t	\N
36	GOLF-GTI-TCR	Volkswagen	254.00	f	f	t	\N
\.


--
-- TOC entry 4859 (class 0 OID 16412)
-- Dependencies: 217
-- Data for Name: db_clientes; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.db_clientes (id_cliente, nome, idade, telefone, endereco, forma_de_pagamento, cliente) FROM stdin;
\.


--
-- TOC entry 4862 (class 0 OID 16449)
-- Dependencies: 220
-- Data for Name: veiculoscategoria; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.veiculoscategoria (id_veiculo, categoria) FROM stdin;
1	silver
2	gold
3	silver
4	silver
5	diamond
6	silver
7	gold
8	silver
9	silver
10	silver
11	silver
12	silver
13	silver
14	silver
16	gold
17	gold
18	gold
19	gold
20	gold
21	gold
22	gold
23	gold
24	gold
25	gold
26	gold
27	gold
28	gold
29	gold
30	gold
31	diamond
32	diamond
33	diamond
34	diamond
35	diamond
36	diamond
\.


--
-- TOC entry 4871 (class 0 OID 0)
-- Dependencies: 219
-- Name: db_carros_id_veiculo_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.db_carros_id_veiculo_seq', 39, true);


--
-- TOC entry 4872 (class 0 OID 0)
-- Dependencies: 218
-- Name: db_clientes_id_cliente_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.db_clientes_id_cliente_seq', 1, false);


--
-- TOC entry 4708 (class 2606 OID 16439)
-- Name: db_carros db_carros_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.db_carros
    ADD CONSTRAINT db_carros_pkey PRIMARY KEY (id_veiculo);


--
-- TOC entry 4710 (class 2606 OID 16426)
-- Name: db_clientes db_clientes_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.db_clientes
    ADD CONSTRAINT db_clientes_pkey PRIMARY KEY (id_cliente);


--
-- TOC entry 4712 (class 2606 OID 16454)
-- Name: veiculoscategoria veiculoscategoria_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.veiculoscategoria
    ADD CONSTRAINT veiculoscategoria_pkey PRIMARY KEY (id_veiculo, categoria);


--
-- TOC entry 4713 (class 2606 OID 16440)
-- Name: db_carros db_carros_id_cliente_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.db_carros
    ADD CONSTRAINT db_carros_id_cliente_fkey FOREIGN KEY (id_cliente) REFERENCES public.db_clientes(id_cliente);


--
-- TOC entry 4714 (class 2606 OID 16455)
-- Name: veiculoscategoria veiculoscategoria_id_veiculo_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.veiculoscategoria
    ADD CONSTRAINT veiculoscategoria_id_veiculo_fkey FOREIGN KEY (id_veiculo) REFERENCES public.db_carros(id_veiculo);


-- Completed on 2023-12-11 21:34:11

--
-- PostgreSQL database dump complete
--

