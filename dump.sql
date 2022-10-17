--
-- PostgreSQL database dump
--

-- Dumped from database version 14.5 (Ubuntu 14.5-0ubuntu0.22.04.1)
-- Dumped by pg_dump version 14.5 (Ubuntu 14.5-0ubuntu0.22.04.1)

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
-- Name: accessUrl; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public."accessUrl" (
    id integer NOT NULL,
    "urlId" integer NOT NULL,
    "createdAt" timestamp with time zone DEFAULT now() NOT NULL
);


--
-- Name: accessUrl_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public."accessUrl_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: accessUrl_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public."accessUrl_id_seq" OWNED BY public."accessUrl".id;


--
-- Name: sessions; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.sessions (
    id integer NOT NULL,
    "userId" integer NOT NULL,
    token text NOT NULL,
    "createdAt" timestamp with time zone DEFAULT now() NOT NULL
);


--
-- Name: sessions_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.sessions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: sessions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.sessions_id_seq OWNED BY public.sessions.id;


--
-- Name: urls; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.urls (
    id integer NOT NULL,
    "userId" integer NOT NULL,
    "URL" text NOT NULL,
    "shortUrl" text NOT NULL,
    "createdAt" timestamp with time zone DEFAULT now() NOT NULL
);


--
-- Name: urls_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.urls_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: urls_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.urls_id_seq OWNED BY public.urls.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.users (
    id integer NOT NULL,
    name text NOT NULL,
    email character varying(45) NOT NULL,
    password text NOT NULL,
    "createdAt" timestamp with time zone DEFAULT now() NOT NULL
);


--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- Name: accessUrl id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."accessUrl" ALTER COLUMN id SET DEFAULT nextval('public."accessUrl_id_seq"'::regclass);


--
-- Name: sessions id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.sessions ALTER COLUMN id SET DEFAULT nextval('public.sessions_id_seq'::regclass);


--
-- Name: urls id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.urls ALTER COLUMN id SET DEFAULT nextval('public.urls_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Data for Name: accessUrl; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public."accessUrl" VALUES (1, 1, '2022-10-16 15:32:52.305525-03');
INSERT INTO public."accessUrl" VALUES (2, 1, '2022-10-16 15:33:01.849348-03');
INSERT INTO public."accessUrl" VALUES (3, 1, '2022-10-16 15:33:02.327577-03');
INSERT INTO public."accessUrl" VALUES (4, 1, '2022-10-16 15:33:02.747216-03');
INSERT INTO public."accessUrl" VALUES (5, 1, '2022-10-16 15:33:03.169027-03');
INSERT INTO public."accessUrl" VALUES (6, 1, '2022-10-16 15:33:03.546219-03');
INSERT INTO public."accessUrl" VALUES (7, 1, '2022-10-16 15:33:03.968327-03');
INSERT INTO public."accessUrl" VALUES (8, 1, '2022-10-16 15:33:04.329115-03');
INSERT INTO public."accessUrl" VALUES (9, 1, '2022-10-16 15:33:04.735873-03');
INSERT INTO public."accessUrl" VALUES (10, 1, '2022-10-16 15:33:05.116417-03');
INSERT INTO public."accessUrl" VALUES (11, 2, '2022-10-16 15:33:16.526042-03');
INSERT INTO public."accessUrl" VALUES (12, 2, '2022-10-16 15:33:16.865514-03');
INSERT INTO public."accessUrl" VALUES (13, 2, '2022-10-16 15:33:17.249868-03');
INSERT INTO public."accessUrl" VALUES (14, 2, '2022-10-16 15:33:17.630437-03');
INSERT INTO public."accessUrl" VALUES (15, 2, '2022-10-16 15:33:17.994191-03');
INSERT INTO public."accessUrl" VALUES (16, 2, '2022-10-16 15:33:18.374925-03');
INSERT INTO public."accessUrl" VALUES (17, 2, '2022-10-16 15:33:18.779659-03');
INSERT INTO public."accessUrl" VALUES (18, 2, '2022-10-16 15:33:19.237038-03');
INSERT INTO public."accessUrl" VALUES (19, 3, '2022-10-16 15:33:27.355132-03');
INSERT INTO public."accessUrl" VALUES (20, 3, '2022-10-16 15:33:27.749584-03');
INSERT INTO public."accessUrl" VALUES (21, 3, '2022-10-16 15:33:28.128977-03');
INSERT INTO public."accessUrl" VALUES (22, 3, '2022-10-16 15:33:28.481375-03');
INSERT INTO public."accessUrl" VALUES (23, 3, '2022-10-16 15:33:28.855404-03');
INSERT INTO public."accessUrl" VALUES (24, 3, '2022-10-16 15:33:29.21267-03');
INSERT INTO public."accessUrl" VALUES (25, 3, '2022-10-16 15:33:29.582139-03');
INSERT INTO public."accessUrl" VALUES (26, 3, '2022-10-16 15:33:30.921111-03');
INSERT INTO public."accessUrl" VALUES (27, 3, '2022-10-16 15:33:31.303528-03');
INSERT INTO public."accessUrl" VALUES (28, 3, '2022-10-16 15:33:31.663245-03');
INSERT INTO public."accessUrl" VALUES (29, 3, '2022-10-16 15:33:32.023779-03');
INSERT INTO public."accessUrl" VALUES (30, 3, '2022-10-16 15:33:32.4002-03');
INSERT INTO public."accessUrl" VALUES (31, 4, '2022-10-16 15:33:49.163365-03');
INSERT INTO public."accessUrl" VALUES (32, 4, '2022-10-16 15:33:49.561699-03');
INSERT INTO public."accessUrl" VALUES (33, 4, '2022-10-16 15:33:49.983071-03');
INSERT INTO public."accessUrl" VALUES (34, 5, '2022-10-16 15:33:57.372277-03');
INSERT INTO public."accessUrl" VALUES (35, 5, '2022-10-16 15:33:57.740118-03');
INSERT INTO public."accessUrl" VALUES (36, 5, '2022-10-16 15:33:58.094102-03');
INSERT INTO public."accessUrl" VALUES (37, 5, '2022-10-16 15:33:58.447836-03');
INSERT INTO public."accessUrl" VALUES (38, 5, '2022-10-16 15:33:58.814543-03');
INSERT INTO public."accessUrl" VALUES (39, 1, '2022-10-16 19:20:42.566694-03');
INSERT INTO public."accessUrl" VALUES (40, 4, '2022-10-16 19:21:43.831989-03');
INSERT INTO public."accessUrl" VALUES (41, 5, '2022-10-16 19:21:51.744269-03');
INSERT INTO public."accessUrl" VALUES (42, 5, '2022-10-16 19:22:45.86422-03');
INSERT INTO public."accessUrl" VALUES (43, 5, '2022-10-16 19:24:23.395247-03');
INSERT INTO public."accessUrl" VALUES (44, 5, '2022-10-16 19:24:42.645999-03');
INSERT INTO public."accessUrl" VALUES (45, 5, '2022-10-16 19:26:02.188841-03');
INSERT INTO public."accessUrl" VALUES (46, 5, '2022-10-16 19:26:13.967022-03');
INSERT INTO public."accessUrl" VALUES (47, 5, '2022-10-16 19:26:38.688671-03');
INSERT INTO public."accessUrl" VALUES (48, 5, '2022-10-16 19:26:43.715116-03');
INSERT INTO public."accessUrl" VALUES (49, 5, '2022-10-16 19:27:24.723777-03');
INSERT INTO public."accessUrl" VALUES (50, 5, '2022-10-16 19:27:47.141322-03');
INSERT INTO public."accessUrl" VALUES (51, 5, '2022-10-16 19:28:29.083215-03');
INSERT INTO public."accessUrl" VALUES (52, 5, '2022-10-16 19:28:47.530112-03');
INSERT INTO public."accessUrl" VALUES (53, 4, '2022-10-16 19:28:53.313798-03');
INSERT INTO public."accessUrl" VALUES (54, 4, '2022-10-16 19:29:40.194179-03');
INSERT INTO public."accessUrl" VALUES (55, 4, '2022-10-16 19:29:49.363031-03');
INSERT INTO public."accessUrl" VALUES (56, 4, '2022-10-16 19:30:09.766625-03');
INSERT INTO public."accessUrl" VALUES (57, 4, '2022-10-16 19:30:47.571453-03');
INSERT INTO public."accessUrl" VALUES (58, 4, '2022-10-16 19:33:22.293051-03');
INSERT INTO public."accessUrl" VALUES (59, 4, '2022-10-16 19:34:15.827727-03');
INSERT INTO public."accessUrl" VALUES (60, 4, '2022-10-16 19:34:23.459283-03');
INSERT INTO public."accessUrl" VALUES (61, 1, '2022-10-16 19:35:22.292388-03');
INSERT INTO public."accessUrl" VALUES (62, 1, '2022-10-16 19:36:34.352236-03');
INSERT INTO public."accessUrl" VALUES (63, 1, '2022-10-16 19:36:51.906229-03');
INSERT INTO public."accessUrl" VALUES (64, 1, '2022-10-16 19:37:34.854984-03');
INSERT INTO public."accessUrl" VALUES (65, 1, '2022-10-16 19:37:56.451759-03');
INSERT INTO public."accessUrl" VALUES (66, 1, '2022-10-16 19:38:17.352959-03');
INSERT INTO public."accessUrl" VALUES (67, 1, '2022-10-16 19:38:31.749765-03');
INSERT INTO public."accessUrl" VALUES (68, 4, '2022-10-16 19:40:55.067693-03');
INSERT INTO public."accessUrl" VALUES (69, 4, '2022-10-16 19:40:58.048476-03');
INSERT INTO public."accessUrl" VALUES (70, 4, '2022-10-16 19:40:58.594088-03');
INSERT INTO public."accessUrl" VALUES (71, 4, '2022-10-16 19:40:59.156139-03');
INSERT INTO public."accessUrl" VALUES (72, 4, '2022-10-16 19:40:59.778039-03');
INSERT INTO public."accessUrl" VALUES (73, 4, '2022-10-16 19:41:00.30058-03');
INSERT INTO public."accessUrl" VALUES (74, 4, '2022-10-16 19:41:11.935221-03');
INSERT INTO public."accessUrl" VALUES (75, 4, '2022-10-16 19:41:12.639029-03');
INSERT INTO public."accessUrl" VALUES (76, 4, '2022-10-16 19:41:13.269734-03');
INSERT INTO public."accessUrl" VALUES (77, 4, '2022-10-16 19:41:13.83642-03');
INSERT INTO public."accessUrl" VALUES (78, 4, '2022-10-16 19:41:14.378195-03');
INSERT INTO public."accessUrl" VALUES (79, 4, '2022-10-16 19:41:14.959506-03');
INSERT INTO public."accessUrl" VALUES (80, 6, '2022-10-17 10:28:32.698237-03');
INSERT INTO public."accessUrl" VALUES (81, 6, '2022-10-17 10:28:39.868273-03');
INSERT INTO public."accessUrl" VALUES (82, 6, '2022-10-17 10:29:09.945669-03');
INSERT INTO public."accessUrl" VALUES (83, 7, '2022-10-17 10:44:50.301359-03');
INSERT INTO public."accessUrl" VALUES (84, 7, '2022-10-17 10:45:22.042538-03');
INSERT INTO public."accessUrl" VALUES (85, 7, '2022-10-17 10:45:34.874276-03');
INSERT INTO public."accessUrl" VALUES (86, 6, '2022-10-17 10:46:01.881318-03');
INSERT INTO public."accessUrl" VALUES (87, 7, '2022-10-17 10:46:16.769636-03');
INSERT INTO public."accessUrl" VALUES (88, 7, '2022-10-17 10:46:53.687655-03');


--
-- Data for Name: sessions; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.sessions VALUES (1, 1, 'bcae7b77-3a89-43a6-9926-ec53a7d84f7b', '2022-10-16 15:19:43.303358-03');
INSERT INTO public.sessions VALUES (2, 2, '3f3c508a-7d74-4f1a-aaea-11a6ef249cca', '2022-10-16 15:20:35.182397-03');
INSERT INTO public.sessions VALUES (3, 3, 'b17fe17a-332e-48c5-868c-0cd98cf4ceb1', '2022-10-16 15:20:47.465794-03');
INSERT INTO public.sessions VALUES (4, 4, '30682253-b17e-45b6-9444-5ef73e659210', '2022-10-17 10:24:22.52283-03');


--
-- Data for Name: urls; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.urls VALUES (1, 1, 'https://pt.stackoverflow.com/questions/117315/2-count-dentro-de-um-select-com-left-join#:~:text=Para%20conseguir%20um%20n%C3%BAmero%20diferente,e%20ter%20o%20resultado%20desejado.', 'jMgORuEbzkI9Q8GWhreYY', '2022-10-16 15:22:38.616157-03');
INSERT INTO public.urls VALUES (2, 1, 'https://www.google.com/search?q=timestamp+sql&oq=timestamp+sql&aqs=chrome..69i57j0i512l9.6082j0j7&sourceid=chrome&ie=UTF-8', 'N8odXSwY1tkrcDjDlhkLr', '2022-10-16 15:23:12.396109-03');
INSERT INTO public.urls VALUES (3, 1, 'https://www.alura.com.br/artigos/join-em-sql?gclid=CjwKCAjwtKmaBhBMEiwAyINuwLjxMg3y295R6YUrP9blGgqXNw_QsQdPkDJ_hDMXJR5M2XeoDMRJLxoCzhUQAvD_BwE', '5e56nLaR4dMsF_6nD_y61', '2022-10-16 15:23:38.927043-03');
INSERT INTO public.urls VALUES (4, 2, 'https://github.com/yagoluisr/projeto16-shortly', 'ndAEyk2mcNxu189a_ZeFY', '2022-10-16 15:24:17.16104-03');
INSERT INTO public.urls VALUES (5, 2, 'https://www.figma.com/file/DWg9233KR2GS6RLvfZRwyd/Shortly?node-id=0%3A1', 'tcgramDlhxi_JSZJwoF22', '2022-10-16 15:24:37.184411-03');
INSERT INTO public.urls VALUES (6, 4, 'https://bootcampra.notion.site/Artigo-Deploy-de-aplica-es-back-end-no-Heroku-SQL-96ff4f6b854a4f4fa17a4f783edce785', 'e93lHSKB', '2022-10-17 10:26:33.655553-03');
INSERT INTO public.urls VALUES (7, 4, 'https://www.libertyseguros.com.br/Pages/Home.aspx', '2JkDGISm', '2022-10-17 10:44:19.095195-03');


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.users VALUES (1, 'João', 'joao@driven.com.br', '$2b$10$ReEWIMuFuNc1JJ/.ai0Ehu3PrxOaN.Jz0TGigkQQXsB/Wj0TbKsCm', '2022-10-16 15:18:02.201624-03');
INSERT INTO public.users VALUES (2, 'Maria', 'maria@driven.com.br', '$2b$10$bDFrvb/IJI/NYVIv84jOCevIhd7DSr5koDSjEYO3SWJFfMEAYtTMK', '2022-10-16 15:18:20.652914-03');
INSERT INTO public.users VALUES (3, 'Zezinho', 'Zezinho@driven.com.br', '$2b$10$gklCmpam6IMwjTa/8JqLAex406m8.FT51qrtd7PEVJuoEFQNMSqqi', '2022-10-16 15:18:32.372284-03');
INSERT INTO public.users VALUES (4, 'Groot', 'groot@driven.com.br', '$2b$10$4/uE0rI7Spv..Z/lN92GZO46SQx.9vou5DDXFG8tsEEgt.E5484Am', '2022-10-17 10:23:29.978901-03');


--
-- Name: accessUrl_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public."accessUrl_id_seq"', 88, true);


--
-- Name: sessions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.sessions_id_seq', 4, true);


--
-- Name: urls_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.urls_id_seq', 7, true);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.users_id_seq', 4, true);


--
-- Name: accessUrl accessUrl_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."accessUrl"
    ADD CONSTRAINT "accessUrl_pkey" PRIMARY KEY (id);


--
-- Name: sessions sessions_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.sessions
    ADD CONSTRAINT sessions_pkey PRIMARY KEY (id);


--
-- Name: urls urls_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.urls
    ADD CONSTRAINT urls_pkey PRIMARY KEY (id);


--
-- Name: users users_email_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key UNIQUE (email);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: accessUrl accessUrl_urlId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."accessUrl"
    ADD CONSTRAINT "accessUrl_urlId_fkey" FOREIGN KEY ("urlId") REFERENCES public.urls(id);


--
-- Name: sessions sessions_userId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.sessions
    ADD CONSTRAINT "sessions_userId_fkey" FOREIGN KEY ("userId") REFERENCES public.users(id);


--
-- Name: urls urls_userId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.urls
    ADD CONSTRAINT "urls_userId_fkey" FOREIGN KEY ("userId") REFERENCES public.users(id);


--
-- PostgreSQL database dump complete
--

