package vn.iostar.thym_springboot3.entity;

import jakarta.persistence.*;
import jakarta.validation.constraints.NotEmpty;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
@Entity
@Table(name="category")
public class Category {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name ="categoryid")
	private Long Id;
	@Column(name = "categoryname",columnDefinition = "nvarchar(50)")
	@NotEmpty(message = "Không được bỏ trống")
	private String name;
	@Column(name="images",columnDefinition = "nvarchar(500)")
	private String images;
	private int status;
}
