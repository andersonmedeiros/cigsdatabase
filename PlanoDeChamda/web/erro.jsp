<%-- 
    Document   : erro
    Created on : 16/01/2019, 21:35:17
    Author     : de_paula
--%>

<%@page import="bean.Cidade"%>
<%@page import="dao.BairroDAO"%>
<%@page import="bean.Bairro"%>
<%@page import="dao.EscolaridadeDAO"%>
<%@page import="bean.Escolaridade"%>
<%@page import="dao.QasQmsDAO"%>
<%@page import="bean.QasQms"%>
<%@page import="dao.PostoGraduacaoDAO"%>
<%@page import="bean.PostoGraduacao"%>
<%@page import="dao.DivisaoSecaoDAO"%>
<%@page import="bean.DivisaoSecao"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="pt-br">
    <head>
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link href="bootstrap/css/bootstrap.css" rel="stylesheet"/>
        <script type="text/javascript" src="js/validacao_de_campos.js"></script>
        <title>Plano de Chamada - Página de Erro</title>
    </head>
    <body>
        <header class="header">
            <img src="img/background-topo2.png" class="img-responsive"/>
            
            <div class="col-md-12 titulos">
                <h1 id="titulo">Plano de Chamada - CIGS</h1>
                <h2 id="subTitulo">Inclusão de Militar</h2>
            </div>
        </header>
        
        <section class="container area-form">
            
            <form name="formCadastro" method="post" action="cadastrar" onsubmit="return validacao_cad()">                   
                <fieldset class="parte-form col-md-12">
                    <legend>Dados Pessoais</legend>

                    <div class="form-group col-md-3">
                        <label id="lblDivSec" name="lblDivSec" for="lblDivSec">Divisão/Seção: </label><b class="obg"> *</b>
                        <select name="txtDivSec" id="divsec" class="form-control" onchange="borda_DivSec();">
                            <option value="0" selected>Selecione a Divisão/Seção...</option>
                            <%
                                DivisaoSecao ds = new DivisaoSecao();
                                DivisaoSecaoDAO dsDAO = new DivisaoSecaoDAO();

                                int qtdeDivSec = dsDAO.getDivSec().size();

                                for(int i=0;i<qtdeDivSec;i++){
                                    out.println("<option value='"+dsDAO.getDivSec().get(i).getId()+"'>"+dsDAO.getDivSec().get(i).getNome()+"</option>");
                                } 
                            %>
                        </select>
                    </div>
                        
                    <div class="form-group col-md-3">
                        <label id="lblPostGrad" name="lblPostGrad" for="lblPostGrad">Posto/Graduação: </label><b class="obg"> *</b>
                        <select name="txtPostGrad" id="postgrad" class="form-control" onchange="borda_PostGrad();">
                             <option value="0"selected>Selecione o Posto/Graduação...</option>
                            <%
                                PostoGraduacao pg = new PostoGraduacao();
                                PostoGraduacaoDAO pgDAO = new PostoGraduacaoDAO();

                                int qtdePGS = pgDAO.getPostGrads().size();

                                for(int i=0;i<qtdePGS;i++){
                                    out.println("<option value='"+pgDAO.getPostGrads().get(i).getId()+"'>"+pgDAO.getPostGrads().get(i).getNome()+"</option>");
                                } 
                            %>
                        </select>
                    </div>
                    
                        <div class="form-group col-md-3">
                            <label id="lblQasQms" name="lblQasQms" for="lblQasQms">QAS/QMS: </label><b class="obg"> *</b>
                            <select name="txtQasQms" id="qasqms" class="form-control" onchange="borda_QasQms();">
                                <option value="0" selected>Selecione a QAS/QMS...</option>
                                <%
                                    QasQms arma = new QasQms();
                                    QasQmsDAO armaDAO = new QasQmsDAO();
                                    
                                    int qtdeArmas = armaDAO.getArmas().size();
                                    
                                    for(int i=0;i<qtdeArmas;i++){
                                        out.println("<option value='"+armaDAO.getArmas().get(i).getId()+"'>"+armaDAO.getArmas().get(i).getDesc()+"</option>");
                                    } 
                                %>
                            </select>
                        </div>
                            
                        <div class="form-group col-md-3">
                            <label id="lblSit" name="lblSit" for="lblSit">Situação: </label><b class="obg"> *</b>
                            <br>
                            <label class="radio-inline sit">
                                <input type="radio" name="txtSit" id="sit" value="1" checked>Ativo
                            </label>
                        </div>
                            
                        <div class="form-group col-md-9">
                            <label id="lblNomeComp" name="lblNomeComp" for="lblNomeComp">Nome Completo: </label><b class="obg"> *</b>
                            <input class="form-control" type="text" name="txtNomeComp" onchange="borda_NomeComp()"/>
                        </div>
                            
                        <div class="form-group col-md-3">
                            <label id="lblNomeGuerra" name="lblNomeGuerra" for="lblNomeGuerra">Nome de Guerra: </label><b class="obg"> *</b>
                            <input class="form-control" type="text" name="txtNomeGuerra" onchange="borda_NomeGuerra()"/>
                        </div>
                            
                        <div class="form-group col-md-4">
                            <label for="lblSexo">Sexo: </label><b class="obg"> *</b>
                            <br>
                            <label class="radio-inline sexo">
                                <input type="radio" name="txtSexo" id="masculino" value="M"> Masculino
                            </label>
                            <label class="radio-inline sexo">
                                <input type="radio" name="txtSexo" id="feminino" value="F"> Feminino
                            </label>                         
                        </div>
                            
                        <div class="form-group col-md-4">
                            <label id="lblNaturalidade" name="lblNaturalidade" for="lblNaturalidade">Naturalidade: </label><b class="obg"> *</b>
                            <select name="txtNaturalidade" id="naturalidade" class="form-control" onchange="borda_Naturalidade()">
                                <option value="" selected>Selecione a sua Naturalidade...</option>
                                <option value="Acriano(a)">Acriano(a)</option>
                                <option value="Amazonense">Amazonense</option>
                                <option value="Rondoniense">Rondoniense</option>
                                <option value="Roraimense">Roraimense</option>
                                <option value="Amapaense">Amapaense</option>
                                <option value="Paraense">Paraense</option>
                                <option value="Tocantinense">Tocantinense</option>
                                <option value="Mato-Grossense">Mato-Grossense</option>
                                <option value="Sul-Mato-Grossense">Sul-Mato-Grossense</option>
                                <option value="Goiano(a)">Goiano(a)</option>
                                <option value="Maranhense">Maranhense</option>
                                <option value="Cearense">Cearense</option>
                                <option value="Potiguar ou Rio-Grandense-do-Norte">Potiguar ou Rio-Grandense-do-Norte</option>
                                <option value="Piauiense">Piauiense</option>
                                <option value="Paraibano(a)">Paraibano(a)</option>
                                <option value="Pernambucano(a)">Pernambucano(a)</option>
                                <option value="Alagoano(a)">Alagoano(a)</option>
                                <option value="Sergipano(a)">Sergipano(a)</option>
                                <option value="Baiano(a)">Baiano(a)</option>
                                <option value="Mineiro(a)">Mineiro(a)</option>
                                <option value="Capixaba ou Espírito-Santinense">Capixaba ou Espírito-Santinense</option>
                                <option value="Carioca">Carioca</option>
                                <option value="Paulista">Paulista</option>
                                <option value="Paranaense">Paranaense</option>
                                <option value="Catarinense">Catarinense</option>
                                <option value="Gaúcho ou Rio-Grandense-do-Sul">Gaúcho ou Rio-Grandense-do-Sul</option>
                            </select>
                        </div>
                            
                        <div class="form-group col-md-4">
                            <label id="lblEstCivil" name="lblEstCivil" for="lblEstCivil">Estado Cívil: </label><b class="obg"> *</b>
                            <select name="txtEstCivil" id="est_civil" class="form-control" onchange="borda_Est_Civil()">
                                <option value="" selected>Selecione o seu Estado Cívil...</option>
                                <option value="Solteiro(a)">Solteiro(a)</option>
                                <option value="Casado(a)">Casado(a)</option>
                                <option value="Divorciado(a)">Divorciado(a)</option>
                                <option value="Viúvo(a)">Viúvo(a)</option>
                                <option value="Separado(a)">Separado(a)</option>
                            </select>
                        </div>
                        <div class="form-group col-md-4">
                            <label id="lblDataPraca" name="lblDataPraca" for="lblDataPraca">Data Praça: </label><b class="obg"> *</b>
                            <input class="form-control data" type="date" name="txtDataPraca" onblur="validarDataPraca()"/>
                        </div>
                            
                        <div class="form-group col-md-4">
                            <label id="lblIdentidade" name="lblIdentidade" for="lblIdentidade">Identidade: </label><b class="obg"> *</b>
                            <input class="form-control identidade" type="text" name="txtIdentidade" placeholder="Ex.: 00000000-0" onblur="validarIDENTIDADE();" onkeypress="return somenteNumero(event);"/>
                        </div>                                                        
                        <div class="form-group col-md-4">
                            <label id="lblCpf" name="lblCpf" for="lblCpf">Cpf: </label><b class="obg"> *</b>
                            <input class="form-control cpf"  type="text" name="txtCpf" id="cpf" placeholder="Ex.: 000.000.000-00" onblur="return validarCPF();" onkeypress="return somenteNumero(event);"/> 
                        </div>
                        <div class="form-group col-md-4">
                            <label id="lblTituloEleitor" name="lblTituloEleitor" for="lblTituloEleitor">Titulo Eleitor: </label><b class="obg"> *</b>
                            <input class="form-control titulo_eleitor"  type="text" name="txtTituloEleitor" maxlength="12" id="titulo_eleitor" placeholder="Ex.: 0000 0000 0000" onblur="return validarTITULO();" onkeypress="return somenteNumero(event);"/> 
                        </div>
                        <div class="form-group col-md-2">
                            <label id="lblZona" name="lblZona" for="lblZona">Zona: </label><b class="obg"> *</b>
                            <input class="form-control"  type="text" name="txtZona" maxlength="3" placeholder="Ex.: 000" onblur="return validarZONA();" onkeypress="return somenteNumero(event);"/> 
                        </div>
                        <div class="form-group col-md-2">
                            <label id="lblSecao" name="lblSecao" for="lblSecao">Seção: </label><b class="obg"> *</b>
                            <input class="form-control"  type="text" name="txtSecao" maxlength="4" placeholder="Ex.: 0000" onblur="return validarSECAO();" onkeypress="return somenteNumero(event);"/> 
                        </div>
                        <div class="form-group col-md-4">
                            <label id="lblPreccp" name="lblPreccp" for="lblPreccp">Preccp: </label><b class="obg"> *</b>
                            <input class="form-control" type="text" name="txtPreccp" maxlength="9" onblur="validarPRECCP();" onkeypress="return somenteNumero(event);"/>
                        </div>
                        <div class="form-group col-md-4">
                            <label id="lblDataNasc" name="lblDataNasc" for="lblDataNasc">Data de Nascimento: </label>
                            <input class="form-control" type="date" name="txtDataNasc" onblur="validarDataNasc();"/>
                        </div>     
                        <div class="form-group col-md-4">
                            <label id="lblCnhNum" name="lblCnhNum" for="lblCnhNum">CNH Número: </label>
                            <input class="form-control" type="text" name="txtCnhNum" maxlength="11" onkeypress="return somenteNumero(event);"/>
                        </div>
                            
                        <div class="form-group col-md-4">
                            <label id="lblCnhCat" name="lblCnhCat" for="lblCnhCat">CNH Categoria: </label>
                            <select name="txtCnhCat" id="cnh_cat" class="form-control">
                                 <option value="" selected>Selecione a categoria...</option>
                                    <option value="A">A</option>
                                    <option value="B">B</option>
                                    <option value="AB">AB</option>
                                    <option value="C">C</option>
                                    <option value="D">D</option>
                                    <option value="E">E</option>
                            </select>
                        </div>
                        
                        <div class="form-group col-md-6">
                            <label id="lblPai" name="lblPai" for="lbPai">Pai: </label>
                            <input class="form-control" type="text" name="txtPai"/>
                        </div>
                            
                        <div class="form-group col-md-6">
                            <label id="lblMae" name="lblMae" for="lblMae">Mãe: </label>
                            <input class="form-control" type="text" name="txtMae"/>
                        </div>
                        
                        <div class="form-group col-md-12">
                            <label id="lblEscolaridade" name="lblEscolaridade" for="lblEscolaridade">Escolaridade: </label><b class="obg"> *</b>
                            <select name="txtEscolaridade" id="esc" class="form-control" onchange="borda_Escolaridade();">
                                <option value="0" selected>Selecione a sua Escolaridade...</option>
                                <%
                                    Escolaridade esc = new Escolaridade();
                                    EscolaridadeDAO escDAO = new EscolaridadeDAO();
                                    
                                    int qtdeEsc = escDAO.getEscs().size();
                                    
                                    for(int i=0;i<qtdeEsc;i++){
                                        out.println("<option value='"+escDAO.getEscs().get(i).getId()+"'>"+escDAO.getEscs().get(i).getNome()+"</option>");
                                    } 
                                %>
                            </select>
                        </div>
                </fieldset>
                <br>
                    <fieldset class="parte-form col-md-12">
                        <legend>Dados de Endereço</legend>
                        <div class="form-group col-md-3">
                            <label id="lblCep" name="lblCep" for="lblCep">Cep: </label><b class="obg"> *</b>
                            <input class="form-control cep" type="text" name="txtCep" id="cep" placeholder="Ex.: 00000-000" onblur="validarCEP();" onkeypress="return somenteNumero(event);"/>
                        </div>
                        <div class="form-group col-md-3">
                            <label id="lblEstado" name="lblEstado" for="lblEstado">Estado: </label><b class="obg"> *</b>
                            <select name="txtEstado" id="estado" class="form-control" onchange="borda_Estado()">
                                 <option value="" selected>Selecione o seu Estado...</option>
                                 <option value="Amazonas">Amazonas</option>
                            </select>
                        </div>
                        

                        <div class="form-group col-md-10">
                            <label id="lblLogradouro" name="lblLogradouro" for="lblLogradouro">Rua/Av./Ala: </label><b class="obg"> *</b>
                            <input class="form-control" type="text" name="txtLogradouro"id="log" onchange="borda_Logradouro()"/>
                        </div>

                        <div class="form-group col-md-2">
                            <label id="lblNum" name="lblNum" for="lblNum">Número: </label><b class="obg"> *</b>
                            <input class="form-control" type="text" name="txtNum" onchange="borda_Num()"/>
                        </div>

                        <div class="form-group col-md-12">
                            <label id="lblComplemento" name="lblComplemento" for="lblComplemento">Complemento: </label>
                            <input class="form-control" type="text" name="txtComplemento"/>
                        </div>
                    </fieldset>
            </form>
        
            
        </section>
        <footer class="rodape col-md-12">
            <p>Desenvolvido pela Seção de Tecnologia da Informação - 2018</p>
        </footer>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
        <script src="https://code.jquery.com/jquery-3.2.1.min.js"
            integrity="sha256-hwg4gsxgFZhOsEEamdOYGBf13FyQuiTwlAQgxVSNgt4="
            crossorigin="anonymous"></script>
            
        <script src="bootstrap/js/bootstrap.js"></script>
        <script type="text/javascript" src="js/mascaras.js"></script>
        
    </body>
</html>