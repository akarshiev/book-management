package com.example.bookmanagement.config;

import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.Properties;

public class DatabaseConfig {
    private static final Properties props = new Properties();

    static {
        try (InputStream input = Thread.currentThread().getContextClassLoader()
                .getResourceAsStream("application.properties")) {

            props.load(input);
            Class.forName("org.postgresql.Driver");

        } catch (Exception e) {
            throw new RuntimeException("Database konfiguratsiyasini yuklashda xatolik yuz berdi!", e);
        }
    }

    public static Connection getConnection() throws SQLException {
        return DriverManager.getConnection(
                props.getProperty("db.url"),
                props.getProperty("db.user"),
                props.getProperty("db.password")
        );
    }
}