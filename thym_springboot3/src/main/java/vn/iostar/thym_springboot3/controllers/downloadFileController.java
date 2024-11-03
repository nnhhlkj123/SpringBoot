package vn.iostar.thym_springboot3.controllers;


import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import org.apache.commons.io.IOUtils;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.core.io.Resource;
import org.springframework.core.io.ResourceLoader;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class downloadFileController {

	@Value("${upload.directory}")
	private String uploadDirectory; // Đường dẫn tới thư mục tải lên

	private final ResourceLoader resourceLoader;

	public downloadFileController(ResourceLoader resourceLoader) {
		this.resourceLoader = resourceLoader;
	}

	@GetMapping("/image")
	public ResponseEntity<byte[]> downloadImage(@RequestParam("fname") String fileName) {
		try {
			// Tạo đường dẫn tới tệp hình ảnh
			File file = new File(uploadDirectory + "/" + fileName);
			if (!file.exists()) {
				return ResponseEntity.status(HttpStatus.NOT_FOUND).build(); // Trả về 404 nếu không tìm thấy tệp
			}

			// Đọc tệp và trả về dưới dạng byte array
			byte[] imageBytes = IOUtils.toByteArray(new FileInputStream(file));

			// Trả về hình ảnh với header thích hợp
			return ResponseEntity.ok()
					.header(HttpHeaders.CONTENT_DISPOSITION, "inline; filename=\"" + file.getName() + "\"")
					.header(HttpHeaders.CONTENT_TYPE, "image/jpeg").body(imageBytes);
		} catch (IOException e) {
			return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).build(); // Trả về 500 nếu có lỗi
		}
	}
}
