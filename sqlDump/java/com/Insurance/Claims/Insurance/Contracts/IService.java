package com.Insurance.Claims.Insurance.Contracts;

import java.util.ArrayList;

import com.Insurance.Claims.Insurance.Models.Claim;
import com.Insurance.Claims.Insurance.Models.ClaimBills;

public interface IService {

	ArrayList<Claim> getAllClaims();

	ArrayList<Claim> getFilteredClaims(String status);

	Claim getClaimById(int clamId);

	ArrayList<Claim> viewAllClaims();

	Claim viewClaimById(int clamId);

	int editClaimById(int clamId, String clamRemarks, String clamStatus, String clamProcessedAmount);

	void addClaim(int i, double d);

	Claim getClaimByid(int clamIplcId);

	void addClaimBills(String f, String filePath, int cid, double d);

	ArrayList<ClaimBills> viewClaimDocsById(int clamId);

	ClaimBills viewdocBills(int billIndex);

}
