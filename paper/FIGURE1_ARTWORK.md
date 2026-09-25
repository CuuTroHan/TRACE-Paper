# Sửa Figure 1 nhưng giữ nguyên thiết kế của tác giả

`Fig1.png` là ảnh gốc 1536 x 1024 px của nhóm. Bài đặt ảnh rộng khoảng 160 mm; `pdfimages -list trace-paper.pdf` đo được 244 x 244 dpi ở trang 6. Ảnh và caption hiện được giữ nguyên. Tài liệu này chỉ hướng dẫn cách sửa, **không** có nghĩa lỗi F01 đã hoàn tất.

[Hướng dẫn ISSE](https://link.springer.com/journal/11334/submission-guidelines) ưu tiên EPS cho hình vector có font nhúng và yêu cầu ít nhất 600 dpi cho combination artwork (sơ đồ màu có nhiều đường nét và chữ).

## Cách dùng đúng hình của bạn

1. Tìm **file thiết kế đã tạo ra chính hình này**: PowerPoint, draw.io, Figma, Illustrator, SVG hoặc tương đương. Giữ nguyên bố cục bảy khối, chữ, icon, mũi tên và màu; không thay bằng sơ đồ TRACE vẽ lại theo bố cục khác.
2. Tốt nhất là xuất các shape/chữ gốc thành **EPS vector có font nhúng**; xuất thêm PDF vector cho bản build `pdflatex`. Nếu file gốc là Office và các shape còn chỉnh sửa được, giữ file đó để nộp kèm khi cần; ISSE cũng chấp nhận file Office.
3. Nếu file thiết kế chỉ xuất bitmap, render **trực tiếp từ file thiết kế** ở mức tối thiểu **3780 x 2520 px**, giữ tỷ lệ 3:2 và chiều rộng in 160 mm. Dùng RGB và kiểm tra từng nhãn nhỏ ở kích thước in thực tế.
4. **Không** chỉ kéo ảnh PNG 1536 x 1024 lên 3780 x 2520 hoặc sửa thông số DPI trong metadata: thao tác đó không khôi phục độ nét của icon, nét vẽ hay chữ. Nếu chỉ còn PNG này, cần dựng lại **trung thành với hình gốc** thành nguồn chỉnh sửa được, rồi nhờ người tạo hình duyệt.
5. Chỉ sau khi nhóm duyệt file vector/bitmap thật sự đạt chuẩn mới đổi `\includegraphics` trong `trace-paper.tex`, build và xem Figure 1 ở kích thước in. Dùng `pdfimages -list trace-paper.pdf` để kiểm tra DPI hiệu dụng của bitmap; với vector, kiểm tra font nhúng và không có ảnh raster chất lượng thấp. Giữ `Fig1.png` làm bản gốc đối chiếu.

Thu ảnh hiện tại xuống khoảng 65 mm sẽ cho con số 600 dpi về mặt toán học, nhưng chữ trong hình sẽ quá nhỏ đối với sơ đồ ngang toàn trang, nên đó không phải cách sửa thực tế.
