package exercise3_2024_2025_8220039;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;


/**
 * UserDAO provides all the necessary methods related to users.
 * 
 * @author 
 *
 */
public class UserDAO {
		
	/**
	 * This method returns a List with all Users
	 * 
	 * @return List<User>
	 */
	public List<User> getUsers() throws Exception {
		List<User> users = new ArrayList<User>();
		DB db = new DB();
		Connection con = null;
		String query = "SELECT * FROM users_ex3_8220039_2024_2025;";
		try {
			con = db.getConnection();
			PreparedStatement stmt = con.prepareStatement(query);
			ResultSet rs = stmt.executeQuery();
			while (rs.next()) {
				users.add(new User(rs.getString("firstname"), rs.getString("lastname"), rs.getString("email"), rs.getString("username"), rs.getString("password")));
			}
			rs.close();
			stmt.close();
			return users;
		} catch (Exception e) {
			throw new Exception(e.getMessage());
		} finally {
			if (db != null) {
				db.close();
			}
		}
	} //End of getUsers

	/**
	 * Search user by username
	 * 
	 * @param username, String
	 * @return User, the User object or null
	 * @throws Exception
	 */
	public User findUser(String username) throws Exception {
		DB db = new DB();
		Connection con = null;
		String query = "SELECT * FROM users_ex3_8220039_2024_2025 WHERE username=?;";
		try {
			con = db.getConnection();
			PreparedStatement stmt = con.prepareStatement(query);
			stmt.setString(1 , username);
			ResultSet rs = stmt.executeQuery();
			if (!rs.next()) {
				rs.close();
				stmt.close();
				return null;
			}
			User user = new User(rs.getString("firstname"), rs.getString("lastname"), rs.getString("email"), rs.getString("username"), rs.getString("password"));
			rs.close();
			stmt.close();
			return user;
		} catch (Exception e) {
			throw new Exception(e.getMessage());
		} finally {
			if (db != null) {
				db.close();
			}
		}	
	} 

	/**
	 * This method is used to authenticate a user.
	 * 
	 * @param username, String
	 * @param password, String
	 * @return User, the User object
	 * @throws Exception, if the credentials are not valid
	 */
	public User authenticate(String username, String password) throws Exception {
		DB db = new DB();
		Connection con = null;
		String query = "SELECT * FROM users_ex3_8220039_2024_2025 WHERE username=? AND password=?;";
		try {
			con = db.getConnection();
			PreparedStatement stmt = con.prepareStatement(query);
			stmt.setString(1, username);
			stmt.setString(2, password);
			ResultSet rs = stmt.executeQuery();
			if (!rs.next()) {
				rs.close();
				stmt.close();
				throw new Exception("Wrong username or password");
			}
			User user = new User(rs.getString("firstname"), rs.getString("lastname"), rs.getString("email"), rs.getString("username"), rs.getString("password"));
			rs.close();
			stmt.close();
			return user;
		} catch (Exception e) {
			throw new Exception(e.getMessage());
		} finally {
			if (db != null) {
				db.close();
			}
		}
	} 
	
	/**
	 * Register/create new User.
	 * 
	 * @param user, User
	 * @throws Exception, if encounter any error.
	 */
	public void register(User user) throws Exception {
			DB db = new DB();
			Connection con = null;
			String checkQuery = "SELECT * FROM users_ex3_8220039_2024_2025 WHERE username = ? OR email = ?;";
        	String insertQuery = "INSERT INTO users_ex3_8220039_2024_2025 (username, firstname, lastname, email, password) VALUES (?, ?, ?, ?, ?);";
			try {
				con = db.getConnection();
				PreparedStatement checkStmt = con.prepareStatement(checkQuery);
				checkStmt.setString(1, user.getUsername());
				checkStmt.setString(2, user.getEmail());
				ResultSet rs = checkStmt.executeQuery();
				if (rs.next()) {
					rs.close();
					checkStmt.close();
					throw new Exception("Sorry, username or email already registered");
				} 
				rs.close();
				checkStmt.close();
				PreparedStatement insertStmt = con.prepareStatement(insertQuery);
				insertStmt.setString(1, user.getUsername());
				insertStmt.setString(2, user.getFirstname());
				insertStmt.setString(3, user.getLastname());
				insertStmt.setString(4, user.getEmail());
				insertStmt.setString(5, user.getPassword());
				insertStmt.executeUpdate();
				insertStmt.close();
			} catch (Exception e) {
				throw new Exception(e.getMessage());
			} finally {
				if (db != null) {
					db.close();
				}
			}
	}

}

