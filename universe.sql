--
-- PostgreSQL database dump
--

-- Dumped from database version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)
-- Dumped by pg_dump version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)

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

DROP DATABASE universe;
--
-- Name: universe; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE universe WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE universe OWNER TO freecodecamp;

\connect universe

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
-- Name: constellation; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.constellation (
    constellation_id integer NOT NULL,
    name character varying(100) NOT NULL,
    abbreviation character varying(3) NOT NULL,
    area_sq_degrees numeric(6,2),
    is_officially_recognized boolean NOT NULL,
    brightest_star character varying(100)
);


ALTER TABLE public.constellation OWNER TO freecodecamp;

--
-- Name: constellation_constellation_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.constellation_constellation_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.constellation_constellation_id_seq OWNER TO freecodecamp;

--
-- Name: constellation_constellation_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.constellation_constellation_id_seq OWNED BY public.constellation.constellation_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(100) NOT NULL,
    type character varying(50) NOT NULL,
    diameter_light_years numeric(15,2),
    mass_solar_masses integer,
    has_supermassive_black_hole boolean NOT NULL,
    discovery_year integer
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(100) NOT NULL,
    planet_id integer NOT NULL,
    diameter_km numeric(10,2) NOT NULL,
    orbital_period_days numeric(10,4),
    is_tidally_locked boolean NOT NULL,
    discovery_year integer
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(100) NOT NULL,
    star_id integer NOT NULL,
    type character varying(50) NOT NULL,
    mass_earths numeric(10,2),
    has_atmosphere boolean NOT NULL,
    orbital_period_days numeric(12,2),
    radius_km integer
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(100) NOT NULL,
    galaxy_id integer NOT NULL,
    spectral_class text NOT NULL,
    temperature_kelvin integer,
    is_main_sequence boolean NOT NULL,
    luminosity numeric(15,2)
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_star_id_seq OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_star_id_seq OWNED BY public.star.star_id;


--
-- Name: constellation constellation_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.constellation ALTER COLUMN constellation_id SET DEFAULT nextval('public.constellation_constellation_id_seq'::regclass);


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: constellation; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.constellation VALUES (1, 'Orion', 'Ori', 594.00, true, 'Rigel');
INSERT INTO public.constellation VALUES (2, 'Ursa Major', 'UMa', 1280.00, true, 'Alioth');
INSERT INTO public.constellation VALUES (3, 'Cassiopeia', 'Cas', 598.00, true, 'Schedar');
INSERT INTO public.constellation VALUES (4, 'Scorpius', 'Sco', 497.00, true, 'Antares');
INSERT INTO public.constellation VALUES (5, 'Lyra', 'Lyr', 286.00, true, 'Vega');


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'Spiral', 105700.00, 1500000, true, NULL);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 'Spiral', 220000.00, 1200000, true, 964);
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 'Spiral', 60000.00, 500000, true, 1654);
INSERT INTO public.galaxy VALUES (4, 'Messier 87', 'Elliptical', 120000.00, 2700000, true, 1781);
INSERT INTO public.galaxy VALUES (5, 'Sombrero', 'Spiral', 50000.00, 800000, true, 1781);
INSERT INTO public.galaxy VALUES (6, 'Large Magellanic Cloud', 'Irregular', 14000.00, 10000, false, NULL);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 3, 3474.00, 27.3000, true, NULL);
INSERT INTO public.moon VALUES (2, 'Phobos', 4, 22.20, 0.3189, true, 1877);
INSERT INTO public.moon VALUES (3, 'Deimos', 4, 12.40, 1.2624, true, 1877);
INSERT INTO public.moon VALUES (4, 'Io', 5, 3643.00, 1.7690, true, 1610);
INSERT INTO public.moon VALUES (5, 'Europa', 5, 3121.00, 3.5510, true, 1610);
INSERT INTO public.moon VALUES (6, 'Ganymede', 5, 5262.00, 7.1540, true, 1610);
INSERT INTO public.moon VALUES (7, 'Callisto', 5, 4820.00, 16.6890, true, 1610);
INSERT INTO public.moon VALUES (8, 'Titan', 6, 5149.00, 15.9450, true, 1655);
INSERT INTO public.moon VALUES (9, 'Rhea', 6, 1527.00, 4.5180, true, 1672);
INSERT INTO public.moon VALUES (10, 'Iapetus', 6, 1468.00, 79.3215, true, 1671);
INSERT INTO public.moon VALUES (11, 'Miranda', 7, 471.00, 1.4135, true, 1948);
INSERT INTO public.moon VALUES (12, 'Ariel', 7, 1157.00, 2.5200, true, 1851);
INSERT INTO public.moon VALUES (13, 'Umbriel', 7, 1169.00, 4.1440, true, 1851);
INSERT INTO public.moon VALUES (14, 'Titania', 7, 1576.00, 8.7060, true, 1787);
INSERT INTO public.moon VALUES (15, 'Oberon', 7, 1522.00, 13.4630, true, 1787);
INSERT INTO public.moon VALUES (16, 'Triton', 8, 2706.00, 5.8770, true, 1846);
INSERT INTO public.moon VALUES (17, 'Proteus', 8, 420.00, 1.1220, true, 1989);
INSERT INTO public.moon VALUES (18, 'Nereid', 8, 340.00, 360.1300, false, 1949);
INSERT INTO public.moon VALUES (19, 'Charon', 9, 1212.00, 6.3870, true, 1978);
INSERT INTO public.moon VALUES (20, 'Hydra', 9, 51.00, 38.2000, true, 2005);
INSERT INTO public.moon VALUES (21, 'Nix', 9, 42.00, 24.9000, true, 2005);
INSERT INTO public.moon VALUES (22, 'Kerberos', 9, 19.00, 32.1000, true, 2011);
INSERT INTO public.moon VALUES (23, 'Styx', 9, 16.00, 20.2000, true, 2012);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', 1, 'Terrestrial', 0.06, false, 88.00, 2439);
INSERT INTO public.planet VALUES (2, 'Venus', 1, 'Terrestrial', 0.82, true, 224.70, 6051);
INSERT INTO public.planet VALUES (3, 'Earth', 1, 'Terrestrial', 1.00, true, 365.20, 6371);
INSERT INTO public.planet VALUES (4, 'Mars', 1, 'Terrestrial', 0.11, true, 687.00, 3389);
INSERT INTO public.planet VALUES (5, 'Jupiter', 1, 'Gas Giant', 317.80, true, 4331.00, 69911);
INSERT INTO public.planet VALUES (6, 'Saturn', 1, 'Gas Giant', 95.20, true, 10747.00, 58232);
INSERT INTO public.planet VALUES (7, 'Uranus', 1, 'Ice Giant', 14.50, true, 30589.00, 25362);
INSERT INTO public.planet VALUES (8, 'Neptune', 1, 'Ice Giant', 17.10, true, 59800.00, 24622);
INSERT INTO public.planet VALUES (9, 'Proxima Centauri b', 5, 'Terrestrial', 1.17, true, 11.20, 6500);
INSERT INTO public.planet VALUES (10, 'Kepler-438b', 1, 'Super Earth', 1.46, true, 35.20, 8900);
INSERT INTO public.planet VALUES (11, 'HD 209458 b', 1, 'Hot Jupiter', 69.00, true, 3.50, 100000);
INSERT INTO public.planet VALUES (12, 'TRAPPIST-1e', 1, 'Terrestrial', 0.62, true, 6.10, 3900);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 1, 'G2V', 5778, true, 1.00);
INSERT INTO public.star VALUES (2, 'Sirius', 1, 'A1V', 9940, true, 25.40);
INSERT INTO public.star VALUES (3, 'Betelgeuse', 1, 'M1-2Ia-ab', 3500, false, 126000.00);
INSERT INTO public.star VALUES (4, 'Vega', 1, 'A0V', 9602, true, 40.12);
INSERT INTO public.star VALUES (5, 'Alpha Centauri A', 1, 'G2V', 5790, true, 1.52);
INSERT INTO public.star VALUES (6, 'Polaris', 1, 'F7Ib-II', 6015, false, 2200.00);


--
-- Name: constellation_constellation_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.constellation_constellation_id_seq', 5, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 23, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: constellation constellation_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.constellation
    ADD CONSTRAINT constellation_name_key UNIQUE (name);


--
-- Name: constellation constellation_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.constellation
    ADD CONSTRAINT constellation_pkey PRIMARY KEY (constellation_id);


--
-- Name: galaxy galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_key UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_key UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_key UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_key UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

