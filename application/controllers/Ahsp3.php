<?php
defined('BASEPATH') or exit('No direct script access allowed');

class Ahsp3 extends CI_Controller
{

    public function __construct()
    {
        parent::__construct();
        if (!$this->session->userdata('nip')) {
            $this->session->set_flashdata('massage', '<div class="alert alert-danger" role="alert">Harus Login Terlebih Dahulu!</div>');
            if ($this->uri->segment(2)) {
                $this->session->set_userdata('re', $this->uri->segment(1) . '/' . $this->uri->segment(2));
            } else {
                $this->session->set_userdata('re', $this->uri->segment(1));
            }
            redirect('auth');
        } else {
            $this->session->unset_userdata('re');
            $data['user_role'] = $this->Ahsp_model->getTablewhere('user', 'nip', $this->session->userdata('nip'))->row_array();
            $data['role'] = $this->Ahsp_model->getTablewhere('user_role', 'id', $data['user_role']['role_id'])->row_array();
            if ($data['role']['role'] == 'Operator') {
                redirect('blocked');
            } elseif ($data['role']['role'] == 'User') {
                redirect('blocked');
            }
        }
    }

    public function index()
    {
        $kode = $this->session->userdata('kode2');
        if ($kode) {
            $data['ahsp'] = $this->Ahsp_model->getTablewhere('ahsp_level_3', 'kode_lvl_2', $kode)->result_array();
            $this->session->unset_userdata('kode2');
        } else {
            $data['ahsp'] = $this->Ahsp_model->getTable('ahsp_level_3', 'kode_lvl_3')->result_array();
        }
        $data['judul'] = 'Ahsp3';
        $data['user'] = $this->Ahsp_model->getTablewhere('biodata', 'nip', $this->session->userdata('nip'))->row_array();
        $this->load->view('templates/header', $data);
        $this->load->view('ahsp_lv3/index', $data);
        $this->load->view('templates/footer', $data);
    }

    public function tambah()
    {
        if ($this->Ahsp_model->getTable('ahsp_level_2', 'kode_lvl_2')->num_rows() < 1) {
            $this->session->set_flashdata('msg', 'Harus isi Level 2 Terlebih Dahulu!');
            redirect('ahsp2/tambah');
        } else {
            $data['ahsp'] = $this->Ahsp_model->getTable('ahsp_level_2', 'kode_lvl_2')->result_array();
            $this->form_validation->set_rules('kode2', 'Kode', 'required|trim', ['required' => '{field} harus diisi']);
            $this->form_validation->set_rules('kode3', 'Kode', 'required|trim|is_unique[ahsp_level_3.kode_lvl_3]', [
                'is_unique' => '{field} sudah ada',
                'required' => '{field} harus diisi'
            ]);
            $this->form_validation->set_rules('uraian', 'Uraian', 'required|trim|is_unique[ahsp_level_3.uraian]', [
                'is_unique' => '{field} sudah ada',
                'required' => '{field} harus diisi'
            ]);
            $data['judul'] = 'Insert AHSP Level 3';
            $data['user'] = $this->Ahsp_model->getTablewhere('biodata', 'nip', $this->session->userdata('nip'))->row_array();
            if ($this->form_validation->run() == false) {
                if ($this->form_validation->run() == false && $this->input->post('kode2') . '.' == $this->input->post('kode3')) {
                    $this->session->set_userdata('err', '<small class="form-text text-danger">Silakan tambahkan kode belakang</small>');
                    $this->load->view('templates/header', $data);
                    $this->load->view('ahsp_lv3/tambah', $data);
                    $this->load->view('templates/footer', $data);
                } else {
                    $this->load->view('templates/header', $data);
                    $this->load->view('ahsp_lv3/tambah', $data);
                    $this->load->view('templates/footer', $data);
                }
            } elseif ($this->input->post('kode2') . '.' == $this->input->post('kode3')) {
                $this->session->set_userdata('err', '<small class="form-text text-danger">Silakan tambahkan kode belakang</small>');
                $this->load->view('templates/header', $data);
                $this->load->view('ahsp_lv3/tambah', $data);
                $this->load->view('templates/footer', $data);
            } else {
                $this->Ahsp_model->tambah('ahsp_level_3');
                $this->session->set_flashdata('flash', 'Ditambahkan');
                redirect('ahsp3');
            }
        }
    }

    public function hapus($id = null)
    {
        $data['cekid'] = $this->Ahsp_model->getTablewhere('ahsp_level_3', 'id', $id)->num_rows();
        if ($id == null || $data['cekid'] < 1) {
            redirect('ahsp3');
        } else {
            $lv3 = $this->Ahsp_model->getTablewhere('ahsp_level_3', 'id', $id)->row_array();
            $lv4 = $this->Ahsp_model->getTablewhere('ahsp_level_4', 'kode_lvl_3', $lv3['kode_lvl_3']);

            if ($lv4->num_rows() > 0) {
                $this->session->set_flashdata('row', $lv4->num_rows);
                $this->session->set_userdata('kode3', $lv3['kode_lvl_3']);
                redirect('ahsp4');
            } else {
                $this->Ahsp_model->hapus('ahsp_level_3', 'id', $id);
                $this->session->set_flashdata('flash', 'Dihapus');
                redirect($_SERVER['HTTP_REFERER']);
            }
        }
    }

    public function edit($id = null)
    {
        $data['cekid'] = $this->Ahsp_model->getTablewhere('ahsp_level_3', 'id', $id)->num_rows();
        if ($id == null || $data['cekid'] < 1) {
            redirect('ahsp3');
        } else {
            $data['ahsp'] = $this->Ahsp_model->getTablewhere('ahsp_level_3', 'id', $id)->row_array();
            $data['lvl2'] = $this->Ahsp_model->getTable('ahsp_level_2', 'kode_lvl_2')->result_array();

            $this->form_validation->set_rules('kode2', 'Kode', 'required|trim', ['required' => '{field} harus diisi']);
            $this->form_validation->set_rules('kode3', 'Kode', 'required|trim', [
                'required' => '{field} harus diisi'
            ]);
            $this->form_validation->set_rules('uraian', 'Uraian', 'required|trim', [
                'required' => '{field} harus diisi'
            ]);
            $data['judul'] = 'Edit Data Ahsp3';
            $data['user'] = $this->Ahsp_model->getTablewhere('biodata', 'nip', $this->session->userdata('nip'))->row_array();
            if ($this->form_validation->run() == false) {
                if ($this->form_validation->run() == false && $this->input->post('kode2') . '.' == $this->input->post('kode3')) {
                    $this->session->set_userdata('err', '<small class="form-text text-danger">Silakan tambahkan kode belakang</small>');
                    $this->load->view('templates/header', $data);
                    $this->load->view('ahsp_lv3/edit', $data);
                    $this->load->view('templates/footer', $data);
                } else {
                    $this->load->view('templates/header', $data);
                    $this->load->view('ahsp_lv3/edit', $data);
                    $this->load->view('templates/footer', $data);
                }
            } elseif ($this->input->post('kode2') . '.' == $this->input->post('kode3')) {
                $this->session->set_userdata('err', '<small class="form-text text-danger">Silakan tambahkan kode belakang</small>');
                $this->load->view('templates/header', $data);
                $this->load->view('ahsp_lv3/edit', $data);
                $this->load->view('templates/footer', $data);
            } else {
                $this->Ahsp_model->edit('ahsp_level_3');
                $this->session->set_flashdata('flash', 'Diubah');
                redirect('ahsp3');
            }
        }
    }
}
