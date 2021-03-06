<?php
class ControllerModuleSeoManager extends Controller {
    private $error = array();

    public function index() {
        $this->language->load('module/seo_manager');

        $this->document->setTitle($this->language->get('heading_title'));

        $this->load->model('module/seo_manager');

        if (isset($this->request->get['sort'])) {
            $sort = $this->request->get['sort'];
        } else {
            $sort = 'ua.query';
        }

        if (isset($this->request->get['order'])) {
            $order = $this->request->get['order'];
        } else {
            $order = 'ASC';
        }

        if (isset($this->request->get['page'])) {
            $page = $this->request->get['page'];
        } else {
            $page = 1;
        }

        $url = '';

        if (isset($this->request->get['sort'])) {
            $url .= '&sort=' . $this->request->get['sort'];
        }

        if (isset($this->request->get['order'])) {
            $url .= '&order=' . $this->request->get['order'];
        }

        if (isset($this->request->get['page'])) {
            $url .= '&page=' . $this->request->get['page'];
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

        $data['breadcrumbs'][] = array(
            'text' => $this->language->get('heading_title'),
            'href' => $this->url->link('module/seo_manager', 'token=' . $this->session->data['token'] . $url, 'SSL')
        );
       
        $data['delete'] = $this->url->link('module/seo_manager/delete', 'token=' . $this->session->data['token'] . $url, 'SSL');
        
        $data['save'] = $this->url->link('module/seo_manager/update', 'token=' . $this->session->data['token'] . $url, 'SSL');
        
        $data['clear'] = $this->url->link('module/seo_manager/clear', 'token=' . $this->session->data['token'] . $url, 'SSL');
        
        $data['cancel'] = $this->url->link('extension/module', 'token=' . $this->session->data['token'], 'SSL');

        $data['url_aliases'] = array();

        $filter_data = array(
            'sort'  => $sort,
            'order' => $order,
            'start' => ($page - 1) * $this->config->get('config_limit_admin'),
            'limit' => $this->config->get('config_limit_admin')
        );

        $url_alias_total = $this->model_module_seo_manager->getTotalUrlAalias();

        $results = $this->model_module_seo_manager->getUrlAaliases($filter_data);

        foreach ($results as $result) {
            $data['url_aliases'][] = array(
                'url_alias_id' => $result['url_alias_id'], 
                'query' => $result['query'],
                'keyword' => $result['keyword'],
                'selected' => isset($this->request->post['selected']) && in_array($result['url_alias_id'], $this->request->post['selected']), 
                'action_text' => $this->language->get('text_edit')
            );
         }

        $data['heading_title'] = $this->language->get('heading_title');

        $data['text_no_results'] = $this->language->get('text_no_results');
        $data['text_confirm'] = $this->language->get('text_confirm');

        $data['column_query'] = $this->language->get('column_query');
        $data['column_keyword'] = $this->language->get('column_keyword');
        $data['column_action'] = $this->language->get('column_action');

        $data['button_add'] = $this->language->get('button_add');
        $data['button_delete'] = $this->language->get('button_delete');
        $data['button_edit'] = $this->language->get('button_edit');
        $data['button_save'] = $this->language->get('button_save');
        $data['button_cancel'] = $this->language->get('button_cancel');
        $data['button_clear_cache'] = $this->language->get('button_clear_cache');

        if (isset($this->error['warning'])) {
            $data['error_warning'] = $this->error['warning'];
        } else {
            $data['error_warning'] = '';
        }

        if (isset($this->session->data['success'])) {
            $data['success'] = $this->session->data['success'];

            unset($this->session->data['success']);
        } else {
            $data['success'] = '';
        }

        if (isset($this->request->post['selected'])) {
            $data['selected'] = (array)$this->request->post['selected'];
        } else {
            $data['selected'] = array();
        }

        $url = '';

        if ($order == 'ASC') {
            $url .= '&order=DESC';
        } else {
            $url .= '&order=ASC';
        }

        if (isset($this->request->get['page'])) {
            $url .= '&page=' . $this->request->get['page'];
        }

        $data['sort_query'] = $this->url->link('module/seo_manager', 'token=' . $this->session->data['token'] . '&sort=ua.query' . $url, 'SSL');
        $data['sort_keyword'] = $this->url->link('module/seo_manager', 'token=' . $this->session->data['token'] . '&sort=ua.keyword' . $url, 'SSL');

        $url = '';

        if (isset($this->request->get['sort'])) {
            $url .= '&sort=' . $this->request->get['sort'];
        }

        if (isset($this->request->get['order'])) {
            $url .= '&order=' . $this->request->get['order'];
        }

        $pagination = new Pagination();
        $pagination->total = $url_alias_total;
        $pagination->page = $page;
        $pagination->limit = $this->config->get('config_limit_admin');
        $pagination->url = $this->url->link('module/seo_manager', 'token=' . $this->session->data['token'] . $url . '&page={page}', 'SSL');

        $data['pagination'] = $pagination->render();

        $data['results'] = sprintf($this->language->get('text_pagination'), ($url_alias_total) ? (($page - 1) * $this->config->get('config_limit_admin')) + 1 : 0, ((($page - 1) * $this->config->get('config_limit_admin')) > ($url_alias_total - $this->config->get('config_limit_admin'))) ? $url_alias_total : ((($page - 1) * $this->config->get('config_limit_admin')) + $this->config->get('config_limit_admin')), $url_alias_total, ceil($url_alias_total / $this->config->get('config_limit_admin')));

        $data['sort'] = $sort;
        $data['order'] = $order;

        $data['header'] = $this->load->controller('common/header');
        $data['column_left'] = $this->load->controller('common/column_left');
        $data['footer'] = $this->load->controller('common/footer');

        $this->response->setOutput($this->load->view('module/seo_manager.tpl', $data));
    }

        public function update() {
                $this->load->language('module/seo_manager');
                $this->document->setTitle($this->language->get('heading_title'));
                $this->load->model('module/seo_manager');

                $url = '';

                if (isset($this->request->get['sort'])) {
                        $url .= '&sort=' . $this->request->get['sort'];
                }

                if (isset($this->request->get['order'])) {
                        $url .= '&order=' . $this->request->get['order'];
                }

                if (isset($this->request->get['page'])) {
                        $url .= '&page=' . $this->request->get['page'];
                }

                if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validate()) {
                        $this->model_module_seo_manager->updateUrlAlias($this->request->post);
                        $this->session->data['success'] = $this->language->get('text_success');
                }

                $this->response->redirect($this->url->link('module/seo_manager', 'token=' . $this->session->data['token'] . $url, 'SSL'));
        }
        
        public function clear() {
            $this->load->language('module/seo_manager');
                $url = '';

                if (isset($this->request->get['sort'])) {
                        $url .= '&sort=' . $this->request->get['sort'];
                }

                if (isset($this->request->get['order'])) {
                        $url .= '&order=' . $this->request->get['order'];
                }

                if (isset($this->request->get['page'])) {
                        $url .= '&page=' . $this->request->get['page'];
                }
                $this->cache->delete('seo_pro');
                $this->cache->delete('seo_url');

                $this->session->data['success'] = $this->language->get('text_success_clear');
                $this->response->redirect($this->url->link('module/seo_manager', 'token=' . $this->session->data['token'] . $url, 'SSL'));
        }

    public function delete() {
                $this->load->language('module/seo_manager');
                $this->load->model('module/seo_manager');
                $url = '';

                if (isset($this->request->get['sort'])) {
                        $url .= '&sort=' . $this->request->get['sort'];
                }

                if (isset($this->request->get['order'])) {
                        $url .= '&order=' . $this->request->get['order'];
                }

                if (isset($this->request->get['page'])) {
                        $url .= '&page=' . $this->request->get['page'];
                }

                if (isset($this->request->post['selected']) && $this->validate()) {
                        foreach ($this->request->post['selected'] as $url_alias_id) {
                                $this->model_module_seo_manager->deleteUrlAlias($url_alias_id);
                        }
                        $this->session->data['success'] = $this->language->get('text_success');
                }

        $this->response->redirect($this->url->link('module/seo_manager', 'token=' . $this->session->data['token'] . $url, 'SSL'));
    }

    protected function validate() {
        if (!$this->user->hasPermission('modify', 'module/seo_manager')) {
            $this->error['warning'] = $this->language->get('error_permission');
        }

        return !$this->error;
    }

    public function install() {
        $this->load->model('module/seo_manager');
        $this->model_module_seo_manager->install();       
    }
    
    public function uninstall() {
        $this->load->model('module/seo_manager');
        $this->model_module_seo_manager->uninstall();       
    }
}