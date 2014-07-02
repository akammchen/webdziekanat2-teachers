package utils;


	/**
	 * @author Pawe³
	 *
	 */
	public enum DatabaseName {
		PRODUCTS(1), STUDENTS(2), WSPOLNA(3);
		
		private int code;
		private DatabaseName(int code){
			this.code=code;
		}
		
		public int getCode(){
			return code;
		}
	}

