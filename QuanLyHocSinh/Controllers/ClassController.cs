using NHibernate;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using QuanLyHocSinh.Models;
using NHibernate.Linq;
using QuanLyHocSinh.Domain;
using QuanLyHocSinh.Service;
using QuanLyHocSinh.IService;
using Castle.Windsor;
using PagedList;
using log4net;

namespace QuanLyHocSinh.Controllers
{
    public class ClassController : Controller
    {
        private static readonly ILog log = LogManager.GetLogger(typeof(StudentController));

        private IClassService iclassservice;

        public ClassController(IClassService service)
        {
            this.iclassservice = service;
        }


        //GET: Class
        public ActionResult Index( string name, int page = 1, int pagesize = 3)
        {
            ViewBag.Message = "CLASS PAGE";

            var model = iclassservice.GetAll();

            List<ClassModel> listclass = new List<ClassModel>();

            for (int i = 0; i < model.Count; i++)
            {
                var classmodel = ClassModel.ToModel(model[i]);
                listclass.Add(classmodel);
            }

            if (name == "")
            {
                listclass = listclass.OrderByDescending(c => c.ID).ToList();

                return View(listclass.ToPagedList(page, pagesize));
            }
            else if(name != null)
            {
                var classdomain  = iclassservice.SearchByName(name);
                List<ClassModel> classmodelsearch = new List<ClassModel>();
                for (int i =0; i< classdomain.Count; i++)
                {
                    var _classmodel = ClassModel.ToModel(classdomain[i]);
                    classmodelsearch.Add(_classmodel);
                }
                classmodelsearch = classmodelsearch.OrderByDescending(c => c.ID).ToList();

                return View(classmodelsearch.ToPagedList(page, pagesize));
            }

            listclass = listclass.OrderByDescending(c => c.ID).ToList();

            return View(listclass.ToPagedList(page, pagesize));

        }
        public ActionResult Create()
        {
            return View();
        }
        [HttpPost]

        public ActionResult Create(Class _class)
        {
            try
            {
                iclassservice.Insert(_class);

                return RedirectToAction("Index");
            }

            catch (Exception ex)
            {
                ClassController.log.Error((object)(" Create -" + (object)ex));              
                return View();
            }
        }


        [HttpGet]
        public ActionResult InsertStudent(int ID)
        {
            var student = iclassservice.AddStudentByClasId(ID);
            return View(student);
        }

        public ActionResult InsertStudent(int ID, Student student)
        {
            try
            {
                student.ClassID = ID;
                iclassservice.InsertStudent(student);

                return RedirectToAction("Index");
            }

            catch (Exception exception)
            {
                ClassController.log.Error((object)(" Create -" + (object)exception));
                return View();

            }
        }


        public ActionResult Edit(int ID)
        {

            var model = iclassservice.Get(ID);
            return View(model);
        }

        [HttpPost]

        public ActionResult Edit(int ID, Class _class)
        {

            try
            {
                var editclass = iclassservice.Update(ID, _class);

                iclassservice.Insert(editclass);

                return RedirectToAction("Index");

            }

            catch (Exception ex)
            {
                ClassController.log.Error((object)(" Create -" + (object)ex));
                return View();

            }
        }

        public ActionResult Delete(int ID)
        {

            var model = iclassservice.Get(ID);
            return View(model);
        }
        [HttpPost]

        public ActionResult Delete(int ID, Class _class)
        {

            try
            {
                iclassservice.Delete(ID, _class);

                return RedirectToAction("Index");

            }

            catch (Exception exception)
            {
                ClassController.log.Error((object)(" Create -" + (object)exception));
                return View();

            }

        }

        public ActionResult ViewStudent(int id)
        {
            var studentdomain =  iclassservice.GetStudentByClassId(id);
            List<StudentModel> liststudent = new List<StudentModel>();

            for (int i = 0; i < studentdomain.Count; i++)
            {
                var studentmodel = StudentModel.ToModel(studentdomain[i]);
                liststudent.Add(studentmodel);
            }
            return View(liststudent);
        }

    }
}