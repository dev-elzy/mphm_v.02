-- SQL Script untuk Data Dummy Relasional (Akademik, Nilai, Kehadiran, Pelanggaran)
-- Dijalankan pada D1 menggunakan wrangler d1 execute

-- ============================================================
-- 1. ACADEMIC YEARS (Tahun Ajaran)
-- ============================================================
INSERT INTO academic_years (id, name, start_date, end_date, is_active, is_closed) VALUES
('ay-2526', '2025/2026', '2025-07-15', '2026-06-15', 1, 0);

-- ============================================================
-- 2. CURRICULUMS & SUBJECTS (Kurikulum & Mata Pelajaran)
-- ============================================================
INSERT INTO curriculums (id, name, description, is_active) VALUES
('curr-01', 'Kurikulum Pesantren Terpadu 2025', 'Kurikulum integrasi salaf dan khalaf', 1);

INSERT INTO subjects (id, code, name, subject_type, is_active) VALUES
('sub-fqh', 'MP-FQH', 'Fiqh Sunnah', 'MAPEL', 1),
('sub-aqd', 'MP-AQD', 'Aqidah Akhlaq', 'MAPEL', 1),
('sub-arb', 'MP-ARB', 'Bahasa Arab', 'MAPEL', 1),
('sub-qrn', 'MP-QRN', 'Tahfidz Al-Quran', 'MAPEL', 1);

-- Mapping Mata Pelajaran ke Kurikulum (Untuk Tsanawiyyah Kelas I)
INSERT INTO curriculum_subjects (id, curriculum_id, subject_id, institution_level, class_level) VALUES
('map-01', 'curr-01', 'sub-fqh', 'Tsanawiyyah', 'I'),
('map-02', 'curr-01', 'sub-aqd', 'Tsanawiyyah', 'I'),
('map-03', 'curr-01', 'sub-arb', 'Tsanawiyyah', 'I'),
('map-04', 'curr-01', 'sub-qrn', 'Tsanawiyyah', 'I');

-- ============================================================
-- 3. ACADEMIC CLASSES & ENROLLMENTS (Kelas & Anggota Kelas)
-- ============================================================
-- Membuat Kelas Tsanawiyyah I-A, Wali Kelas: Usth. Siti Mustahiq (ID Profile: 'teacher-mustahiq')
INSERT INTO academic_classes (id, academic_year_id, curriculum_id, institution_level, class_level, section, full_name, mustahiq_id, capacity) VALUES
('class-tsan-1a', 'ay-2526', 'curr-01', 'Tsanawiyyah', 'I', 'A', 'Tsanawiyyah I-A', 'teacher-mustahiq', 35);

-- Memasukkan 15 Siswi dummy yang sudah ada (ID Profile: 'prof-01' s/d 'prof-15') ke kelas tersebut
INSERT INTO class_enrollments (id, class_id, student_id, status) VALUES
('enr-01', 'class-tsan-1a', 'prof-01', 'ACTIVE'),
('enr-02', 'class-tsan-1a', 'prof-02', 'ACTIVE'),
('enr-03', 'class-tsan-1a', 'prof-03', 'ACTIVE'),
('enr-04', 'class-tsan-1a', 'prof-04', 'ACTIVE'),
('enr-05', 'class-tsan-1a', 'prof-05', 'ACTIVE'),
('enr-06', 'class-tsan-1a', 'prof-06', 'ACTIVE'),
('enr-07', 'class-tsan-1a', 'prof-07', 'ACTIVE'),
('enr-08', 'class-tsan-1a', 'prof-08', 'ACTIVE'),
('enr-09', 'class-tsan-1a', 'prof-09', 'ACTIVE'),
('enr-10', 'class-tsan-1a', 'prof-10', 'ACTIVE'),
('enr-11', 'class-tsan-1a', 'prof-11', 'ACTIVE'),
('enr-12', 'class-tsan-1a', 'prof-12', 'ACTIVE'),
('enr-13', 'class-tsan-1a', 'prof-13', 'ACTIVE'),
('enr-14', 'class-tsan-1a', 'prof-14', 'ACTIVE'),
('enr-15', 'class-tsan-1a', 'prof-15', 'ACTIVE');

-- ============================================================
-- 4. STUDENT SCORES (Penilaian Nilai Kwartal 1 & 2)
-- ============================================================
-- Berikan nilai Fiqh dan Aqidah untuk 3 siswi pertama sebagai contoh
INSERT INTO student_scores (id, class_id, student_id, subject_id, kwartal, score) VALUES
('scr-01', 'class-tsan-1a', 'prof-01', 'sub-fqh', 1, 8.5),
('scr-02', 'class-tsan-1a', 'prof-01', 'sub-aqd', 1, 9.0),
('scr-03', 'class-tsan-1a', 'prof-02', 'sub-fqh', 1, 7.5),
('scr-04', 'class-tsan-1a', 'prof-02', 'sub-aqd', 1, 8.0),
('scr-05', 'class-tsan-1a', 'prof-03', 'sub-fqh', 1, 9.5),
('scr-06', 'class-tsan-1a', 'prof-03', 'sub-aqd', 1, 9.5);

-- ============================================================
-- 5. ATTENDANCE RECORDS (Kehadiran Siswa)
-- ============================================================
-- Rekam absensi tanggal 2025-08-01, HISSOH_ULA untuk kelas Tsanawiyyah I-A
INSERT INTO attendance_records (id, academic_year_id, class_id, student_id, date, session, status, notes, recorded_by) VALUES
('att-01', 'ay-2526', 'class-tsan-1a', 'prof-01', '2025-08-01', 'HISSOH_ULA', 'HADIR', NULL, 'acc-mustahiq'),
('att-02', 'ay-2526', 'class-tsan-1a', 'prof-02', '2025-08-01', 'HISSOH_ULA', 'SAKIT', 'Surat dokter', 'acc-mustahiq'),
('att-03', 'ay-2526', 'class-tsan-1a', 'prof-03', '2025-08-01', 'HISSOH_ULA', 'IZIN', 'Pulang kampung', 'acc-mustahiq'),
('att-04', 'ay-2526', 'class-tsan-1a', 'prof-04', '2025-08-01', 'HISSOH_ULA', 'ALFA', 'Tanpa keterangan', 'acc-mustahiq');

-- ============================================================
-- 6. DISCIPLINARY MASTER (Kategori, Tingkat Keparahan, & Jenis)
-- ============================================================
INSERT INTO violation_categories (id, name, description, sort_order, is_active) VALUES
('vcat-adab', 'Adab & Etika', 'Pelanggaran terkait adab santri', 1, 1),
('vcat-asrama', 'Kedisiplinan Asrama', 'Tata tertib asrama', 2, 1);

INSERT INTO violation_severities (id, name, level, badge_color, description, is_active) VALUES
('vsev-ringan', 'Ringan', 1, '#22c55e', 'Pelanggaran kecil', 1),
('vsev-sedang', 'Sedang', 2, '#eab308', 'Pelanggaran menengah', 1),
('vsev-berat', 'Berat', 3, '#f97316', 'Pelanggaran berat (Ta''zir)', 1);

INSERT INTO violation_types (id, category_id, severity_id, name, description, points, is_active) VALUES
('vtype-01', 'vcat-adab', 'vsev-sedang', 'Berbicara tidak sopan', 'Menggunakan kata kasar kepada teman', 15, 1),
('vtype-02', 'vcat-asrama', 'vsev-ringan', 'Terlambat masuk kamar', 'Tidak kembali ke kamar tepat waktu', 5, 1),
('vtype-03', 'vcat-asrama', 'vsev-berat', 'Kabur dari asrama', 'Keluar lingkungan tanpa izin', 50, 1);

-- ============================================================
-- 7. STUDENT VIOLATIONS (Riwayat Pelanggaran Santri)
-- ============================================================
INSERT INTO student_violations (id, academic_year_id, student_id, violation_type_id, incident_date, incident_time, location, description, reported_by, status) VALUES
('viol-01', 'ay-2526', 'prof-04', 'vtype-02', '2025-08-02', '22:15', 'Asrama 2', 'Terlambat kembali setelah jam malam', 'acc-keamanan', 'RECORDED'),
('viol-02', 'ay-2526', 'prof-02', 'vtype-01', '2025-08-05', '10:00', 'Kelas', 'Berdebat kasar saat pergantian jam', 'acc-mustahiq', 'RECORDED');
