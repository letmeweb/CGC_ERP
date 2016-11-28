/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package com.cgc.bean;

import java.sql.Timestamp;

/**
 *
 * @author com02
 */
public class UserBean {
    private int runno;
    private String username;
    private String password;
    private String emp_id;
    private String priviledge_id;
    private String remark;
    private Timestamp create_date;
    private String create_by;
    private Timestamp update_date;
    private String update_by;
    private String delete_flag;
    private String use_status;
    private Timestamp delete_date;
    private String delete_by;
    private String company_id;
    private String menu_type;
    private String dept_id;
    private String message_disp;
    private String select_database;
    private String fullname;
    private String print_count;
    private String dept_doc_id;    
    /**
     * @return the username
     */
    public String getUsername() {
        return username;
    }

    /**
     * @param username the username to set
     */
    public void setUsername(String username) {
        this.username = username;
    }

    /**
     * @return the password
     */
    public String getPassword() {
        return password;
    }

    /**
     * @param password the password to set
     */
    public void setPassword(String password) {
        this.password = password;
    }

    /**
     * @return the emp_id
     */
    public String getEmp_id() {
        return emp_id;
    }

    /**
     * @param emp_id the emp_id to set
     */
    public void setEmp_id(String emp_id) {
        this.emp_id = emp_id;
    }

    /**
     * @return the priviledge_id
     */
    public String getPriviledge_id() {
        return priviledge_id;
    }

    /**
     * @param priviledge_id the priviledge_id to set
     */
    public void setPriviledge_id(String priviledge_id) {
        this.priviledge_id = priviledge_id;
    }

    /**
     * @return the remark
     */
    public String getRemark() {
        return remark;
    }

    /**
     * @param remark the remark to set
     */
    public void setRemark(String remark) {
        this.remark = remark;
    }

    /**
     * @return the create_date
     */
    public Timestamp getCreate_date() {
        return create_date;
    }

    /**
     * @param create_date the create_date to set
     */
    public void setCreate_date(Timestamp create_date) {
        this.create_date = create_date;
    }

    /**
     * @return the create_by
     */
    public String getCreate_by() {
        return create_by;
    }

    /**
     * @param create_by the create_by to set
     */
    public void setCreate_by(String create_by) {
        this.create_by = create_by;
    }

    /**
     * @return the update_date
     */
    public Timestamp getUpdate_date() {
        return update_date;
    }

    /**
     * @param update_date the update_date to set
     */
    public void setUpdate_date(Timestamp update_date) {
        this.update_date = update_date;
    }

    /**
     * @return the update_by
     */
    public String getUpdate_by() {
        return update_by;
    }

    /**
     * @param update_by the update_by to set
     */
    public void setUpdate_by(String update_by) {
        this.update_by = update_by;
    }

    /**
     * @return the delete_flag
     */
    public String getDelete_flag() {
        return delete_flag;
    }

    /**
     * @param delete_flag the delete_flag to set
     */
    public void setDelete_flag(String delete_flag) {
        this.delete_flag = delete_flag;
    }

    /**
     * @return the use_status
     */
    public String getUse_status() {
        return use_status;
    }

    /**
     * @param use_status the use_status to set
     */
    public void setUse_status(String use_status) {
        this.use_status = use_status;
    }

    /**
     * @return the delete_date
     */
    public Timestamp getDelete_date() {
        return delete_date;
    }

    /**
     * @param delete_date the delete_date to set
     */
    public void setDelete_date(Timestamp delete_date) {
        this.delete_date = delete_date;
    }

    /**
     * @return the delete_by
     */
    public String getDelete_by() {
        return delete_by;
    }

    /**
     * @param delete_by the delete_by to set
     */
    public void setDelete_by(String delete_by) {
        this.delete_by = delete_by;
    }

    /**
     * @return the company_id
     */
    public String getCompany_id() {
        return company_id;
    }

    /**
     * @param company_id the company_id to set
     */
    public void setCompany_id(String company_id) {
        this.company_id = company_id;
    }

    /**
     * @return the menu_type
     */
    public String getMenu_type() {
        return menu_type;
    }

    /**
     * @param menu_type the menu_type to set
     */
    public void setMenu_type(String menu_type) {
        this.menu_type = menu_type;
    }

    /**
     * @return the runno
     */
    public int getRunno() {
        return runno;
    }

    /**
     * @param runno the runno to set
     */
    public void setRunno(int runno) {
        this.runno = runno;
    }

    /**
     * @return the dept_id
     */
    public String getDept_id() {
        return dept_id;
    }

    /**
     * @param dept_id the dept_id to set
     */
    public void setDept_id(String dept_id) {
        this.dept_id = dept_id;
    }

    /**
     * @return the message_disp
     */
    public String getMessage_disp() {
        return message_disp;
    }

    /**
     * @param message_disp the message_disp to set
     */
    public void setMessage_disp(String message_disp) {
        this.message_disp = message_disp;
    }

    /**
     * @return the select_database
     */
    public String getSelect_database() {
        return select_database;
    }

    /**
     * @param select_database the select_database to set
     */
    public void setSelect_database(String select_database) {
        this.select_database = select_database;
    }

    /**
     * @return the fullname
     */
    public String getFullname() {
        return fullname;
    }

    /**
     * @param fullname the fullname to set
     */
    public void setFullname(String fullname) {
        this.fullname = fullname;
    }

    /**
     * @return the print_count
     */
    public String getPrint_count() {
        return print_count;
    }

    /**
     * @param print_count the print_count to set
     */
    public void setPrint_count(String print_count) {
        this.print_count = print_count;
    }

    /**
     * @return the dept_doc_id
     */
    public String getDept_doc_id() {
        return dept_doc_id;
    }

    /**
     * @param dept_doc_id the dept_doc_id to set
     */
    public void setDept_doc_id(String dept_doc_id) {
        this.dept_doc_id = dept_doc_id;
    }

}
