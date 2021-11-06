-- Creating geometries table
CREATE TABLE public.geometries (name varchar, geom geometry);

INSERT INTO geometries VALUES
  ('Point', 'POINT(0 0)'),
  ('Linestring', 'LINESTRING(0 0, 1 1, 2 1, 2 2)'),
  ('Polygon', 'POLYGON((0 0, 1 0, 1 1, 0 1, 0 0))'),
  ('PolygonWithHole', 'POLYGON((0 0, 10 0, 10 10, 0 10, 0 0),(1 1, 1 2, 2 2, 2 1, 1 1))'),
  ('Collection', 'GEOMETRYCOLLECTION(POINT(2 0),POLYGON((0 0, 1 0, 1 1, 0 1, 0 0)))');

SELECT name, ST_AsText(geom) FROM geometries;

-- Creating custom table named 'USC' to store locations and their respective coordinates (stored as GEOGEAPHIES)
CREATE TABLE usc (
    code VARCHAR(20),
    geog GEOGRAPHY(Point)
  );
  
-- Inserting data in the custom 'USC' table
INSERT INTO usc VALUES ('Leavey Library', 'POINT(-118.28308 34.02165)');
INSERT INTO usc VALUES ('Rossier School', 'POINT(-118.28392 34.02192)');
INSERT INTO usc VALUES ('Doheny Library', 'POINT(-118.28389 34.02009)');
INSERT INTO usc VALUES ('Alumni Center', 'POINT(-118.28598 34.02006)');
INSERT INTO usc VALUES ('Campus Center', 'POINT(-118.28668 34.02014)');
INSERT INTO usc VALUES ('Viterbi School', 'POINT(-118.28941 34.01920)');
INSERT INTO usc VALUES ('Powell Hall', 'POINT(-118.28857 34.01919)');
INSERT INTO usc VALUES ('Annenburg School', 'POINT(-118.28630 34.02182)');
INSERT INTO usc VALUES ('Religious Center', 'POINT(-118.28489 34.02310)');
INSERT INTO usc VALUES ('Jefferson Parking', 'POINT(-118.28887 34.02482)');
INSERT INTO usc VALUES ('Tommy Trojan', 'POINT(-118.28543 34.02054)');
INSERT INTO usc VALUES ('Target Starbucks', 'POINT(-118.28400 34.02574)');
INSERT INTO usc VALUES ('Home', 'POINT(-118.28734 34.03275)');

-- Verify inserted output
SELECT code, ST_AsText(usc.geog) FROM usc;

------------|| QUERY 1: Calculate CONVEX HULL ||------------
WITH convex_hull AS
  (SELECT 1 AS Convex_Hull_Col1,
          ST_AsText(ST_ConvexHull(ST_Collect(ST_AsText(u.geog)))) AS Convex_Hull
   FROM usc AS u
   GROUP BY 1)
SELECT Convex_Hull
FROM convex_hull;
-- OUTPUT
-- POLYGON((-118.28857 34.01919,-118.28941 34.0192,-118.28887 34.02482,-118.28734 34.03275,-118.284 34.02574,-118.28308 34.02165,-118.28389 34.02009,-118.28857 34.01919))

-- Get the geometry of Home
SELECT ST_AsEWKT(usc.geog)
FROM usc
WHERE code = 'Home'
-- OUTPUT
-- SRID=4326;POINT(-118.28734 34.03275)


------------|| QUERY 2: Get NEAREST NEIGHBORS ||------------
SELECT usc.code,
  ST_AsText(ST_Transform(usc.geog::geometry, 4327)),
  ST_Distance(usc.geog, 'SRID=4326;POINT(-118.28734 34.03275)') AS dist
FROM
  usc
ORDER BY
  usc.geog <-> 'SRID=4326;POINT(-118.28734 34.03275)'::geometry
LIMIT 5;

-- OUTPUT
-- coordinates          GEOGRAPHY                           DISTANCE
-- "Home"               "POINT(-118.28734 34.03275)"        0
-- "Target Starbucks"   "POINT(-118.284 34.02574)"          836.5176212
-- "Jefferson Parking"  "POINT(-118.28887 34.02482)"        890.89558332
-- "Religious Center"   "POINT(-118.28489 34.0231)"         1094.05953686
-- "Annenburg School"   "POINT(-118.2863 34.02182)"         1216.18579806