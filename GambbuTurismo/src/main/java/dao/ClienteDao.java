package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import db.MySqlConnection;
import model.Cliente;

public class ClienteDao implements CRUD {

	private static Connection connection = MySqlConnection.createConnection();
	private static String sql;
	
	public static void create(Cliente cliente) {
		sql = "INSERT INTO clientes VALUES (null, ?, ?, ?, ?, ?, ?, ?)";
		
		try { 
			PreparedStatement preparedStatement = connection.prepareStatement(sql);
			
			preparedStatement.setString(1, cliente.getNome());
			preparedStatement.setString(2, cliente.getCpf());
			preparedStatement.setString(3, cliente.getNascimento());
			preparedStatement.setString(4, cliente.getEndereco());
			preparedStatement.setString(5, cliente.getTelefone());
			preparedStatement.setString(6, cliente.getEmail());
			preparedStatement.setString(7, cliente.getSenha());
			
			preparedStatement.executeUpdate();
			
			System.out.println("--correct insert on database");
			
		} catch(SQLException e) {
			System.out.println("--incorrect insert on database. " + e.getMessage());
	}
	}
	public static void delete(int clienteId) {
		sql = "DELETE FROM clientes WHERE id = ?";
		try {
			PreparedStatement preparedStatement = connection.prepareStatement(sql);
			preparedStatement.setInt(1, clienteId);
			preparedStatement.executeUpdate();
			
			System.out.println("--correct delete on cliente.");
			
		}
		catch (SQLException e) {
			System.out.println("--incorrect delete on cliente. " + e.getMessage());
			
		}
	}
	
	public static List<Cliente> find(String pesquisa){
		
		sql = String.format("SELECT * FROM clientes WHERE nome like '%s%%' OR cpf LIKE '%s%%'", pesquisa, pesquisa);
		List<Cliente> clientes = new ArrayList<Cliente>();
		
		try {
			Statement statement = connection.createStatement();
			ResultSet resultSet = statement.executeQuery(sql);
			
			while (resultSet.next()) {
				Cliente cliente =  new Cliente();
				cliente.setId(resultSet.getInt("id"));
				cliente.setNome(resultSet.getString("nome"));
				cliente.setCpf(resultSet.getString("cpf"));
				cliente.setNascimento(resultSet.getString("nascimento"));
				cliente.setEndereco(resultSet.getString("endereco"));
				cliente.setTelefone(resultSet.getString("telefone"));
				cliente.setEmail(resultSet.getString("email"));
				cliente.setSenha(resultSet.getString("senha"));
				
				clientes.add(cliente);
			}
			System.out.println("--correct find clientes");
			return clientes;
		} catch(SQLException e) {
			System.out.println("--incorrect find clientes. " + e.getMessage());
			return null;
		}
			
	}

	public static Cliente findByPk(int clienteId) {
		sql = String.format("SELECT * FROM clientes WHERE id = %d", clienteId);
		
		try {
			Statement statement = connection.createStatement();
			ResultSet resultSet = statement.executeQuery(sql);
			Cliente cliente =  new Cliente();
			
			while (resultSet.next()) {
				
				cliente.setId(resultSet.getInt("id"));
				cliente.setNome(resultSet.getString("nome"));
				cliente.setCpf(resultSet.getString("cpf"));
				cliente.setNascimento(resultSet.getString("nascimento"));
				cliente.setEndereco(resultSet.getString("endereco"));
				cliente.setTelefone(resultSet.getString("telefone"));
				cliente.setEmail(resultSet.getString("email"));
				cliente.setSenha(resultSet.getString("senha"));
				
			
			}
			System.out.println("--correct find by Pk clientes");
			return cliente;
		}
			catch(SQLException e) {
				System.out.println("--incorrect find by Pk clientes" + e.getMessage());
				return null;
			}
	}
	public static void update(Cliente cliente) {
        sql = "UPDATE clientes SET nome=?, cpf=?, nascimento=?, endereco=?, telefone=?, email=?, senha=? WHERE id=?";
		
		try { 
			PreparedStatement preparedStatement = connection.prepareStatement(sql);
			
			preparedStatement.setString(1, cliente.getNome());
			preparedStatement.setString(2, cliente.getCpf());
			preparedStatement.setString(3, cliente.getNascimento());
			preparedStatement.setString(4, cliente.getEndereco());
			preparedStatement.setString(5, cliente.getTelefone());
			preparedStatement.setString(6, cliente.getEmail());
			preparedStatement.setString(7, cliente.getSenha());
			preparedStatement.setInt(8, cliente.getId());
			
			preparedStatement.executeUpdate();
			
			System.out.println("--correct update on databese");
			
		} catch(SQLException e) {
			System.out.println("--incorrect update on databese. " + e.getMessage());
	}
	}
}
