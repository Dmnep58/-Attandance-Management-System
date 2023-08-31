package Functionality;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import DataBaseConnection.DBConnection;

public class AdminDataFetch {

    // fetched the data of the admin ..
    public List<String> FetchData(String uid) {
        List<String> l = new ArrayList<>();

        String query = "select * from admin where admin_id = ?";
        try {
            Connection connection = DBConnection.getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(query);
            preparedStatement.setInt(1, Integer.parseInt(uid));
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                String name = resultSet.getString("name");
                String email = resultSet.getString("admin_email");
                String address = resultSet.getString("admin_address");
                String image = resultSet.getString("admin_image");
                String phone = String.valueOf(resultSet.getLong("phnno"));

                l.add(name);
                l.add(email);
                l.add(address);
                l.add(image);
                l.add(phone);
            }

        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        return l;
    }

    // fetch no of Admins
    public long AdminNumber() {
        String number = "select count(*) from admin";
        long nLong = 0;
        try {
            Connection connection = DBConnection.getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(number);

            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                nLong = resultSet.getLong(1);
            }

        } catch (SQLException e) {
            // TODO: handle exception
        }

        return nLong;
    }

    // update the Password of the admin

    public boolean update(String pass, long id) {
        String query = "UPDATE admin SET admin_password = ? WHERE admin_id = ?;";

        try {
            Connection connection = DBConnection.getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(query);
            preparedStatement.setString(1, pass);
            preparedStatement.setLong(2, id);

            int row = preparedStatement.executeUpdate();

            if (row > 0) {
                return true;
            }
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }

        return false;
    }

    // fetch old password

    public String oldpass(long id) {

        String query = "SELECT admin_password from admin where admin_id=?";
        String passwordString = "";
        try {
            Connection connection = DBConnection.getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(query);
            preparedStatement.setLong(1, id);

            ResultSet resultSet = preparedStatement.executeQuery();

            while (resultSet.next()) {
                passwordString = resultSet.getString(1);
            }

        } catch (SQLException e) {

        }

        return passwordString;

    }

}
