-- ============================================================
-- WIPE PREVIOUS DUMMY DATA
-- ============================================================
-- Hapus dari tabel relasional dulu (child) ke parent untuk menghindari FK error

DELETE FROM student_violations WHERE id IN ('viol-01', 'viol-02');
DELETE FROM violation_types WHERE id IN ('vtype-01', 'vtype-02', 'vtype-03');
DELETE FROM violation_severities WHERE id IN ('vsev-ringan', 'vsev-sedang', 'vsev-berat');
DELETE FROM violation_categories WHERE id IN ('vcat-adab', 'vcat-asrama');

DELETE FROM attendance_records WHERE id IN ('att-01', 'att-02', 'att-03', 'att-04');
DELETE FROM student_scores WHERE id IN ('scr-01', 'scr-02', 'scr-03', 'scr-04', 'scr-05', 'scr-06');
DELETE FROM class_enrollments WHERE id IN ('enr-01', 'enr-02', 'enr-03', 'enr-04', 'enr-05', 'enr-06', 'enr-07', 'enr-08', 'enr-09', 'enr-10', 'enr-11', 'enr-12', 'enr-13', 'enr-14', 'enr-15');
DELETE FROM academic_classes WHERE id IN ('class-tsan-1a');

DELETE FROM curriculum_subjects WHERE id IN ('map-01', 'map-02', 'map-03', 'map-04');
DELETE FROM subjects WHERE id IN ('sub-fqh', 'sub-aqd', 'sub-arb', 'sub-qrn');
DELETE FROM curriculums WHERE id IN ('curr-01');

DELETE FROM student_profiles WHERE id IN ('prof-01', 'prof-02', 'prof-03', 'prof-04', 'prof-05', 'prof-06', 'prof-07', 'prof-08', 'prof-09', 'prof-10', 'prof-11', 'prof-12', 'prof-13', 'prof-14', 'prof-15');
DELETE FROM guardian_profiles WHERE id IN ('guardian-1');
DELETE FROM teacher_profiles WHERE id IN ('teacher-mustahiq');
DELETE FROM organization_memberships WHERE id IN ('org-mundzir', 'org-mufattisy', 'org-keamanan');
DELETE FROM user_accounts WHERE id IN ('acc-mundzir', 'acc-mufattisy', 'acc-mustahiq', 'acc-keamanan', 'acc-wali-1');
DELETE FROM people WHERE id IN ('person-mundzir', 'person-mufattisy', 'person-mustahiq', 'person-keamanan', 'person-wali-1', 'santri-01', 'santri-02', 'santri-03', 'santri-04', 'santri-05', 'santri-06', 'santri-07', 'santri-08', 'santri-09', 'santri-10', 'santri-11', 'santri-12', 'santri-13', 'santri-14', 'santri-15');

-- Hapus tahun ajaran dummy yang salah sebelumnya
DELETE FROM academic_years WHERE id = 'ay-2526';


-- ============================================================
-- INSERT NEW RELATIONAL DUMMY DATA
-- ============================================================

-- 1. DATA PENGURUS & STAF (Orang Dewasa)
INSERT INTO people (id, nik, full_name, gender, birth_place, birth_date, address, phone_number, created_at) VALUES 
('person-mundzir', '3200000000000001', 'Ust. Ahmad Mundzir', 'L', 'Bandung', '1985-05-12', 'Jl. Merdeka No.1', '081200000001', strftime('%s', 'now')),
('person-mufattisy', '3200000000000002', 'Ust. Budi Mufattisy', 'L', 'Jakarta', '1986-06-15', 'Jl. Sudirman No.2', '081200000002', strftime('%s', 'now')),
('person-mustahiq', '3200000000000003', 'Usth. Siti Mustahiq', 'P', 'Surabaya', '1990-08-20', 'Jl. Diponegoro No.3', '081200000003', strftime('%s', 'now')),
('person-keamanan', '3200000000000004', 'Bpk. Joko Keamanan', 'L', 'Yogyakarta', '1980-01-10', 'Jl. Malioboro No.4', '081200000004', strftime('%s', 'now')),
('person-wali-1', '3200000000000005', 'Bpk. Hasan Wali', 'L', 'Semarang', '1975-12-05', 'Jl. Pahlawan No.5', '081200000005', strftime('%s', 'now'));

-- 2. USER ACCOUNTS (Akun Login)
-- Password hash menggunakan bcrypt sederhana untuk kata sandi "password123"
INSERT INTO user_accounts (id, person_id, username, password_hash, role, is_active, created_at) VALUES
('acc-mundzir', 'person-mundzir', 'mundzir01', '$2a$10$X8H.h.OQ5lD9R3K.gO9a.OM9S0T6v.q8I8V4uJq2i5Z9C', 'Mundzir', 1, strftime('%s', 'now')),
('acc-mufattisy', 'person-mufattisy', 'mufattisy01', '$2a$10$X8H.h.OQ5lD9R3K.gO9a.OM9S0T6v.q8I8V4uJq2i5Z9C', 'Mufattisy', 1, strftime('%s', 'now')),
('acc-mustahiq', 'person-mustahiq', 'mustahiq01', '$2a$10$X8H.h.OQ5lD9R3K.gO9a.OM9S0T6v.q8I8V4uJq2i5Z9C', 'Mustahiq', 1, strftime('%s', 'now')),
('acc-keamanan', 'person-keamanan', 'keamanan01', '$2a$10$X8H.h.OQ5lD9R3K.gO9a.OM9S0T6v.q8I8V4uJq2i5Z9C', 'Petugas Keamanan', 1, strftime('%s', 'now')),
('acc-wali-1', 'person-wali-1', 'wali01', '$2a$10$X8H.h.OQ5lD9R3K.gO9a.OM9S0T6v.q8I8V4uJq2i5Z9C', 'Wali Santri', 1, strftime('%s', 'now'));

-- 3. ORGANISASI & PROFIL GURU/WALI
INSERT INTO organization_memberships (id, person_id, role_name, status) VALUES
('org-mundzir', 'person-mundzir', 'Mundzir', 'ACTIVE'),
('org-mufattisy', 'person-mufattisy', 'Mufattisy', 'ACTIVE'),
('org-keamanan', 'person-keamanan', 'Sie Keamanan', 'ACTIVE');

INSERT INTO teacher_profiles (id, person_id, teacher_code, status) VALUES
('teacher-mustahiq', 'person-mustahiq', 'UST-001', 'ACTIVE');

INSERT INTO guardian_profiles (id, person_id, family_card_number, relation) VALUES
('guardian-1', 'person-wali-1', '3200001111111111', 'AYAH');

-- 4. 15 DATA SANTRI / SISWI
INSERT INTO people (id, nik, full_name, gender, birth_place, birth_date, address) VALUES
('santri-01', '320101', 'Aisyah Putri', 'P', 'Bandung', '2008-01-01', 'Asrama 1'),
('santri-02', '320102', 'Khadijah Zahra', 'P', 'Jakarta', '2008-02-02', 'Asrama 1'),
('santri-03', '320103', 'Fatimah Nisa', 'P', 'Surabaya', '2008-03-03', 'Asrama 1'),
('santri-04', '320104', 'Zainab Qolby', 'P', 'Malang', '2008-04-04', 'Asrama 2'),
('santri-05', '320105', 'Ruqayyah Jamil', 'P', 'Bogor', '2008-05-05', 'Asrama 2'),
('santri-06', '320106', 'Ummu Kultsum', 'P', 'Cianjur', '2008-06-06', 'Asrama 2'),
('santri-07', '320107', 'Safiyah Ananda', 'P', 'Sukabumi', '2008-07-07', 'Asrama 3'),
('santri-08', '320108', 'Hafshah Mufida', 'P', 'Tasikmalaya', '2008-08-08', 'Asrama 3'),
('santri-09', '320109', 'Maimunah Laila', 'P', 'Cirebon', '2008-09-09', 'Asrama 3'),
('santri-10', '320110', 'Asma Nadia', 'P', 'Garut', '2008-10-10', 'Asrama 4'),
('santri-11', '320111', 'Sarah Fitria', 'P', 'Purwakarta', '2008-11-11', 'Asrama 4'),
('santri-12', '320112', 'Hajar Syifa', 'P', 'Karawang', '2008-12-12', 'Asrama 4'),
('santri-13', '320113', 'Maryam Rindu', 'P', 'Bekasi', '2009-01-13', 'Asrama 5'),
('santri-14', '320114', 'Nusaibah Binti', 'P', 'Depok', '2009-02-14', 'Asrama 5'),
('santri-15', '320115', 'Syifa Ulya', 'P', 'Tangerang', '2009-03-15', 'Asrama 5');

INSERT INTO student_profiles (id, person_id, stambuk_number, nis, nisn, enrollment_year, status) VALUES
('prof-01', 'santri-01', 'ST-2023-001', 'NIS-001', 'NISN-001', 2023, 'ACTIVE'),
('prof-02', 'santri-02', 'ST-2023-002', 'NIS-002', 'NISN-002', 2023, 'ACTIVE'),
('prof-03', 'santri-03', 'ST-2023-003', 'NIS-003', 'NISN-003', 2023, 'ACTIVE'),
('prof-04', 'santri-04', 'ST-2023-004', 'NIS-004', 'NISN-004', 2023, 'ACTIVE'),
('prof-05', 'santri-05', 'ST-2023-005', 'NIS-005', 'NISN-005', 2023, 'ACTIVE'),
('prof-06', 'santri-06', 'ST-2023-006', 'NIS-006', 'NISN-006', 2023, 'ACTIVE'),
('prof-07', 'santri-07', 'ST-2023-007', 'NIS-007', 'NISN-007', 2023, 'ACTIVE'),
('prof-08', 'santri-08', 'ST-2023-008', 'NIS-008', 'NISN-008', 2023, 'ACTIVE'),
('prof-09', 'santri-09', 'ST-2023-009', 'NIS-009', 'NISN-009', 2023, 'ACTIVE'),
('prof-10', 'santri-10', 'ST-2023-010', 'NIS-010', 'NISN-010', 2023, 'ACTIVE'),
('prof-11', 'santri-11', 'ST-2023-011', 'NIS-011', 'NISN-011', 2023, 'ACTIVE'),
('prof-12', 'santri-12', 'ST-2023-012', 'NIS-012', 'NISN-012', 2023, 'ACTIVE'),
('prof-13', 'santri-13', 'ST-2023-013', 'NIS-013', 'NISN-013', 2023, 'ACTIVE'),
('prof-14', 'santri-14', 'ST-2023-014', 'NIS-014', 'NISN-014', 2023, 'ACTIVE'),
('prof-15', 'santri-15', 'ST-2023-015', 'NIS-015', 'NISN-015', 2023, 'ACTIVE');



-- 6. CURRICULUMS & SUBJECTS
INSERT INTO curriculums (id, name, description, is_active) VALUES
('curr-01', 'Kurikulum Pesantren Terpadu', 'Kurikulum integrasi salaf dan khalaf', 1);

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

-- 7. ACADEMIC CLASSES & ENROLLMENTS (MENGGUNAKAN TAHUN AJARAN year-2026-active)
INSERT INTO academic_classes (id, academic_year_id, curriculum_id, institution_level, class_level, section, full_name, mustahiq_id, capacity) VALUES
('class-tsan-1a', 'year-2026-active', 'curr-01', 'Tsanawiyyah', 'I', 'A', 'Tsanawiyyah I-A', 'teacher-mustahiq', 35);

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

-- 8. STUDENT SCORES
INSERT INTO student_scores (id, class_id, student_id, subject_id, kwartal, score) VALUES
('scr-01', 'class-tsan-1a', 'prof-01', 'sub-fqh', 1, 8.5),
('scr-02', 'class-tsan-1a', 'prof-01', 'sub-aqd', 1, 9.0),
('scr-03', 'class-tsan-1a', 'prof-02', 'sub-fqh', 1, 7.5),
('scr-04', 'class-tsan-1a', 'prof-02', 'sub-aqd', 1, 8.0),
('scr-05', 'class-tsan-1a', 'prof-03', 'sub-fqh', 1, 9.5),
('scr-06', 'class-tsan-1a', 'prof-03', 'sub-aqd', 1, 9.5);

-- 9. ATTENDANCE RECORDS (MENGGUNAKAN year-2026-active)
INSERT INTO attendance_records (id, academic_year_id, class_id, student_id, date, session, status, notes, recorded_by) VALUES
('att-01', 'year-2026-active', 'class-tsan-1a', 'prof-01', '2026-08-01', 'HISSOH_ULA', 'HADIR', NULL, 'acc-mustahiq'),
('att-02', 'year-2026-active', 'class-tsan-1a', 'prof-02', '2026-08-01', 'HISSOH_ULA', 'SAKIT', 'Surat dokter', 'acc-mustahiq'),
('att-03', 'year-2026-active', 'class-tsan-1a', 'prof-03', '2026-08-01', 'HISSOH_ULA', 'IZIN', 'Pulang kampung', 'acc-mustahiq'),
('att-04', 'year-2026-active', 'class-tsan-1a', 'prof-04', '2026-08-01', 'HISSOH_ULA', 'ALFA', 'Tanpa keterangan', 'acc-mustahiq');

-- 10. DISCIPLINARY MASTER
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

-- 11. STUDENT VIOLATIONS (MENGGUNAKAN year-2026-active)
INSERT INTO student_violations (id, academic_year_id, student_id, violation_type_id, incident_date, incident_time, location, description, reported_by, status) VALUES
('viol-01', 'year-2026-active', 'prof-04', 'vtype-02', '2026-08-02', '22:15', 'Asrama 2', 'Terlambat kembali setelah jam malam', 'acc-keamanan', 'RECORDED'),
('viol-02', 'year-2026-active', 'prof-02', 'vtype-01', '2026-08-05', '10:00', 'Kelas', 'Berdebat kasar saat pergantian jam', 'acc-mustahiq', 'RECORDED');
