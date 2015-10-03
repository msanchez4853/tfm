/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package es.uned.msanchez.tfm.utilidades;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.zip.ZipEntry;
import java.util.zip.ZipOutputStream;

/**
 *
 * @author Rafael
 */
public class ZipDirectory {

    /*public static void main(String[] args) throws IOException {
        File directoryToZip = new File("D:\\temp\\mobile\\create_app\\183B9EAB958FA426002660A8A2144B57\\default\\phonegap");
        File destinyDirectory = new File("D:\\temp\\mobile\\create_app\\183B9EAB958FA426002660A8A2144B57\\default\\zip");
        String zipName = "lab";
        createZip(directoryToZip, destinyDirectory, zipName, Zip.Extension.ZIP);
    }*/

    public static void createZip(File directoryToZip, File destinyDirectory, String zipName, Zip.Extension extension)
            throws IOException, IllegalArgumentException {
        List<File> fileList = new ArrayList<File>();
        //System.out.println("---Getting references to all files in: " + directoryToZip.getCanonicalPath());
        getAllFiles(directoryToZip, fileList);
        //System.out.println("---Creating zip file");
        writeZipFile(destinyDirectory, directoryToZip, zipName, extension, fileList);
        //System.out.println("---Done");
    }

    public static void getAllFiles(File dir, List<File> fileList) throws IOException {
        File[] files = dir.listFiles();
        for (File file : files) {
            fileList.add(file);
            if (file.isDirectory()) {
                //System.out.println("directory:" + file.getCanonicalPath());
                getAllFiles(file, fileList);
            } else {
                //System.out.println("     file:" + file.getCanonicalPath());
            }
        }
    }

    public static void writeZipFile(File destinyFolder, File directoryToZip, String zipName, Zip.Extension extension, List<File> fileList) throws IOException {

        if (!destinyFolder.exists()) {
            destinyFolder.mkdir();
        }
        String filePath = destinyFolder.getAbsolutePath() + File.separator + zipName + extension.getValue();
        File zipFile = new File(filePath);
        if (!zipFile.exists()) {
            zipFile.createNewFile();
        }
        FileOutputStream fos = new FileOutputStream(zipFile);
        ZipOutputStream zos = new ZipOutputStream(fos);

        for (File file : fileList) {
            if (!file.isDirectory()) { // we only zip files, not directories
                addToZip(directoryToZip, file, zos);
            }
        }

        zos.close();
        fos.close();
    }

    public static void addToZip(File directoryToZip, File file, ZipOutputStream zos) throws FileNotFoundException,
            IOException {

        FileInputStream fis = new FileInputStream(file);

        // we want the zipEntry's path to be a relative path that is relative
        // to the directory being zipped, so chop off the rest of the path
        String zipFilePath = file.getCanonicalPath().substring(directoryToZip.getCanonicalPath().length() + 1,
                file.getCanonicalPath().length());
        // System.out.println("Writing '" + zipFilePath + "' to zip file");
        ZipEntry zipEntry = new ZipEntry(zipFilePath);
        zos.putNextEntry(zipEntry);

        byte[] bytes = new byte[1024];
        int length;
        while ((length = fis.read(bytes)) >= 0) {
            zos.write(bytes, 0, length);
        }

        zos.closeEntry();
        fis.close();
    }
}
