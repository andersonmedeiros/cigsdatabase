<%-- 
    Document   : teste
    Created on : 26/02/2019, 10:51:24
    Author     : root
--%>

<%@page import="dao.EstadoCivilDAO"%>
<%@page import="dao.BairroDAO"%>
<%@page import="dao.CidadeDAO"%>
<%@page import="dao.EstadoDAO"%>
<%@page import="dao.ReligiaoDAO"%>
<%@page import="dao.EscolaridadeDAO"%>
<%@page import="dao.QasQmsDAO"%>
<%@page import="dao.QasQmsDAO"%>
<%@page import="dao.PostoGraduacaoDAO"%>
<%@page import="dao.DivisaoSecaoDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link type="text/css" rel="stylesheet" href="bootstrap-4.3.1/css/bootstrap.css">
        <link type="text/css" rel="stylesheet" href="css/estilo_cad.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        <script type="text/javascript" src="js/manipulacao_form_familiares.js"></script>
        <script type="text/javascript" src="js/manipulacao_campos.js"></script>
        <script type="text/javascript" src="js/manipulacao_militares.js"></script>
        <script type="text/javascript">
            function id( el ){
                return document.getElementById( el );
            }
            
            window.onload = function()
            {
                id('cidade').onchange = function()
                {
                    id('padrao').style.display = this.value=="0" ? 'block' : 'none';
                    id('bairrosManaus').style.display = this.value=='1' ? 'block' : 'none';//1 - Manaus
                    id('bairrosRioPretoDaEva').style.display = this.value=='2' ? 'block' : 'none';//2 - Rio Preto da Eva
                    id('bairrosIranduba').style.display = this.value=='3' ? 'block' : 'none';//3 - Iranduba
                    id('bairrosManacapuru').style.display = this.value=='4' ? 'block' : 'none';//4 - Manacapuru
                    borda_input_select(this.id);
                }
                id('religiao').onchange = function(){
                    id("out_rel").style.display = this.value == "1000" ? 'block' : 'none';
                    borda_input_select(this.id);
                }                
                id('op_esposa').onchange = function(){
                    if(id('op_esposa').value == "N"){
                        id("op_esp").style.display = 'block';
                    }else{
                        id("op_esp").style.display = 'none';
                    }
                }
            }
        </script>
        <script src="http://code.jquery.com/jquery-1.5.js"></script>
        <title>vai</title>
    </head>
    <body>
        <%
            DivisaoSecaoDAO dsDAO = new DivisaoSecaoDAO();
            PostoGraduacaoDAO pgDAO = new PostoGraduacaoDAO();
            QasQmsDAO armaDAO = new QasQmsDAO();
            EscolaridadeDAO escDAO = new EscolaridadeDAO();
            ReligiaoDAO relDAO = new ReligiaoDAO();
            EstadoDAO estDAO = new EstadoDAO();
            CidadeDAO cDAO = new CidadeDAO();
            BairroDAO bDAO = new BairroDAO();
            EstadoCivilDAO ecDAO = new EstadoCivilDAO();
        %>
        <header class="header">
            <img src="img/cabeçalho.jpeg" class="img-responsive" width="100%"/>
           
            <div class="col-md-12 titulos">
                  
                <h2 id="subTitulo">Inclusão de Militar</h2>
            </div>
        </header>
        
        <div class="container-fluid">
            <div class="row align-items-center justify-content-center">
                <div id="1" class="area-form col-md-10" >
                    <form id="formCadastro" method="post" action="cadastrar">
                        <!--Dados Militares-->
                        <fieldset>
                            <h2>Informações do Militar</h2>
                            <div class="form-row">
                                <div class="form-group col-md-3">
                                    <label id="lblDivSec" name="lblDivSec" for="lblDivSec">Divisão/Seção: </label><b class="obg"> *</b>
                                    <select name="txtDivSec" id="divsec" class="form-control" onblur="borda_input_select(this.id)">
                                        <option value="0" selected>Selecione a Divisão/Seção...</option>
                                        <%
                                            int qtdeDivSec = dsDAO.getDivSec().size();

                                            for(int i=0;i<qtdeDivSec;i++){
                                                out.println("<option value='"+dsDAO.getDivSec().get(i).getId()+"'>"+dsDAO.getDivSec().get(i).getNome()+"</option>");
                                            } 
                                        %>
                                    </select>
                                </div>

                                <div class="form-group col-md-3">
                                    <label id="lblPostGrad" name="lblPostGrad" for="lblPostGrad">Posto/Graduação: </label><b class="obg"> *</b>
                                    <select name="txtPostGrad" id="postgrad" class="form-control" onblur="borda_input_select(this.id)">
                                         <option value="0"selected>Selecione o Posto/Graduação...</option>
                                        <%   
                                            int qtdePGS = pgDAO.getPostGrads().size();

                                            for(int i=0;i<qtdePGS;i++){
                                                out.println("<option value='"+pgDAO.getPostGrads().get(i).getId()+"'>"+pgDAO.getPostGrads().get(i).getSigla()+"</option>");
                                            } 
                                        %>
                                    </select>
                                </div>

                                <div class="form-group col-md-3">
                                    <label id="lblQasQms" name="lblQasQms" for="lblQasQms">QAS/QMS: </label><b class="obg"> *</b>
                                    <select name="txtQasQms" id="qasqms" class="form-control" onblur="borda_input_select(this.id)">
                                        <option value="0" selected>Selecione a QAS/QMS...</option>
                                        <%
                                            int qtdeArmas = armaDAO.getArmas().size();

                                            for(int i=0;i<qtdeArmas;i++){
                                                out.println("<option value='"+armaDAO.getArmas().get(i).getId()+"'>"+armaDAO.getArmas().get(i).getDesc()+"</option>");
                                            } 
                                        %>
                                    </select>
                                </div>

                                <div class="form-group col-md-2">
                                    <label id="lblSit" name="lblSit" for="lblSit">Situação: </label><b class="obg"> *</b>
                                    <br>
                                    <label class="radio-inline sit">
                                        <input type="radio" name="txtSit" id="sit" value="1" checked>Ativo
                                    </label>
                                </div>
                            </div>
                            
                            <div class="form-row">
                                <div class="form-group col-md-3">
                                    <label for="lblSexo">Sexo: </label><b class="obg"> *</b>
                                    <br>
                                    <label class="radio-inline sexo">
                                        <input type="radio" name="txtSexo" id="masculino" value="M"> Masculino
                                    </label>
                                    <label class="radio-inline sexo">
                                        <input type="radio" name="txtSexo" id="feminino" value="F"> Feminino
                                    </label>                         
                                </div>
                            
                                <div class="form-group col-md-3">
                                    <label id="lblNatEst" name="lblNatEstMilitar" for="lblNatEstMilitar">Naturalidade (UF): </label><b class="obg"> *</b>
                                    <select name="txtNatEstMilitar" class="form-control" onblur="borda_input_select(this.id)">
                                        <option value="0" selected>Selecione o seu Estado...</option>
                                        <%
                                            

                                            int qtdeEst = estDAO.getEstados().size();

                                            for(int i=0;i<qtdeEst;i++){
                                                out.println("<option value='"+estDAO.getEstados().get(i).getId()+"'>"+estDAO.getEstados().get(i).getUf()+"</option>");
                                            }
                                        %>                                
                                    </select>

                                </div>
                                <div class="form-group col-md-3">
                                    <label id="lblNatCid" name="lblNatCidMilitar" for="lblNatCidMilitar">Naturalidade Cidade: </label><b class="obg"> *</b>                            
                                    <input class="form-control" type="text" id="txtNatCidMilitar" name="txtNatCidMilitar" onblur="borda_input_text(this.id)"/>
                                </div>
                            
                                <div class="form-group col-md-3">
                                    <label id="lblEstCivil" name="lblEstCivil" for="lblEstCivil">Estado Cívil: </label><b class="obg"> *</b>
                                    <select name="txtEstCivil" id="est_civil" class="form-control" onblur="borda_input_select(this.id)">
                                        <option value="0" selected>Selecione o seu Estado Cívil...</option>
                                        <%
                                            int qtdeEC = ecDAO.getEstadosCivis().size();

                                            for(int i=0;i<qtdeEC;i++){
                                                out.println("<option value='"+ecDAO.getEstadosCivis().get(i).getId()+"'>"+ecDAO.getEstadosCivis().get(i).getNome()+"</option>");
                                            } 
                                        %>
                                    </select>
                                </div> 
                            </div>
                                    
                            <div class="form-row">
                                <div class="form-group col-md-9">
                                    <label id="lblNomeComp" name="lblNomeComp" for="lblNomeComp">Nome Completo: </label><b class="obg"> *</b>
                                    <input class="form-control" type="text" id="txtNomeComp" name="txtNomeComp" onblur="borda_input_text(this.id)"/>
                                </div>

                                <div class="form-group col-md-3">
                                    <label id="lblNomeGuerra" name="lblNomeGuerra" for="lblNomeGuerra">Nome de Guerra: </label><b class="obg"> *</b>
                                    <input class="form-control" type="text" id="txtNomeGuerra" name="txtNomeGuerra" onblur="borda_input_text(this.id)"/>
                                </div>
                            </div>
                            <div class="form-row">
                                <div class="form-group col-md-3">
                                    <label id="lblDataNasc" name="lblDataNasc" for="lblDataNasc">Data de Nascimento: </label><b class="obg"> *</b>
                                    <input class="form-control" type="date" id="txtDataNasc" name="txtDataNasc" onblur="valida_dataNascMil(this.id);"/>
                                </div>                            

                                <div class="form-group col-md-3">
                                    <label id="lblDataPraca" name="lblDataPraca" for="lblDataPraca">Data Praça: </label><b class="obg"> *</b>
                                    <input class="form-control data" type="date" id="txtDataPraca" name="txtDataPraca" onblur="valida_dataPraca(this.id);"/>
                                </div>

                                <div class="form-group col-md-3">
                                    <label id="lblIdentidade" name="lblIdentidade" for="lblIdentidade">Identidade: </label><b class="obg"> *</b>
                                    <input class="form-control identidade" type="text" id="txtIdentidade" name="txtIdentidade" placeholder="Ex.: 00000000-0" onblur="valida_identidade(this.id)" onkeypress="return somenteNumero(event);"/>
                                </div>            

                                <div class="form-group col-md-3">
                                    <label id="lblCpf" name="lblCpf" for="lblCpf">Cpf: </label><b class="obg"> *</b>
                                    <input class="form-control cpf"  type="text" name="txtCpf" id="cpf" placeholder="Ex.: 000.000.000-00" onblur="return valida_cpf(this.id);" onkeypress="return somenteNumero(event);"/> 
                                </div>
                            </div>
                            <div class="form-row">
                                <div class="form-group col-md-4">
                                    <label id="lblTeleitorRegistro" name="lblTeleitorRegistro" for="lblTeleitorRegistro">Titulo Eleitor: </label><b class="obg"> *</b>
                                    <input class="form-control titulo_eleitor"  type="text" id="txtTeleitorRegistro" name="txtTeleitorRegistro" maxlength="12" id="titulo_eleitor" placeholder="Ex.: 0000 0000 0000" onblur="valida_titulo(this.id);" onkeypress="return somenteNumero(event);"/> 
                                </div>
                                <div class="form-group col-md-2">
                                    <label id="lblTeleitorZona" name="lblTeleitorZona" for="lblTeleitorZona">Zona: </label><b class="obg"> *</b>
                                    <input class="form-control"  type="text" id="txtTeleitorZona" name="txtTeleitorZona" maxlength="3" placeholder="Ex.: 000" onblur="valida_zona(this.id)" onkeypress="return somenteNumero(event);"/> 
                                </div>
                                <div class="form-group col-md-2">
                                    <label id="lblTeleitorSecao" name="lblTeleitorSecao" for="lblTeleitorSecao">Seção: </label><b class="obg"> *</b>
                                    <input class="form-control"  type="text" id="txtTeleitorSecao" name="txtTeleitorSecao" maxlength="4" placeholder="Ex.: 0000" onblur="valida_secao(this.id)" onkeypress="return somenteNumero(event);"/> 
                                </div>
                                <div class="form-group col-md-4">
                                    <label id="lblPreccp" name="lblPreccp" for="lblPreccp">Preccp: </label><b class="obg"> *</b>
                                    <input class="form-control" type="text" id="txtPreccp" name="txtPreccp" maxlength="9" onblur="valida_preccp(this.id)" onkeypress="return somenteNumero(event);"/>
                                </div>
                            </div>
                            <div class="form-row">
                                <div class="form-group col-md-4">
                                    <label id="lblCnhNum" name="lblCnhNum" for="lblCnhNum">CNH Número: </label>
                                    <input class="form-control" type="text" id="txtCnhNum" name="txtCnhNum" maxlength="11" onblur="borda_input_text_nn()(this.id)" onkeypress="return somenteNumero(event);"/>
                                </div>

                                <div class="form-group col-md-4">
                                    <label id="lblCnhCat" name="lblCnhCat" for="lblCnhCat">CNH Categoria: </label>
                                    <select name="txtCnhCat" id="cnh_cat" class="form-control" onblur="borda_input_select_nn(this.id);">
                                         <option value="" selected>Selecione a categoria...</option>
                                            <option value="A">A</option>
                                            <option value="B">B</option>
                                            <option value="AB">AB</option>
                                            <option value="C">C</option>
                                            <option value="AC">AC</option>
                                            <option value="D">D</option>
                                            <option value="AD">AD</option>
                                            <option value="E">E</option>
                                            <option value="AE">AE</option>
                                    </select>
                                </div>

                                <div class="form-group col-md-4">
                                    <label id="lblCnhDataVal" name="lblCnhDataVal" for="lblCnhDataVal">Data de Validade da CNH: </label>
                                    <input class="form-control" type="date" id="txtCnhDataVal" name="txtCnhDataVal" onblur="valida_dataValidade(this.id)"/>
                                </div>  
                            </div>
                            <div class="form-row">
                                <div class="form-group col-md-6">
                                    <label id="lblPai" name="lblPai" for="lbPai">Pai: </label>
                                    <input class="form-control" type="text" id="txtPai" name="txtPai" onblur="borda_input_text_nn()(this.id)"/>
                                </div>

                                <div class="form-group col-md-6">
                                    <label id="lblMae" name="lblMae" for="lblMae">Mãe: </label>
                                    <input class="form-control" type="text" id="txtMae" name="txtMae" onblur="borda_input_text_nn()(this.id)"/>
                                </div>
                            </div>
                            <div class="form-row">
                                <div class="form-group col-md-4">
                                    <label id="lblEscolaridade" name="lblEscolaridade" for="lblEscolaridade">Escolaridade: </label><b class="obg"> *</b>
                                    <select name="txtEscolaridade" id="esc" class="form-control" onblur="borda_input_select(this.id);">
                                        <option value="0" selected>Selecione a sua Escolaridade...</option>
                                        <%
                                            int qtdeEsc = escDAO.getEscs().size();

                                            for(int i=0;i<qtdeEsc;i++){
                                                out.println("<option value='"+escDAO.getEscs().get(i).getId()+"'>"+escDAO.getEscs().get(i).getNome()+"</option>");
                                            } 
                                        %>
                                    </select>
                                </div>
                                    <div class="form-group col-md-4">
                                    <label id="lblReligiao" name="lblReligiao" for="lblReligiao">Religião: </label><b class="obg"> *</b>
                                    <select name="txtReligiao" id="religiao" class="form-control">
                                        <option value="0" selected>Selecione a sua Religião...</option>
                                        <%
                                            int qtdeReligiao = relDAO.getReligioes().size();

                                            for(int i=0;i<qtdeReligiao;i++){
                                                out.println("<option value='"+relDAO.getReligioes().get(i).getId()+"'>"+relDAO.getReligioes().get(i).getNome()+"</option>");
                                            } 
                                        %>
                                        <option value="1000">Outro(a)</option>
                                    </select>
                                </div>

                                <div class="form-group col-md-4" id="out_rel" style="display: none;">
                                    <label id="lblOutraReligiao" name="lblOutraReligiao" for="lblOutraReligiao">Religião: </label><b class="obg"> *</b>
                                    <input class="form-control" type="text" id="txtOutraReligiao" name="txtOutraReligiao" onblur="borda_input_text(this.id)"/>
                                </div>
                            </div>
                            <button class="btn btn-outline-success my-2 my-sm-0 btn-prox prox acao" type="button">Avançar</button>
                        </fieldset>
                        <!--Dados Familiares-->
                        <fieldset>
                            <h2>Dados Familiares</h2>
                            <div class="form-row">
                                <center>
                                    <div class="checkbox col-md-12">
                                        <label>
                                            <input type="checkbox" id="checkboxConjuge" name="checkboxConjuge" value="checkConjuge" onclick="checkedConjuge()">
                                            Possui Esposa(o)?
                                        </label>
                                        <label>
                                            <input type="checkbox" id="checkboxDependente" name="checkboxDependente" value="checkDependente" onclick="checkedDependente()">
                                            Possui Dependentes?
                                        </label>
                                    </div>
                                </center>
                            </div>
                            <div class="form-row" id="div_dados_conjuge" style="display: none;">  
                                <legend>Dados do Cônjuge</legend>
                                <div class="form-row">
                                    <div class="form-group col-md-4">
                                        <label id="lblNomeConjuge" name="lblNomeConjuge" for="lblNomeConjuge">Nome Completo: </label><b class="obg"> *</b>
                                        <input class="form-control" type="text" id="txtNomeConjuge" name="txtNomeConjuge" onblur="borda_input_text(this.id)"/>
                                    </div>
                                    <div class="form-group col-md-3">
                                        <label id="lblFoneConjuge" name="lblFoneConjuge" for="lblFoneConjuge">Telefone: </label><b class="obg"> *</b>
                                        <input class="form-control fone" type="text" id="txtFoneConjuge" name="txtFoneConjuge" placeholder="Ex.: (00) 00000-0000" onblur="valida_fone(this.id);" onkeypress="return somenteNumero(event);"/>
                                    </div>

                                    <div class="form-group col-md-3"> 
                                        <label id="lblDataNascConjuge" name="lblDataNascConjuge" for="lblDataNascConjuge">Data de Nascimento: </label><b class="obg"> *</b>
                                        <input class="form-control data" type="date" id="txtDataNascConjuge" name="txtDataNascConjuge" onblur="valida_dataNasc(this.id)"/>
                                    </div>
                                    <div class="form-group col-md-2">
                                        <label for="lblGravidez">Esposa Grávida: </label><b class="obg"> *</b>
                                        <br>
                                        <label class="radio-inline gravida">
                                            <input type="radio" name="txtGravidez" id="sim" value="S"> Sim
                                        </label>
                                        <label class="radio-inline gravida">
                                            <input type="radio" name="txtGravidez" id="nao" value="N"> Não
                                        </label>                         
                                    </div>
                                </div>          
                            </div>
                            <div class="form-row" id="div_dados_dependente" style="display: none;">                 
                                <legend>Dados dos Dependentes</legend>
                                <div id="fd_dados_dependente" class="form-row" style="display: none;"></div>
                            </div>
                            <div class="form-row">
                                <div class="form-group col-md-12" id="div_qtde_dependente" style="display: none;">                                    
                                    <div class="col-md-11"></div>
                                    <button id="btnNovoDep" class="btn btn-outline-success my-2 my-sm-0 btn-novo-dep acao" type="button">Novo Dependente</button>
                                </div>
                            </div>
                            <button class="btn btn-outline-success my-2 my-sm-0 btn-prox prox acao" type="button">Avançar</button>
                            <button class="btn btn-outline-success my-2 my-sm-0 btn-prox voltar acao" type="button">Voltar</button>
                        </fieldset>
                        <!--Dados de Endereço-->
                        <fieldset>
                            <h2>Dados de Endereço</h2>
                            <div class="form-row">
                                <div class="form-group col-md-3">
                                    <label id="lblCep" name="lblCep" for="lblCep">Cep: </label><b class="obg"> *</b>
                                    <input class="form-control cep" type="text" name="txtCep" id="txtCep" placeholder="Ex.: 00000-000" onblur="valida_cep(this.id)" onkeypress="return somenteNumero(event);"/>
                                </div>
                                <div class="form-group col-md-3">
                                    <label id="lblEstado" name="lblEstado" for="lblEstado">Estado: </label><b class="obg"> *</b>
                                    <select name="txtEstado" id="estado" class="form-control" onblur="borda_input_select(this.id)">
                                        <option value="0" selected>Selecione o seu Estado...</option>
                                        <%             
                                            out.println("<option value='"+estDAO.getAM().getId()+"'>"+estDAO.getAM().getNome()+"</option>");
                                        %>
                                    </select>
                                </div>
                                <div class="form-group col-md-3">
                                    <label id="lblCidade" name="lblCidade" for="lblCidade">Cidade: </label><b class="obg"> *</b>
                                    <select name="txtCidade" id="cidade" class="form-control" onblur="borda_input_select(this.id)">
                                        <option value="0" selected>Selecione a sua Cidade...</option>
                                        <%
                                           int qtdeCid = cDAO.getCidades().size();

                                           for(int i=0;i<qtdeCid;i++){
                                               out.println("<option value='"+cDAO.getCidades().get(i).getId()+"'>"+cDAO.getCidades().get(i).getNome()+"</option>");
                                           } 

                                        %>
                                    </select>
                                </div>          
                                <div class="form-group col-md-3">
                                    <label id="lblBairro" name="lblBairro" for="lblBairro">Bairro: </label><b class="obg"> *</b>

                                    <select name="txtpadrao" id="padrao" class="form-control" onblur="borda_input_select(this.id);">
                                        <option value="0" selected>Selecione o seu Bairro...</option>

                                    </select>

                                    <select name="txtBairroManaus" id="bairrosManaus" class="form-control" onblur="borda_input_select(this.id);" style="display: none;">
                                        <option value="0" selected>Selecione o seu Bairro...</option>
                                        <%
                                            int qtdeBairros = bDAO.getBairrosByCidade(1).size();

                                            for(int i=0;i<qtdeBairros;i++){
                                                out.println("<option value='"+bDAO.getBairrosByCidade(1).get(i).getId()+"'>"+bDAO.getBairrosByCidade(1).get(i).getNome()+"</option>");
                                            } 
                                        %>
                                    </select>

                                    <select name="txtBairroRioPretoDaEva" id="bairrosRioPretoDaEva" class="form-control" onblur="borda_input_select(this.id);" style="display: none;">
                                        <option value="0" selected>Selecione o seu Bairro...</option>
                                        <%                                                                                      
                                            qtdeBairros = bDAO.getBairrosByCidade(2).size();

                                            for(int i=0;i<qtdeBairros;i++){
                                                //System.out.println(bDAO.getBairrosByCidade(1).get(i).getId()+" "+bDAO.getBairrosByCidade(1).get(i).getNome());
                                                out.println("<option value='"+bDAO.getBairrosByCidade(2).get(i).getId()+"'>"+bDAO.getBairrosByCidade(2).get(i).getNome()+"</option>");
                                            } 
                                        %>
                                    </select>

                                    <select name="txtBairroIranduba" id="bairrosIranduba" class="form-control" onblur="borda_input_select(this.id);" style="display: none;">
                                        <option value="0" selected>Selecione o seu Bairro...</option>
                                        <%                                                                                       
                                            qtdeBairros = bDAO.getBairrosByCidade(3).size();

                                            for(int i=0;i<qtdeBairros;i++){
                                                //System.out.println(bDAO.getBairrosByCidade(1).get(i).getId()+" "+bDAO.getBairrosByCidade(1).get(i).getNome());
                                                out.println("<option value='"+bDAO.getBairrosByCidade(3).get(i).getId()+"'>"+bDAO.getBairrosByCidade(3).get(i).getNome()+"</option>");
                                            } 
                                        %>
                                    </select>

                                    <select name="txtBairroManacapuru" id="bairrosManacapuru" class="form-control" onblur="borda_input_select(this.id);" style="display: none;">
                                        <option value="0" selected>Selecione o seu Bairro...</option>
                                        <%                                                                                         
                                            qtdeBairros = bDAO.getBairrosByCidade(4).size();

                                            for(int i=0;i<qtdeBairros;i++){
                                                //System.out.println(bDAO.getBairrosByCidade(1).get(i).getId()+" "+bDAO.getBairrosByCidade(1).get(i).getNome());
                                                out.println("<option value='"+bDAO.getBairrosByCidade(4).get(i).getId()+"'>"+bDAO.getBairrosByCidade(4).get(i).getNome()+"</option>");
                                            } 
                                        %>
                                    </select>
                                </div> 
                            </div>
                            <div class="form-row">
                                <div class="form-group col-md-10">
                                    <label id="lblLogradouro" name="lblLogradouro" for="lblLogradouro">Rua/Av./Ala: </label><b class="obg"> *</b>
                                    <input class="form-control" type="text" name="txtLogradouro" id="txtLogradouro" onblur="borda_input_text(this.id)"/>
                                </div>

                                <div class="form-group col-md-2">
                                    <label id="lblNum" name="lblNum" for="lblNum">Número: </label><b class="obg"> *</b>
                                    <input class="form-control" type="text" id="txtNum" name="txtNum" onblur="borda_input_text(this.id)"/>
                                </div>
                            </div>
                            <div class="form-row">
                                <div class="form-group col-md-12">
                                    <label id="lblComplemento" name="lblComplemento" for="lblComplemento">Complemento: </label>
                                    <input class="form-control" type="text" id="txtComplemento" onblur="borda_input_text_nn(this.id)"/>
                                </div>
                            </div>
                            <button class="btn btn-outline-success my-2 my-sm-0 btn-prox prox acao" type="button">Avançar</button>
                            <button class="btn btn-outline-success my-2 my-sm-0 btn-prox voltar acao" type="button">Voltar</button>
                        </fieldset>
                        <fieldset class="parte-form col-md-12">
                            <h2>Dados de Contato</h2>
                            
                            <div class="form-row">
                                <div class="form-group col-md-6">
                                    <label id="lblFone01" name="lblFone01" for="lblFone01">Telefone 01: </label><b class="obg"> *</b>
                                    <input class="form-control fone" type="text" id="txtFone01" name="txtFone01" placeholder="Ex.: (00) 00000-0000" onblur="valida_fone(this.id)" onkeypress="return somenteNumero(event);"/>
                                </div>
                                <div class="form-group col-md-6">
                                    <label id="lblFone02" name="lblFone02" for="lblFone02">Telefone 02: </label>
                                    <input class="form-control fone" type="text" id="txtFone02" name="txtFone02" placeholder="Ex.: (00) 00000-0000" onblur="valida_fone_nn()(this.id)" onkeypress="return somenteNumero(event);"/>
                                </div>
                            </div>
                            <div class="form-row">
                                <div class="form-group col-md-12">
                                    <label id="lblEmail" name="lblEmail" for="lblEmail">Email: </label><b class="obg"> *</b>
                                    <input class="form-control" type="email" id="txtEmail" name="txtEmail" onblur="borda_input_text(this.id)"/>
                                </div>
                            </div>
                            <div class="form-row">
                                <div class="form-group col-md-6">
                                    <label id="lblNomeReferencia" name="lblNomeReferencia" for="lblNomeReferencia">Familiar de Contato: </label><b class="obg"> *</b>
                                    <input class="form-control" type="text" id="txtNomeReferencia" name="txtNomeReferencia" onblur="borda_input_text(this.id)"/>
                                </div>
                                <div class="form-group col-md-6">
                                    <label id="lblFoneReferencia" name="lblFoneReferencia" for="lblFoneReferencia">Contato do Familiar: </label><b class="obg"> *</b>
                                    <input class="form-control fone" type="text" id="txtFoneReferencia" name="txtFoneReferencia" placeholder="Ex.: (00) 00000-0000" onblur="valida_fone(this.id)" onkeypress="return somenteNumero(event);"/>
                                </div>
                            </div>

                            <button class="btn btn-outline-success my-2 my-sm-0 btn-prox prox acao" type="button">Avançar</button>
                            <button class="btn btn-outline-success my-2 my-sm-0 btn-prox voltar acao" type="button">Voltar</button>
                        </fieldset>
                        <fieldset class="parte-form col-md-12">
                            <h2>Dados de Acesso</h2>
                            
                            <div class="form-row">
                                <div class="form-group col-md-6">
                                    <label id="lblSenha" name="lblSenha" for="lblSenha">Senha: </label><b class="obg"> *</b>
                                    <input class="form-control" type="password" id="txtSenha" name="txtSenha" maxlength="20" onblur="valida_senha(this.id)"/>
                                    <b class="obg">*No mínimo 6 caracteres</b>
                                </div>
                                
                            </div>
                            
                            <button class="btn btn-outline-success my-2 my-sm-0 btn-prox prox acao" type="submit">Cadastrar</button>
                            <button class="btn btn-outline-success my-2 my-sm-0 btn-prox voltar acao" type="button">Voltar</button>
                        </fieldset>
                    </form>
                </div>   
            </div>
        </div>
     
        <script src="https://code.jquery.com/jquery-3.2.1.min.js"
            integrity="sha256-hwg4gsxgFZhOsEEamdOYGBf13FyQuiTwlAQgxVSNgt4="
            crossorigin="anonymous"></script>
    
        <script type="text/javascript" src="js/teste.js"></script>
        <script type="text/javascript" src="js/mascaras.js"></script>
    </body>
</html>
