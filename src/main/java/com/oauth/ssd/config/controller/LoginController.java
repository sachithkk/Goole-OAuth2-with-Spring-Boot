package com.oauth.ssd.config.controller;

import java.security.Principal;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.google.api.services.drive.Drive;
import com.google.api.services.drive.model.File;
import com.google.api.services.drive.model.FileList;
import com.oauth.ssd.service.GoogleDriveService;


@Controller
public class LoginController {
	
	@Autowired
	GoogleDriveService googleDriveService;
		
	@RequestMapping(value = "/loginConsole", method = RequestMethod.GET)
    public String login() {
        return "index";
    }
	
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String homePage(Principal principal , Model homeModel) throws Exception {
		
		Drive drive = googleDriveService.getGoogleDriveConnection(principal);
		FileList filesList = drive.files().list().setPageSize(20).setFields("nextPageToken, files(id, name)").execute();
		List<File> files = filesList.getFiles();
		homeModel.addAttribute("fileNames",this.toStringList(files));
        
		return "homePage";
	}
	
	private List<String> toStringList(List<File> files){
		List<String> fileNames = new ArrayList<>();
		if(files!=null){
			for(File file:files){
				fileNames.add(file.getName());
			}
		}
		return fileNames;
	}
	    
}
