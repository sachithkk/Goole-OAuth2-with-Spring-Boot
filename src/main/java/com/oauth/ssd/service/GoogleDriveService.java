package com.oauth.ssd.service;

import java.security.Principal;

import com.google.api.services.drive.Drive;

public interface GoogleDriveService {
	
	public Drive getGoogleDriveConnection(Principal principal) throws Exception;
}
