using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using QuanLyHocSinh.IService;
using QuanLyHocSinh.Domain;
using NHibernate.Linq;
using NHibernate;
using QuanLyHocSinh.Models;
using FX.Data;
using System.Linq.Expressions;
using PagedList;

namespace QuanLyHocSinh.Service
{
    public class ClassService : IClassService
    {
        ISession session = NHIbernateSession.OpenSession();
        
        public Student AddStudentByClasId(int id)
        {
            string develop = "develop";
            Student student = new Student();
            return student;
        }

        public void Delete(int id, Class deleteclass)
        {
            ITransaction transaction = session.BeginTransaction();
            session.Delete(deleteclass);
            transaction.Commit();
        }

        public Class Get(int id)
        {
            var getclass = session.Get<Class>(id);
            return getclass;
        }

        public List<Class> GetAll()
        {
            var classdomain = session.Query<Class>().ToList();

            return classdomain;
        }

        public List<Class> SearchByName(string name)
        {
            var _class = session.Query<Class>().Where<Class>(c => c.Name.ToUpper() == name.ToUpper()).ToList();
            return _class;      
        }

        public void Insert(Class insertclass)
        {
            ITransaction transaction = session.BeginTransaction();
            session.Save(insertclass);
            transaction.Commit();
        }

        public void InsertStudent(Student student)
        {
            ITransaction transaction = session.BeginTransaction();
            session.Save(student);
            transaction.Commit();
        }

        public Class Update(int id, Class _class)
        {
            var classupdate = session.Get<Class>(id);
            classupdate.Name = _class.Name;
            return classupdate;
        }

        public List<Student> GetStudentByClassId(int id)
        {
            var student = session.Query<Student>().Where<Student>(c => c.ClassID == id).ToList();
            return student;
        }

        public IEnumerable<Class> GetPagedList(int page, int pagesize)
        {
            var classdomain = session.Query<Class>();

            return classdomain.OrderByDescending(c => c.ID).ToPagedList(page, pagesize);
        }
    }
}