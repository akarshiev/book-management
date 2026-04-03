package com.example.bookmanagement.model;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class Book {
    private int book_id;
    private String title;
    private String author;
    private String link;
    private String isbn;
    private String created_at;

}
