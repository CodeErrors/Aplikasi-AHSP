<?php
defined('BASEPATH') or exit('No direct script access allowed');

class Upah extends CI_Controller
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
        $data['judul'] = 'Data Upah';
        $data['user'] = $this->Ahsp_model->getTablewhere('biodata', 'nip', $this->session->userdata('nip'))->row_array();
        $data['upah'] = $this->Ahsp_model->getTable('upah', 'uraian')->result_array();
        $this->load->view('templates/header', $data);
        $this->load->view('upah/index', $data);
        $this->load->view('templates/footer', $data);
    }
    public function tambah()
    {
        $this->form_validation->set_rules('uraian', 'Uraian', 'required|trim|is_unique[upah.uraian]', [
            'is_unique' => '{field} sudah ada',
            'required' => '{field} harus diisi'
        ]);
        $this->form_validation->set_rules('kode', 'Kode', 'required|trim|is_unique[upah.kode]', [
            'is_unique' => '{field} sudah ada',
            'required' => '{field} harus diisi'
        ]);
        $this->form_validation->set_rules('satuan', 'Satuan', 'required|trim', [
            'required' => '{field} harus diisi'
        ]);
        $data['judul'] = 'Tambah Data Upah';
        $data['user'] = $this->Ahsp_model->getTablewhere('biodata', 'nip', $this->session->userdata('nip'))->row_array();
        if ($this->form_validation->run() == false) {
            $this->load->view('templates/header', $data);
            $this->load->view('upah/tambah');
            $this->load->view('templates/footer');
        } else {
            $this->Ahsp_model->tambah('upah');
            $this->session->set_flashdata('flash', 'Ditambahkan');
            redirect('upah');
        }
    }

    public function hapus($id = null)
    {
        $data['cekid'] = $this->Ahsp_model->getTablewhere('upah', 'id', $id)->num_rows();
        if ($id == null || $data['cekid'] < 1) {
            redirect('upah');
        } else {
            $upah = $this->Ahsp_model->getTablewhere('upah', 'id', $id)->row_array();
            $harga = $this->Ahsp_model->getTablewhere('harga', 'id_upah', $upah['id']);
            $ahsp = $this->Ahsp_model->getTablewhere('ahsp', 'id_upah', $upah['id']);

            if ($harga->num_rows() > 0) {
                $this->session->set_flashdata('row', $harga->num_rows);
                $this->session->set_userdata('upah', $upah['id']);
                redirect('harga');
            } elseif ($ahsp->num_rows() > 0) {
                $this->session->set_flashdata('row', $ahsp->num_rows);
                $this->session->set_userdata('upah', $upah['id']);
                redirect('ahsp');
            } else {
                $this->Ahsp_model->hapus('upah', 'id', $id);
                $this->session->set_flashdata('flash', 'Dihapus');
                redirect($_SERVER['HTTP_REFERER']);
            }
        }
    }

    public function edit($id = null)
    {
        $data['cekid'] = $this->Ahsp_model->getTablewhere('upah', 'id', $id)->num_rows();
        if ($id == null || $data['cekid'] < 1) {
            redirect('upah');
        } else {
            $data['upah'] = $this->Ahsp_model->getTablewhere('upah', 'id', $id)->row_array();
            $this->form_validation->set_rules('uraian', 'Uraian', 'required|trim', ['required' => '{field} harus diisi']);
            $this->form_validation->set_rules('kode', 'Kode', 'required|trim', ['required' => '{field} harus diisi']);
            $this->form_validation->set_rules('satuan', 'Satuan', 'required|trim', ['required' => '{field} harus diisi']);
            $data['judul'] = 'Edit Data Upah';
            $data['user'] = $this->Ahsp_model->getTablewhere('biodata', 'nip', $this->session->userdata('nip'))->row_array();
            if ($this->form_validation->run() == false) {
                $this->load->view('templates/header', $data);
                $this->load->view('upah/edit', $data);
                $this->load->view('templates/footer');
            } else {
                $this->Ahsp_model->edit('upah');
                $this->session->set_flashdata('flash', 'Diubah');
                redirect('upah');
            }
        }
    }
}
