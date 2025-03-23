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
-- Name: dwarfplanet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.dwarfplanet (
    dwarfplanet_id integer NOT NULL,
    name character varying(30) NOT NULL,
    star_id integer NOT NULL,
    description text,
    age integer,
    radius numeric(4,1),
    has_moons boolean
);


ALTER TABLE public.dwarfplanet OWNER TO freecodecamp;

--
-- Name: dwarfplanet_dwarfplanet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.dwarfplanet_dwarfplanet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.dwarfplanet_dwarfplanet_id_seq OWNER TO freecodecamp;

--
-- Name: dwarfplanet_dwarfplanet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.dwarfplanet_dwarfplanet_id_seq OWNED BY public.dwarfplanet.dwarfplanet_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(30) NOT NULL,
    description text,
    has_stars boolean,
    age integer
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
    name character varying(30) NOT NULL,
    planet_id integer,
    has_life boolean NOT NULL,
    description text,
    age_million_years integer,
    radius_megametres numeric(4,1)
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
    name character varying(30) NOT NULL,
    star_id integer,
    has_life boolean NOT NULL,
    description text,
    age_million_years integer,
    radius_megametres numeric(4,1)
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
    name character varying(30) NOT NULL,
    galaxy_id integer,
    description text,
    age_in_billion_years integer,
    radius numeric(4,1)
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
-- Name: dwarfplanet dwarfplanet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.dwarfplanet ALTER COLUMN dwarfplanet_id SET DEFAULT nextval('public.dwarfplanet_dwarfplanet_id_seq'::regclass);


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
-- Data for Name: dwarfplanet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.dwarfplanet VALUES (1, 'Ceres', 1, 'Ceres is the largest object in the asteroid belt and classified as a dwarf planet.', 4600, 0.9, true);
INSERT INTO public.dwarfplanet VALUES (2, 'Pluto', 1, 'Pluto is a dwarf planet located in the Kuiper Belt, once classified as the ninth planet of our solar system.', 4600, 1.2, true);
INSERT INTO public.dwarfplanet VALUES (3, 'Haumea', 1, 'Haumea is an elongated dwarf planet with a unique shape located in the Kuiper Belt.', 4500, 0.6, false);
INSERT INTO public.dwarfplanet VALUES (4, 'Makemake', 1, 'Makemake is a dwarf planet in the Kuiper Belt, discovered in 2005.', 4500, 0.7, false);
INSERT INTO public.dwarfplanet VALUES (5, 'Eris', 1, 'Eris is a dwarf planet that orbits in the scattered disk and was discovered in 2005.', 4500, 0.9, true);
INSERT INTO public.dwarfplanet VALUES (6, 'Sedna', 1, 'Sedna is a distant dwarf planet with an elongated orbit in the outer solar system.', 4500, 0.8, false);
INSERT INTO public.dwarfplanet VALUES (7, 'Quaoar', 1, 'Quaoar is a large trans-Neptunian object and dwarf planet discovered in 2002.', 4500, 0.6, false);
INSERT INTO public.dwarfplanet VALUES (8, 'Orcus', 1, 'Orcus is a trans-Neptunian object and a potential dwarf planet with a similar orbit to Pluto.', 4500, 0.6, true);
INSERT INTO public.dwarfplanet VALUES (9, 'Haumea’s Moon', 1, 'Haumea has an elongated moon, which orbits it in the Kuiper Belt.', 4500, 0.2, false);
INSERT INTO public.dwarfplanet VALUES (10, 'Gonggong', 1, 'Gonggong is a distant trans-Neptunian object, potentially a dwarf planet located in the scattered disk.', 4500, 0.8, false);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'The galaxy containing the Solar System, with a supermassive black hole at its center.', true, 13800);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 'The nearest spiral galaxy to the Milky Way, and on a collision course with it.', true, 10000);
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 'A small spiral galaxy, part of the Local Group of galaxies.', true, 2800);
INSERT INTO public.galaxy VALUES (4, 'Whirlpool Galaxy', 'A spiral galaxy in the constellation Canes Venatici, known for its distinct spiral arms.', true, 1500);
INSERT INTO public.galaxy VALUES (5, 'Sombrero Galaxy', 'A spiral galaxy with a bright nucleus, and a dark dust lane in the shape of a sombrero hat.', true, 13000);
INSERT INTO public.galaxy VALUES (6, 'Messier 87', 'A giant elliptical galaxy, famous for its supermassive black hole, located in the Virgo Cluster.', true, 13000);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 1, true, 'The Earth''s natural satellite.', 4500, 3.5);
INSERT INTO public.moon VALUES (2, 'Phobos', 4, false, 'The larger of Mars'' two moons.', 4500, 0.0);
INSERT INTO public.moon VALUES (3, 'Deimos', 4, false, 'The smaller of Mars'' two moons.', 4500, 0.0);
INSERT INTO public.moon VALUES (4, 'Io', 5, false, 'One of Jupiter''s moons, known for its volcanic activity.', 4600, 0.4);
INSERT INTO public.moon VALUES (5, 'Europa', 5, false, 'A moon of Jupiter, potentially harboring an ocean beneath its ice crust.', 4600, 0.3);
INSERT INTO public.moon VALUES (6, 'Ganymede', 5, false, 'The largest moon in the Solar System, a moon of Jupiter.', 4600, 0.5);
INSERT INTO public.moon VALUES (7, 'Callisto', 5, false, 'One of Jupiter''s largest moons, known for its craters.', 4600, 0.5);
INSERT INTO public.moon VALUES (8, 'Titan', 6, false, 'Saturn''s largest moon, with a thick nitrogen-rich atmosphere.', 4600, 0.5);
INSERT INTO public.moon VALUES (9, 'Rhea', 6, false, 'A moon of Saturn, with a heavily cratered surface.', 4600, 0.2);
INSERT INTO public.moon VALUES (10, 'Enceladus', 6, false, 'A small, icy moon of Saturn, known for its geysers.', 4600, 0.1);
INSERT INTO public.moon VALUES (11, 'Mimas', 6, false, 'A moon of Saturn, often called the "Death Star moon" due to its large impact crater.', 4600, 0.0);
INSERT INTO public.moon VALUES (12, 'Triton', 7, false, 'Neptune''s largest moon, known for its retrograde orbit.', 4600, 0.0);
INSERT INTO public.moon VALUES (13, 'Nereid', 7, false, 'A moon of Neptune, with an eccentric orbit.', 4600, 0.0);
INSERT INTO public.moon VALUES (14, 'Charon', 8, false, 'Pluto''s largest moon, nearly the size of Pluto itself.', 4600, 0.0);
INSERT INTO public.moon VALUES (15, 'Haumea', 9, false, 'An elongated moon of Haumea, one of the dwarf planets.', 4500, 0.0);
INSERT INTO public.moon VALUES (16, 'Makemake', 9, false, 'A moon of Makemake, a dwarf planet located in the Kuiper Belt.', 4500, 0.0);
INSERT INTO public.moon VALUES (17, 'Ceres', 10, false, 'Ceres is classified as a dwarf planet and has several moons.', 4500, 0.0);
INSERT INTO public.moon VALUES (18, 'Gonggong', 11, false, 'A trans-Neptunian object with a known moon.', 4500, 0.0);
INSERT INTO public.moon VALUES (19, 'Eris', 12, false, 'A dwarf planet with a moon named Dysnomia.', 4500, 0.0);
INSERT INTO public.moon VALUES (20, 'Haumea’s Moon', 9, false, 'A moon of Haumea, known for its elongated shape.', 4500, 0.0);
INSERT INTO public.moon VALUES (21, 'Triton-2', 7, false, 'Another moon of Neptune, found in close proximity to Triton.', 4600, 0.0);
INSERT INTO public.moon VALUES (22, 'Leda', 5, false, 'A moon of Jupiter that has an irregular shape.', 4600, 0.0);
INSERT INTO public.moon VALUES (23, 'Amalthea', 5, false, 'A small, irregularly shaped moon of Jupiter.', 4600, 0.0);
INSERT INTO public.moon VALUES (24, 'Callirrhoe', 5, false, 'An outer moon of Jupiter that orbits in a retrograde direction.', 4600, 0.0);
INSERT INTO public.moon VALUES (25, 'Pandora', 6, false, 'A moon of Saturn that is responsible for the formation of Saturn''s F-ring.', 4600, 0.0);
INSERT INTO public.moon VALUES (26, 'Prometheus', 6, false, 'A small moon of Saturn that helps maintain the F-ring structure.', 4600, 0.1);
INSERT INTO public.moon VALUES (27, 'Epimetheus', 6, false, 'A moon of Saturn that shares its orbit with Janus.', 4600, 0.1);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Earth', 1, true, 'The third planet from the Sun, home to life.', 4500, 12.7);
INSERT INTO public.planet VALUES (2, 'Mercury', 1, false, 'The smallest and closest planet to the Sun.', 4600, 4.9);
INSERT INTO public.planet VALUES (3, 'Venus', 1, false, 'The second planet from the Sun, with a thick toxic atmosphere.', 4600, 12.1);
INSERT INTO public.planet VALUES (4, 'Mars', 1, true, 'The fourth planet from the Sun, known for its red appearance and potential for life.', 4500, 6.8);
INSERT INTO public.planet VALUES (5, 'Jupiter', 1, false, 'The largest planet in the Solar System, known for its Great Red Spot.', 4600, 139.8);
INSERT INTO public.planet VALUES (6, 'Saturn', 1, false, 'The sixth planet from the Sun, famous for its rings.', 4600, 116.5);
INSERT INTO public.planet VALUES (7, 'Uranus', 1, false, 'The seventh planet from the Sun, tilted on its side with a faint ring system.', 4600, 50.7);
INSERT INTO public.planet VALUES (8, 'Neptune', 1, false, 'The eighth and farthest planet from the Sun, known for its strong winds and dark blue color.', 4600, 49.5);
INSERT INTO public.planet VALUES (9, 'Proxima b', 2, true, 'An exoplanet orbiting Proxima Centauri, potentially habitable.', 4500, 12.5);
INSERT INTO public.planet VALUES (10, 'Alpha Centauri Bb', 2, false, 'A planet orbiting Alpha Centauri B, potentially within the habitable zone.', 4600, 10.6);
INSERT INTO public.planet VALUES (11, 'Gliese 581g', 3, true, 'An exoplanet in the Gliese 581 system, located in the habitable zone.', 4500, 13.0);
INSERT INTO public.planet VALUES (12, 'Kepler-22b', 4, true, 'An exoplanet in the Kepler-22 system, located in the habitable zone of its star.', 4500, 12.5);
INSERT INTO public.planet VALUES (13, 'HD 209458 b', 5, false, 'A "hot Jupiter" located in the constellation Pegasus, known for its extreme temperatures.', 4600, 128.0);
INSERT INTO public.planet VALUES (14, 'Kepler-16b', 6, false, 'A circumbinary planet orbiting two stars in the Kepler-16 system.', 4600, 92.0);
INSERT INTO public.planet VALUES (15, 'Kepler-62f', 4, true, 'An exoplanet in the Kepler-62 system, located in the habitable zone and potentially habitable.', 4500, 10.0);
INSERT INTO public.planet VALUES (16, 'Tau Ceti e', 6, true, 'A planet in the Tau Ceti system that lies in the habitable zone of its star.', 4500, 10.5);
INSERT INTO public.planet VALUES (17, 'HD 8799 c', 3, false, 'An exoplanet in the HD 8799 system, known for its giant size and lack of habitability.', 4600, 112.0);
INSERT INTO public.planet VALUES (18, 'LHS 1140 b', 2, true, 'A rocky exoplanet located in the habitable zone of the LHS 1140 system.', 4500, 8.3);
INSERT INTO public.planet VALUES (19, 'Gliese 667 Cc', 5, true, 'A planet in the Gliese 667 system, located in the habitable zone.', 4500, 12.5);
INSERT INTO public.planet VALUES (20, 'WASP-12b', 6, false, 'A “hot Jupiter” planet, known for its extremely high temperature due to its close orbit around its star.', 4600, 139.0);
INSERT INTO public.planet VALUES (21, 'WASP-17b', 1, false, 'An exoplanet that has the lowest density and is inflated due to its extreme temperature.', 4600, 200.0);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sol', 1, 'The Sun, the star at the center of the Solar System.', 5, 696.3);
INSERT INTO public.star VALUES (2, 'Alpha Centauri A', 2, 'The closest star to the Sun, part of a triple star system.', 6, 724.0);
INSERT INTO public.star VALUES (3, 'Alpha Centauri B', 2, 'A companion star to Alpha Centauri A in a binary star system.', 5, 698.0);
INSERT INTO public.star VALUES (4, 'Proxima Centauri', 2, 'The closest known star to the Sun, part of the Alpha Centauri system.', 4, 0.1);
INSERT INTO public.star VALUES (5, 'Betelgeuse', 3, 'A red supergiant star in the constellation Orion, nearing the end of its life.', 0, 950.0);
INSERT INTO public.star VALUES (6, 'Rigel', 3, 'A blue supergiant star in the constellation Orion, one of the brightest stars in the sky.', 0, 78.0);
INSERT INTO public.star VALUES (7, 'Sirius A', 4, 'The brightest star in the night sky, part of the binary system Sirius.', 0, 118.0);
INSERT INTO public.star VALUES (8, 'Sirius B', 4, 'The faint white dwarf companion to Sirius A.', 0, 0.0);
INSERT INTO public.star VALUES (9, 'Mira', 5, 'A red giant star that is a variable star in the constellation Cetus.', 0, 244.0);
INSERT INTO public.star VALUES (10, 'Vega', 5, 'A bright star in the constellation Lyra, one of the most studied stars in the sky.', 0, 2.3);
INSERT INTO public.star VALUES (11, 'Spica', 6, 'A binary star system in the constellation Virgo, with the primary star being a blue giant.', 0, 12.4);
INSERT INTO public.star VALUES (12, 'Deneb', 6, 'A massive blue supergiant star in the constellation Cygnus, part of the Summer Triangle.', 0, 203.0);


--
-- Name: dwarfplanet_dwarfplanet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.dwarfplanet_dwarfplanet_id_seq', 10, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 27, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 21, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 12, true);


--
-- Name: dwarfplanet dwarfplanet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.dwarfplanet
    ADD CONSTRAINT dwarfplanet_name_key UNIQUE (name);


--
-- Name: dwarfplanet dwarfplanet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.dwarfplanet
    ADD CONSTRAINT dwarfplanet_pkey PRIMARY KEY (dwarfplanet_id);


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
-- Name: dwarfplanet dwarfplanet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.dwarfplanet
    ADD CONSTRAINT dwarfplanet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


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

