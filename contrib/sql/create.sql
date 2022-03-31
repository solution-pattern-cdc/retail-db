--
-- PostgreSQL database dump
--

-- Dumped from database version 12.9
-- Dumped by pg_dump version 12.10

-- Started on 2022-03-24 15:08:12 UTC

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
-- TOC entry 540 (class 1247 OID 16395)
-- Name: customer_status; Type: TYPE; Schema: public; Owner: $POSTGRESQL_USER
--

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 202 (class 1259 OID 16401)
-- Name: customer; Type: TABLE; Schema: public; Owner: $POSTGRESQL_USER
--

CREATE SEQUENCE public.customer_id_seq START WITH 1000;

CREATE TABLE public.customer (
    customer_id bigint NOT NULL DEFAULT nextval('public.customer_id_seq'),
    name character varying(255) NOT NULL,
    status character varying(25) NOT NULL
);

ALTER TABLE public.customer OWNER TO $POSTGRESQL_USER;

ALTER SEQUENCE public.customer_id_seq OWNER TO $POSTGRESQL_USER;

ALTER SEQUENCE public.customer_id_seq OWNED BY public.customer.customer_id;

--
-- TOC entry 206 (class 1259 OID 16439)
-- Name: inventory; Type: TABLE; Schema: public; Owner: $POSTGRESQL_USER
--
CREATE SEQUENCE public.inventory_id_seq START WITH 1000;

CREATE TABLE public.inventory (
    inventory_id bigint NOT NULL DEFAULT nextval('public.inventory_id_seq'),
    product_id bigint NOT NULL,
    quantity integer NOT NULL
);

ALTER TABLE public.inventory OWNER TO $POSTGRESQL_USER;

ALTER SEQUENCE public.inventory_id_seq OWNER TO $POSTGRESQL_USER;

ALTER SEQUENCE public.inventory_id_seq OWNED BY public.inventory.inventory_id;

--
-- TOC entry 204 (class 1259 OID 16416)
-- Name: line_item; Type: TABLE; Schema: public; Owner: $POSTGRESQL_USER
--

CREATE SEQUENCE public.line_item_id_seq START WITH 1000;

CREATE TABLE public.line_item (
    line_item_id bigint NOT NULL DEFAULT nextval('public.line_item_id_seq'),
    sale_id bigint NOT NULL,
    product_id bigint NOT NULL,
    price numeric(8,2) NOT NULL,
    quantity integer NOT NULL
);

ALTER TABLE public.line_item OWNER TO $POSTGRESQL_USER;

ALTER SEQUENCE public.line_item_id_seq OWNER TO $POSTGRESQL_USER;

ALTER SEQUENCE public.line_item_id_seq OWNED BY public.line_item.line_item_id;

--
-- TOC entry 205 (class 1259 OID 16426)
-- Name: product; Type: TABLE; Schema: public; Owner: $POSTGRESQL_USER
--

CREATE SEQUENCE public.product_id_seq START WITH 1000;

CREATE TABLE public.product (
    product_id bigint DEFAULT nextval('public.product_id_seq'),
    name character varying(255) NOT NULL,
    description text,
    price numeric(8,2)
);

ALTER TABLE public.product OWNER TO $POSTGRESQL_USER;

ALTER SEQUENCE public.product_id_seq OWNER TO $POSTGRESQL_USER;

ALTER SEQUENCE public.product_id_seq OWNED BY public.product.product_id;

--
-- TOC entry 203 (class 1259 OID 16406)
-- Name: sale; Type: TABLE; Schema: public; Owner: $POSTGRESQL_USER
--

CREATE SEQUENCE public.sale_id_seq START WITH 1000;

CREATE TABLE public.sale (
    sale_id bigint NOT NULL DEFAULT nextval('public.sale_id_seq'),
    customer_id bigint NOT NULL,
    date timestamp without time zone NOT NULL
);

ALTER TABLE public.sale OWNER TO $POSTGRESQL_USER;

ALTER SEQUENCE public.sale_id_seq OWNER TO $POSTGRESQL_USER;

ALTER SEQUENCE public.sale_id_seq OWNED BY public.sale.sale_id;

--
-- TOC entry 2835 (class 2606 OID 16405)
-- Name: customer customer_pkey; Type: CONSTRAINT; Schema: public; Owner: $POSTGRESQL_USER
--

ALTER TABLE ONLY public.customer
    ADD CONSTRAINT customer_pkey PRIMARY KEY (customer_id);


--
-- TOC entry 2843 (class 2606 OID 16443)
-- Name: inventory inventory_pkey; Type: CONSTRAINT; Schema: public; Owner: $POSTGRESQL_USER
--

ALTER TABLE ONLY public.inventory
    ADD CONSTRAINT inventory_pkey PRIMARY KEY (inventory_id);


--
-- TOC entry 2839 (class 2606 OID 16420)
-- Name: line_item line_item_pk; Type: CONSTRAINT; Schema: public; Owner: $POSTGRESQL_USER
--

ALTER TABLE ONLY public.line_item
    ADD CONSTRAINT line_item_pk PRIMARY KEY (line_item_id);


--
-- TOC entry 2841 (class 2606 OID 16433)
-- Name: product product_pkey; Type: CONSTRAINT; Schema: public; Owner: $POSTGRESQL_USER
--

ALTER TABLE ONLY public.product
    ADD CONSTRAINT product_pkey PRIMARY KEY (product_id);


--
-- TOC entry 2837 (class 2606 OID 16410)
-- Name: sale sale_pkey; Type: CONSTRAINT; Schema: public; Owner: $POSTGRESQL_USER
--

ALTER TABLE ONLY public.sale
    ADD CONSTRAINT sale_pkey PRIMARY KEY (sale_id);


--
-- TOC entry 2844 (class 2606 OID 16411)
-- Name: sale customer_fkey; Type: FK CONSTRAINT; Schema: public; Owner: $POSTGRESQL_USER
--

ALTER TABLE ONLY public.sale
    ADD CONSTRAINT customer_fkey FOREIGN KEY (customer_id) REFERENCES public.customer(customer_id);


--
-- TOC entry 2846 (class 2606 OID 16434)
-- Name: line_item product_fkey; Type: FK CONSTRAINT; Schema: public; Owner: $POSTGRESQL_USER
--

ALTER TABLE ONLY public.line_item
    ADD CONSTRAINT product_fkey FOREIGN KEY (product_id) REFERENCES public.product(product_id) NOT VALID;


--
-- TOC entry 2847 (class 2606 OID 16444)
-- Name: inventory product_fkey; Type: FK CONSTRAINT; Schema: public; Owner: $POSTGRESQL_USER
--

ALTER TABLE ONLY public.inventory
    ADD CONSTRAINT product_fkey FOREIGN KEY (product_id) REFERENCES public.product(product_id);


--
-- TOC entry 2845 (class 2606 OID 16421)
-- Name: line_item sale_fkey; Type: FK CONSTRAINT; Schema: public; Owner: $POSTGRESQL_USER
--

ALTER TABLE ONLY public.line_item
    ADD CONSTRAINT sale_fkey FOREIGN KEY (sale_id) REFERENCES public.sale(sale_id) NOT VALID;


-- Completed on 2022-03-24 15:08:12 UTC

--
-- PostgreSQL database dump complete
--
