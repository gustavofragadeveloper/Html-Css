 DROP VIEW cadastramento_areas_vigilancia.visao_exploracao_pecuaria;

                    CREATE OR REPLACE VIEW cadastramento_areas_vigilancia.visao_exploracao_pecuaria
                     AS
                     SELECT row_number() OVER (ORDER BY exp.id_exploracao_pecuaria) AS id_visao_exploracao_pecuaria,
                        -- inicio produtor
                        p.id_produtor,

                        -- inicio joins comuns produtor
                        ucprod.ds_usuario AS ds_usuario_cadastro_produtor,
                        uaprod.ds_usuario AS ds_usuario_alteracao_produtor,
                        p.cd_estado AS cd_estado_produtor,
                        eprod.ds_estado AS ds_estado_produtor,
                        eprod.ds_uf AS ds_uf_produtor,
                        p.cd_empresa AS cd_empresa_produtor,
                        p.cd_empresa_atualizacao AS cd_empresa_atualizacao_produtor,
                        epprod.ds_empresa AS ds_empresa_produtor,
                        epprod.ds_sigla AS ds_sigla_produtor,
                        epaprod.ds_empresa AS ds_empresa_atualizacao_produtor,
                        epaprod.ds_sigla AS ds_sigla_atualizacao_produtor,
                        p.dt_sincronismo AS dt_sincronismo_produtor,
                        p.cd_dispositivos_moveis_licenciados AS cd_dispositivos_moveis_licenciados_produtor,
                        dmlprod.ds_uuid AS ds_uuid_produtor,
                        dmlprod.ds_modelo AS ds_modelo_produtor,
                        dmlprod.ds_marca AS ds_marca_produtor,
                        p.cd_departamento AS cd_departamento_produtor,
                        dprod.ds_departamento AS ds_departamento_produtor,
                        p.cd_cargo AS cd_cargo_produtor,
                        cprod.ds_cargo AS ds_cargo_produtor,
                        p.cd_funcao AS cd_funcao_produtor,
                        fprod.ds_funcao AS ds_funcao_produtor,
                        -- final joins comuns produtor

                        p.ds_produtor,
                            CASE
                                WHEN p.in_tipo_pessoa::text = ''F''::text THEN ''Física''::text
                                WHEN p.in_tipo_pessoa::text = ''J''::text THEN ''Jurídica''::text
                                ELSE NULL::text
                            END AS in_tipo_pessoa_produtor,
                            CASE
                                WHEN p.in_tipo_produtor::text = ''PR''::text THEN ''Proprietário''::text
                                WHEN p.in_tipo_produtor::text = ''AR''::text THEN ''Arrendatário''::text
                                WHEN p.in_tipo_produtor::text = ''ME''::text THEN ''Meeiro''::text
                                WHEN p.in_tipo_produtor::text = ''OU''::text THEN ''Outro''::text
                                ELSE NULL::text
                            END AS in_tipo_produtor,
                        p.ds_cpf_cnpj AS ds_cpf_cnpj_produtor,
                        p.ds_telefone AS ds_telefone_produtor,
                        p.ds_email AS ds_email_produtor,
                        p.in_sexo AS in_sexo_produtor,

                        -- inicio planejamento produtor
                        p.cd_programacao_execucao_quadro_pessoal AS cd_programacao_execucao_quadro_pessoal_produtor, 
                        dotprod.id_dotacao_orcamentaria AS id_dotacao_orcamentaria_produtor,
                        dotprod.dt_ano_exercicio AS dt_ano_exercicio_produtor,
                        dotprod.id_atividade AS id_atividade_produtor,
                        dotprod.ds_atividade AS ds_atividade_produtor,
                        dotprod.nr_valor_destinado AS nr_valor_destinado_produtor,
                        dotprod.id_departamento_responsavel AS id_departamento_responsavel_produtor,
                        dotprod.ds_departamento_responsavel AS ds_departamento_responsavel_produtor,
                        dotprod.id_gerente_finalistico_responsavel AS id_gerente_finalistico_responsavel_produtor,
                        dotprod.ds_gerente_finalistico_responsavel AS ds_gerente_finalistico_responsavel_produtor,
                        dotprod.in_fecha_planejamento AS in_fecha_planejamento_produtor,
                        dotprod.id_usuario_dg_diretorias AS id_usuario_dg_diretorias_produtor,
                        dotprod.id_usuario_dg_diretorias_gerencias AS id_usuario_dg_diretorias_gerencias_produtor,
                        dotprod.id_usuario_dg_diretorias_gerencias_ger_depto AS id_usuario_dg_diretorias_gerencias_ger_depto_produtor,
                        dotprod.cd_estado_dotacao_orcamentaria AS cd_estado_dotacao_orcamentaria_produtor,
                        peprod.dt_inicio_programacao_execucao AS dt_inicio_programacao_execucao_produtor,
                        peprod.dt_final_programacao_execucao AS dt_final_programacao_execucao_produtor,
                        -- final planejamento produtor

                        -- final produtor

                        -- inicio produtor dados producao
                        pdp.id_produtor_dados_producao,

                        -- inicio joins comuns produtor dados de produção
                        ucpdp.ds_usuario AS ds_usuario_cadastro_produtor_dados_producao,
                        uapdp.ds_usuario AS ds_usuario_alteracao_produtor_dados_producao,
                        pdp.cd_estado AS cd_estado_produtor_dados_producao,
                        epdp.ds_estado AS ds_estado_produtor_dados_producao,
                        epdp.ds_uf AS ds_uf_produtor_dados_producao,
                        pdp.cd_empresa AS cd_empresa_produtor_dados_producao,
                        pdp.cd_empresa_atualizacao AS cd_empresa_atualizacao_produtor_dados_producao,
                        eppdp.ds_empresa AS ds_empresa_produtor_dados_producao,
                        eppdp.ds_sigla AS ds_sigla_produtor_dados_producao,
                        epapdp.ds_empresa AS ds_empresa_atualizacao_produtor_dados_producao,
                        epapdp.ds_sigla AS ds_sigla_atualizacao_produtor_dados_producao,
                        pdp.dt_sincronismo AS dt_sincronismo_produtor_dados_producao,
                        pdp.cd_dispositivos_moveis_licenciados AS cd_dispositivos_moveis_licenciados_produtor_dados_producao,
                        dmlpdp.ds_uuid AS ds_uuid_produtor_dados_producao,
                        dmlpdp.ds_modelo AS ds_modelo_produtor_dados_producao,
                        dmlpdp.ds_marca AS ds_marca_produtor_dados_producao,
                        pdp.cd_departamento AS cd_departamento_produtor_dados_producao,
                        dpdp.ds_departamento AS ds_departamento_produtor_dados_producao,
                        pdp.cd_cargo AS cd_cargo_produtor_dados_producao,
                        cpdp.ds_cargo AS ds_cargo_produtor_dados_producao,
                        pdp.cd_funcao AS cd_funcao_produtor_dados_producao,
                        fpdp.ds_funcao AS ds_funcao_produtor_dados_producao,
                        -- final joins comuns produtor dados de produção

                        pdp.ds_rg,
                        pdp.ds_apelido,
                        pdp.ds_endereco AS ds_endereco_produtor_dados_producao,
                        pdp.ds_bairro,
                        pdp.ds_celular,
                        pdp.ds_cep,
                        pdp.ds_inscricao_estadual,
                        pdp.ds_endereco_contato,
                        pdp.cd_municipio_contato,
                        pdp.ds_bairro_contato,
                        pdp.ds_cep_contato,
                        pdp.ds_telefone_residencial,
                        pdp.in_existe_procurador,
                        pdp.ds_procurador,
                        pdp.in_pertence_cooperativa,
                        pdp.ds_cooperativa,
                        pdp.in_nivel_escolaridade,
                        pdp.ds_nivel_escolaridade_superior,
                        pdp.in_outros_produtores_utilizam_propriedade,
                        pdp.nr_outros_produtores_utilizam_propriedade,
                        pdp.in_meio_divulgacao_opcao1,
                        pdp.in_meio_divulgacao_opcao2,
                        pdp.in_meio_divulgacao_opcao3,
                        pdp.in_meio_divulgacao_opcao4,
                        pdp.in_meio_divulgacao_opcao5,
                        pdp.ds_meio_divulgacao_radio,
                        pdp.ds_meio_divulgacao_tv,
                        pdp.ds_meio_divulgacao_jornal_impressso,
                        pdp.in_horario_que_assiste_radio_opcao1,
                        pdp.in_horario_que_assiste_radio_opcao2,
                        pdp.in_horario_que_assiste_radio_opcao3,
                        pdp.in_horario_que_assiste_radio_opcao4,
                        pdp.in_horario_que_assiste_radio_opcao5,
                        pdp.in_horario_que_assiste_radio_opcao6,
                        pdp.in_horario_que_assiste_tv_opcao1,
                        pdp.in_horario_que_assiste_tv_opcao2,
                        pdp.in_horario_que_assiste_tv_opcao3,
                        pdp.in_horario_que_assiste_tv_opcao4,
                        pdp.in_horario_que_assiste_tv_opcao5,
                        pdp.in_horario_que_assiste_tv_opcao6,
                        pdp.in_melhor_periodo_reuniao_opcao1,
                        pdp.in_melhor_periodo_reuniao_opcao2,
                        pdp.in_melhor_periodo_reuniao_opcao3,
                        pdp.in_conhece_orgao_fomento,
                        pdp.in_conhece_finalidade_orgao_fomento,

                        -- inicio planejamento produtor dados produção
                        pdp.cd_programacao_execucao_quadro_pessoal AS cd_programacao_execucao_quadro_pessoal_produtor_dp, 
                        dotpdp.id_dotacao_orcamentaria AS id_dotacao_orcamentaria_produtor_dp,
                        dotpdp.dt_ano_exercicio AS dt_ano_exercicio_produtor_dp,
                        dotpdp.id_atividade AS id_atividade_produtor_dp,
                        dotpdp.ds_atividade AS ds_atividade_produtor_dp,
                        dotpdp.nr_valor_destinado AS nr_valor_destinado_produtor_dp,
                        dotpdp.id_departamento_responsavel AS id_departamento_responsavel_produtor_dp,
                        dotpdp.ds_departamento_responsavel AS ds_departamento_responsavel_produtor_dp,
                        dotpdp.id_gerente_finalistico_responsavel AS id_gerente_finalistico_responsavel_produtor_dp,
                        dotpdp.ds_gerente_finalistico_responsavel AS ds_gerente_finalistico_responsavel_produtor_dp,
                        dotpdp.in_fecha_planejamento AS in_fecha_planejamento_produtor_dp,
                        dotpdp.id_usuario_dg_diretorias AS id_usuario_dg_diretorias_produtor_dp,
                        dotpdp.id_usuario_dg_diretorias_gerencias AS id_usuario_dg_diretorias_gerencias_produtor_dp,
                        dotpdp.id_usuario_dg_diretorias_gerencias_ger_depto AS id_usuario_dg_diretorias_gerencias_ger_depto_produtor_dp,
                        dotpdp.cd_estado_dotacao_orcamentaria AS cd_estado_dotacao_orcamentaria_produtor_dp,
                        pepdp.dt_inicio_programacao_execucao AS dt_inicio_programacao_execucao_produtor_dp,
                        pepdp.dt_final_programacao_execucao AS dt_final_programacao_execucao_produtor_dp,
                        -- final planejamento produtor dados produção

                        -- final produtor dados produção

                        -- inicio produtor familia
                        pf.id_produtor_familia,

                        -- inicio joins comuns produtor familia
                        ucpf.ds_usuario AS ds_usuario_cadastro_produtor_familia,
                        uapf.ds_usuario AS ds_usuario_alteracao_produtor_familia,
                        pf.cd_estado AS cd_estado_produtor_familia,
                        epf.ds_estado AS ds_estado_produtor_familia,
                        epf.ds_uf AS ds_uf_produtor_familia,
                        pf.cd_empresa AS cd_empresa_produtor_familia,
                        pf.cd_empresa_atualizacao AS cd_empresa_atualizacao_produtor_familia,
                        eppf.ds_empresa AS ds_empresa_produtor_familia,
                        eppf.ds_sigla AS ds_sigla_produtor_familia,
                        epapf.ds_empresa AS ds_empresa_atualizacao_produtor_familia,
                        epapf.ds_sigla AS ds_sigla_atualizacao_produtor_familia,
                        pf.dt_sincronismo AS dt_sincronismo_produtor_familia,
                        pf.cd_dispositivos_moveis_licenciados AS cd_dispositivos_moveis_licenciados_produtor_familia,
                        dmlpf.ds_uuid AS ds_uuid_produtor_familia,
                        dmlpf.ds_modelo AS ds_modelo_produtor_familia,
                        dmlpf.ds_marca AS ds_marca_produtor_familia,
                        pf.cd_departamento AS cd_departamento_produtor_familia,
                        dpf.ds_departamento AS ds_departamento_produtor_familia,
                        pf.cd_cargo AS cd_cargo_produtor_familia,
                        cpf.ds_cargo AS ds_cargo_produtor_familia,
                        pf.cd_funcao AS cd_funcao_produtor_familia,
                        fpf.ds_funcao AS ds_funcao_produtor_familia,
                        -- final joins comuns produtor familia

                        pf.ds_parente_nome,
                        pf.ds_parente_grau_parentesco,
                        pf.ds_parente_sexo,

                        -- inicio planejamento produtor familia
                        pf.cd_programacao_execucao_quadro_pessoal AS cd_programacao_execucao_quadro_pessoal_produtor_familia, 
                        dotpf.id_dotacao_orcamentaria AS id_dotacao_orcamentaria_produtor_familia,
                        dotpf.dt_ano_exercicio AS dt_ano_exercicio_produtor_familia,
                        dotpf.id_atividade AS id_atividade_produtor_familia,
                        dotpf.ds_atividade AS ds_atividade_produtor_familia,
                        dotpf.nr_valor_destinado AS nr_valor_destinado_produtor_familia,
                        dotpf.id_departamento_responsavel AS id_departamento_responsavel_produtor_familia,
                        dotpf.ds_departamento_responsavel AS ds_departamento_responsavel_produtor_familia,
                        dotpf.id_gerente_finalistico_responsavel AS id_gerente_finalistico_responsavel_produtor_familia,
                        dotpf.ds_gerente_finalistico_responsavel AS ds_gerente_finalistico_responsavel_produtor_familia,
                        dotpf.in_fecha_planejamento AS in_fecha_planejamento_produtor_familia,
                        dotpf.id_usuario_dg_diretorias AS id_usuario_dg_diretorias_produtor_familia,
                        dotpf.id_usuario_dg_diretorias_gerencias AS id_usuario_dg_diretorias_gerencias_produtor_familia,
                        dotpf.id_usuario_dg_diretorias_gerencias_ger_depto AS id_usuario_dg_diretorias_gerencias_ger_depto_produtor_familia,
                        dotpf.cd_estado_dotacao_orcamentaria AS cd_estado_dotacao_orcamentaria_produtor_familia,
                        pepf.dt_inicio_programacao_execucao AS dt_inicio_programacao_execucao_produtor_familia,
                        pepf.dt_final_programacao_execucao AS dt_final_programacao_execucao_produtor_familia,
                        -- final planejamento produtor familia

                        -- final produtor familia

                        -- inicio area de atuacao
                        COALESCE(pr.cd_municipio, pu.cd_municipio) AS cd_municipio,
                        COALESCE(m2.ds_municipio, m3.ds_municipio) AS ds_municipio,
                        COALESCE(ri2.ds_regiao_integracao, ri3.ds_regiao_integracao) AS ds_regiao_integracao,
                        COALESCE(r2.ds_regional, r3.ds_regional) AS ds_regional,
                        COALESCE(u2.ds_unidade_administrativa, u3.ds_unidade_administrativa) AS ds_unidade_administrativa,
                        -- final area de atuacao
