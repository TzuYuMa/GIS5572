-- create empty feature class
CREATE TABLE Sql_feature_class (
    id SERIAL PRIMARY KEY,
    geom GEOMETRY(Point, 4326),
    name VARCHAR(100)
);

-- Add points to a feature class
CREATE TABLE point_fc (
  name VARCHAR(100),
  geom GEOMETRY(POINT, 4326)
);


INSERT INTO point_fc (name, geom)
VALUES 
	('POINT1', ST_GeomFromText('POINT(0 0)', 4326)),
	('POINT2', ST_GeomFromText('POINT(1 1)', 4326)),
	('POINT3', ST_GeomFromText('POINT(2 2)', 4326));

-- Add line to a feature class
CREATE TABLE lines_fc (
  name VARCHAR(100),
  geom GEOMETRY(LINESTRING, 4326)
);

INSERT INTO lines_fc (name, geom)
VALUES
	('LINE1', ST_GeomFromText('LINESTRING(0 0, 1 1)', 4326)),
	('LINE2', ST_GeomFromText('LINESTRING(0 3, 1 4)', 4326)),
	('LINE3', ST_GeomFromText('LINESTRING(2 3, 0 4)', 4326));

-- Add polygons to a feature class
CREATE TABLE area_fc (
  name VARCHAR(100),
  geom GEOMETRY(POLYGON, 4326)
);

INSERT INTO area_fc (name, geom)
VALUES
    ('AREA1', ST_GeomFromText('POLYGON((0 0, 1 1, 2 2, 0 0))', 4326)),
    ('AREA2', ST_GeomFromText('POLYGON((0 3, 1 4, 2 3, 0 3))', 4326)),
    ('AREA3', ST_GeomFromText('POLYGON((2 3, 0 4, 3 5, 2 3))', 4326));

-- View each row in an attribute table for a feature class
SELECT * FROM point_fc;

-- View each geometry object in a feature class
SELECT ST_AsText(geom) FROM point_fc;

-- Summarize the contents of a feature class
SELECT COUNT(*) FROM your_feature_class;
SELECT DISTINCT ST_GeometryType(geom) FROM your_feature_class;
SELECT column_name FROM information_schema.columns WHERE table_name = 'your_feature_class';

-- Export to shapefile
-- Export to geodatabase

