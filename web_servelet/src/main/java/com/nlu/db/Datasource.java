package com.nlu.db;

import java.sql.Connection;

public class Datasource {

    private static ConnectionPool connectionPool = new ConnectionPool();

    public Datasource() {

    }

    public static Connection getConnection() {
//        System.out.println("Get one connection");
        return connectionPool.getConnectionFromPool();
    }

    public static void returnConnection(Connection conn) {
//        System.out.println("Release connection");
        connectionPool.returnConnectionToPool(conn);
    }

}
