package com.oauth.ssd.service;

import java.security.Principal;

import org.springframework.security.oauth2.provider.OAuth2Authentication;
import org.springframework.security.oauth2.provider.authentication.OAuth2AuthenticationDetails;
import org.springframework.stereotype.Service;

import com.google.api.client.auth.oauth2.BearerToken;
import com.google.api.client.auth.oauth2.Credential;
import com.google.api.client.googleapis.javanet.GoogleNetHttpTransport;
import com.google.api.client.http.HttpTransport;
import com.google.api.client.json.JsonFactory;
import com.google.api.client.json.jackson2.JacksonFactory;
import com.google.api.services.drive.Drive;

@Service
public class GoogleDriveServiceImpl implements GoogleDriveService{
	
	private static final String APPLICATION_NAME = "Secure Software Development File Upload App";
    private static final JsonFactory JSON_FACTORY = JacksonFactory.getDefaultInstance();
    private static HttpTransport HTTP_TRANSPORT;
    
    
	@Override
	public Drive getGoogleDriveConnection(Principal principal) throws Exception {

		Credential credential = new Credential(BearerToken.authorizationHeaderAccessMethod());
		credential.setAccessToken(getAccessToken(principal));
		return new Drive.Builder(HTTP_TRANSPORT, JSON_FACTORY, credential).setApplicationName(APPLICATION_NAME).build();
	}

    static {
    	
    	try {
    		HTTP_TRANSPORT = GoogleNetHttpTransport.newTrustedTransport();
		} catch (Exception e) {
			e.printStackTrace();
			System.exit(1);
		}
    }
	
	private String getAccessToken(Principal principal) throws Exception {
		
		OAuth2Authentication authentication = (OAuth2Authentication)principal;
		OAuth2AuthenticationDetails details = (OAuth2AuthenticationDetails)authentication.getDetails();
		return details.getTokenValue();
	}

}
