package com.greatlearning.StudentManagement.service;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.greatlearning.StudentManagement.entity.Student;

@Repository
public class StudentServiceImpl implements StudentService {

	private SessionFactory sessionFactory;
	private Session session;

	@Autowired // used to import the class from package

	public StudentServiceImpl(SessionFactory sessionFactory) {
		super();
		this.sessionFactory = sessionFactory;
		this.session = this.sessionFactory.openSession();
	}

	@Transactional
	public List<Student> findAll() {

		Transaction transaction = session.beginTransaction();

		List<Student> students = session.createQuery("from Student", Student.class).list();

		transaction.commit();

		return students;
	}

	@Transactional
	public Student findById(int id) {
		Transaction transaction = session.beginTransaction();

		Student student = session.get(Student.class, id);

		transaction.commit();
		return student;
	}

	@Transactional
	public void save(Student student) {
		Transaction transaction = session.beginTransaction();
		session.saveOrUpdate(student);
		transaction.commit();
	}

	@Transactional
	public void deleteById(int id) {
		Transaction transaction = session.beginTransaction();
		try {
			Student student = session.get(Student.class, id);
			session.delete(student);
		} catch (Exception e) {
			System.out.println("Error in deleteById for id " + id);
			e.printStackTrace();
			// transaction.rollback();
		} finally {
			transaction.commit();
		}
	}
}