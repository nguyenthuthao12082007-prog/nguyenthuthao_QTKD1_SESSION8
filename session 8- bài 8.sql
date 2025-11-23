CREATE TABLE DonHang (
    ma_don_hang INT,
    ma_khach_hang INT,
    ngay_dat_hang DATE,
    tong_gia_tri DECIMAL(12, 2)
);

INSERT INTO DonHang (ma_don_hang, ma_khach_hang, ngay_dat_hang, tong_gia_tri) VALUES
(1, 101, '2023-01-20', 350000.00),
(2, 102, '2023-02-10', 1250000.00),
(3, 103, '2023-02-15', 180000.00),
(4, 101, '2023-03-05', 450000.00),
(5, 104, '2023-03-22', 850000.00),
(6, 102, '2023-04-11', 980000.00),
(7, 105, '2023-04-18', 250000.00),
(8, 101, '2023-05-25', 220000.00),
(9, 103, '2023-06-01', 320000.00),
(10, 104, '2023-06-30', 1500000.00),
(11, 102, '2023-07-14', 750000.00),
(12, 101, '2023-08-09', 650000.00),
(13, 106, '2023-09-01', 2800000.00),
(14, 103, '2023-09-20', 250000.00),
(15, 102, '2023-10-10', 1150000.00),
(16, 104, '2023-11-05', 450000.00),
(17, 101, '2023-11-28', 150000.00),
(18, 102, '2023-12-15', 2100000.00);

SELECT
    ma_khach_hang,
    SUM(tong_gia_tri)            AS tong_chi_tieu,
    COUNT(*)                     AS tong_so_don_hang,
    AVG(tong_gia_tri)            AS chi_tieu_trung_binh,
    MIN(ngay_dat_hang)           AS ngay_dau_tien,
    MAX(ngay_dat_hang)           AS ngay_gan_nhat
FROM DonHang
GROUP BY ma_khach_hang
ORDER BY tong_chi_tieu DESC;

SELECT
    ma_khach_hang,
    tong_chi_tieu,
    tong_so_don_hang,
    chi_tieu_trung_binh,
    ngay_dau_tien,
    ngay_gan_nhat,
    CASE
        WHEN (tong_chi_tieu >= 2500000) THEN 'Bạch Kim'           -- khách chi mạnh (kể cả 1 đơn lớn)
        WHEN (tong_chi_tieu >= 2000000 AND tong_so_don_hang >= 3) THEN 'Bạch Kim' -- hoặc chi nhiều + thường xuyên
        WHEN (tong_chi_tieu >= 800000 AND tong_so_don_hang >= 2) THEN 'Vàng'      -- khách chi trung bình & có tần suất
        WHEN (chi_tieu_trung_binh >= 500000 AND tong_so_don_hang >= 1) THEN 'Vàng' -- hoặc trung bình đơn lớn
        ELSE 'Bạc'
    END AS hang_khach_hang
FROM (

    SELECT
        ma_khach_hang,
        SUM(tong_gia_tri) AS tong_chi_tieu,
        COUNT(*) AS tong_so_don_hang,
        AVG(tong_gia_tri) AS chi_tieu_trung_binh,
        MIN(ngay_dat_hang) AS ngay_dau_tien,
        MAX(ngay_dat_hang)  AS ngay_gan_nhat
    FROM DonHang
    GROUP BY ma_khach_hang
) AS customer_profile
ORDER BY
    CASE
        WHEN ( (tong_chi_tieu >= 2500000) OR (tong_chi_tieu >= 2000000 AND tong_so_don_hang >= 3) ) THEN 1
        WHEN ( (tong_chi_tieu >= 800000 AND tong_so_don_hang >= 2) OR (chi_tieu_trung_binh >= 500000 AND tong_so_don_hang >= 1) ) THEN 2
        ELSE 3
    END,
    tong_chi_tieu DESC;