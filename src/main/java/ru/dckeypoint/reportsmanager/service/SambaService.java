package ru.dckeypoint.reportsmanager.service;

import java.io.InputStream;

import jcifs.smb.SmbFile;


public class SambaService {
    public static int getFileFromSamba(){
        try {
        //String path = "smb://Data";

        // Ресолвим путь назначения в SmbFile
        //SmbFile baseDir = new SmbFile(path, auth);

        // Вычитываем все содержимое шары в массив
        //SmbFile[] files = baseDir.listFiles();
            return 1;
        } catch (Exception e) {
            e.printStackTrace();
            return -1;
        }
        
    }
}
