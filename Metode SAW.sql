CREATE TABLE penilaian (
  idPenilaian int(11) PRIMARY KEY AUTO_INCREMENT,
  idKaryawan int(11),
  KPI float,
  Attitude float,
  Layanan float ,
  Presensi float ,
  Ketelitian float,
  FOREIGN KEY (idKaryawan) REFERENCES Karyawan (idKaryawan),
  FOREIGN KEY (idKriteria) REFERENCES Kriteria (idKriteria)
);


INSERT INTO penilaian (`idPenilaian`, `idKaryawan`, `KPI`, `Attitude`, `Layanan`, `Presensi`, `Ketelitian`) VALUES
(1, 1, 50, 50, 50, 80, 70),
(2, 2, 60, 70, 90, 90, 60),
(3, 3, 70, 80, 60, 70, 80),
(4, 4, 60, 70, 90, 90, 60),
(5, 5, 40, 80, 60, 60, 90),
(6, 6, 50, 50, 50, 80, 70),
(7, 7, 80, 60, 70, 70, 80),
(8, 8, 50, 50, 50, 80, 70),
(9, 9, 70, 60, 70, 90, 30),
(10, 10, 60, 70, 90, 90, 60),
(11, 11, 50, 50, 50, 80, 70),
(12, 12, 60, 70, 90, 90, 60);

SELECT 
    idPenilaian,
    idKaryawan,
    KPI/ (SELECT MAX(KPI) FROM penilaian) AS normalisasi_KPI,
    Attitude / (SELECT MAX(Attitude) FROM penilaian) AS normalisasi_Attitude,
    Layanan / (SELECT MAX(Layanan) FROM penilaian) AS normalisasi_Layanan,
    (SELECT MIN(Presensi) FROM penilaian) / Presensi AS normalisasi_Presensi,
    Ketelitian / (SELECT MAX(Ketelitian) FROM penilaian) AS normalisasi_Ketelitian,
FROM penilaian;

SELECT 
    idPenilaian,
    idKaryawan,
    ( 0.35 * (KPI/ (SELECT MAX(KPI) FROM penilaian)) + 
    0.2 * (Attitude / (SELECT MAX(Attitude) FROM penilaian))+
    0.15 * (Layanan / (SELECT MAX(Layanan) FROM penilaian))+
    0.1 * ((SELECT MIN(Presensi) FROM penilaian) / Presensi)+
    0.2 * (Ketelitian / (SELECT MAX(Ketelitian) FROM penilaian))
    ) AS Hasil
FROM penilaian
ORDER BY Hasil DESC
LIMIT 1;
