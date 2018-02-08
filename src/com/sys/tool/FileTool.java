package com.sys.tool;

import java.io.File;
import java.io.FileWriter;
import java.io.IOException;

public class FileTool {

	public static boolean createFile(String destFileName) {
		File file = new File(destFileName);
		if (file.exists()) {
			System.out.println("���������ļ�" + destFileName + "ʧ�ܣ�Ŀ���ļ��Ѵ��ڣ�");
			return false;
		}
		if (destFileName.endsWith(File.separator)) {
			System.out.println("���������ļ�" + destFileName + "ʧ�ܣ�Ŀ���ļ�����ΪĿ¼��");
			return false;
		}
		// �ж�Ŀ���ļ����ڵ�Ŀ¼�Ƿ����
		if (!file.getParentFile().exists()) {
			// ���Ŀ���ļ����ڵ�Ŀ¼�����ڣ��򴴽���Ŀ¼
			System.out.println("Ŀ���ļ�����Ŀ¼�����ڣ�׼����������");
			if (!file.getParentFile().mkdirs()) {
				System.out.println("����Ŀ���ļ�����Ŀ¼ʧ�ܣ�");
				return false;
			}
		}
		// ����Ŀ���ļ�
		try {
			if (file.createNewFile()) {
				System.out.println("���������ļ�" + destFileName + "�ɹ���");
				return true;
			} else {
				System.out.println("���������ļ�" + destFileName + "ʧ�ܣ�");
				return false;
			}
		} catch (IOException e) {
			e.printStackTrace();
			System.out.println("���������ļ�" + destFileName + "ʧ�ܣ�" + e.getMessage());
			return false;
		}
	}

	public static boolean createDir(String destDirName) {
		File dir = new File(destDirName);
		if (dir.exists()) {
			System.out.println("����Ŀ¼" + destDirName + "ʧ�ܣ�Ŀ��Ŀ¼�Ѿ�����");
			return false;
		}
		if (!destDirName.endsWith(File.separator)) {
			destDirName = destDirName + File.separator;
		}
		// ����Ŀ¼
		if (dir.mkdirs()) {
			System.out.println("����Ŀ¼" + destDirName + "�ɹ���");
			return true;
		} else {
			System.out.println("����Ŀ¼" + destDirName + "ʧ�ܣ�");
			return false;
		}
	}

	public static String createTempFile(String prefix, String suffix, String dirName) {
		File tempFile = null;
		if (dirName == null) {
			try {
				// ��Ĭ���ļ����´�����ʱ�ļ�
				tempFile = File.createTempFile(prefix, suffix);
				// ������ʱ�ļ���·��
				return tempFile.getCanonicalPath();
			} catch (IOException e) {
				e.printStackTrace();
				System.out.println("������ʱ�ļ�ʧ�ܣ�" + e.getMessage());
				return null;
			}
		} else {
			File dir = new File(dirName);
			// �����ʱ�ļ�����Ŀ¼�����ڣ����ȴ���
			if (!dir.exists()) {
				if (!FileTool.createDir(dirName)) {
					System.out.println("������ʱ�ļ�ʧ�ܣ����ܴ�����ʱ�ļ����ڵ�Ŀ¼��");
					return null;
				}
			}
			try {
				// ��ָ��Ŀ¼�´�����ʱ�ļ�
				tempFile = File.createTempFile(prefix, suffix, dir);
				return tempFile.getCanonicalPath();
			} catch (IOException e) {
				e.printStackTrace();
				System.out.println("������ʱ�ļ�ʧ�ܣ�" + e.getMessage());
				return null;
			}
		}
	}

	/**
	 * ������contentд��path�ļ���
	 * 
	 * @param content
	 * @param path
	 * @return
	 */
	public static boolean saveAs(String content, String path) {

		FileWriter fw = null;

		// System.out.println("�����ݣ�" + content + "�� д���ļ���" + path);

		try {
			/**
			 * Constructs a FileWriter object given a File object. If the second argument is
			 * true, then bytes will be written to the end of the file rather than the
			 * beginning. ���ݸ�����File������һ��FileWriter���� ���append����Ϊtrue,
			 * ���ֽڽ���д�뵽�ļ���ĩβ�����ļ���׷�����ݣ�
			 *
			 * Parameters: file, a File object to write to ��д����ļ����� append, if true, then
			 * bytes will be written to the end of the file rather than the beginning
			 * Throws: IOException - if the file exists but is a directory rather than a
			 * regular file, does not exist but cannot be created, or cannot be opened for
			 * any other reason ���쳣��3������� file������һ�����ڵ�Ŀ¼������һ�������ļ��� file������һ�������ڵĳ����ļ��������ܱ�����
			 * file������һ�����ڵĳ����ļ��������ܱ���
			 *
			 */
			fw = new FileWriter(new File(path), false);
			if (content != null) {
				fw.write(content);
			}
		} catch (IOException e) {
			e.printStackTrace();
			return false;
		} finally {
			if (fw != null) {
				try {
					fw.flush();
					fw.close();
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
		}
		return true;
	}

	public static String getFileName(String path) {
		String root = null;
		File f = new File(path);
		if (!f.exists()) {
			System.out.println(path + " not exists");
		} else {
			File fa[] = f.listFiles();
			for (int i = 0; i < fa.length; i++) {
				File fs = fa[i];
				if (fs.isDirectory()) {
					root = fs.getName();
					break;
				} else {
					System.out.println(fs.getName());
				}
			}
		}
		return root;
	}

}