/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import bean.Conjuge;
import bean.Dependente;
import bean.Endereco;
import bean.Habilitacao;
import bean.Militar;
import bean.TituloEleitor;
import dao.ConjugeDAO;
import dao.DependenteDAO;
import dao.EnderecoDAO;
import dao.HabilitacaoDAO;
import dao.MilitarDAO;
import dao.ReligiaoDAO;
import dao.TituloEleitorDAO;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


/**
 *
 * @author de_paula
 */
public class cadastrar extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet cadastrar</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet cadastrar at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        MilitarDAO milDAO = new MilitarDAO();
                
        if(milDAO.validarIDENTIDADE(request.getParameter("txtIdentidade").replace("-", ""))){
            response.sendRedirect("/PlanoDeChamda/erro.jsp?x=cadastro-duplicado");
        }else if(milDAO.validarCPF(request.getParameter("txtCpf").replace(".", "").replace("-", ""))){
            response.sendRedirect("/PlanoDeChamda/erro.jsp?x=cadastro-duplicado");
        }else{
            //Endereço
            Endereco end = new Endereco();
            end.setCep(request.getParameter("txtCep").replace("-", ""));
            end.setLogradouro(request.getParameter("txtLogradouro").toUpperCase());
            String complemento = "";
            if(request.getParameter("txtComplemento") != null){complemento = request.getParameter("txtComplemento");}
            end.setComplemento(complemento);
            int id_cid = Integer.parseInt(request.getParameter("txtCidade"));
            switch (id_cid) {
                case 1: end.setId_bairro(Integer.parseInt(request.getParameter("txtBairroManaus")));
                    break;
                case 2: end.setId_bairro(Integer.parseInt(request.getParameter("txtBairroRioPretoDaEva")));
                    break;
                case 3: end.setId_bairro(Integer.parseInt(request.getParameter("txtBairroIranduba")));
                    break;
                case 4: end.setId_bairro(Integer.parseInt(request.getParameter("txtBairroManacapuru")));
                    break;
            }
            EnderecoDAO endDAO = new EnderecoDAO();
            if(endDAO.getIdEndereco(end.getCep(), end.getLogradouro(), end.getComplemento(), end.getId_bairro())==0){endDAO.inserir(end);}

            //Titulo Eleitor
            TituloEleitor teleitor = new TituloEleitor();
            teleitor.setRegistro(request.getParameter("txtTeleitorRegistro").replace(" ", ""));
            teleitor.setSecao(request.getParameter("txtTeleitorSecao"));
            teleitor.setZona(request.getParameter("txtTeleitorZona"));
            TituloEleitorDAO teleitorDAO = new TituloEleitorDAO();
            if(!teleitor.getRegistro().equals("")){teleitorDAO.inserir(teleitor);}
            
            //Militar
            Militar mil = new Militar();
            mil.setId(milDAO.proxID());
            mil.setId_div_sec(Integer.parseInt(request.getParameter("txtDivSec").toUpperCase()));
            mil.setId_pg(Integer.parseInt(request.getParameter("txtPostGrad").toUpperCase()));
            mil.setId_qq(Integer.parseInt(request.getParameter("txtQasQms").toUpperCase()));
            mil.setId_sit(Integer.parseInt(request.getParameter("txtSit").toUpperCase()));
            mil.setNome(request.getParameter("txtNomeComp").toUpperCase());
            mil.setNome_guerra(request.getParameter("txtNomeGuerra").toUpperCase());          
            mil.setSexo(request.getParameter("txtSexo").toUpperCase());
            mil.setId_nat_est(Integer.parseInt(request.getParameter("txtNatEstMilitar").toUpperCase()));
            mil.setNat_cid(request.getParameter("txtNatCidMilitar").toUpperCase());
            mil.setId_ec(Integer.parseInt(request.getParameter("txtEstCivil").toUpperCase()));   
            mil.setData_praca(request.getParameter("txtDataPraca").replace("/", "").replace("-", ""));
            mil.setIdentidade(request.getParameter("txtIdentidade").replace("-", ""));          
            mil.setCpf(request.getParameter("txtCpf").replace(".", "").replace("-", ""));
            mil.setId_teleitor(teleitorDAO.getIdTituloEleitor(teleitor.getRegistro(), teleitor.getZona(), teleitor.getSecao()));
            mil.setPreccp(request.getParameter("txtPreccp"));
            mil.setData_nasc(request.getParameter("txtDataNasc").replace("/", "").replace("-", ""));
            mil.setPai(request.getParameter("txtPai").toUpperCase());
            mil.setMae(request.getParameter("txtMae").toUpperCase());
            mil.setId_esc(Integer.parseInt(request.getParameter("txtEscolaridade")));
            //System.out.println(end.getCep()+ " "+end.getLogradouro()+" "+end.getComplemento()+" " +end.getId_bairro()+"idend"+endDAO.getIdEndereco(end.getCep(), end.getLogradouro(), "", end.getId_bairro()));
            mil.setId_end(endDAO.getIdEndereco(end.getCep(), end.getLogradouro(), end.getComplemento(), end.getId_bairro()));
            mil.setId_religiao(Integer.parseInt(request.getParameter("txtReligiao")));
            
            /*//Religião
            ReligiaoDAO religiaoDAO = new ReligiaoDAO();
            int id_religiao_atual = Integer.parseInt(request.getParameter("txtReligiao"));
            
            if(id_religiao_atual == 1000){                
                String nova_religiao = request.getParameter("txtOutraReligiao").toUpperCase();
                if(nova_religiao.equals("CATÓLICO") || nova_religiao.equals("CATÓLICA") || nova_religiao.equals("CATOLICO") || nova_religiao.equals("CATOLICA")){
                    nova_religiao = "CATÓLICO(A)";
                }else if(nova_religiao.equals("EVANGÉLICO") || nova_religiao.equals("EVANGÉLICA") || nova_religiao.equals("EVANGELICO") || nova_religiao.equals("EVANGELICA")){
                    nova_religiao = "EVANGÉLICO(A)";
                }
                
                int id_nova_religiao = religiaoDAO.getReligiaoByNome(nova_religiao).getId();
                
                if(id_nova_religiao == 0){
                    religiaoDAO.inserir(nova_religiao);
                    int id_rel_inserida = religiaoDAO.getReligiaoByNome(nova_religiao).getId();
                    mil.setId_religiao(id_rel_inserida);
                }else{
                    mil.setId_religiao(id_nova_religiao);
                }                
            }else{
                mil.setId_religiao(id_religiao_atual);
            }*/

            mil.setEmail(request.getParameter("txtEmail").toUpperCase());
            mil.setNome_referencia(request.getParameter("txtNomeReferencia").toUpperCase());
            mil.setFone_referencia(request.getParameter("txtFoneReferencia").replace("(", "").replace(")", "").replace(" ", "").replace("-", "").toUpperCase());
            mil.setFone1(request.getParameter("txtFone01").replace("(", "").replace(")", "").replace(" ", "").replace("-", "").toUpperCase());
            mil.setFone2(request.getParameter("txtFone02").replace("(", "").replace(")", "").replace(" ", "").replace("-", "").toUpperCase());
            
            mil.setEnd_num(request.getParameter("txtNum").toUpperCase());
            mil.setSenha(request.getParameter("txtSenha"));
            mil.setId_grp_acesso(3);
            milDAO.inserir(mil);
            
            //Habilitação
            Habilitacao cnh = new Habilitacao();
            cnh.setNum(request.getParameter("txtCnhNum"));
            cnh.setCat(request.getParameter("txtCnhCat"));
            cnh.setData_validade(request.getParameter("txtCnhDataVal").replace("/", "").replace("-", ""));
            cnh.setMil_id(milDAO.getIdMilitar(mil.getIdentidade()));
            HabilitacaoDAO cnhDAO = new HabilitacaoDAO();
            if(!cnh.getNum().equals("")){cnhDAO.inserir(cnh);}
            
            //Conjuge
            ConjugeDAO conjugeDAO = new ConjugeDAO();
            if(request.getParameter("checkboxConjuge") != null){
                Conjuge conjuge = new Conjuge();
                conjuge.setNome(request.getParameter("txtNomeConjuge").toUpperCase());
                conjuge.setFone(request.getParameter("txtFoneConjuge").replace("(", "").replace(")", "").replace(" ", "").replace("-", "").toUpperCase());
                conjuge.setData_nasc(request.getParameter("txtDataNascConjuge").replace("/", "").replace("-", "").toUpperCase());
                conjuge.setGravidez(request.getParameter("txtGravidez").toUpperCase());
                conjuge.setMil_id(milDAO.getIdMilitar(mil.getIdentidade()));
                conjugeDAO.inserir(conjuge);
            }
            
            //Dependentes
            DependenteDAO dependenteDAO = new DependenteDAO();
            if(request.getParameter("checkboxDependente") != null){
                String[] nomeDependentes = request.getParameterValues("txtNomeDependente");
                String[] dataNascDependentes = request.getParameterValues("txtDataNascDependente");
                String[] grauParenDependentes = request.getParameterValues("txtGrauParentescoDependente");
                int qtdeDependentes = nomeDependentes.length;
                for(int i=0;i<qtdeDependentes;i++){
                    Dependente dependente = new Dependente();
                    dependente.setNome(nomeDependentes[i].toUpperCase());
                    dependente.setData_nasc(dataNascDependentes[i].replace("/", "").replace("-", "").toUpperCase());
                    dependente.setGrau_parentesco(grauParenDependentes[i].toUpperCase());
                    dependente.setMil_id(milDAO.getIdMilitar(mil.getIdentidade()));
                    dependenteDAO.inserir(dependente); 
                }
            }
            

            RequestDispatcher despachante = getServletContext().getRequestDispatcher("/index.jsp?x=cadastro-sucesso");
            despachante.forward(request, response);
        }
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
