package com.kh.admin.adminProduct.controller;

import java.io.File;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.kh.admin.adminProduct.model.service.adminProductService;
import com.kh.admin.adminProduct.model.vo.adminProduct;
import com.kh.common.ImgFileRenamePolicy;
import com.kh.product.model.vo.Attachment;
import com.oreilly.servlet.MultipartRequest;

/**
 * Servlet implementation class adminProductUpdateServlet
 */
@WebServlet("/updateProd.ad")
public class adminProductUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public adminProductUpdateServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		if(ServletFileUpload.isMultipartContent(request)) {
			
			//파일이 저장될 서버의 경로
			String savePath = request.getServletContext().getRealPath("/resources/images");
			
			//파일 크기(1024*1024=1MB)
			int fileSize = 1024*1024*15;
			
			MultipartRequest mpr = new MultipartRequest(request, savePath, fileSize, "utf-8", new ImgFileRenamePolicy());
			
			
			// 여기부터는 전송받은 데이터의 DB전송을 위한 작업 과정	
			//1. jsp 상품 정보
			adminProduct ap = new adminProduct();
			
			ap.setProdNo(Integer.parseInt(mpr.getParameter("prodNo")));
			ap.setProdCategory(mpr.getParameter("prodCategory"));
			ap.setProdName(mpr.getParameter("prodName"));
			ap.setProdPrice(Integer.parseInt(mpr.getParameter("prodPrice")));
			ap.setProdAmount(Integer.parseInt(mpr.getParameter("prodAmount")));
			ap.setProdDetail(mpr.getParameter("prodDetail"));
			
			//2. jsp 파일 정보
			Attachment at = null;
			
			if(mpr.getOriginalFileName("titleImgFile") != null) {
				
				String originFileName = mpr.getOriginalFileName("titleImgFile");	// 원래 파일 명
				String renamedFileName = mpr.getFilesystemName("titleImgFile");		// 바뀐 파일 명
				
				at = new Attachment();
				
				at.setFileNo(Integer.parseInt(mpr.getParameter("fileNo")));
				at.setOriginName(originFileName);
				at.setChangeName(renamedFileName);
				at.setFilePath(savePath);
				at.setRef_pno(Integer.parseInt(mpr.getParameter("prodNo")));
			}
			
			
			System.out.println("수정서블릿ap : " + ap);
			System.out.println("수정서블릿at : " + at);
			
			int result = new adminProductService().updateProduct(ap, at);
			
			if(result > 0) {
				response.sendRedirect("prodList.ad");
			}else {
				
				if(at != null) {
					File failedFile = new File(savePath + at.getChangeName());
					failedFile.delete();
				}
				
				request.setAttribute("msg", "제품 수정 실패");
				
				request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);
				
			}
						
			
		}
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
