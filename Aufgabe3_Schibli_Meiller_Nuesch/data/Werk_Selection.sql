-- Werke im gleichen Jahr (max 20)
SELECT w.HAUPTNR, w.TITEL, w.JAHR, CONCAT('http://server1102.cs.technik.fhnw.ch/bilder/' , w.BILDNAME) AS URL, p.NAMIDENT FROM ivis_fs16.Werk AS w
LEFT OUTER JOIN ivis_fs16.Person AS p
ON w.URHAUPTNR = p.HAUPTNR
WHERE w.JAHR = (
SELECT JAHR FROM ivis_fs16.Werk WHERE HAUPTNR = '6008386'
) LIMIT 20;

-- Werke des gleichen Künstler (max 20)
SELECT w.HAUPTNR, w.TITEL, w.JAHR, CONCAT('http://server1102.cs.technik.fhnw.ch/bilder/' , w.BILDNAME) AS URL, p.NAMIDENT FROM ivis_fs16.Werk AS w
LEFT OUTER JOIN ivis_fs16.Person AS p
ON w.URHAUPTNR = p.HAUPTNR
WHERE w.URHAUPTNR = (
SELECT URHAUPTNR FROM ivis_fs16.Werk WHERE HAUPTNR = '6008386'
) LIMIT 20;

-- Werke aus gleichen Ausstellungen
SELECT w.HAUPTNR, w.TITEL, w.JAHR, CONCAT('http://server1102.cs.technik.fhnw.ch/bilder/' , w.BILDNAME) AS URL, p.NAMIDENT, a.AUSST_DATUM, a.AUSST_ORT, a.AUSST_TITEL
FROM ivis_fs16.Werkverknuepfung v
INNER JOIN ivis_fs16.Ausstellung AS a
ON a.HAUPTNR = v.A20_HAUPTNR
INNER JOIN ivis_fs16.Werk AS w
ON w.HAUPTNR = v.O20_HAUPTNR
LEFT OUTER JOIN ivis_fs16.Person AS p
ON w.URHAUPTNR = p.HAUPTNR
WHERE v.SETNAME = 'EXPONACHWEIS'
AND v.A20_HAUPTNR IN (
 SELECT v1.A20_HAUPTNR FROM ivis_fs16.Werkverknuepfung v1
 WHERE v1.O20_HAUPTNR = '6008386'
 AND v1.SETNAME = 'EXPONACHWEIS'
);

-- Werke des gleichen Besitzers
SELECT w.HAUPTNR, w.TITEL, w.JAHR, CONCAT('http://server1102.cs.technik.fhnw.ch/bilder/' , w.BILDNAME) AS URL, p.NAMIDENT, b.KURZFORM
FROM ivis_fs16.Werk AS w
INNER JOIN ivis_fs16.Besitzer AS b
ON w.HAUPTNR = b.O20_HAUPTNR
LEFT OUTER JOIN ivis_fs16.Person AS p
ON w.URHAUPTNR = p.HAUPTNR
WHERE b.BESITZERHAUPTNR IN (
SELECT b1.BESITZERHAUPTNR 
 FROM ivis_fs16.Werk w1
 INNER JOIN ivis_fs16.Besitzer b1
 ON b1.O20_HAUPTNR = w1.HAUPTNR
 WHERE w1.HAUPTNR = '6008386'
) LIMIT 20;

-- Werke aus gleicher Literatur
SELECT w.HAUPTNR, w.TITEL, w.JAHR, CONCAT('http://server1102.cs.technik.fhnw.ch/bilder/' , w.BILDNAME) AS URL, p.NAMIDENT, l.TITEL
FROM ivis_fs16.Werkverknuepfung v
INNER JOIN ivis_fs16.Literatur l
ON l.HAUPTNR = v.L20_HAUPTNR
INNER JOIN ivis_fs16.Werk AS w
ON w.HAUPTNR = v.O20_HAUPTNR
LEFT OUTER JOIN ivis_fs16.Person AS p
ON w.URHAUPTNR = p.HAUPTNR
WHERE v.SETNAME = 'LITNACHWEIS'
AND v.L20_HAUPTNR IN (
 SELECT v1.L20_HAUPTNR FROM ivis_fs16.Werkverknuepfung v1
 WHERE v1.O20_HAUPTNR = '6008386'
 AND v1.SETNAME = 'LITNACHWEIS'
) LIMIT 15;

 