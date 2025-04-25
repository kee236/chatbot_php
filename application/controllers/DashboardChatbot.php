<?php defined('BASEPATH') OR exit('No direct script access allowed');

/**
 * คลาส Dashboard Controller
 *
 * คอนโทรลเลอร์นี้ทำหน้าที่จัดการหน้าหลักของแดชบอร์ดสำหรับผู้ใช้งานที่เข้าสู่ระบบ
 * สืบทอดคุณสมบัติและเมธอดจาก CI_Controller ของ CodeIgniter
 */
class Dashboard extends CI_Controller {

    /**
     * @var string $menu_id ไอดีของเมนูที่กำลังใช้งาน (อาจใช้สำหรับระบบนำทางหรือการจัดการสิทธิ์)
     */
    public $menu_id = '';

    /**
     * @var string $group_id ไอดีของกลุ่มผู้ใช้งานที่กำลังเข้าสู่ระบบ (อาจใช้สำหรับการกำหนดสิทธิ์การเข้าถึง)
     */
    public $group_id = '';

    /**
     * คอนสตรัคเตอร์ของคลาส Dashboard
     *
     * ทำงานเมื่อมีการสร้างอ็อบเจ็กต์ของคลาสนี้
     * - เรียกคอนสตรัคเตอร์ของคลาส CI_Controller หลัก
     * - ตรวจสอบว่าผู้ใช้งานได้เข้าสู่ระบบแล้วหรือไม่ หากยังไม่ได้เข้าสู่ระบบ จะถูก Redirect ไปยังหน้า Login
     * - โหลด Dashboard Model เพื่อใช้งานฟังก์ชันที่เกี่ยวข้องกับแดชบอร์ด (แม้ว่าในโค้ดนี้จะยังไม่ได้ใช้งาน)
     */
    public function __construct() {
        parent::__construct();
        $this->auth->isLoginNull(); // ตรวจสอบการ Login (สมมติว่า $this->auth เป็น Library สำหรับจัดการการตรวจสอบสิทธิ์)
        $this->load->model('dashboard_model'); // โหลด Dashboard Model
    }

    /**
     * เมธอด Index
     *
     * เมธอดนี้เป็นเมธอดเริ่มต้นที่จะถูกเรียกเมื่อเข้าถึง URL ของ Dashboard Controller
     * - สร้าง Array $data เพื่อส่งไปยัง View
     * - กำหนดค่า group_id และ menu_id ให้กับ $data
     * - กำหนด CSS ไฟล์ที่จะใช้งานในหน้า View
     * - เรียกใช้งานเมธอด renderView() เพื่อแสดงผล View 'dashboard_view' พร้อมกับข้อมูล $data
     */
    public function index() {
        $data = array(
            'group_id' => $this->group_id,
            'menu_id' => $this->menu_id,
            'css' => array('pages/dashboard3.css'), // กำหนด CSS ไฟล์ที่จะใช้ใน View
        );
        $this->renderView('dashboard_view', $data); // เรียกใช้งาน View 'dashboard_view' พร้อมส่งข้อมูล
    }

    // เมธอด version() (ถูก Comment ไว้)
    // หากต้องการใช้งาน ให้ Uncomment และปรับปรุงโค้ดตามความเหมาะสม
    // public function version() {
    //     $this->load->view('welcome_message');
    // }

    /**
     * เมธอด renderView
     *
     * เมธอดส่วนตัวสำหรับแสดงผล View โดยมีการรวม Layout (ถ้ามี)
     *
     * @param string $view_name ชื่อไฟล์ View ที่ต้องการแสดงผล
     * @param array $data ข้อมูลที่จะส่งไปยัง View (optional)
     * @return void
     */
    private function renderView(string $view_name, array $data = []) {
        // โหลด Layout หลัก (สมมติว่าคุณมี Layout ชื่อ 'main_layout')
        $this->load->view('layouts/main_layout', array(
            'content' => $this->load->view($view_name, $data, TRUE), // โหลด View หลักและส่งข้อมูล
            'data' => $data // ส่งข้อมูลทั้งหมดไปยัง Layout ด้วย (เผื่อใช้งานใน Layout)
        ));
    }

}
