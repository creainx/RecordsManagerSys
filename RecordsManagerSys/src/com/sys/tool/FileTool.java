package com.sys.tool;

import java.io.File;
import java.io.FileWriter;
import java.io.IOException;

public class FileTool {

	public static boolean createFile(String destFileName) {
		File file = new File(destFileName);
		if (file.exists()) {
			System.out.println("创建单个文件" + destFileName + "失败，目标文件已存在！");
			return false;
		}
		if (destFileName.endsWith(File.separator)) {
			System.out.println("创建单个文件" + destFileName + "失败，目标文件不能为目录！");
			return false;
		}
		// 判断目标文件所在的目录是否存在
		if (!file.getParentFile().exists()) {
			// 如果目标文件所在的目录不存在，则创建父目录
			System.out.println("目标文件所在目录不存在，准备创建它！");
			if (!file.getParentFile().mkdirs()) {
				System.out.println("创建目标文件所在目录失败！");
				return false;
			}
		}
		// 创建目标文件
		try {
			if (file.createNewFile()) {
				System.out.println("创建单个文件" + destFileName + "成功！");
				return true;
			} else {
				System.out.println("创建单个文件" + destFileName + "失败！");
				return false;
			}
		} catch (IOException e) {
			e.printStackTrace();
			System.out.println("创建单个文件" + destFileName + "失败！" + e.getMessage());
			return false;
		}
	}

	public static boolean createDir(String destDirName) {
		File dir = new File(destDirName);
		if (dir.exists()) {
			System.out.println("创建目录" + destDirName + "失败，目标目录已经存在");
			return false;
		}
		if (!destDirName.endsWith(File.separator)) {
			destDirName = destDirName + File.separator;
		}
		// 创建目录
		if (dir.mkdirs()) {
			System.out.println("创建目录" + destDirName + "成功！");
			return true;
		} else {
			System.out.println("创建目录" + destDirName + "失败！");
			return false;
		}
	}

	public static String createTempFile(String prefix, String suffix, String dirName) {
		File tempFile = null;
		if (dirName == null) {
			try {
				// 在默认文件夹下创建临时文件
				tempFile = File.createTempFile(prefix, suffix);
				// 返回临时文件的路径
				return tempFile.getCanonicalPath();
			} catch (IOException e) {
				e.printStackTrace();
				System.out.println("创建临时文件失败！" + e.getMessage());
				return null;
			}
		} else {
			File dir = new File(dirName);
			// 如果临时文件所在目录不存在，首先创建
			if (!dir.exists()) {
				if (!FileTool.createDir(dirName)) {
					System.out.println("创建临时文件失败，不能创建临时文件所在的目录！");
					return null;
				}
			}
			try {
				// 在指定目录下创建临时文件
				tempFile = File.createTempFile(prefix, suffix, dir);
				return tempFile.getCanonicalPath();
			} catch (IOException e) {
				e.printStackTrace();
				System.out.println("创建临时文件失败！" + e.getMessage());
				return null;
			}
		}
	}

	/**
	 * 把内容content写的path文件中
	 * 
	 * @param content
	 * @param path
	 * @return
	 */
	public static boolean saveAs(String content, String path) {

		FileWriter fw = null;

		// System.out.println("把内容：" + content + "， 写入文件：" + path);

		try {
			/**
			 * Constructs a FileWriter object given a File object. If the second argument is
			 * true, then bytes will be written to the end of the file rather than the
			 * beginning. 根据给定的File对象构造一个FileWriter对象。 如果append参数为true,
			 * 则字节将被写入到文件的末尾（向文件中追加内容）
			 *
			 * Parameters: file, a File object to write to 带写入的文件对象 append, if true, then
			 * bytes will be written to the end of the file rather than the beginning
			 * Throws: IOException - if the file exists but is a directory rather than a
			 * regular file, does not exist but cannot be created, or cannot be opened for
			 * any other reason 报异常的3种情况： file对象是一个存在的目录（不是一个常规文件） file对象是一个不存在的常规文件，但不能被创建
			 * file对象是一个存在的常规文件，但不能被打开
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