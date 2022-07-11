package com.nlu.service;

import com.nlu.model.Product;
import com.nlu.model.ProductDetails;
import com.nlu.repository.Repository;

import java.sql.*;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import static com.nlu.db.Datasource.*;

public class ProductService implements Repository<Product> {

    @Override
    public List<Product> findAll() {
        List<Product> products = new ArrayList<>();
        String query = "SELECT * FROM products ORDER BY product_id DESC";
        try {
            Connection connection = getConnection();
            Statement statement = connection.createStatement();
            ResultSet rs = statement.executeQuery(query);
            ProductDetailsService productDetailsService = new ProductDetailsService();
            int productId;
            while (rs.next()) {
                productId = rs.getInt(1);
                Product product = new Product(
                        rs.getInt(1),
                        rs.getString(2),
                        rs.getInt(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getInt(6),
                        rs.getInt(7),
                        rs.getInt(8),
                   null);
List<ProductDetails> details = productDetailsService.findByProductId(productId);
                List<Integer> tagsIds = new TagService().findTagIdsByProductId(productId);
                product.setTagIds(tagsIds);
                product.setProductDetails(details);
                products.add(product);
            }

            returnConnection(connection);
            return products;
        } catch (SQLException e) {
            System.out.println(e);
            return products;
        }

    }


    public List<Product> findAll(int currentPage, int recordsPerPage, String category) {
        List<Product> products = new ArrayList<>();
        int offset = currentPage * recordsPerPage - recordsPerPage;
        String sql = "SELECT products.* FROM products  LIMIT ?,?";
        if (!category.equals("all")) {
            sql = "select * from products p join category c on p.category_id = c.category_id" +
                    " where c.name =? LIMIT ?,?";
        }
        try {
            Connection connection = getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(sql);
            if (!category.equals("all")) {
                preparedStatement.setString(1, category);
                preparedStatement.setInt(2, offset);
                preparedStatement.setInt(3, recordsPerPage);
            } else {
                preparedStatement.setInt(1, offset);
                preparedStatement.setInt(2, recordsPerPage);
            }
            ResultSet rs = preparedStatement.executeQuery();

            while (rs.next()) {
                Product product = new Product(
                        rs.getInt(1),
                        rs.getString(2),
                        rs.getInt(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getInt(6),
                        rs.getInt(7),
                        rs.getInt(8), null);
                products.add(product);
            }
            returnConnection(connection);
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return products;
    }

    public int countProductInCategory(String category) {
        int count = 0;
        String query = "SELECT COUNT(p.product_id) FROM products p JOIN category c ON p.category_id = c.category_id WHERE c.name = ?";
        if (category.equals("all")) {
            query = "SELECT COUNT(p.product_id) FROM products p JOIN category c ON p.category_id = c.category_id ";
        }
        try {
            Connection connection = getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(query);
            if (!category.equals("all")) {
                preparedStatement.setString(1, category);
            }
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                count = rs.getInt(1);
            }
            returnConnection(connection);
            return count;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return count;
    }

    @Override
    public Product findById(Integer id) {
        String query = "SELECT * FROM products WHERE product_id = ?";
        Product product = null;
        try {
            Connection connection = getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(query);
            preparedStatement.setInt(1, id);
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                product = new Product(
                        rs.getInt(1),
                        rs.getString(2),
                        rs.getInt(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getInt(6),
                        rs.getInt(7),
                        rs.getInt(8), null);
                product.setTagIds(new TagService().findTagIdsByProductId(rs.getInt(1)));
                product.setProductDetails(new ProductDetailsService().findByProductId(rs.getInt(1)));
            }
            returnConnection(connection);
            return product;
        } catch (SQLException e) {
            System.out.println(e);
            return product;
        }
    }



    public List<Product> findProductsByCategoryName(String categoryName) {
        List<Product> products = new ArrayList<>();
        String query = "SELECT products.* FROM products JOIN category ON products.category_id = category.category_id WHERE category.name = ?";
        try {
            Connection connection = getConnection();
            PreparedStatement statement = connection.prepareStatement(query);
            statement.setString(1, categoryName);
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                Product product = new Product(
                        rs.getInt(1),
                        rs.getString(2),
                        rs.getInt(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getInt(6),
                        rs.getInt(7),
                        rs.getInt(8), null);
                products.add(product);
            }
            returnConnection(connection);
            return products;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return products;
    }

    public List<Product> findProductByCategoryId(int categoryId) {
        List<Product> products = new ArrayList<>();
        Product product = null;
        String query = "select products.* from products join category on products.category_id = category.category_id where category.category_id = ?;";
        try {
            Connection connection = getConnection();
            PreparedStatement statement = connection.prepareStatement(query);
            statement.setInt(1, categoryId);
            ResultSet rs = statement.executeQuery();
            int productId = 1;
            while (rs.next()) {
                productId = rs.getInt(1);
                product = new Product(
                        productId,
                        rs.getString(2),
                        rs.getInt(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getInt(6),
                        rs.getInt(7),
                        rs.getInt(8),
                       null
                );
                ProductDetailsService productDetailsService = new ProductDetailsService();
                List<ProductDetails> productDetails = productDetailsService.findByProductId(productId);
                product.setProductDetails(productDetails);
                products.add(product);
            }
            returnConnection(connection);
            return products;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return products;
    }

    @Override
    public List<Product> findByName() {
        return null;
    }

    public List<Product> searchByName(String nameProduct) {
        List<Product> products = new ArrayList<>();
        Product product = new Product();
        String query = "SELECT * FROM products WHERE name LIKE ?" ;
        try {
            Connection connection = getConnection();
            PreparedStatement statement = connection.prepareStatement(query);
            statement.setString(1, "%"+nameProduct+"%");
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
               products.add( new Product(
                        rs.getInt(1),
                        rs.getString(2),
                        rs.getInt(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getInt(6),
                        rs.getInt(7),
                        rs.getInt(8),
                        null
                ));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return products;

    }

    @Override
    public void deleteById(int id) {
        String query = "DELETE FROM `products` WHERE `products`.`product_id` = ?";
        try {
            Connection conn = getConnection();
            PreparedStatement ps = conn.prepareStatement(query);
            ps.setInt(1, 1);
            int i = ps.executeUpdate();
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
    }

    public int updateStatus(int id, int status) {
        String query = "UPDATE `products` SET `status` = ? WHERE `products`.`product_id` =? ";
        try {
            Connection conn = getConnection();
            PreparedStatement ps = conn.prepareStatement(query);
            ps.setInt(1, status);
            ps.setInt(2, id);
            int i = ps.executeUpdate();
            returnConnection(conn);

            return i;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return 0;
    }

    public void updateProduct(Product product) {
        String query = " UPDATE `products` SET `name`= ?,`status`=?,`description`=?,`img`=?,`category_id`=?,`price`=?,`sales_percent`=? WHERE product_id =?";
        try {
            Connection conn = getConnection();
            PreparedStatement ps = conn.prepareStatement(query);
            ps.setString(1, product.getName());
            ps.setInt(2, product.getStatus());
            ps.setString(3, product.getDescription());
            ps.setString(4, product.getImg());
            ps.setInt(5, product.getCategoryId());
            ps.setInt(6, product.getPrice());
            ps.setInt(7, product.getDiscount());
            ps.setInt(8, product.getProductId());
            ps.executeUpdate();
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
    }

    @Override
    public void add(Product product) {
        String query = "INSERT INTO `products`( `name`, `status`, `description`, `img`, `category_id`, `price`, `sales_percent`) VALUES (?,?,?,?,?,?,?)";
        try {
            Connection conn = getConnection();
            PreparedStatement ps = conn.prepareStatement(query);
            ps.setString(1, product.getName());
            ps.setInt(2, 1);
            ps.setString(3, product.getDescription());
            ps.setString(4, product.getImg());
            ps.setInt(5, product.getCategoryId());
            ps.setInt(6, product.getPrice());
            ps.setDouble(7, product.getDiscount());
            ps.execute();
            System.out.println("Da them moi 1 san pham");
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
    }

    public int getLastedProductId() {
        String query = "SELECT MAX(product_id) FROM `products` GROUP BY product_id";
        Connection conn = getConnection();
        int lastedId = -1;
        try {
            PreparedStatement ps = conn.prepareStatement(query);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                lastedId = rs.getInt(1);
            }
            System.out.println(lastedId);

            returnConnection(conn);
            return lastedId;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return -1;
    }

    public void addTag(int productId, int tagId) {
        String query = "INSERT INTO `product_tag`( `product_id`, `tag_id`) VALUES (?,?)";
        try {
            Connection conn = getConnection();
            PreparedStatement ps = conn.prepareStatement(query);
            ps.setInt(1, productId);
            ps.setInt(2, tagId);
            ps.executeUpdate();
            returnConnection(conn);

        } catch (SQLException e) {
            e.printStackTrace();
        }

    }

    public List<Product> findAllSortByDate(int limit) {
        String query = "SELECT * FROM `products` ORDER BY product_id DESC LIMIT ?";
        List<Product> products = new ArrayList<>();
        try {
            Connection connection = getConnection();
            PreparedStatement statement = connection.prepareStatement(query);
            statement.setInt(1, limit);
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                Product product = new Product(
                        rs.getInt(1),
                        rs.getString(2),
                        rs.getInt(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getInt(6),
                        rs.getInt(7),
                        rs.getInt(8), null);
                products.add(product);
            }
            returnConnection(connection);
            return products;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return products;
    }

    public static void main(String[] args) throws SQLException {
        ProductService productService = new ProductService();
        System.out.println(productService.searchByName("r"));
    }
}
