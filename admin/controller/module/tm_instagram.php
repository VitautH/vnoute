<?php
class ControllerModuleTmInstagram extends Controller {
	private $error = array();

	public function index() {
		$this->load->language('module/tm_instagram');

		$this->document->setTitle($this->language->get('heading_title'));

		$this->load->model('extension/module');

		if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validate()) {
			if (!isset($this->request->get['module_id'])) {
				$this->model_extension_module->addModule('tm_instagram', $this->request->post);
			} else {
				$this->model_extension_module->editModule($this->request->get['module_id'], $this->request->post);
			}

			$this->cache->delete('product');

			$this->session->data['success'] = $this->language->get('text_success');

			$this->response->redirect($this->url->link('extension/module', 'token=' . $this->session->data['token'], 'SSL'));
		}

		$data['heading_title']     = $this->language->get('heading_title');
		
		$data['text_edit']         = $this->language->get('text_edit');
		$data['text_enabled']      = $this->language->get('text_enabled');
		$data['text_disabled']     = $this->language->get('text_disabled');
		$data['text_user']         = $this->language->get('text_user');
		$data['text_tagged']       = $this->language->get('text_tagged');
		
		$data['entry_get']         = $this->language->get('entry_get');
		$data['entry_tag_name']    = $this->language->get('entry_tag_name');
		$data['error_tag_name']    = $this->language->get('error_tag_name');
		$data['entry_accesstoken'] = $this->language->get('entry_accesstoken');
		$data['entry_limit']       = $this->language->get('entry_limit');
		$data['entry_name']        = $this->language->get('entry_name');
		$data['entry_status']      = $this->language->get('entry_status');
		$data['entry_user_id']     = $this->language->get('entry_user_id');
		
		$data['button_save']       = $this->language->get('button_save');
		$data['button_cancel']     = $this->language->get('button_cancel');
		$data['button_remove']     = $this->language->get('button_remove');

		if (isset($this->error['warning'])) {
			$data['error_warning'] = $this->error['warning'];
		} else {
			$data['error_warning'] = '';
		}
		
		if (isset($this->error['name'])) {
			$data['error_name'] = $this->error['name'];
		} else {
			$data['error_name'] = '';
		}

		if (isset($this->error['limit'])) {
			$data['error_limit'] = $this->error['limit'];
		} else {
			$data['error_limit'] = '';
		}

		if (isset($this->error['tag'])) {
			$data['error_tag'] = $this->error['tag'];
		} else {
			$data['error_tag'] = '';
		}

		$data['breadcrumbs'] = array();

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_home'),
			'href' => $this->url->link('common/dashboard', 'token=' . $this->session->data['token'], 'SSL')
		);

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_module'),
			'href' => $this->url->link('extension/module', 'token=' . $this->session->data['token'], 'SSL')
		);

		if (!isset($this->request->get['module_id'])) {
			$data['breadcrumbs'][] = array(
				'text' => $this->language->get('heading_title'),
				'href' => $this->url->link('module/tm_instagram', 'token=' . $this->session->data['token'], 'SSL')
			);
		} else {
			$data['breadcrumbs'][] = array(
				'text' => $this->language->get('heading_title'),
				'href' => $this->url->link('module/tm_instagram', 'token=' . $this->session->data['token'] . '&module_id=' . $this->request->get['module_id'], 'SSL')
			);			
		}

		if (!isset($this->request->get['module_id'])) {
			$data['action'] = $this->url->link('module/tm_instagram', 'token=' . $this->session->data['token'], 'SSL');
		} else {
			$data['action'] = $this->url->link('module/tm_instagram', 'token=' . $this->session->data['token'] . '&module_id=' . $this->request->get['module_id'], 'SSL');
		}
		
		$data['cancel'] = $this->url->link('extension/module', 'token=' . $this->session->data['token'], 'SSL');
		
		if (isset($this->request->get['module_id']) && ($this->request->server['REQUEST_METHOD'] != 'POST')) {
			$module_info = $this->model_extension_module->getModule($this->request->get['module_id']);
		}

		if (isset($this->request->post['name'])) {
			$data['name'] = $this->request->post['name'];
		} elseif (!empty($module_info)) {
			$data['name'] = $module_info['name'];
		} else {
			$data['name'] = '';
		}
		if (isset($this->request->post['tag_name'])) {
			$data['tag_name'] = $this->request->post['tag_name'];
		} elseif (!empty($module_info)) {
			$data['tag_name'] = $module_info['tag_name'];
		} else {
			$data['tag_name'] = '';
		}

		if (isset($this->request->post['user_id'])) {
			$data['user_id'] = $this->request->post['user_id'];
		} elseif (!empty($module_info)) {
			$data['user_id'] = $module_info['user_id'];
		} else {
			$data['user_id'] = ' ';
		}
		if (isset($this->request->post['accesstoken'])) {
			$data['accesstoken'] = $this->request->post['accesstoken'];
		} elseif (!empty($module_info)) {
			$data['accesstoken'] = $module_info['accesstoken'];
		} else {
			$data['accesstoken'] = ' ';
		}
		if (isset($this->request->post['limit'])) {
			$data['limit'] = $this->request->post['limit'];
		} elseif (!empty($module_info)) {
			$data['limit'] = $module_info['limit'];
		} else {
			$data['limit'] = '6';
		}
		if (isset($this->request->post['get'])) {
			$data['get'] = $this->request->post['get'];
		} elseif (!empty($module_info)) {
			$data['get'] = $module_info['get'];
		} else {
			$data['get'] = '';
		}
		if (isset($this->request->post['status'])) {
			$data['status'] = $this->request->post['status'];
		} elseif (!empty($module_info)) {
			$data['status'] = $module_info['status'];
		} else {
			$data['status'] = '';
		}

		$data['header']      = $this->load->controller('common/header');
		$data['column_left'] = $this->load->controller('common/column_left');
		$data['footer']      = $this->load->controller('common/footer');

		
		$this->response->setOutput($this->load->view('module/tm_instagram.tpl', $data));
	}

	protected function validate() {
		if (!$this->user->hasPermission('modify', 'module/tm_instagram')) {
			$this->error['warning'] = $this->language->get('error_permission');
		}

		if (!is_numeric($this->request->post['limit'])) {
			$this->error['limit'] = $this->language->get('error_limit');
		}

		if ($this->request->post['get'] == 'tagged' && empty($this->request->post['tag_name'])) {
			$this->error['tag'] = $this->language->get('error_tag');
		}

		return !$this->error;
	}
}