package com.naver.erp;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class BuyerServiceImpl implements BuyerService {
	
	@Autowired
	private BuyerDAO buyerDAO;
	
	public BuyerDTO getBuyerDTO(int b_no) {
		
		BuyerDTO buyerDTO = buyerDAO.getBuyerDTO(b_no);
		
		return buyerDTO;
	}
}
