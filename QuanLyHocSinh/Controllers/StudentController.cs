using NHibernate;
using NHibernate.Linq;
using QuanLyHocSinh.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using QuanLyHocSinh.Domain;
using QuanLyHocSinh.IService;
using PagedList;
using log4net;

namespace QuanLyHocSinh.Controllers
{
    public class StudentController : Controller
    {
        private static readonly ILog log = LogManager.GetLogger(typeof(StudentController));

        private IStudentService istudentservice;
        public StudentController(IStudentService service)
        {
            this.istudentservice = service;
        }
        // GET: Student
        public ActionResult Index(string key, int page = 1, int pagesize = 3)
        {
            var model = istudentservice.GetAll();
                ViewBag.Message = "EMPLOYEE";
                List<StudentModel> liststudent = new List<StudentModel>();
                for (int i=0; i< model.Count; i++)
                {
                    var studentmodel = StudentModel.ToModel(model[i]);
                    liststudent.Add(studentmodel);
                }

            if (key == "")
            {
                liststudent = liststudent.OrderByDescending(s => s.ID).ToList();
                return View(liststudent.ToPagedList(page, pagesize));
            }
            else if (key != null)
            {
                var studentdomain = istudentservice.SearchAll(key);
                List<StudentModel> studentmodelsearch = new List<StudentModel>();
                for (int i = 0; i < studentdomain.Count; i++)
                {
                    var studentmodel = StudentModel.ToModel(studentdomain[i]);
                    studentmodelsearch.Add(studentmodel);
                }
                studentmodelsearch.OrderByDescending(s => s.ID).ToList();

                return View(studentmodelsearch.ToPagedList(page, pagesize));
            }

            liststudent = liststudent.OrderByDescending(s => s.ID).ToList();
            return View(liststudent.ToPagedList(page, pagesize));
            
        }


        public ActionResult Edit(int ID)
        {

            var model = istudentservice.Get(ID);
            return View(model);
        }

        [HttpPost]

        public ActionResult Edit(int ID, Student student)
        {
            //message = "";

            try
            {
                var editstudent = istudentservice.Update(ID, student);

                istudentservice.Insert(editstudent);

                return RedirectToAction("Index");
               
            }
            

            catch (Exception ex)
            {
                StudentController.log.Error((object)(" Create -" + (object)ex));
                return View();

            }

        }

        public ActionResult Delete(int ID)
        {
            var model = istudentservice.Get(ID);
            return View(model);

        }
        [HttpPost]

        public ActionResult Delete(int ID, Student student)
        {

            try
            {
                istudentservice.Delete(ID, student);

                return RedirectToAction("Index");

            }

            catch (Exception exception)
            {
                StudentController.log.Error((object)(" Create -" + (object)exception));

                return View();

            }

        }

    }

}